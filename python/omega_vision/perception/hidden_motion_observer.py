"""Bounded pixel-space motion hypotheses, never hidden pixels or Object identity.

The model uses recorded acquisition deltas conditionally: a common clock and a
fixed camera are assumptions, not facts inferred from file names or dimensions.
It does not replace the temporal tracker or extend its accepted track lifetime.
"""
from __future__ import annotations

from collections import Counter
from copy import deepcopy
from io import BytesIO
import math
from pathlib import Path
from typing import Any

import numpy as np
from PIL import Image
from scipy import ndimage

from .measured_event_features import mask_geometry
from .observation_identity import content_hash

VERSION = "hidden-motion-observer-v1"
MAX_COMPONENTS = 128
MAX_MODELS = 16
MAX_GAP = 64
TOLERANCE = 0.75
ASSUMPTIONS = [
    "common_recorded_acquisition_clock", "fixed_original_pixel_reference",
    "unchanged_appearance", "candidate_correspondence_not_identity_proof",
]
_STATE_FIELDS = {
    "version", "implementationHash", "source", "atSeconds", "size", "background",
    "lastComponents", "models", "sourceHistory", "stateUid",
}


class HiddenMotionIntegrityError(ValueError):
    """Invalid bound history must fail execution, not publish an unsupported copy."""


def implementation_revision() -> str:
    return content_hash({
        "version": VERSION, "module": Path(__file__).read_bytes().hex(),
        "measurements": Path(mask_geometry.__code__.co_filename).read_bytes().hex(),
    })


def _seal(value: dict[str, Any]) -> dict[str, Any]:
    value = deepcopy(value)
    return {**value, "stateUid": content_hash(value)}


def _runs(points) -> list[list[int]]:
    rows: dict[int, list[int]] = {}
    for x, y in points:
        rows.setdefault(int(y), []).append(int(x))
    result = []
    for y, values in sorted(rows.items()):
        values = sorted(values)
        start = previous = values[0]
        for x in values[1:]:
            if x != previous + 1:
                result.append([y, start, previous + 1])
                start = x
            previous = x
        result.append([y, start, previous + 1])
    return result


def _points(component):
    return [(x, y) for y, left, right in component["pixelRuns"] for x in range(left, right)]


def _components(png: bytes):
    with Image.open(BytesIO(png)) as image:
        rgba = np.asarray(image.convert("RGBA"))
    if rgba.shape[0] * rgba.shape[1] > 262_144 or not np.all(rgba[:, :, 3] == 255):
        raise ValueError("Hidden-motion measurement requires a bounded fully observed opaque viewport")
    rgb = rgba[:, :, :3]
    colors, counts = np.unique(rgb.reshape(-1, 3), axis=0, return_counts=True)
    background = colors[int(np.argmax(counts))]
    if counts.max() <= rgb.shape[0] * rgb.shape[1] // 2 or len(colors) > MAX_COMPONENTS:
        raise ValueError("Uniform-component motion measurement needs a majority background and bounded colors")
    components = []
    for color in colors:
        if np.array_equal(color, background):
            continue
        labels, count = ndimage.label(np.all(rgb == color, axis=2))
        for label in range(1, count + 1):
            ys, xs = np.nonzero(labels == label)
            points = list(zip(xs.tolist(), ys.tolist()))
            geometry = mask_geometry(points)
            left, top, right, bottom = geometry["bounds"]
            normalized = _runs((x - left, y - top) for x, y in points)
            signature = content_hash({"color": color.tolist(), "shape": normalized})
            components.append({
                "appearanceKey": signature, "color": color.tolist(),
                "pixelRuns": _runs(points), "pixelCount": len(points),
                "bounds": geometry["bounds"], "centroid": [float(xs.mean()), float(ys.mean())],
                "maskHash": geometry["maskHash"],
                "borderClipped": left == 0 or top == 0 or right == rgb.shape[1] - 1 or bottom == rgb.shape[0] - 1,
            })
            if len(components) > MAX_COMPONENTS:
                raise ValueError("Uniform-component candidate bound exceeded")
    return rgb, background.tolist(), components


def _validate_prior(prior, source, at_seconds, previous_image_hash):
    if not prior:
        if source["order"] != 0:
            raise HiddenMotionIntegrityError("Hidden-motion history requires the exact earlier native checkpoint")
        return
    if set(prior) != _STATE_FIELDS or prior["stateUid"] != content_hash({
        key: value for key, value in prior.items() if key != "stateUid"
    }):
        raise HiddenMotionIntegrityError("Hidden-motion checkpoint schema or content hash mismatch")
    if prior["version"] != VERSION or prior["implementationHash"] != implementation_revision():
        raise HiddenMotionIntegrityError("Hidden-motion implementation changed; replay rather than reuse history")
    cutoff = prior["source"]["order"]
    if cutoff != source["order"] - 1 or prior["atSeconds"] >= at_seconds:
        raise HiddenMotionIntegrityError("Hidden-motion predecessor ordering/time mismatch")
    if previous_image_hash != prior["source"]["imageHash"]:
        raise HiddenMotionIntegrityError("Hidden-motion predecessor image hash mismatch")
    if len(prior["models"]) > MAX_MODELS:
        raise HiddenMotionIntegrityError("Hidden-motion model bound exceeded")
    history = prior["sourceHistory"]
    if (
        not isinstance(history, list) or len(history) != source["order"]
        or any(item["source"]["order"] != index or item["source"]["frameId"] != str(index)
               for index, item in enumerate(history))
        or history[-1]["source"] != prior["source"] or history[-1]["atSeconds"] != prior["atSeconds"]
        or any(left["atSeconds"] >= right["atSeconds"] for left, right in zip(history, history[1:]))
        or any(len(model["history"]) > 3 or len(model["gap"]) > MAX_GAP for model in prior["models"])
    ):
        raise HiddenMotionIntegrityError("Hidden-motion receipt prefix or bounded history mismatch")

    def check(value):
        if isinstance(value, dict):
            if "order" in value and (type(value["order"]) is not int or not 0 <= value["order"] <= cutoff):
                raise HiddenMotionIntegrityError("Future/cumulative evidence exceeds the native observation cutoff")
            if "atSeconds" in value and (
                type(value["atSeconds"]) not in (int, float)
                or not math.isfinite(value["atSeconds"]) or not 0 <= value["atSeconds"] <= prior["atSeconds"]
            ):
                raise HiddenMotionIntegrityError("Future/invalid acquisition evidence in hidden-motion history")
            for item in value.values():
                check(item)
        elif isinstance(value, list):
            for item in value:
                check(item)
    check(prior)


def validate_portal_history(prior: dict[str, Any]) -> None:
    """Gate reuse of the existing association engine by this native prefix."""
    portal = prior.get("portal")
    if not portal:
        return
    model = prior.get("hiddenMotion")
    if not model or portal["lastObservationTime"] != model["atSeconds"]:
        raise HiddenMotionIntegrityError("Portal association has a stale/cumulative observation cutoff")
    receipts = {(row["source"]["imageHash"], row["atSeconds"]) for row in model["sourceHistory"]}
    if portal["lastHash"] is not None and (portal["lastHash"], portal["lastTime"]) not in receipts:
        raise HiddenMotionIntegrityError("Portal association anchor lacks earlier source evidence")

    def check_evidence(evidence, cutoff):
        for item in evidence:
            before, after = item["before_seconds"], item["after_seconds"]
            if (
                type(before) not in (int, float) or type(after) not in (int, float)
                or not 0 <= before < after <= cutoff
                or (item["before_hash"], before) not in receipts
                or (item["after_hash"], after) not in receipts
            ):
                raise HiddenMotionIntegrityError("Portal association evidence is future or source-unbound")
    check_evidence(portal["evidence"], model["atSeconds"])
    pending = prior.get("pendingPortalPrediction")
    if pending:
        cutoff, decision = pending["predictionObservationSeconds"], pending["decisionSeconds"]
        if not 0 <= cutoff < decision <= model["atSeconds"]:
            raise HiddenMotionIntegrityError("Portal association prediction has a future cutoff")
        check_evidence(pending["evidence"], cutoff)


def observe_hidden_motion(
    png: bytes, *, at_seconds: float, source: dict[str, Any],
    previous_image_hash: str | None, prior: dict[str, Any] | None = None,
) -> dict[str, Any]:
    """Read only this image and the caller's validated earlier native state.

    ``source`` is restricted to receipt identities/hashes, without a test name,
    evaluator, actor role, future reader or recording-wide image collection.
    """
    if set(source) != {"frameId", "order", "imageHash", "stateHash"}:
        raise HiddenMotionIntegrityError("Hidden-motion source requires only exact current receipt fields")
    if type(source["order"]) is not int or source["order"] < 0 or source["frameId"] != str(source["order"]):
        raise HiddenMotionIntegrityError("Hidden-motion source order is invalid")
    if (
        source["imageHash"] != content_hash(png) or not isinstance(source["stateHash"], str)
        or len(source["stateHash"]) != 64 or any(char not in "0123456789abcdef" for char in source["stateHash"])
    ):
        raise HiddenMotionIntegrityError("Hidden-motion observation/source hash mismatch")
    if type(at_seconds) not in (int, float) or not math.isfinite(at_seconds) or at_seconds < 0:
        raise HiddenMotionIntegrityError("Hidden-motion acquisition time must be finite and nonnegative")
    prior = prior or {}
    _validate_prior(prior, source, at_seconds, previous_image_hash)
    rgb, background, components = _components(png)
    size = [rgb.shape[1], rgb.shape[0]]
    if prior and (prior["size"] != size or prior["background"] != background):
        raise ValueError("Changed pixel reference/background is unsupported, not object motion")
    source = deepcopy(source)
    counts = Counter(row["appearanceKey"] for row in components)
    previous = prior.get("lastComponents", [])
    previous_counts = Counter(row["appearanceKey"] for row in previous)
    models = deepcopy(prior.get("models", []))
    by_key = {row["appearanceKey"]: row for row in models}
    observed, predictions, hypotheses, limitations = [], [], [], []
    for current in components:
        key = current["appearanceKey"]
        if key in by_key or counts[key] != 1 or previous_counts[key] != 1 or current["borderClipped"]:
            continue
        old = next(row for row in previous if row["appearanceKey"] == key)
        if old["borderClipped"] or math.dist(old["centroid"], current["centroid"]) <= TOLERANCE:
            continue
        if len(models) == MAX_MODELS:
            limitations.append("moving_candidate_bound_exceeded")
            break
        anchor = {"source": prior["source"], "atSeconds": prior["atSeconds"], "component": old}
        model = {
            "modelUid": "motion-model-" + content_hash([prior["source"], key]),
            "appearanceKey": key, "anchor": anchor, "history": [anchor],
            "velocity": None, "velocityEvidence": [], "gap": [], "identityAmbiguous": False,
            "expired": False,
        }
        models.append(model)
        by_key[key] = model
    moving_ambiguities = []
    for key, count in counts.items():
        if count > 1 and {
            tuple(row["centroid"]) for row in components if row["appearanceKey"] == key
        } != {tuple(row["centroid"]) for row in previous if row["appearanceKey"] == key}:
            moving_ambiguities.append(key)
    if moving_ambiguities:
        limitations.append("indistinguishable_component_correspondence")
    for model in models:
        key, anchor = model["appearanceKey"], model["anchor"]
        candidates = [row for row in components if row["appearanceKey"] == key and not row["borderClipped"]]
        if len(candidates) > 1:
            model["identityAmbiguous"] = True
        candidate = candidates[0] if len(candidates) == 1 else None
        color = anchor["component"]["color"]
        visible_y, visible_x = np.nonzero(np.all(rgb == color, axis=2))
        visible_points = list(zip(visible_x.tolist(), visible_y.tolist()))
        visibility = "full_candidate" if candidate else "partial_or_unmatched" if visible_points else "not_visible"
        sample = {
            "source": source, "atSeconds": at_seconds, "visibility": visibility,
            "observedCandidatePixelRuns": _runs(visible_points) if visible_points else [],
            "observedCandidatePixelCount": len(visible_points), "observedHiddenPixelCount": 0,
            "candidateCount": len(candidates), "identityEstablished": False,
        }
        velocity = model["velocity"]
        projection = None
        if velocity is not None and not model["expired"]:
            elapsed = at_seconds - anchor["atSeconds"]
            translation = [value * elapsed for value in velocity]
            projection = [anchor["component"]["centroid"][axis] + translation[axis] for axis in (0, 1)]
            predicted = {
                "kind": "conditional_constant_speed_projection", "modelUid": model["modelUid"],
                "status": "hypothesis", "authoritative": False, "pixelsObserved": False,
                "predictionObservationOrder": anchor["source"]["order"],
                "predictionObservationSeconds": anchor["atSeconds"],
                "decisionSeconds": at_seconds, "projectedCenter": projection,
                "assumptions": list(ASSUMPTIONS), "evidence": model["velocityEvidence"],
                "speedUnit": "pixels_per_recorded_second", "physicalClockAttested": False,
            }
            predictions.append(predicted)
            translated = [(x + translation[0], y + translation[1]) for x, y in _points(anchor["component"])]
            integral = all(abs(value - round(value)) < 1e-6 for point in translated for value in point)
            in_bounds = all(0 <= x < size[0] and 0 <= y < size[1] for x, y in translated)
            coverage = None
            if integral and in_bounds:
                cover = sum(
                    list(rgb[round(y), round(x)]) != background
                    and list(rgb[round(y), round(x)]) != color for x, y in translated
                )
                coverage = cover / len(translated)
            sample["projectedFootprintForegroundCoverage"] = coverage
        observed.append({"kind": "hidden_motion_visibility", "modelUid": model["modelUid"], **sample})
        if candidate and not model["expired"]:
            if projection is not None and (model["gap"] or math.dist(projection, candidate["centroid"]) > TOLERANCE):
                ambiguous = model["identityAmbiguous"]
                mismatch = math.dist(projection, candidate["centroid"]) > TOLERANCE
                absent = [row for row in model["gap"] if row["visibility"] == "not_visible"]
                occlusion_support = bool(absent) and all(
                    row.get("projectedFootprintForegroundCoverage") == 1 for row in absent
                )
                decision = {
                    "kind": "hidden_motion_comparison", "modelUid": model["modelUid"],
                    "assessment": "unsupported_correspondence" if ambiguous else
                                  "constant_speed_model_mismatch" if mismatch else "constant_speed_consistent",
                    "decisionFrameId": source["frameId"], "decisionOrder": source["order"],
                    "decisionSeconds": at_seconds, "anchor": anchor,
                    "predictionObservationOrder": anchor["source"]["order"],
                    "projectedCenter": projection, "observedCenter": candidate["centroid"],
                    "observedCandidate": candidate, "observedDisplacement": [
                        candidate["centroid"][axis] - anchor["component"]["centroid"][axis] for axis in (0, 1)
                    ],
                    "expectedDisplacement": [value * (at_seconds - anchor["atSeconds"]) for value in velocity],
                    "elapsedRecordedSeconds": at_seconds - anchor["atSeconds"],
                    "velocity": velocity, "velocityEvidence": model["velocityEvidence"],
                    "unobservedOrders": [row["source"]["order"] for row in absent],
                    "gapSamples": model["gap"], "occlusionConsistent": occlusion_support and not mismatch and not ambiguous,
                    "identityEstablished": False, "hiddenPathObserved": False, "causeEstablished": False,
                    "assumptions": list(ASSUMPTIONS), "physicalClockAttested": False,
                }
                observed.append(decision)
                if mismatch and not ambiguous:
                    observed.append({
                        **decision, "kind": "constant_speed_model_mismatch",
                        "expectedTravelDistance": math.hypot(*decision["expectedDisplacement"]),
                        "observedTravelDistance": math.hypot(*decision["observedDisplacement"]),
                    })
                    hypotheses.extend({
                        "explanation": explanation, "status": "unresolved", "authoritative": False,
                        "decisionOrder": source["order"], "modelUid": model["modelUid"],
                    } for explanation in (
                        "unseen acceleration or fast motion", "teleportation",
                        "identity mismatch or another unobserved cause",
                    ))
                if ambiguous:
                    limitations.append("return_correspondence_not_independently_resolved")
                model["history"] = []
            elif model["gap"]:
                limitations.append("gap_without_supported_prior_velocity")
                model["history"] = []
            current_sample = {"source": source, "atSeconds": at_seconds, "component": candidate}
            history = (model["history"] + [current_sample])[-3:]
            model.update(anchor=current_sample, history=history, gap=[], velocity=None, velocityEvidence=[])
            if len(history) == 3 and not model["identityAmbiguous"]:
                vectors = [
                    [(right["component"]["centroid"][axis] - left["component"]["centroid"][axis]) /
                     (right["atSeconds"] - left["atSeconds"]) for axis in (0, 1)]
                    for left, right in zip(history, history[1:])
                ]
                if math.dist(*vectors) <= TOLERANCE and math.hypot(*vectors[-1]) > TOLERANCE:
                    model["velocity"] = vectors[-1]
                    model["velocityEvidence"] = history
        else:
            if len(model["gap"]) < MAX_GAP:
                model["gap"].append(sample)
            else:
                model["expired"] = True
                limitations.append("bounded_hidden_motion_history_exhausted")
    observed.insert(0, {
        "kind": "observed_uniform_components", "source": source, "components": components,
        "ambiguousMotionAppearances": moving_ambiguities, "pixelPolicy": "original_observed_only",
    })
    state = _seal({
        "version": VERSION, "implementationHash": implementation_revision(), "source": source,
        "atSeconds": at_seconds, "size": size, "background": background,
        "lastComponents": components, "models": models,
        "sourceHistory": [*prior.get("sourceHistory", []), {"source": source, "atSeconds": at_seconds}],
    })
    return {
        "state": state, "observed": observed, "predictions": predictions, "hypotheses": hypotheses,
        "limitations": sorted(set(limitations + [
            "Bounded exact uniform-color components; gradients, changed appearance and camera transforms are unsupported.",
            "Appearance correspondence and constant-speed fit do not prove identity, depth, hidden path or physical cause.",
            "Clock/fixed-camera assumptions are conditional; no physical acceleration or teleport event is asserted.",
        ])),
    }
