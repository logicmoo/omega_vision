from io import BytesIO
import hashlib
import json

from fastapi import FastAPI
from fastapi.testclient import TestClient
from PIL import Image
import pytest

from omega_vision.evaluation import event_recordings as fixtures
from omega_vision.evaluation.event_recording_cases import SIZE, event_cases
from omega_vision.perception.contextual_memory import recording_context
from omega_vision.perception.event_records import PHASES, PREDICATES, validate_term
from omega_vision.services import arc3_play, video_import_api as api
from workbench_api_server import arc3_play_api as workbench_play


def test_cases_cover_each_registered_event_and_relation_phase():
    cases = event_cases()
    fixtures.validate_cases(cases)
    events = {name for name, spec in PREDICATES.items() if spec.category == "event" and name not in PHASES}
    relations = {name for name, spec in PREDICATES.items() if spec.category == "relation"}
    assert {case.name for case in cases} == events | relations | {"no_material_change", "unknown"}
    for case in cases:
        if case.name in relations:
            assert {event.term.predicate for event in case.expected} == PHASES
            assert [event.frame for event in case.expected] == sorted(event.frame for event in case.expected)
        if case.name in events:
            assert len(case.expected) == 1
            assert case.expected[0].term.predicate == case.name


def test_numbered_frames_are_real_recordings_in_both_workspaces(tmp_path, monkeypatch):
    result = fixtures.create_event_recordings(tmp_path)
    home = tmp_path / "data" / "omega_vision"
    expected_ids = {f"recordings/events_tests/{case.name}" for case in event_cases()}
    for name in ("arc3_random_player", "second"):
        (tmp_path / "workspaces" / name).mkdir(parents=True)
    for module in (api, arc3_play, workbench_play):
        monkeypatch.setattr(module, "_workspace_root", lambda name: tmp_path / "workspaces" / name)
    app = FastAPI()
    app.include_router(api.router)
    app.include_router(workbench_play.router)
    with TestClient(app) as client:
        shared_options = []
        for workspace in ("arc3_random_player", "second"):
            response = client.get(f"{api.router.prefix}/visual-sequences?workspaceId={workspace}")
            assert response.status_code == 200, response.text
            options = response.json()["visualSequences"]
            shared_options.append({item["id"]: item for item in options if item["id"] in expected_ids})
            listed = client.get(f"{api.router.prefix}/arc-recordings?workspaceId={workspace}")
            assert listed.status_code == 200, listed.text
            assert {item["path"][5:] for item in listed.json()["recordings"]} == expected_ids
            for module in (arc3_play, workbench_play):
                listing = module.list_recording_dirs(workspace, gameId="events_tests")["recordingDirs"]
                assert {item["path"][5:] for item in listing} == expected_ids
                assert all(item["family"] == "recording" and item["hasManifest"] and not item["readOnly"]
                           for item in listing)
        assert set(shared_options[0]) == expected_ids
        assert shared_options[0] == shared_options[1]
        assert all(item["ordered"] and item["kind"] == "arc-recording" for item in shared_options[0].values())
    total = 0
    for case in event_cases():
        directory = home / "recordings" / "events_tests" / case.name
        context = recording_context(home, directory, "0")
        assert [moment.frame_id for moment in context.moments] == [str(i) for i in range(len(case.frames))]
        _, units, ordering = api._sequence_execution_context(tmp_path, f"data/recordings/events_tests/{case.name}")
        assert ordering["ordered"]
        assert [unit["id"] for unit in units] == [str(i) for i in range(len(case.frames))]
        assert all(unit["image"] == directory / str(i) / "image.png" for i, unit in enumerate(units))
        assert shared_options[0][f"recordings/events_tests/{case.name}"]["imageCount"] == len(units)
        total += len(units)
    assert total == result["frameCount"]
    assert not list((tmp_path / "workspaces").rglob("*.*"))
    assert not (home / "preferences").exists()
    assert not (home / "workspaces").exists()


def test_oracle_is_separate_from_frame_state_and_decodes_to_authored_pixels(tmp_path):
    fixtures.create_event_recordings(tmp_path)
    suite = tmp_path / "data" / "omega_vision" / "recordings" / "events_tests"
    for case in event_cases():
        directory = suite / case.name
        oracle = json.loads((directory / "expected_events.json").read_text())
        manifest = json.loads((directory / "recording.json").read_text())
        assert oracle["recognizerStatus"] == "not_run"
        assert oracle["comparisonPolicy"]["groundTruthIsRecognizerInput"] is False
        assert oracle["comparisonPolicy"]["initialFrame"] == "baseline_only"
        pngs = []
        for index, frame in enumerate(case.frames):
            png = (directory / str(index) / "image.png").read_bytes()
            assert png == fixtures.render_frame(frame)
            assert hashlib.sha256(png).hexdigest() == oracle["frames"][index]["sha256"]
            with Image.open(BytesIO(png)) as image:
                assert image.size == SIZE and image.mode == "RGB"
                image.verify()
            state = json.loads((directory / str(index) / "state.json").read_text())
            assert state["step_count"] == index
            assert state["incoming_action"] == (None if index == 0 else "FRAME")
            assert state["action_data"] == {}
            assert manifest["moves"][index]["directory"] == f"data/recordings/events_tests/{case.name}/{index}"
            assert not {"expectedEvents", "authoredObjects", "authoredAnnotations"} & state.keys()
            pngs.append(png)
        if case.name == "no_material_change":
            assert len(set(pngs)) == 1
        else:
            assert len(set(pngs)) > 1, f"{case.name} needs actual visual change"
        for event in oracle["expectedEvents"]:
            validate_term(event["term"], entity_ids=oracle["entityIds"], categories={"event"})
        assert not list(directory.rglob("*.metta"))
        assert not list(directory.rglob("memory"))


def test_generator_is_idempotent_and_preserves_unrelated_files(tmp_path):
    result = fixtures.create_event_recordings(tmp_path)
    home = tmp_path / "data" / "omega_vision"
    unrelated = home / "recordings" / "events_tests" / "appeared" / "user_note.txt"
    unrelated.write_text("User annotation to preserve.")
    before = {path: (path.read_bytes(), path.stat().st_mtime_ns)
              for path in home.rglob("*") if path.is_file() and path.name != ".writer.lock"}
    repeated = fixtures.create_event_recordings(tmp_path)
    assert repeated["createdFileCount"] == 0
    assert repeated["reusedFileCount"] == result["createdFileCount"]
    assert before == {path: (path.read_bytes(), path.stat().st_mtime_ns)
                      for path in home.rglob("*") if path.is_file() and path.name != ".writer.lock"}


def test_visible_examples_exhibit_the_named_changes():
    cases = {case.name: case for case in event_cases()}

    def images(name):
        return [Image.open(BytesIO(fixtures.render_frame(frame))).convert("RGB") for frame in cases[name].frames]

    def foreground(image):
        return {(x, y) for y in range(image.height) for x in range(image.width)
                if image.getpixel((x, y)) != (0, 0, 0)}

    appeared = images("appeared")
    assert foreground(appeared[0]) == set()
    assert len(foreground(appeared[1])) == 36 and appeared[1].getbbox() == (12, 20, 18, 26)
    entered = images("entered")
    assert [len(foreground(image)) for image in entered] == [0, 12, 36, 36]
    exited = images("exited")
    assert [len(foreground(image)) for image in exited] == [36, 36, 24, 0]
    for name, counts in (
        ("scaled", [36, 100]), ("deformed", [36, 36]), ("shape_changed", [20, 20]),
        ("area_changed", [64, 66]), ("hole_opened", [64, 28]), ("hole_closed", [28, 64]),
    ):
        assert [len(foreground(image)) for image in images(name)] == counts
    before, after = images("color_changed")
    assert foreground(before) == foreground(after)
    assert before.getpixel((12, 20)) != after.getpixel((12, 20))
    before, after = images("rotated")
    crop = (12, 20, 18, 26)
    assert before.crop(crop).transpose(Image.Transpose.ROTATE_270).tobytes() == after.crop(crop).tobytes()
    for name, expected in (
        ("moved", [(4, 0)]), ("turned", [(4, 0), (0, 4), (0, 4)]),
        ("accelerated", [(2, 0), (4, 0)]), ("decelerated", [(4, 0), (2, 0)]),
        ("move", [(4, 0), (4, 0), (0, 0)]),
    ):
        boxes = [image.getbbox() for image in images(name)]
        assert [(b[0] - a[0], b[1] - a[1]) for a, b in zip(boxes, boxes[1:])] == expected


def test_existing_parent_file_aborts_before_any_recording_write(tmp_path):
    suite = tmp_path / "data" / "omega_vision" / "recordings" / "events_tests"
    suite.mkdir(parents=True)
    (suite / "moved").write_text("User-owned file, not a recording directory.")
    with pytest.raises(FileExistsError, match="parent is not a directory"):
        fixtures.create_event_recordings(tmp_path)
    assert [path.name for path in suite.iterdir()] == ["moved"]


def test_changed_existing_case_aborts_before_any_recording_write(tmp_path):
    home = tmp_path / "data" / "omega_vision"
    path = home / "recordings" / "events_tests" / "moved" / "0" / "image.png"
    path.parent.mkdir(parents=True)
    path.write_bytes(b"user-owned")
    with pytest.raises(FileExistsError, match="preserved without overwrite"):
        fixtures.create_event_recordings(tmp_path)
    assert path.read_bytes() == b"user-owned"
    assert set((home / "recordings" / "events_tests").iterdir()) == {path.parent.parent}
    assert not (home / ".cache").exists()


@pytest.mark.parametrize("parts", [
    ("recordings", "events_tests", "moved", "1", "image.png"),
    ("recordings", "events_tests", "moved", "1", "state.json"),
    ("recordings", "events_tests", "moved", "expected_events.json"),
    ("recordings", "events_tests", "moved", "recording.json"),
    ("recordings", "events_tests", "suite.json"),
    ("locks", fixtures.SUITE_ID, ".writer.lock"),
])
def test_every_output_rejects_redirected_storage(tmp_path, monkeypatch, parts):
    home = tmp_path / "data" / "omega_vision"
    original = fixtures.storage_path

    def redirected(root, *requested):
        if requested == parts:
            return home / "elsewhere" / requested[-1]
        return original(root, *requested)

    monkeypatch.setattr(fixtures, "storage_path", redirected)
    with pytest.raises(ValueError, match="redirect"):
        fixtures.create_event_recordings(tmp_path)
    assert not (home / "recordings").exists()
    assert not (home / "elsewhere").exists()


def test_external_root_rejected_without_fallback(tmp_path):
    outside = tmp_path.parent / "unapproved-event-fixtures"
    with pytest.raises(ValueError, match="Unrecognized"):
        fixtures.create_event_recordings(outside)
    assert not outside.exists()
    assert not (tmp_path / "data" / "omega_vision" / "recordings").exists()
