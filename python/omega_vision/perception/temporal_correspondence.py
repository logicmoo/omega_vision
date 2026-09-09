"""Replayable, advisory temporal measurements over final observation-bundle Gs.

Nothing here accepts G hypotheses, deduces authoritative events, or reads action
metadata implicitly. Coordinates are original-image pixels, not bounding boxes.
"""
from __future__ import annotations

from dataclasses import asdict, dataclass
import json
import math
import os
from pathlib import Path
import re
from typing import Any, Mapping, Sequence
from uuid import uuid4

import numpy as np
from PIL import Image, ImageDraw
from scipy import ndimage
from scipy.optimize import linear_sum_assignment

from omega_vision.perception.group_acceptance import (
    _member_polygon,
    parse_current_frame_evidence,
)
from omega_vision.perception.observation_identity import content_hash
from omega_vision.perception.pixels_to_regions_cv import _pixel_runs
from omega_vision.perception.symbolic_arc import _D4, _norm


VERSION = "temporal-correspondence-v1"
Point = tuple[int, int]


def stable_id(kind: str, payload: Any) -> str:
    return f"{kind}-{content_hash(payload)}"


def canonical_json(value: Any) -> str:
    return json.dumps(value, sort_keys=True, separators=(",", ":"), ensure_ascii=False, allow_nan=False)


@dataclass(frozen=True)
class GroupObservation:
    uid: str
    alias: str
    member_uids: tuple[str, ...]
    member_aliases: tuple[str, ...]
    points: tuple[Point, ...]
    colors: tuple[str, ...]
    symbols: tuple[Any, ...]
    mask_source: str

    @property
    def centroid(self) -> tuple[float, float]:
        if not self.points:
            raise ValueError(f"{self.uid} has no measurable mask")
        return tuple(float(value) for value in np.mean(self.points, axis=0))


@dataclass(frozen=True)
class TemporalFrame:
    uid: str
    bundle_uid: str
    provider_id: str
    sequence_id: str
    order: int
    width: int
    height: int
    groups: tuple[GroupObservation, ...]
    source_hashes: Mapping[str, str]
    region_evidence: Mapping[str, Any]


@dataclass(frozen=True)
class ActionHint:
    """Explicit authoritative, already direction-normalized transition hint.

    actor_uid must name a final G observation in the source frame. ``direction``
    is an image-coordinate vector; no key-name/player/incoming inference occurs.
    """

    action_id: str
    source_frame_uid: str
    target_frame_uid: str
    actor_uid: str
    direction: tuple[float, float]
    displacement: tuple[float, float] | None = None
    provenance: str = ""


@dataclass(frozen=True)
class TemporalConfig:
    minimum_shape_iou: float = 0.55
    minimum_score: float = 0.48
    ambiguity_margin: float = 0.025
    maximum_displacement_fraction: float = 0.35
    motion_tolerance: float = 0.5
    minimum_occlusion_fraction: float = 0.15
    full_occlusion_fraction: float = 0.9
    max_hidden_frames: int = 12

    def __post_init__(self) -> None:
        for value in (
            self.minimum_shape_iou, self.minimum_score, self.ambiguity_margin,
            self.maximum_displacement_fraction, self.minimum_occlusion_fraction, self.full_occlusion_fraction,
        ):
            if not math.isfinite(value) or not 0 <= value <= 1:
                raise ValueError("temporal ratio/score thresholds must be within [0, 1]")
        if not math.isfinite(self.motion_tolerance) or self.motion_tolerance < 0 or self.max_hidden_frames < 0:
            raise ValueError("temporal motion/retention thresholds must be non-negative")


def _mask(details: Mapping[str, Any], width: int, height: int) -> tuple[np.ndarray, str]:
    runs = details.get("pixelRuns")
    if runs is None:
        runs = (details.get("smallFeature") or {}).get("pixelRuns")
    result = np.zeros((height, width), dtype=bool)
    if runs is not None:
        for y, x0, x1 in runs:
            if any(int(value) != value for value in (y, x0, x1)):
                raise ValueError("pixel runs must contain integers")
            y, x0, x1 = int(y), int(x0), int(x1)
            if not (0 <= y < height and 0 <= x0 <= x1 < width):
                raise ValueError("pixel run is outside its declared image")
            result[y, x0:x1 + 1] = True
        return result, "exact_pixel_runs"
    layer = Image.new("1", (width, height), 0)
    draw = ImageDraw.Draw(layer)
    outer = details.get("outer") or []
    if len(outer) >= 3:
        draw.polygon([tuple(point) for point in outer], fill=1)
        for hole in details.get("holes") or []:
            if len(hole) >= 3:
                draw.polygon([tuple(point) for point in hole], fill=0)
    return np.asarray(layer, dtype=bool), "rasterized_contour"


def _coordinate_map(
    geometry: Mapping[str, Any], lineage: Mapping[str, Any] | None,
) -> tuple[int, int, tuple[float, ...]]:
    width, height = int(geometry["width"]), int(geometry["height"])
    if width <= 0 or height <= 0:
        raise ValueError("positive geometry dimensions are required")
    transform = (lineage or {}).get("transform", lineage or {})
    if not transform:
        return width, height, (1., 0., 0., 0., 1., 0.)
    original = transform.get("originalSize")
    inverse = transform.get("variantToSource")
    if original is None or inverse is None or len(inverse) != 6:
        raise ValueError("lineage needs originalSize and variantToSource")
    a, b, c, d, e, f = (float(value) for value in inverse)
    if not all(math.isfinite(v) for v in (a, b, c, d, e, f)) or a <= 0 or e <= 0 or b != 0 or d != 0:
        raise ValueError("unsupported coordinate map: expected positive axis-aligned scale/translation")
    if transform.get("size", [width, height]) != [width, height]:
        raise ValueError("lineage variant size differs from geometry")
    ow, oh = (int(value) for value in original)
    if ow <= 0 or oh <= 0:
        raise ValueError("original image dimensions must be positive")
    return ow, oh, (a, b, c, d, e, f)


def _original_mask(mask: np.ndarray, width: int, height: int, inverse: tuple[float, ...]) -> np.ndarray:
    a, _, c, _, e, f = inverse
    # Pixel-edge lineage maps cell centres; inverse sampling preserves full
    # masks under both upscaling and downscaling, unlike scattering centres.
    xs = np.floor((np.arange(width) + 0.5 - c) / a).astype(int)
    ys = np.floor((np.arange(height) + 0.5 - f) / e).astype(int)
    valid_x = (xs >= 0) & (xs < mask.shape[1])
    valid_y = (ys >= 0) & (ys < mask.shape[0])
    result = mask[np.ix_(ys.clip(0, mask.shape[0] - 1), xs.clip(0, mask.shape[1] - 1))]
    return result & valid_y[:, None] & valid_x[None, :]


def temporal_frame_from_bundle(
    bundle: Mapping[str, Any], *,
    provider_id: str,
    geometry: Mapping[str, Any] | None = None,
    extraction_text: str = "",
    lineage: Mapping[str, Any] | None = None,
) -> TemporalFrame:
    """Adapt real ``build_observation_bundle`` output without changing its IDs.

    ``geometry`` is the extractor's geometry.json. It can be omitted when bundle
    regions include complete geometry. V/W bands are deliberately never read.
    Extraction text is parsed as measurements, never consulted as executable code.
    """
    frame = bundle["frame"]
    if not provider_id or not frame.get("sequenceId") or frame.get("frameOrder") is None:
        raise ValueError("provider, sequence, and explicit ordered frame index are required")
    if int(frame["frameOrder"]) != frame["frameOrder"]:
        raise ValueError("frame order must be an integer")
    if geometry is None:
        geometry = {
            "width": frame["width"], "height": frame["height"],
            "polygons": {record["alias"]: record.get("geometry", {}) for record in bundle["regions"]},
        }
    width, height, inverse = _coordinate_map(geometry, lineage)
    parsed = parse_current_frame_evidence(extraction_text, "", dict(geometry))
    regions = {record["uid"]: record for record in bundle["regions"]}
    aliases = {record["alias"]: record for record in bundle["regions"]}
    evidence_regions = []
    for record in sorted(regions.values(), key=lambda item: item["uid"]):
        details = _member_polygon(record["alias"], dict(geometry))
        # Attachment rules operate in extractor pixels, preserving their
        # existing strong-edge threshold even for a preprocessed variant.
        evidence_regions.append({
            "id": record["alias"], "color": record["color"], "area": record["area"],
            "centroid": record["centroid"], "holes": details.get("holes", []),
        })
    evidence = {
        "regions": evidence_regions,
        "width": int(geometry["width"]), "height": int(geometry["height"]),
        "sharedEdges": [[a, b, float(n)] for a, b, n in re.findall(
            r"shared_edge\(\s*(\w+)\s*,\s*(\w+)\s*,\s*(\d+(?:\.\d+)?)\s*\)", extraction_text)],
        "adjacent": [list(pair) for pair in sorted(parsed["relations"]["adjacent"])],
        "encloses": [list(pair) for pair in sorted(parsed["relations"]["encloses"])],
        "borders": sorted(set(re.findall(r"border\(\s*(\w+)\s*\)", extraction_text))),
        "fillpoints": [[r, float(x), float(y), float(depth)] for r, x, y, depth in re.findall(
            r"fillpoint\(\s*(\w+)\s*,\s*xy\(\s*([-\d.]+)\s*,\s*([-\d.]+)\s*\)\s*,\s*([-\d.]+)\s*\)",
            extraction_text)],
    }
    groups = []
    for group in sorted(bundle["groups"]["final"], key=lambda item: item["uid"]):
        if group.get("kind", "final") != "final" or not re.fullmatch(r"g\d+", group["alias"]):
            raise ValueError("temporal input must contain accepted final gN observations only")
        members = tuple(sorted(group["members"]))
        if not members or set(members) - set(regions):
            raise ValueError("final group has no members or references unknown regions")
        member_aliases = tuple(sorted(regions[uid]["alias"] for uid in members))
        if any(alias not in aliases for alias in member_aliases):
            raise ValueError("unknown member alias")
        union = np.zeros((int(geometry["height"]), int(geometry["width"])), dtype=bool)
        sources = set()
        holes = 0
        for alias in member_aliases:
            details = _member_polygon(alias, dict(geometry))
            region_mask, source = _mask(details, union.shape[1], union.shape[0])
            union |= region_mask
            sources.add(source)
            holes += len(details.get("holes") or [])
        original = _original_mask(union, width, height, inverse)
        ys, xs = np.nonzero(original)
        symbols = (len(members), holes, tuple(
            (name, sum(a in member_aliases and b in member_aliases for a, b in pairs))
            for name, pairs in sorted(parsed["relations"].items())))
        groups.append(GroupObservation(
            uid=group["uid"], alias=group["alias"], member_uids=members,
            member_aliases=member_aliases,
            points=tuple(sorted(zip(xs.tolist(), ys.tolist()))),
            colors=tuple(sorted(regions[uid]["color"] for uid in members)),
            symbols=symbols, mask_source="+".join(sorted(sources)),
        ))
    if len({group.uid for group in groups}) != len(groups):
        raise ValueError("duplicate final group observation identity")
    hashes = dict(bundle["artifactHashes"])
    hashes.update(geometry=content_hash(dict(geometry)), lineage=content_hash(dict(lineage or {})),
                  temporalPartsFacts=content_hash(extraction_text))
    return TemporalFrame(
        uid=frame["uid"], bundle_uid=bundle["bundleUid"], provider_id=provider_id,
        sequence_id=frame["sequenceId"], order=int(frame["frameOrder"]), width=width, height=height,
        groups=tuple(groups), source_hashes=hashes, region_evidence=evidence,
    )


def frame_to_dict(frame: TemporalFrame) -> dict[str, Any]:
    return json.loads(canonical_json(asdict(frame)))


def frame_from_dict(value: Mapping[str, Any]) -> TemporalFrame:
    fields = dict(value)
    fields["groups"] = tuple(GroupObservation(
        **{**group, "points": tuple(tuple(p) for p in group["points"]),
           "member_uids": tuple(group["member_uids"]), "member_aliases": tuple(group["member_aliases"]),
           "colors": tuple(group["colors"]), "symbols": tuple(group["symbols"])}
    ) for group in value["groups"])
    return TemporalFrame(**fields)


def shape_comparison(left: Sequence[Point], right: Sequence[Point]) -> dict[str, Any]:
    """D4 mask IoU, retaining equal transform alternatives for symmetric shapes."""
    target = _norm(right)
    measures = []
    for name, transform in _D4:
        source = _norm([transform(x, y) for x, y in left])
        union = source | target
        measures.append((len(source & target) / len(union) if union else 0.0, name))
    best = max(score for score, _ in measures)
    return {"iou": best, "transforms": [name for score, name in measures if abs(score - best) < 1e-9]}


def _points(group: GroupObservation) -> list[list[int]]:
    return [list(point) for point in group.points]


def _track(frame: TemporalFrame, group: GroupObservation) -> dict[str, Any]:
    return {
        "trackUid": stable_id("group-track", [frame.provider_id, frame.sequence_id, group.uid]),
        "observationUid": group.uid, "alias": group.alias,
        "memberUids": list(group.member_uids), "points": _points(group),
        "colors": list(group.colors), "symbols": json.loads(canonical_json(group.symbols)),
        "velocity": None, "velocityEvidence": None,
        "lastObservedOrder": frame.order, "visibility": "visible",
    }


def _seal(state: dict[str, Any]) -> dict[str, Any]:
    return {**state, "checkpointUid": stable_id("checkpoint", state)}


def implementation_hashes() -> dict[str, str]:
    directory = Path(__file__).resolve().parent
    return {name: content_hash((directory / name).read_bytes()) for name in (
        "temporal_correspondence.py", "observation_identity.py", "group_acceptance.py",
        "pixels_to_regions_cv.py", "symbolic_arc.py",
    )}


def initial_temporal_state(frame: TemporalFrame) -> dict[str, Any]:
    return _seal({
        "schemaVersion": 1, "version": VERSION,
        "implementationHashes": implementation_hashes(),
        "providerId": frame.provider_id, "sequenceId": frame.sequence_id,
        "frameUid": frame.uid, "bundleUid": frame.bundle_uid, "frameOrder": frame.order,
        "frameHash": content_hash(frame_to_dict(frame)),
        "previousCheckpointUid": None, "pairUid": None,
        "assessment": "initial_observation", "reason": "no_predecessor",
        "tracks": [_track(frame, group) for group in frame.groups],
        "occlusionEpisodes": [],
    })


def validate_checkpoint(state: Mapping[str, Any]) -> None:
    payload = {key: value for key, value in state.items() if key != "checkpointUid"}
    if state.get("checkpointUid") != stable_id("checkpoint", payload):
        raise ValueError("checkpoint content hash mismatch")


def _validate_previous(frame: TemporalFrame, state: Mapping[str, Any]) -> None:
    validate_checkpoint(state)
    if state.get("version") != VERSION or state.get("schemaVersion") != 1:
        raise ValueError("temporal checkpoint version changed; replay the suffix")
    if state.get("implementationHashes") != implementation_hashes():
        raise ValueError("temporal implementation changed; replay the suffix")
    if (state["providerId"], state["sequenceId"], state["frameUid"], state["bundleUid"], state["frameOrder"]) != (
        frame.provider_id, frame.sequence_id, frame.uid, frame.bundle_uid, frame.order,
    ) or state["frameHash"] != content_hash(frame_to_dict(frame)):
        raise ValueError("stale or mismatched predecessor checkpoint; replay the changed suffix")


def _project(points: Sequence[Sequence[int]], velocity: Sequence[float]) -> set[Point]:
    dx, dy = velocity
    return {(round(x + dx), round(y + dy)) for x, y in points}


def _assignment(scores: np.ndarray, minimum: float, forbidden: tuple[int, int] | None = None) -> tuple[dict[int, int], float]:
    rows, columns = scores.shape
    matrix = np.full((rows, columns + rows), minimum, dtype=float)
    matrix[:, :columns] = scores
    if forbidden:
        matrix[forbidden] = -1e6
    if not rows:
        return {}, 0.0
    left, right = linear_sum_assignment(-matrix)
    return {int(a): int(b) for a, b in zip(left, right) if b < columns and matrix[a, b] > minimum}, float(matrix[left, right].sum())


def _contact(a: set[Point], b: set[Point]) -> bool:
    return bool(a & b) or any((x + dx, y + dy) in b for x, y in a for dx, dy in ((0, 1), (0, -1), (1, 0), (-1, 0)))


def _contains(a: set[Point], b: set[Point], width: int, height: int) -> bool:
    if not a or not b:
        return False
    layer = np.zeros((height, width), dtype=bool)
    for x, y in a:
        if 0 <= x < width and 0 <= y < height:
            layer[y, x] = True
    interior = ndimage.binary_fill_holes(layer) & ~layer
    return all(0 <= x < width and 0 <= y < height and interior[y, x] for x, y in b)


def measure_frame_relations(
    frame: TemporalFrame, *, temporal_state: Mapping[str, Any] | None = None,
) -> dict[str, Any]:
    """Measured baseline/current relation truth without event phase synthesis.

    Omit temporal_state only at bootstrap; later supply the current comparison's
    checkpoint to retain group-track identities. Missing masks give unknown
    (None), never false. All final-G pairs are included, including false pairs.
    """
    state = temporal_state if temporal_state is not None else initial_temporal_state(frame)
    _validate_previous(frame, state)
    tracks = {
        track["observationUid"]: track["trackUid"]
        for track in state["tracks"] if track["lastObservedOrder"] == frame.order
    }
    groups = sorted(frame.groups, key=lambda group: tracks[group.uid])
    relations = []
    for index, a in enumerate(groups):
        for b in groups[index + 1:]:
            points_a, points_b = set(a.points), set(b.points)
            pairs = [
                ("contact", a, b, _contact(points_a, points_b)),
                ("overlap", a, b, bool(points_a & points_b)),
                ("contain", a, b, _contains(points_a, points_b, frame.width, frame.height)),
                ("contain", b, a, _contains(points_b, points_a, frame.width, frame.height)),
            ]
            for relation, left, right, truth in pairs:
                relations.append({
                    "relation": relation, "subjects": [tracks[left.uid], tracks[right.uid]],
                    "truth": truth if points_a and points_b else None, "prediction": False,
                    "observationUids": [left.uid, right.uid],
                })
    payload = {
        "version": VERSION, "frameUid": frame.uid, "checkpointUid": state["checkpointUid"],
        "authority": "advisory_measurement", "relations": relations,
        "comparisonComplete": all(group.points for group in frame.groups),
    }
    return {**payload, "evidenceUid": stable_id("frame-relations", payload)}


def compare_frames(
    before: TemporalFrame, after: TemporalFrame, *,
    previous_state: Mapping[str, Any] | None = None,
    action_hint: ActionHint | None = None,
    depth_evidence: Sequence[Mapping[str, Any]] = (),
    config: TemporalConfig = TemporalConfig(),
) -> dict[str, Any]:
    """Return advisory pair evidence and its ordered, content-addressed checkpoint.

    Optional depth records: ``occluderUid``, ``occludedUid`` (observation or
    group-track IDs), ``sourceRef``, ``compatible: bool``. Negative evidence
    defeats confirmation. No occlusion candidate is an authoritative event.
    """
    if (before.provider_id, before.sequence_id) != (after.provider_id, after.sequence_id):
        raise ValueError("cannot compare different providers/sequences")
    if after.order != before.order + 1:
        raise ValueError("temporal comparisons require adjacent ordered observations")
    if (before.width, before.height) != (after.width, after.height):
        raise ValueError("original coordinate dimensions differ; explicit common lineage is required")
    state = dict(previous_state) if previous_state is not None else initial_temporal_state(before)
    _validate_previous(before, state)
    for record in depth_evidence:
        if not record.get("sourceRef") or not isinstance(record.get("compatible"), bool):
            raise ValueError("depth evidence needs sourceRef and signed compatible bool")
    if action_hint is not None:
        if (action_hint.source_frame_uid, action_hint.target_frame_uid) != (before.uid, after.uid):
            raise ValueError("action direction does not reference this source/target pair")
        if action_hint.actor_uid not in {group.uid for group in before.groups}:
            raise ValueError("authoritative actor hint must reference a source final G")
        values = (*action_hint.direction, *(action_hint.displacement or ()))
        if not action_hint.action_id or not action_hint.provenance or not all(math.isfinite(v) for v in values) or math.hypot(*action_hint.direction) == 0:
            raise ValueError("action hint needs a finite direction and authoritative provenance")
    tracks = json.loads(canonical_json(state["tracks"]))
    visible = list(after.groups)
    diagonal = math.hypot(after.width, after.height)
    max_distance = diagonal * config.maximum_displacement_fraction
    scores = np.full((len(tracks), len(visible)), -1e6)
    candidates: dict[tuple[int, int], dict[str, Any]] = {}
    for i, track in enumerate(tracks):
        if not track["points"] or after.order - track["lastObservedOrder"] > config.max_hidden_frames:
            continue
        old_center = np.mean(track["points"], axis=0)
        predicted = old_center + np.array(track["velocity"] or (0, 0))
        hint = action_hint if action_hint and action_hint.actor_uid == track["observationUid"] else None
        if hint and hint.displacement:
            predicted = old_center + np.array(hint.displacement)
        for j, group in enumerate(visible):
            if not group.points:
                continue
            center = np.array(group.centroid)
            displacement = center - old_center
            residual = float(np.linalg.norm(center - predicted))
            if residual > max_distance:
                continue
            if track["lastObservedOrder"] != before.order:
                continuation_radius = max(1.0, math.sqrt(len(track["points"])) * 0.5,
                                          math.hypot(*(track["velocity"] or (0, 0))) * 0.5)
                if residual > continuation_radius:
                    continue
            if hint:
                direction = np.array(hint.direction) / math.hypot(*hint.direction)
                along = float(np.dot(displacement, direction))
                across = float(np.linalg.norm(displacement - direction * along))
                if along <= config.motion_tolerance or across > max(config.motion_tolerance, along * 0.5):
                    continue
                if hint.displacement and residual > max(1.0, math.hypot(*hint.displacement) * 0.25):
                    continue
            shape = shape_comparison(track["points"], group.points)
            if shape["iou"] < config.minimum_shape_iou:
                continue
            # Spatial/motion evidence is pixel evidence too. Color/topology are
            # deliberately too weak to override a meaningful mask difference.
            symbolic = (list(group.colors) == track["colors"]) + (
                json.loads(canonical_json(group.symbols)) == track["symbols"])
            pixel_score = 0.72 * shape["iou"] + 0.28 * math.exp(-residual / max(1., diagonal * 0.08))
            pixel_score += 0.5 if hint else 0.0
            score = pixel_score + 0.004 * symbolic
            scores[i, j] = score
            candidates[i, j] = {
                "fromUid": track["observationUid"], "toUid": group.uid,
                "trackUid": track["trackUid"], "maskIou": shape["iou"],
                "transforms": shape["transforms"], "predictionResidual": residual,
                "score": score, "pixelScore": pixel_score, "symbolicTieBreak": symbolic,
                "actionId": hint.action_id if hint else None,
                "maskSource": group.mask_source,
                "sourceArea": len(track["points"]), "targetArea": len(group.points),
                "areaRatio": len(group.points) / len(track["points"]),
            }
    track_index = {track["trackUid"]: index for index, track in enumerate(tracks)}
    for episode in state["occlusionEpisodes"]:
        if episode["endPairUid"]:
            continue
        hidden = track_index.get(episode["occludedTrackUid"])
        occluder = track_index.get(episode["occluderTrackUid"])
        if hidden is None or occluder is None or tracks[hidden]["lastObservedOrder"] == before.order:
            continue
        for target in range(len(visible)):
            if (hidden, target) not in candidates or (occluder, target) not in candidates:
                continue
            independent_occluder = any(
                other != target and scores[occluder, other] > config.minimum_score
                for other in range(len(visible))
            )
            if not independent_occluder:
                scores[hidden, target] = -1e6
                candidates[hidden, target]["excludedReason"] = "occluder_not_separately_observed"
    selected, total = _assignment(scores, config.minimum_score)
    ambiguous = []
    accepted = {}
    margins = {}
    for i, j in selected.items():
        alternative_assignment, alternative = _assignment(scores, config.minimum_score, (i, j))
        margin = total - alternative
        def primary_total(assignment: Mapping[int, int]) -> float:
            return sum(candidates[a, b]["pixelScore"] for a, b in assignment.items()) + (
                len(tracks) - len(assignment)) * config.minimum_score

        symbolic_tie_resolved = (
            abs(primary_total(selected) - primary_total(alternative_assignment)) < 1e-9 and
            sum(candidates[a, b]["symbolicTieBreak"] for a, b in selected.items()) >
            sum(candidates[a, b]["symbolicTieBreak"] for a, b in alternative_assignment.items())
        )
        if margin <= config.ambiguity_margin and not symbolic_tie_resolved:
            ambiguous.append({**candidates[i, j], "globalMargin": margin, "reason": "non_unique_assignment"})
        else:
            accepted[i] = j
            margins[i] = margin
            candidates[i, j]["symbolicallyResolved"] = symbolic_tie_resolved
    pair_payload = {
        "version": VERSION, "before": frame_to_dict(before), "after": frame_to_dict(after),
        "previousCheckpointUid": state["checkpointUid"], "config": asdict(config),
        "implementationHashes": implementation_hashes(),
        "action": asdict(action_hint) if action_hint else None,
        "depthEvidence": sorted((dict(item) for item in depth_evidence), key=canonical_json),
    }
    pair_uid = stable_id("temporal-pair", pair_payload)
    matches, motion, visibility = [], [], []
    next_tracks = []
    current_by_track: dict[str, set[Point]] = {}
    old_by_track = {track["trackUid"]: {tuple(p) for p in track["points"]} for track in tracks}
    observed_old = {
        track["trackUid"]: old_by_track[track["trackUid"]]
        for track in tracks if track["lastObservedOrder"] == before.order
    }
    for i, j in accepted.items():
        track, group = tracks[i], visible[j]
        match = dict(candidates[i, j])
        displacement = np.array(group.centroid) - np.mean(track["points"], axis=0)
        reappeared = track["lastObservedOrder"] != before.order
        match.update(displacement=displacement.tolist(), reappeared=reappeared,
                     confidence=min(1.0, match["maskIou"] * (0.5 + min(0.5, margins[i]))))
        matches.append(match)
        motion.append({
            "trackUid": track["trackUid"], "fromUid": track["observationUid"], "toUid": group.uid,
            "displacement": displacement.tolist(), "transforms": match["transforms"],
            "state": "stationary" if np.linalg.norm(displacement) <= config.motion_tolerance else "moving",
            "observationStatus": "measured", "reappeared": reappeared,
        })
        next_track = _track(after, group)
        next_track.update(trackUid=track["trackUid"],
                          velocity=track["velocity"] if reappeared else displacement.tolist(),
                          velocityEvidence=track["velocityEvidence"] if reappeared else pair_uid)
        next_tracks.append(next_track)
        current_by_track[track["trackUid"]] = set(group.points)
        visibility.append({"trackUid": track["trackUid"], "observationUid": group.uid,
                           "status": "reappeared" if reappeared else "visible", "prediction": False})
    for i, track in enumerate(tracks):
        if i not in accepted:
            prediction = _project(track["points"], track["velocity"] or (0, 0))
            next_track = {**track, "points": [list(p) for p in sorted(prediction)], "visibility": "missing"}
            next_tracks.append(next_track)
    used = set(accepted.values())
    for j, group in enumerate(visible):
        if j not in used:
            new = _track(after, group)
            next_tracks.append(new)
            current_by_track[new["trackUid"]] = set(group.points)
            visibility.append({
                "trackUid": new["trackUid"], "observationUid": group.uid, "status": "unmatched_visible",
                "border": any(x in (0, after.width - 1) or y in (0, after.height - 1) for x, y in group.points),
                "prediction": False,
            })
    # Unmatched alone is never enough: projection, area loss, and actual visible
    # occupancy are all measured, with depth/contour confirmation separate.
    occlusions = []
    all_next = {track["trackUid"]: track for track in next_tracks}
    for i, track in enumerate(tracks):
        supported = track["velocity"] is not None and track["velocityEvidence"] is not None
        prediction = _project(track["points"], track["velocity"] or (0, 0))
        matched = i in accepted
        observed = current_by_track.get(track["trackUid"], set())
        lost = prediction - observed
        if not prediction or (matched and len(observed) >= len(prediction)):
            continue
        outside = {p for p in prediction if not (0 <= p[0] < after.width and 0 <= p[1] < after.height)}
        exit_fraction = len(outside) / len(prediction)
        explanation = "missing"
        if supported and exit_fraction >= config.full_occlusion_fraction and not matched:
            explanation = "exited"
        elif supported and exit_fraction > 0 and matched:
            explanation = "partially_exited"
        for occluder_track, occupancy in sorted(current_by_track.items()):
            if occluder_track == track["trackUid"]:
                continue
            overlap = lost & occupancy
            fraction = len(overlap) / len(prediction)
            if not supported or fraction < config.minimum_occlusion_fraction:
                continue
            occluder = all_next[occluder_track]
            refs = [dict(item) for item in depth_evidence if
                    item.get("occluderUid") in {occluder_track, occluder["observationUid"]} and
                    item.get("occludedUid") in {track["trackUid"], track["observationUid"]}]
            confirmed = any(item["compatible"] for item in refs) and not any(not item["compatible"] for item in refs)
            status = "partial_occlusion" if matched else (
                "full_occlusion" if fraction >= config.full_occlusion_fraction else "possible_occlusion")
            occlusions.append({
                "occluderTrackUid": occluder_track, "occluderUid": occluder["observationUid"],
                "occludedTrackUid": track["trackUid"], "occludedUid": track["observationUid"],
                "status": status, "confirmed": confirmed, "overlapPixels": len(overlap),
                "confidence": fraction * (0.95 if confirmed else 0.6),
                "predictedArea": len(prediction), "overlapFraction": fraction,
                "projectedDisplacement": track["velocity"], "motionEvidence": track["velocityEvidence"],
                "depthEvidence": refs, "projectionHash": content_hash([list(p) for p in sorted(prediction)]),
                "pairUid": pair_uid, "sourceFrameUid": before.uid, "targetFrameUid": after.uid,
            })
            if exit_fraction < config.full_occlusion_fraction:
                explanation = status
        if not matched:
            all_next[track["trackUid"]]["visibility"] = explanation
            visibility.append({
                "trackUid": track["trackUid"], "observationUid": track["observationUid"], "status": explanation,
                "projectionSupported": supported, "projectedExitFraction": exit_fraction, "prediction": True,
            })
        elif explanation in {"partial_occlusion", "partially_exited"}:
            all_next[track["trackUid"]]["visibility"] = explanation
            for record in visibility:
                if record["trackUid"] == track["trackUid"]:
                    record["status"] = explanation
    topology = []
    ids = sorted(set(observed_old) | set(current_by_track))
    for index, a in enumerate(ids):
        for b in ids[index + 1:]:
            old_a, old_b = observed_old.get(a, set()), observed_old.get(b, set())
            new_a, new_b = current_by_track.get(a, set()), current_by_track.get(b, set())
            for relation, test in (
                ("contact", _contact), ("overlap", lambda x, y: bool(x & y)),
                ("contain", lambda x, y: _contains(x, y, after.width, after.height)),
            ):
                orientations = [(a, b, old_a, old_b, new_a, new_b)]
                if relation == "contain":
                    orientations.append((b, a, old_b, old_a, new_b, new_a))
                for left, right, oa, ob, na, nb in orientations:
                    old_value = test(oa, ob) if oa and ob else None
                    new_value = test(na, nb) if na and nb else None
                    if old_value or new_value:
                        topology.append({"relation": relation, "subjects": [left, right],
                                         "before": old_value, "after": new_value, "prediction": False})
    for occlusion in occlusions:
        occluder_before = observed_old.get(occlusion["occluderTrackUid"])
        occluded_before = observed_old.get(occlusion["occludedTrackUid"])
        topology.append({"relation": "contact", "subjects": sorted([
            occlusion["occluderTrackUid"], occlusion["occludedTrackUid"]]),
            "before": _contact(occluder_before, occluded_before) if occluder_before and occluded_before else None,
            "after": True, "prediction": True, "evidence": "projected_mask_occupancy"})
    episodes = json.loads(canonical_json(state["occlusionEpisodes"]))
    active = {(e["occluderTrackUid"], e["occludedTrackUid"]): e for e in episodes if not e["endPairUid"]}
    for occlusion in occlusions:
        key = (occlusion["occluderTrackUid"], occlusion["occludedTrackUid"])
        if key not in active:
            episode = {
                "episodeUid": stable_id("occlusion-account", [*key, pair_uid]),
                "occluderTrackUid": key[0], "occludedTrackUid": key[1],
                "startPairUid": pair_uid, "endPairUid": None, "confirmingPairUid": None,
                "confirmationStatus": "unconfirmed",
                "observations": [], "authority": "advisory",
            }
            episodes.append(episode)
            active[key] = episode
        active[key]["observations"].append(occlusion)
    for match in matches:
        if not match["reappeared"]:
            continue
        for key, episode in active.items():
            if key[1] == match["trackUid"] and not any(
                o["occluderTrackUid"] == key[0] and o["occludedTrackUid"] == key[1] for o in occlusions
            ):
                episode["endPairUid"] = pair_uid
                contradicted = any(
                    not signed["compatible"] for observation in episode["observations"]
                    for signed in observation["depthEvidence"]
                )
                episode["confirmingPairUid"] = None if contradicted else pair_uid
                episode["confirmationStatus"] = "contradicted" if contradicted else "supported_by_reappearance"
    fully_compared = bool(matches) and not ambiguous and len(matches) == len(before.groups) == len(after.groups) and all(
        m["maskIou"] == 1.0 for m in matches)
    unchanged = fully_compared and all(m["state"] == "stationary" for m in motion) and all(
        m["transforms"][0] == "identity" and m["symbolicTieBreak"] == 2 for m in matches)
    if not before.groups and not after.groups and before.source_hashes.get("image") == after.source_hashes.get("image"):
        unchanged = True
    assessment = "no_material_change" if unchanged else ("material_change" if matches or occlusions else "unknown")
    checkpoint = _seal({
        "schemaVersion": 1, "version": VERSION,
        "implementationHashes": implementation_hashes(),
        "providerId": after.provider_id, "sequenceId": after.sequence_id,
        "frameUid": after.uid, "bundleUid": after.bundle_uid, "frameOrder": after.order,
        "frameHash": content_hash(frame_to_dict(after)),
        "previousCheckpointUid": state["checkpointUid"], "pairUid": pair_uid, "assessment": assessment,
        "tracks": sorted(next_tracks, key=lambda track: track["trackUid"]), "occlusionEpisodes": episodes,
    })
    result = {
        "schemaVersion": 1, "version": VERSION, "authority": "advisory",
        "pairUid": pair_uid, "sourceFrameUid": before.uid, "targetFrameUid": after.uid,
        "providerId": after.provider_id, "sequenceId": after.sequence_id,
        "sourceOrder": before.order, "targetOrder": after.order, "assessment": assessment,
        "sourceHashes": dict(before.source_hashes), "targetHashes": dict(after.source_hashes),
        "actionHint": asdict(action_hint) if action_hint else None,
        "matches": matches, "ambiguities": ambiguous,
        "candidates": sorted(candidates.values(), key=lambda item: (item["trackUid"], item["toUid"])),
        "motion": motion, "visibility": visibility, "occlusions": occlusions,
        "topology": topology, "checkpoint": checkpoint,
    }
    return {**result, "evidenceUid": stable_id("temporal-evidence", result)}


def validate_temporal_result(result: Mapping[str, Any]) -> None:
    payload = {key: value for key, value in result.items() if key != "evidenceUid"}
    if result.get("evidenceUid") != stable_id("temporal-evidence", payload):
        raise ValueError("temporal evidence content hash mismatch")
    validate_checkpoint(result["checkpoint"])


def persist_checkpoint(runtime_root: Path, checkpoint: Mapping[str, Any], *, family: str = "temporal-checkpoints") -> Path:
    """Atomically publish an immutable checkpoint in a caller-owned runtime root."""
    validate_checkpoint(checkpoint)
    if runtime_root.name != "runtime" or not re.fullmatch(r"[a-z][a-z-]*", family):
        raise ValueError("checkpoints require a lifecycle runtime root and a simple family name")
    directory = runtime_root / family
    directory.mkdir(parents=True, exist_ok=True)
    target = directory / f"{checkpoint['checkpointUid']}.json"
    payload = (canonical_json(dict(checkpoint)) + "\n").encode("utf-8")
    pending = directory / f".{target.stem}.{uuid4().hex}.pending"
    try:
        with pending.open("xb") as stream:
            stream.write(payload)
            stream.flush()
            os.fsync(stream.fileno())
        try:
            os.link(pending, target)
        except FileExistsError:
            if target.read_bytes() != payload:
                raise ValueError("immutable checkpoint collision")
    finally:
        pending.unlink(missing_ok=True)
    return target


def load_checkpoint(path: Path) -> dict[str, Any]:
    state = json.loads(path.read_text(encoding="utf-8"))
    validate_checkpoint(state)
    return state


def group_pixel_runs(group: GroupObservation, width: int, height: int) -> list[list[int]]:
    """Use the extractor's inclusive-end [y,x0,x1] run contract."""
    mask = np.zeros((height, width), dtype=np.int32)
    for x, y in group.points:
        mask[y, x] = 1
    return _pixel_runs(mask, 1)
