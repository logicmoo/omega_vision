"""Explicit, read-only assertions over bound native fog checkpoints."""
from __future__ import annotations

from pathlib import Path
import re

from fastapi import HTTPException

from omega_vision.perception.contextual_memory import recording_context
from omega_vision.perception.native_memory_validation import VisibilityObservation
from omega_vision.perception.observation_identity import content_hash

from .recording_test_memory import ObservationMemory


def _implementation():
    from omega_vision.perception import native_memory_validation as validator
    return {
        "version": validator.VERSION,
        "validatorHash": content_hash(Path(validator.__file__).read_bytes()),
        "adapterHash": content_hash(Path(__file__).read_bytes()),
    }


def _target(state, reference, frame_id, body):
    if type(body["expectedRevision"]) is not int or body["expectedRevision"] != state["revision"]:
        raise HTTPException(409, "Run revision changed; refresh before validating")
    if state.get("claim") or state["status"] in {"running", "stopping"}:
        raise HTTPException(409, "An execution is in flight; validate a stable frozen frame")
    if state["observer"] != "spotlight":
        raise HTTPException(409, "VALIDATE_MUST_BE_KNOWN requires a native spotlight checkpoint")
    if state.get("memory") != {"mode": "native_stm", "confirmed": True}:
        raise HTTPException(409, "This run has no confirmed persistent native memory binding")
    for key in ("expectedSourceHash", "expectedNativeCheckpointUid"):
        if not isinstance(body[key], str) or not re.fullmatch(r"[0-9a-f]{64}", body[key]):
            raise HTTPException(422, f"{key} must be the exact frozen SHA-256 binding")
    if not re.fullmatch(r"0|[1-9][0-9]{0,5}", frame_id):
        raise HTTPException(422, "frame_id must be a canonical numbered frame")
    positions = [index for index, record in enumerate(state["recordings"])
                 if record["visualSequenceId"] == reference]
    if len(positions) != 1:
        raise HTTPException(422, "The requested recording does not belong to this run")
    position, index = positions[0], int(frame_id)
    if index >= state["recordings"][position]["processedFrames"]:
        raise HTTPException(404, "The specified frame has not been executed")
    return position, index


def _inputs_unchanged(home, state, position, index):
    """Verify only source metadata and the actual eligible image/state prefix."""
    from . import recording_test_execution as execution
    source = state["sources"][position]
    reference = state["recordings"][position]["visualSequenceId"]
    parts = reference.split("/")
    if len(parts) != 3 or parts[:2] != ["recordings", "events_tests"]:
        raise HTTPException(409, "Frozen recording has an unsupported source identity")
    manifest = execution._path(home, *parts, "recording.json")
    if content_hash(manifest.read_bytes()) != source["manifestHash"]:
        raise HTTPException(409, "Recording manifest changed; this frozen run is stale")
    preprocessing = execution._path(home, *parts, "preprocessing_chain.json")
    preprocessing_hash = content_hash(preprocessing.read_bytes()) if preprocessing.is_file() else None
    if preprocessing_hash != source["preprocessingHash"] or source["pixelPolicy"] != "original":
        raise HTTPException(409, "Original-pixel source binding changed")
    observations = []
    for order in range(index + 1):
        expected = source["frames"][order]
        if expected["frameId"] != str(order) or expected["order"] != order:
            raise ValueError("Frozen source prefix has an invalid order")
        image = execution._path(home, *parts, str(order), "image.png")
        png = image.read_bytes()
        receipt = execution._path(home, *parts, str(order), "state.json")
        metadata = execution._path(home, *parts, str(order), "observation_metadata.json")
        metadata_hash = content_hash(metadata.read_bytes()) if metadata.is_file() else None
        if (content_hash(png) != expected["imageHash"]
                or content_hash(receipt.read_bytes()) != expected["stateHash"]
                or metadata_hash != expected.get("observationMetadataHash")):
            raise HTTPException(409, "An observed source-prefix frame changed; validation cannot substitute new inputs")
        observations.append(VisibilityObservation(
            sequence_id=reference, frame_order=order,
            source_ref="data/" + image.relative_to(home).as_posix(),
            image_hash=expected["imageHash"], png=png,
        ))
    return observations


def _producing_implementation(state, position):
    record = state["recordings"][position]
    binding = content_hash({
        "versions": state["versions"], "observer": state["observer"],
        "configuration": state["configurationHash"], "source": state["sources"][position]["binding"],
        "seed": record["seedState"], "seedRefs": record["seedRefs"], "partition": record["partition"],
    })
    if (state["implementationBinding"] != content_hash(state["versions"])
            or record["observerBinding"] != binding):
        raise ValueError("Frozen producing implementation does not match its recorded binding")
    return {"versions": state["versions"], "implementationBinding": state["implementationBinding"],
            "observerBinding": binding, "configurationHash": state["configurationHash"]}


def _frozen_prefix(home, state, position, index):
    from . import recording_test_execution as execution
    record, source = state["recordings"][position], state["sources"][position]
    frames = []
    for order in range(index + 1):
        path = execution._frame_path(home, state["id"], position, order)
        frame = execution._frozen_frame(path)
        expected = source["frames"][order]
        if (frame.get("frameId") != str(order) or frame.get("sourceBinding") != source["binding"]
                or frame.get("implementationBinding") != record["observerBinding"]
                or frame.get("inputPrefixHash") != content_hash(source["frames"][:order + 1])
                or frame.get("source", {}).get("visualSequenceId") != record["visualSequenceId"]
                or any(frame["source"].get(key) != value for key, value in expected.items())
                or frame.get("observer", {}).get("observer") != "spotlight"):
            raise ValueError("Frozen observation prefix does not match this execution")
        evidence = [item for item in state["evidence"]
                    if item["visualSequenceId"] == record["visualSequenceId"] and item["frameId"] == str(order)]
        if (len(evidence) != 1 or evidence[0]["sourceHash"] != expected["imageHash"]
                or evidence[0]["nativeCheckpointUid"] != frame["observer"]["nativeCheckpointUid"]
                or evidence[0]["frameResultRef"] != "data/" + path.relative_to(home).as_posix()):
            raise ValueError("Run evidence does not identify this frozen frame")
        frames.append(frame)
    return frames


def _native_checkpoint(home, state, position, index, frames):
    from . import recording_test_execution as execution
    record, source = state["recordings"][position], state["sources"][position]
    directory = execution._path(home, *record["visualSequenceId"].split("/"))
    context = recording_context(home, directory, str(index))
    memory = ObservationMemory(context)
    frame = frames[-1]
    uid = frame["observer"]["nativeCheckpointUid"]
    # The immutable frame copy has the same identity as its published STM entry.
    # Do not open a recording STM database containing later checkpoint payloads.
    matches = [entry for entry in memory.frame.read() if entry["entryUid"] == uid]
    if len(matches) != 1:
        raise ValueError("A unique frozen native frame checkpoint is required")
    native = matches[0]
    memory._validate(native)
    expected_previous = frames[-2]["observer"]["nativeCheckpointUid"] if index else None
    refs = ["data/" + database.path.relative_to(home).as_posix() + "#" + uid
            for database in (memory.frame, memory.stm)]
    if (native["observer"] != "spotlight" or native["sourceBinding"] != source["binding"]
            or native["implementationBinding"] != record["observerBinding"]
            or native["causal"]["frameOrder"] != index or native["source"] != frame["source"]
            or native["inputPrefixHash"] != frame["inputPrefixHash"]
            or native["previousCheckpointUid"] != expected_previous
            or native["observed"] != frame["observer"]["observed"]
            or frame["observer"]["nativeMemoryRefs"] != refs):
        raise ValueError("Native checkpoint is not bound to the requested frozen observation")
    read_receipts = frame["observer"].get("nativeReadReceipts")
    if index and expected_previous not in native["evidenceRefs"]:
        raise ValueError("Native checkpoint lacks its predecessor dependency")
    if ("nativeReadReceipts" not in frame["observer"]
            and "nativeReadCutoffExclusive" not in frame["observer"]
            and state["versions"].get("version") == "recording-test-execution-v1"):
        # V1 stored the dependency chain but not read receipts. Do not invent them.
        return native, refs[0]
    if (frame["observer"].get("nativeReadCutoffExclusive") != index
            or not isinstance(read_receipts, list) or len(read_receipts) != (1 if index else 0)):
        raise ValueError("Native checkpoint lacks the actual causal read receipt")
    if index:
        expected_read = {
            "entryUid": expected_previous, "frameId": str(index - 1), "frameOrder": index - 1,
            "memoryRef": "data/" + memory.stm.path.relative_to(home).as_posix() + "#" + expected_previous,
            "inputPrefixHash": content_hash(source["frames"][:index]),
            "sourceBinding": source["binding"], "implementationBinding": record["observerBinding"],
        }
        if read_receipts[0] != expected_read or expected_previous not in native["evidenceRefs"]:
            raise ValueError("Native checkpoint predecessor is not supported by its read receipt")
    return native, refs[0]


def validate_frame(home, state, reference, frame_id, body):
    from omega_vision.perception import native_memory_validation as validator
    from . import recording_test_execution as execution
    if body["action"] != validator.ACTION:
        raise HTTPException(422, "The only supported assertion is VALIDATE_MUST_BE_KNOWN")
    position, index = _target(state, reference, frame_id, body)
    producing = _producing_implementation(state, position)
    implementation = _implementation()
    observations = _inputs_unchanged(home, state, position, index)
    frames = _frozen_prefix(home, state, position, index)
    frozen = frames[-1]
    if (body["expectedSourceHash"] != frozen["source"]["imageHash"]
            or body["expectedNativeCheckpointUid"] != frozen["observer"]["nativeCheckpointUid"]):
        raise HTTPException(409, "Validation source/checkpoint binding changed; refresh the native image")
    native, native_ref = _native_checkpoint(home, state, position, index, frames)
    state_value = native.get("state")
    claim = state_value.get("spotlight") if isinstance(state_value, dict) else None
    try:
        result = validator.validate_must_be_known(
            claim, observations, sequence_id=reference, frame_order=index,
        )
        unsupported = False
    except ValueError as error:
        result = {"action": validator.ACTION, "validationVersion": validator.VERSION,
                  "outcome": "failed", "complete": False,
                  "violations": {"unsupported_native_or_observation_schema": 1},
                  "detail": str(error), "memoryModified": False, "observerExecuted": False}
        unsupported = True
    other_violations = {key: count for key, count in result["violations"].items()
                        if key != "unknown_required_pixel" and count}
    assessment = ("complete_and_justified" if result["outcome"] == "passed" else
                  "unsupported_claim" if unsupported else "invalid_claim" if other_violations else "incomplete")
    latest = execution._read(home, state["id"])
    if latest != state or latest["revision"] != body["expectedRevision"] or latest.get("claim"):
        raise HTTPException(409, "Run changed during validation; refresh and retry")
    if _implementation() != implementation:
        raise HTTPException(409, "Validator implementation changed during the assertion")
    _inputs_unchanged(home, state, position, index)
    if _frozen_prefix(home, state, position, index) != frames:
        raise HTTPException(409, "Frozen observation evidence changed during validation")
    current_native, _ = _native_checkpoint(home, state, position, index, frames)
    if current_native != native:
        raise HTTPException(409, "Native checkpoint changed during validation")
    result = {
        **result, "schemaVersion": 1, "status": "completed", "assessment": assessment,
        "runId": state["id"], "runRevision": state["revision"], "runStatus": state["status"], "testId": state["testId"],
        "visualSequenceId": reference, "frameId": frame_id, "frameOrder": index,
        "sourceHash": frozen["source"]["imageHash"], "nativeCheckpointUid": native["entryUid"],
        "sourceBinding": native["sourceBinding"], "inputPrefixHash": native["inputPrefixHash"],
        "implementationBinding": native["implementationBinding"], "validatorImplementation": implementation,
        "producingImplementation": producing, "inspectionMode": "frozen_checkpoint",
        "currentImplementationMatches": execution._versions() == state["versions"],
        "executionEligibility": "not_checked_by_read_only_inspection",
        "nativeReadRef": native_ref,
        "readScope": {"throughFrameInclusive": index, "sourceFrameCount": len(observations),
                      "nativeStorage": "frozen_frame_checkpoint", "recordingStmRead": False, "futureFramesRead": False},
        "readOnly": True, "runModified": False, "memoryModified": False,
        "observerExecuted": False, "validationStored": False,
    }
    return {**result, "validationHash": content_hash(result)}
