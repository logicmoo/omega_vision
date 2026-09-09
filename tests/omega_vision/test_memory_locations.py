from __future__ import annotations

from copy import deepcopy
from concurrent.futures import ThreadPoolExecutor
import json
from pathlib import Path

import pytest

from omega_vision.perception.memory_locations import (
    NOWHERE, AuthorizedMemoryRoot, MemoryContext, MemoryLocations, VolatileMemory,
)


def store_at(path: Path, *, provider="local", workspace="workbench", writable=True):
    path.mkdir(parents=True, exist_ok=True)
    context = MemoryContext(provider, workspace, "game-a", "level-a", "run-a")
    store = MemoryLocations([AuthorizedMemoryRoot(provider, workspace, path, "Workspace", writable=writable)])
    return store, context


def destination(store, context, kind, scope):
    return next(item["memoryLocationId"] for item in store.catalog(context)["destinations"]
                if item["scopeKind"] == scope and kind in item["memoryKinds"])


def test_catalog_lists_only_populated_reads_but_empty_writable_destinations(tmp_path):
    store, context = store_at(tmp_path)
    catalog = store.catalog(context)
    assert [item["memoryLocationId"] for item in catalog["locations"]] == [NOWHERE]
    assert len(catalog["destinations"]) == 9
    assert not (tmp_path / "knowledge").exists()
    assert not (tmp_path / "runtime").exists()
    assert catalog["effective"] == {"shape": [], "object": []}


def test_independent_preferences_default_run_and_persist_atomic_cas(tmp_path):
    store, context = store_at(tmp_path)
    initial = store.load_preferences(context)
    assert not initial["expanded"]
    assert initial["shape"]["saveTo"] == destination(store, context, "shape", "run")
    assert initial["object"]["saveTo"] == destination(store, context, "object", "run")
    draft = deepcopy(initial)
    draft["shape"]["saveTo"] = destination(store, context, "shape", "global")
    draft["shape"]["lookIn"] = [NOWHERE]
    draft["expanded"] = True
    saved = store.save_preferences(context, draft, expected_revision=initial["revision"])
    assert saved["object"] == initial["object"]
    assert store.load_preferences(context) == saved
    with pytest.raises(ValueError, match="changed"):
        store.save_preferences(context, initial, expected_revision=initial["revision"])
    assert not list((tmp_path / "runtime" / "memory-settings").glob("*.pending*"))


def test_nowhere_has_no_files_no_cache_and_resets_even_when_catalog_empty(tmp_path):
    store, context = store_at(tmp_path)
    volatile = VolatileMemory()
    result = store.save_record("shape", NOWHERE, {"uid": "shape-a", "points": [[1, 2]]}, context, volatile=volatile)
    assert not list(tmp_path.iterdir())
    assert store.catalog(context, volatile=volatile)["locations"][0]["counts"]["shape"] == 1
    assert result["payload"]["points"] == [[1, 2]]
    assert store.catalog(context, volatile=VolatileMemory())["locations"][0]["counts"]["shape"] == 0
    volatile.reset()
    assert volatile.records("shape") == []
    assert store.catalog(context, volatile=volatile)["locations"][0]["memoryLocationId"] == NOWHERE
    with pytest.raises(ValueError, match="live session"):
        store.save_record("shape", NOWHERE, {"uid": "shape-a"}, context)


def test_effective_order_and_new_saves_do_not_move_old_records(tmp_path):
    store, context = store_at(tmp_path)
    identifiers = []
    for scope in ("global", "game", "level", "run"):
        identifier = destination(store, context, "shape", scope)
        identifiers.append(identifier)
        store.save_record("shape", identifier, {"uid": "shape-a", "shapeKey": "same-shape", "scopeEvidence": scope}, context)
    catalog = store.catalog(context)
    assert catalog["effective"]["shape"] == list(reversed(identifiers))
    selected = store.read_selected("shape", identifiers, context)["records"]
    assert len(selected) == 1 and len(selected[0]["versions"]) == 4
    assert selected[0]["preferred"]["source"]["scopeKind"] == "run"
    assert selected[0]["conflict"]
    initial = store.load_preferences(context)
    changed = deepcopy(initial)
    changed["shape"]["saveTo"] = identifiers[0]
    store.save_preferences(context, changed, expected_revision=initial["revision"])
    assert len(store.read_selected("shape", identifiers, context)["records"][0]["versions"]) == 4


def test_separate_shape_object_destinations_and_attributed_multi_shape_versions(tmp_path):
    store, context = store_at(tmp_path)
    shape_dest = destination(store, context, "shape", "global")
    object_dest = destination(store, context, "object", "run")
    refs = [{"providerRef": "remote", "workspaceId": "other", "memoryLocationId": f"shape-location-{i}",
             "recordUid": f"shape-{i}", "revision": f"version-{i}", "attribution": {"member": f"member-{i}"}}
            for i in range(2)]
    shape = {"uid": "anchor-a", "shapeKey": "key-a"}
    obj = {"uid": "object-a", "memberTrackUids": ["track-a", "track-b"], "shapeReferences": refs,
           "compositionHistory": [{"frameUid": "frame-a"}, {"frameUid": "frame-b"}]}
    store.save_record("shape", shape_dest, shape, context)
    store.save_record("object", object_dest, obj, context)
    persisted = store.read_selected("object", [object_dest], context)["records"][0]["preferred"]["payload"]
    assert persisted == obj
    assert store.read_selected("shape", [shape_dest], context)["records"][0]["preferred"]["payload"] == shape
    with pytest.raises(PermissionError):
        store.save_record("object", shape_dest, obj, context)


def test_explicit_volatile_save_copy_preserves_source_and_does_not_auto_clear(tmp_path):
    store, context = store_at(tmp_path)
    volatile = VolatileMemory()
    original = volatile.put("shape", {"uid": "shape-a", "points": [[0, 0]]})
    target = destination(store, context, "shape", "game")
    store.save_copy(original, target, context)
    copied = store.read_selected("shape", [target], context)["records"][0]["preferred"]
    assert copied["origin"]["source"]["memoryLocationId"] == NOWHERE
    assert copied["origin"]["recordUid"] == original["recordUid"]
    assert len(volatile.records("shape")) == 1
    assert copied["payload"] == original["payload"]


def test_readonly_denied_and_disappeared_roots_do_not_leak_paths(tmp_path):
    allowed = tmp_path / "read-only"
    denied = tmp_path / "private-secret-location"
    allowed.mkdir()
    denied.mkdir()
    store = MemoryLocations([
        AuthorizedMemoryRoot("public", "workspace", allowed, "Public", writable=False),
        AuthorizedMemoryRoot("private", "secret", denied, "Hidden", readable=False, writable=True),
    ])
    context = MemoryContext("public", "workspace")
    catalog = store.catalog(context)
    assert "private-secret-location" not in json.dumps(catalog)
    assert catalog["errors"]
    target = next(item for item in catalog["destinations"] if item["memoryLocationId"] != NOWHERE)
    assert not target["capabilities"]["write"]
    with pytest.raises(PermissionError):
        store.save_record("shape", target["memoryLocationId"], {"uid": "shape-a"}, context)
    assert store.read_selected("shape", ["unknown-id"], context)["errors"]


def test_populated_other_provider_context_is_browsable_not_implicitly_effective(tmp_path):
    one, context = store_at(tmp_path / "one")
    two, remote = store_at(tmp_path / "two", provider="remote", workspace="remote-workspace")
    target = destination(two, remote, "shape", "run")
    two.save_record("shape", target, {"uid": "shape-a"}, remote)
    combined = MemoryLocations([*one.roots, *two.roots])
    catalog = combined.catalog(context)
    assert any(item["memoryLocationId"] == target for item in catalog["locations"])
    assert target not in catalog["effective"]["shape"]
    assert combined.read_selected("shape", [target], context)["records"]


def test_actual_legacy_shape_and_identity_journal_read_without_execution(tmp_path):
    store, context = store_at(tmp_path)
    shape_dir = tmp_path / "existing" / "shape_dir"
    identity_dir = tmp_path / "existing" / "identity_dir" / "game-a"
    shape_dir.mkdir(parents=True)
    identity_dir.mkdir(parents=True)
    shape_path = shape_dir / "shapes.pl"
    shape_path.write_text(":- dynamic shape/3.\nshape('key-a','triangle','{\"commands\":[]}').\n", encoding="utf-8")
    facts = (
        "created(123).\nassert(known_object(triangle,first,first,1)).\n"
        "retract(known_object(triangle,first,first,1)).\n"
        "assert(known_object(triangle,first,last,2)).\n"
        "assert(known_variation(triangle,red,3,1)).\n"
        "assert(known_placement(run_a,instance_a,gobj_triangle,'1,2,key-a;2,2,key-b',2)).\n"
    )
    (identity_dir / "identities.db.pl").write_text(facts, encoding="utf-8")
    catalog = store.catalog(context)
    shape = next(item for item in catalog["locations"] if item["format"] == "legacy_shape")
    obj = next(item for item in catalog["locations"] if item["format"] == "legacy_object")
    assert shape["counts"]["shape"] == obj["counts"]["object"] == 1
    assert not obj["capabilities"]["write"]
    record = store.read_selected("object", [obj["memoryLocationId"]], context)["records"][0]["preferred"]
    assert record["payload"]["legacyShapeReferences"] == ["key-a", "key-b"]
    assert len(record["payload"]["history"]) >= 3
    assert record["payload"]["seen"] == 2
    assert record["payload"]["variations"] == [{"color": "red", "size": 3, "seen": 1}]
    parsed_shape = store.read_selected("shape", [shape["memoryLocationId"]], context)["records"][0]["preferred"]["payload"]
    assert parsed_shape["shapeKey"] == "key-a" and parsed_shape["turtle"] == {"commands": []}
    assert shape_path.read_text(encoding="utf-8").startswith(":- dynamic")


def test_invalid_legacy_data_is_error_not_empty_success(tmp_path):
    store, context = store_at(tmp_path)
    path = tmp_path / "shape_dir"
    path.mkdir()
    (path / "shapes.pl").write_text("malicious(do_something).\n", encoding="utf-8")
    catalog = store.catalog(context)
    assert catalog["errors"]
    assert len(catalog["locations"]) == 1


def test_real_core_checkpoint_records_preserve_versions_and_run_scopes(tmp_path):
    store, context = store_at(tmp_path)
    directory = tmp_path / "runtime" / "object-checkpoints"
    directory.mkdir(parents=True)
    for index, sequence in enumerate(("run-a", "run-b", "run-a")):
        (directory / f"checkpoint-{index}.json").write_text(json.dumps({
            "sequenceId": sequence, "objects": [
                {"uid": "object-same-name", "memberTrackUids": ["a", "b"], "compositionHistory": [{"revision": index}]},
            ],
        }), encoding="utf-8")
    catalog = store.catalog(context)
    scopes = [item for item in catalog["locations"] if item["format"] == "checkpoint"]
    assert {item["context"]["runId"] for item in scopes} == {"run-a", "run-b"}
    assert len(catalog["effective"]["object"]) == 1
    records = store.read_selected("object", [item["memoryLocationId"] for item in scopes], context)["records"]
    assert len(records) == 2
    assert sorted(len(record["versions"]) for record in records) == [1, 2]


def test_record_and_location_ids_stable_across_replay_revision_changes(tmp_path):
    store, context = store_at(tmp_path)
    target = destination(store, context, "shape", "run")
    payload = {"uid": "anchor-a", "shapeKey": "same", "points": [[0, 0]]}
    store.save_record("shape", target, payload, context)
    first = store.catalog(context)
    store.save_record("shape", target, payload, context)
    assert store.catalog(context) == first
    store.save_record("shape", target, {**payload, "points": [[1, 0]]}, context)
    second = store.catalog(context)
    assert target in {item["memoryLocationId"] for item in second["locations"]}
    assert first["revision"] != second["revision"]


def test_preferences_never_serialize_injected_volatile_records(tmp_path):
    store, context = store_at(tmp_path)
    prefs = store.load_preferences(context)
    with pytest.raises(ValueError, match="schema"):
        store.save_preferences(context, {**prefs, "volatileRecords": [{"private": "value"}]}, expected_revision=prefs["revision"])
    assert not list((tmp_path / "runtime").rglob("*.json")) if (tmp_path / "runtime").exists() else True


def test_symlink_escape_is_not_read_or_writable(tmp_path):
    root = tmp_path / "workspace"
    outside = tmp_path / "outside"
    root.mkdir()
    outside.mkdir()
    try:
        (root / "shape_dir").symlink_to(outside, target_is_directory=True)
    except OSError:
        pytest.skip("symlink privileges unavailable")
    (outside / "shapes.pl").write_text("shape(key,name,turtle).\n", encoding="utf-8")
    store, context = store_at(root)
    assert len(store.catalog(context)["locations"]) == 1


def test_explicit_path_escape_rejected_before_read_or_write(tmp_path):
    store, _ = store_at(tmp_path / "workspace")
    with pytest.raises(PermissionError, match="escapes"):
        store._safe(store.roots[0], tmp_path / "private" / "memory")


def test_saved_reference_revision_round_trips_and_copy_retains_provenance(tmp_path):
    store, context = store_at(tmp_path)
    original = store.save_record("shape", destination(store, context, "shape", "run"),
                                 {"uid": "anchor-a", "points": [[0, 0]]}, context)
    loaded = store.read_selected("shape", [original["source"]["memoryLocationId"]], context)["records"][0]["preferred"]
    assert original["recordUid"] == loaded["recordUid"]
    assert original["revision"] == loaded["revision"]
    copied = store.save_copy(original, destination(store, context, "shape", "global"), context)
    recopied = store.save_copy(copied, destination(store, context, "shape", "game"), context)
    assert recopied["origin"]["previousOrigin"]["recordUid"] == original["recordUid"]


def test_preference_cas_serializes_concurrent_writers(tmp_path):
    store, context = store_at(tmp_path)
    previous = store.load_preferences(context)
    changed = {**previous, "expanded": True}
    def write():
        try:
            return store.save_preferences(context, changed, expected_revision=previous["revision"])["revision"]
        except ValueError:
            return "conflict"
    with ThreadPoolExecutor(max_workers=2) as executor:
        results = list(executor.map(lambda _: write(), range(2)))
    assert results.count("conflict") == 1
    assert store.load_preferences(context)["expanded"]


def test_scoped_provider_mount_does_not_grant_other_games_or_global_writes(tmp_path):
    tmp_path.mkdir(exist_ok=True)
    store = MemoryLocations([AuthorizedMemoryRoot("local", "workbench", tmp_path, "Game-only", writable=True, game_id="game-a")])
    allowed = MemoryContext("local", "workbench", "game-a", "level", "run")
    assert all(item["scopeKind"] != "global" for item in store.catalog(allowed)["destinations"])
    denied = MemoryContext("local", "workbench", "game-b")
    assert [item["memoryLocationId"] for item in store.catalog(denied)["destinations"]] == [NOWHERE]
    with pytest.raises(PermissionError, match="preference root"):
        store.load_preferences(denied)


def test_empty_destination_capability_changes_are_in_catalog_revision(tmp_path):
    writable, context = store_at(tmp_path)
    readonly, _ = store_at(tmp_path, writable=False)
    assert writable.catalog(context)["revision"] != readonly.catalog(context)["revision"]


def test_corrupted_record_revision_is_visible_and_never_loaded_as_success(tmp_path):
    store, context = store_at(tmp_path)
    target = destination(store, context, "shape", "run")
    store.save_record("shape", target, {"uid": "shape-a"}, context)
    file = next(tmp_path.rglob("*.memory.json"))
    data = json.loads(file.read_text(encoding="utf-8"))
    data["payload"]["uid"] = "changed-under-same-revision"
    file.write_text(json.dumps(data), encoding="utf-8")
    assert "integrity" in store.catalog(context)["errors"][0]["message"]
    assert not store.read_selected("shape", [target], context)["records"]


@pytest.mark.parametrize("section", [None, [], {}, {"saveTo": "C:\\private", "lookIn": [], "recentLookIn": []}])
def test_preferences_reject_malformed_sections_and_raw_paths(tmp_path, section):
    store, context = store_at(tmp_path)
    previous = store.load_preferences(context)
    with pytest.raises(ValueError):
        store.save_preferences(context, {**previous, "shape": section}, expected_revision=previous["revision"])


def test_core_shape_anchor_and_saved_copy_share_concept_but_keep_source_badges(tmp_path):
    store, context = store_at(tmp_path)
    directory = tmp_path / "runtime" / "grouping-checkpoints"
    directory.mkdir(parents=True)
    anchor = {"uid": "anchor-a", "kind": "shape_point_anchor", "shapeKey": "immutable-a", "canonicalPoints": [[0, 0]]}
    (directory / "checkpoint.json").write_text(json.dumps({
        "sequenceId": "run-a", "anchors": [anchor], "prototypes": [],
    }), encoding="utf-8")
    native = next(item["memoryLocationId"] for item in store.catalog(context)["locations"] if item["format"] == "checkpoint")
    target = destination(store, context, "shape", "run")
    store.save_record("shape", target, anchor, context)
    concepts = store.read_selected("shape", [native, target], context)["records"]
    assert len(concepts) == 1
    assert len(concepts[0]["sources"]) == 2
    assert not concepts[0]["conflict"]


def test_legacy_object_copy_is_not_mislabeled_as_inferred_multi_group_object(tmp_path):
    store, context = store_at(tmp_path)
    payload = {"uid": "legacy-a", "legacyKey": "shape-key", "facts": [], "history": []}
    saved = store.save_record("object", destination(store, context, "object", "run"), payload, context)
    assert saved["recordType"] == "legacy_known_object"
    with pytest.raises(ValueError, match="at least two"):
        store.save_record("object", destination(store, context, "object", "run"),
                          {"uid": "object-a", "memberTrackUids": ["only-one"]}, context)


def test_nowhere_uses_contextual_concept_identity_but_does_not_persist_records(tmp_path):
    store, context = store_at(tmp_path)
    volatile = VolatileMemory()
    anchor = {"uid": "anchor-a", "kind": "shape_point_anchor", "shapeKey": "immutable-a"}
    transient = store.save_record("shape", NOWHERE, anchor, context, volatile=volatile)
    target = destination(store, context, "shape", "run")
    persisted = store.save_record("shape", target, anchor, context)
    assert transient["conceptUid"] == persisted["conceptUid"]
    merged = store.read_selected("shape", [NOWHERE, target], context, volatile=volatile)["records"]
    assert len(merged) == 1 and len(merged[0]["sources"]) == 2
    volatile.reset()
    assert len(store.read_selected("shape", [NOWHERE, target], context, volatile=volatile)["records"][0]["sources"]) == 1


@pytest.mark.parametrize("identifier", [".", ".."])
def test_relative_scope_components_are_rejected(identifier):
    with pytest.raises(ValueError, match="relative path"):
        MemoryContext("local", "workspace", game_id=identifier)


def test_request_local_volatile_stores_can_share_browser_owned_namespace(tmp_path):
    first = VolatileMemory(session_id="browser-page-a")
    second = VolatileMemory(session_id="browser-page-a")
    payload = {"uid": "shape-a", "confidence": 1.0}
    assert first.put("shape", payload) == second.put("shape", payload)
    assert not list(tmp_path.iterdir())
    first.reset()
    assert first.session_id != "browser-page-a" and first.records("shape") == []
    with pytest.raises(ValueError, match="session ID"):
        VolatileMemory(session_id="")


def test_opaque_wire_preserves_float_revisions_cross_kind_references_and_origins(tmp_path):
    memory, context = store_at(tmp_path)
    volatile = VolatileMemory(session_id="browser-page-a")
    shape = memory.save_record("shape", NOWHERE, {"uid": "shape-a", "confidence": 1.0}, context, volatile=volatile)
    reference = {
        "providerRef": context.provider_ref, "workspaceId": context.workspace_id,
        "memoryLocationId": NOWHERE, "recordUid": shape["recordUid"], "revision": shape["revision"],
    }
    obj = memory.save_record(
        "object", NOWHERE,
        {"uid": "object-a", "shapeReferences": [reference], "confidence": 1.0, "memberTrackUids": ["track-a", "track-b"]},
        context, volatile=volatile, origin={"source": "explicit-session-copy"},
    )
    wire = volatile.to_wire()
    transported = json.loads(json.dumps({"wire": wire}))["wire"]
    restored = VolatileMemory.from_wire(transported, session_id="browser-page-a")
    assert restored.records("shape") == [shape]
    assert restored.records("object") == [obj]
    assert restored.records("object")[0]["payload"]["shapeReferences"][0]["recordUid"] == restored.records("shape")[0]["recordUid"]
    assert type(restored.records("shape")[0]["payload"]["confidence"]) is float
    assert restored.to_wire() == wire
    assert not list(tmp_path.iterdir())


def test_volatile_wire_rejects_stale_sessions_tampering_and_unsealed_rows():
    memory = VolatileMemory(session_id="browser-page-a")
    memory.put("shape", {"uid": "shape-a"})
    wire = memory.to_wire()
    with pytest.raises(ValueError, match="another browser session"):
        VolatileMemory.from_wire(wire, session_id="browser-page-b")
    changed = json.loads(wire)
    changed["records"][0]["payload"]["uid"] = "tampered"
    with pytest.raises(ValueError, match="hash mismatch"):
        VolatileMemory.from_wire(json.dumps(changed), session_id="browser-page-a")
    with pytest.raises(ValueError, match="opaque string"):
        VolatileMemory.from_wire(changed, session_id="browser-page-a")


def test_browser_snapshot_contains_request_local_continuity_and_is_workspace_bound(tmp_path):
    from omega_vision.perception.memory_locations import BrowserMemory
    browser = BrowserMemory("workspace-a", "browser-session-a")
    record = browser.memory.put("shape", {"uid": "shape-a", "confidence": 1.0})
    result = {"checkpoint": {"objects": [{"uid": "object-a", "confidence": 1.0}]}}
    digest = browser.put_output("sequence-a", "frame-a", "objects/test", result)
    wire = browser.to_wire()
    restored = BrowserMemory("workspace-a", "browser-session-a", wire)
    assert restored.memory.records("shape") == [record]
    assert restored.outputs[restored.output_key("sequence-a", "frame-a", "objects/test")]["resultHash"] == digest
    assert restored.to_wire() == wire
    assert not BrowserMemory("workspace-a", "browser-session-a").outputs
    for workspace, session in [("workspace-b", "browser-session-a"), ("workspace-a", "browser-session-b")]:
        with pytest.raises(ValueError, match="another workspace or page"):
            BrowserMemory(workspace, session, wire)
    with pytest.raises(ValueError, match="16 MiB"):
        BrowserMemory("workspace-a", "browser-session-a", "x" * (16 * 1024 * 1024 + 1))
    assert not list(tmp_path.iterdir())
