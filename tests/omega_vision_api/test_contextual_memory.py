from concurrent.futures import ThreadPoolExecutor
from dataclasses import replace
import json
from pathlib import Path

from fastapi import FastAPI
from fastapi.testclient import TestClient
import pytest

from omega_vision.perception.contextual_memory import (
    CONTEXTUAL_CHOICES, LEGACY_AREAS, ContextualMemory, ContextUnavailable, inspectable_areas, recording_context,
)
from omega_vision.perception.memory_locations import MemoryLocations, BrowserMemory
from omega_vision.perception.metta_memory import MeTTaMemoryDatabase
from omega_vision.services import video_import_api as api, video_import_semantics as semantic


@pytest.fixture
def repository(tmp_path, monkeypatch):
    home = tmp_path / "data" / "omega_vision"
    home.mkdir(parents=True)
    for name in ("first", "second"):
        (tmp_path / "workspaces" / name).mkdir(parents=True)
    monkeypatch.setattr(semantic, "_workspace", lambda name: tmp_path / "workspaces" / name)
    monkeypatch.setattr(api, "_workspace_root", lambda name: tmp_path / "workspaces" / name)
    return tmp_path, home


def recording(home, name="recording-a"):
    path = home / "recordings" / "game" / name
    moves = []
    for frame, level in (("z-first", "1"), ("a-second", "1"), ("m-third", "2"), ("b-fourth", "2")):
        (path / frame).mkdir(parents=True)
        moves.append({"directory": f"data/recordings/game/{name}/{frame}", "level": level})
    (path / "recording.json").write_text(json.dumps({"game_id": "game", "moves": moves}), encoding="utf-8")
    return path


def forbidden(*args, **kwargs):
    raise AssertionError("Discovery/preferences/payload access is forbidden")


def test_options_are_fixed_ready_without_scans_counts_preferences_or_existence(repository, monkeypatch):
    for method in ("catalog", "_discovered", "_catalog_metadata", "load_preferences", "_records"):
        monkeypatch.setattr(MemoryLocations, method, forbidden)
    monkeypatch.setattr(api, "_list_image_sets", forbidden)
    monkeypatch.setattr(api, "_sequence_execution_context", forbidden)
    monkeypatch.setattr(Path, "is_file", forbidden)
    monkeypatch.setattr(Path, "is_dir", forbidden)
    result = semantic.memory_inspectable_areas("first", __import__("fastapi").Response())
    assert [item["label"] for item in result["areas"][:6]] == [label for _, label in CONTEXTUAL_CHOICES]
    assert len(result["areas"]) == 15
    assert len([item for item in result["areas"] if item["areaType"] == "legacy"]) == 8
    assert all(item["loadState"] == "not_loaded" and item["revision"] is None
               and item["counts"] == {"shape": None, "object": None} for item in result["areas"])
    assert result == semantic.memory_inspectable_areas("second", __import__("fastapi").Response())


def test_missing_context_and_databases_do_not_create_directories(repository):
    _, home = repository
    store = ContextualMemory(home, "first")
    before = list(home.rglob("*"))
    for key, _ in CONTEXTUAL_CHOICES:
        result = store.inspect("contextual:" + key, "shape")
        assert result["status"] == "unavailable"
        assert result["records"] == [] and result["revision"] is None
    assert list(home.rglob("*")) == before


def test_group_schema_plan_is_explicit_without_adapters_aliases_or_placeholder_databases(repository, monkeypatch):
    _, home = repository
    store = ContextualMemory(home, "first")
    before = list(home.rglob("*"))
    for method in ("catalog", "_discovered", "load_preferences", "_records"):
        monkeypatch.setattr(MemoryLocations, method, forbidden)
    monkeypatch.setattr(MeTTaMemoryDatabase, "read", forbidden)
    options = inspectable_areas()
    expected = {"shape_group": "shape_groups_db.metta", "object_group": "object_groups_db.metta",
                "shape_group_class": "shape_group_classes_db.metta",
                "object_group_class": "object_group_classes_db.metta", "object_class": "obj_classes_db.metta"}
    assert not {"group", "group_class", "shape_class"} & options["kindSchemas"].keys()
    assert options["kindSchemas"]["shape_group"]["memberKind"] == "shape"
    assert options["kindSchemas"]["object_group"]["memberKind"] == "object"
    assert options["kindSchemas"]["shape_group_class"]["instanceKind"] == "shape_group"
    assert options["kindSchemas"]["object_group_class"]["instanceKind"] == "object_group"
    assert options["kindSchemas"]["object_class"]["instanceKind"] == "object"
    for kind, filename in expected.items():
        schema = options["kindSchemas"][kind]
        assert schema["databaseFile"] == filename
        assert schema["schemaStatus"] == "pending" and not schema["read"] and not schema["write"]
        for area in options["areas"][:6]:
            assert area["plannedMemoryKinds"] == list(expected)
            assert area["memoryKinds"] == ["shape", "object"]
            result = store.inspect(area["areaId"], kind, context_loader=forbidden)
            assert result["kind"] == kind and result["status"] == "unavailable"
            assert result["reasonCode"] == f"{kind}_schema_unavailable"
            assert result["records"] == [] and result["sources"] == [] and result["revision"] is None
        with pytest.raises(ValueError, match="is not implemented"):
            MeTTaMemoryDatabase(home, home / "memory_inherited", kind)
        with pytest.raises(ValueError):
            store.save(home / "memory_inherited", kind, {"uid": "g1", "members": []})
    with pytest.raises(PermissionError, match="Unregistered"):
        store.inspect("unregistered", "shape_group", context_loader=forbidden)
    for kind in ("group", "group_class", "shape_class"):
        with pytest.raises(ValueError, match="Unknown"):
            store.inspect("contextual:inherited", kind, context_loader=forbidden)
        with pytest.raises(ValueError, match="Unknown"):
            MeTTaMemoryDatabase(home, home / "memory_inherited", kind)
    assert list(home.rglob("*")) == before


def test_unavailable_temporal_context_does_not_block_explicit_global_memory(repository):
    _, home = repository
    sequence = home / "recordings" / "untyped"
    sequence.mkdir(parents=True)
    (sequence / "image.png").write_bytes(b"fixture")
    store = ContextualMemory(home, "first")
    record = store.save(home / "memory_inherited", "shape", {"uid": "saved-global"})
    locations, context = semantic._memory("first", "data/recordings/untyped", "image")
    mount, descriptor, path = locations._find(context, record["source"]["memoryLocationId"])
    assert locations._records(mount, descriptor, path)[0]["recordUid"] == record["recordUid"]
    assert locations.context_unavailable["reasonCode"] == "unsupported_hierarchy"
    assert all(item["scopeKind"] == "global" for item, _ in locations._destinations(locations.roots[0], context)
               if item["format"] == "memory_metta")


def test_metta_versions_preserve_typed_values_siblings_and_independent_concurrent_databases(repository):
    _, home = repository
    area = home / "memory_inherited"
    first = ContextualMemory(home, "first")
    second = ContextualMemory(home, "second", mount=replace(first.mount, workspace_id="editor-provenance"))
    payload = {"uid": "001", "enabled": False, "providerRef": "provider:001",
               "nullable": None, "typed": [1, "1", True, "true", {"id": "000"}]}
    saved = first.save(area, "shape", payload)
    assert second.save(area, "shape", payload) == saved
    old = (area / "shapes_db.metta").read_bytes()
    with ThreadPoolExecutor(max_workers=8) as executor:
        list(executor.map(lambda i: first.save(area, "object" if i % 2 else "shape", {"uid": f"item-{i}"}), range(20)))
    assert (area / "shapes_db.metta").read_bytes().startswith(old)
    shapes, source = second.read(area, "shape")
    objects, _ = second.read(area, "object")
    assert len(shapes) == 11 and len(objects) == 10
    assert next(item for item in shapes if item["recordUid"] == saved["recordUid"])["payload"] == payload
    assert source["memoryLocationId"] == saved["source"]["memoryLocationId"]
    assert not [path for path in home.rglob("*.json") if ".cache" not in path.parts]
    assert (area / "shapes_db.metta").read_text(encoding="utf-8").startswith("(")


def test_scene_reads_only_recording_level_stm_strictly_before_current_frame(repository):
    _, home = repository
    path = recording(home)
    other = recording(home, "recording-b")
    store = ContextualMemory(home, "first")
    contexts = [recording_context(home, path, frame)
                for frame in ("z-first", "a-second", "m-third", "b-fourth")]
    for index, context in enumerate(contexts):
        store.save(context.stm_area(), "shape", {"uid": f"shape-{index}"}, context=context)
        store.save(context.frame_area(), "shape", {"uid": f"moment-{index}"}, context=context)
    foreign = recording_context(home, other, "m-third")
    store.save(foreign.stm_area(), "shape", {"uid": "other-recording"}, context=foreign)
    ltm = home / "recordings" / "game" / "memory_level_2_ltm"
    store.save(ltm, "shape", {"uid": "shared-ltm"}, context=contexts[-1])
    selected = store.inspect("contextual:scene", "shape", context_loader=lambda: contexts[-1])
    assert [group["preferred"]["payload"]["uid"] for group in selected["records"]] == ["shape-2"]
    current = store.inspect("contextual:current-moment", "shape", context_loader=lambda: contexts[1])
    previous = store.inspect("contextual:previous-moment", "shape", context_loader=lambda: contexts[1])
    assert current["records"][0]["preferred"]["payload"]["uid"] == "moment-1"
    assert previous["records"][0]["preferred"]["payload"]["uid"] == "moment-0"
    assert store.inspect("contextual:previous-moment", "shape",
                         context_loader=lambda: contexts[0])["reasonCode"] == "no_predecessor"
    assert contexts[0].stm_area() != contexts[2].stm_area() != foreign.stm_area()


def test_frozen_default_destinations_are_stable_across_frames_and_preference_snapshots(repository):
    from omega_vision.perception.memory_locations import default_preference_snapshot
    _, home = repository
    directory = recording(home)
    for frame in ("z-first", "a-second", "m-third", "b-fourth"):
        (directory / frame / "image.png").write_bytes(b"fixture")
    contexts = [recording_context(home, directory, frame) for frame in ("z-first", "a-second", "m-third")]
    native = ContextualMemory(home, "first")
    for context in contexts:
        native.save(context.frame_area(), "shape", {"uid": f"frame-{context.current.order}"}, context=context)
    with default_preference_snapshot():
        for current in contexts:
            locations, context = semantic._memory("first", current.sequence_id, current.current.frame_id)
            preferences = locations.load_preferences(context)
            for kind in ("shape", "object"):
                assert preferences[kind]["saveTo"] == native.descriptor(current.stm_area(), kind, current)["memoryLocationId"]
                frame_locations = {native.descriptor(frame.frame_area(), kind, frame)["memoryLocationId"] for frame in contexts}
                assert not frame_locations.intersection(preferences[kind]["lookIn"])
    units = api._sequence_execution_context(home, contexts[0].sequence_id, "first")[1]
    api._persist_execution_memory_defaults(units[0], [semantic.OBJECTS])
    for current in contexts[:2]:
        locations, context = semantic._memory("second", current.sequence_id, current.current.frame_id)
        preferences = locations.load_preferences(context)
        for kind in ("shape", "object"):
            saved = locations.save_record(kind, preferences[kind]["saveTo"],
                                          {"uid": f"learned-{current.current.order}"}, context)
            assert saved["source"]["registeredPath"] == current.stm_area().relative_to(home).as_posix()
    earlier = native.inspect("contextual:scene", "shape", context_loader=lambda: contexts[1])
    assert [entry["preferred"]["payload"]["uid"] for entry in earlier["records"]] == ["learned-0"]


def test_explicit_frame_preference_is_preserved_not_retargeted_to_another_frame(repository):
    _, home = repository
    directory = recording(home)
    for frame in ("z-first", "a-second", "m-third", "b-fourth"):
        (directory / frame / "image.png").write_bytes(b"fixture")
    first = recording_context(home, directory, "z-first")
    native = ContextualMemory(home, "first")
    locations, context = semantic._memory("first", first.sequence_id, first.current.frame_id)
    preferences = locations.load_preferences(context)
    preferences["shape"]["saveTo"] = native.descriptor(first.frame_area(), "shape", first)["memoryLocationId"]
    saved = locations.save_preferences(context, preferences, expected_revision=preferences["revision"])
    path = locations._preference_path(context)[1]
    before = path.read_bytes()
    later_locations, later_context = semantic._memory("second", first.sequence_id, "a-second")
    assert later_locations.load_preferences(later_context) == saved
    with pytest.raises(PermissionError, match="unregistered memory destination"):
        later_locations.save_record("shape", saved["shape"]["saveTo"], {"uid": "must-not-move"}, later_context)
    assert path.read_bytes() == before
    assert not (directory / "a-second" / "memory" / "shapes_db.metta").exists()


def test_initial_root_observation_keeps_real_unit_identity_and_causal_frame_order(repository):
    from PIL import Image
    _, home = repository
    directory = recording(home)
    Image.new("RGB", (2, 2), "black").save(directory / "image.png")
    (directory / "state.json").write_text(json.dumps({
        "step_count": 0, "incoming_action": None, "parent_node": None, "game_id": "game", "level": "1",
    }))
    for frame in ("z-first", "a-second", "m-third", "b-fourth"):
        Image.new("RGB", (2, 2), "red").save(directory / frame / "image.png")
    initial = recording_context(home, directory, "image")
    assert [moment.frame_id for moment in initial.moments] == ["image", "z-first", "a-second", "m-third", "b-fourth"]
    assert initial.frame_area() == directory / "transforms" / "image" / "memory"
    assert initial.current.order == 0
    store = ContextualMemory(home, "first")
    record = store.save(initial.frame_area(), "shape", {"uid": "before-any-action"}, context=initial)
    assert (initial.frame_area() / "shapes_db.metta").is_file()
    after = recording_context(home, directory, "z-first")
    assert after.current.order == 1
    prior = store.inspect("contextual:previous-moment", "shape", context_loader=lambda: after)
    assert prior["records"][0]["preferred"]["recordUid"] == record["recordUid"]
    assert store.inspect("contextual:previous-moment", "shape", context_loader=lambda: initial)["reasonCode"] == "no_predecessor"
    assert not (directory / "image").exists()
    assert not (directory / "memory").exists()


@pytest.mark.parametrize("state", [None, {}, {"step_count": 1}, {"step_count": 0, "incoming_action": "ACTION1"}])
def test_unattributed_initial_root_image_cannot_acquire_frame_memory(repository, state):
    _, home = repository
    directory = recording(home)
    (directory / "image.png").write_bytes(b"original")
    if state is not None:
        (directory / "state.json").write_text(json.dumps(state))
    with pytest.raises(ValueError, match="Initial recording|pre-action"):
        recording_context(home, directory, "image")
    with pytest.raises(ValueError, match="Initial recording|pre-action"):
        MeTTaMemoryDatabase(home, directory / "transforms" / "image" / "memory", "shape")
    assert not (directory / "transforms").exists()


@pytest.mark.parametrize("kind,filename", [
    ("shape", "shapes_db.metta"), ("object", "objects_db.metta"),
])
@pytest.mark.parametrize("scope,relative", [
    ("game-all", "memory_game_all"),
    ("game-level-ltm", "memory_level_1_ltm"),
    ("recording-level-stm", "recording-a/memory_level_1_stm"),
    ("frame", "recording-a/a-second/memory"),
])
def test_explicit_area_saves_use_agreed_metta_layout_shared_across_workspaces(repository, kind, filename, scope, relative):
    repository_root, home = repository
    path = recording(home)
    context = recording_context(home, path, "a-second")
    app = FastAPI()
    app.include_router(semantic.router)
    with TestClient(app) as client:
        body = {"kind": kind, "scope": scope, "payload": {"uid": "same-record"},
                "sequenceId": context.sequence_id, "frameId": context.current.frame_id}
        results = [client.post("/semantic/memory/save-area", json={**body, "workspaceId": workspace})
                   for workspace in ("first", "second")]
    assert all(result.status_code == 200 for result in results), [result.text for result in results]
    assert results[0].json()["record"] == results[1].json()["record"]
    expected = home / "recordings" / "game" / relative / filename
    assert list(home.rglob("*.metta")) == [expected]
    assert expected.read_text(encoding="utf-8").startswith("(")
    assert len(MeTTaMemoryDatabase(home, expected.parent, kind).read()) == 1
    assert not list((repository_root / "workspaces").rglob("*.metta"))
    assert not list(home.rglob("memory_frame"))
    assert not list(home.rglob("shape_db")) and not list(home.rglob("object_db"))


@pytest.mark.parametrize("kind", ["shape", "object"])
def test_selected_memory_http_read_keeps_frame_context_and_causal_cutoff(repository, monkeypatch, kind):
    _, home = repository
    directory = recording(home)
    for frame in ("z-first", "a-second", "m-third", "b-fourth"):
        (directory / frame / "image.png").write_bytes(b"fixture")
    prior = recording_context(home, directory, "z-first")
    current = recording_context(home, directory, "a-second")
    store = ContextualMemory(home, "first")
    old = store.save(prior.stm_area(), kind, {"uid": "prior"}, context=prior)
    store.save(current.stm_area(), kind, {"uid": "current"}, context=current)
    frame_record = store.save(current.frame_area(), kind, {"uid": "frame-current"}, context=current)
    protected = {file: file.read_bytes() for file in home.rglob("*.metta")}
    monkeypatch.setattr(MemoryLocations, "load_preferences", forbidden)
    app = FastAPI()
    app.include_router(semantic.router)
    with TestClient(app) as client:
        for record in (old, frame_record):
            body = {"kind": kind, "locationIds": [record["source"]["memoryLocationId"]],
                    "sequenceId": current.sequence_id, "frameId": current.current.frame_id}
            results = [client.post("/semantic/memory/read", json={**body, "workspaceId": workspace})
                       for workspace in ("first", "second")]
            assert all(result.status_code == 200 for result in results), [result.text for result in results]
            assert results[0].json() == results[1].json()
            versions = [version for concept in results[0].json()["records"] for version in concept["versions"]]
            assert [version["recordUid"] for version in versions] == [record["recordUid"]]
            assert all(response.headers["Cache-Control"] == "no-store" for response in results)
    assert all(file.read_bytes() == content for file, content in protected.items())
    assert not (home / "runtime" / "memory-settings").exists()


@pytest.mark.parametrize("scope", ["game-level-ltm", "recording-level-stm"])
def test_level_area_save_rejects_missing_level_without_creating_an_area(repository, scope):
    _, home = repository
    path = recording(home)
    manifest_path = path / "recording.json"
    manifest = json.loads(manifest_path.read_text())
    manifest["moves"][0].pop("level")
    manifest_path.write_text(json.dumps(manifest))
    app = FastAPI()
    app.include_router(semantic.router)
    with TestClient(app) as client:
        response = client.post("/semantic/memory/save-area", json={
            "workspaceId": "first", "sequenceId": "data/recordings/game/recording-a",
            "frameId": "z-first", "kind": "shape", "scope": scope, "payload": {"uid": "no-level"},
        })
    assert response.status_code == 422, response.text
    assert not list(home.rglob("*.metta"))


def test_recording_context_endpoint_uses_first_manifest_frame_without_scanning_images(repository, monkeypatch):
    _, home = repository
    path = recording(home)
    before = list(home.rglob("*"))
    monkeypatch.setattr(api, "_resolve_set_images", forbidden)
    monkeypatch.setattr(api, "_sequence_execution_context", forbidden)
    app = FastAPI()
    app.include_router(semantic.router)
    with TestClient(app) as client:
        params = {"workspaceId": "first", "sequenceId": "data/recordings/game/recording-a"}
        result = client.get("/semantic/memory/recording-context", params=params)
        assert result.status_code == 200, result.text
        assert result.headers["Cache-Control"] == "no-store"
        assert result.json()["selectedFrameId"] == "z-first"
        assert [frame["frameId"] for frame in result.json()["frames"]] == ["z-first", "a-second", "m-third", "b-fourth"]
        same = client.get("/semantic/memory/recording-context", params={**params, "workspaceId": "second"})
        assert same.json() == result.json()
        explicit = client.get("/semantic/memory/recording-context", params={**params, "frameId": "m-third"})
        assert explicit.json()["selectedFrameId"] == "m-third"
        invalid = client.get("/semantic/memory/recording-context", params={**params, "frameId": "missing"})
        assert invalid.status_code == 422
        assert invalid.json()["detail"]["reasonCode"] == "frame_not_in_order"
    assert list(home.rglob("*")) == before
    assert path.is_dir()


def test_native_lookup_cannot_lose_frame_context_to_read_current_or_future_stm(repository):
    _, home = repository
    directory = recording(home)
    for frame in ("z-first", "a-second", "m-third", "b-fourth"):
        (directory / frame / "image.png").write_bytes(b"fixture")
    current = recording_context(home, directory, "a-second")
    future = recording_context(home, directory, "b-fourth")
    store = ContextualMemory(home, "first")
    stm = store.save(current.stm_area(), "shape", {"uid": "current"}, context=current)
    later = store.save(future.frame_area(), "shape", {"uid": "future"}, context=future)
    locations, without_frame = semantic._memory("first", current.sequence_id)
    found = locations._find(without_frame, stm["source"]["memoryLocationId"])
    assert found[1]["format"] == "memory_metta"
    cached = list((home / ".cache" / "memory-catalog").glob("*.json"))
    assert cached and all('"payload"' not in path.read_text(encoding="utf-8") for path in cached)
    with pytest.raises(PermissionError, match="explicit recording and frame"):
        locations._records(*found)
    app = FastAPI()
    app.include_router(semantic.router)
    with TestClient(app) as client:
        body = {"workspaceId": "first", "sequenceId": current.sequence_id, "kind": "shape"}
        missing = client.post("/semantic/memory/read", json={
            **body, "locationIds": [stm["source"]["memoryLocationId"]],
        })
        assert missing.status_code == 422 and missing.json()["detail"]["records"] == []
        assert "explicit recording and frame" in missing.text
        wrong_time = client.post("/semantic/memory/read", json={
            **body, "frameId": current.current.frame_id, "locationIds": [later["source"]["memoryLocationId"]],
        })
        assert wrong_time.status_code == 422 and wrong_time.json()["detail"]["records"] == []
        assert "future frame" in wrong_time.text


@pytest.mark.parametrize("mutation,code", [
    (lambda doc: doc.pop("moves"), "missing_order"),
    (lambda doc: doc["moves"].append(doc["moves"][0]), "invalid_order"),
    (lambda doc: doc.pop("game_id"), "missing_context"),
])
def test_invalid_or_absent_explicit_order_never_uses_folder_sort(repository, mutation, code):
    _, home = repository
    path = recording(home)
    manifest = path / "recording.json"
    document = json.loads(manifest.read_text())
    mutation(document)
    manifest.write_text(json.dumps(document))
    with pytest.raises(ContextUnavailable) as error:
        recording_context(home, path, "a-second")
    assert error.value.code == code


def test_http_selected_inspection_is_direct_shared_and_does_not_touch_preferences(repository, monkeypatch):
    _, home = repository
    path = recording(home)
    context = recording_context(home, path, "a-second")
    record = ContextualMemory(home, "first").save(context.frame_area(), "shape", {"uid": "actual"}, context=context)
    for method in ("catalog", "_discovered", "_catalog_metadata", "load_preferences"):
        monkeypatch.setattr(MemoryLocations, method, forbidden)
    monkeypatch.setattr(api, "_sequence_execution_context", forbidden)
    app = FastAPI()
    app.include_router(semantic.router)
    with TestClient(app) as client:
        body = {"kind": "shape", "areaId": "contextual:current-moment",
                "sequenceId": context.sequence_id, "frameId": "a-second"}
        results = [client.post(f"{semantic.router.prefix}/memory/inspect-area",
                               json={**body, "workspaceId": workspace}) for workspace in ("first", "second")]
        assert all(result.status_code == 200 for result in results)
        assert results[0].json() == results[1].json()
        result = results[0].json()
        assert result["records"][0]["preferred"]["recordUid"] == record["recordUid"]
        assert result["sources"][0]["memoryLocationId"] == record["source"]["memoryLocationId"]
        assert client.post(f"{semantic.router.prefix}/memory/inspect-area",
                           json={**body, "workspaceId": "first", "areaId": "data/elsewhere"}).status_code == 403
    assert not (home / "runtime" / "memory-settings").exists()


def test_database_rejects_json_disguised_as_metta_without_conversion(repository):
    _, home = repository
    area = home / "memory_inherited"
    area.mkdir()
    path = area / "shapes_db.metta"
    path.write_text('{"uid":"legacy-json"}')
    before = path.read_bytes()
    with pytest.raises(ValueError, match="non-MeTTa"):
        MeTTaMemoryDatabase(home, area, "shape").read()
    assert path.read_bytes() == before


def test_memory_directories_are_not_source_frames_or_sequences(repository):
    import sys
    from omega_vision.services import arc3_play
    _, home = repository
    path = recording(home)
    memory = path / "memory_level_1_stm"
    memory.mkdir()
    (memory / "image.png").write_bytes(b"not-a-source")
    (memory / "recording.json").write_text("{}")
    assert memory not in api._recording_step_dirs(path)
    assert api._scan_set_images(memory) == []
    assert memory not in api._iter_recording_dirs(path)
    nested = home / "curated" / "collection" / "memory"
    nested.mkdir(parents=True)
    (nested / "preview.png").write_bytes(b"not-a-source")
    assert api._scan_set_images(nested.parent) == []
    for reader in (arc3_play, sys.modules[api._iter_recording_dirs.__module__]):
        assert reader._recording_dir_stats(path)["moveDirCount"] == 0
        assert reader._image_set_dir_stats(nested.parent)["imageCount"] == 0


def test_nowhere_inspection_remains_bound_to_browser_ram(repository):
    _, home = repository
    browser = BrowserMemory("first", "page-token-12345678", None,
                            provider_ref="filesystem:omega_vision", storage_root=home)
    browser.memory.put("shape", {"uid": "ram-only"}, source={"providerRef": "filesystem:omega_vision",
                       "workspaceId": "first", "context": {}})
    wire = browser.to_wire()
    other = BrowserMemory("second", "page-token-12345678", wire,
                          provider_ref="filesystem:omega_vision", storage_root=home)
    result = ContextualMemory(home, "second").inspect("session:nowhere", "shape", volatile=other.memory)
    assert result["records"][0]["preferred"]["payload"]["uid"] == "ram-only"
    record = result["records"][0]["preferred"]
    exact = ContextualMemory(home, "second").inspect_reference(
        semantic._memory_reference(record), area_id="session:nowhere", volatile=other.memory)
    assert exact["status"] == "ready"
    assert exact["sources"][0]["providerRef"] == "filesystem:omega_vision"
    assert exact["sources"][0]["catalogProviderRef"] == "session"
    assert exact["sources"][0]["capabilities"]["read"] and exact["sources"][0]["counts"]["shape"] == 1
    assert not list(home.rglob("*"))


@pytest.mark.parametrize("spec", LEGACY_AREAS, ids=lambda spec: spec["areaId"])
def test_registered_legacy_leaf_is_direct_read_only_and_preserves_physical_identity(repository, monkeypatch, spec):
    _, home = repository
    store = ContextualMemory(home, "first")
    area = home.joinpath(*spec["registeredPath"].split("/"))
    area.mkdir(parents=True)
    kind = spec["memoryKinds"][0]
    path = area / ("shapes.pl" if kind == "shape" else "identities.db.pl")
    path.write_text("shape(key,name,turtle).\n" if kind == "shape" else
                    "assert(known_object(triangle,first,last,2)).\n", encoding="utf-8")
    before = path.read_bytes()
    for method in ("_discovered", "_find", "_catalog_metadata", "load_preferences"):
        monkeypatch.setattr(MemoryLocations, method, forbidden)
    result = store.inspect(spec["areaId"], kind)
    assert result["status"] == "ready" and len(result["records"]) == 1
    assert result["sources"][0]["memoryLocationId"] == MemoryLocations._location_id(store.mount, area)
    assert not result["sources"][0]["capabilities"]["write"]
    assert path.read_bytes() == before


def test_legacy_json_preferences_and_records_are_not_redirected_or_rewritten(repository):
    from omega_vision.perception.memory_locations import MemoryContext
    _, home = repository
    shared = ContextualMemory(home, "first")
    legacy = MemoryLocations([shared.mount])
    context = MemoryContext(shared.mount.provider_ref, shared.mount.workspace_id)
    location = legacy._destinations(legacy.roots[0], context)[0][0]["memoryLocationId"]
    legacy.save_record("shape", location, {"uid": "historical"}, context)
    initial = legacy.load_preferences(context)
    saved = legacy.save_preferences(context, initial, expected_revision=initial["revision"])
    before = {path: path.read_bytes() for path in home.rglob("*.json") if ".cache" not in path.parts}
    native, current = semantic._memory("first", None)
    assert native.load_preferences(current) == saved
    with pytest.raises(PermissionError, match="Historical"):
        native.save_record("shape", location, {"uid": "new"}, current)
    assert all(path.read_bytes() == content for path, content in before.items())
    assert not (home / "memory_inherited").exists()


@pytest.mark.parametrize("target", ["shapes_db.metta", ".writer.lock"])
@pytest.mark.parametrize("redirect", ["external", "legacy", "other-area"])
def test_metta_final_targets_and_locks_reject_descendant_redirection(repository, monkeypatch, target, redirect):
    from omega_vision.perception import metta_memory
    _, home = repository
    area = home / "memory_inherited"
    original = metta_memory.storage_path
    redirected = {"external": home.parent / "outside", "legacy": home / "video",
                  "other-area": home / "recordings" / "memory_recordings"}[redirect] / target

    def resolve(root, *parts):
        result = original(root, *parts)
        return redirected if parts and parts[-1] == target else result

    monkeypatch.setattr(metta_memory, "storage_path", resolve)
    with pytest.raises(PermissionError, match="redirected"):
        ContextualMemory(home, "first").save(area, "shape", {"uid": "blocked"})
    assert not list(home.rglob("*.metta"))


def test_read_only_provider_cannot_write_new_memory(repository):
    _, home = repository
    store = ContextualMemory(home, "first")
    denied = ContextualMemory(home, "second", mount=replace(store.mount, writable=False))
    with pytest.raises(PermissionError, match="authorize writes"):
        denied.save(home / "memory_inherited", "shape", {"uid": "denied"})
    assert not list(home.rglob("*"))


def test_explicit_repromotion_rebinds_an_already_promoted_rule_to_second_level(repository, monkeypatch):
    from omega_vision.perception.contextual_rules import ContextualRuleStore
    from omega_vision.perception.candidate_rules import PromotionGates, ValidationError
    _, home = repository
    path = recording(home)
    manifest = json.loads((path / "recording.json").read_text())
    for frame, level in (("return-first", "1"), ("return-second", "2")):
        (path / frame).mkdir()
        manifest["moves"].append({"directory": f"data/recordings/game/recording-a/{frame}", "level": level})
    (path / "recording.json").write_text(json.dumps(manifest), encoding="utf-8")
    first, first_later, second, second_later = [
        recording_context(home, path, frame) for frame in ("z-first", "a-second", "m-third", "b-fourth")
    ]
    return_first, return_second = [recording_context(home, path, frame)
                                   for frame in ("return-first", "return-second")]
    origin = ContextualRuleStore(first)
    candidate = origin.create(
        {"body": [{"predicate": "present", "args": [{"var": "X"}]}],
         "head": {"predicate": "moved", "args": [{"var": "X"}]}},
        kind="event_detector", scope={"domain": "test"}, source="authored",
        provenance={"code_hash": "two-level-fixture"}, inducer_version="two-level-v1",
    )
    identifier = candidate["candidate_id"]
    for index in (1, 2):
        origin.record_evidence(identifier, {
            "sequence_id": f"sequence-{index}", "sequence_fingerprint": f"content-{index}",
            "pair_id": f"pair-{index}", "before_hash": f"before-{index}", "after_hash": f"after-{index}",
            "partition": "held_out", "outcome": "support", "assessment": "changed",
            "comparison_complete": True, "confidence": .95, "event_ids": [f"event-{index}"],
            "evidence_refs": [f"evidence-{index}"], "source": "deterministic_replay",
            "evaluator_id": "fixture", "evaluator_version": "1", "depends_on_candidates": [],
        })
    original = origin.promote(identifier, gates=PromotionGates())
    assert origin.list(status="promoted") == []
    assert ContextualRuleStore(first_later).list(status="promoted")[0]["candidate_id"] == identifier
    assert ContextualRuleStore(second_later).list(status="promoted") == []
    assert not (second.stm_area() / "deduction_rules.metta").exists()
    old_publication = (first.stm_area() / "deduction_rules.metta").read_bytes()
    old_journal = origin.journal.database.path.read_bytes()
    writer = ContextualRuleStore(second, origin=first)
    assert writer.get(identifier)["status"] == "promoted"
    checks = []
    evaluate = writer._evaluate_locked

    def evaluated(records, candidate_id, gates, approval):
        checks.append(gates)
        return evaluate(records, candidate_id, gates, approval)

    monkeypatch.setattr(writer, "_evaluate_locked", evaluated)
    gates = PromotionGates()
    promoted = writer.promote(identifier, gates=gates)
    assert checks == [gates]
    assert promoted["promoted_rule_ref"] != original["promoted_rule_ref"]
    assert promoted["evidence"] == original["evidence"]
    assert promoted["promoted_rule_ref"].startswith(
        "data/" + second.stm_area().relative_to(home).as_posix() + "/deduction_rules.metta#"
    )
    assert writer.list(status="promoted") == []
    assert ContextualRuleStore(second_later).list(status="promoted")[0]["candidate_id"] == identifier
    assert (first.stm_area() / "deduction_rules.metta").read_bytes() == old_publication
    assert origin.journal.database.path.read_bytes().startswith(old_journal)
    assert ContextualRuleStore(first_later).list(status="promoted")[0]["promoted_rule_ref"] == original["promoted_rule_ref"]
    for context, expected in ((return_first, original), (return_second, promoted)):
        active = ContextualRuleStore(context).list(status="promoted")
        assert len(active) == 1 and active[0]["candidate_id"] == identifier
        assert active[0]["promoted_rule_ref"] == expected["promoted_rule_ref"]
    journal = origin.journal.database.path.read_bytes()
    assert writer.promote(identifier, gates=gates)["promoted_rule_ref"] == promoted["promoted_rule_ref"]
    assert origin.journal.database.path.read_bytes() == journal
    publication = (second.stm_area() / "deduction_rules.metta").read_bytes()
    with pytest.raises(ValidationError, match="promotion blocked"):
        writer.promote(identifier, gates=PromotionGates(min_confidence=1))
    assert (second.stm_area() / "deduction_rules.metta").read_bytes() == publication
    assert ContextualRuleStore(return_first).list(status="promoted") == []
    assert ContextualRuleStore(return_second).list(status="promoted") == []
    writer.promote(identifier, gates=gates)
    assert ContextualRuleStore(return_second).list(status="promoted")[0]["candidate_id"] == identifier
    assert ContextualRuleStore(return_first).list(status="promoted") == []
    # Explicit revocation preserves publications and previously approved
    # historical views while suppressing current execution.
    revoker = ContextualRuleStore(return_first, origin=first)
    revoker.reject(identifier, reason="Explicit withdrawal", provenance={"reviewer": "fixture"})
    assert ContextualRuleStore(return_second).list(status="promoted") == []
    assert ContextualRuleStore(first_later).list(status="promoted")[0]["promoted_rule_ref"] == original["promoted_rule_ref"]
    assert ContextualRuleStore(second_later).list(status="promoted")[0]["candidate_id"] == identifier
    assert (first.stm_area() / "deduction_rules.metta").read_bytes() == old_publication
    assert (second.stm_area() / "deduction_rules.metta").read_bytes() == publication


def test_scoped_rules_keep_gates_history_and_causal_stm_references(repository):
    from omega_vision.perception.contextual_rules import ContextualRuleStore
    from omega_vision.perception.candidate_rules import PromotionGates, ValidationError
    _, home = repository
    path = recording(home)
    current = recording_context(home, path, "m-third")
    later = recording_context(home, path, "b-fourth")
    store = ContextualRuleStore(current)
    rule = {"body": [{"predicate": "present", "args": [{"var": "X"}]}],
            "head": {"predicate": "moved", "args": [{"var": "X"}]}}
    candidate = store.create(rule, kind="event_detector", scope={"domain": "test"},
                             source="prolog_induction", provenance={"code_hash": "fixture"}, inducer_version="v1")
    identifier = candidate["candidate_id"]
    assert candidate["status"] == "proposed"
    assert not store.list(status="promoted")
    with pytest.raises(ValidationError, match="promotion blocked"):
        store.promote(identifier, gates=PromotionGates())
    assert not (current.stm_area() / "deduction_rules.metta").exists()
    for index in (1, 2):
        store.record_evidence(identifier, {
            "sequence_id": f"sequence-{index}", "sequence_fingerprint": f"content-{index}",
            "pair_id": f"pair-{index}", "before_hash": f"before-{index}", "after_hash": f"after-{index}",
            "partition": "held_out", "outcome": "support", "assessment": "changed",
            "comparison_complete": True, "confidence": .95, "event_ids": [f"event-{index}"],
            "evidence_refs": [f"evidence-{index}"], "source": "deterministic_replay",
            "evaluator_id": "fixture", "evaluator_version": "1", "depends_on_candidates": [],
        })
    before = (current.frame_area() / "induced_rules.metta").read_bytes()
    assert store.promote(identifier, gates=PromotionGates())["status"] == "promoted"
    assert (current.frame_area() / "induced_rules.metta").read_bytes().startswith(before)
    assert not store.list(status="promoted")  # Promotion is not available in its own frame.
    assert ContextualRuleStore(later).list(status="promoted")[0]["candidate_id"] == identifier
    promoted = MeTTaMemoryDatabase(home, current.stm_area(), "deduction").read()[0]
    assert "rule" not in promoted and promoted["origin"]["frameId"] == "m-third"
    assert promoted["generatedAt"]["frameOrder"] == promoted["promotedAt"]["frameOrder"] == 2
    other = recording_context(home, recording(home, "recording-b"), "b-fourth")
    assert not ContextualRuleStore(other).list(status="promoted")
    assert not (home / "runtime" / "rule-candidates").exists()
    assert not list(home.glob("recordings/game/*_ltm"))
    with pytest.raises(ContextUnavailable, match="learning-procedure AST"):
        store.promote(identifier, gates=PromotionGates(), role="induction")
    ContextualRuleStore(later, origin=current).reject(identifier, reason="counterexample",
                                                     provenance={"source": "human_review"})
    assert not ContextualRuleStore(later).list(status="promoted")
    assert (current.stm_area() / "deduction_rules.metta").is_file()


def test_plain_metta_writes_do_not_dirty_visual_sequence_options(repository):
    _, home = repository
    directory = home / ".cache" / "visual-sequence-list"
    directory.mkdir(parents=True)
    choices = directory / "choices.json"
    choices.write_text('{"fixture":"unchanged options"}')
    before = {path: path.read_bytes() for path in directory.iterdir()}
    ContextualMemory(home, "first").save(home / "memory_inherited", "shape", {"uid": "not-a-frame"})
    assert {path: path.read_bytes() for path in directory.iterdir()} == before


def test_exact_reference_resolution_is_direct_and_workspace_provenance_is_not_ownership(repository, monkeypatch):
    _, home = repository
    store = ContextualMemory(home, "first")
    record = store.save(home / "memory_inherited", "shape", {"uid": "referenced"})
    reference = semantic._memory_reference(record)
    reference["workspaceId"] = "different-provenance"
    for method in ("_find", "_discovered", "catalog", "_catalog_metadata"):
        monkeypatch.setattr(MemoryLocations, method, forbidden)
    result = ContextualMemory(home, "second").inspect_reference(reference, area_id="contextual:inherited")
    assert result["status"] == "ready"
    assert result["records"][0]["preferred"]["recordUid"] == record["recordUid"]
    assert result["sources"][0]["providerRef"] == reference["providerRef"]
    for field, value in (("providerRef", "foreign"), ("memoryLocationId", "foreign-location"),
                         ("registeredPath", "../outside"), ("targetKind", "object")):
        with pytest.raises((PermissionError, ValueError)):
            store.inspect_reference({**reference, field: value}, area_id="contextual:inherited")
    for field in ("recordUid", "revision"):
        assert store.inspect_reference({**reference, field: "wrong"}, area_id="contextual:inherited")["reasonCode"] == "reference_not_found"


def test_http_contextual_references_preserve_cutoff_and_exact_original_metta(repository, monkeypatch):
    from omega_vision.services.metta_resource_codec import metta_document_to_json
    _, home = repository
    directory = recording(home)
    other = recording(home, "recording-b")
    prior = recording_context(home, directory, "z-first")
    current = recording_context(home, directory, "a-second")
    foreign = recording_context(home, other, "z-first")
    store = ContextualMemory(home, "first")
    old = store.save(prior.stm_area(), "shape", {"uid": "prior", "typedId": "001"}, context=prior)
    now = store.save(current.stm_area(), "shape", {"uid": "current-child"}, context=current)
    elsewhere = store.save(foreign.stm_area(), "shape", {"uid": "other-recording"}, context=foreign)
    for method in ("_find", "_discovered", "catalog", "_catalog_metadata"):
        monkeypatch.setattr(MemoryLocations, method, forbidden)
    monkeypatch.setattr(api, "_list_image_sets", forbidden)
    app = FastAPI()
    app.include_router(semantic.router)
    client = TestClient(app)
    body = {"workspaceId": "second", "areaId": "contextual:scene",
            "sequenceId": current.sequence_id, "frameId": current.current.frame_id}
    inspected = client.post("/semantic/memory/inspect-area", json={**body, "kind": "shape"})
    assert inspected.status_code == 200
    result = inspected.json()
    assert result["areaType"] == "contextual" and result["errors"] == []
    assert isinstance(result["records"], list) and len(result["records"]) == 1
    source = result["authorizedSources"][0]
    assert source["memoryKind"] == "shape" and source["providerRef"] == old["source"]["providerRef"]
    assert source["memoryLocationId"] == old["source"]["memoryLocationId"]
    assert source["format"] == "memory_metta" and source["pathLabel"].endswith("shapes_db.metta")
    original = result["records"][0]["preferred"]["originalSource"]
    assert original["format"] == "metta" and original["readOnly"]
    assert original["text"] in Path(original["path"]).read_text(encoding="utf-8")
    assert metta_document_to_json(original["text"])["record"] == old
    assert "current-child" not in original["text"]
    for record, expected in ((old, "ready"), (now, "unavailable"), (elsewhere, "unavailable")):
        response = client.post("/semantic/memory/inspect-reference", json={
            **body, "reference": {**semantic._memory_reference(record), "workspaceId": "display-only"},
        })
        assert response.status_code == 200
        resolved = response.json()
        assert resolved["status"] == expected
        if expected == "unavailable":
            assert resolved["reasonCode"] == "reference_not_found" and resolved["records"] == []
            assert resolved["errors"]
    with pytest.raises(ContextUnavailable, match="selected inspector area"):
        store.inspect_reference(semantic._memory_reference(old))


def test_same_stm_file_future_revision_requires_context_and_never_falls_back_to_latest(repository, monkeypatch):
    _, home = repository
    directory = recording(home)
    (directory / "explicit-future").mkdir()
    manifest_path = directory / "recording.json"
    manifest = json.loads(manifest_path.read_text(encoding="utf-8"))
    manifest["moves"].append({
        "directory": "data/recordings/game/recording-a/explicit-future", "level": "1",
    })
    manifest_path.write_text(json.dumps(manifest), encoding="utf-8")
    prior = recording_context(home, directory, "z-first")
    selected = recording_context(home, directory, "a-second")
    future = recording_context(home, directory, "explicit-future")
    store = ContextualMemory(home, "first")
    old = store.save(prior.stm_area(), "shape", {"uid": "same-shape", "value": "past"}, context=prior)
    later = store.save(future.stm_area(), "shape", {"uid": "same-shape", "value": "future"}, context=future)
    assert old["conceptUid"] == later["conceptUid"]
    assert old["revision"] != later["revision"]
    assert old["source"]["memoryLocationId"] == later["source"]["memoryLocationId"]
    for method in ("_find", "_discovered", "catalog"):
        monkeypatch.setattr(MemoryLocations, method, forbidden)
    app = FastAPI()
    app.include_router(semantic.router)
    client = TestClient(app)
    body = {"workspaceId": "second", "areaId": "contextual:scene",
            "sequenceId": selected.sequence_id, "frameId": selected.current.frame_id}
    visible = client.post("/semantic/memory/inspect-area", json={**body, "kind": "shape"})
    assert visible.status_code == 200
    versions = [version for concept in visible.json()["records"] for version in concept["versions"]]
    assert [version["recordUid"] for version in versions] == [old["recordUid"]]
    assert "future" not in versions[0]["originalSource"]["text"]
    for record, expected in ((old, "ready"), (later, "unavailable")):
        response = client.post("/semantic/memory/inspect-reference", json={
            **body, "reference": semantic._memory_reference(record),
        })
        assert response.status_code == 200 and response.json()["status"] == expected
        if expected == "unavailable":
            assert response.json()["reasonCode"] == "reference_not_found"
            assert response.json()["records"] == []
    no_area = client.post("/semantic/memory/inspect-reference", json={
        "workspaceId": "second", "reference": semantic._memory_reference(later),
    })
    assert no_area.status_code in (400, 422)
    no_sequence = client.post("/semantic/memory/inspect-reference", json={
        "workspaceId": "second", "areaId": "contextual:scene", "reference": semantic._memory_reference(later),
    })
    assert no_sequence.status_code == 200 and no_sequence.json()["status"] == "unavailable"
    assert no_sequence.json()["reasonCode"] == "missing_sequence" and no_sequence.json()["records"] == []
    no_frame = client.post("/semantic/memory/inspect-reference", json={
        **{key: value for key, value in body.items() if key != "frameId"},
        "reference": semantic._memory_reference(later),
    })
    assert no_frame.status_code == 200 and no_frame.json()["status"] == "unavailable"
    assert no_frame.json()["records"] == []


def test_typed_reference_contract_has_seven_domains_and_distinct_relation_directions():
    from omega_vision.perception.memory_references import normalize_reference, reference_schema
    schema = reference_schema()
    assert schema["targetKinds"] == {
        "shape": "shapes_db.metta", "object": "objects_db.metta",
        "shape_group": "shape_groups_db.metta", "object_group": "object_groups_db.metta",
        "shape_group_class": "shape_group_classes_db.metta",
        "object_group_class": "object_group_classes_db.metta", "object_class": "obj_classes_db.metta",
    }
    base = {"providerRef": "filesystem:omega_vision", "memoryLocationId": "location",
            "recordUid": "exact-record", "revision": "exact-revision"}
    for relation, fields in schema["relations"].items():
        for source, target in fields.get("sourceTargetPairs", {}).items():
            ref = {**base, "targetKind": target, "relation": relation}
            assert normalize_reference(ref, source_kind=source) == ref
        for target in fields["targetKinds"]:
            assert normalize_reference({**base, "targetKind": target, "relation": relation})["targetKind"] == target
    for source, target, relation in (
        ("object", "shape", "has_part"), ("shape", "object", "part_of"),
        ("shape_group", "object", "has_member"), ("object_group", "shape", "has_member"),
        ("shape", "object_class", "instance_of"), ("object", "shape_group", "member_of"),
        ("object_class", "shape", "has_instance"),
    ):
        with pytest.raises(ValueError):
            normalize_reference({**base, "targetKind": target, "relation": relation}, source_kind=source)
    for target in ("part", "group", "group_class", "shape_class"):
        with pytest.raises(ValueError, match="Unknown"):
            normalize_reference({**base, "targetKind": target, "relation": "references"})
    with pytest.raises(ValueError, match="relation"):
        normalize_reference({**base, "targetKind": "shape"})
    with pytest.raises(ValueError, match="targetKind"):
        normalize_reference({**base, "relation": "has_shape"})


def test_only_named_legacy_shape_reference_adapter_supplies_tags_without_rewriting_history(repository):
    from omega_vision.perception.memory_references import normalize_reference
    from omega_vision.perception.memory_locations import _validate_payload
    _, home = repository
    old = {"providerRef": "filesystem:omega_vision", "memoryLocationId": "location",
           "recordUid": "shape-record", "revision": "shape-version"}
    adapted = normalize_reference(old, legacy_shape=True, source_kind="object")
    assert adapted == {**old, "targetKind": "shape", "relation": "has_shape"}
    assert "targetKind" not in old and "workspaceId" not in adapted
    _validate_payload("object", {"uid": "persistent-object", "shapeReferences": [old]})
    for contradictory in ({**old, "targetKind": "object"}, {**old, "relation": "has_part"}):
        with pytest.raises(ValueError, match="shape-only"):
            _validate_payload("object", {"uid": "persistent-object", "shapeReferences": [contradictory]})
    with pytest.raises(ValueError, match="targetKind"):
        _validate_payload("object", {"uid": "persistent-object", "references": [old]})
    store = ContextualMemory(home, "first")
    payload = {"uid": "whole-object", "references": [
        {**old, "targetKind": "object", "relation": "has_part", "recordUid": "actual-part-object"},
    ]}
    record = store.save(home / "memory_inherited", "object", payload)
    assert store.read(home / "memory_inherited", "object")[0][0]["payload"] == payload
    assert semantic._memory_reference(record)["relation"] == "references"


def test_planned_typed_reference_is_explicitly_unavailable_without_context_or_reader_access(repository, monkeypatch):
    _, home = repository
    monkeypatch.setattr(MeTTaMemoryDatabase, "read_with_sources", forbidden)
    store = ContextualMemory(home, "first")
    result = store.inspect_reference({
        "targetKind": "object_class", "relation": "instance_of", "providerRef": "filesystem:omega_vision",
        "memoryLocationId": "unavailable-class-location", "recordUid": "unavailable-class",
        "revision": "exact-class-version",
    }, area_id="contextual:scene", context_loader=forbidden)
    assert result["status"] == "unavailable" and result["kind"] == "object_class"
    assert result["reasonCode"] == "object_class_schema_unavailable"
    assert not result["records"] and not result["authorizedSources"]
    assert not list(home.rglob("*.metta"))


def test_rule_publication_can_save_memory_in_same_frame_without_nested_lock(repository):
    from omega_vision.perception.contextual_rules import ContextualRuleStore
    _, home = repository
    context = recording_context(home, recording(home), "a-second")
    rules = ContextualRuleStore(context)
    revision = semantic._registry_revision(rules)
    with semantic._registry_publication(rules, revision):
        record = ContextualMemory(home, "first").save(context.frame_area(), "shape",
                                                    {"uid": "same-frame"}, context=context)
    assert record["payload"]["uid"] == "same-frame"
    assert (home / "runtime" / "contextual-rule-locks" / ".writer.lock").is_file()
    assert not (context.frame_area() / "induced_rules.metta").exists()


def test_noncontextual_legacy_rule_reads_do_not_create_placeholder_journals(repository):
    _, home = repository
    store = semantic._store(home)
    assert store.list() == []
    assert not list(home.rglob("*"))


@pytest.mark.parametrize("target", ["grouping-promotion-locks", ".writer.lock"])
def test_scoped_grouping_lock_rejects_redirect_before_creation(repository, monkeypatch, target):
    from omega_vision.perception import contextual_rules
    _, home = repository
    context = recording_context(home, recording(home), "m-third")
    original = contextual_rules.storage_path

    def redirected(root, *parts):
        if "grouping-promotion-locks" in parts and parts[-1] == target:
            return home.parent / "outside-rule-lock"
        return original(root, *parts)

    monkeypatch.setattr(contextual_rules, "storage_path", redirected)
    with pytest.raises(PermissionError, match="lock target was redirected"):
        contextual_rules.ContextualRuleStore(context)
    assert not (home / "runtime").exists()
    assert not (home.parent / "outside-rule-lock").exists()


@pytest.mark.parametrize("scoped", [True, False])
def test_deduction_binds_each_pair_to_its_own_causal_frame_only_for_omega(repository, monkeypatch, scoped):
    from types import SimpleNamespace
    from omega_vision.perception import event_deduction
    from omega_vision.perception.contextual_rules import ContextualRuleStore
    _, home = repository
    context = recording_context(home, recording(home), "b-fourth")
    store = ContextualRuleStore(context) if scoped else object()
    frames = [SimpleNamespace(uid=moment.frame_id, order=moment.order,
                              provider_id="filesystem:omega_vision", sequence_id=context.sequence_id)
              for moment in context.moments]
    seen = []
    monkeypatch.setattr(event_deduction, "initial_temporal_state", lambda frame: {})
    monkeypatch.setattr(event_deduction, "initial_event_state", lambda *args, **kwargs: {})
    monkeypatch.setattr(event_deduction, "validate_temporal_result", lambda value: None)
    monkeypatch.setattr(event_deduction, "log_frame", lambda frame, state, **kwargs: {"id": frame.uid})
    monkeypatch.setattr(event_deduction, "accepted_detectors", lambda config: {})

    def deduce(previous, current, temporal, *, candidate_store, **kwargs):
        seen.append(candidate_store.context.current.order if scoped else candidate_store)
        return {"checkpoint": {}, "frame": {"id": current.uid}, "accepted_detectors": {}, "assessment": {}}

    monkeypatch.setattr(event_deduction, "deduce_pair_events", deduce)
    event_deduction.deduce_sequence(frames, [{"topology": []}] * 3, candidate_store=store)
    assert seen == [1, 2, 3] if scoped else all(item is store for item in seen)
    assert not list(home.rglob("*.metta"))
