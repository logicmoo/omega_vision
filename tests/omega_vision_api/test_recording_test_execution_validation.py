from copy import deepcopy
import hashlib
from pathlib import Path

import pytest
from PIL import Image

from omega_vision.perception.contextual_memory import recording_context
from omega_vision.perception.metta_memory import MeTTaMemoryDatabase
from omega_vision.perception.native_memory_validation import ACTION
from omega_vision.perception.observation_identity import content_hash
from omega_vision.services import recording_test_execution as execution
from omega_vision.services import recording_test_observers as observers
from omega_vision.services.recording_test_memory import ObservationMemory

from test_recording_test_execution import PREFIX, advance, create, finish_steps, fingerprints, publish, service
from test_recording_test_execution_spotlight import fog_clips, frame_report


def request_for(run, index=0):
    record = run["recordings"][0]["visualSequenceId"]
    evidence = next(item for item in run["evidence"]
                    if item["visualSequenceId"] == record and item["frameId"] == str(index))
    return {
        "workspaceId": "arc3_random_player", "visualSequenceId": record, "action": ACTION,
        "expectedRevision": run["revision"], "expectedSourceHash": evidence["sourceHash"],
        "expectedNativeCheckpointUid": evidence["nativeCheckpointUid"],
    }


def validate(client, run, index=0, **changes):
    body = {**request_for(run, index), **changes}
    return client.post(f"{PREFIX}/runs/{run['id']}/frames/{index}/validate", json=body)


def forbid_validation_side_effects(monkeypatch):
    def forbidden(*args, **kwargs):
        pytest.fail("A read-only validation attempted to observe, execute or write")
    monkeypatch.setattr(observers, "observe", forbidden)
    monkeypatch.setattr(execution, "_compute_frame", forbidden)
    monkeypatch.setattr(execution, "_save", forbidden)
    monkeypatch.setattr(execution, "atomic_json", forbidden)
    monkeypatch.setattr(ObservationMemory, "save", forbidden)
    monkeypatch.setattr(MeTTaMemoryDatabase, "append", forbidden)


def test_full_known_assertion_uses_only_prefix_and_frame_checkpoint_and_never_writes(service, monkeypatch):
    home, client = service
    clip, = fog_clips("train_a")
    publish(home, "spotlight_scene", [clip])
    run = finish_steps(client, create(client, "spotlight_scene"))
    assert run["outcome"] == "passed"
    producing_versions = execution._read(home, run["id"])["versions"]
    monkeypatch.setattr(execution, "_versions", lambda: {"runner": "a-new-producing-version"})
    monkeypatch.setattr(execution, "_configuration", lambda *args: pytest.fail("Do not resolve current execution settings"))
    directory = home / "recordings" / "events_tests" / clip.name
    before = fingerprints(home)
    original_bytes, original_text = Path.read_bytes, Path.read_text
    cutoff = 0
    def check(path):
        assert path.name not in {"evaluation.json", "expected_events.json"}, "Validation read a teacher/evaluator"
        if path.is_relative_to(directory):
            parts = path.relative_to(directory).parts
            assert not any(part.endswith("_stm") for part in parts), "Validation opened STM containing future payloads"
            if parts and parts[0].isdecimal():
                assert int(parts[0]) <= cutoff, f"Validation read future frame data: {path}"
        runtime = home.joinpath(*execution.ROOT, run["id"], "frames")
        if path.is_relative_to(runtime):
            assert int(path.stem.split("-")[1]) <= cutoff, "Validation read a future frozen receipt"
    def guarded_bytes(path):
        check(path)
        return original_bytes(path)
    def guarded_text(path, *args, **kwargs):
        check(path)
        return original_text(path, *args, **kwargs)
    monkeypatch.setattr(Path, "read_bytes", guarded_bytes)
    monkeypatch.setattr(Path, "read_text", guarded_text)
    forbid_validation_side_effects(monkeypatch)
    first = validate(client, run)
    assert first.status_code == 200, first.text
    initial = first.json()
    assert initial["action"] == ACTION and initial["outcome"] == "failed"
    assert initial["assessment"] == "incomplete" and initial["unknownPixels"] > 0
    assert initial["readScope"]["sourceFrameCount"] == 1
    assert initial["readScope"]["recordingStmRead"] is False
    assert initial["readScope"]["futureFramesRead"] is False
    assert [item["frameOrder"] for item in initial["evidence"]] == [0]
    assert initial["producingImplementation"]["versions"] == producing_versions
    assert initial["currentImplementationMatches"] is False
    image = frame_report(client, run, "0")
    assert image.status_code == 200, image.text
    assert image.json()["currentImplementationMatches"] is False
    assert image.json()["rememberedScene"]["pixelHash"] == initial["nativeRgbaHash"]
    assert image.json()["readScope"]["recordingStmRead"] is False
    cutoff = len(clip.frames) - 1
    last = validate(client, run, cutoff, workspaceId="second_workspace")
    assert last.status_code == 200, last.text
    complete = last.json()
    assert complete["outcome"] == "passed" and complete["assessment"] == "complete_and_justified"
    assert complete["knownPixels"] == complete["observedPixels"] == complete["totalPixels"] == 48 * 32
    assert complete["unknownPixels"] == 0 and not any(complete["violations"].values())
    assert complete["nativeCheckpointUid"] == run["evidence"][-1]["nativeCheckpointUid"]
    assert complete["runRevision"] == run["revision"]
    assert complete["producingImplementation"]["versions"] == producing_versions
    assert all(complete[key] is False for key in ("runModified", "memoryModified", "observerExecuted", "validationStored"))
    assert last.headers["cache-control"] == "no-store"
    after = {path.relative_to(home).as_posix(): (hashlib.sha256(original_bytes(path)).hexdigest(), path.stat().st_mtime_ns)
             for path in home.rglob("*") if path.is_file() and path.name != ".writer.lock"}
    assert after == before


def test_v1_native_image_remains_inspectable_without_inventing_receipts_but_step_stays_stale(service, monkeypatch):
    home, client = service
    monkeypatch.setattr(execution, "_versions", lambda: {"version": "recording-test-execution-v1"})
    clip, = fog_clips("control_revisit")
    publish(home, "spotlight_scene", [clip])
    run = advance(client, create(client, "spotlight_scene"))
    state = execution._read(home, run["id"])
    native = execution._native_entry(home, state, 0, 0)
    observed = deepcopy(native["observed"])
    for item in observed:
        item.pop("observedPixels", None)
    directory = home / "recordings" / "events_tests" / clip.name
    memory = ObservationMemory(recording_context(home, directory, "0"))
    legacy = memory.save(
        observer=native["observer"], source_binding=native["sourceBinding"],
        implementation_binding=native["implementationBinding"], input_prefix_hash=native["inputPrefixHash"],
        source=native["source"], state=native["state"], observed=observed,
        predictions=native["predictions"], hypotheses=native["hypotheses"],
        previous_uid=None, dependencies=native["evidenceRefs"],
    )
    path = execution._frame_path(home, run["id"], 0, 0)
    frozen = execution._frozen_frame(path)
    frozen["observer"].update(version="recording-test-observers-v1", observed=observed,
                              nativeCheckpointUid=legacy["entryUid"], nativeMemoryRefs=legacy["memoryRefs"])
    frozen["observer"].pop("nativeReadReceipts")
    frozen["observer"].pop("nativeReadCutoffExclusive")
    execution.atomic_json(path, {**frozen, "receiptHash": content_hash(frozen)})
    state["evidence"][0].update(observed=observed, nativeCheckpointUid=legacy["entryUid"], memoryRefs=legacy["memoryRefs"])
    execution._save(home, state)
    run = execution._public(state)
    monkeypatch.setattr(execution, "_versions", lambda: {"version": "recording-test-execution-v2"})
    before_step = {key: value for key, value in fingerprints(home).items() if key.endswith(".metta")}
    run = advance(client, run)
    assert run["status"] == "stale" and "Implementation changed" in run["error"]
    assert run["progress"]["processedFrames"] == 1
    assert {key: value for key, value in fingerprints(home).items() if key.endswith(".metta")} == before_step
    future = directory / "1" / "image.png"
    future.write_bytes(future.read_bytes() + b"unobserved future changed")
    before = fingerprints(home)
    forbid_validation_side_effects(monkeypatch)
    response = frame_report(client, run, "0")
    assert response.status_code == 200, response.text
    value = response.json()
    assert value["inspectionMode"] == "frozen_checkpoint" and value["currentImplementationMatches"] is False
    assert value["producingImplementation"]["versions"]["version"] == "recording-test-execution-v1"
    assert value["memory"]["readReceiptStatus"] == "not_recorded_by_producer"
    assert value["memory"]["nativeReadCutoffRecorded"] is False
    assert value["memory"]["readReceipts"] == []
    assert value["coverage"]["knownPixels"] > 0 and value["coverage"]["unknownPixels"] > 0
    checked = validate(client, run)
    assert checked.status_code == 200, checked.text
    assert checked.json()["outcome"] == "failed" and checked.json()["assessment"] == "incomplete"
    assert checked.json()["nativeRgbaHash"] == value["rememberedScene"]["pixelHash"]
    assert checked.json()["runStatus"] == "stale"
    assert fingerprints(home) == before


def rewrite_native_claim(home, run, change):
    state = execution._read(home, run["id"])
    native = execution._native_entry(home, state, 0, 0)
    image_state = deepcopy(native["state"])
    raw = bytearray.fromhex(image_state["spotlight"]["rgbaHex"])
    known = next(index for index in range(0, len(raw), 4) if raw[index + 3] == 255)
    unknown = next(index for index in range(0, len(raw), 4) if raw[index + 3] == 0)
    change(raw, known, unknown)
    image_state["spotlight"]["rgbaHex"] = raw.hex()
    directory = execution._path(home, *state["recordings"][0]["visualSequenceId"].split("/"))
    memory = ObservationMemory(recording_context(home, directory, "0"))
    changed = memory.save(
        observer=native["observer"], source_binding=native["sourceBinding"],
        implementation_binding=native["implementationBinding"], input_prefix_hash=native["inputPrefixHash"],
        source=native["source"], state=image_state, observed=native["observed"],
        predictions=native["predictions"], hypotheses=native["hypotheses"],
        previous_uid=native["previousCheckpointUid"], dependencies=native["evidenceRefs"],
    )
    path = execution._frame_path(home, run["id"], 0, 0)
    frozen = execution._frozen_frame(path)
    frozen["observer"].update(nativeCheckpointUid=changed["entryUid"], nativeMemoryRefs=changed["memoryRefs"])
    execution.atomic_json(path, {**frozen, "receiptHash": content_hash(frozen)})
    state["evidence"][0].update(nativeCheckpointUid=changed["entryUid"], memoryRefs=changed["memoryRefs"])
    execution._save(home, state)
    return execution._public(state)


@pytest.mark.parametrize("problem,violation", [
    ("all_known", "known_without_observation"),
    ("future_correct_value", "known_without_observation"),
    ("wrong_color", "known_value_mismatch"),
    ("hidden_rgb", "unobserved_rgb_payload"),
    ("forgotten", "forgotten_observation"),
    ("unsupported_alpha", "unsupported_native_or_observation_schema"),
])
def test_bound_but_unjustified_native_claim_fails_without_repair(service, monkeypatch, problem, violation):
    home, client = service
    clip, = fog_clips("train_a" if problem == "future_correct_value" else "control_revisit")
    publish(home, "spotlight_scene", [clip])
    run = advance(client, create(client, "spotlight_scene"))
    def change(raw, known, unknown):
        if problem == "all_known":
            for index in range(3, len(raw), 4):
                raw[index] = 255
        elif problem == "future_correct_value":
            with Image.open(home / "recordings" / "events_tests" / clip.name / "1" / "image.png") as future:
                pixels = future.tobytes()
            index = next(offset for offset in range(0, len(raw), 4)
                         if raw[offset + 3] == 0 and pixels[offset + 3] == 255)
            raw[index:index + 4] = pixels[index:index + 4]
        elif problem == "wrong_color":
            raw[known] = (raw[known] + 1) % 256
        elif problem == "hidden_rgb":
            raw[unknown:unknown + 3] = b"\x21\x43\x65"
        elif problem == "forgotten":
            raw[known:known + 4] = b"\0\0\0\0"
        else:
            raw[known + 3] = 128
    run = rewrite_native_claim(home, run, change)
    before = fingerprints(home)
    forbid_validation_side_effects(monkeypatch)
    response = validate(client, run)
    assert response.status_code == 200, response.text
    value = response.json()
    assert value["outcome"] == "failed" and value["violations"][violation] > 0
    assert value["assessment"] in {"invalid_claim", "unsupported_claim"}
    assert value["validationHash"] == content_hash({key: item for key, item in value.items() if key != "validationHash"})
    assert value["validatorImplementation"]["version"]
    assert len(value["validatorImplementation"]["validatorHash"]) == 64
    assert value["memoryModified"] is value["observerExecuted"] is value["runModified"] is False
    assert fingerprints(home) == before


@pytest.mark.parametrize("binding", ["expectedRevision", "expectedSourceHash", "expectedNativeCheckpointUid", "action"])
def test_validation_rejects_unbound_assertions_without_changing_cursor(service, monkeypatch, binding):
    home, client = service
    clip, = fog_clips("control_revisit")
    publish(home, "spotlight_scene", [clip])
    run = advance(client, create(client, "spotlight_scene"))
    before = fingerprints(home)
    changes = {binding: run["revision"] - 1 if binding == "expectedRevision"
               else "CLICK" if binding == "action" else "0" * 64}
    forbid_validation_side_effects(monkeypatch)
    response = validate(client, run, **changes)
    assert response.status_code in {409, 422}, response.text
    assert fingerprints(home) == before


def test_changed_observed_source_is_not_repaired_or_replaced_during_validation(service, monkeypatch):
    home, client = service
    clip, = fog_clips("control_revisit")
    publish(home, "spotlight_scene", [clip])
    run = advance(client, create(client, "spotlight_scene"))
    image = home / "recordings" / "events_tests" / clip.name / "0" / "image.png"
    image.write_bytes(image.read_bytes() + b"source changed")
    before = fingerprints(home)
    forbid_validation_side_effects(monkeypatch)
    response = validate(client, run)
    assert response.status_code == 409 and "source-prefix" in response.text
    assert fingerprints(home) == before
