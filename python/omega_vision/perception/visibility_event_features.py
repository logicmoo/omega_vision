"""Experimental readable-pixel coverage and inward border passages.

Coverage is not semantic absence or amodal visibility. A border passage uses an
explicit rigid-clipping interpretation; its unseen source extension stays
inferred. This module never deduces creation or turns missing detections into
negative evidence.
It is not registered in the runtime. Coverage and coordinate-reference inputs
must be grounded by a trusted caller; their content seals are not authentication
or independent evidence of camera alignment, identity or semantic completeness.
"""
from __future__ import annotations

from io import BytesIO
from pathlib import Path
from typing import Any, Mapping, Sequence

import numpy as np
from PIL import Image

from .event_records import probability, text, validate_term
from .measured_event_features import is_exact_mask_source
from .observation_identity import content_hash
from .pixels_to_regions_cv import _pixel_runs
from .temporal_correspondence import (
    GroupObservation, TemporalFrame, frame_to_dict, stable_id, validate_temporal_result,
)

VERSION = "visibility-event-features-v1"
DETECTOR_ID = "authored_border_passage"


def implementation_revision() -> dict[str, str]:
    return {"version": VERSION, "source": content_hash(Path(__file__).read_bytes())}


def _runs_mask(runs: Sequence[Sequence[int]], width: int, height: int) -> np.ndarray:
    mask = np.zeros((height, width), dtype=bool)
    for run in runs:
        if len(run) != 3 or any(type(value) is not int for value in run):
            raise ValueError("coverage runs require integer y/x0/x1 coordinates")
        y, x0, x1 = run
        if not (0 <= y < height and 0 <= x0 <= x1 < width):
            raise ValueError("coverage run is outside its source image")
        mask[y, x0:x1 + 1] = True
    return mask


def build_visibility_coverage(
    frame: TemporalFrame, image_bytes: bytes, *, source_ref: str,
    unknown_pixel_runs: Sequence[Sequence[int]] = (),
) -> dict[str, Any]:
    """Bind actually readable pixels to an image; unknown masks only subtract.

    Explicit unknown runs may conservatively exclude sensor-masked pixels. They
    cannot establish unseen pixels, complete extraction or absence of objects.
    """
    text(source_ref, "coverage source reference")
    if content_hash(image_bytes) != frame.source_hashes.get("image"):
        raise ValueError("visibility coverage image hash does not match its frame")
    with Image.open(BytesIO(image_bytes)) as image:
        if image.size != (frame.width, frame.height):
            raise ValueError("coverage needs original-coordinate pixels, not an unbound resized image")
        readable = np.asarray(image.convert("RGBA"))[:, :, 3] == 255
    readable &= ~_runs_mask(unknown_pixel_runs, frame.width, frame.height)
    payload = {
        "version": VERSION, "frameUid": frame.uid, "frameOrder": frame.order,
        "providerId": frame.provider_id, "sequenceId": frame.sequence_id,
        "frameHash": content_hash(frame_to_dict(frame)), "imageHash": content_hash(image_bytes),
        "width": frame.width, "height": frame.height, "sourceRef": source_ref,
        "coordinateFrameId": (frame.observation_metadata or {}).get("coordinate_frame_id"),
        "readablePixelRuns": _pixel_runs(readable.astype(np.int32), 1),
        "coverageKind": "readable_sensor_pixels", "semanticAbsenceEstablished": False,
    }
    return {**payload, "evidenceUid": stable_id("visibility-coverage", payload)}


def _coverage_mask(frame: TemporalFrame, coverage: Mapping[str, Any]) -> np.ndarray:
    payload = {key: value for key, value in coverage.items() if key != "evidenceUid"}
    if coverage.get("evidenceUid") != stable_id("visibility-coverage", payload):
        raise ValueError("visibility coverage content hash mismatch")
    if (
        coverage.get("version") != VERSION or coverage["frameUid"] != frame.uid
        or coverage["frameOrder"] != frame.order or coverage["providerId"] != frame.provider_id
        or coverage["sequenceId"] != frame.sequence_id
        or coverage["frameHash"] != content_hash(frame_to_dict(frame))
        or coverage["imageHash"] != frame.source_hashes.get("image")
        or (coverage["width"], coverage["height"]) != (frame.width, frame.height)
        or coverage.get("coverageKind") != "readable_sensor_pixels"
        or coverage.get("semanticAbsenceEstablished") is not False
    ):
        raise ValueError("visibility coverage is unbound or has an unsupported absence claim")
    return _runs_mask(coverage["readablePixelRuns"], frame.width, frame.height)


def _edges(points: set[tuple[int, int]], width: int, height: int) -> list[str]:
    return [name for name, touched in (
        ("left", any(x == 0 for x, _ in points)), ("right", any(x == width - 1 for x, _ in points)),
        ("top", any(y == 0 for _, y in points)), ("bottom", any(y == height - 1 for _, y in points)),
    ) if touched]


def _clip_fits(
    source: GroupObservation, target: GroupObservation, width: int, height: int,
) -> list[dict[str, Any]]:
    old, new = set(source.points), set(target.points)
    if (
        not old or not new or len(old) >= len(new) or source.colors != target.colors
        or not is_exact_mask_source(source.mask_source) or not is_exact_mask_source(target.mask_source)
    ):
        return []
    borders = _edges(old, width, height)
    if len(borders) != 1 or _edges(new, width, height):
        return []
    edge = borders[0]
    xmin, xmax = min(x for x, _ in new), max(x for x, _ in new)
    ymin, ymax = min(y for _, y in new), max(y for _, y in new)
    if edge == "left":
        translations = [(dx, ymin - min(y for _, y in old)) for dx in range(xmin + 1, xmax + 1)]
    elif edge == "right":
        translations = [(dx, ymin - min(y for _, y in old)) for dx in range(xmin - width + 1, xmax - width + 1)]
    elif edge == "top":
        translations = [(xmin - min(x for x, _ in old), dy) for dy in range(ymin + 1, ymax + 1)]
    else:
        translations = [(xmin - min(x for x, _ in old), dy) for dy in range(ymin - height + 1, ymax - height + 1)]
    fits = []
    for dx, dy in translations:
        full_source = {(x - dx, y - dy) for x, y in new}
        clipped = {(x, y) for x, y in full_source if 0 <= x < width and 0 <= y < height}
        outside = full_source - clipped
        if clipped == old and outside:
            fits.append({
                "edge": edge, "translation": [dx, dy], "observedSourceMaskHash": content_hash(sorted(old)),
                "observedTargetMaskHash": content_hash(sorted(new)),
                "inferredSourceExtensionHash": content_hash(sorted(outside)),
                "sourceExtensionObserved": False,
            })
    return fits


def measure_visibility_transition(
    before: TemporalFrame | None, after: TemporalFrame,
    temporal: Mapping[str, Any] | None, *,
    before_coverage: Mapping[str, Any] | None, after_coverage: Mapping[str, Any],
    minimum_confidence: float = 0.7,
) -> dict[str, Any]:
    """Return separate measured passages, qualified entered deductions and limits."""
    probability(minimum_confidence, "visibility minimum confidence")
    current_mask = _coverage_mask(after, after_coverage)
    passages, deductions, first_visible, limitations = [], [], [], []
    if before is None:
        if temporal is not None or before_coverage is not None:
            raise ValueError("initial visibility observation must not have a predecessor")
        initial = True
    else:
        if temporal is None or before_coverage is None:
            raise ValueError("visibility transition requires sealed temporal evidence and both coverage receipts")
        initial = False
        old_mask = _coverage_mask(before, before_coverage)
        validate_temporal_result(temporal)
        if (
            temporal["sourceFrameUid"] != before.uid or temporal["targetFrameUid"] != after.uid
            or temporal["sourceOrder"] != before.order or temporal["targetOrder"] != after.order
            or after.order != before.order + 1 or before.provider_id != after.provider_id
            or before.sequence_id != after.sequence_id or temporal["providerId"] != after.provider_id
            or temporal["sequenceId"] != after.sequence_id
            or temporal["sourceHashes"] != dict(before.source_hashes) or temporal["targetHashes"] != dict(after.source_hashes)
            or temporal["checkpoint"]["frameHash"] != content_hash(frame_to_dict(after))
            or (before.width, before.height) != (after.width, after.height)
        ):
            raise ValueError("visibility temporal evidence does not bind this adjacent pair")
        old_groups = {group.uid: group for group in before.groups}
        current_groups = {group.uid: group for group in after.groups}
        matches_by_target = {match["toUid"]: match for match in temporal["matches"]}
        for observation in temporal["visibility"]:
            if observation["status"] == "unmatched_visible":
                first_visible.append({
                    "trackUid": observation["trackUid"], "observationUid": observation["observationUid"],
                    "classification": "first_observed", "physicalCreationObserved": False,
                    "priorAbsenceEstablished": False,
                })
        common_coordinates = (
            before_coverage["coordinateFrameId"] is not None
            and before_coverage["coordinateFrameId"] == after_coverage["coordinateFrameId"]
        )
        if not common_coordinates:
            limitations.append("fixed_coordinate_reference_unavailable")
        for match in temporal["matches"]:
            if match["reappeared"] or match["confidence"] < minimum_confidence:
                continue
            source, target = old_groups[match["fromUid"]], current_groups[match["toUid"]]
            if not _edges(set(source.points), before.width, before.height):
                continue
            if not common_coordinates:
                continue
            if not all(old_mask[y, x] for x, y in source.points) or not all(current_mask[y, x] for x, y in target.points):
                limitations.append(f"unknown_border_pixels:{match['trackUid']}")
                continue
            alternatives = []
            for candidate in after.groups:
                existing = matches_by_target.get(candidate.uid)
                if (
                    existing is not None and existing["fromUid"] != source.uid
                    and existing["confidence"] >= minimum_confidence and not existing["reappeared"]
                ):
                    continue
                for fit in _clip_fits(source, candidate, after.width, after.height):
                    alternatives.append({"targetUid": candidate.uid, **fit})
            if len(alternatives) != 1 or alternatives[0]["targetUid"] != target.uid:
                if alternatives:
                    limitations.append(f"ambiguous_border_passage:{match['trackUid']}")
                continue
            evidence = [
                before.uid, after.uid, before_coverage["evidenceUid"], after_coverage["evidenceUid"],
                temporal["evidenceUid"], before.source_hashes["image"], after.source_hashes["image"],
            ]
            passages.append({
                **alternatives[0], "trackUid": match["trackUid"], "sourceUid": source.uid,
                "interpretation": "unique_rigid_clipping_continuation", "evidence": evidence,
            })
            term = validate_term(
                {"predicate": "entered", "args": [match["trackUid"]]},
                entity_ids=[match["trackUid"]], categories={"event"},
            ).to_dict()
            deductions.append({
                "term": term, "confidence": match["confidence"], "decisionFrameUid": after.uid,
                "decisionFrameOrder": after.order, "evidence": evidence,
                "provenance": {
                    "detectorId": DETECTOR_ID, "detectorVersion": content_hash(implementation_revision()),
                    "basis": "unique_rigid_clipping_continuation", "sourceExtensionObserved": False,
                },
            })
        if first_visible:
            limitations.append("first_visibility_does_not_establish_prior_absence_or_exclude_entry")
    payload = {
        "version": VERSION, "fromFrameUid": before.uid if before is not None else None,
        "toFrameUid": after.uid, "passages": passages, "deductions": deductions,
        "firstVisible": first_visible, "limitations": sorted(set(limitations)),
        "assessment": "initial_observation" if initial else "changed" if deductions else "unknown",
        "reason": "no_predecessor" if initial else None,
    }
    return {**payload, "evidenceUid": stable_id("visibility-transition", payload)}
