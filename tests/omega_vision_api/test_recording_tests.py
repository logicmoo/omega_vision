from copy import deepcopy
import hashlib
from io import BytesIO
import json
from pathlib import Path

from fastapi import FastAPI, HTTPException
from fastapi.testclient import TestClient
from PIL import Image
import pytest

from omega_vision.evaluation import event_recordings as originals
from omega_vision.evaluation import induction_recordings as fixtures
from omega_vision.evaluation.event_recording_cases import event_cases
from omega_vision.evaluation.induction_recording_cases import (
    CELL, DIRECTIONS, PALETTES, SIZE, STEMS, Input, induction_clips,
)
from omega_vision.perception.contextual_memory import recording_context
from omega_vision.services import arc3_play, recording_tests as api, registry_api, video_import_api as video
from workbench_api_server import arc3_play_api as workbench_play


@pytest.fixture(scope="module")
def publication():
    return fixtures.recording_test_files()


@pytest.fixture
def prepared(tmp_path, request, publication):
    files, _ = publication
    if request.node.name not in {
        "test_get_contract_shared_visibility_and_no_get_writes",
        "test_all_new_clips_load_through_standard_selectors_and_each_frame_context",
    }:
        index = json.loads(files[("recordings", "events_tests", "tests.json")])
        selected = {"moved"}
        if request.node.name == "test_detail_does_not_enumerate_unrelated_recordings":
            selected.add("plate_momentary")
        index["tests"] = [item for item in index["tests"] if item["id"] in selected]
        index["count"] = len(index["tests"])
        names = {recording["visualSequenceId"].split("/")[2]
                 for item in index["tests"] for recording in item["recordings"]}
        files = {
            path: data for path, data in files.items()
            if path[2] in names or (path[2] == "documentation" and path[3][:-3] in selected)
        }
        files[("recordings", "events_tests", "tests.json")] = originals._json(index)
    originals.publish_recording_files(tmp_path, files)
    return tmp_path / "data" / "omega_vision"


@pytest.fixture
def client(tmp_path, monkeypatch):
    for name in ("arc3_random_player", "second"):
        (tmp_path / "workspaces" / name).mkdir(parents=True)

    def workspace(name):
        if name not in {"arc3_random_player", "second"}:
            raise HTTPException(404, f"Workspace unavailable: {name}")
        return tmp_path / "workspaces" / name

    for module in (api, video, arc3_play, workbench_play):
        monkeypatch.setattr(module, "_workspace_root", workspace)
    app = FastAPI()
    app.include_router(registry_api.router, prefix="/workbench")
    app.include_router(video.router)
    with TestClient(app) as connection:
        yield connection


def _snapshot(home):
    return {
        path.relative_to(home).as_posix(): (hashlib.sha256(path.read_bytes()).hexdigest(), path.stat().st_mtime_ns)
        for path in home.rglob("*") if path.is_file() and path.name != ".writer.lock"
    }


def test_each_test_has_exact_plan_row_saved_docs_and_honest_partitions(publication):
    files, counts = publication
    index = json.loads(files[("recordings", "events_tests", "tests.json")])
    plan_rows = fixtures._plan_rows(fixtures.PLAN_PATH.read_text(encoding="utf-8"))
    assert index["count"] == counts["testCount"] == 54
    assert len({item["id"] for item in index["tests"]}) == 54
    assert {item["id"] for item in index["tests"]} == {case.name for case in event_cases()} | set(STEMS)
    assert counts["eventRecordingCount"] == 38
    assert counts["eventFrameCount"] == 122
    assert counts["inductionRecordingCount"] == 98
    for entry in index["tests"]:
        assert entry["executionStatus"] == "not_run"
        parts = ("recordings", "events_tests", *entry["documentationFile"].split("/"))
        documentation = files[parts].decode("utf-8")
        for row in plan_rows[entry["id"]]:
            assert row in documentation
        for required in (
            "local memory", "earlier", "decision", "unknown", "held-out", "not run",
            "oracle", "not automatically passed", "shapes_db.metta", "objects_db.metta",
        ):
            assert required in documentation.lower()
        for recording in entry["recordings"]:
            assert recording["visualSequenceId"] in documentation
            manifest = json.loads(files[(*recording["visualSequenceId"].split("/"), "recording.json")])
            assert len(manifest["moves"]) == recording["frameCount"]
        if entry["id"] in STEMS:
            assert {"training", "training_control", "validation", "test", "test_control"} <= {
                item["partition"] for item in entry["recordings"]
            }
    assert "single still image" in files[("recordings", "events_tests", "documentation", "move.md")].decode()
    assert "no real attempted-input trace" in files[("recordings", "events_tests", "documentation", "blocked.md")].decode()
    assert "contact time, not causal confirmation time" in files[
        ("recordings", "events_tests", "documentation", "collision.md")].decode()


def test_each_trial_description_matches_positive_or_control_trace_activity(publication):
    files, _ = publication
    for clip in induction_clips():
        description = clip.description
        doc = files[("recordings", "events_tests", "documentation", f"{clip.stem}.md")].decode()
        metadata = json.loads(files[("recordings", "events_tests", clip.name, "evaluation.json")])
        assert f"- **{clip.suffix}**: {description}" in doc
        assert metadata["controlInterpretation"] == description
        frames = clip.replay()
        images = [Image.open(BytesIO(frame[1])).convert("RGB") for frame in frames]
        if clip.initial.plates:
            occupied = any(image.getpixel((x * CELL, y * CELL)) == (225, 220, 100)
                           for image in images for x, y in clip.initial.plates.values())
            assert f"plate occupancy={'present' if occupied else 'absent'}" in description
        else:
            assert "plate occupancy=not applicable" in description
        if clip.initial.doors:
            door_images = [
                tuple(image.getpixel((x * CELL + 3, y * CELL + 3)) for x, y in clip.initial.doors.values())
                for image in images
            ]
            assert f"door changes={'present' if len(set(door_images)) > 1 else 'absent'}" in description
        else:
            assert "door changes=not applicable" in description
        if clip.initial.crates:
            moved = any(a[2]["crates"] != b[2]["crates"] for a, b in zip(frames, frames[1:]))
            assert f"crate movement={'present' if moved else 'absent'}" in description
        else:
            assert "crate movement=not applicable" in description
        if clip.partition in {"training", "validation", "test"}:
            assert "No intervention" not in description
            assert "example." in description
            if clip.stem == "plate_momentary":
                assert "occupy, hold and release the plate twice" in description
                assert occupied
            if clip.stem == "push_inertial":
                assert "continued crate movement" in description and moved
            if clip.stem == "push_wall_blocked":
                assert "click the actual barrier" in description
                assert frames[-1][2]["walls"] == []
        elif clip.partition == "inconclusive_control":
            assert "Inconclusive control" in description
            assert "before the 1.5-second response horizon" in description
            assert occupied and len(set(door_images)) == 1
        else:
            assert "control." in description
            if clip.stem == "plate_momentary":
                assert "without occupying the plate" in description
                assert not occupied
            if clip.stem == "push_inertial":
                assert "does not drift" in description and not moved
            if clip.stem == "push_immovable":
                assert "it displaces" in description and moved
    for stem in STEMS:
        main = next(clip for clip in induction_clips() if clip.stem == stem and clip.suffix == "train_a")
        control = next(clip for clip in induction_clips() if clip.stem == stem and clip.suffix == "control_a")
        assert main.description != control.description


def test_existing_38_inputs_remain_identical_and_generation_is_idempotent(tmp_path, monkeypatch, publication):
    originals.create_event_recordings(tmp_path)
    home = tmp_path / "data" / "omega_vision"
    previous = _snapshot(home / "recordings" / "events_tests")
    note = home / "recordings" / "events_tests" / "moved" / "user_note.txt"
    note.write_text("Preserve the user's annotation.", encoding="utf-8")
    monkeypatch.setattr(fixtures, "recording_test_files", lambda: publication)
    created = fixtures.create_recording_tests(tmp_path)
    assert created["createdFileCount"] > 0
    after = _snapshot(home / "recordings" / "events_tests")
    assert all(after[path] == value for path, value in previous.items())
    assert note.read_text() == "Preserve the user's annotation."
    before_rerun = _snapshot(home)
    assert fixtures.create_recording_tests(tmp_path)["createdFileCount"] == 0
    assert before_rerun == _snapshot(home)
    assert originals.create_event_recordings(tmp_path)["createdFileCount"] == 0
    assert before_rerun == _snapshot(home)


def test_get_contract_shared_visibility_and_no_get_writes(prepared, client, monkeypatch):
    before = _snapshot(prepared)
    # The runtime reader must not read the standalone plan or invoke discovery.
    monkeypatch.setattr(fixtures, "PLAN_PATH", Path("not-an-online-doc-source"))
    monkeypatch.setattr(video, "_sequence_execution_context", lambda *args, **kwargs: pytest.fail("Unrelated enumeration"))
    base = "/workbench/recognition/recording-tests"
    responses = [client.get(base, params={"workspaceId": workspace}) for workspace in ("arc3_random_player", "second")]
    assert all(response.status_code == 200 for response in responses)
    assert responses[0].json() == responses[1].json()
    listing = responses[0].json()
    assert listing["count"] == 54
    assert set(listing) == {"tests", "count"}
    for entry in listing["tests"]:
        assert set(entry) == {"id", "group", "title", "summary", "executionStatus", "recordings"}
        assert entry["executionStatus"] == "not_run"
        detail = client.get(f"{base}/{entry['id']}", params={"workspaceId": "arc3_random_player"})
        assert detail.status_code == 200, detail.text
        assert {key: detail.json()[key] for key in entry} == entry
        stored = prepared / "recordings" / "events_tests" / "documentation" / f"{entry['id']}.md"
        assert detail.json()["documentation"] == stored.read_text(encoding="utf-8")
    assert before == _snapshot(prepared)
    assert not (prepared / "workspaces").exists()
    assert not (prepared / "preferences").exists()
    assert not list(prepared.rglob("*.metta"))
    assert not list(prepared.rglob("memory"))


def test_all_new_clips_load_through_standard_selectors_and_each_frame_context(prepared, client, tmp_path):
    clips = induction_clips()
    expected = {f"recordings/events_tests/{clip.name}" for clip in clips}
    workspace_results = []
    for workspace in ("arc3_random_player", "second"):
        response = client.get(f"{video.router.prefix}/visual-sequences", params={"workspaceId": workspace})
        assert response.status_code == 200, response.text
        selected = {item["id"]: item for item in response.json()["visualSequences"] if item["id"] in expected}
        assert set(selected) == expected
        assert all(item["ordered"] and item["kind"] == "arc-recording" for item in selected.values())
        workspace_results.append(selected)
        response = client.get(f"{video.router.prefix}/arc-recordings", params={"workspaceId": workspace})
        assert response.status_code == 200, response.text
        assert expected <= {item["path"][5:] for item in response.json()["recordings"]}
        for module in (arc3_play, workbench_play):
            listing = module.list_recording_dirs(workspace, gameId="events_tests")["recordingDirs"]
            assert expected <= {item["path"][5:] for item in listing}
    assert workspace_results[0] == workspace_results[1]
    total = 0
    for clip in clips:
        count = len(clip.actions) + 1
        directory = prepared / "recordings" / "events_tests" / clip.name
        _, units, ordering = video._sequence_execution_context(tmp_path, f"data/recordings/events_tests/{clip.name}")
        assert ordering["ordered"]
        assert [unit["id"] for unit in units] == [str(index) for index in range(count)]
        for index in range(count):
            context = recording_context(prepared, directory, str(index))
            assert context.current.frame_id == str(index)
            assert [moment.frame_id for moment in context.moments] == [str(step) for step in range(count)]
            assert units[index]["image"] == directory / str(index) / "image.png"
        total += count
    assert total == 2094


def test_states_have_actual_inputs_timing_and_no_oracle_leakage(publication):
    files, _ = publication
    allowed = {
        "kind", "game_id", "game_directory", "level", "state", "step_count",
        "incoming_action", "action_data", "action_directory", "parent_node",
        "action_path", "at_seconds", "recorded_at", "image_hash",
    }
    for clip in induction_clips():
        prefix = ("recordings", "events_tests", clip.name)
        oracle = json.loads(files[(*prefix, "evaluation.json")])
        manifest = json.loads(files[(*prefix, "recording.json")])
        assert oracle["groundTruthIsRecognizerInput"] is False
        assert oracle["recognizerStatus"] == "not_run"
        assert "authoredWorld" not in manifest
        for index, (receipt, png, expected) in enumerate(clip.replay()):
            state = json.loads(files[(*prefix, str(index), "state.json")])
            assert set(state) == allowed
            assert clip.stem not in json.dumps(state)
            assert state["incoming_action"] == (receipt.action if receipt else None)
            assert state["incoming_action"] in {None, "LEFT", "RIGHT", "UP", "DOWN", "WAIT", "CLICK"}
            assert state["action_data"] == (receipt.data() if receipt else {})
            assert manifest["moves"][index]["action"] == state["incoming_action"]
            assert manifest["moves"][index]["data"] == state["action_data"]
            assert state["at_seconds"] == expected["atSeconds"] == index * clip.dt
            assert files[(*prefix, str(index), "image.png")] == png
            assert hashlib.sha256(png).hexdigest() == oracle["frames"][index]["sha256"]
        assert not any("memory" in part or part.endswith(".metta") for parts in files if parts[:3] == prefix for part in parts)


@pytest.mark.parametrize("stem", STEMS)
def test_traces_are_mechanical_visible_and_independent(stem):
    clips = [clip for clip in induction_clips() if clip.stem == stem]
    assert len({clip.replay()[0][1] for clip in clips if clip.suffix != "control_horizon"}) == len(
        [clip for clip in clips if clip.suffix != "control_horizon"])
    for clip in clips:
        frames = clip.replay()
        assert frames[0][0] is None
        assert len({png for _, png, _ in frames}) > 1
        for index, (receipt, png, oracle) in enumerate(frames):
            actor = tuple(oracle["actor"])
            crates = {key: tuple(cell) for key, cell in oracle["crates"].items()}
            walls = {tuple(cell) for cell in oracle["walls"]}
            assert actor not in crates.values() and actor not in walls
            assert len(set(crates.values())) == len(crates)
            assert not set(crates.values()) & walls
            assert all(0 <= x < 12 and 0 <= y < 8 for x, y in [actor, *crates.values()])
            image = Image.open(BytesIO(png)).convert("RGB")
            assert image.size == SIZE
            actor_color, crate_color = PALETTES[clip.initial.palette]
            assert image.getpixel((actor[0] * CELL + 1, actor[1] * CELL + 1)) == actor_color
            for x, y in crates.values():
                assert image.getpixel((x * CELL + 1, y * CELL + 1)) == crate_color
            for key, cell in clip.initial.plates.items():
                occupied = cell == actor or cell in crates.values()
                assert oracle["plateOccupancy"][key] == occupied
                assert image.getpixel((cell[0] * CELL, cell[1] * CELL)) == (
                    (225, 220, 100) if occupied else (100, 92, 52))
            for key, cell in clip.initial.doors.items():
                assert image.getpixel((cell[0] * CELL + 3, cell[1] * CELL + 3)) == (
                    (14, 19, 27) if oracle["doorOpen"][key] else (210, 80, 80))
            if index:
                prior = frames[index - 1][2]
                delta = tuple(actor[axis] - prior["actor"][axis] for axis in (0, 1))
                assert delta in {(0, 0), DIRECTIONS.get(receipt.action, (0, 0))}
                for key, cell in crates.items():
                    delta = tuple(cell[axis] - prior["crates"][key][axis] for axis in (0, 1))
                    if not clip.initial.inertia:
                        assert delta in {(0, 0), DIRECTIONS.get(receipt.action, (0, 0))}
                        if delta != (0, 0):
                            target = tuple(prior["actor"][axis] + delta[axis] for axis in (0, 1))
                            assert target in prior["crates"].values()
                removed = set(map(tuple, prior["walls"])) - walls
                assert not removed or (receipt.action == "CLICK" and removed == {receipt.cell})
    primary = next(clip for clip in clips if clip.suffix == "train_a")
    altered = deepcopy(primary.initial)
    altered.baseline()
    altered_images = [altered.render()]
    for _ in primary.actions:
        altered.step(Input("WAIT"), primary.dt)
        altered_images.append(altered.render())
    assert altered_images != [frame[1] for frame in primary.replay()], "Inputs must drive world steps, not fixed frames"


def _traces(stem, suffix="train_a"):
    clip = next(clip for clip in induction_clips() if clip.stem == stem and clip.suffix == suffix)
    return clip, [frame[2] for frame in clip.replay()]


@pytest.mark.parametrize("stem", [stem for stem in STEMS if stem.startswith("plate_")] + ["push_onto_plate"])
def test_plate_mechanisms_and_controls(stem):
    for suffix in ("train_a", "train_b", "validation_a", "test_a"):
        clip, trace = _traces(stem, suffix)
        if stem == "plate_unlinked_control":
            assert any(item["plateOccupancy"] == {"a": True, "b": False} for item in trace)
            assert any(item["plateOccupancy"] == {"a": False, "b": True} for item in trace)
            assert all(item["doorOpen"]["far"] == item["plateOccupancy"]["a"] for item in trace)
            assert all(item["doorOpen"]["near"] == item["plateOccupancy"]["b"] for item in trace)
            continue
        occupied = [item["plateOccupancy"]["a"] for item in trace]
        opened = [item["doorOpen"]["door"] for item in trace]
        if stem in {"plate_momentary", "plate_crate_hold", "push_onto_plate"}:
            assert opened == occupied
            assert True in opened and opened[-1] is False
        elif stem == "plate_latched":
            assert opened == [any(occupied[:index + 1]) for index in range(len(trace))]
            assert opened[-1] is True and occupied[-1] is False
        elif stem == "plate_toggle":
            press_count = 0
            for index in range(len(trace)):
                if occupied[index] and (index == 0 or not occupied[index - 1]):
                    press_count += 1
                assert opened[index] == bool(press_count % 2)
            assert press_count == 3
        elif stem == "plate_delayed":
            assert True in opened
            for index, item in enumerate(trace):
                past = [earlier for earlier in trace[:index + 1]
                        if earlier["atSeconds"] <= item["atSeconds"] - 1.5]
                assert opened[index] == (past[-1]["plateOccupancy"]["a"] if past else False)
        elif stem == "plate_two_inputs":
            states = {(item["plateOccupancy"]["a"], item["plateOccupancy"]["b"]) for item in trace}
            assert states == {(False, False), (True, False), (False, True), (True, True)}
            assert all(item["doorOpen"]["door"] == all(item["plateOccupancy"].values()) for item in trace)
        elif stem == "plate_timer_confound":
            assert all(item["doorOpen"]["door"] == (item["atSeconds"] >= 4) for item in trace)
    clip, control = _traces(stem, "control_a")
    if stem == "plate_timer_confound":
        assert not any(any(item["plateOccupancy"].values()) for item in control)
        assert any(item["doorOpen"]["door"] for item in control)
        _, main = _traces(stem)
        assert any(item["plateOccupancy"]["a"] and not item["doorOpen"]["door"] for item in main)
    else:
        assert not any(any(item["doorOpen"].values()) for item in control)
    if stem in {"plate_crate_hold", "push_onto_plate"}:
        clip, trace = _traces(stem)
        assert any(item["doorOpen"]["door"] and tuple(item["actor"]) != clip.initial.plates["a"]
                   and clip.initial.plates["a"] in item["crates"].values() for item in trace)
    if stem == "plate_delayed":
        _, horizon = _traces(stem, "control_horizon")
        assert horizon[-1]["plateOccupancy"]["a"]
        assert not horizon[-1]["doorOpen"]["door"]
        assert horizon[-1]["pendingEffects"][0]["dueSeconds"] > horizon[-1]["atSeconds"]


def test_push_direction_clearance_chain_release_inertia_and_affordance_controls():
    vectors = set()
    for clip in induction_clips():
        if clip.stem != "push_directions" or "control" in clip.partition:
            continue
        trace = [item[2] for item in clip.replay()]
        for before, after in zip(trace, trace[1:]):
            delta = tuple(after["crates"]["crate"][axis] - before["crates"]["crate"][axis] for axis in (0, 1))
            if delta != (0, 0):
                vectors.add(delta)
    assert vectors == set(DIRECTIONS.values())
    for stem in ("push_wall_blocked", "push_chain"):
        clip, trace = _traces(stem)
        click = next(index + 1 for index, receipt in enumerate(clip.actions) if receipt.action == "CLICK")
        blocked = [index + 1 for index, receipt in enumerate(clip.actions[:click - 1])
                   if receipt.action == "RIGHT" and trace[index]["actor"] == trace[index + 1]["actor"]]
        assert len(blocked) >= 2
        assert trace[click + 1]["crates"] != trace[click]["crates"]
        assert trace[click]["walls"] == []
        _, control = _traces(stem, "control_a")
        assert control[-1]["walls"]
        if stem == "push_chain":
            for before, after in zip(trace, trace[1:]):
                assert (after["crates"]["crate"][0] - before["crates"]["crate"][0]) == (
                    after["crates"]["second"][0] - before["crates"]["second"][0])
    _, immovable = _traces("push_immovable")
    _, movable = _traces("push_immovable", "control_a")
    assert len({tuple(item["crates"]["crate"]) for item in immovable}) == 1
    assert len({tuple(item["crates"]["crate"]) for item in movable}) > 1
    for stem in ("push_release", "push_inertial"):
        clip, trace = _traces(stem)
        release = next(index + 1 for index, receipt in enumerate(clip.actions)
                       if receipt.action == "UP")
        poses = [tuple(item["crates"]["crate"]) for item in trace[release:]]
        assert (len(set(poses)) > 1) == (stem == "push_inertial")
        assert poses[-1] == poses[-2] == poses[-3]
    _, control = _traces("push_inertial", "control_a")
    assert len({tuple(item["crates"]["crate"]) for item in control}) == 1


def test_missing_index_is_empty_unknown_workspace_rejected_and_no_get_writes(tmp_path, client):
    home = tmp_path / "data" / "omega_vision"
    response = client.get("/workbench/recognition/recording-tests?workspaceId=arc3_random_player")
    assert response.status_code == 200
    assert response.json()["tests"] == [] and response.json()["count"] == 0
    assert "not been published" in response.json()["message"]
    assert client.get("/workbench/recognition/recording-tests?workspaceId=not_real").status_code == 404
    assert client.get("/workbench/recognition/recording-tests/moved?workspaceId=arc3_random_player").status_code == 404
    assert not home.exists()


@pytest.mark.parametrize("test_id", ["..%5Coutside", "C%3Asecret", "Moved", "with%20space", "%252e%252e"])
def test_unsafe_ids_never_resolve_storage(test_id, client, monkeypatch):
    monkeypatch.setattr(api, "_home", lambda *args: pytest.fail("Unsafe ID reached storage"))
    response = client.get(f"/workbench/recognition/recording-tests/{test_id}?workspaceId=arc3_random_player")
    assert response.status_code == 422


def test_detail_does_not_enumerate_unrelated_recordings(prepared, client):
    suite = prepared / "recordings" / "events_tests"
    (suite / "plate_momentary_train_a" / "recording.json").unlink()
    response = client.get("/workbench/recognition/recording-tests/moved?workspaceId=arc3_random_player")
    assert response.status_code == 200
    assert client.get("/workbench/recognition/recording-tests?workspaceId=arc3_random_player").status_code == 404


@pytest.mark.parametrize("target,content,status", [
    ("documentation/moved.md", b"", 409),
    ("documentation/moved.md", b"\xff\xff", 409),
    ("moved/recording.json", b"{", 409),
    ("tests.json", b"[]", 409),
    ("moved/1/image.png", None, 404),
    ("documentation/moved.md", None, 404),
])
def test_corrupt_and_unavailable_resources_are_errors(prepared, client, target, content, status):
    path = prepared.joinpath("recordings", "events_tests", *target.split("/"))
    if content is None:
        path.unlink()
    else:
        path.write_bytes(content)
    before = _snapshot(prepared)
    response = client.get("/workbench/recognition/recording-tests/moved?workspaceId=arc3_random_player")
    assert response.status_code == status, response.text
    assert before == _snapshot(prepared)


@pytest.mark.parametrize("field,value", [
    ("id", "../outside"), ("documentationFile", "../outside.md"),
    ("visualSequenceId", "curated/events_tests/moved"),
    ("visualSequenceId", "recordings/events_tests/../outside"),
    ("visualSequenceId", "recordings/events_tests/C:outside"),
    ("frameCount", True), ("executionStatus", "passed"),
])
def test_index_rejects_unsafe_or_untrue_metadata(tmp_path, client, publication, field, value):
    index = json.loads(publication[0][("recordings", "events_tests", "tests.json")])
    entry = index["tests"][0]
    (entry["recordings"][0] if field in {"visualSequenceId", "frameCount"} else entry)[field] = value
    path = tmp_path / "data" / "omega_vision" / "recordings" / "events_tests" / "tests.json"
    path.parent.mkdir(parents=True)
    path.write_text(json.dumps(index), encoding="utf-8")
    before = _snapshot(path.parent)
    response = client.get("/workbench/recognition/recording-tests?workspaceId=arc3_random_player")
    assert response.status_code == 409
    assert before == _snapshot(path.parent)


@pytest.mark.parametrize("parts", [
    ("recordings", "events_tests", "plate_momentary_train_a", "0", "image.png"),
    ("recordings", "events_tests", "plate_momentary_train_a", "0", "state.json"),
    ("recordings", "events_tests", "plate_momentary_train_a", "recording.json"),
    ("recordings", "events_tests", "plate_momentary_train_a", "evaluation.json"),
    ("recordings", "events_tests", "documentation", "moved.md"),
    ("recordings", "events_tests", "tests.json"),
    ("locks", originals.SUITE_ID, ".writer.lock"),
])
def test_every_new_writer_preflights_canonical_path_before_publication(tmp_path, monkeypatch, publication, parts):
    home = tmp_path / "data" / "omega_vision"
    original = originals.storage_path
    monkeypatch.setattr(fixtures, "recording_test_files", lambda: publication)
    monkeypatch.setattr(originals, "storage_path", lambda root, *requested:
                        home / "redirect" / requested[-1] if requested == parts else original(root, *requested))
    with pytest.raises(ValueError, match="redirect"):
        fixtures.create_recording_tests(tmp_path)
    assert not (home / "recordings").exists()
    assert not (home / "redirect").exists()


def test_conflicting_doc_aborts_all_new_clips_before_any_write(tmp_path, monkeypatch, publication):
    home = tmp_path / "data" / "omega_vision"
    doc = home / "recordings" / "events_tests" / "documentation" / "push_onto_plate.md"
    doc.parent.mkdir(parents=True)
    doc.write_text("A user's newer plan.", encoding="utf-8")
    monkeypatch.setattr(fixtures, "recording_test_files", lambda: publication)
    with pytest.raises(FileExistsError, match="preserved without overwrite"):
        fixtures.create_recording_tests(tmp_path)
    assert [path.relative_to(home).as_posix() for path in home.rglob("*") if path.is_file() and path.name != ".writer.lock"] == [
        "recordings/events_tests/documentation/push_onto_plate.md"]
    assert not (home / ".cache").exists()


@pytest.mark.parametrize("parts", [
    ("documentation", "moved.md"), ("moved", "recording.json"), ("moved", "1", "image.png"), ("tests.json",),
])
def test_get_rejects_even_in_root_redirects(tmp_path, client, monkeypatch, publication, parts):
    home = tmp_path / "data" / "omega_vision"
    # Only the selected test's resources are needed for a targeted reader test.
    index = json.loads(publication[0][("recordings", "events_tests", "tests.json")])
    index["tests"] = [entry for entry in index["tests"] if entry["id"] == "moved"]
    index["count"] = 1
    files = {
        path: data for path, data in publication[0].items()
        if path[2] == "moved" or path[2:] == ("documentation", "moved.md")
    }
    files[("recordings", "events_tests", "tests.json")] = originals._json(index)
    originals.publish_recording_files(tmp_path, files)
    original = api.storage_path
    monkeypatch.setattr(api, "storage_path", lambda root, *requested:
                        home / "redirect" / requested[-1] if requested == ("recordings", "events_tests", *parts)
                        else original(root, *requested))
    before = _snapshot(home)
    response = client.get("/workbench/recognition/recording-tests/moved?workspaceId=arc3_random_player")
    assert response.status_code == 403, response.text
    assert before == _snapshot(home)


def test_cache_redirection_and_external_root_are_rejected(tmp_path, monkeypatch, publication):
    from omega_vision.perception import visual_sequence_list_cache as cache
    home = tmp_path / "data" / "omega_vision"
    monkeypatch.setattr(fixtures, "recording_test_files", lambda: publication)
    with pytest.raises(ValueError, match="Unrecognized"):
        fixtures.create_recording_tests(tmp_path / "external")
    original = cache.storage_path
    monkeypatch.setattr(cache, "storage_path", lambda root, *parts:
                        home / "wrong_cache" if parts == (".cache", "visual-sequence-list", "dirty.json")
                        else original(root, *parts))
    with pytest.raises(ValueError, match="redirect"):
        fixtures.create_recording_tests(tmp_path)
    assert not (home / "recordings").exists()
    assert not (home / "wrong_cache").exists()


def test_real_directory_symlink_is_rejected_for_publication_and_get(tmp_path, client, publication, monkeypatch):
    home = tmp_path / "data" / "omega_vision"
    suite = home / "recordings" / "events_tests"
    suite.mkdir(parents=True)
    destination = home / "unrelated"
    destination.mkdir()
    link = suite / "documentation"
    try:
        link.symlink_to(destination, target_is_directory=True)
    except OSError:
        # Windows junctions are also reparse points and do not require symlink privilege.
        import os
        import subprocess
        if os.name != "nt":
            raise
        result = subprocess.run([os.environ["COMSPEC"], "/c", "mklink", "/J", str(link), str(destination)],
                                capture_output=True, text=True)
        assert result.returncode == 0, result.stderr
    monkeypatch.setattr(fixtures, "recording_test_files", lambda: publication)
    with pytest.raises(ValueError, match="redirect"):
        fixtures.create_recording_tests(tmp_path)
    (suite / "tests.json").write_bytes(publication[0][("recordings", "events_tests", "tests.json")])
    response = client.get("/workbench/recognition/recording-tests/moved?workspaceId=arc3_random_player")
    assert response.status_code == 403
    assert not list(destination.iterdir())
