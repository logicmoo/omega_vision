"""Read-only projections of frozen test results and native fog-of-war memory."""
from __future__ import annotations

from io import BytesIO
import json
import re

from fastapi import HTTPException
from PIL import Image

from omega_vision.perception.observation_identity import content_hash

VERSION = "recording-test-reports-v1"
MAX_PIXELS = 1_048_576


def _raster(size, raw):
    if (not isinstance(size, (list, tuple)) or len(size) != 2
            or any(type(value) is not int or value <= 0 for value in size)
            or size[0] * size[1] > MAX_PIXELS or len(raw) != size[0] * size[1] * 4):
        raise ValueError("Native spotlight raster has invalid dimensions or pixel length")
    if set(raw[3::4]) - {0, 255}:
        raise ValueError("Native spotlight visibility is not binary")
    if any(raw[index:index + 3] != b"\0\0\0" for index in range(0, len(raw), 4) if raw[index + 3] == 0):
        raise ValueError("Native spotlight raster contains values in unobserved cells")
    return {"encoding": "rgba8_hex", "width": size[0], "height": size[1],
            "rgbaHex": raw.hex(), "pixelHash": content_hash(raw)}


def _native_raster(entry):
    value = entry.get("state", {}).get("spotlight")
    if not isinstance(value, dict) or not isinstance(value.get("rgbaHex"), str):
        raise ValueError("Native spotlight checkpoint has no supported raster")
    raw = bytes.fromhex(value["rgbaHex"])
    return _raster(value.get("size"), raw), raw


def _mask(size, values):
    raw = bytes(values)
    return {"encoding": "mask8_hex", "width": size[0], "height": size[1], "maskHex": raw.hex(),
            "setValue": 255, "clearValue": 0}


def _grading(home, state, position):
    from . import recording_test_execution as execution
    record = state["recordings"][position]
    if record["status"] != "completed":
        return {"visualSequenceId": record["visualSequenceId"], "status": "pending", "result": None}
    path = execution._path(home, *execution.ROOT, state["id"], "grading", f"{position:03d}.json")
    reference = "data/" + path.relative_to(home).as_posix()
    value = json.loads(path.read_text(encoding="utf-8"))
    if (record.get("gradingRef") != reference or not isinstance(value, dict)
            or record.get("gradingHash") != content_hash(value)
            or value.get("inferenceFrozenBeforeOracleRead") is not True
            or value.get("oracleGradingIsNativeObservedMemory") is not False
            or value.get("outcome") != record["outcome"] or not isinstance(value.get("checks"), list)):
        raise ValueError("Recording grading is corrupt or does not match its frozen run")
    return {"visualSequenceId": record["visualSequenceId"], "status": "available",
            "gradingRef": reference, "gradingHash": record["gradingHash"], "result": value}


def run_report(home, state):
    from . import recording_test_execution as execution
    execution._check_sources(home, state)
    return {"schemaVersion": 1, "version": VERSION, "run": execution._public(state),
            "grading": [_grading(home, state, index) for index in range(len(state["recordings"]))],
            "readOnly": True}


def frame_report(home, state, reference, frame_id):
    from . import recording_test_execution as execution
    from .recording_test_validation import (
        _frozen_prefix, _inputs_unchanged, _native_checkpoint, _producing_implementation,
    )
    if not isinstance(frame_id, str) or not re.fullmatch(r"0|[1-9][0-9]{0,5}", frame_id):
        raise HTTPException(422, "frame_id must be an actual canonical numbered input")
    positions = [index for index, record in enumerate(state["recordings"])
                 if record["visualSequenceId"] == reference]
    if len(positions) != 1:
        raise HTTPException(422, "The requested source does not belong to this run")
    if state["observer"] != "spotlight":
        raise HTTPException(409, "This raster report supports the native spotlight observer only")
    position, index = positions[0], int(frame_id)
    record = state["recordings"][position]
    if index >= record["processedFrames"]:
        raise HTTPException(404, "This frame has not been executed; no reconstruction is available")
    producing = _producing_implementation(state, position)
    observations = _inputs_unchanged(home, state, position, index)
    frames = _frozen_prefix(home, state, position, index)
    frozen = frames[-1]
    expected = state["sources"][position]
    current = expected["frames"][index]
    prefix = content_hash(expected["frames"][:index + 1])
    if (frozen.get("frameId") != frame_id or frozen.get("sourceBinding") != expected["binding"]
            or frozen.get("implementationBinding") != record["observerBinding"]
            or frozen.get("inputPrefixHash") != prefix
            or frozen.get("source", {}).get("visualSequenceId") != reference
            or any(frozen["source"].get(key) != value for key, value in current.items())):
        raise ValueError("Frozen frame does not match the requested source and causal boundary")
    observer = frozen["observer"]
    if observer.get("observer") != "spotlight" or observer.get("supported") is not True:
        raise HTTPException(409, {"message": "No supported native spotlight reconstruction",
                                  "limitations": observer.get("limitations", [])})
    native, _ = _native_checkpoint(home, state, position, index, frames)
    if (native["entryUid"] != observer["nativeCheckpointUid"] or native["source"] != frozen["source"]
            or native["inputPrefixHash"] != prefix or native["observed"] != observer["observed"]):
        raise ValueError("Frozen spotlight result disagrees with its native checkpoint")
    remembered, raw = _native_raster(native)
    size = (remembered["width"], remembered["height"])
    path = execution._path(home, *reference.split("/"), frame_id, "image.png")
    png = observations[-1].png
    if content_hash(png) != current["imageHash"]:
        raise ValueError("Current observation image differs from the frozen source")
    with Image.open(BytesIO(png)) as source:
        if source.mode != "RGBA" or source.size != size or set(source.getchannel("A").tobytes()) - {0, 255}:
            raise ValueError("Current observation lacks matching binary RGBA visibility")
        observed = bytearray(source.tobytes())
    for offset in range(0, len(observed), 4):
        if observed[offset + 3] == 0:
            observed[offset:offset + 3] = b"\0\0\0"
    current_raster = _raster(size, bytes(observed))
    known_mask = raw[3::4]
    previous_raw = bytes(len(raw))
    recorded_receipts = "nativeReadReceipts" in observer
    receipts = observer.get("nativeReadReceipts", [])
    if index:
        previous, _ = _native_checkpoint(home, state, position, index - 1, frames[:-1])
        previous_raster, previous_raw = _native_raster(previous)
        if (native["previousCheckpointUid"] != previous["entryUid"]
                or (previous_raster["width"], previous_raster["height"]) != size
                or recorded_receipts and len(receipts) != 1):
            raise ValueError("Spotlight memory predecessor is unavailable or mismatched")
        expected_read = {
            "entryUid": previous["entryUid"], "frameId": str(index - 1), "frameOrder": index - 1,
            "inputPrefixHash": content_hash(expected["frames"][:index]),
            "sourceBinding": expected["binding"], "implementationBinding": record["observerBinding"],
            "memoryRef": observer["nativeMemoryRefs"][1].rsplit("#", 1)[0] + "#" + previous["entryUid"],
        }
        if recorded_receipts and receipts[0] != expected_read:
            raise ValueError("Spotlight memory-read receipt exceeds or differs from its actual predecessor")
    elif native["previousCheckpointUid"] is not None or receipts:
        raise ValueError("Initial spotlight observation cannot claim earlier memory")
    expected_raw = bytearray(previous_raw)
    for offset in range(0, len(observed), 4):
        if observed[offset + 3] == 255:
            expected_raw[offset:offset + 4] = observed[offset:offset + 4]
    if bytes(expected_raw) != raw:
        raise ValueError("Native remembered scene is not the union of its earlier memory and current observation")
    newly_known = bytes(255 if after == 255 and before == 0 else 0
                        for before, after in zip(previous_raw[3::4], known_mask, strict=True))
    known = known_mask.count(255)
    total = size[0] * size[1]
    coverage = {"observedPixels": bytes(observed[3::4]).count(255),
                "knownPixels": known, "unknownPixels": total - known, "totalPixels": total,
                "newKnownPixels": newly_known.count(255), "knownFraction": known / total,
                "complete": known == total}
    union = next((item for item in native["observed"] if item.get("kind") == "visibility_union"), {})
    measured_keys = ("knownPixels", "unknownPixels", "newKnownPixels", "complete")
    if recorded_receipts or "observedPixels" in union:
        measured_keys += ("observedPixels",)
    if any(union.get(key) != coverage[key] for key in measured_keys):
        raise ValueError("Native visibility measurements disagree with the saved raster")
    if execution._read(home, state["id"]) != state:
        raise HTTPException(409, "Run changed during native image inspection; refresh")
    _inputs_unchanged(home, state, position, index)
    if _frozen_prefix(home, state, position, index) != frames:
        raise HTTPException(409, "Frozen observation evidence changed during native image inspection")
    current_native, _ = _native_checkpoint(home, state, position, index, frames)
    if current_native != native:
        raise HTTPException(409, "Native checkpoint changed during native image inspection")
    return {
        "schemaVersion": 1, "version": VERSION, "status": "available",
        "runId": state["id"], "runRevision": state["revision"], "testId": state["testId"], "visualSequenceId": reference,
        "frameId": frame_id, "frameOrder": index, "observer": "spotlight", "inferenceFrozen": True,
        "producingImplementation": producing, "inspectionMode": "frozen_checkpoint",
        "currentImplementationMatches": execution._versions() == state["versions"],
        "executionEligibility": "not_checked_by_read_only_inspection",
        "source": {**frozen["source"], "imageRef": "data/" + path.relative_to(home).as_posix()},
        "currentRecordedInput": execution._recorded_input(state, position, index),
        "nextRecordedInput": execution._recorded_input(state, position, index + 1),
        "currentObservation": current_raster,
        "rememberedScene": {**remembered, "authority": "observed_pixel_union_not_hidden_scene",
                            "nativeCheckpointUid": native["entryUid"]},
        "coverage": coverage,
        "masks": {"observed": _mask(size, observed[3::4]), "known": _mask(size, known_mask),
                  "unknown": _mask(size, (255 - value for value in known_mask)),
                  "newlyKnown": _mask(size, newly_known)},
        "memory": {"nativeCheckpointUid": native["entryUid"],
                   "previousCheckpointUid": native["previousCheckpointUid"],
                   "readCutoffExclusive": index, "readScope": "earlier_recording_level_stm",
                   "readReceipts": receipts, "writeRefs": observer["nativeMemoryRefs"],
                   "readReceiptStatus": "recorded" if recorded_receipts else "not_recorded_by_producer",
                   "nativeReadCutoffRecorded": recorded_receipts},
        "readScope": {"throughFrameInclusive": index, "sourceFrameCount": len(observations),
                     "nativeStorage": "frozen_frame_checkpoint", "recordingStmRead": False, "futureFramesRead": False},
        "scoring": {"recordingStatus": record["status"], "outcome": record["outcome"],
                    "gradingAvailable": record["status"] == "completed"},
        "limitations": observer.get("limitations", []), "readOnly": True,
    }
