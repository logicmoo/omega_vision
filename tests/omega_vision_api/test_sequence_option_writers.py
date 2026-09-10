from __future__ import annotations

import importlib
import json
import os
import sys
from pathlib import Path
from types import SimpleNamespace

import pytest

from omega_vision import inherited_source_overlay as storage
from omega_vision.perception import visual_sequence_list_cache as cache


@pytest.fixture(params=["omega_vision.services.arc3_play", "arc3_play_api"])
def play(request, monkeypatch, omega_repository):
    module = importlib.import_module(request.param)
    monkeypatch.setattr(module, "_workspace_root", lambda _workspace: omega_repository)
    monkeypatch.setattr(module, "_sessions", {})
    return module


@pytest.fixture
def invalidations(monkeypatch, omega_repository):
    events = []
    original = cache.invalidate_visual_sequence_list

    def invalidate(root=None):
        home = storage.shared_storage_path() if root is None else storage.vision_data_root(root)
        assert home == omega_repository / "data" / "omega_vision"
        original(root)
        events.append(sorted(str(path.relative_to(home)) for path in home.rglob("image.png")))

    monkeypatch.setattr(cache, "invalidate_visual_sequence_list", invalidate)
    return events


def recording(root, name="sample", *, imported=None):
    directory = root / "data" / "omega_vision" / "recordings" / "game" / name
    directory.mkdir(parents=True)
    manifest = {"level_directory": f"data/recordings/game/{name}", "moves": []}
    if imported:
        manifest["imported_from"] = imported
    (directory / "recording.json").write_text(json.dumps(manifest), encoding="utf-8")
    (directory / "image.png").write_bytes(b"frame")
    return directory


def bare_session(play, root):
    session = object.__new__(play.PlaySession)
    session.workspace_root = root
    session.game_id = "game"
    session.game_dir = "game"
    session.id = "session"
    session.created_at = "2026-09-10T00:00:00Z"
    session._last_level = "1"
    session._level_moves = []
    session.recording = True
    session.runner = SimpleNamespace(_state_payload=lambda: {"level": "1"})
    session._frame_png = lambda: b"frame"
    return session


@pytest.mark.parametrize("fail", [False, True])
def test_capture_invalidates_before_and_after_partial_or_complete_write(
    play, omega_repository, invalidations, monkeypatch, fail,
):
    session = bare_session(play, omega_repository)
    monkeypatch.setattr(play, "_jsonable", lambda data: data)
    directory = omega_repository / "data" / "omega_vision" / "recordings" / "game" / "new" / "0"
    if fail:
        def failing_payload():
            raise RuntimeError("state write failed")
        session.runner._state_payload = failing_payload
        with pytest.raises(RuntimeError, match="state write failed"):
            session._write_node(directory, incoming_action="ACTION1", action_data={}, ordinal=0)
    else:
        session._write_node(directory, incoming_action="ACTION1", action_data={}, ordinal=0)
        assert (directory / "state.json").is_file()
    assert invalidations == [[], [str(directory.relative_to(storage.shared_storage_path()) / "image.png")]]


def test_recording_metadata_and_detached_capture(play, omega_repository, invalidations):
    session = bare_session(play, omega_repository)
    session.level_dir = recording(omega_repository)
    session._level_moves.append({"index": 0})
    session._write_recording()
    assert len(invalidations) == 2
    assert json.loads((session.level_dir / "recording.json").read_text())["moves"] == [{"index": 0}]
    invalidations.clear()
    session.recording = False
    session.runner.current_level_label = lambda: "2"
    session._write_recording()
    session._begin_level_dir("detached")
    assert not invalidations


@pytest.mark.parametrize("release", [False, True])
def test_import_transaction_invalidates_around_real_frames(
    play, omega_repository, invalidations, monkeypatch, release,
):
    monkeypatch.setitem(sys.modules, "image_codec", SimpleNamespace(frame_to_png_bytes=lambda _grid: b"frame"))
    home = storage.shared_storage_path()
    if release:
        directory = home / "importables" / "game" / "release"
        workspace = directory / "workspace"
        workspace.mkdir(parents=True)
        (workspace / "log.txt").write_text("fixture", encoding="utf-8")
        (workspace / "arclog.py").write_text(
            "from types import SimpleNamespace\n"
            "def load(path):\n"
            "    return [SimpleNamespace(settled=[[0]], state='NOT_FINISHED', "
            "available=[], levels_completed=0, win_levels=0, step=0)]\n",
            encoding="utf-8",
        )
        result = play._import_release_run(omega_repository, "data/importables/game/release", None)
    else:
        source = home / "importables" / "human.json"
        source.parent.mkdir(parents=True)
        source.write_text(json.dumps({"data": {
            "game_id": "game", "frame": [[[0]]], "action_input": {"id": 0},
        }}), encoding="utf-8")
        result = play._import_recording(omega_repository, "data/importables/human.json", None)
    assert result["imported"]["levelDirs"]
    assert len(invalidations) == 2
    assert invalidations[0] == []
    assert len(invalidations[1]) == 1
    assert list((home / "recordings" / "game").rglob("recording.json"))


def test_invalid_import_and_movelist_only_leave_options_clean(
    play, omega_repository, invalidations,
):
    source = storage.shared_storage_path("importables", "human.json")
    source.parent.mkdir(parents=True)
    source.write_text("{}", encoding="utf-8")
    with pytest.raises(play.HTTPException):
        play._import_recording(omega_repository, "data/importables/human.json", None)
    source.write_text(json.dumps({"data": {
        "game_id": "game", "frame": [[[0]]], "action_input": {"id": 0},
    }}), encoding="utf-8")
    play._import_recording_as_movelist(omega_repository, "data/importables/human.json", None)
    play.list_recording_dirs(workspaceId="workspace-a", gameId="game")
    play.list_savepoints(workspaceId="workspace-b", gameId="game")
    assert not invalidations


def test_duplicate_and_delete_invalidate_and_preserve_shared_identity(
    play, omega_repository, invalidations,
):
    original = recording(omega_repository)
    result = play.duplicate_recording_dir({"workspaceId": "workspace-a", "path": "data/recordings/game/sample"})
    copied = storage.resolve_workspace_child(omega_repository, result["path"])
    assert copied.is_dir() and original.is_dir()
    assert len(invalidations) == 2
    assert len(invalidations[0]) == 1 and len(invalidations[1]) == 2
    play.delete_recording_dir({"workspaceId": "workspace-b", "path": result["path"]})
    assert len(invalidations) == 4
    assert not copied.exists() and original.exists()


@pytest.mark.parametrize("operation", ["clear", "retain", "purge", "dedupe"])
def test_bulk_removals_only_invalidate_real_mutations(
    play, omega_repository, invalidations, operation,
):
    old = recording(omega_repository, "old", imported="source")
    new = recording(omega_repository, "new", imported="source")
    os.utime(old / "recording.json", (1, 1))
    os.utime(new / "recording.json", (301, 301))
    if operation == "clear":
        mutate = lambda: play.clear_recordings(workspaceId="workspace", gameId="game")
    elif operation == "retain":
        mutate = lambda: play.retain_largest_recordings(workspaceId="workspace", gameId="game", keep=0)
    elif operation == "purge":
        mutate = lambda: play._purge_prior_import(omega_repository, "game", "source")
    else:
        mutate = lambda: play._dedupe_recordings_in(omega_repository, old.parent)
    mutate()
    assert not old.exists()
    assert len(invalidations) == (2 if operation == "dedupe" else 4)
    invalidations.clear()
    mutate()
    assert not invalidations


def test_rename_invalidates_whole_transaction_and_noop_stays_clean(
    play, omega_repository, invalidations,
):
    directory = recording(omega_repository, imported="source")
    renamed = play._sort_recordings_by_size_in(omega_repository, directory.parent)
    assert renamed == [("data/recordings/game/sample", "data/recordings/game/sample_size_0001")]
    assert invalidations[0] == [str(Path("recordings") / "game" / "sample" / "image.png")]
    assert invalidations[-1] == [str(Path("recordings") / "game" / "sample_size_0001" / "image.png")]
    invalidations.clear()
    assert play._sort_recordings_by_size_in(omega_repository, directory.parent) == []
    assert not invalidations


def test_copy_failure_still_invalidates_finally(play, omega_repository, invalidations, monkeypatch):
    recording(omega_repository)

    def fail_copy(*_args, **_kwargs):
        raise OSError("copy interrupted")

    if hasattr(play, "resources"):
        monkeypatch.setattr(play.resources, "copy_tree", fail_copy)
    else:
        monkeypatch.setattr(play.shutil, "copytree", fail_copy)
    with pytest.raises(OSError, match="copy interrupted"):
        play.duplicate_recording_dir({"workspaceId": "workspace", "path": "data/recordings/game/sample"})
    assert len(invalidations) == 2


@pytest.mark.parametrize("name,subdir,dirty", [
    ("manifest.json", "", True),
    ("recording.json", "", True),
    ("image.provenance.json", "", True),
    ("image.png", "", True),
    ("result.pl", "", False),
    ("result.json", "", False),
    ("image.png", "/transforms/result", False),
    ("image.png", "/preprocessing/result", False),
])
def test_silo_only_invalidates_option_inputs(
    play, omega_repository, invalidations, name, subdir, dirty,
):
    play.silo_write({
        "workspaceId": "workspace", "dir": "data/curated/sample" + subdir,
        "name": name, "content": "{}",
    })
    assert len(invalidations) == (2 if dirty else 0)


def test_unsafe_silo_and_legacy_delete_stay_rejected(play, omega_repository, invalidations):
    with pytest.raises(play.HTTPException):
        play.silo_write({
            "workspaceId": "workspace", "dir": "../outside", "name": "image.png", "content": "bad",
        })
    legacy = storage.shared_storage_path("arc_recordings", "old")
    legacy.mkdir(parents=True)
    (legacy / "image.png").write_bytes(b"frame")
    with pytest.raises(play.HTTPException):
        play.delete_recording_dir({"workspaceId": "workspace", "path": "data/arc_recordings/old"})
    assert (legacy / "image.png").exists()
    assert not invalidations


@pytest.mark.parametrize("fail", [False, True])
def test_reduce_manifest_counts_invalidate_inside_existing_writer_lock(
    omega_repository, invalidations, monkeypatch, fail,
):
    from omega_vision.services import video_import_pipeline as pipeline

    path = storage.shared_storage_path("curated", "sample", "manifest.json")
    path.parent.mkdir(parents=True)
    payload = {"count": 1, "items": [{"id": "frame", "rows": [{}]}]}
    write_text = Path.write_text

    def checked_write(target, *args, **kwargs):
        if target == path:
            assert pipeline._reduce_manifest_lock.locked()
            assert len(invalidations) == 1
            if fail:
                raise OSError("manifest interrupted")
        return write_text(target, *args, **kwargs)

    monkeypatch.setattr(Path, "write_text", checked_write)
    if fail:
        with pytest.raises(OSError, match="manifest interrupted"):
            pipeline._write_reduction_manifest(omega_repository, path, payload)
    else:
        pipeline._write_reduction_manifest(omega_repository, path, payload)
        assert json.loads(path.read_text()) == payload
    assert len(invalidations) == 2
