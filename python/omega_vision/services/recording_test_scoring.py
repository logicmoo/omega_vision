"""Evaluator-only grading of frozen observations. Never imported by observer hooks."""
from __future__ import annotations

import json
from pathlib import Path
from typing import Any

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
    elif test_id == "teleporter":
        oracle, oracle_hash = _oracle(home, directory, "evaluation.json")
        mismatch_frames = [frame for frame in frozen_frames if any(
            item["kind"] == "constant_speed_model_mismatch" for item in frame["observer"].get("observed", []))]
        authored_transits = sum(str(item.get("mechanismEvent")).startswith("departure:") for item in oracle["frames"])
        checks.append(_check("Observed motion mismatch versus no-jump control",
                             bool(mismatch_frames) == bool(authored_transits), evidence=refs))
        for frame in mismatch_frames:
            explanations = frame["observer"]["hypotheses"]
            checks.append(_check("Competing hidden causes retained",
                                 {"unseen acceleration or fast motion", "teleportation"} <=
                                 {item["explanation"] for item in explanations}
                                 and all(item["authoritative"] is False for item in explanations),
                                 evidence=frame["observer"]["nativeMemoryRefs"]))
        predictions = [prediction for frame in frozen_frames for prediction in frame["observer"].get("predictions", [])
                       if prediction.get("status") in {"correct", "incorrect"}]
        for prediction in predictions:
            checks.append(_check("Future-blind conditional association prediction",
                                 prediction["status"] == "correct" and all(
                                     item["after_seconds"] <= prediction["predictionObservationSeconds"]
                                     for item in prediction["evidence"]), evidence=refs))
        if authored_transits and not predictions:
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
    return {**summary(checks), "checks": checks, "oracleHash": oracle_hash,
            "inferenceFrozenBeforeOracleRead": True, "oracleGradingIsNativeObservedMemory": False}
