import hashlib
import json
import threading
import time
from pathlib import Path
from uuid import uuid4

from fastapi import FastAPI
from fastapi.testclient import TestClient
import pytest

from omega_vision.evaluation import event_recordings as events
from omega_vision.evaluation.event_recording_cases import Body, Case, Expected, Frame
from omega_vision.evaluation import visual_memory_recordings as visual
from omega_vision.evaluation import action_mechanism_recordings as mechanisms
from omega_vision.perception.contextual_memory import recording_context
from omega_vision.perception.event_records import Term
from omega_vision.perception.metta_memory import MeTTaMemoryDatabase
from omega_vision.services import recording_tests as catalog
from omega_vision.services import recording_test_execution as execution
from omega_vision.services import recording_test_observers as observers
from omega_vision.services import video_import_api as api
from omega_vision.services import video_import_semantics as semantics
from omega_vision.services.recording_test_memory import ObservationMemory

PREFIX = "/workbench/recognition/recording-tests"
MEMORY = {"mode": "native_stm", "confirmed": True}


def fingerprints(root):
    return {path.relative_to(root).as_posix(): (hashlib.sha256(path.read_bytes()).hexdigest(), path.stat().st_mtime_ns)
            for path in root.rglob("*") if path.is_file() and path.name != ".writer.lock"}


@pytest.fixture
def service(tmp_path, monkeypatch):
    monkeypatch.setattr(catalog, "_workspace_root", lambda _: tmp_path)
    monkeypatch.setattr(api, "_workspace_root", lambda _: tmp_path)
    monkeypatch.setattr(api, "_data_homes", lambda root: [root / "data" / "omega_vision"])
    monkeypatch.setattr(execution, "_versions", lambda: {"runner": "isolated-test-version-1"})
    monkeypatch.setattr(api, "_pooler_point_at", lambda *args: pytest.fail("Do not retarget the live pooler"))
    monkeypatch.setattr(api, "_persist_execution_memory_defaults", lambda *args: pytest.fail("Do not change user preferences"))
    app = FastAPI()
    app.include_router(catalog.router, prefix="/workbench")
    with TestClient(app) as client:
        yield tmp_path / "data" / "omega_vision", client
    assert not execution._THREADS, "A test left an execution worker running"


def publish(home, test_id="moved", clips=None):
    if clips is None:
        frames = tuple(Frame("", (Body("actor", 6 + index * 2, 10, ("1" * 10,) * 10),)) for index in range(5))
        case = Case("moved", "Measured movement", frames, (Expected(4, Term("moved", ("actor",))),))
        files = events._case_files(case)
        references = [{"visualSequenceId": "recordings/events_tests/moved", "label": "moving",
                       "partition": "training", "frameCount": len(frames)}]
    else:
        files, references = {}, []
        for clip in clips:
            if isinstance(clip, visual.Clip):
                outputs, reference = visual._clip_files(clip)
            else:
                outputs, reference = mechanisms._files_for_clip(clip)
            files.update(outputs)
            references.append(reference)
    test = {"id": test_id, "title": test_id, "summary": "Observed evidence only", "group": "Events",
            "executionStatus": "not_run", "documentationFile": f"documentation/{test_id}.md",
            "recordings": references}
    files[("recordings", "events_tests", "tests.json")] = events._json({"schemaVersion": 1, "count": 1, "tests": [test]})
    files[("recordings", "events_tests", "documentation", f"{test_id}.md")] = b"# Saved test documentation"
    events.publish_recording_files(home, files)
    return test


def create(client, test_id="moved", **fields):
    response = client.post(f"{PREFIX}/{test_id}/runs", json={
        "workspaceId": "arc3_random_player", "mode": "step", "memory": MEMORY, **fields,
    })
    assert response.status_code == 200, response.text
    return response.json()


def advance(client, run):
    response = client.post(f"{PREFIX}/runs/{run['id']}/step", json={
        "workspaceId": "arc3_random_player", "expectedRevision": run["revision"],
    })
    assert response.status_code == 200, response.text
    result = response.json()
    assert result["status"] != "error", result.get("error")
    return result


def finish_steps(client, run):
    while run["status"] not in execution._TERMINAL:
        run = advance(client, run)
    return run


def test_real_dispatcher_runs_pixels_through_native_stm_and_scores_after_freezing(service):
    home, client = service
    publish(home)
    inputs = fingerprints(home / "recordings" / "events_tests")
    run = create(client)
    assert run["status"] == "ready" and run["progress"]["processedFrames"] == 0
    run = finish_steps(client, run)
    assert run["status"] == "completed" and run["progress"]["processedFrames"] == 5
    assert run["score"]["total"] == 1
    assert run["outcome"] == "passed"
    context = recording_context(home, home / "recordings" / "events_tests" / "moved", "4")
    entries = MeTTaMemoryDatabase(home, context.stm_area(), "observation").read()
    assert len(entries) == 5
    assert [entry["causal"]["frameOrder"] for entry in entries] == list(range(5))
    assert all(entry["source"]["visualSequenceId"] == "recordings/events_tests/moved" for entry in entries)
    assert all(entry["authoritativeMechanism"] is False for entry in entries)
    assert any(item["kind"] == "measured_event_deduction" and isinstance(item["assessment"], dict)
               and item["assessment"].get("events")
               for entry in entries for item in entry["observed"])
    assert MeTTaMemoryDatabase(home, context.stm_area(), "shape").read()
    assert any((context.directory / str(index) / semantics.EVENTS / "result.json").is_file() for index in range(5))
    result = json.loads((home / "runtime" / "executions" / "recording-tests" / run["id"] / "frames" / "000-000004.json").read_text())
    assert result["inferenceFrozen"] and result["core"]["groups"] and result["core"]["events"]
    grade = json.loads((home / "runtime" / "executions" / "recording-tests" / run["id"] / "grading" / "000.json").read_text())
    assert grade["inferenceFrozenBeforeOracleRead"] is True
    assert grade["oracleGradingIsNativeObservedMemory"] is False
    after = fingerprints(home / "recordings" / "events_tests")
    assert all(after[name] == value for name, value in inputs.items())
    assert not (home / "runtime" / "memory-settings").exists()
    assert not (home / "preferences").exists()
    assert not list(home.rglob("todos.json"))


def test_nowhere_or_unconfirmed_memory_rejects_before_any_run_or_observation_writes(service):
    home, client = service
    publish(home)
    before = fingerprints(home)
    for memory in ({"mode": "nowhere", "confirmed": True}, {"mode": "native_stm", "confirmed": False},
                   {"mode": "native_stm", "confirmed": 1}, {}):
        response = client.post(f"{PREFIX}/moved/runs", json={
            "workspaceId": "arc3_random_player", "mode": "run", "memory": memory,
        })
        assert response.status_code == 409
    assert before == fingerprints(home)


def test_status_and_history_are_shared_across_workspaces_and_gets_never_write(service):
    home, client = service
    publish(home)
    run = create(client)
    before = fingerprints(home)
    for workspace in ("arc3_random_player", "another_workspace"):
        response = client.get(f"{PREFIX}/runs/{run['id']}", params={"workspaceId": workspace})
        assert response.status_code == 200 and response.json()["id"] == run["id"]
        response = client.get(f"{PREFIX}/moved/runs", params={"workspaceId": workspace})
        assert response.json()["count"] == 1 and response.json()["runs"][0]["id"] == run["id"]
    assert before == fingerprints(home)
    assert not (home / "workspaces").exists()


def test_invalid_ids_unlisted_sources_and_redirects_are_rejected(service, monkeypatch):
    home, client = service
    publish(home)
    assert client.get(f"{PREFIX}/runs/not-a-uuid", params={"workspaceId": "arc3_random_player"}).status_code == 422
    assert client.get(f"{PREFIX}/runs/{uuid4()}", params={"workspaceId": "arc3_random_player"}).status_code == 404
    response = client.post(f"{PREFIX}/moved/runs", json={
        "workspaceId": "arc3_random_player", "mode": "step", "memory": MEMORY,
        "visualSequenceId": "recordings/events_tests/../../secret",
    })
    assert response.status_code == 422
    original = execution.storage_path
    monkeypatch.setattr(execution, "storage_path", lambda root, *parts:
                        home / "redirect" / parts[-1] if parts and parts[-1] == "state.json" and parts[:3] == execution.ROOT
                        else original(root, *parts))
    assert client.post(f"{PREFIX}/moved/runs", json={
        "workspaceId": "arc3_random_player", "mode": "step", "memory": MEMORY,
    }).status_code == 403
    assert not (home / "redirect").exists()
    assert not (home / "runtime" / "executions" / "recording-tests").exists()


def test_step_revision_stop_and_interrupted_recovery(service):
    home, client = service
    publish(home)
    run = create(client)
    original = run
    run = advance(client, run)
    response = client.post(f"{PREFIX}/runs/{run['id']}/step", json={
        "workspaceId": "arc3_random_player", "expectedRevision": original["revision"],
    })
    assert response.status_code == 409
    with execution._lock(home, run["id"]):
        state = execution._read(home, run["id"])
        state.update(status="running", claim="interrupted", owner={**execution._OWNER, "token": "previous-process-token"})
        execution._save(home, state)
    before = fingerprints(home)
    recovered = client.get(f"{PREFIX}/runs/{run['id']}", params={"workspaceId": "arc3_random_player"}).json()
    assert recovered["status"] == "interrupted" and before == fingerprints(home)
    run = advance(client, recovered)
    assert run["progress"]["processedFrames"] == 2
    stopped = client.post(f"{PREFIX}/runs/{run['id']}/stop", json={"workspaceId": "arc3_random_player"}).json()
    assert stopped["status"] == "stopped"
    assert advance(client, stopped)["progress"]["processedFrames"] == 2


@pytest.mark.parametrize("change", ["source", "implementation", "configuration", "missing"])
def test_changes_invalidate_bound_run_without_success_fallback(service, monkeypatch, change):
    home, client = service
    publish(home)
    run = create(client)
    path = home / "recordings" / "events_tests" / "moved" / "3" / "state.json"
    if change == "source":
        path.write_text(path.read_text() + " ")
    elif change == "missing":
        path.unlink()
    elif change == "configuration":
        monkeypatch.setattr(execution, "_configuration", lambda *args: "changed-configuration")
    else:
        monkeypatch.setattr(execution, "_versions", lambda: {"runner": "new-implementation"})
    result = advance(client, run)
    assert result["status"] == "stale" and result["outcome"] == "inconclusive"
    assert result["progress"]["processedFrames"] == 0
    assert not list((home / "recordings" / "events_tests").rglob("visual_observations.metta"))


def test_native_checkpoint_cutoff_and_idempotent_replay(service):
    home, client = service
    clip = next(clip for clip in visual.visual_memory_clips()
                if clip.family == "spotlight_scene" and clip.suffix == "control_revisit")
    publish(home, "spotlight_scene", [clip])
    first = finish_steps(client, create(client, "spotlight_scene"))
    assert first["outcome"] == "passed"
    native_before = {name: value for name, value in fingerprints(home).items() if name.endswith(".metta")}
    second = finish_steps(client, create(client, "spotlight_scene", workspaceId="another_workspace"))
    native_after = {name: value for name, value in fingerprints(home).items() if name.endswith(".metta")}
    assert native_after == native_before
    assert second["evidence"][0]["nativeCheckpointUid"] == first["evidence"][0]["nativeCheckpointUid"]
    context = recording_context(home, home / "recordings" / "events_tests" / clip.name, "1")
    store = ObservationMemory(context)
    state = execution._read(home, second["id"])
    earlier = store.read(observer="spotlight", source_binding=state["sources"][0]["binding"],
                         implementation_binding=state["recordings"][0]["observerBinding"])
    assert [entry["causal"]["frameOrder"] for entry in earlier] == [0]
    with pytest.raises(PermissionError):
        store.read(observer="spotlight", source_binding=state["sources"][0]["binding"],
                   implementation_binding=state["recordings"][0]["observerBinding"], before=7)
    final = execution._native_entry(home, state, 0, clip.frames.__len__() - 1)
    assert final["observed"][0]["unknownPixels"] > 0
    assert final["observed"][0]["newKnownPixels"] == 0


def test_background_run_completes_and_stop_does_not_wait_for_an_inflight_frame(service, monkeypatch):
    home, client = service
    clip = next(clip for clip in visual.visual_memory_clips()
                if clip.family == "spotlight_scene" and clip.suffix == "control_revisit")
    publish(home, "spotlight_scene", [clip])
    started, release = threading.Event(), threading.Event()
    original = execution._compute_frame
    def blocked(*args, **kwargs):
        started.set()
        assert release.wait(10)
        return original(*args, **kwargs)
    monkeypatch.setattr(execution, "_compute_frame", blocked)
    run = create(client, "spotlight_scene", mode="run")
    assert started.wait(10)
    active = client.get(f"{PREFIX}/runs/{run['id']}", params={"workspaceId": "arc3_random_player"}).json()
    competing = client.post(f"{PREFIX}/runs/{run['id']}/step", json={
        "workspaceId": "arc3_random_player", "expectedRevision": active["revision"],
    })
    assert competing.status_code == 409 and "background runner" in competing.text
    response = client.post(f"{PREFIX}/runs/{run['id']}/stop", json={"workspaceId": "arc3_random_player"})
    assert response.status_code == 200 and response.json()["status"] == "stopping"
    release.set()
    deadline = time.monotonic() + 30
    while run["id"] in execution._THREADS and time.monotonic() < deadline:
        time.sleep(0.03)
    final = client.get(f"{PREFIX}/runs/{run['id']}", params={"workspaceId": "arc3_random_player"}).json()
    assert final["status"] == "stopped" and final["progress"]["processedFrames"] == 1


def test_unknown_post_targets_do_not_create_orphan_runs(service):
    home, client = service
    publish(home)
    before = fingerprints(home)
    run_id = str(uuid4())
    for suffix, body in (
        ("step", {"expectedRevision": 1}), ("stop", {}),
        ("candidates/missing/approve", {"expectedRevision": 1, "confirmed": True, "approvedBy": "reviewer"}),
    ):
        response = client.post(f"{PREFIX}/runs/{run_id}/{suffix}", json={"workspaceId": "arc3_random_player", **body})
        assert response.status_code == 404, response.text
    assert fingerprints(home) == before
    assert not (home / "runtime" / "executions" / "recording-tests").exists()


def test_completed_result_becomes_read_only_stale_when_its_source_changes(service):
    home, client = service
    clip = next(clip for clip in visual.visual_memory_clips()
                if clip.family == "spotlight_scene" and clip.suffix == "control_revisit")
    publish(home, "spotlight_scene", [clip])
    run = finish_steps(client, create(client, "spotlight_scene"))
    assert run["outcome"] == "passed"
    source = home / "recordings" / "events_tests" / clip.name / "0" / "state.json"
    source.write_text(source.read_text() + " ")
    before = fingerprints(home)
    response = client.get(f"{PREFIX}/runs/{run['id']}", params={"workspaceId": "another_workspace"})
    assert response.status_code == 200 and response.headers["cache-control"] == "no-store"
    assert response.json()["status"] == "stale" and response.json()["storedOutcome"] == "passed"
    assert before == fingerprints(home)


def test_empty_first_frame_initializes_empty_native_databases_without_fake_shapes(service):
    home, client = service
    publish(home)
    # The isolated fixture is edited before run creation, never a published user input.
    path = home / "recordings" / "events_tests" / "moved" / "0" / "image.png"
    from PIL import Image
    path.write_bytes(visual.png_bytes(Image.new("RGB", (64, 48), (0, 0, 0))))
    run = advance(client, create(client))
    context = recording_context(home, path.parent.parent, "0")
    shapes = MeTTaMemoryDatabase(home, context.stm_area(), "shape")
    assert shapes.path.is_file() and shapes.read() == []
    run = advance(client, run)
    assert run["progress"]["processedFrames"] == 2


def test_preprocessing_and_corrupt_source_schema_are_bound_without_settings_writes(service):
    home, client = service
    publish(home)
    directory = home / "recordings" / "events_tests" / "moved"
    settings = directory / "preprocessing_chain.json"
    settings.write_text("[]")
    run = create(client)
    settings.write_text("[")
    assert advance(client, run)["status"] == "stale"
    settings.write_text("[]")
    state_path = directory / "0" / "state.json"
    state_path.write_text("[]")
    before = fingerprints(home)
    response = client.post(f"{PREFIX}/moved/runs", json={
        "workspaceId": "arc3_random_player", "mode": "step", "memory": MEMORY,
    })
    assert response.status_code == 409 and "object" in response.text
    assert fingerprints(home) == before


def test_corrupt_frozen_receipt_cannot_be_reused_as_inference(service, monkeypatch):
    home, client = service
    clip = next(clip for clip in visual.visual_memory_clips()
                if clip.family == "spotlight_scene" and clip.suffix == "control_revisit")
    publish(home, "spotlight_scene", [clip])
    run = advance(client, create(client, "spotlight_scene"))
    path = execution._frame_path(home, run["id"], 0, 0)
    value = json.loads(path.read_text())
    value["observer"]["observed"] = [{"forged": True}]
    path.write_text(json.dumps(value))
    with execution._lock(home, run["id"]):
        state = execution._read(home, run["id"])
        state["recordings"][0]["processedFrames"] = 0
        state["progress"]["processedFrames"] = 0
        execution._save(home, state)
    monkeypatch.setattr(execution, "_compute_frame", lambda *a, **k: pytest.fail("Corrupt receipt must not be recomputed silently"))
    response = client.post(f"{PREFIX}/runs/{run['id']}/step", json={
        "workspaceId": "arc3_random_player", "expectedRevision": state["revision"],
    })
    assert response.json()["status"] == "error" and "corrupt" in response.json()["error"]


@pytest.fixture
def observer_only_core(monkeypatch):
    """Isolate the new native adapter; the first integration test covers the real core."""
    def unit_without_core(workspace, reference, index, **kwargs):
        _, units = semantics._units(workspace, "data/" + reference)
        unit = units[index]
        unit["sourceImage"] = unit["image"]
        return unit, {"status": "test_isolation", "reason": "Native observation adapter unit test"}
    monkeypatch.setattr(execution, "_core_frame", unit_without_core)


def test_color_native_seed_generalizes_and_oracles_are_read_only_after_freezing(service, observer_only_core, monkeypatch):
    home, client = service
    clips = [clip for clip in visual.visual_memory_clips()
             if clip.family == "color_band_cycle" and clip.suffix in {"train_a", "validation_a", "control_a"}]
    publish(home, "color_band_cycle", clips)
    allowed = False
    read_bytes = Path.read_bytes
    score = execution.score_recording
    def guarded_bytes(path):
        if path.name in {"evaluation.json", "expected_events.json"}:
            assert allowed, "Inference attempted to read an oracle"
        return read_bytes(path)
    def guarded_score(root, directory, test_id, frames, native):
        nonlocal allowed
        assert all(frame["inferenceFrozen"] for frame in frames)
        assert native["causal"]["frameOrder"] == len(frames) - 1
        allowed = True
        try:
            return score(root, directory, test_id, frames, native)
        finally:
            allowed = False
    monkeypatch.setattr(Path, "read_bytes", guarded_bytes)
    monkeypatch.setattr(execution, "score_recording", guarded_score)
    run = finish_steps(client, create(client, "color_band_cycle"))
    assert run["outcome"] == "passed"
    heldout = [frame for frame in run["evidence"] if "validation_a" in frame["visualSequenceId"]]
    assert heldout
    predictions = [item for frame in heldout for item in frame["predictions"]]
    assert all(item["predictedBeforeObservation"] and item["assessment"] == "correct" for item in predictions)
    assert any(item["hitTarget"] for item in predictions) and any(not item["hitTarget"] for item in predictions)
    state = execution._read(home, run["id"])
    position = next(index for index, item in enumerate(state["recordings"]) if item["partition"] == "validation")
    first = execution._native_entry(home, state, position, 0)
    last = execution._native_entry(home, state, position, state["recordings"][position]["frameCount"] - 1)
    assert first["state"]["colorEvidence"] == last["state"]["colorEvidence"], "Held-out observations fitted the rule"
    assert first["evidenceRefs"], "Training seed has no native evidence references"
    assert "targetIndex" not in json.dumps(last) and "teacher" not in json.dumps(last)


def test_portal_native_memory_retains_alternatives_and_predicts_later_trial(service, observer_only_core):
    home, client = service
    clip = next(clip for clip in mechanisms.action_mechanism_clips()
                if clip.family == "teleporter" and clip.suffix == "train_delayed")
    publish(home, "teleporter", [clip])
    run = finish_steps(client, create(client, "teleporter"))
    assert run["outcome"] == "passed"
    first_mismatch = next(frame for frame in run["evidence"] if any(
        item["kind"] == "constant_speed_model_mismatch" for item in frame["observed"]))
    assert first_mismatch["frameId"] == "23"
    assert all(item["authoritative"] is False for item in first_mismatch["hypotheses"])
    assert {"teleportation", "unseen acceleration or fast motion"} <= {
        item["explanation"] for item in first_mismatch["hypotheses"]}
    successful = [item for frame in run["evidence"] for item in frame["predictions"] if item["status"] == "correct"]
    assert successful
    assert all(evidence["after_seconds"] <= item["predictionObservationSeconds"]
               for item in successful for evidence in item["evidence"])
    context = recording_context(home, home / "recordings" / "events_tests" / clip.name, "43")
    native = MeTTaMemoryDatabase(home, context.stm_area(), "observation").read()
    assert len(native) == 44 and native[-1]["state"]["portal"]["evidence"]
    assert "mechanismEvent" not in json.dumps(native) and "portalLinks" not in json.dumps(native)


def test_portal_motion_mismatch_does_not_require_a_visible_gate():
    clips = [clip for clip in mechanisms.action_mechanism_clips() if clip.family == "teleporter"]
    clip = next(clip for clip in clips if clip.suffix == "train_delayed")
    from PIL import Image
    from io import BytesIO
    state, results = {}, []
    for index in (16, 17, 18, 19, 20, 21, 22, 23):
        source = clip.frames[index]
        image = Image.open(BytesIO(source.png)).convert("RGB")
        actor = mechanisms._portal_pixels(source.png)[1]
        blank = Image.new("RGB", image.size, (0, 0, 0))
        if actor is not None:
            # Keep only the measured distinctive actor component; no gate remains.
            for y in range(image.height):
                for x in range(image.width):
                    if image.getpixel((x, y))[:3] == actor.signature:
                        blank.putpixel((x, y), image.getpixel((x, y)))
        png = visual.png_bytes(blank)
        frame = observers.ObservationInput(png, None, source.action, {}, index * 0.25, {}, True)
        result = observers.observe("portal", frame, state)
        state = result["state"]
        results.append(result)
    assert any(item["kind"] == "constant_speed_model_mismatch" for item in results[-1]["observed"])
    assert all(item["status"] == "unresolved" for item in results[-1]["hypotheses"])
