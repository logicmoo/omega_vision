import hashlib
import json
from pathlib import Path
import time

import pytest
from PIL import Image

from omega_vision.evaluation import visual_memory_recordings as visual
from omega_vision.evaluation import event_recordings as events
from omega_vision.services import recording_test_execution as execution
from omega_vision.services import recording_test_observers as observers
from omega_vision.services import video_import_api as api

from test_recording_test_execution import (
    MEMORY, PREFIX, advance, create, finish_steps, fingerprints, publish, service,
)


def fog_clips(*suffixes):
    return [clip for clip in visual.visual_memory_clips()
            if clip.family == "spotlight_scene" and clip.suffix in suffixes]


def frame_report(client, run, frame_id, *, workspace="arc3_random_player", reference=None):
    return client.get(f"{PREFIX}/runs/{run['id']}/frames/{frame_id}", params={
        "workspaceId": workspace,
        "visualSequenceId": reference or run["recordings"][0]["visualSequenceId"],
    })


def report(client, run, *, workspace="arc3_random_player"):
    return client.get(f"{PREFIX}/runs/{run['id']}/report", params={"workspaceId": workspace})


def test_fog_versions_bind_loaded_runtime_and_observer_contracts(monkeypatch):
    current = execution._versions()
    assert current["version"] == "recording-test-execution-v2"
    assert current["observerVersion"] == "recording-test-observers-v2"
    with monkeypatch.context() as patch:
        patch.setattr(execution, "VERSION", "recording-test-execution-v1")
        assert execution._versions() != current
    with monkeypatch.context() as patch:
        patch.setattr(observers, "VERSION", "recording-test-observers-v1")
        assert execution._versions() != current


def test_recorded_input_queue_is_display_metadata_not_future_observer_evidence(service, monkeypatch):
    home, client = service
    clip, = fog_clips("control_revisit")
    publish(home, "spotlight_scene", [clip])
    observed = observers.OBSERVERS["spotlight"]
    seen = []
    def current_only(frame, prior):
        assert "nextRecordedInput" not in prior
        assert not hasattr(frame, "nextRecordedInput")
        seen.append(frame.action)
        return observed(frame, prior)
    monkeypatch.setitem(observers.OBSERVERS, "spotlight", current_only)
    run = create(client, "spotlight_scene")
    assert run["currentRecordedInput"] is None
    assert run["nextRecordedInput"]["frameId"] == "0"
    assert run["nextRecordedInput"]["status"] == "queued"
    assert run["nextRecordedInput"]["isOutcomeEvidence"] is False
    assert seen == [], "Preparing the recorded queue must not execute it"
    for index in range(2):
        run = advance(client, run)
        assert run["currentRecordedInput"]["frameId"] == str(index)
        assert run["currentRecordedInput"]["status"] == "executed"
        assert run["currentRecordedInput"]["action"] == clip.frames[index].action
        assert run["nextRecordedInput"]["frameId"] == str(index + 1)
        assert run["nextRecordedInput"]["action"] == clip.frames[index + 1].action
        assert run["nextRecordedInput"]["status"] == "queued"
        value = frame_report(client, run, str(index)).json()
        assert value["currentRecordedInput"] == run["currentRecordedInput"]
        assert value["nextRecordedInput"] == run["nextRecordedInput"]
        frozen = execution._frozen_frame(execution._frame_path(home, run["id"], 0, index))
        assert "nextRecordedInput" not in frozen["observer"]
    assert seen == [frame.action for frame in clip.frames[:2]]


def test_additive_fog_action_modes_bind_spotlight_scoring_without_independent_promotion(service, monkeypatch):
    from omega_vision.evaluation.fog_action_recordings import TEST_ID, fog_action_files
    home, client = service
    events.publish_recording_files(home, fog_action_files())
    before = fingerprints(home)
    response = client.get(f"{PREFIX}/{TEST_ID}", params={"workspaceId": "arc3_random_player"})
    assert response.status_code == 200, response.text
    test = response.json()
    assert test["id"] == "spotlight_action_modes" and len(test["recordings"]) == 2
    assert test["executionStatus"] == "not_run" and test["documentation"]
    assert fingerprints(home) == before
    rejected = client.post(f"{PREFIX}/{TEST_ID}/runs", json={
        "workspaceId": "arc3_random_player", "mode": "step", "memory": MEMORY, "learn": True,
    })
    assert rejected.status_code == 409 and "independent" in rejected.text
    assert fingerprints(home) == before
    monkeypatch.setattr(api, "_list_image_sets", lambda *a: pytest.fail("No unrelated sequence catalog lookup"))
    finals, runs, first_actions = [], [], []
    for reference in test["recordings"]:
        run = create(client, TEST_ID, visualSequenceId=reference["visualSequenceId"])
        assert execution._read(home, run["id"])["observer"] == "spotlight"
        assert run["evidencePolicy"] == {
            "kind": "action_mode_contrast", "independentVisualTrials": False, "promotionEligible": False,
        }
        run = advance(client, advance(client, run))
        first_actions.append(run["currentRecordedInput"]["action"])
        run = finish_steps(client, run)
        assert run["outcome"] == "passed" and run["candidates"] == [], run
        assert all(entry["coreStatus"] == "not_applicable" for entry in run["evidence"])
        frame = frame_report(client, run, str(run["progress"]["frameIndex"]))
        assert frame.status_code == 200, frame.text
        value = frame.json()
        assert value["coverage"]["complete"] is True
        finals.append(value["rememberedScene"]["rgbaHex"])
        assert report(client, run).json()["grading"][0]["result"]["outcome"] == "passed"
        runs.append(run)
    assert first_actions[0] in {"MOVE_POINTER", "RIGHT", "LEFT", "UP", "DOWN"}
    assert first_actions[1] == "CLICK"
    assert finals[0] == finals[1]
    assert runs[0]["recordings"][0]["visualFingerprint"] == runs[1]["recordings"][0]["visualFingerprint"]
    assert all(run["recordings"][0]["visualFingerprintAlgorithm"] == "sha256_ordered_png_bytes" for run in runs)
    assert all(not list(home.rglob(name))
               for name in ("induced_rules.metta", "induction_rules.metta", "deduction_rules.metta"))
    after = fingerprints(home)
    assert all(after[path] == value for path, value in before.items())


def test_selected_fog_train_steps_native_memory_and_read_only_reports_without_oracle_inputs(service, monkeypatch):
    home, client = service
    clips = fog_clips("train_a", "control_revisit")
    publish(home, "spotlight_scene", clips)
    reference = "recordings/events_tests/spotlight_scene_train_a"
    original_files = fingerprints(home)
    original_read = Path.read_bytes
    original_score = execution.score_recording
    original_observer = observers.OBSERVERS["spotlight"]
    grading = False
    observations = 0

    def guarded_read(path):
        if path.name in {"evaluation.json", "expected_events.json"}:
            assert grading, "Observer/report attempted to load evaluator-only scene data"
        return original_read(path)

    def guarded_score(root, directory, test_id, frames, native):
        nonlocal grading
        assert all(frame["inferenceFrozen"] for frame in frames)
        assert native["causal"]["frameOrder"] == len(frames) - 1
        grading = True
        try:
            return original_score(root, directory, test_id, frames, native)
        finally:
            grading = False

    def observed(current, prior):
        nonlocal observations
        assert current.previous_png is None, "Fog must read native earlier memory, not reload earlier scene images"
        assert ("spotlight" in prior) is (observations > 0)
        observations += 1
        return original_observer(current, prior)

    def snapshot():
        return {path.relative_to(home).as_posix(): (hashlib.sha256(original_read(path)).hexdigest(), path.stat().st_mtime_ns)
                for path in home.rglob("*") if path.is_file() and path.name != ".writer.lock"}

    monkeypatch.setattr(Path, "read_bytes", guarded_read)
    monkeypatch.setattr(execution, "score_recording", guarded_score)
    monkeypatch.setitem(observers.OBSERVERS, "spotlight", observed)
    monkeypatch.setattr(api, "_list_image_sets", lambda *a: pytest.fail("Fog execution must not enumerate the catalog"))
    run = create(client, "spotlight_scene", visualSequenceId=reference)
    assert run["scope"] == "selected_recording" and run["progress"]["processedFrames"] == 0
    assert run["outcome"] == "not_scored"
    before = snapshot()
    assert frame_report(client, run, "0").status_code == 404
    initial_report = report(client, run)
    assert initial_report.status_code == 200 and initial_report.json()["grading"][0]["status"] == "pending"
    assert snapshot() == before
    seen = []
    union = None
    while run["status"] not in execution._TERMINAL:
        run = advance(client, run)
        index = run["progress"]["frameIndex"]
        before = snapshot()
        response = frame_report(client, run, str(index))
        assert response.status_code == 200, response.text
        assert response.headers["cache-control"] == "no-store"
        value = response.json()
        assert snapshot() == before
        current = bytes.fromhex(value["currentObservation"]["rgbaHex"])
        remembered = bytes.fromhex(value["rememberedScene"]["rgbaHex"])
        union = bytearray(len(current)) if union is None else union
        old_known = bytes(union[3::4]).count(255)
        for offset in range(0, len(current), 4):
            if current[offset + 3] == 255:
                union[offset:offset + 4] = current[offset:offset + 4]
            else:
                assert current[offset:offset + 3] == b"\0\0\0"
        assert remembered == bytes(union), "Remembered scene must contain only pixels observed by this causal frame"
        known_mask = bytes.fromhex(value["masks"]["known"]["maskHex"])
        unknown_mask = bytes.fromhex(value["masks"]["unknown"]["maskHex"])
        assert known_mask == remembered[3::4]
        assert unknown_mask == bytes(255 - byte for byte in known_mask)
        assert value["coverage"]["knownPixels"] == known_mask.count(255)
        assert value["coverage"]["newKnownPixels"] == known_mask.count(255) - old_known
        assert value["memory"]["readCutoffExclusive"] == index
        assert value["memory"]["readScope"] == "earlier_recording_level_stm"
        if index:
            receipt, = value["memory"]["readReceipts"]
            assert receipt["frameOrder"] == index - 1
            assert receipt["entryUid"] == seen[-1]["memory"]["nativeCheckpointUid"]
        else:
            assert value["memory"]["readReceipts"] == []
        assert value["memory"]["nativeCheckpointUid"] == run["evidence"][-1]["nativeCheckpointUid"]
        assert all(ref.endswith("#" + value["memory"]["nativeCheckpointUid"]) for ref in value["memory"]["writeRefs"])
        assert value["scoring"]["outcome"] == ("passed" if run["status"] == "completed" else "not_scored")
        assert run["evidence"][-1]["coreStatus"] == "not_applicable"
        seen.append(value)
    assert run["status"] == "completed" and run["outcome"] == "passed", run
    assert observations == run["progress"]["totalFrames"]
    assert seen[-1]["coverage"]["complete"] is True
    assert any("full test family was not run" in item for item in run["limitations"])
    before = snapshot()
    final = report(client, run, workspace="another_workspace")
    assert final.status_code == 200, final.text
    result = final.json()
    assert result["run"]["id"] == run["id"] and result["run"]["outcome"] == "passed"
    grade = result["grading"][0]["result"]
    assert grade["checks"] and grade["inferenceFrozenBeforeOracleRead"] is True
    assert grade["oracleGradingIsNativeObservedMemory"] is False
    earlier = frame_report(client, run, "0", workspace="another_workspace").json()
    assert earlier["rememberedScene"] == seen[0]["rememberedScene"]
    assert earlier["coverage"]["knownPixels"] < seen[-1]["coverage"]["knownPixels"]
    assert snapshot() == before
    after = snapshot()
    assert all(after[path] == value for path, value in original_files.items())
    control = home / "recordings" / "events_tests" / "spotlight_scene_control_revisit"
    assert not list(control.rglob("visual_observations.metta"))
    assert not list(home.rglob("objects_tracking_0"))
    assert not run["candidates"]


def test_fog_report_revisit_retains_unknowns_and_exact_shared_native_identity(service):
    home, client = service
    clip, = fog_clips("control_revisit")
    publish(home, "spotlight_scene", [clip])
    first = finish_steps(client, create(client, "spotlight_scene"))
    last = str(first["progress"]["frameIndex"])
    value = frame_report(client, first, last).json()
    assert value["coverage"]["unknownPixels"] > 0 and value["coverage"]["newKnownPixels"] == 0
    assert value["scoring"]["outcome"] == "passed"
    before = {name: data for name, data in fingerprints(home).items() if name.endswith(".metta")}
    second = finish_steps(client, create(client, "spotlight_scene", workspaceId="second_workspace"))
    other = frame_report(client, second, last, workspace="second_workspace").json()
    assert other["memory"] == value["memory"] and other["rememberedScene"] == value["rememberedScene"]
    assert {name: data for name, data in fingerprints(home).items() if name.endswith(".metta")} == before


def test_fog_reports_reject_wrong_source_future_frames_and_corrupt_grading_without_writes(service):
    home, client = service
    clip, = fog_clips("control_revisit")
    publish(home, "spotlight_scene", [clip])
    run = advance(client, create(client, "spotlight_scene"))
    before = fingerprints(home)
    for frame in ("01", "-1", "999999"):
        response = frame_report(client, run, frame)
        assert response.status_code in {404, 422}
    response = frame_report(client, run, "0", reference="recordings/events_tests/another")
    assert response.status_code == 422
    assert frame_report(client, run, "1").status_code == 404
    assert fingerprints(home) == before
    run = finish_steps(client, run)
    path = execution._path(home, *execution.ROOT, run["id"], "grading", "000.json")
    value = json.loads(path.read_text())
    value["checks"][0]["outcome"] = "failed"
    path.write_text(json.dumps(value))
    before = fingerprints(home)
    response = report(client, run)
    assert response.status_code == 409 and "grading is corrupt" in response.text
    assert fingerprints(home) == before


def test_fog_nowhere_creates_no_run_or_payload_and_reports_never_synthesize_unexecuted_memory(service):
    home, client = service
    clip, = fog_clips("control_revisit")
    publish(home, "spotlight_scene", [clip])
    before = fingerprints(home)
    response = client.post(f"{PREFIX}/spotlight_scene/runs", json={
        "workspaceId": "arc3_random_player", "mode": "step",
        "memory": {"mode": "nowhere", "confirmed": True},
    })
    assert response.status_code == 409 and "Nowhere" in response.text
    assert fingerprints(home) == before
    assert not (home / "runtime" / "executions" / "recording-tests").exists()
    run = create(client, "spotlight_scene")
    before = fingerprints(home)
    assert frame_report(client, run, "0").status_code == 404
    assert report(client, run).json()["run"]["outcome"] == "not_scored"
    assert fingerprints(home) == before


def test_explicit_fog_run_completes_without_exposing_unknown_rgb_or_auto_promoting(service):
    home, client = service
    clip, = fog_clips("control_revisit")
    publish(home, "spotlight_scene", [clip])
    reference = f"recordings/events_tests/{clip.name}"
    path = home / "recordings" / "events_tests" / clip.name / "0" / "image.png"
    with Image.open(path) as source:
        image = source.copy()
    for y in range(image.height):
        for x in range(image.width):
            if image.getpixel((x, y))[3] == 0:
                image.putpixel((x, y), (211, 91, 137, 0))
    image.save(path)
    run = create(client, "spotlight_scene", mode="run", visualSequenceId=reference)
    deadline = time.monotonic() + 60
    while run["id"] in execution._THREADS and time.monotonic() < deadline:
        time.sleep(0.05)
    assert run["id"] not in execution._THREADS
    response = report(client, run)
    assert response.status_code == 200, response.text
    final = response.json()["run"]
    assert final["status"] == "completed" and final["outcome"] == "passed"
    assert final["candidates"] == [] and final["scope"] == "selected_recording"
    assert final["nextRecordedInput"] is None
    assert final["currentRecordedInput"]["frameId"] == str(len(clip.frames) - 1)
    value = frame_report(client, final, "0").json()
    for field in ("currentObservation", "rememberedScene"):
        raw = bytes.fromhex(value[field]["rgbaHex"])
        assert all(raw[index:index + 3] == b"\0\0\0" for index in range(0, len(raw), 4)
                   if raw[index + 3] == 0)
