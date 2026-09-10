from concurrent.futures import ThreadPoolExecutor
from contextlib import contextmanager
import importlib
import json
import os
from pathlib import Path
from threading import Event

from fastapi import HTTPException
import pytest

from omega_vision import inherited_source_overlay as overlay
from omega_vision.perception import metta_memory
from omega_vision.services import memory_mutation_safety as safety
from omega_vision.services import video_import_api as video


@pytest.fixture
def repository(tmp_path, monkeypatch):
    monkeypatch.setattr(overlay, "_REPO_ROOT", tmp_path)
    home = tmp_path / "data" / "omega_vision"
    home.mkdir(parents=True)
    return tmp_path, home


def snapshot(directory):
    return {str(path.relative_to(directory)): path.read_bytes()
            for path in directory.rglob("*") if path.is_file()}


def forbidden(*args, **kwargs):
    raise AssertionError("Destructive operation or external job must not start")


@pytest.mark.parametrize("relative", [
    "memory_level_1_stm/shapes_db.metta",
    "actual-frame/memory/induced_rules.metta",
    "other/shape_group_classes_db.metta",
    "other/groups_db.metta",
    "other/old.memory.json",
    "old/identity_dir/identities.db.pl",
])
def test_memory_or_history_blocks_tree_mutation_without_payload_parsing(repository, relative):
    root, home = repository
    recording = home / "recordings" / "game" / "recording"
    path = recording / relative
    path.parent.mkdir(parents=True)
    path.write_bytes(b"existing opaque history; never convert or rewrite")
    before = snapshot(recording)
    with pytest.raises(HTTPException) as failure:
        with safety.preserve_memory_trees(root, recording):
            forbidden()
    assert failure.value.status_code == 409
    assert snapshot(recording) == before


@pytest.mark.parametrize("module_name", ["arc3_play_api", "omega_vision.services.arc3_play"])
@pytest.mark.parametrize("operation", ["copy", "delete", "rename", "dedupe", "retain", "clear"])
def test_recording_tree_operations_preserve_memory_before_any_mutation(repository, monkeypatch, module_name, operation):
    root, home = repository
    play = importlib.import_module(module_name)
    monkeypatch.setattr(play, "_workspace_root", lambda _: root)
    game = home / "recordings" / "game"
    protected = game / "z-protected"
    plain = game / "a-plain"
    for directory in (protected, plain):
        directory.mkdir(parents=True)
        (directory / "recording.json").write_text(json.dumps({
            "kind": "arc3_play_recording", "imported_from": "fixture-source",
        }), encoding="utf-8")
    memory = protected / "actual-frame" / "memory"
    memory.mkdir(parents=True)
    (memory / "objects_db.metta").write_bytes(b"existing immutable object history")
    os.utime(protected / "recording.json", (1000, 1000))
    os.utime(plain / "recording.json", (10000, 10000))
    before = snapshot(game)
    if module_name == "arc3_play_api":
        for method in ("delete_tree", "copy_tree", "move"):
            monkeypatch.setattr(play.resources, method, forbidden)
    else:
        monkeypatch.setattr(play.shutil, "rmtree", forbidden)
        monkeypatch.setattr(play.shutil, "copytree", forbidden)
        monkeypatch.setattr(Path, "rename", forbidden)
    with pytest.raises(HTTPException) as failure:
        if operation == "copy":
            play._copy_recording_dir(root, protected, game / "new-copy")
        elif operation == "delete":
            play.delete_recording_dir({"workspaceId": "editor", "path": "data/recordings/game/z-protected"})
        elif operation == "rename":
            play._rename_recording_dirs(root, game, [
                ("data/recordings/game/a-plain", "data/recordings/game/new-plain", plain, game / "new-plain"),
                ("data/recordings/game/z-protected", "data/recordings/game/new-protected", protected, game / "new-protected"),
            ])
        elif operation == "dedupe":
            play._dedupe_recordings_in(root, game)
        elif operation == "retain":
            play.retain_largest_recordings("editor", keep=0, gameId="game")
        else:
            play.clear_recordings("editor", gameId="game")
    assert failure.value.status_code == 409
    assert snapshot(game) == before


def test_video_reextraction_cannot_replace_existing_frames_or_start_a_job(repository, monkeypatch):
    root, home = repository
    source = home / "importables" / "clip" / "video.mp4"
    source.parent.mkdir(parents=True)
    source.write_bytes(b"fixture video; no media reader should run")
    frames = video._video_frames_dir(root, source)
    (frames / "actual-frame" / "memory").mkdir(parents=True)
    (frames / "actual-frame" / "memory" / "deduction_rules.metta").write_bytes(b"existing rule history")
    before = snapshot(frames)
    monkeypatch.setattr(video, "_workspace_root", lambda _: root)
    monkeypatch.setattr(video, "_probe_duration_seconds", forbidden)
    monkeypatch.setattr(video.threading, "Thread", forbidden)
    jobs = set(video._extract_jobs)
    with pytest.raises(HTTPException) as failure:
        video.extract_frames({"workspaceId": "editor", "video": "data/importables/clip/video.mp4"})
    assert failure.value.status_code == 409
    assert snapshot(frames) == before and set(video._extract_jobs) == jobs


def test_fresh_pipeline_output_reset_rejects_nested_memory_before_deleting_or_queueing(repository, monkeypatch):
    from PIL import Image
    root, home = repository
    sequence = home / "curated" / "fixture"
    pool = sequence / "pool"
    pool.mkdir(parents=True)
    Image.new("RGB", (2, 2), "white").save(pool / "a.png")
    output = sequence / "transforms" / "a" / "parts_extraction_0" / "python_opencv"
    output.mkdir(parents=True)
    (output / "objects_db.metta").write_bytes(b"historical object data retained without reinterpretation")
    before = snapshot(sequence)
    monkeypatch.setattr(video, "_workspace_root", lambda _: root)
    monkeypatch.setattr(video, "_resolve_set_dir", lambda *_: sequence)
    monkeypatch.setattr(video, "_pooler_point_at", forbidden)
    monkeypatch.setattr(video.shutil, "rmtree", forbidden)
    with pytest.raises(HTTPException) as failure:
        video.sequence_set_transform({
            "workspaceId": "editor", "set": "curated/fixture", "moves": ["a"],
            "pipeline": [{"transformation": "parts_extraction_0", "doer": "python_opencv",
                          "options": {}, "dependsOn": [], "priority": 10}],
            "planOnly": True, "freshTodos": True, "workers": 1,
        })
    assert failure.value.status_code == 409
    assert snapshot(sequence) == before


def test_redirected_or_unreadable_descendants_fail_closed(repository, monkeypatch):
    root, home = repository
    recording = home / "recordings" / "game" / "recording"
    redirected = recording / "redirected"
    redirected.mkdir(parents=True)
    original = safety.storage_path

    def redirect(context, *parts):
        if parts and Path(*parts) == redirected.relative_to(home):
            return home / "memory_inherited"
        return original(context, *parts)

    monkeypatch.setattr(safety, "storage_path", redirect)
    with pytest.raises(HTTPException) as failure:
        with safety.preserve_memory_trees(root, recording):
            forbidden()
    assert failure.value.status_code == 409
    monkeypatch.setattr(safety, "storage_path", original)
    original_iterdir = Path.iterdir

    def unreadable(path):
        if path == recording:
            raise PermissionError("Cannot inspect fixture recording")
        return original_iterdir(path)

    monkeypatch.setattr(Path, "iterdir", unreadable)
    with pytest.raises(HTTPException) as failure:
        with safety.preserve_memory_trees(root, recording):
            forbidden()
    assert failure.value.status_code == 409


def test_tree_mutation_lock_serializes_new_memory_directory_creation(repository, monkeypatch):
    root, home = repository
    recording = home / "recordings" / "game" / "recording"
    recording.mkdir(parents=True)
    area = recording / "memory_level_1_stm"
    database = metta_memory.MeTTaMemoryDatabase(root, area, "shape")
    attempted = Event()
    original = metta_memory.memory_tree_lock

    @contextmanager
    def observed(context):
        attempted.set()
        with original(context):
            yield

    monkeypatch.setattr(metta_memory, "memory_tree_lock", observed)
    with ThreadPoolExecutor(max_workers=1) as executor:
        with safety.preserve_memory_trees(root, recording):
            future = executor.submit(database.append, {"entryType": "fixture"})
            assert attempted.wait(5)
            assert not area.exists() and not future.done()
        future.result(timeout=5)
    with pytest.raises(HTTPException):
        with safety.preserve_memory_trees(root, recording):
            forbidden()


def test_memory_writer_cannot_recreate_a_removed_recording_context(repository):
    root, home = repository
    area = home / "recordings" / "game" / "removed-recording" / "frame" / "memory"
    database = metta_memory.MeTTaMemoryDatabase(root, area, "shape")
    with pytest.raises(PermissionError, match="no directory is recreated"):
        database.append({"entryType": "fixture"})
    assert not (home / "recordings").exists()
