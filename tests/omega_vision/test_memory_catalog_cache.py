from concurrent.futures import ThreadPoolExecutor
from dataclasses import replace
import json

import pytest

from omega_vision.perception import memory_catalog_cache as cache
from omega_vision.perception.memory_locations import (
    AuthorizedMemoryRoot, MemoryContext, MemoryLocations, NOWHERE, VolatileMemory,
)


def setup(tmp_path):
    context = MemoryContext("local", "workspace", "game", "level", "run")
    root = AuthorizedMemoryRoot("local", "workspace", tmp_path, "Workspace", writable=True)
    return MemoryLocations([root]), context


def test_persisted_catalog_and_defaults_reuse_without_scanning(tmp_path, monkeypatch):
    store, context = setup(tmp_path)
    first = store.catalog(context)
    defaults = store.load_preferences(context)
    assert list(cache.cache_directory(tmp_path).glob("*.json"))
    fresh_process_store = MemoryLocations(store.roots)
    monkeypatch.setattr(MemoryLocations, "_discovered", lambda *_a, **_k: pytest.fail("Clean cache must not scan"))
    monkeypatch.setattr(MemoryLocations, "_records", lambda *_a: pytest.fail("Clean cache must not read payloads"))
    assert fresh_process_store.catalog(context) == first
    assert fresh_process_store.load_preferences(context) == defaults


def test_save_invalidates_all_scope_views_and_other_readers(tmp_path):
    store, context = setup(tmp_path)
    defaults = store.load_preferences(context)
    empty = store.catalog(context)
    destination = defaults["shape"]["saveTo"]
    store.save_record("shape", destination, {"uid": "shape", "canonicalPoints": [[1, 2]]}, context)
    other = MemoryLocations(store.roots)
    updated = other.catalog(context)
    assert updated["revision"] != empty["revision"]
    assert next(item for item in updated["locations"] if item["memoryLocationId"] == destination)["counts"]["shape"] == 1
    assert other.load_preferences(context)["shape"]["lookIn"] == [destination]


def test_nowhere_is_added_only_to_response_not_cache(tmp_path):
    store, context = setup(tmp_path)
    baseline = store.catalog(context)
    volatile = VolatileMemory()
    store.save_record("shape", NOWHERE, {"uid": "SECRET-SESSION-SHAPE"}, context, volatile=volatile)
    current = store.catalog(context, volatile=volatile)
    assert current["revision"] == baseline["revision"]
    assert next(item for item in current["locations"] if item["memoryLocationId"] == NOWHERE)["counts"]["shape"] == 1
    for path in cache.cache_directory(tmp_path).glob("*.json"):
        text = path.read_text()
        assert "SECRET-SESSION-SHAPE" not in text
        assert NOWHERE not in text
        assert "canonicalPoints" not in text
    assert not (cache.cache_directory(tmp_path) / "dirty.json").exists()


def test_refresh_and_expiry_detect_external_deletion(tmp_path, monkeypatch):
    store, context = setup(tmp_path)
    target = store.load_preferences(context)["shape"]["saveTo"]
    store.save_record("shape", target, {"uid": "a"}, context)
    populated = store.catalog(context)
    file = next((tmp_path / "knowledge").rglob("*.memory.json"))
    original = file.read_bytes()
    file.unlink()
    assert store.catalog(context) == populated
    refreshed = store.catalog(context, refresh=True)
    assert target not in [item["memoryLocationId"] for item in refreshed["locations"]]
    assert store.load_preferences(context)["shape"]["lookIn"] == []
    file.write_bytes(original)
    monkeypatch.setattr(cache, "MAX_AGE_SECONDS", 0)
    assert target in [item["memoryLocationId"] for item in store.catalog(context)["locations"]]


def test_mount_permission_and_scope_changes_cannot_reuse_old_access(tmp_path):
    store, context = setup(tmp_path)
    target = store.load_preferences(context)["shape"]["saveTo"]
    store.save_record("shape", target, {"uid": "a"}, context)
    store.catalog(context)
    denied = MemoryLocations([replace(store.roots[0], readable=False)])
    assert denied.catalog(context)["errors"]
    assert denied.read_selected("shape", [target], context)["errors"]
    readonly = MemoryLocations([replace(store.roots[0], writable=False)])
    with pytest.raises(PermissionError):
        readonly.save_record("shape", target, {"uid": "b"}, context)
    scoped = MemoryLocations([replace(store.roots[0], game_id="different")])
    assert scoped.read_selected("shape", [target], context)["errors"]


def test_corrupt_cache_rebuilds_with_visible_diagnostic(tmp_path, caplog):
    store, context = setup(tmp_path)
    first = store.catalog(context)
    path = next(cache.cache_directory(tmp_path).glob("*.json"))
    path.write_text("{invalid")
    assert store.catalog(context) == first
    assert "Rebuilding corrupt memory catalog" in caplog.text


def test_cache_read_permission_error_is_not_stale_success(tmp_path, monkeypatch):
    store, context = setup(tmp_path)
    store.catalog(context)
    from pathlib import Path
    read = Path.read_text

    def denied(path, *args, **kwargs):
        if path.parent == cache.cache_directory(tmp_path) and path.name != "dirty.json":
            raise PermissionError("test cache denied")
        return read(path, *args, **kwargs)

    monkeypatch.setattr(Path, "read_text", denied)
    assert store.catalog(context)["errors"]


def test_dirty_during_rebuild_is_not_lost(tmp_path):
    calls = []
    def build():
        calls.append(1)
        if len(calls) == 1:
            cache.invalidate_memory_catalog(tmp_path)
        return {"locations": [], "errors": []}
    cache.catalog_metadata(tmp_path, tmp_path, {"scope": "x"}, build)
    assert len(calls) == 2
    cache.catalog_metadata(tmp_path, tmp_path, {"scope": "x"}, lambda: pytest.fail("published clean"))
    cache.invalidate_memory_catalog(tmp_path)
    cache.catalog_metadata(tmp_path, tmp_path, {"scope": "x"}, build)
    assert len(calls) == 3


def test_concurrent_readers_publish_once_and_reject_payload_cache(tmp_path):
    calls = []
    def build():
        calls.append(1)
        return {"locations": [], "errors": []}
    def read(_):
        return cache.catalog_metadata(tmp_path, tmp_path, {"key": "same"}, build)
    with ThreadPoolExecutor(max_workers=4) as pool:
        assert len(list(pool.map(read, range(8)))) == 8
    assert len(calls) == 1
    with pytest.raises(ValueError, match="payloads"):
        cache.catalog_metadata(tmp_path, tmp_path, {"key": "bad"},
                               lambda: {"locations": [], "errors": [], "payload": {"uid": "forbidden"}})


def test_selected_cached_path_is_reauthorized_before_read(tmp_path):
    store, context = setup(tmp_path)
    legacy = tmp_path / "old" / "shape_dir"
    legacy.mkdir(parents=True)
    (legacy / "shapes.pl").write_text("shape(key,name,turtle).\n")
    location = next(item for item in store.catalog(context)["locations"] if item["format"] == "legacy_shape")
    path = next(cache.cache_directory(tmp_path).glob("*.json"))
    document = json.loads(path.read_text())
    document["metadata"]["locations"][0]["pathLabel"] = str(tmp_path.parent / "outside")
    document["metadataHash"] = cache.content_hash(document["metadata"])
    path.write_text(json.dumps(document))
    result = store.read_selected("shape", [location["memoryLocationId"]], context)
    assert result["errors"]
