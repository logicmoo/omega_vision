import importlib
import json
import sys
from pathlib import Path
from types import SimpleNamespace

import pytest
from fastapi import FastAPI, HTTPException
from fastapi.testclient import TestClient

from omega_vision.services.recording_import_safety import claim_import_directory


@pytest.fixture(params=["arc3_play_api", "omega_vision.services.arc3_play"])
def play(request, tmp_path, monkeypatch):
    module = importlib.import_module(request.param)
    monkeypatch.setattr(module, "_workspace_root", lambda _: tmp_path)
    monkeypatch.setattr(module, "_scan_setup_dir", lambda *args: {})
    monkeypatch.setitem(sys.modules, "image_codec", SimpleNamespace(frame_to_png_bytes=lambda _: b"new-frame"))
    return module


def snapshot(directory):
    return {str(path.relative_to(directory)): path.read_bytes()
            for path in directory.rglob("*") if path.is_file()}


def existing_recording(root, source, name="existing"):
    game = root / "data" / "omega_vision" / "recordings" / "game"
    recording = game / name
    files = {
        "recording.json": json.dumps({"kind": "arc3_play_recording", "imported_from": source, "moves": []}),
        "image.png": "original-frame",
        "0/image.png": "original-next-frame",
        "0/state.json": '{"observation":"original"}',
        "0/todos.json": '{"todos":[{"status":"done"}]}',
        "0/parts_extraction_0/python_opencv/result.pl": "original_result.",
        "0/memory/objects_db.metta": '(Object "original-object")',
        "memory_level_1_stm/shapes_db.metta": '(Shape "original-shape")',
    }
    for relative, content in files.items():
        path = recording / relative
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(content, encoding="utf-8")
    (game / "savepoints.json").write_text(json.dumps([
        {"id": "original-savepoint", "imported_from": source, "level_directory": str(recording)}
    ]))
    return game, recording


def human_source(root, name="source"):
    source = root / "data" / "omega_vision" / "importables" / f"{name}.jsonl"
    source.parent.mkdir(parents=True, exist_ok=True)
    source.write_text(json.dumps({"data": {
        "game_id": "game", "guid": "fixed-source", "frame": [[[0]]],
        "levels_completed": 0, "state": "NOT_FINISHED", "action_input": {"id": 0},
    }}))
    return "data/importables/" + source.name


@pytest.mark.parametrize("route", ["import-recording", "import-movelist"])
@pytest.mark.parametrize("alias", [False, True])
def test_unconfirmed_reimport_preserves_all_existing_bytes(play, tmp_path, route, alias):
    source = human_source(tmp_path)
    game, _ = existing_recording(tmp_path, source)
    before = snapshot(game)
    app = FastAPI()
    app.include_router(play.router)
    with TestClient(app) as client:
        response = client.post(f"{play.router.prefix}/{route}", json={
            "workspaceId": "workspace", "path": source.replace("data/", "data/omega_vision/", 1) if alias else source,
        })
    assert response.status_code == 409, response.text
    assert snapshot(game) == before


def test_release_import_guard_preserves_recording_and_memory(play, tmp_path):
    run = tmp_path / "data" / "omega_vision" / "importables" / "game" / "run"
    run.mkdir(parents=True)
    source = "data/importables/game/run"
    game, _ = existing_recording(tmp_path, source)
    before = snapshot(game)
    with pytest.raises(play.HTTPException) as failure:
        play._write_imported_release_run(tmp_path, source, None, run, [SimpleNamespace()])
    assert failure.value.status_code == 409
    assert snapshot(game) == before


def test_existing_safe_name_suffix_policy_does_not_replace_other_sources(play, tmp_path):
    source = human_source(tmp_path, "existing")
    game, old = existing_recording(tmp_path, "data/importables/different.jsonl")
    before = snapshot(old)
    result = play._import_recording(tmp_path, source, None)
    assert result["imported"]["levelDirs"] == ["data/recordings/game/existing_2"]
    assert snapshot(old) == before
    entries = json.loads((game / "savepoints.json").read_text())
    assert entries[0]["id"] == "original-savepoint"
    assert len(entries) == 2


def test_racing_directory_collision_fails_before_existing_target_is_touched(play, tmp_path, monkeypatch):
    source = human_source(tmp_path, "new-source")
    _, old = existing_recording(tmp_path, "data/importables/different.jsonl")
    before = snapshot(old)
    monkeypatch.setattr(play, "_import_instance_dir_name", lambda *args: "existing")
    with pytest.raises(play.HTTPException) as failure:
        play._import_recording(tmp_path, source, None)
    assert failure.value.status_code == 409
    assert snapshot(old) == before


def test_atomic_directory_claim_never_reopens_an_existing_recording(tmp_path):
    _, recording = existing_recording(tmp_path, "source")
    before = snapshot(recording)
    with pytest.raises(HTTPException) as failure:
        claim_import_directory(recording)
    assert getattr(failure.value, "status_code", None) == 409
    assert snapshot(recording) == before
