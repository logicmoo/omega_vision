from pathlib import Path
import json

from fastapi import Response
from PIL import Image
import pytest

from omega_vision import inherited_source_overlay as storage
from omega_vision.perception.memory_locations import AuthorizedMemoryRoot, MemoryContext, MemoryLocations
from omega_vision.perception.memory_catalog_cache import cache_directory
from omega_vision.services import video_import_api as api, video_import_semantics as semantics


@pytest.fixture
def repository(tmp_path, monkeypatch):
    repo = tmp_path / "repo"
    workspace = repo / "workspaces" / "example"
    workspace.mkdir(parents=True)
    home = repo / "data" / "omega_vision"
    home.mkdir(parents=True)
    monkeypatch.delenv("OMEGA_VISION_DATA", raising=False)
    monkeypatch.setattr(storage, "_REPO_ROOT", repo)
    monkeypatch.setattr(api, "_REPO_ROOT", repo)
    monkeypatch.setattr(api, "_POOLER_CONTROL_PATH", home / "pooler_control.json")
    monkeypatch.setattr(api, "_workspace_root", lambda _: workspace)
    return repo, workspace, home


def test_one_home_for_repository_workspace_and_canonical_root(repository):
    repo, workspace, home = repository
    included = repo / "workspaces" / "included"
    (included / "data").mkdir(parents=True)
    (workspace / "workspace.json").write_text(json.dumps({"includes": ["included"]}))
    for root in (repo, repo / "data", workspace, included, home):
        assert storage.vision_data_root(root) == home
        assert storage.data_homes(root) == [home]
        for relative in ("data/runtime/events/x.json", "data/omega_vision/runtime/events/x.json",
                         "data/omega_vision/omega_vision/runtime/events/x.json",
                         "data/./omega_vision/runtime/events/x.json"):
            assert storage.resolve_workspace_child(root, relative) == home / "runtime" / "events" / "x.json"
        assert storage.data_rel_of(root, home / "runtime" / "events" / "x.json") == "data/runtime/events/x.json"
    assert storage.resolve_workspace_child(workspace, "design/models/model.json") == workspace / "design/models/model.json"


def test_explicit_fixture_repository_has_no_external_fallback(tmp_path, monkeypatch):
    home = tmp_path / "data" / "omega_vision"
    assert storage.vision_data_root(tmp_path) == home
    external = tmp_path / "unrecognized"
    with pytest.raises(ValueError, match="Unrecognized"):
        storage.vision_data_root(external)
    monkeypatch.setenv("OMEGA_VISION_DATA", str(external))
    with pytest.raises(ValueError, match="Unrecognized"):
        storage.vision_data_root(external)
    monkeypatch.delenv("OMEGA_VISION_DATA")
    assert storage.storage_path(tmp_path, ".cache", "x") == home / ".cache" / "x"
    for path in ("data/../../escape", "data/omega_vision/../../escape", "../escape"):
        with pytest.raises(ValueError):
            storage.resolve_workspace_child(tmp_path, path)


def test_repository_rejects_out_of_root_configured_home(repository, monkeypatch):
    repo, workspace, home = repository
    monkeypatch.setenv("OMEGA_VISION_DATA", str(repo / "data"))
    with pytest.raises(ValueError, match="Configured Omega root is unavailable"):
        storage.vision_data_root(workspace)
    monkeypatch.setenv("OMEGA_VISION_DATA", str(home))
    assert storage.vision_data_root(workspace) == home


@pytest.mark.parametrize("redirect_kind", ["outside", "legacy", "other-sequence"])
@pytest.mark.parametrize("redirect_at", ["directory", "claim.json", "result.pl", "nested"])
def test_transform_descendants_are_checked_before_claim_mkdir_runner_and_todos(
    repository, monkeypatch, redirect_kind, redirect_at,
):
    from fastapi import HTTPException

    repo, workspace, home = repository
    unit_dir = home / "recordings" / "capture" / "frame"
    output = unit_dir / "parts_extraction_0" / "python_opencv"
    output.mkdir(parents=True)
    target = {"outside": repo / "outside", "legacy": home / "recognition_reduce",
              "other-sequence": home / "curated" / "other"}[redirect_kind]
    target.mkdir(parents=True)
    (target / "keep.txt").write_text("untouched")
    redirect = output if redirect_at == "directory" else output / redirect_at
    if redirect_at == "nested":
        redirect.mkdir()
    elif redirect_at != "directory":
        redirect.write_text("placeholder")
    original_resolve = Path.resolve

    def redirected(path, *args, **kwargs):
        resolved = original_resolve(path, *args, **kwargs)
        return target / resolved.relative_to(redirect) if resolved.is_relative_to(redirect) else resolved

    monkeypatch.setattr(Path, "resolve", redirected)
    effects = []
    original_mkdir = Path.mkdir

    def mkdir(path, *args, **kwargs):
        effects.append(("mkdir", path))
        return original_mkdir(path, *args, **kwargs)

    def claim(*args, **kwargs):
        effects.append(("claim", args[0]))
        raise AssertionError("claim write reached before output validation")

    monkeypatch.setattr(Path, "mkdir", mkdir)
    monkeypatch.setattr(api.os, "open", claim)
    monkeypatch.setattr(api, "_runtime_transform_options", lambda unit, step, options: options)
    monkeypatch.setitem(api._SEQUENCE_TRANSFORMS, ("parts_extraction_0", "python_opencv"),
                        lambda *args: effects.append(("runner", args)))
    unit = {"id": "frame", "workspaceId": "example", "workspaceRoot": workspace, "dir": unit_dir}
    result = api.run_transform_step(unit, "parts_extraction_0", "python_opencv", {}, force=True)
    assert result["status"] == "error"
    with pytest.raises((ValueError, HTTPException)):
        api.write_unit_todos(unit, [{"transformation": "parts_extraction_0", "doer": "python_opencv"}])
    assert effects == []
    assert (target / "keep.txt").read_text() == "untouched"
    assert not (unit_dir / "todos.json").exists()
    assert set(path.name for path in target.iterdir()) == {"keep.txt"}


@pytest.mark.parametrize("with_legacy", [False, True])
def test_recognition_catalog_and_set_execution_address_advertised_canonical_directory(repository, monkeypatch, with_legacy):
    from fastapi import HTTPException

    _, workspace, home = repository
    canonical = home / "curated" / "recognition_reduce"
    (canonical / "pool").mkdir(parents=True)
    Image.new("RGB", (2, 2), "red").save(canonical / "pool" / "bart_simpson__c1_bw.jpg")
    legacy = home / "recognition_reduce"
    if with_legacy:
        (legacy / "pool").mkdir(parents=True)
        Image.new("RGB", (3, 3), "blue").save(legacy / "pool" / "bart_simpson__c1_bw.jpg")
    before = {path: path.read_bytes() for path in legacy.rglob("*") if path.is_file()}
    entry = next(item for item in api._list_image_sets(workspace) if item.get("canonical"))
    assert entry["id"] == "curated/recognition_reduce"
    assert entry["dir"] == f"data/{entry['id']}" == "data/curated/recognition_reduce"
    assert not entry["readOnly"]
    assert "data/recognition_reduce/" not in json.dumps(api.reduce_manifest("example", entry["id"]))
    writes = []

    def runner(unit, output, options):
        writes.append(output)
        (output / "result.pl").write_text("fixture_result.")
        return {"regionCount": 0}

    monkeypatch.setitem(api._SEQUENCE_TRANSFORMS, ("parts_extraction_0", "python_opencv"), runner)
    monkeypatch.setattr(api, "_runtime_transform_options", lambda unit, step, options: options)
    monkeypatch.setattr(api, "_pooler_point_at", lambda *args: {})
    result = api.sequence_set_transform({
        "workspaceId": "example", "set": entry["id"], "transformation": "parts_extraction_0",
        "doer": "python_opencv", "workers": 1,
    })
    assert result["target"] == entry["dir"] and result["moveCount"] == 1
    assert writes and all(path.is_relative_to(canonical) for path in writes)
    with pytest.raises(HTTPException) as error:
        api.sequence_set_transform({
            "workspaceId": "example", "set": "recognition_reduce",
            "transformation": "parts_extraction_0", "doer": "python_opencv",
        })
    assert error.value.status_code == (409 if with_legacy else 404)
    assert {path: path.read_bytes() for path in legacy.rglob("*") if path.is_file()} == before
    assert legacy.exists() == with_legacy


@pytest.mark.parametrize("cache_layer", ["memory", "disk"])
def test_recognition_identity_correction_invalidates_old_catalog_ids(repository, monkeypatch, cache_layer):
    from omega_vision.perception.visual_sequence_cache import CatalogCache

    _, _, home = repository
    directory = home / "curated" / "recognition_reduce" / "pool"
    directory.mkdir(parents=True)
    Image.new("RGB", (2, 2)).save(directory / "image.png")
    cache = CatalogCache()
    cache.get(home / ".cache" / "visual_sequences.json", lambda: "unchanged-source",
              lambda: [{"id": "recognition_reduce", "dir": "data/curated/recognition_reduce"}])
    monkeypatch.setattr(api, "_visual_catalog_cache", cache if cache_layer == "memory" else CatalogCache())
    monkeypatch.setattr(api, "_visual_catalog_trackers", {(home,): lambda: "unchanged-source"})
    entries = api.visual_sequences("example")["visualSequences"]
    assert next(item for item in entries if item.get("canonical"))["id"] == "curated/recognition_reduce"
    assert all(item["dir"] == f"data/{item['id']}" for item in entries)


def test_sequence_aliases_share_run_destinations_preferences_and_nowhere_across_workspaces(repository, monkeypatch):
    from omega_vision.perception.memory_locations import NOWHERE

    repo, workspace, home = repository
    another = repo / "workspaces" / "another"
    another.mkdir()
    monkeypatch.setattr(api, "_workspace_root", lambda value: another if value == "another" else workspace)
    directory = home / "recordings" / "capture"
    directory.mkdir(parents=True)
    Image.new("RGB", (2, 2)).save(directory / "image.png")
    (directory / "recording.json").write_text('{"game_id":"shared-game","level":"1"}')
    canonical = "data/recordings/capture"
    aliases = (canonical, "data/omega_vision/recordings/capture", "data/omega_vision/omega_vision/recordings/capture")
    first, context = semantics._memory("example", aliases[1])
    assert context.run_id == canonical
    assert (context.game_id, context.level_id) == ("shared-game", "1")
    preferences = first.load_preferences(context)
    for kind in ("shape", "object"):
        preferences[kind].update(saveTo=NOWHERE, lookIn=[NOWHERE])
    saved = first.save_preferences(context, preferences, expected_revision=preferences["revision"])
    destinations = {item["memoryLocationId"] for item in first.catalog(context)["destinations"]}
    for workspace_id in ("example", "another"):
        for alias in aliases:
            locations, other_context = semantics._memory(workspace_id, alias)
            assert other_context == context
            assert locations.load_preferences(other_context) == saved
            assert {item["memoryLocationId"] for item in locations.catalog(other_context)["destinations"]} == destinations
            assert semantics._units(workspace_id, alias)[1][0]["sequenceId"] == canonical
    assert len(list((home / "runtime" / "memory-settings").glob("*.json"))) == 1


@pytest.mark.parametrize("destination_kind", ["nowhere", "durable"])
def test_historical_alias_preferences_and_records_are_preserved_without_default_substitution(repository, monkeypatch, destination_kind):
    from dataclasses import replace
    from omega_vision.perception.memory_locations import NOWHERE

    repo, workspace, home = repository
    another = repo / "workspaces" / "another"
    another.mkdir()
    monkeypatch.setattr(api, "_workspace_root", lambda value: another if value == "another" else workspace)
    directory = home / "recordings" / "capture"
    directory.mkdir(parents=True)
    Image.new("RGB", (2, 2)).save(directory / "image.png")
    canonical = "data/recordings/capture"
    alias = "data/omega_vision/recordings/capture"
    native, context = semantics._memory("example", canonical)
    historical_context = replace(context, run_id=alias)
    historical = MemoryLocations(native.roots)
    preferences = historical.load_preferences(historical_context)
    if destination_kind == "nowhere":
        for kind in ("shape", "object"):
            preferences[kind]["saveTo"] = NOWHERE
    else:
        historical.save_record("shape", preferences["shape"]["saveTo"], {"uid": "historical-shape"}, historical_context)
        preferences = historical.load_preferences(historical_context)
    saved = historical.save_preferences(historical_context, preferences, expected_revision=preferences["revision"])
    old_file = historical._preference_path(historical_context)[1]
    old_bytes = old_file.read_bytes()
    records = {path: path.read_bytes() for path in home.rglob("*.memory.json")}
    for workspace_id in ("example", "another"):
        for selected in (canonical, alias):
            locations, current = semantics._memory(workspace_id, selected)
            assert current == context and locations.load_preferences(current) == saved
            assert not locations._preference_path(current)[1].exists()
            catalog = locations.catalog(current)
            assert str(old_file) in {item["path"] for item in catalog["unavailableStorage"]}
            if destination_kind == "durable":
                old_id = saved["shape"]["saveTo"]
                assert old_id not in {item["memoryLocationId"] for item in catalog["destinations"]}
                assert locations.read_selected("shape", [old_id], current)["errors"]
    assert old_file.read_bytes() == old_bytes
    assert {path: path.read_bytes() for path in home.rglob("*.memory.json")} == records


def test_conflicting_historical_alias_preferences_never_choose_a_persistent_default(repository):
    from dataclasses import replace
    from omega_vision.perception.memory_locations import NOWHERE

    _, _, home = repository
    directory = home / "recordings" / "capture"
    directory.mkdir(parents=True)
    Image.new("RGB", (2, 2)).save(directory / "image.png")
    locations, context = semantics._memory("example", "data/recordings/capture")
    historical = MemoryLocations(locations.roots)
    for prefix, nowhere in (("data/omega_vision/", True), ("data/omega_vision/omega_vision/", False)):
        old_context = replace(context, run_id=prefix + "recordings/capture")
        preferences = historical.load_preferences(old_context)
        if nowhere:
            preferences["shape"]["saveTo"] = NOWHERE
        historical.save_preferences(old_context, preferences, expected_revision=preferences["revision"])
    with pytest.raises(ValueError, match="Conflicting historical"):
        locations.load_preferences(context)
    assert not locations._preference_path(context)[1].exists()


def test_pooler_controls_status_locks_and_scan_are_contained(repository, monkeypatch):
    from omega_vision.services import transform_task_pooler as pooler
    from types import SimpleNamespace

    repo, workspace, home = repository
    control = home / "pooler_control.json"
    pooler.write_control(control, {"root": str(home)})
    pooler.write_status(control, "paused", {})
    assert (home / "pooler_status.json").is_file()
    assert pooler._ctl_root({"root": str(home)}) == home
    monkeypatch.setattr(api, "_pooler_alive", lambda: 0)
    monkeypatch.setattr(api.subprocess, "Popen", lambda *a, **k: SimpleNamespace(pid=123))
    assert api._pooler_spawn_if_dead() == 123
    assert (home / "pooler.log").is_file()
    for outside in (repo / "data" / "pooler_control.json", workspace / "runtime" / "control.json"):
        monkeypatch.setattr(api, "_POOLER_CONTROL_PATH", outside)
        for write in (
            lambda: pooler.write_control(outside, {}),
            lambda: pooler.write_status(outside, "paused", {}),
            lambda: pooler.control_loop(outside, retry_errors=False, only_type=None, skip_type=None),
            lambda: api._atomic_json_write(outside, {}),
            lambda: api._pooler_spawn_if_dead(),
        ):
            with pytest.raises(PermissionError):
                write()
        assert not outside.exists()
        assert not outside.with_name("pooler.lock").exists()
        assert not outside.with_name("pooler.log").exists()
    with pytest.raises(PermissionError):
        pooler._ctl_root({"root": str(workspace)})
    with pytest.raises(PermissionError):
        pooler.find_todo_files([workspace])
    expected = []
    for family in ("recordings", "curated", "video", "arc_recordings", "importables"):
        todo = home / family / "capture" / "frame" / "todos.json"
        todo.parent.mkdir(parents=True)
        todo.write_text('{"kind":"transformation_todos","todos":[]}')
        if family in ("recordings", "curated"):
            expected.append(todo)
        else:
            with pytest.raises(PermissionError, match="read-only"):
                pooler.load_unit(todo, retry_errors=False)
    assert set(pooler.find_todo_files([home])) == set(expected)
    expected[0].write_text(json.dumps({"kind": "transformation_todos", "imagePath": str(workspace / "secret.png")}))
    with pytest.raises(PermissionError):
        pooler.load_unit(expected[0], retry_errors=False)


def test_symbolic_memory_and_scratch_cannot_escape(repository, monkeypatch):
    from omega_vision.perception import symbolic_arc as symbolic
    from omega_vision.services import workflow_providers as providers
    from types import SimpleNamespace

    _, workspace, home = repository
    monkeypatch.setenv("OBJECT_MEMORY_DIR", str(workspace / "memory"))
    with pytest.raises(PermissionError):
        symbolic.memory_dir()
    with pytest.raises(PermissionError):
        symbolic.write_shape_library(workspace / "vocabulary.pl")
    monkeypatch.delenv("OBJECT_MEMORY_DIR")
    assert symbolic.memory_dir() == home / "object_memory"
    with pytest.raises(PermissionError):
        symbolic.identity_db_for(home / "object_memory", "../../../../escape")
    created = []
    original = symbolic.tempfile.NamedTemporaryFile

    def capture_file(*args, **kwargs):
        handle = original(*args, **kwargs)
        created.append(Path(handle.name))
        assert created[-1].is_relative_to(home / "runtime" / "scratch")
        return handle

    monkeypatch.setattr(symbolic.tempfile, "NamedTemporaryFile", capture_file)
    monkeypatch.setattr(symbolic.subprocess, "run", lambda *a, **k: SimpleNamespace(stdout="", stderr="", returncode=0))
    symbolic._run_prolog({}, [], [], 1, 1)
    monkeypatch.setattr(providers.shutil, "which", lambda _: "swipl")
    providers._prolog_source({}, {"predicate": "echo", "sourceCode": "echo(X,X)."})
    assert len(created) == 2
    assert all(not path.exists() for path in created)
    assert {path.parent.name for path in created} == {"symbolic_arc", "workflow_providers"}


def test_runner_exports_and_thumbnail_caches_use_only_canonical_home(repository, monkeypatch):
    from omega_vision import project_paths
    from omega_vision.services import arc3_play, arc3_runner
    from workbench_api_server import arc3_play_api
    from types import SimpleNamespace

    _, workspace, home = repository
    for module in (arc3_play, arc3_play_api):
        assert module._thumbnail_path("ls20").parent == home / ".cache" / "environment_thumbnails"
        monkeypatch.setattr(module, "_THUMBNAIL_CACHE_DIR", workspace / "cache")
        with pytest.raises(PermissionError):
            module._thumbnail_path("ls20")
    monkeypatch.delenv("WORLD_WORKBENCH_RUN_ROOT", raising=False)
    monkeypatch.delenv("ARC3_TREE_ROOT", raising=False)
    assert project_paths.action_trees_root() == home / "runtime" / "states" / "action_trees"
    for helper in (project_paths.histories_root, project_paths.exports_root):
        with pytest.raises(PermissionError):
            helper(workspace)
    monkeypatch.setenv("WORLD_WORKBENCH_RUN_ROOT", str(workspace / "runtime"))
    with pytest.raises(PermissionError):
        project_paths.action_trees_root()
    runner = SimpleNamespace(history=lambda: [{"action": "left"}])
    path = home / "runtime" / "logs" / "history.json"
    arc3_runner.Arc3Runner.save_history(runner, path)
    assert json.loads(path.read_text()) == [{"action": "left"}]
    for method in (arc3_runner.Arc3Runner.save_history, arc3_runner.Arc3Runner.export_state):
        with pytest.raises(PermissionError):
            method(runner, workspace / "history.json")


def test_runtime_stores_and_preferences_use_data_home_not_configuration(repository):
    _, workspace, home = repository
    assert semantics._workspace("example") == workspace
    assert semantics._store(workspace).workspace_root == home
    log = semantics._event_log(workspace, "data/recordings/non-game")
    assert log.path.is_relative_to(home / "runtime")
    assert log.hypothesis_journal.path.is_relative_to(home / "runtime")
    path = api._direct_run_path(workspace, "a" * 32)
    api._atomic_json_write(path, {"workspaceId": "example", "kind": "direct-transform"})
    assert path == home / "runtime" / "executions" / ("direct-" + "a" * 32 + ".json")
    mounts = semantics.authorized_memory_roots("example")
    assert len(mounts) == 1 and mounts[0].root == home and mounts[0].writable
    locations, context = semantics._memory("example", None)
    preferences = locations.load_preferences(context)
    locations.save_preferences(context, preferences, expected_revision=preferences["revision"])
    assert list((home / "runtime" / "memory-settings").glob("*.json"))
    assert not (workspace / "runtime").exists()
    assert not (workspace / ".cache").exists()


@pytest.mark.parametrize("module_name", [
    "omega_vision.services.arc3_play", "workbench_api_server.arc3_play_api",
])
def test_play_writers_block_legacy_and_workspace_destinations(repository, monkeypatch, module_name):
    from importlib import import_module
    from fastapi import HTTPException

    _, workspace, home = repository
    play = import_module(module_name)
    monkeypatch.setattr(play, "_workspace_root", lambda _: workspace)
    legacy = home / "arc3_games" / "recordings" / "ls20" / "saved_001"
    legacy.mkdir(parents=True)
    Image.new("RGB", (2, 2)).save(legacy / "00001.png")
    (legacy / "recording.json").write_text('{"game_id":"ls20","moves":[]}')
    original = {p: p.read_bytes() for p in legacy.rglob("*") if p.is_file()}
    catalog = play.list_recording_dirs("example")["recordingDirs"]
    entry = next(item for item in catalog if Path(item["absolutePath"]) == legacy)
    assert entry["readOnly"] and entry["migrationRequired"]
    assert "read-only" in entry["name"]
    for relative in ("runtime/states", "data/arc3_games/recordings/ls20/saved_001"):
        with pytest.raises(HTTPException) as error:
            play.silo_write({"workspaceId": "example", "dir": relative, "name": "new.json", "content": "{}"})
        assert error.value.status_code == 400
    with pytest.raises(HTTPException) as error:
        play.clear_recordings("example")
    assert error.value.status_code == 409
    with pytest.raises(HTTPException) as error:
        play.ensure_recording_dir_movelist({"workspaceId": "example", "path": storage.data_rel_of(workspace, legacy)})
    assert error.value.status_code == 409
    assert {p: p.read_bytes() for p in legacy.rglob("*") if p.is_file()} == original
    assert not (workspace / "runtime").exists()
    saved = play.silo_write({"workspaceId": "example", "dir": "data/curated/new", "name": "result.json", "content": "{}"})
    assert saved["path"] == "data/curated/new/result.json"
    assert (home / "curated" / "new" / "result.json").is_file()


def test_canonical_home_cannot_redirect_to_another_directory(repository, monkeypatch):
    repo, _, home = repository
    resolve = storage.resolve_storage_path
    monkeypatch.setattr(storage, "resolve_storage_path",
                        lambda path: repo / "external" if Path(path) == home else resolve(path))
    with pytest.raises(ValueError, match="cannot redirect"):
        storage.vision_data_root(repo)


def test_pooler_api_preserves_unavailable_control_and_normalizes_explicit_selection(repository):
    from fastapi import HTTPException

    _, workspace, home = repository
    control = home / "pooler_control.json"
    control.write_text('{"command":"pause","root":"data/recordings"}')
    before = control.read_bytes()
    assert api.pooler_state()["unavailableStorage"]["migrationRequired"]
    with pytest.raises(HTTPException):
        api._pooler_write_control({"command": "run"})
    assert control.read_bytes() == before
    for value in (str(workspace), "data/video/old", "runtime/states"):
        with pytest.raises(HTTPException):
            api._pooler_write_control({"root": value, "command": "pause"})
        assert control.read_bytes() == before
    saved = api._pooler_write_control({"root": "data/omega_vision/recordings", "command": "pause"})
    assert saved["root"] == str(home / "recordings")
    assert "unavailableStorage" not in api.pooler_state()


@pytest.mark.parametrize("legacy_location", ["workspace", "canonical"])
def test_old_preferences_are_reported_not_replaced_or_moved(repository, legacy_location):
    _, workspace, home = repository
    context = MemoryContext("filesystem:example", "example")
    legacy_root = workspace if legacy_location == "workspace" else home
    old = MemoryLocations([AuthorizedMemoryRoot(context.provider_ref, context.workspace_id, legacy_root, "Old", writable=True)])
    prefs = old.load_preferences(context)
    old.save_preferences(context, prefs, expected_revision=prefs["revision"])
    before = {p: p.read_bytes() for p in legacy_root.rglob("*") if p.is_file()}
    locations, new_context = semantics._memory("example", None)
    assert locations.load_preferences(new_context) == old.load_preferences(context)
    catalog = locations.catalog(new_context)
    assert catalog["unavailableStorage"]
    assert any("explicit" in item["message"] for item in catalog["errors"])
    with pytest.raises((ValueError, PermissionError, KeyError)):
        locations._find(new_context, prefs["shape"]["saveTo"])
    assert not locations._preference_path(new_context)[1].exists()
    assert all(path.read_bytes() == content for path, content in before.items())


def test_legacy_reads_never_migrate_and_new_captures_use_recordings(repository):
    _, workspace, home = repository
    legacy = home / "video_import" / "capture"
    (legacy / "frames").mkdir(parents=True)
    video = legacy / "source.mp4"
    video.write_bytes(b"fixture")
    Image.new("RGB", (2, 2)).save(legacy / "frames" / "frame_000001.png")
    old_game = home / "arc3_games" / "recordings" / "game" / "run"
    old_game.mkdir(parents=True)
    (old_game / "recording.json").write_text('{"game_id":"game"}')
    before = {p: p.read_bytes() for p in home.rglob("*") if p.is_file()}
    import arc3_play_api
    assert api._imports_root(workspace) == home / "video_import"
    assert arc3_play_api._migrate_arc3_games_root(workspace) == home / "recordings"
    assert api._video_frames_dir(workspace, video).parent == home / "recordings"
    assert api._vision_frames_root(workspace) == home / "curated"
    listed = api.list_videos("example")["videos"]
    assert listed[0]["frameCount"] == 1 and listed[0]["framesReadOnly"]
    assert all(path.read_bytes() == content for path, content in before.items())
    assert not (home / "recordings").exists()


def test_sequence_catalog_marks_legacy_and_excludes_intake(repository):
    _, workspace, home = repository
    for relative in ("recordings/non-game", "curated/images", "video/old", "importables/staged"):
        path = home / relative
        path.mkdir(parents=True)
        Image.new("RGB", (2, 2)).save(path / "image.png")
    (home / "importables" / "manifest.json").write_text('{"items":[{"id":"staged"}]}')
    entries = api._list_image_sets(workspace)
    assert not any("importables" in entry["dir"] for entry in entries)
    recording = next(entry for entry in entries if entry["dir"] == "data/recordings/non-game")
    assert recording["group"] == "Sequence Sets · Recordings"
    assert not recording.get("gameId") and not recording["readOnly"]
    legacy = next(entry for entry in entries if entry["dir"] == "data/video/old")
    assert legacy["readOnly"] and legacy["migrationRequired"] and "Read-only" in legacy["label"]
    with pytest.raises(ValueError, match="read-only"):
        storage.require_sequence_write(workspace, home / "video" / "new")
    with pytest.raises(ValueError, match="outside canonical"):
        api._safe_workspace_child(workspace, "runtime/executions/old.json")


def test_legacy_transform_is_blocked_before_any_output(repository):
    _, workspace, home = repository
    unit_dir = home / "recognition_reduce"
    unit_dir.mkdir()
    result = api.run_transform_step(
        {"id": "legacy", "dir": unit_dir, "workspaceRoot": workspace},
        "parts_extraction_0", "python_opencv", {},
    )
    assert result["status"] == "error" and "read-only" in result["error"]
    assert not list(unit_dir.iterdir())
    (unit_dir / "sym").mkdir()
    legacy = unit_dir / "sym" / "image__1shot.metta"
    legacy.write_text("(legacy)")
    assert api._llm_adoption_maker(unit_dir)({"id": "image", "dir": unit_dir / "transforms" / "image"}) == []
    assert legacy.read_text() == "(legacy)"
    assert not (unit_dir / "transforms").exists()


def test_cache_escape_is_rejected(repository, monkeypatch):
    repo, _, home = repository
    original = Path.resolve
    cache = home / ".cache" / "memory-catalog"
    monkeypatch.setattr(Path, "resolve", lambda self, *a, **kw:
                        repo / "outside-cache" if self == cache else original(self, *a, **kw))
    with pytest.raises(PermissionError, match="escapes"):
        cache_directory(home)


@pytest.mark.parametrize("kind", ["shape", "object"])
def test_shared_physical_memory_preserves_workspace_attribution(repository, kind, monkeypatch):
    repo, workspace, home = repository
    another = repo / "workspaces" / "another"
    another.mkdir()
    monkeypatch.setattr(api, "_workspace_root", lambda value: another if value == "another" else workspace)
    first, context = semantics._memory("example", None)
    preferences = first.load_preferences(context)
    destination = preferences[kind]["saveTo"]
    first.save_preferences(context, preferences, expected_revision=preferences["revision"])
    saved = first.save_record(kind, destination, {"uid": kind, "canonicalPoints": [[1, 2]]}, context)
    assert saved["source"]["workspaceId"] == "example"
    envelopes = list((home / "knowledge" / "artifacts" / "memory").rglob("*.memory.json"))
    assert json.loads(envelopes[0].read_text())["storageContext"] == {
        "providerRef": "filesystem:omega_vision", "workspaceId": "example",
    }
    first_catalog = first.catalog(context)
    area = next(item for item in first_catalog["locations"] if item["memoryLocationId"] == destination)
    reference = semantics._memory_reference(saved)
    assert area["workspaceId"] == storage.OMEGA_STORAGE_ID
    assert reference["workspaceId"] == saved["source"]["workspaceId"] == "example"
    assert reference["workspaceId"] != area["workspaceId"]  # Provenance is not area ownership.
    assert area["providerRef"] == reference["providerRef"] == storage.OMEGA_PROVIDER_ID
    assert area["memoryLocationId"] == reference["memoryLocationId"]
    cache_files = set((home / ".cache" / "memory-catalog").glob("*.json"))
    other, other_context = semantics._memory("another", None)
    catalog = other.catalog(other_context)
    assert any(item["counts"][kind] == 1 for item in catalog["locations"])
    assert other.load_preferences(other_context)[kind]["saveTo"] == destination
    assert cache_files == set((home / ".cache" / "memory-catalog").glob("*.json"))
    read = other.read_selected(kind, [destination], other_context)
    assert not read["errors"]
    assert read["records"][0]["preferred"] == {
        key: value for key, value in saved.items() if key != "storageRevision"
    } | {"observedRevision": 0}
    assert first_catalog["revision"] == catalog["revision"]
    same = other.save_record(kind, destination, {"uid": kind, "canonicalPoints": [[1, 2]]}, other_context)
    assert (same["recordUid"], same["conceptUid"], same["revision"]) == (
        saved["recordUid"], saved["conceptUid"], saved["revision"],
    )
    second = other.save_record(kind, destination, {"uid": f"{kind}-second"}, other_context)
    reread = first.read_selected(kind, [destination], context)
    assert any(item["preferred"]["recordUid"] == second["recordUid"] for item in reread["records"])
    assert second["source"]["workspaceId"] == "another"
    assert not (home / "workspaces").exists()
    assert not (workspace / "knowledge").exists()
    assert not (another / "knowledge").exists()


def test_two_workspaces_share_sequences_caches_locks_and_executions(repository, monkeypatch):
    from omega_vision.services import video_import_pipeline as pipeline
    repo, workspace, home = repository
    other = repo / "workspaces" / "another"
    other.mkdir()
    monkeypatch.setattr(api, "_workspace_root", lambda value: workspace if value == "example" else other)
    directory = home / "recordings" / "capture"
    directory.mkdir(parents=True)
    Image.new("RGB", (2, 2)).save(directory / "image.png")
    first = api.visual_sequences("example")
    second = api.visual_sequences("another")
    assert first["visualSequences"] == second["visualSequences"]
    assert api._page_state_lock("example") is api._page_state_lock("another")
    assert pipeline._run_store_key("example") == pipeline._run_store_key("another")
    assert [p.name for p in (home / ".cache").glob("visual_sequences*.json")] == ["visual_sequences.json"]
    _, first_units = semantics._units("example", "data/recordings/capture")
    _, second_units = semantics._units("another", "data/recordings/capture")
    assert first_units[0]["providerId"] == second_units[0]["providerId"] == "filesystem:omega_vision"
    job_id = "b" * 32
    path = api._direct_run_path(workspace, job_id)
    job = {"id": job_id, "kind": "direct-transform", "workspaceId": "example", "state": "done"}
    api._atomic_json_write(path, job)
    assert api.direct_call_status(job_id, "another") == job
    elsewhere = repo / "external"
    elsewhere.mkdir()
    monkeypatch.setattr(api, "_workspace_root", lambda value: elsewhere if value == "external" else workspace)
    assert not api._job_in_store({"workspaceId": "external"}, "example")


@pytest.mark.parametrize("kind", ["shape", "object"])
def test_one_browser_snapshot_retains_nowhere_identity_across_workspace_requests(repository, monkeypatch, kind):
    from fastapi import FastAPI
    from fastapi.testclient import TestClient
    from omega_vision.perception.memory_locations import BrowserMemory, VolatileMemory, NOWHERE, _id

    repo, workspace, home = repository
    another = repo / "workspaces" / "another"
    another.mkdir()
    monkeypatch.setattr(api, "_workspace_root", lambda value: another if value == "another" else workspace)
    token = "same-browser-page-token"
    browser = BrowserMemory("example", token)
    output_key = browser.output_key("data/recordings/capture", "frame-a", "objects/test")
    browser.put_output("data/recordings/capture", "frame-a", "objects/test", {"uid": "only-in-browser-output"})
    body = {"workspaceId": "example", "memorySessionId": token, "memorySnapshot": browser.to_wire(),
            "kind": kind, "destinationId": NOWHERE, "payload": {"uid": f"browser-only-{kind}"}}
    app = FastAPI()
    app.include_router(semantics.router)
    with TestClient(app) as client:
        first = client.post("/semantic/memory/save", json=body)
        assert first.status_code == 200, first.text
        switched = {**body, "workspaceId": "another", "memorySnapshot": first.json()["memorySnapshot"]}
        second = client.post("/semantic/memory/save", json=switched)
        assert second.status_code == 200, second.text
        assert second.json()["record"] == first.json()["record"]
        assert second.json()["memorySnapshot"] == first.json()["memorySnapshot"]
        current = BrowserMemory("another", token, second.json()["memorySnapshot"])
        assert current.outputs[output_key] == browser.outputs[output_key]
        lookup = {"workspaceId": "another", "memorySessionId": token, "memorySnapshot": current.to_wire()}
        setup = client.post("/semantic/memory/setup", json=lookup)
        assert setup.status_code == 200, setup.text
        assert setup.json()["context"]["workspace_id"] == storage.OMEGA_STORAGE_ID
        area = next(item for item in setup.json()["catalog"]["locations"] if item["memoryLocationId"] == NOWHERE)
        assert area["counts"][kind] == 1 and area["providerRef"] == "session"
        assert first.json()["record"]["source"]["providerRef"] == storage.OMEGA_PROVIDER_ID
        read_body = {**lookup, "kind": kind, "locationIds": [NOWHERE]}
        read = client.post("/semantic/memory/read", json=read_body)
        assert read.status_code == 200, read.text
        assert read.json()["records"][0]["preferred"]["recordUid"] == first.json()["record"]["recordUid"]
        assert client.post("/semantic/memory/read", json={**read_body, "memorySessionId": "different-browser-page-token"}).status_code == 422
        assert client.post("/semantic/memory/read", json={**read_body, "sequenceId": "data/recordings/missing"}).status_code == 404
        assert client.post("/semantic/memory/read", json={**read_body, "locationIds": ["unauthorized-area"]}).status_code == 422
        assert read.headers["Cache-Control"] == "no-store"
        envelope = json.loads(current.to_wire())
        assert envelope["schemaVersion"] == 2
        assert envelope["storageContext"]["providerRef"] == storage.OMEGA_PROVIDER_ID

        def reseal(value):
            value["snapshotUid"] = _id("browser-snapshot", {key: item for key, item in value.items() if key != "snapshotUid"})
            return json.dumps(value)

        for field in ("providerRef", "rootId"):
            forged = json.loads(current.to_wire())
            forged["storageContext"][field] = "another-authority"
            rejected = client.post("/semantic/memory/read", json={**read_body, "memorySnapshot": reseal(forged)})
            assert rejected.status_code == 403, rejected.text
        forged = json.loads(current.to_wire())
        forged["sessionId"] = "different-browser-page-token"
        assert client.post("/semantic/memory/read", json={**read_body, "memorySnapshot": reseal(forged)}).status_code == 422
        foreign = VolatileMemory(session_id=token)
        foreign.put(kind, body["payload"], source={"providerRef": "foreign-provider", "workspaceId": "example"})
        forged = {**envelope, "memory": foreign.to_wire()}
        assert client.post("/semantic/memory/read", json={**read_body, "memorySnapshot": reseal(forged)}).status_code == 403
        unbound = {key: value for key, value in envelope.items() if key != "storageContext"}
        unbound["schemaVersion"] = 1
        rejected = client.post("/semantic/memory/read", json={**read_body, "memorySnapshot": reseal(unbound)})
        assert rejected.status_code == 422 and "reset page memory explicitly" in rejected.text
    assert not list(home.rglob("*.memory.json"))
    assert not (workspace / "runtime").exists() and not (another / "runtime").exists()
    for path in home.rglob("*"):
        if path.is_file():
            assert b"browser-only-" not in path.read_bytes()
            assert b"only-in-browser-output" not in path.read_bytes()


def test_sibling_legacy_data_is_inventoried_without_discovery(repository):
    repo, workspace, home = repository
    old = repo / "data" / "recordings" / "capture"
    old.mkdir(parents=True)
    Image.new("RGB", (2, 2)).save(old / "image.png")
    before = (old / "image.png").read_bytes()
    unavailable = storage.unavailable_legacy_storage(workspace)
    assert str(old.parent) in {item["path"] for item in unavailable}
    assert not api._list_image_sets(workspace)
    assert (old / "image.png").read_bytes() == before
    assert not (home / "recordings").exists()


def test_workspace_assets_do_not_shadow_canonical_data_with_legacy_files(repository, monkeypatch):
    import workspace_api
    from fastapi import HTTPException
    _, workspace, home = repository
    monkeypatch.setattr(workspace_api, "_resolve_workspace_without_counts", lambda _: {"root": str(workspace)})
    relative = "runtime/executions/result.json"
    for base, value in ((workspace / "data", "legacy"), (home, "canonical")):
        target = base / relative
        target.parent.mkdir(parents=True)
        target.write_text(value)
    for ref in ("data/" + relative, "data/omega_vision/" + relative):
        assert Path(workspace_api.read_workspace_asset("example", ref).path) == home / relative
    legacy_only = workspace / "data" / "old.json"
    legacy_only.write_text("{}")
    with pytest.raises(HTTPException, match="migration"):
        workspace_api.read_workspace_asset("example", "data/old.json")
    configuration = workspace / "configuration.json"
    configuration.write_text("{}")
    assert Path(workspace_api.read_workspace_asset("example", "configuration.json").path) == configuration


@pytest.mark.parametrize("kind", ["shape", "object"])
@pytest.mark.parametrize("scope", ["global", "run"])
def test_workspace_only_memory_setup_and_read_browse_saved_areas_without_sequence(repository, monkeypatch, kind, scope):
    from fastapi import FastAPI
    from fastapi.testclient import TestClient

    repo, workspace, home = repository
    another = repo / "workspaces" / "another"
    another.mkdir()
    monkeypatch.setattr(api, "_workspace_root", lambda value: another if value == "another" else workspace)
    directory = home / "recordings" / "saved-run"
    directory.mkdir(parents=True)
    Image.new("RGB", (2, 2)).save(directory / "image.png")
    (directory / "recording.json").write_text('{"game_id":"fixture-game","level":"1"}')
    sequence = "data/recordings/saved-run"
    locations, context = semantics._memory("example", sequence)
    destination = next(
        entry["memoryLocationId"] for entry in locations.catalog(context)["destinations"]
        if entry["scopeKind"] == scope and kind in entry["memoryKinds"]
    )
    app = FastAPI()
    app.include_router(semantics.router)
    with TestClient(app) as client:
        saved = client.post("/semantic/memory/save", json={
            "workspaceId": "example", "sequenceId": sequence, "kind": kind,
            "destinationId": destination, "payload": {"uid": f"saved-{kind}-{scope}"},
        })
        assert saved.status_code == 200, saved.text
        record = saved.json()["record"]
        resolve_units = semantics._units
        monkeypatch.setattr(semantics, "_units", lambda *args, **kwargs:
                            pytest.fail("Workspace-only saved-area browsing must not enumerate sequences"))
        before = client.post("/semantic/memory/setup", json={"workspaceId": "another"})
        assert before.status_code == 200, before.text
        setup = before.json()
        area = next(entry for entry in setup["catalog"]["locations"] if entry["memoryLocationId"] == destination)
        assert area["scopeKind"] == scope and area["counts"][kind] == 1
        assert setup["context"]["run_id"] is None
        read = client.post("/semantic/memory/read", json={
            "workspaceId": "another", "kind": kind, "locationIds": [destination],
        })
        assert read.status_code == 200, read.text
        assert read.headers["cache-control"] == "no-store"
        restored = read.json()["records"][0]["preferred"]
        assert restored["recordUid"] == record["recordUid"]
        assert restored["source"]["workspaceId"] == "example"
        after = client.post("/semantic/memory/setup", json={"workspaceId": "another"})
        assert after.json()["preferences"] == setup["preferences"]
        assert not (another / "runtime").exists()
        monkeypatch.setattr(semantics, "_units", resolve_units)
        for endpoint, extra in (
            ("/semantic/memory/setup", {}),
            ("/semantic/memory/read", {"kind": kind, "locationIds": [destination]}),
        ):
            invalid = client.post(endpoint, json={
                "workspaceId": "another", "sequenceId": "data/recordings/missing", **extra,
            })
            assert invalid.status_code == 404, invalid.text


def test_new_root_and_grant_never_reuse_old_catalog_destinations(repository):
    _, workspace, home = repository
    context = MemoryContext("filesystem:example", "example")
    old = MemoryLocations([AuthorizedMemoryRoot(context.provider_ref, context.workspace_id, workspace, "Old", writable=True)])
    before = old.catalog(context)
    current, context = semantics._memory("example", None)
    after = current.catalog(context)
    old_ids = {entry["memoryLocationId"] for entry in before["destinations"]}
    new_ids = {entry["memoryLocationId"] for entry in after["destinations"]}
    assert not (old_ids & new_ids) - {"memory-nowhere"}
    readonly = MemoryLocations([AuthorizedMemoryRoot(context.provider_ref, context.workspace_id, home, "Current")])
    assert all(not entry["capabilities"]["write"] for entry in readonly.catalog(context)["destinations"]
               if entry["memoryLocationId"] != "memory-nowhere")
