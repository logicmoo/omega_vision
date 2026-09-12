"""Durable, explicitly requested causal execution of the file-backed test catalog."""
from __future__ import annotations

from datetime import datetime, timezone
from functools import wraps
import hashlib
import json
import math
import os
from pathlib import Path
import re
import threading
from typing import Any
from uuid import UUID, uuid4

from fastapi import APIRouter, Body, HTTPException, Query, Response
import psutil

from omega_vision.inherited_source_overlay import storage_path
from omega_vision.perception._event_journal import atomic_json, writer_lock
from omega_vision.perception.observation_identity import content_hash
from omega_vision.perception.contextual_memory import recording_context

from . import recording_test_observers as observers
from .recording_test_memory import ObservationMemory, native_execution
from .recording_test_scoring import score_recording, summary

router = APIRouter()
VERSION = "recording-test-execution-v2"
ROOT = ("runtime", "executions", "recording-tests")
_TOKEN = uuid4().hex
_OWNER = {"pid": os.getpid(), "started": psutil.Process().create_time(), "token": _TOKEN}
_THREADS: dict[str, threading.Thread] = {}
_OBSERVER = {
    "color_band_cycle": "color_band", "spotlight_scene": "spotlight",
    "spotlight_action_modes": "spotlight", "teleporter": "hidden_motion_portal",
    "occlusion_pole": "hidden_motion", "occlusion_large_object": "hidden_motion",
}
_TERMINAL = {"completed", "stopped", "stale", "error"}


def _now():
    return datetime.now(timezone.utc).isoformat()


def _http(function):
    @wraps(function)
    def guarded(*args, **kwargs):
        try:
            return function(*args, **kwargs)
        except HTTPException:
            raise
        except PermissionError as error:
            raise HTTPException(403, str(error)) from error
        except FileNotFoundError as error:
            raise HTTPException(404, str(error)) from error
        except (ValueError, OSError, TimeoutError, KeyError) as error:
            raise HTTPException(409, str(error)) from error
    return guarded


def _path(home: Path, *parts: str) -> Path:
    target = storage_path(home, *parts)
    if target != home.joinpath(*parts):
        raise PermissionError("Recording-test execution path was redirected")
    return target


def _run_id(value: str) -> str:
    try:
        parsed = UUID(value)
    except (ValueError, TypeError, AttributeError) as error:
        raise HTTPException(422, "Run ID must be a canonical UUID") from error
    if str(parsed) != value:
        raise HTTPException(422, "Run ID must be a canonical UUID")
    return value


def _catalog():
    from . import recording_tests
    return recording_tests


def _home(workspace_id):
    return _catalog()._home(workspace_id)


def _test(home, test_id):
    if not _catalog()._identifier(test_id):
        raise HTTPException(422, "Test ID must be a plain lowercase identifier")
    selected = next((item for item in _catalog()._index(home) or [] if item["id"] == test_id), None)
    if selected is None:
        raise HTTPException(404, "Recording test is unknown or unpublished")
    return selected


def _body(body, required, optional=()):
    if not isinstance(body, dict) or not required <= body.keys() or body.keys() - required - set(optional):
        raise HTTPException(422, f"Required fields: {', '.join(sorted(required))}; unexpected fields are rejected")
    if not isinstance(body.get("workspaceId"), str) or not body["workspaceId"]:
        raise HTTPException(422, "workspaceId is required")


def _versions():
    from . import video_import_semantics as semantics
    from . import two_frame_x_duction, video_import_api, video_import_abduction
    from omega_vision.perception.temporal_correspondence import implementation_hashes
    from omega_vision.perception.event_induction import engine_version
    from omega_vision.perception.event_deduction import implementation_version
    from omega_vision.perception import metta_memory, contextual_rules, candidate_rules
    from omega_vision.perception import hidden_motion_observer
    from omega_vision.evaluation import visual_memory_baselines, action_mechanism_recordings
    from . import recording_test_memory, recording_test_scoring, recording_test_learning
    modules = [Path(__file__), Path(semantics.__file__), Path(observers.__file__),
               Path(recording_test_memory.__file__), Path(recording_test_scoring.__file__),
               Path(recording_test_learning.__file__), Path(two_frame_x_duction.__file__),
               Path(video_import_api.__file__), Path(video_import_abduction.__file__),
               Path(metta_memory.__file__), Path(contextual_rules.__file__), Path(candidate_rules.__file__),
               Path(visual_memory_baselines.__file__), Path(action_mechanism_recordings.__file__),
               Path(hidden_motion_observer.__file__)]
    values = {path.name: hashlib.sha256(path.read_bytes()).hexdigest() for path in modules}
    return {"version": VERSION, "observerVersion": observers.VERSION,
            "modules": values, "perception": implementation_hashes(),
            "rules": engine_version(), "authoredDetector": implementation_version()}


def _source(home, reference):
    parts = reference["visualSequenceId"].split("/")
    if (len(parts) != 3 or parts[:2] != ["recordings", "events_tests"]
            or not _catalog()._identifier(parts[2])):
        raise HTTPException(422, "Run source must be a recording explicitly listed by this test")
    directory = _path(home, *parts)
    manifest_path = _path(home, *parts, "recording.json")
    raw = manifest_path.read_bytes()
    manifest = json.loads(raw)
    if not isinstance(manifest, dict):
        raise ValueError("Recording manifest must be an object")
    moves = manifest.get("moves")
    if (manifest.get("kind") != "arc3_play_recording" or manifest.get("game_id") != "events_tests"
            or manifest.get("game_directory") != "events_tests" or not isinstance(moves, list)
            or len(moves) != reference["frameCount"]):
        raise ValueError("Recording source manifest disagrees with the frozen test catalog")
    frames, previous_time = [], None
    visual_fingerprint = hashlib.sha256()
    from . import video_import_api as api
    preprocessing = _path(home, *parts, "preprocessing_chain.json")
    preprocessing_raw = preprocessing.read_bytes() if preprocessing.is_file() else None
    try:
        chain = api._load_preprocessing_chain_at(directory)
    except HTTPException as error:
        raise ValueError(f"Source preprocessing is unavailable: {error.detail}") from error
    if chain:
        raise ValueError("Recording tests currently require original pixels (an empty preprocessing chain); saved settings were not changed")
    for index, move in enumerate(moves):
        if (not isinstance(move, dict) or type(move.get("index")) is not int or move["index"] != index
                or move.get("directory") != f"data/{reference['visualSequenceId']}/{index}"):
            raise ValueError("Recording must have exact ordered numbered frames")
        image = _path(home, *parts, str(index), "image.png")
        state_path = _path(home, *parts, str(index), "state.json")
        png, state_raw = image.read_bytes(), state_path.read_bytes()
        visual_fingerprint.update(png)
        observation_metadata = _path(home, *parts, str(index), "observation_metadata.json")
        observation_hash = hashlib.sha256(observation_metadata.read_bytes()).hexdigest() if observation_metadata.is_file() else None
        state = json.loads(state_raw)
        if not isinstance(state, dict):
            raise ValueError("Frame state must be an object")
        at = state.get("at_seconds", move.get("at_seconds"))
        if (type(at) not in {int, float} or not math.isfinite(at) or at < 0
                or previous_time is not None and at <= previous_time):
            raise ValueError("Each frame needs explicit increasing acquisition times")
        action, data = state.get("incoming_action"), state.get("action_data", {})
        if action is not None and (not isinstance(action, str) or len(action) > 80):
            raise ValueError("Invalid actual input receipt")
        if not isinstance(data, dict) or set(data) - {"x", "y"}:
            raise ValueError("Only observable input coordinates are accepted")
        if any(type(value) not in {int, float} or not math.isfinite(value) for value in data.values()):
            raise ValueError("Invalid input coordinates")
        if move.get("action") != action or move.get("data", {}) != data:
            raise ValueError("Frame input receipt disagrees with its manifest")
        previous_time = at
        frames.append({"frameId": str(index), "order": index, "imageHash": hashlib.sha256(png).hexdigest(),
                       "stateHash": hashlib.sha256(state_raw).hexdigest(),
                       "observationMetadataHash": observation_hash,
                       "receipt": {"action": action, "data": data, "atSeconds": at}})
    preprocessing_hash = hashlib.sha256(preprocessing_raw).hexdigest() if preprocessing_raw is not None else None
    binding = content_hash({"manifest": hashlib.sha256(raw).hexdigest(), "frames": frames,
                            "preprocessing": preprocessing_hash, "pixelPolicy": "original"})
    return {"visualSequenceId": reference["visualSequenceId"], "binding": binding, "frames": frames,
            "manifestHash": hashlib.sha256(raw).hexdigest(), "preprocessingHash": preprocessing_hash,
            "pixelPolicy": "original", "visualFingerprint": visual_fingerprint.hexdigest()}


def _configuration(workspace_id, observer):
    if observer == "spotlight":
        return content_hash({"pixelPolicy": "original_rgba", "core": "not_applicable"})
    if observer in {"hidden_motion", "hidden_motion_portal"}:
        return content_hash({"pixelPolicy": "original_opaque", "core": "bounded_motion_hypotheses_not_events"})
    from . import video_import_api as api
    try:
        return content_hash(api._direct_specs(api._workspace_root(workspace_id)))
    except HTTPException as error:
        raise ValueError(f"Execution pipeline configuration is unavailable: {error.detail}") from error


def _state_path(home, run_id):
    return _path(home, *ROOT, _run_id(run_id), "state.json")


def _read(home, run_id):
    path = _state_path(home, run_id)
    if not path.is_file():
        raise HTTPException(404, "Recording-test run is unavailable")
    value = json.loads(path.read_text(encoding="utf-8"))
    if not isinstance(value, dict):
        raise ValueError("Recording-test run state is corrupt")
    digest = value.pop("stateHash", None)
    if (digest != content_hash(value) or value.get("id") != run_id
            or value.get("schemaVersion") != 1 or type(value.get("revision")) is not int):
        raise ValueError("Recording-test run state is corrupt")
    owner = value.get("owner")
    if (value.get("status") not in ("ready", "running", "stopping", "stopped", "completed", "interrupted", "stale", "error")
            or value.get("mode") not in ("step", "run") or not isinstance(value.get("recordings"), list)
            or not isinstance(value.get("sources"), list)
            or len(value["recordings"]) != len(value["sources"])
            or owner is not None and (
                not isinstance(owner, dict) or type(owner.get("pid")) is not int
                or type(owner.get("started")) not in (int, float) or not isinstance(owner.get("token"), str))):
        raise ValueError("Recording-test run state schema is corrupt")
    return value


def _save(home, state):
    state["updatedAt"] = _now()
    state["revision"] += 1
    atomic_json(_state_path(home, state["id"]), {**state, "stateHash": content_hash(state)})


def _lock(home, run_id, kind="control"):
    directory = _path(home, *ROOT, _run_id(run_id), kind)
    _path(home, *ROOT, run_id, kind, ".writer.lock")
    return writer_lock(directory, timeout=5)


def _owner_ended(state):
    owner = state.get("owner") or {}
    if owner.get("pid") == os.getpid() and owner.get("token") != _TOKEN:
        return True
    try:
        return psutil.Process(owner["pid"]).create_time() != owner["started"]
    except (KeyError, psutil.Error):
        return True


def _interrupted(state):
    active = state["status"] in {"running", "stopping"} or state["status"] == "ready" and state["mode"] == "run"
    return active and _owner_ended(state)


def _recorded_input(state, recording_index, frame_index):
    frames = state["sources"][recording_index]["frames"]
    if frame_index is None or not 0 <= frame_index < len(frames):
        return None
    frame = frames[frame_index]
    return {
        "visualSequenceId": state["recordings"][recording_index]["visualSequenceId"],
        "frameId": frame["frameId"], "frameOrder": frame["order"],
        **frame["receipt"],
        "status": "executed" if frame_index < state["recordings"][recording_index]["processedFrames"] else "queued",
        "source": "frozen_recording_input_script", "isOutcomeEvidence": False,
    }


def _public(state):
    result = {key: value for key, value in state.items()
              if key not in {"sources", "versions", "owner", "claim", "seedState", "seedRefs", "learningExamples"}}
    progress = state["progress"]
    result["currentRecordedInput"] = _recorded_input(state, progress["recordingIndex"], progress["frameIndex"])
    pending = next((index for index, record in enumerate(state["recordings"])
                   if record["processedFrames"] < record["frameCount"]), None)
    result["nextRecordedInput"] = (
        _recorded_input(state, pending, state["recordings"][pending]["processedFrames"])
        if pending is not None else None
    )
    if _interrupted(state):
        result.update(status="interrupted", recovery="Owner process ended; Step explicitly resumes the frozen causal cursor.")
    return result


def _current_public(home, state):
    result = _public(state)
    try:
        _check_sources(home, state)
    except (OSError, ValueError) as error:
        result.update(storedStatus=state["status"], storedOutcome=state["outcome"],
                      status="stale", outcome="inconclusive", error=str(error))
    return result


def _frame_path(home, run_id, recording, frame):
    return _path(home, *ROOT, run_id, "frames", f"{recording:03d}-{frame:06d}.json")


def _frozen_frame(path):
    value = json.loads(path.read_text(encoding="utf-8"))
    if not isinstance(value, dict) or value.pop("receiptHash", None) != content_hash(value) or value.get("inferenceFrozen") is not True:
        raise ValueError("Frozen frame receipt is corrupt")
    return value


def _native_entry(home, state, recording_index, frame_index):
    reference = state["recordings"][recording_index]["visualSequenceId"]
    context = recording_context(home, _path(home, *reference.split("/")), str(frame_index))
    memory = ObservationMemory(context)
    candidates = memory.read(observer=state["observer"], source_binding=state["sources"][recording_index]["binding"],
                             implementation_binding=state["recordings"][recording_index]["observerBinding"],
                             before=frame_index + 1)
    matches = [entry for entry in candidates if entry["causal"]["frameOrder"] == frame_index]
    if len(matches) != 1:
        raise ValueError("Completed frame lacks a unique native STM checkpoint")
    return matches[0]


def _prepare_seed(home, state, index):
    if state["observer"] != "color_band":
        return {}, []
    evidence, refs = {}, []
    for position, recording in enumerate(state["recordings"][:index]):
        if recording["status"] != "completed" or not recording["partition"].startswith("train"):
            continue
        checkpoint = _native_entry(home, state, position, recording["frameCount"] - 1)
        for item in checkpoint["state"].get("colorEvidence", []):
            evidence[content_hash(item)] = item
        refs.append(checkpoint["entryUid"])
    return {"colorEvidence": [evidence[key] for key in sorted(evidence)]}, refs


def _core_frame(workspace_id, reference, index, *, rgba_visibility=False, native_hidden_motion=False):
    from . import video_import_api as api, video_import_semantics as semantics
    from omega_vision.perception.direct_transform_plan import plan_direct_call
    root, units = semantics._units(workspace_id, "data/" + reference)
    directory, _, catalog = api._sequence_execution_context(root, "data/" + reference, workspace_id)
    unit = units[index]
    unit["sourceImage"] = unit.get("sourceImage", unit["image"])
    if rgba_visibility:
        return unit, {"status": "not_applicable", "reason": "Visibility-aware static-scene observation; do not infer object appearance from unknown alpha pixels."}
    if native_hidden_motion:
        return unit, {
            "status": "not_applicable",
            "reason": "Original-pixel/earlier-STM motion hypotheses, not accepted temporal identity or physical events.",
        }
    if index == 0:
        from omega_vision.perception.metta_memory import MeTTaMemoryDatabase
        home = api._vision_data_root(root)
        context = recording_context(home, directory, unit["id"])
        if not MeTTaMemoryDatabase(home, context.stm_area(), "observation").read():
            for role in ("shape", "object"):
                MeTTaMemoryDatabase(home, context.stm_area(), role).initialize_empty()
    specs = api._direct_specs(root)
    plan = plan_direct_call(semantics.LOG, specs, catalog["frame_ids_in_order"],
                           catalog["frame_ids_in_order"][:index + 1], ordered=True)
    for node in plan:
        if node.blocked:
            raise ValueError("Core causal dependencies are unavailable: " + ", ".join(node.blocked))
        current = units[catalog["frame_ids_in_order"].index(node.frame_id)]
        if current["frameOrder"] > index:
            raise PermissionError("Core plan attempted to read a future frame")
        current = semantics._prepare(current)
        spec = specs[node.output]
        dependencies = spec.get("firstFrameDependsOn", spec.get("dependsOn", [])) if not current["frameOrder"] else spec.get("dependsOn", [])
        result = api.run_transform_step(current, spec["transformation"], spec["doer"], spec.get("options", {}),
                                        depends_on=dependencies,
                                        depends_on_resolved=api._stamp_resolved_deps(current, dependencies, catalog))
        if result["status"] not in {"written", "skipped"}:
            raise RuntimeError(f"Core stage {node.output} did not complete: {result}")
    from .two_frame_x_duction import FAMILY
    parent_step = f"{FAMILY}/deduction"
    parent = specs[parent_step]
    dependencies = parent["firstFrameDependsOn"] if not index else parent["dependsOn"]
    result = api.run_transform_step(unit, *parent_step.split("/"), parent.get("options", {}),
                                   depends_on=dependencies,
                                   depends_on_resolved=api._stamp_resolved_deps(unit, dependencies, catalog))
    if result["status"] not in {"written", "skipped"}:
        raise RuntimeError(f"Parent deduction did not complete: {result}")
    frame = semantics._frame(unit)
    temporal = semantics._result(unit, semantics.TEMPORAL)
    temporal_summary = semantics._json(semantics._artifact(unit, semantics.TEMPORAL, "summary.json"))
    input_status = temporal_summary.get("inputReceiptStatus")
    limitations = []
    if input_status:
        limitations.append(input_status["reason"])
    if temporal.get("interval", {}).get("unsupported"):
        limitations.append("Physical speed unavailable: " + temporal["interval"]["unsupported"])
    events = semantics._result(unit, semantics.EVENTS)
    refs = ["data/" + semantics._artifact(unit, step).relative_to(api._vision_data_root(root)).as_posix()
            for step in (semantics.IDENTITY, semantics.TEMPORAL, semantics.OBJECTS, semantics.EVENTS, semantics.LOG, parent_step)]
    return unit, {"status": "completed", "events": events, "tracks": temporal["checkpoint"]["tracks"],
                  "groups": [{"uid": group.uid, "points": list(group.points)} for group in frame.groups],
                  "evidenceRefs": refs, "observedFrameUid": frame.uid,
                  "inputReceiptStatus": input_status, "limitations": limitations,
                  "parent": semantics._result(unit, parent_step)}


def _compute_frame(home, state, recording_index, frame_index):
    from . import video_import_api as api, video_import_semantics as semantics
    record = state["recordings"][recording_index]
    source = state["sources"][recording_index]
    current = source["frames"][frame_index]
    prefix_hash = content_hash(source["frames"][:frame_index + 1])
    evidence_source = {"visualSequenceId": record["visualSequenceId"], **current,
                       "decisionSeconds": current["receipt"]["atSeconds"]}
    with native_execution(home, "data/" + record["visualSequenceId"]):
        unit, core = _core_frame(state["workspaceId"], record["visualSequenceId"], frame_index,
                                 rgba_visibility=state["observer"] == "spotlight",
                                 native_hidden_motion=state["observer"] in {"hidden_motion", "hidden_motion_portal"})
        unit["_recordingTestObservation"] = {
            "observer": state["observer"], "sourceBinding": source["binding"],
            "implementationBinding": record["observerBinding"], "inputPrefixHash": prefix_hash,
            "previousPrefixHash": content_hash(source["frames"][:frame_index]) if frame_index else None,
            "source": evidence_source, "receipt": current["receipt"],
            "learn": record["partition"].startswith("train"), "seedState": record.get("seedState", {}),
            "seedRefs": record.get("seedRefs", []), "coreEvidenceRefs": core.get("evidenceRefs", []),
            "coreAssessment": core.get("events", {}).get("assessment"),
            "coreLimitations": core.get("limitations", []),
        }
        result = api.run_transform_step(unit, *observers.STEP.split("/"), {
            "version": record["observerBinding"], "sourceBinding": source["binding"], "prefixHash": prefix_hash,
        }, force=True)
        if result["status"] not in {"written", "skipped"}:
            raise RuntimeError(f"Native observer did not complete: {result}")
        observer = semantics._result(unit, observers.STEP)
    return {"frameId": str(frame_index), "source": evidence_source, "core": core, "observer": observer,
            "inferenceFrozen": True, "inputPrefixHash": prefix_hash, "sourceBinding": source["binding"],
            "implementationBinding": record["observerBinding"]}


def _check_sources(home, state):
    if _versions() != state["versions"]:
        raise ValueError("Implementation changed; create a new bound run rather than resuming stale inference")
    if _configuration(state["workspaceId"], state["observer"]) != state["configurationHash"]:
        raise ValueError("Execution pipeline configuration changed; the frozen run is stale")
    for reference, expected in zip(state["recordings"], state["sources"], strict=True):
        if _source(home, reference) != expected:
            raise ValueError("Recording source changed; this run is stale and requires an explicit new run")


def _finish_recording(home, state, position):
    reference = state["recordings"][position]
    frames = [_frozen_frame(_frame_path(home, state["id"], position, index))
              for index in range(reference["frameCount"])]
    native = _native_entry(home, state, position, reference["frameCount"] - 1)
    score = score_recording(home, _path(home, *reference["visualSequenceId"].split("/")), state["testId"], frames, native)
    path = _path(home, *ROOT, state["id"], "grading", f"{position:03d}.json")
    atomic_json(path, score)
    reference.update(status="completed", outcome=score["outcome"],
                     score={key: value for key, value in score.items() if key != "checks"},
                     gradingRef="data/" + path.relative_to(home).as_posix(),
                     gradingHash=content_hash(score))
    state["score"] = summary([{"outcome": recording["outcome"]} for recording in state["recordings"]
                              if recording["status"] == "completed"])
    if state["learn"] and state["observer"] not in {"spotlight", "hidden_motion", "hidden_motion_portal"}:
        from .recording_test_learning import update_learning
        update_learning(home, state, position)


def step_run(home, run_id, expected_revision, *, worker=False):
    _read(home, run_id)
    with _lock(home, run_id):
        state = _read(home, run_id)
        if type(expected_revision) is not int or expected_revision != state["revision"]:
            raise HTTPException(409, "Run revision changed; refresh before stepping")
        if not worker and state["mode"] == "run" and state["status"] not in _TERMINAL:
            if state["status"] != "interrupted" and not _owner_ended(state):
                raise HTTPException(409, "The background runner owns this run; Stop it rather than stepping concurrently")
            state["mode"] = "step"
        if state["status"] in {"running", "stopping"} and state.get("claim") and not _interrupted(state):
            raise HTTPException(409, "A causal frame is already executing")
        try:
            _check_sources(home, state)
        except (OSError, ValueError) as error:
            state.update(status="stale", outcome="inconclusive", error=str(error), claim=None)
            _save(home, state)
            return _public(state)
        if state["status"] in _TERMINAL:
            return _public(state)
        if state.get("stopRequested"):
            state.update(status="stopped", claim=None)
            _save(home, state)
            return _public(state)
        position = next(index for index, item in enumerate(state["recordings"]) if item["status"] != "completed")
        record = state["recordings"][position]
        index = record["processedFrames"]
        if not index:
            seed, refs = _prepare_seed(home, state, position)
            record.update(seedState=seed, seedRefs=refs,
                          observerBinding=content_hash({"versions": state["versions"], "observer": state["observer"],
                                                       "configuration": state["configurationHash"],
                                                       "source": state["sources"][position]["binding"],
                                                       "seed": seed, "seedRefs": refs, "partition": record["partition"]}))
        claim = uuid4().hex
        state.update(status="running", owner=_OWNER, claim=claim)
        _save(home, state)
    try:
        with _lock(home, run_id, "computation"):
            path = _frame_path(home, run_id, position, index)
            if path.exists():
                frame = _frozen_frame(path)
                if (frame.get("sourceBinding") != state["sources"][position]["binding"]
                        or frame.get("implementationBinding") != record["observerBinding"]
                        or frame.get("inputPrefixHash") != content_hash(state["sources"][position]["frames"][:index + 1])):
                    raise ValueError("Existing frozen frame receipt conflicts with this execution")
                native = _native_entry(home, state, position, index)
                if frame["observer"]["nativeCheckpointUid"] != native["entryUid"]:
                    raise ValueError("Frozen frame receipt does not match its native checkpoint")
            else:
                frame = _compute_frame(home, state, position, index)
                _check_sources(home, state)
                atomic_json(path, {**frame, "receiptHash": content_hash(frame)})
            state["recordings"][position]["processedFrames"] = index + 1
            if index + 1 == record["frameCount"]:
                _finish_recording(home, state, position)
            with _lock(home, run_id):
                latest = _read(home, run_id)
                if latest.get("claim") != claim:
                    raise ValueError("Execution claim changed during the causal frame")
                for key in ("recordings", "score", "candidates", "learning", "learningExamples", "limitations"):
                    if key in state:
                        latest[key] = state[key]
                latest["progress"].update(processedFrames=latest["progress"]["processedFrames"] + 1,
                                          recordingIndex=position, frameIndex=index)
                latest["evidence"].append({
                    "visualSequenceId": record["visualSequenceId"], "frameId": str(index),
                    "sourceHash": frame["source"]["imageHash"], "atSeconds": frame["source"]["receipt"]["atSeconds"],
                    "decisionSeconds": frame["source"]["decisionSeconds"],
                    "nativeCheckpointUid": frame["observer"]["nativeCheckpointUid"],
                    "memoryRefs": frame["observer"]["nativeMemoryRefs"],
                    "frameResultRef": "data/" + path.relative_to(home).as_posix(),
                    "observed": frame["observer"]["observed"], "predictions": frame["observer"]["predictions"],
                    "hypotheses": frame["observer"]["hypotheses"],
                    "coreStatus": frame["core"]["status"],
                    "recognizedEventAssessment": frame["core"].get("events", {}).get("assessment"),
                    "coreEvidenceRefs": frame["core"].get("evidenceRefs", []),
                })
                latest["limitations"] = sorted(set(latest["limitations"] + frame["observer"].get("limitations", [])))
                complete = latest["progress"]["processedFrames"] == latest["progress"]["totalFrames"]
                if complete and latest["learn"]:
                    learning_outcome = latest.get("learning", {}).get("outcome", "unsupported")
                    latest["score"] = summary([{"outcome": recording["outcome"]} for recording in latest["recordings"]]
                                               + [{"outcome": learning_outcome}])
                latest.update(status="completed" if complete else "stopped" if latest.get("stopRequested") else "ready",
                              claim=None)
                latest["outcome"] = latest["score"]["outcome"] if complete else "not_scored"
                if complete and len(latest["recordings"]) < latest["fullTestRecordingCount"]:
                    latest["limitations"].append("Selected-recording result only; the full test family was not run.")
                _save(home, latest)
                return _public(latest)
    except Exception as error:
        with _lock(home, run_id):
            latest = _read(home, run_id)
            latest.update(status="error", outcome="inconclusive", error=str(error), claim=None)
            _save(home, latest)
            return _public(latest)


def _worker(home, run_id):
    try:
        while True:
            state = _read(home, run_id)
            if state["status"] in _TERMINAL:
                break
            result = step_run(home, run_id, state["revision"], worker=True)
            if result["status"] in _TERMINAL:
                break
    except Exception as error:
        with _lock(home, run_id):
            state = _read(home, run_id)
            if state["status"] not in _TERMINAL:
                state.update(status="stopped" if state.get("stopRequested") else "interrupted",
                             outcome="inconclusive", error=str(error), claim=None)
                _save(home, state)
    finally:
        _THREADS.pop(run_id, None)


@router.post("/{test_id}/runs")
@_http
def create_run(test_id: str, body: dict[str, Any] = Body(...)):
    _body(body, {"workspaceId", "mode", "memory"}, {"visualSequenceId", "learn"})
    if not isinstance(body["mode"], str) or body["mode"] not in {"run", "step"} or type(body.get("learn", False)) is not bool:
        raise HTTPException(422, "mode must be run/step and learn must be boolean")
    memory = body["memory"]
    if (not isinstance(memory, dict) or set(memory) != {"mode", "confirmed"}
            or memory["mode"] != "native_stm" or memory["confirmed"] is not True):
        raise HTTPException(409, "Durable test execution requires explicit confirmed native_stm memory. Nowhere stays browser RAM; nothing was written.")
    home = _home(body["workspaceId"])
    test = _test(home, test_id)
    if test_id == "spotlight_action_modes" and body.get("learn", False):
        raise HTTPException(409, "Action-mode contrasts reuse identical visual evidence; independent rule induction/promotion is unavailable.")
    selected = [item for item in test["recordings"]
                if "visualSequenceId" not in body or item["visualSequenceId"] == body["visualSequenceId"]]
    if not selected:
        raise HTTPException(422, "The selected recording is not a member of this test")
    selected = sorted(selected, key=lambda item: 0 if item["partition"].startswith("train") else
                      1 if item["partition"].startswith("valid") else 2)
    sources = [_source(home, reference) for reference in selected]
    versions = _versions()
    observer = _OBSERVER.get(test_id, "core")
    configuration_hash = _configuration(body["workspaceId"], observer)
    run_id = str(uuid4())
    state = {
        "schemaVersion": 1, "id": run_id, "testId": test_id, "workspaceId": body["workspaceId"],
        "mode": body["mode"], "memory": body["memory"], "learn": body.get("learn", False),
        "status": "ready", "outcome": "not_scored", "revision": 0, "createdAt": _now(),
        "sources": sources, "versions": versions, "implementationBinding": content_hash(versions),
        "observer": observer, "configurationHash": configuration_hash,
        "fullTestRecordingCount": len(test["recordings"]),
        "scope": "selected_recording" if "visualSequenceId" in body else "full_test",
        "recordings": [{**item, "status": "ready", "outcome": "not_scored", "processedFrames": 0, "score": None,
                        "visualFingerprint": source["visualFingerprint"],
                        "visualFingerprintAlgorithm": "sha256_ordered_png_bytes"}
                       for item, source in zip(selected, sources, strict=True)],
        "progress": {"processedFrames": 0, "totalFrames": sum(item["frameCount"] for item in selected),
                     "recordingIndex": 0, "frameIndex": None},
        "score": summary([]), "evidence": [], "candidates": [], "limitations": [],
        "stopRequested": False, "owner": _OWNER if body["mode"] == "run" else None, "claim": None,
    }
    if test_id == "spotlight_action_modes":
        state["evidencePolicy"] = {"kind": "action_mode_contrast", "independentVisualTrials": False,
                                   "promotionEligible": False}
        state["limitations"].append(
            "Action-mode recordings reuse the same visual trace; they are not independent positive or held-out promotion examples."
        )
    _state_path(home, run_id)
    with _lock(home, run_id):
        _save(home, state)
    if body["mode"] == "run":
        worker = threading.Thread(target=_worker, args=(home, run_id), name=f"recording-test-{run_id}", daemon=True)
        _THREADS[run_id] = worker
        worker.start()
    return _public(state)


@router.get("/runs/{run_id}")
@_http
def get_run(run_id: str, response: Response, workspaceId: str = Query(...)):
    response.headers["Cache-Control"] = "no-store"
    home = _home(workspaceId)
    return _current_public(home, _read(home, _run_id(run_id)))


@router.get("/runs/{run_id}/frames/{frame_id}")
@_http
def get_frame_report(run_id: str, frame_id: str, response: Response,
                     workspaceId: str = Query(...), visualSequenceId: str = Query(...)):
    """Read an executed fog frame and its actual native remembered raster."""
    from .recording_test_reports import frame_report
    response.headers["Cache-Control"] = "no-store"
    home = _home(workspaceId)
    return frame_report(home, _read(home, _run_id(run_id)), visualSequenceId, frame_id)


@router.get("/runs/{run_id}/report")
@_http
def get_report(run_id: str, response: Response, workspaceId: str = Query(...)):
    """Read grading separately from source-only native observation memory."""
    from .recording_test_reports import run_report
    response.headers["Cache-Control"] = "no-store"
    home = _home(workspaceId)
    return run_report(home, _read(home, _run_id(run_id)))


@router.post("/runs/{run_id}/frames/{frame_id}/validate")
@_http
def validate_native_frame(run_id: str, frame_id: str, response: Response, body: dict[str, Any] = Body(...)):
    """Assert knowledge without executing a frame, observing gold, or modifying memory."""
    from .recording_test_validation import validate_frame
    _body(body, {"workspaceId", "visualSequenceId", "action", "expectedRevision",
                 "expectedSourceHash", "expectedNativeCheckpointUid"})
    if not isinstance(body["visualSequenceId"], str):
        raise HTTPException(422, "visualSequenceId is required")
    response.headers["Cache-Control"] = "no-store"
    home = _home(body["workspaceId"])
    return validate_frame(home, _read(home, _run_id(run_id)), body["visualSequenceId"], frame_id, body)


@router.post("/runs/{run_id}/step")
@_http
def step(run_id: str, body: dict[str, Any] = Body(...)):
    _body(body, {"workspaceId", "expectedRevision"})
    return step_run(_home(body["workspaceId"]), _run_id(run_id), body["expectedRevision"])


@router.post("/runs/{run_id}/stop")
@_http
def stop(run_id: str, body: dict[str, Any] = Body(...)):
    _body(body, {"workspaceId"})
    home = _home(body["workspaceId"])
    _read(home, run_id)
    with _lock(home, run_id):
        state = _read(home, run_id)
        if state["status"] not in _TERMINAL:
            state.update(stopRequested=True, status="stopping" if state.get("claim") and not _interrupted(state) else "stopped")
            _save(home, state)
        return _public(state)


@router.get("/{test_id}/runs")
@_http
def history(test_id: str, response: Response, workspaceId: str = Query(...)):
    response.headers["Cache-Control"] = "no-store"
    home = _home(workspaceId)
    _test(home, test_id)
    runs = []
    for directory in _path(home, *ROOT).glob("*"):
        if not re.fullmatch(r"[0-9a-f]{8}(?:-[0-9a-f]{4}){3}-[0-9a-f]{12}", directory.name):
            continue
        state = _read(home, directory.name)
        if state["testId"] == test_id:
            runs.append(_current_public(home, state))
    runs.sort(key=lambda item: (item["createdAt"], item["id"]), reverse=True)
    return {"runs": runs, "count": len(runs)}


@router.post("/runs/{run_id}/candidates/{candidate_id}/approve")
@_http
def approve(run_id: str, candidate_id: str, body: dict[str, Any] = Body(...)):
    _body(body, {"workspaceId", "expectedRevision", "confirmed", "approvedBy"}, {"activation"})
    if body["confirmed"] is not True or not isinstance(body["approvedBy"], str) or not body["approvedBy"].strip():
        raise HTTPException(422, "Approval must explicitly identify its reviewer")
    home = _home(body["workspaceId"])
    _read(home, run_id)
    with _lock(home, run_id):
        state = _read(home, run_id)
        if (type(body["expectedRevision"]) is not int or state["revision"] != body["expectedRevision"]
                or state.get("claim") or state["mode"] == "run" and state["status"] not in _TERMINAL):
            raise HTTPException(409, "Run is changing; refresh before approving")
        _check_sources(home, state)
        from .recording_test_learning import approve_candidate
        candidate = approve_candidate(home, state, candidate_id, body)
        state["candidates"] = [candidate if item["id"] == candidate_id else item for item in state["candidates"]]
        _save(home, state)
        return {"run": _public(state), "candidate": candidate}
