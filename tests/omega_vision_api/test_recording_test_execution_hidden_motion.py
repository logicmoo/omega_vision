from copy import deepcopy
from dataclasses import replace
import json
from pathlib import Path

import pytest

from omega_vision.evaluation import action_mechanism_recordings as mechanisms
from omega_vision.evaluation import visual_memory_recordings as visual
from omega_vision.perception import hidden_motion_observer as hidden
from omega_vision.perception.contextual_memory import recording_context
from omega_vision.perception.metta_memory import MeTTaMemoryDatabase
from omega_vision.services import recording_test_execution as execution
from omega_vision.services import recording_test_observers as observers
from omega_vision.services import recording_test_scoring as scoring
from omega_vision.services.recording_test_memory import ObservationMemory

from test_recording_test_execution import (
    PREFIX, advance, create, finish_steps, fingerprints, publish, service,
)


def clip_for(family, suffix):
    clips = mechanisms.action_mechanism_clips() if family == "teleporter" else visual.visual_memory_clips()
    return next(clip for clip in clips if clip.family == family and clip.suffix == suffix)


@pytest.mark.parametrize("family,suffix,mode", [
    ("occlusion_pole", "train_a", "step"),
    ("occlusion_large_object", "train_a", "run"),
    ("occlusion_pole", "control_absence", "step"),
    ("teleporter", "train_delayed", "step"),
    ("teleporter", "control_decorative", "step"),
    ("teleporter", "control_near_miss", "step"),
])
def test_registered_hidden_motion_run_step_native_publication_then_scoring(service, monkeypatch, family, suffix, mode):
    home, client = service
    clip = clip_for(family, suffix)
    publish(home, family, [clip])
    original_files = fingerprints(home / "recordings")
    original_read, original_score = Path.read_bytes, execution.score_recording
    original_observe = observers.observe_hidden_motion
    observing, grading, active_order = False, False, -1
    seen = []

    def guarded_read(path):
        if path.name in {"evaluation.json", "expected_events.json", "observer_assessment.json"}:
            assert grading, "Evaluator accessed before frozen native publication"
        if observing and path.name == "image.png" and path.parent.name.isdecimal():
            assert int(path.parent.name) <= active_order, "Model attempted future image access"
        return original_read(path)

    def observe(png, **kwargs):
        nonlocal observing, active_order
        assert set(kwargs["source"]) == {"frameId", "order", "imageHash", "stateHash"}
        active_order = kwargs["source"]["order"]
        if kwargs["prior"]:
            assert kwargs["prior"]["source"]["order"] == active_order - 1
        assert kwargs["previous_image_hash"] is None if not active_order else kwargs["previous_image_hash"]
        observing = True
        try:
            result = original_observe(png, **kwargs)
        finally:
            observing = False
        seen.append(active_order)
        return result

    def grade(root, directory, test_id, frames, native):
        nonlocal grading
        assert not observing and len(seen) == len(clip.frames)
        assert all(frame["inferenceFrozen"] for frame in frames)
        assert native["causal"]["frameOrder"] == len(frames) - 1
        context = recording_context(home, directory, str(len(frames) - 1))
        stored = MeTTaMemoryDatabase(home, context.stm_area(), "observation").read()
        assert len(stored) == len(frames), "Scoring preceded native publication"
        grading = True
        try:
            return original_score(root, directory, test_id, frames, native)
        finally:
            grading = False

    monkeypatch.setattr(Path, "read_bytes", guarded_read)
    monkeypatch.setattr(observers, "observe_hidden_motion", observe)
    monkeypatch.setattr(execution, "score_recording", grade)
    run = create(client, family, mode=mode)
    if mode == "run":
        thread = execution._THREADS.get(run["id"])
        if thread:
            thread.join(240)
            assert not thread.is_alive()
        run = client.get(f"{PREFIX}/runs/{run['id']}", params={"workspaceId": "arc3_random_player"}).json()
    else:
        run = finish_steps(client, run)
    assert run["status"] == "completed", run
    assert run["outcome"] == "passed", run
    assert seen == list(range(len(clip.frames)))
    state = execution._read(home, run["id"])
    assert state["recordings"][0]["score"]["gradingScope"] == "observed_visibility_and_conditional_motion_models"
    assert state["recordings"][0]["score"]["physicalCause"] == "not_established"
    frozen = [execution._frozen_frame(execution._frame_path(home, run["id"], 0, index))
              for index in range(len(clip.frames))]
    for index, frame in enumerate(frozen):
        assert frame["observer"]["nativeReadCutoffExclusive"] == index
        receipts = frame["observer"]["nativeReadReceipts"]
        assert [receipt["frameOrder"] for receipt in receipts] == ([index - 1] if index else [])
        assert frame["observer"]["nativeCheckpointUid"]
        assert all("data/recordings/events_tests/" in ref for ref in frame["observer"]["nativeMemoryRefs"])
    final = execution._native_entry(home, state, 0, len(clip.frames) - 1)
    assert "hiddenMotion" in final["state"]
    serialized = json.dumps(final)
    assert not any(forbidden in serialized for forbidden in ("teacher_same_actor", "authoredPosition", "portalLinks", "mechanismEvent"))
    monkeypatch.setattr(Path, "read_bytes", original_read)
    after = fingerprints(home / "recordings")
    assert all(after[name] == value for name, value in original_files.items())
    assert not (home / "preferences").exists()
    assert not (home / "workspaces").exists()
    assert not run["candidates"]


@pytest.mark.parametrize("corruption", ["order", "image", "version", "future"])
def test_registered_step_rejects_invalid_or_cumulative_hidden_motion_history(service, monkeypatch, corruption):
    home, client = service
    clip = clip_for("occlusion_pole", "train_a")
    publish(home, clip.family, [clip])
    run = advance(client, advance(client, advance(client, create(client, clip.family))))
    original = ObservationMemory.previous

    def poisoned(self, **kwargs):
        result = deepcopy(original(self, **kwargs))
        value = result["state"]["hiddenMotion"]
        if corruption == "order":
            value["source"]["order"] = 0
        elif corruption == "image":
            value["source"]["imageHash"] = "f" * 64
        elif corruption == "version":
            value["implementationHash"] = "f" * 64
        else:
            value["models"][0]["history"][0]["source"]["order"] = 10
        result["state"]["hiddenMotion"] = hidden._seal({key: item for key, item in value.items() if key != "stateUid"})
        return result

    monkeypatch.setattr(ObservationMemory, "previous", poisoned)
    response = client.post(f"{PREFIX}/runs/{run['id']}/step", json={
        "workspaceId": "arc3_random_player", "expectedRevision": run["revision"],
    })
    assert response.status_code == 200, response.text
    value = response.json()
    assert value["status"] == "error", value
    assert value["progress"]["processedFrames"] == 3
    context = recording_context(home, home / "recordings" / "events_tests" / clip.name, "3")
    entries = MeTTaMemoryDatabase(home, context.stm_area(), "observation").read()
    assert [entry["causal"]["frameOrder"] for entry in entries] == [0, 1, 2]


def test_hidden_motion_module_is_in_real_execution_revision():
    assert "hidden_motion_observer.py" in execution._versions()["modules"]


def test_recording_with_indistinguishable_candidates_stays_inconclusive(service):
    from io import BytesIO
    from PIL import Image
    home, client = service
    clip = clip_for("occlusion_pole", "train_a")
    frames = list(clip.frames)
    first = Image.open(BytesIO(frames[0].png)).convert("RGB")
    moving = min(hidden._components(frames[0].png)[2], key=lambda row: row["pixelCount"])
    for index in (2, 3):
        current = Image.open(BytesIO(frames[index].png)).convert("RGB")
        for x, y in hidden._points(moving):
            current.putpixel((x + 50, y), first.getpixel((x, y)))
        frames[index] = replace(frames[index], png=visual.png_bytes(current))
    publish(home, clip.family, [replace(clip, frames=tuple(frames))])
    run = finish_steps(client, create(client, clip.family))
    assert run["status"] == "completed"
    assert run["outcome"] in {"unsupported", "inconclusive"}, run


def test_frozen_scorer_rejects_a_definitive_hidden_cause_without_reobserving(service, monkeypatch):
    home, client = service
    clip = clip_for("teleporter", "train_delayed")
    publish(home, clip.family, [clip])
    run = finish_steps(client, create(client, clip.family))
    state = execution._read(home, run["id"])
    frames = [execution._frozen_frame(execution._frame_path(home, run["id"], 0, index))
              for index in range(len(clip.frames))]
    for row in frames[23]["observer"]["hypotheses"]:
        row["authoritative"] = True
    native = execution._native_entry(home, state, 0, len(frames) - 1)
    monkeypatch.setattr(observers, "observe", lambda *a, **k: pytest.fail("Scoring must not rerun inference"))
    score = scoring.score_recording(home, home / "recordings" / "events_tests" / clip.name, clip.family, frames, native)
    assert score["outcome"] == "failed"
