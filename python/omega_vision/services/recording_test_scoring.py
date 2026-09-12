"""Evaluator-only grading of frozen observations. Never imported by observer hooks."""
from __future__ import annotations

from collections import Counter
from io import BytesIO
import json
import math
from pathlib import Path
from typing import Any

from PIL import Image, UnidentifiedImageError

from omega_vision.inherited_source_overlay import storage_path
from omega_vision.perception.observation_identity import content_hash


def summary(checks: list[dict[str, Any]]) -> dict[str, Any]:
    counts = {status: sum(item["outcome"] == status for item in checks)
              for status in ("passed", "failed", "inconclusive", "unsupported")}
    outcome = ("failed" if counts["failed"] else "unsupported" if counts["unsupported"]
               else "inconclusive" if counts["inconclusive"] or not checks else "passed")
    graded = counts["passed"] + counts["failed"]
    return {"outcome": outcome, **counts, "total": len(checks), "graded": graded,
            "coverage": graded / len(checks) if checks else 0,
            "accuracy": counts["passed"] / graded if graded else None}


def _check(name, passed, *, evidence=(), detail=None, unsupported=False):
    return {"name": name, "outcome": "unsupported" if unsupported else
            "inconclusive" if passed is None else "passed" if passed else "failed",
            "evidenceRefs": list(evidence), "detail": detail}


def _oracle(home: Path, directory: Path, name: str) -> tuple[dict[str, Any], str]:
    path = directory / name
    if storage_path(home, *path.relative_to(home).parts) != path:
        raise PermissionError("Evaluator oracle path was redirected")
    raw = path.read_bytes()
    if len(raw) > 8_000_000:
        raise ValueError("Evaluator oracle is too large")
    value = json.loads(raw)
    if not isinstance(value, dict):
        raise ValueError("Evaluator oracle must be a JSON object")
    return value, content_hash(raw)


def _aligned_entities(oracle, frames):
    mapping = {}
    for expected, actual in zip(oracle["frames"], frames):
        groups = actual.get("core", {}).get("groups", [])
        tracks = {item["observationUid"]: item["trackUid"]
                  for item in actual.get("core", {}).get("tracks", [])}
        for body in expected.get("authoredObjects", []):
            points = {(body["x"] + x, body["y"] + y)
                      for y, row in enumerate(body["mask"]) for x, occupied in enumerate(row) if occupied == "1"}
            choices = []
            for group in groups:
                measured = {tuple(point) for point in group["points"]}
                union = len(points | measured)
                iou = len(points & measured) / union if union else 0
                if iou >= 0.8 and group["uid"] in tracks:
                    choices.append((iou, tracks[group["uid"]]))
            choices.sort(reverse=True)
            if choices and (len(choices) == 1 or choices[0][0] > choices[1][0]):
                mapping.setdefault(body["entity"], set()).add(choices[0][1])
    return {name: next(iter(values)) for name, values in mapping.items() if len(values) == 1}


def _translate(term, mapping, known):
    if isinstance(term, dict):
        return {key: _translate(value, mapping, known) for key, value in term.items()}
    if isinstance(term, list):
        return [_translate(value, mapping, known) for value in term]
    if isinstance(term, str) and term in known:
        if term not in mapping:
            raise KeyError(term)
        return mapping[term]
    return term


class HiddenMotionScoringIntegrityError(ValueError):
    """Missing, malformed or stale evidence cannot receive a domain grade."""


_SOURCE_FIELDS = ("frameId", "order", "imageHash", "stateHash")
_MOTION_ASSUMPTIONS = {
    "common_recorded_acquisition_clock", "fixed_original_pixel_reference",
    "unchanged_appearance", "candidate_correspondence_not_identity_proof",
}


def _require(condition, message):
    if not condition:
        raise HiddenMotionScoringIntegrityError(message)


def _finite(value):
    try:
        valid = type(value) in (int, float) and math.isfinite(value)
    except OverflowError:
        valid = False
    _require(valid, "Scoring requires finite numeric evidence")
    return value


def _vector(value):
    _require(isinstance(value, list) and len(value) == 2, "Projection/geometry requires a two-coordinate vector")
    return [_finite(component) for component in value]


def _close_vector(actual, expected):
    return math.dist(_vector(actual), expected) < 1e-6


def _frozen_sources(frames):
    _require(isinstance(frames, list) and bool(frames), "Scoring requires a nonempty frozen recording")
    sources, last_time = [], None
    for index, frame in enumerate(frames):
        _require(frame.get("inferenceFrozen") is True, "All inference must be frozen before source/evaluator reads")
        source = frame["source"]
        _require(type(source["order"]) is int and source["order"] == index
                 and source["frameId"] == frame["frameId"] == str(index), "Frozen frame identity/order mismatch")
        time = _finite(source["receipt"]["atSeconds"])
        _require(time >= 0 and (last_time is None or last_time < time), "Frozen acquisition order/time mismatch")
        for key in ("imageHash", "stateHash"):
            digest = source[key]
            _require(isinstance(digest, str) and len(digest) == 64
                     and all(char in "0123456789abcdef" for char in digest), "Frozen source hash is missing or malformed")
        _require(isinstance(source["visualSequenceId"], str) and bool(source["visualSequenceId"]),
                 "Frozen recording identity is missing")
        sources.append(source)
        last_time = time
    return sources


def _hidden_source_images(home, directory, frames):
    """Recheck actual files after publication; never execute an observer."""
    try:
        sources = _frozen_sources(frames)
        relative = directory.relative_to(home)
        _require(storage_path(home, *relative.parts) == directory, "Scoring source directory was redirected")
        images = []
        for index, source in enumerate(sources):
            _require(source["visualSequenceId"] == relative.as_posix(), "Frozen recording source identity mismatch")
            image_path, state_path = (directory / str(index) / name for name in ("image.png", "state.json"))
            for path in (image_path, state_path):
                _require(storage_path(home, *path.relative_to(home).parts) == path, "Scoring source file was redirected")
            png, raw_state = image_path.read_bytes(), state_path.read_bytes()
            _require(content_hash(png) == source["imageHash"] and content_hash(raw_state) == source["stateHash"],
                     "Actual source image/state hash differs from frozen evidence")
            state = json.loads(raw_state)
            _require(_finite(state["at_seconds"]) == source["receipt"]["atSeconds"],
                     "Actual source acquisition time differs from frozen evidence")
            _require(state.get("incoming_action") == source["receipt"]["action"]
                     and state.get("action_data", {}) == source["receipt"]["data"],
                     "Actual input receipt differs from frozen evidence")
            metadata = directory / str(index) / "observation_metadata.json"
            _require(storage_path(home, *metadata.relative_to(home).parts) == metadata,
                     "Scoring acquisition sidecar was redirected")
            metadata_hash = content_hash(metadata.read_bytes()) if metadata.is_file() else None
            _require(metadata_hash == source.get("observationMetadataHash"), "Acquisition sidecar source hash changed")
            images.append(png)
        return images
    except (KeyError, TypeError, IndexError, AttributeError, FileNotFoundError, json.JSONDecodeError) as error:
        raise HiddenMotionScoringIntegrityError("Missing/malformed frozen source acquisition binding") from error


def _encode_pixel_runs(points):
    result = []
    for x, y in sorted(points, key=lambda point: (point[1], point[0])):
        if result and result[-1][0] == y and result[-1][2] == x:
            result[-1][2] += 1
        else:
            result.append([y, x, x + 1])
    return result


def _decode_pixel_runs(runs, raster):
    _require(isinstance(runs, list), "Observed pixel runs must be a list")
    points, previous = set(), None
    for run in runs:
        _require(isinstance(run, list) and len(run) == 3 and all(type(value) is int for value in run),
                 "Observed pixel runs require three integers")
        y, left, right = run
        _require(0 <= y < raster["height"] and 0 <= left < right <= raster["width"],
                 "Observed pixel geometry is outside the source viewport")
        _require(previous is None or y > previous[0] or y == previous[0] and left > previous[2],
                 "Observed pixel runs overlap or are not canonical")
        points.update((x, y) for x in range(left, right))
        previous = run
    return points


def _source_raster(png):
    """Independent, stateless verification of the published uniform components."""
    try:
        with Image.open(BytesIO(png)) as image:
            width, height = image.size
            _require(width * height <= 262_144, "Source raster exceeds the supported grading bound")
            raw = image.convert("RGBA").tobytes()
            pixels = [tuple(raw[offset:offset + 4]) for offset in range(0, len(raw), 4)]
    except (UnidentifiedImageError, OSError, Image.DecompressionBombError) as error:
        raise HiddenMotionScoringIntegrityError("Actual source image is not decodable") from error
    _require(all(pixel[3] == 255 for pixel in pixels), "Opaque source-pixel evidence is unavailable")
    pixels = [pixel[:3] for pixel in pixels]
    background, count = Counter(pixels).most_common(1)[0]
    _require(count > len(pixels) // 2, "A supported source background is unavailable")
    visited, components = set(), []
    for offset, color in enumerate(pixels):
        if color == background or offset in visited:
            continue
        pending, points = [offset], set()
        visited.add(offset)
        while pending:
            current = pending.pop()
            x, y = current % width, current // width
            points.add((x, y))
            for nx, ny in ((x - 1, y), (x + 1, y), (x, y - 1), (x, y + 1)):
                neighbor = ny * width + nx
                if (0 <= nx < width and 0 <= ny < height and neighbor not in visited
                        and pixels[neighbor] == color):
                    visited.add(neighbor)
                    pending.append(neighbor)
        xs, ys = zip(*points)
        left, top, right, bottom = min(xs), min(ys), max(xs), max(ys)
        components.append({
            "appearanceKey": content_hash({
                "color": list(color), "shape": _encode_pixel_runs({(x - left, y - top) for x, y in points}),
            }),
            "color": list(color), "pixelRuns": _encode_pixel_runs(points), "pixelCount": len(points),
            "bounds": [left, top, right, bottom], "centroid": [sum(xs) / len(xs), sum(ys) / len(ys)],
            "maskHash": content_hash(sorted(points)),
            "borderClipped": left == 0 or top == 0 or right == width - 1 or bottom == height - 1,
        })
    return {"width": width, "height": height, "pixels": pixels, "background": background,
            "components": components, "byHash": {row["maskHash"]: row for row in components}}


def _verified_component(claim, raster):
    points = _decode_pixel_runs(claim["pixelRuns"], raster)
    actual = raster["byHash"].get(content_hash(sorted(points)))
    _vector(claim["centroid"])
    if actual is None:
        return False, None
    valid = (
        type(claim["pixelCount"]) is int and type(claim["borderClipped"]) is bool
        and isinstance(claim["bounds"], list) and len(claim["bounds"]) == 4
        and all(type(value) is int for value in claim["bounds"])
        and isinstance(claim["color"], list) and len(claim["color"]) == 3
        and all(type(value) is int for value in claim["color"])
        and all(claim[key] == actual[key] for key in
                ("appearanceKey", "color", "pixelRuns", "pixelCount", "bounds", "maskHash", "borderClipped"))
        and _close_vector(claim["centroid"], actual["centroid"])
    )
    return valid, actual


def _audit_hidden_claims(frames, rasters):
    checks, origins, projections = [], {}, {}
    for index, raster in enumerate(rasters):
        source = {key: frames[index]["source"][key] for key in _SOURCE_FIELDS}
        for component in raster["components"]:
            uid = "motion-model-" + content_hash([source, component["appearanceKey"]])
            origins[uid] = (index, component)

    def origin(uid, index):
        value = origins.get(uid)
        _require(value is not None and value[0] < index, "Motion model has no bound earlier component origin")
        return value[1]

    def sample(value, cutoff, template):
        order = value["source"]["order"]
        _require(type(order) is int and 0 <= order <= cutoff, "Motion evidence exceeds its decision cutoff")
        _require(value["source"] == {key: frames[order]["source"][key] for key in _SOURCE_FIELDS},
                 "Motion evidence has a wrong source binding")
        _require(_finite(value["atSeconds"]) == frames[order]["source"]["receipt"]["atSeconds"],
                 "Motion evidence acquisition time is unbound")
        valid, actual = _verified_component(value["component"], rasters[order])
        valid = valid and actual["appearanceKey"] == template["appearanceKey"] and not actual["borderClipped"]
        valid = valid and sum(row["appearanceKey"] == template["appearanceKey"]
                              for row in rasters[order]["components"]) == 1
        return valid, actual, order, value["atSeconds"]

    def equation(evidence, cutoff, index, uid):
        template = origin(uid, index)
        _require(type(cutoff) is int and 0 <= cutoff < index, "Projection has an invalid earlier cutoff")
        _require(isinstance(evidence, list) and len(evidence) == 3, "Projection requires three bound earlier observations")
        samples = [sample(value, cutoff, template) for value in evidence]
        orders = [value[2] for value in samples]
        _require(orders == list(range(cutoff - 2, cutoff + 1)), "Projection evidence is nonconsecutive or stale")
        if not all(value[0] for value in samples):
            return False, None
        vectors = [
            [(right[1]["centroid"][axis] - left[1]["centroid"][axis]) / (right[3] - left[3]) for axis in (0, 1)]
            for left, right in zip(samples, samples[1:])
        ]
        time = frames[index]["source"]["receipt"]["atSeconds"]
        anchor = samples[-1][1]
        displacement = [value * (time - samples[-1][3]) for value in vectors[-1]]
        projected = [anchor["centroid"][axis] + displacement[axis] for axis in (0, 1)]
        valid = math.dist(*vectors) <= 0.75 and math.hypot(*vectors[-1]) > 0.75
        valid = valid and all(rasters[order]["width"] == rasters[index]["width"]
                              and rasters[order]["height"] == rasters[index]["height"] for order in orders)
        return valid, {"center": projected, "velocity": vectors[-1], "displacement": displacement,
                       "anchor": anchor, "atSeconds": samples[-1][3], "decisionSeconds": time}

    def assumptions(row):
        value = row["assumptions"]
        _require(isinstance(value, list) and all(isinstance(item, str) for item in value), "Invalid conditional assumptions")
        return len(value) == len(_MOTION_ASSUMPTIONS) and set(value) == _MOTION_ASSUMPTIONS and row["physicalClockAttested"] is False

    for index, frame in enumerate(frames):
        refs = frame["observer"].get("nativeMemoryRefs", [])
        for prediction in frame["observer"].get("predictions", []):
            if prediction["kind"] != "conditional_constant_speed_projection":
                continue
            uid, cutoff = prediction["modelUid"], prediction["predictionObservationOrder"]
            _vector(prediction["projectedCenter"])
            prediction_time, decision_time = _finite(prediction["predictionObservationSeconds"]), _finite(prediction["decisionSeconds"])
            conditional = assumptions(prediction)
            valid, expected = equation(prediction["evidence"], cutoff, index, uid)
            valid = valid and (
                _close_vector(prediction["projectedCenter"], expected["center"])
                and prediction_time == expected["atSeconds"] and decision_time == expected["decisionSeconds"]
            )
            valid = valid and conditional and prediction["authoritative"] is False and prediction["pixelsObserved"] is False
            valid = valid and prediction["status"] == "hypothesis" and prediction["speedUnit"] == "pixels_per_recorded_second"
            _require((index, uid) not in projections, "Duplicate motion projection for one model/frame")
            projections[index, uid] = expected
            checks.append(_check("Source-grounded conditional projection coordinates", valid, evidence=refs))

    def visibility(row, uid, index):
        raster, template = rasters[index], origin(uid, index)
        _require(type(row["source"]["order"]) is int
                 and row["source"] == {key: frames[index]["source"][key] for key in _SOURCE_FIELDS}
                 and _finite(row["atSeconds"]) == frames[index]["source"]["receipt"]["atSeconds"],
                 "Visibility has a wrong source/time binding")
        points = {(offset % raster["width"], offset // raster["width"])
                  for offset, color in enumerate(raster["pixels"]) if list(color) == template["color"]}
        candidates = [component for component in raster["components"]
                      if component["appearanceKey"] == template["appearanceKey"] and not component["borderClipped"]]
        status = "full_candidate" if len(candidates) == 1 else "partial_or_unmatched" if points else "not_visible"
        valid = (
            _decode_pixel_runs(row["observedCandidatePixelRuns"], raster) == points
            and type(row["observedCandidatePixelCount"]) is int and row["observedCandidatePixelCount"] == len(points)
            and type(row["observedHiddenPixelCount"]) is int and row["observedHiddenPixelCount"] == 0
            and type(row["candidateCount"]) is int and row["candidateCount"] == len(candidates)
            and row["visibility"] == status and row["identityEstablished"] is False
        )
        if (index, uid) in projections:
            expected = projections[index, uid]
            if expected is None:
                return False
            translated = [(x + expected["displacement"][0], y + expected["displacement"][1])
                          for x, y in _decode_pixel_runs(expected["anchor"]["pixelRuns"], raster)]
            coverage = None
            if all(abs(value - round(value)) < 1e-6 for point in translated for value in point) and all(
                0 <= x < raster["width"] and 0 <= y < raster["height"] for x, y in translated
            ):
                coverage = sum(
                    raster["pixels"][round(y) * raster["width"] + round(x)] not in
                    (raster["background"], tuple(template["color"])) for x, y in translated
                ) / len(translated)
            reported = row["projectedFootprintForegroundCoverage"]
            if reported is not None:
                _finite(reported)
            valid = valid and (reported is None if coverage is None else reported is not None and abs(reported - coverage) < 1e-6)
        else:
            valid = valid and "projectedFootprintForegroundCoverage" not in row
        return valid

    for index, frame in enumerate(frames):
        refs = frame["observer"].get("nativeMemoryRefs", [])
        rows = frame["observer"].get("observed", [])
        for row in rows:
            if row["kind"] == "observed_uniform_components":
                _require(row["source"] == {key: frame["source"][key] for key in _SOURCE_FIELDS},
                         "Component source binding disagrees with verified source")
                components = row["components"]
                checked = [_verified_component(component, rasters[index])[0] for component in components]
                valid = all(checked) and len(components) == len(rasters[index]["components"])
                valid = valid and len({component["maskHash"] for component in components}) == len(components)
                checks.append(_check("Published components match actual source pixels", valid, evidence=refs))
            elif row["kind"] == "hidden_motion_visibility":
                checks.append(_check("Visibility labels and pixels match actual source",
                                     visibility(row, row["modelUid"], index), evidence=refs))
            elif row["kind"] in {"hidden_motion_comparison", "constant_speed_model_mismatch"}:
                uid, cutoff = row["modelUid"], row["predictionObservationOrder"]
                for field in ("projectedCenter", "observedCenter", "velocity", "expectedDisplacement", "observedDisplacement"):
                    _vector(row[field])
                elapsed, decision_time = _finite(row["elapsedRecordedSeconds"]), _finite(row["decisionSeconds"])
                conditional = assumptions(row)
                valid, expected = equation(row["velocityEvidence"], cutoff, index, uid)
                anchor_valid, _, _, _ = sample(row["anchor"], cutoff, origin(uid, index))
                candidate_valid, candidate = _verified_component(row["observedCandidate"], rasters[index])
                valid = valid and anchor_valid and candidate_valid and row["anchor"] == row["velocityEvidence"][-1]
                if valid:
                    displacement = [candidate["centroid"][axis] - expected["anchor"]["centroid"][axis] for axis in (0, 1)]
                    valid = (
                        _close_vector(row["projectedCenter"], expected["center"])
                        and _close_vector(row["observedCenter"], candidate["centroid"])
                        and _close_vector(row["velocity"], expected["velocity"])
                        and _close_vector(row["expectedDisplacement"], expected["displacement"])
                        and _close_vector(row["observedDisplacement"], displacement)
                        and elapsed == expected["decisionSeconds"] - expected["atSeconds"]
                        and decision_time == expected["decisionSeconds"]
                    )
                valid = valid and conditional and row["decisionFrameId"] == str(index) and type(row["decisionOrder"]) is int and row["decisionOrder"] == index
                gaps = row["gapSamples"]
                _require(all(type(value["source"]["order"]) is int for value in gaps)
                         and [value["source"]["order"] for value in gaps] == list(range(cutoff + 1, index)),
                         "Comparison gap receipts are missing, nonconsecutive or future")
                gap_valid = [visibility(value, uid, value["source"]["order"]) for value in gaps]
                valid = valid and all(gap_valid)
                checks.append(_check("Comparison geometry and gap pixels are source-grounded", valid, evidence=refs))
    return checks


def _hidden_motion_checks(oracle, frames, *, source_images=None):
    try:
        sources = _frozen_sources(frames)
        _require(isinstance(source_images, list) and len(source_images) == len(frames),
                 "Actual source image evidence is required for hidden-motion grading")
        _require(isinstance(oracle["frames"], list) and len(oracle["frames"]) == len(frames),
                 "Evaluator frame count differs from frozen recording")
        for index, (expected, source, png) in enumerate(zip(oracle["frames"], sources, source_images)):
            _require("visualSequenceId" not in oracle or oracle["visualSequenceId"] == source["visualSequenceId"],
                     "Evaluator recording identity mismatch")
            _require(expected["frameId"] == str(index)
                     and all(type(expected[key]) is int and expected[key] == index
                             for key in ("order", "frameOrder") if key in expected),
                     "Evaluator frame identity/order mismatch")
            _require(expected["sha256"] == source["imageHash"] == content_hash(png), "Evaluator/source image hash mismatch")
            _require(_finite(expected["atSeconds"]) == source["receipt"]["atSeconds"], "Evaluator acquisition time mismatch")
        rasters = [_source_raster(png) for png in source_images]
        checks = _audit_hidden_claims(frames, rasters)
        domain, decisions = _hidden_motion_domain_checks(oracle, frames, rasters)
        return checks + domain, decisions
    except (KeyError, TypeError, IndexError, AttributeError) as error:
        raise HiddenMotionScoringIntegrityError("Missing/malformed evaluator or frozen measurement binding") from error


def _hidden_motion_domain_checks(oracle, frames, rasters):
    """Align only in the scorer; derive motion expectations from frozen measured pixels."""
    teacher = oracle["teacher"]
    color, mask = teacher["actorColor"], teacher["actorMask"]
    local = {(x, y) for y, row in enumerate(mask) for x, occupied in enumerate(row) if occupied == "1"}
    checks, expected_decisions = [], {}
    history, gap, velocity = [], [], None
    for index, (frame, expected) in enumerate(zip(frames, oracle["frames"], strict=True)):
        if frame.get("inferenceFrozen") is not True or frame["source"]["order"] != index or frame["frameId"] != str(index):
            raise ValueError("Hidden-motion scoring requires exact ordered frozen observations")
        observer = frame["observer"]
        refs = observer.get("nativeMemoryRefs", [])
        rows = observer.get("observed", [])
        components_row = next((row for row in rows if row["kind"] == "observed_uniform_components"), None)
        if components_row is None:
            checks.append(_check("Original-pixel hidden-motion representation", None, evidence=refs, unsupported=True))
            history, velocity = [], None
            continue
        source = {key: frame["source"][key] for key in ("frameId", "order", "imageHash", "stateHash")}
        checks.append(_check("Measured component source binding", components_row["source"] == source, evidence=refs))
        components = rasters[index]["components"]
        position = expected.get("authoredPosition", expected.get("authoredActorPosition"))
        expected_points = {(position[0] + x, position[1] + y) for x, y in local} if position is not None else set()
        colored = [
            (component, {(x, y) for y, left, right in component["pixelRuns"] for x in range(left, right)})
            for component in components if component["color"] == color
        ]
        visible = set().union(*(points & expected_points for _, points in colored)) if colored else set()
        checks.append(_check(
            "Actually observed actor-aligned pixels", len(visible) == expected["visibleActorPixels"], evidence=refs,
            detail="Evaluator-only pose/color alignment; no identity is supplied to the observer.",
        ))
        full = [component for component, points in colored if points == expected_points and len(points) == len(local)]
        current = full[0] if len(full) == 1 else None
        anchor = history[-1] if history else None
        time = frame["source"]["receipt"]["atSeconds"]
        expected_decision = None
        if current is not None:
            if anchor is not None and velocity is not None:
                anchor_index, anchor_time, anchor_component = anchor
                elapsed = time - anchor_time
                displacement = [current["centroid"][axis] - anchor_component["centroid"][axis] for axis in (0, 1)]
                predicted = [value * elapsed for value in velocity]
                mismatch = math.dist(displacement, predicted) > 0.75
                if gap or mismatch:
                    expected_decision = {
                        "assessment": "constant_speed_model_mismatch" if mismatch else "constant_speed_consistent",
                        "anchor": anchor_index, "displacement": displacement, "prediction": predicted,
                        "unobserved": [order for order in gap if oracle["frames"][order]["visibleActorPixels"] == 0],
                    }
                    expected_decisions[index] = expected_decision
                    history = []
            if gap:
                history = []
            history = (history + [(index, time, current)])[-3:]
            gap, velocity = [], None
            if len(history) == 3 and all(right[0] == left[0] + 1 for left, right in zip(history, history[1:])):
                vectors = [
                    [(right[2]["centroid"][axis] - left[2]["centroid"][axis]) / (right[1] - left[1]) for axis in (0, 1)]
                    for left, right in zip(history, history[1:])
                ]
                if math.dist(*vectors) <= 0.75 and math.hypot(*vectors[-1]) > 0.75:
                    velocity = vectors[-1]
        elif history:
            gap.append(index)
        actual = [row for row in rows if row["kind"] == "hidden_motion_comparison"
                  and row["observedCandidate"]["color"] == color]
        if expected_decision:
            actual = [row for row in actual if current is not None and row["observedCandidate"]["maskHash"] == current["maskHash"]]
            if len(actual) != 1 or actual[0]["assessment"] == "unsupported_correspondence":
                checks.append(_check("Independent return candidate and earlier motion baseline", None, evidence=refs,
                                     detail="Appearance/identity ambiguity or missing earlier motion prevents grading this comparison."))
                continue
            row = actual[0]
            checks.append(_check(
                "Decision-time constant-speed comparison",
                row["assessment"] == expected_decision["assessment"]
                and row["predictionObservationOrder"] == expected_decision["anchor"]
                and row["decisionOrder"] == index and row["decisionFrameId"] == str(index)
                and math.dist(row["expectedDisplacement"], expected_decision["prediction"]) < 1e-6
                and math.dist(row["observedDisplacement"], expected_decision["displacement"]) < 1e-6
                and row["unobservedOrders"] == expected_decision["unobserved"],
                evidence=refs,
            ))
            checks.append(_check(
                "Model comparison does not establish identity or hidden cause",
                row["identityEstablished"] is False and row["hiddenPathObserved"] is False and row["causeEstablished"] is False,
                evidence=refs,
            ))
            if expected_decision["assessment"] == "constant_speed_model_mismatch":
                alternatives = [item for item in observer["hypotheses"] if item.get("modelUid") == row["modelUid"]]
                checks.append(_check(
                    "Competing unobserved fast travel and teleportation",
                    {"unseen acceleration or fast motion", "teleportation"} <= {item["explanation"] for item in alternatives}
                    and all(item["authoritative"] is False and item["status"] == "unresolved" for item in alternatives),
                    evidence=refs,
                ))
            elif expected_decision["unobserved"]:
                bounds = teacher.get("occluderBounds")
                hidden_positions = [oracle["frames"][order].get("authoredPosition",
                                    oracle["frames"][order].get("authoredActorPosition"))
                                    for order in expected_decision["unobserved"]]
                expected_cover = bounds is not None and all(position is not None and all(
                    bounds[0] <= position[0] + x < bounds[2] and bounds[1] <= position[1] + y < bounds[3]
                    for x, y in local) for position in hidden_positions)
                checks.append(_check("Observed foreground supports only conditional occlusion",
                                     row["occlusionConsistent"] == expected_cover, evidence=refs))
        elif actual:
            checks.append(_check("No unsupported early actor model mismatch", False, evidence=refs))
    refs = [ref for frame in frames for ref in frame["observer"].get("nativeMemoryRefs", [])]
    exercised = any(
        prediction["kind"] == "conditional_constant_speed_projection"
        and prediction["evidence"] and prediction["evidence"][-1]["component"]["color"] == color
        for frame in frames for prediction in frame["observer"].get("predictions", [])
    )
    checks.append(_check("Earlier observed motion model exercised", True if exercised else None,
                         evidence=refs, unsupported=not exercised))
    return checks, expected_decisions


def _association_prediction_checks(oracle, frames, source_images):
    """Grade arrival coordinates from the image, not a model's 'correct' label."""
    checks, completed = [], []
    receipts = {(frame["source"]["imageHash"], frame["source"]["receipt"]["atSeconds"]) for frame in frames}
    try:
        for index, frame in enumerate(frames):
            for prediction in frame["observer"].get("predictions", []):
                if prediction.get("status") not in {"correct", "incorrect"}:
                    continue
                _require(prediction["kind"] == "conditional_portal_destination", "Unknown completed prediction contract")
                completed.append(prediction)
                expected_center, observed_center = _vector(prediction["expectedCenter"]), _vector(prediction["observedCenter"])
                cutoff, decision = _finite(prediction["predictionObservationSeconds"]), _finite(prediction["decisionSeconds"])
                observed_time = frames[index]["source"]["receipt"]["atSeconds"]
                _require(0 <= cutoff < decision <= observed_time
                         and _finite(prediction["observedAtSeconds"]) == observed_time,
                         "Association prediction has an invalid decision/observation cutoff")
                bound = bool(prediction["evidence"]) and all(
                    0 <= _finite(item["before_seconds"]) < _finite(item["after_seconds"]) <= cutoff
                    and (item["before_hash"], item["before_seconds"]) in receipts
                    and (item["after_hash"], item["after_seconds"]) in receipts for item in prediction["evidence"]
                )
                raster = _source_raster(source_images[index])
                candidates = [row for row in raster["components"]
                              if row["color"] == oracle["teacher"]["actorColor"] and not row["borderClipped"]]
                refs = frame["observer"].get("nativeMemoryRefs", [])
                if len(candidates) != 1:
                    checks.append(_check("Unambiguous measured association endpoint", None, evidence=refs))
                    continue
                left, top, right, bottom = candidates[0]["bounds"]
                center = [(left + right + 1) / 2, (top + bottom + 1) / 2]
                checks.append(_check(
                    "Future-blind conditional association prediction",
                    bound and prediction["authoritative"] is False and prediction["status"] == "correct"
                    and math.dist(expected_center, center) < 1e-6 and math.dist(observed_center, center) < 1e-6,
                    evidence=refs,
                ))
    except (KeyError, TypeError, IndexError) as error:
        raise HiddenMotionScoringIntegrityError("Malformed conditional association prediction") from error
    return checks, completed


def score_recording(home: Path, directory: Path, test_id: str,
                    frozen_frames: list[dict[str, Any]], last_native: dict[str, Any]) -> dict[str, Any]:
    """Called only after inference/native publication has been frozen for the clip."""
    checks, oracle_hash = [], None
    refs = [reference for frame in frozen_frames for reference in frame["observer"].get("nativeMemoryRefs", [])]
    if test_id == "color_band_cycle":
        oracle, oracle_hash = _oracle(home, directory, "evaluation.json")
        for frame, expected in zip(frozen_frames, oracle["frames"], strict=True):
            observed = frame["observer"].get("observed", [])
            color = next((item["targetColor"] for item in observed if item["kind"] == "visible_color_band"), None)
            checks.append(_check("Measured current target color", color == expected["targetColor"],
                                 evidence=frame["observer"].get("nativeMemoryRefs", [])))
            for prediction in frame["observer"].get("predictions", []):
                status = prediction["assessment"]
                cold_start = status == "unknown" and not prediction["priorEvidence"] and prediction["learnedStep"] is None
                checks.append(_check("Cold-start uncertainty retained" if cold_start else "Frozen next-color prediction",
                                     True if cold_start else None if status == "unknown" else status == "correct",
                                     evidence=frame["observer"]["nativeMemoryRefs"],
                                     detail="Cold-start uncertainty is scored separately from predictive accuracy." if cold_start else None))
        if any(frame["hitTarget"] for frame in oracle["frames"]) and not any(
                   prediction.get("learnedStep") is not None and prediction.get("hitTarget")
                   for frame in frozen_frames for prediction in frame["observer"].get("predictions", [])):
            checks.append(_check("Learned successor prediction exercised", None, evidence=refs,
                                 detail="No learned target-hit prediction was exercised; this is not a full predictive pass."))
    elif test_id in {"spotlight_scene", "spotlight_action_modes"}:
        oracle, oracle_hash = _oracle(home, directory, "evaluation.json")
        for frame, expected in zip(frozen_frames, oracle["frames"], strict=True):
            observed = frame["observer"].get("observed", [])
            union = next((item for item in observed if item["kind"] == "visibility_union"), {})
            checks.append(_check("Causal known/unknown visibility union",
                                 union.get("knownPixels") == expected["cumulativeKnownPixels"]
                                 and union.get("complete") == expected["completeCoverage"],
                                 evidence=frame["observer"].get("nativeMemoryRefs", [])))
        state = last_native["state"].get("spotlight")
        if state:
            raw = bytes.fromhex(state["rgbaHex"])
            scene = oracle["teacher"]["fullSceneRgb"]
            matches = all(list(raw[index * 4:index * 4 + 3]) == rgb
                          for index, rgb in enumerate(scene) if raw[index * 4 + 3] == 255)
            checks.append(_check("All reconstructed known pixels match evaluator scene", matches, evidence=refs[-2:]))
            unknown_clean = all(raw[index:index + 3] == b"\0\0\0"
                                for index in range(0, len(raw), 4) if raw[index + 3] == 0)
            checks.append(_check("Unobserved cells remain unknown", unknown_clean, evidence=refs[-2:]))
    elif test_id in {"occlusion_pole", "occlusion_large_object", "teleporter"}:
        source_images = _hidden_source_images(home, directory, frozen_frames)
        oracle, oracle_hash = _oracle(home, directory, "evaluation.json")
        domain_checks, expected_decisions = _hidden_motion_checks(oracle, frozen_frames, source_images=source_images)
        checks.extend(domain_checks)
        assessment_file = directory / "observer_assessment.json"
        if assessment_file.is_file():
            assessment, assessment_hash = _oracle(home, directory, assessment_file.name)
            oracle_hash = content_hash({"evaluation": oracle_hash, "observerAssessment": assessment_hash})
            phase = assessment["phase2"]
            decision = expected_decisions.get(phase["earliestMismatchDecisionFrame"])
            checks.append(_check(
                "Evaluator-only two-phase decision boundary",
                decision is not None and decision["assessment"] == "constant_speed_model_mismatch"
                and decision["anchor"] == phase["predictionObservationCutoffFrame"]
                and decision["unobserved"] == phase["fullyMissingFrames"], evidence=refs,
            ))
        association_checks, predictions = _association_prediction_checks(oracle, frozen_frames, source_images)
        checks.extend(association_checks)
        if test_id == "teleporter" and any(
            value["assessment"] == "constant_speed_model_mismatch" for value in expected_decisions.values()
        ) and not predictions:
            checks.append(_check("Later association prediction", None, evidence=refs))
        checks.append(_check("No oracle cause asserted as student truth",
                             all(item.get("authoritative") is False for frame in frozen_frames
                                 for item in frame["observer"].get("hypotheses", [])), evidence=refs,
                             detail="Fast motion/acceleration remains an alternative; definitive teleportation is not the grading target."))
    elif (directory / "expected_events.json").is_file():
        oracle, oracle_hash = _oracle(home, directory, "expected_events.json")
        mapping = _aligned_entities(oracle, frozen_frames)
        known = set(oracle["entityIds"])
        for expected in oracle["expectedEvents"]:
            decision = expected.get("decisionFrameId", expected["toFrameId"])
            if (not isinstance(decision, str) or not decision.isascii() or not decision.isdecimal()
                    or str(int(decision)) != decision or not 0 <= int(decision) < len(frozen_frames)):
                raise ValueError("Evaluator decision frame is invalid or outside the frozen recording")
            index = int(decision)
            frame = frozen_frames[index]
            if frame["frameId"] != decision:
                raise ValueError("Evaluator decision frame disagrees with the frozen frame order")
            core = frame.get("core", {})
            result = core.get("events", {})
            assessment = result.get("assessment", {})
            try:
                target = _translate(expected["term"], mapping, known)
            except KeyError:
                checks.append(_check(expected["display"], None, evidence=core.get("evidenceRefs", []),
                                     detail="Independent entity alignment is ambiguous or insufficiently warmed up."))
                continue
            events = assessment.get("events", []) if isinstance(assessment, dict) else []
            detected = any(item["term"] == target for item in events)
            complete = target["predicate"] in result.get("complete_predicates", [])
            checks.append(_check(expected["display"], True if detected else False if complete else None,
                                 evidence=core.get("evidenceRefs", []), unsupported=not detected and not complete,
                                 detail=None if detected else "Missing complete detector/evidence contract; no oracle-label substitution."))
        if not oracle["expectedEvents"]:
            expected = oracle.get("expectedAssessment")
            last = frozen_frames[-1].get("core", {}).get("events", {}).get("assessment", {})
            actual = last.get("assessment") if isinstance(last, dict) else last
            checks.append(_check("Transition assessment", actual == expected if expected and actual else None, evidence=refs))
    else:
        checks.append(_check("Mechanism-specific causal grading", None, evidence=refs, unsupported=True,
                             detail="The existing core pipeline ran, but typed domain observations/detectors and evaluator are not implemented for this family."))
    for frame in frozen_frames:
        if not frame["observer"].get("supported", False):
            checks.append(_check("Observer representation", None, evidence=frame["observer"].get("nativeMemoryRefs", []),
                                 unsupported=True, detail=frame["observer"].get("limitations")))
    domain_scope = ({
        "gradingScope": "observed_visibility_and_conditional_motion_models",
        "identityAcrossGap": "not_established", "physicalCause": "not_established",
    } if test_id in {"occlusion_pole", "occlusion_large_object", "teleporter"} else {})
    return {**summary(checks), **domain_scope, "checks": checks, "oracleHash": oracle_hash,
            "inferenceFrozenBeforeOracleRead": True, "oracleGradingIsNativeObservedMemory": False}
