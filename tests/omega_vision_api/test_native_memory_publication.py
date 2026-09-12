from copy import deepcopy
from dataclasses import replace
import json
from pathlib import Path

from fastapi import FastAPI, HTTPException
from fastapi.testclient import TestClient
import pytest

from omega_vision.perception.contextual_memory import ContextualMemory, ContextUnavailable, recording_context
from omega_vision.perception.contextual_rules import ContextualRuleStore
from omega_vision.perception.candidate_rules import PromotionGates
from omega_vision.perception.metta_memory import MeTTaMemoryDatabase
from omega_vision.perception.observation_identity import content_hash
from omega_vision.services import native_memory_publication as publication
from omega_vision.services import video_import_api as api

PREFIX = "/workbench/memory/publications"


def snapshot(root):
    return {path.relative_to(root).as_posix(): (path.read_bytes(), path.stat().st_mtime_ns)
            for path in root.rglob("*") if path.is_file()}


def recording(home, name="recording-a"):
    directory = home / "recordings" / "game" / name
    moves = []
    for index in range(4):
        (directory / str(index)).mkdir(parents=True)
        moves.append({"directory": f"data/recordings/game/{name}/{index}", "level": "1"})
    (directory / "recording.json").write_text(json.dumps({"game_id": "game", "moves": moves}), encoding="utf-8")
    return directory


@pytest.fixture
def service(tmp_path, monkeypatch):
    for name in ("first", "second"):
        (tmp_path / "workspaces" / name).mkdir(parents=True)
    def workspace(name):
        if name not in {"first", "second"}:
            raise HTTPException(404, "Unknown workspace")
        return tmp_path / "workspaces" / name
    monkeypatch.setattr(api, "_workspace_root", workspace)
    home = tmp_path / "data" / "omega_vision"
    directory = recording(home)
    contexts = [recording_context(home, directory, str(index)) for index in range(4)]
    store = ContextualMemory(home, "first")
    shape = store.save(contexts[0].stm_area(), "shape", {"uid": "shape-a", "value": [1, "1", False, None]},
                       context=contexts[0])
    store.save(contexts[1].stm_area(), "shape", {"uid": "shape-b"}, context=contexts[1])
    store.save(contexts[3].stm_area(), "shape", {"uid": "future-shape"}, context=contexts[3])
    reference = {key: shape["source"][key] for key in ("providerRef", "workspaceId", "memoryLocationId", "registeredPath")}
    reference.update(recordUid=shape["recordUid"], revision=shape["revision"])
    obj = store.save(contexts[1].stm_area(), "object", {
        "uid": "object-a", "memberTrackUids": ["track-a", "track-b"], "shapeReferences": [reference],
    }, context=contexts[1])
    app = FastAPI()
    app.include_router(publication.router, prefix="/workbench")
    with TestClient(app) as client:
        yield tmp_path, home, client, contexts, shape, obj


def options(client, workspace="first"):
    response = client.get(PREFIX + "/options", params={
        "workspaceId": workspace, "sequenceId": "data/recordings/game/recording-a", "frameId": "2",
    })
    assert response.status_code == 200, response.text
    return response.json()


def request(client, kind="shape", *, scope="level"):
    value = options(client)
    source = next(item for item in value["sources"] if item["kind"] == kind)
    destination = next(item for item in value["destinations"] if item["kind"] == kind and item["scopeKind"] == scope)
    return {"workspaceId": "first", "sequenceId": "data/recordings/game/recording-a", "frameId": "2",
            "kind": kind, "sourceId": source["id"], "destinationId": destination["id"],
            "itemIds": [item["id"] for item in source["items"] if item["eligible"]],
            "approval": {"reviewer": "reviewer-a", "reason": "Explicitly retain these selected native versions"}}


def plan(client, body):
    response = client.post(PREFIX + "/plan", json=body)
    assert response.status_code == 200, response.text
    return response.json()


def commit(client, body, preview, **changes):
    return client.post(PREFIX + "/commit", json={
        **body, "confirmed": True, "confirmationKey": preview["confirmationKey"], **changes,
    })


def approved_rule(context):
    rules = ContextualRuleStore(context)
    candidate = rules.create({
        "body": [{"predicate": "present", "args": [{"var": "X"}]}],
        "head": {"predicate": "moved", "args": [{"var": "X"}]},
    }, kind="event_detector", scope={"domain": "test"}, source="authored",
        provenance={"code_hash": "fixture"}, inducer_version="test-v1")
    for index in (1, 2):
        rules.record_evidence(candidate["candidate_id"], {
            "sequence_id": f"independent-{index}", "sequence_fingerprint": f"content-{index}",
            "pair_id": f"pair-{index}", "before_hash": f"before-{index}", "after_hash": f"after-{index}",
            "partition": "held_out", "outcome": "support", "assessment": "changed",
            "comparison_complete": True, "confidence": .95, "event_ids": [f"event-{index}"],
            "evidence_refs": [f"measured-evidence-{index}"], "source": "deterministic_replay",
            "evaluator_id": "fixture", "evaluator_version": "1", "depends_on_candidates": [],
        })
    candidate = rules.promote(candidate["candidate_id"], gates=PromotionGates())
    return rules, candidate


@pytest.mark.parametrize("kind,scope", [("shape", "level"), ("object", "level"), ("shape", "game")])
def test_explicit_atomic_publication_retains_typed_records_history_and_workspace_identity(service, kind, scope):
    root, home, client, contexts, shape, obj = service
    before_options = snapshot(root)
    body = request(client, kind, scope=scope)
    preview = plan(client, body)
    assert snapshot(root) == before_options
    assert preview["activation"] == "none" and preview["ruleAcceptance"] == "unchanged"
    before_source = snapshot(contexts[0].directory)
    result = commit(client, body, preview, workspaceId="second")
    assert result.status_code == 200, result.text
    assert result.json()["status"] == "published"
    assert snapshot(contexts[0].directory) == before_source
    area = contexts[2].ltm_area() if scope == "level" else contexts[2].game_area()
    store = ContextualMemory(home, "second")
    records, descriptor = store.read(area, kind)
    assert descriptor["memoryLocationId"] == body["destinationId"]
    original = shape if kind == "shape" else obj
    record = next(item for item in records if item["conceptUid"] == original["conceptUid"])
    assert record["payload"] == original["payload"]
    assert record["causal"] == original["causal"] and record["revision"] == original["revision"]
    assert record["recordUid"] != original["recordUid"]
    assert record["publication"]["sourceRecordUid"] == original["recordUid"]
    assert record["publication"]["cutoff"] == contexts[2].causal
    assert record["publication"]["confirmationKey"] == preview["confirmationKey"]
    assert {item["recordUid"] for item in ContextualMemory(home, "first").read(area, kind)[0]} == {
        item["recordUid"] for item in records}
    after = snapshot(root)
    repeated = commit(client, body, preview)
    assert repeated.status_code == 200, repeated.text
    assert repeated.json()["status"] == "already_published" and snapshot(root) == after
    assert not (home / "workspaces").exists()
    assert not (root / "workspaces" / "first" / "data").exists()
    assert not list(home.glob("**/memory-settings/*"))


def test_publication_cutoff_is_additional_to_original_observation_cutoff(service):
    _, home, client, contexts, *_ = service
    body = request(client)
    response = commit(client, body, plan(client, body))
    assert response.status_code == 200, response.text
    store = ContextualMemory(home, "first")
    for current in contexts[:3]:
        assert store.read(contexts[2].ltm_area(), "shape", current)[0] == []
    assert len(store.read(contexts[2].ltm_area(), "shape", contexts[3])[0]) == 2
    other = recording_context(home, recording(home, "recording-b"), "3")
    with pytest.raises(ContextUnavailable, match="cross-recording"):
        store.read(contexts[2].ltm_area(), "shape", other)
    assert store.read(contexts[2].ltm_area(), "shape", contexts[3], before=1)[0] == []
    # The four existing resolver scopes still only read their existing STM areas.
    assert all(item["payload"]["uid"] != "future-shape" for item in store.read(contexts[2].ltm_area(), "shape")[0])


@pytest.mark.parametrize("change", [
    {"confirmed": False}, {"confirmationKey": "0" * 64}, {"workspaceId": "unknown"},
    {"sourceId": "memory-nowhere"}, {"sourceId": "session:nowhere"},
    {"destinationId": "not-an-authorized-area"}, {"sourceId": "C:\\external\\memory"},
    {"nativeState": {"secret": "not allowed"}}, {"memorySnapshot": {"secret": "not allowed"}},
])
def test_unauthorized_unconfirmed_or_payload_requests_never_write(service, change):
    root, _, client, *_ = service
    body = request(client)
    preview = plan(client, body)
    before = snapshot(root)
    response = commit(client, body, preview, **change)
    assert response.status_code in {403, 404, 409, 422}, response.text
    assert snapshot(root) == before


@pytest.mark.parametrize("which", ["source", "destination", "manifest", "reference"])
def test_changed_plan_inputs_are_rejected_without_writes(service, which):
    root, home, client, contexts, *_ = service
    body = request(client, "object" if which == "reference" else "shape")
    preview = plan(client, body)
    store = ContextualMemory(home, "first")
    if which == "manifest":
        manifest = contexts[0].directory / "recording.json"
        manifest.write_text(manifest.read_text() + "\n", encoding="utf-8")
    else:
        area = contexts[0].ltm_area() if which == "destination" else contexts[0].stm_area()
        store.save(area, "shape", {"uid": "additional-version"}, context=contexts[0])
    before = snapshot(root)
    response = commit(client, body, preview)
    assert response.status_code == 409, response.text
    assert snapshot(root) == before


def test_future_item_or_future_reference_is_ineligible(service):
    root, home, client, contexts, *_ = service
    data = options(client)
    source = next(item for item in data["sources"] if item["kind"] == "shape")
    future = next(item for item in source["items"] if not item["eligible"])
    body = request(client)
    before = snapshot(root)
    response = client.post(PREFIX + "/plan", json={**body, "itemIds": [future["id"]]})
    assert response.status_code == 409 and snapshot(root) == before
    record = ContextualMemory(home, "first").read(contexts[0].stm_area(), "shape")[0][-1]
    ref = {key: record["source"][key] for key in ("providerRef", "memoryLocationId", "registeredPath")}
    ref.update(recordUid=record["recordUid"], revision=record["revision"])
    ContextualMemory(home, "first").save(contexts[0].stm_area(), "object", {
        "uid": "bad-future-object", "shapeReferences": [ref],
    }, context=contexts[0])
    data = options(client)
    source = next(item for item in data["sources"] if item["kind"] == "object")
    assert sum(item["eligible"] for item in source["items"]) == 1


def test_existing_approved_rule_is_copied_without_acceptance_or_confidence_changes(service, monkeypatch):
    root, home, client, contexts, *_ = service
    rules, candidate = approved_rule(contexts[0])
    body = request(client, "deduction")
    preview = plan(client, body)
    assert preview["items"][0]["proof"]["confidence"] == .95
    before_source = snapshot(contexts[0].directory)
    monkeypatch.setattr(ContextualRuleStore, "promote", lambda *a, **k: pytest.fail("Publication cannot approve a rule"))
    monkeypatch.setattr(ContextualRuleStore, "evaluate", lambda *a, **k: pytest.fail("Read-only gates cannot append evaluations"))
    response = commit(client, body, preview)
    assert response.status_code == 200, response.text
    assert snapshot(contexts[0].directory) == before_source
    assert rules.get(candidate["candidate_id"]) == candidate
    target = MeTTaMemoryDatabase(home, contexts[2].ltm_area(), "deduction").read()
    assert len(target) == 1 and target[0]["entryType"] == "accepted_rule_reference"
    assert target[0]["candidateId"] == candidate["candidate_id"]
    assert target[0]["candidateVersion"] == candidate["version"]
    assert "rule" not in target[0] and target[0]["publication"]["activation"] == "none"
    other = recording_context(home, recording(home, "another"), "3")
    assert ContextualRuleStore(other).published_candidates() == []


def test_later_rule_rejection_does_not_allow_backdated_publication(service):
    root, _, client, contexts, *_ = service
    _, candidate = approved_rule(contexts[0])
    body = request(client, "deduction")
    preview = plan(client, body)
    ContextualRuleStore(contexts[3], origin=contexts[0]).reject(
        candidate["candidate_id"], reason="Independent counterexample", provenance={"reviewer": "test"})
    before = snapshot(root)
    response = commit(client, body, preview)
    assert response.status_code == 409, response.text
    assert snapshot(root) == before
    data = options(client)
    assert next(item for item in data["sources"] if item["kind"] == "deduction")["eligibleCount"] == 0


def test_conflicting_target_identity_is_an_error_not_a_merge(service):
    root, home, client, contexts, *_ = service
    body = request(client)
    preview = plan(client, body)
    assert commit(client, body, preview).status_code == 200
    database = MeTTaMemoryDatabase(home, contexts[2].ltm_area(), "shape")
    entry = deepcopy(database.read()[0])
    entry["record"]["payload"]["different"] = True
    # A valid outer MeTTa seal cannot excuse an internally conflicting record identity.
    from omega_vision.perception.metta_memory import _metta
    entry.pop("entryUid")
    entry["entryUid"] = content_hash(entry)
    database.path.write_text(_metta(entry) + "\n", encoding="utf-8")
    before = snapshot(root)
    response = commit(client, body, preview)
    assert response.status_code == 409, response.text
    assert snapshot(root) == before


@pytest.mark.parametrize("target", ["source", "destination", "lock"])
def test_redirected_canonical_paths_are_rejected(service, monkeypatch, target):
    root, home, client, contexts, *_ = service
    body = request(client)
    preview = plan(client, body)
    from omega_vision import inherited_source_overlay as storage
    original = storage.resolve_storage_path
    redirected = {"source": contexts[0].stm_area(), "destination": contexts[2].ltm_area(),
                  "lock": home / "runtime" / "memory-tree-locks" / ".writer.lock"}[target]
    def redirect(path):
        resolved = original(path)
        if resolved == redirected or resolved.is_relative_to(redirected):
            return home / "recordings" / "another-game" / "redirected" / resolved.relative_to(redirected)
        return resolved
    monkeypatch.setattr(storage, "resolve_storage_path", redirect)
    before = snapshot(root)
    response = commit(client, body, preview)
    assert response.status_code in {403, 409}, response.text
    assert snapshot(root) == before


def test_native_batch_serialization_failure_cannot_partially_append(service):
    _, home, _, contexts, *_ = service
    database = MeTTaMemoryDatabase(home, contexts[2].ltm_area(), "shape")
    before = snapshot(home)
    with pytest.raises((TypeError, ValueError)):
        database.append_batch([{"entryType": "fixture"}, {"entryType": "invalid", "value": object()}])
    assert snapshot(home) == before


def test_read_only_provider_cannot_plan_or_commit(service, monkeypatch):
    root, home, client, *_ = service
    body = request(client)
    preview = plan(client, body)
    allowed = publication._store
    def denied(workspace):
        store = allowed(workspace)
        return ContextualMemory(home, workspace, mount=replace(store.mount, writable=False))
    monkeypatch.setattr(publication, "_store", denied)
    before = snapshot(root)
    assert client.post(PREFIX + "/plan", json=body).status_code == 403
    assert commit(client, body, preview).status_code == 403
    assert snapshot(root) == before


@pytest.mark.parametrize("kind", ["observation", "hypothesis", "induction", "induced", "shape_group", {"invalid": True}])
def test_unsupported_kinds_cannot_be_relabelled_as_objects(service, kind):
    root, _, client, *_ = service
    body = request(client)
    before = snapshot(root)
    response = client.post(PREFIX + "/plan", json={**body, "kind": kind})
    assert response.status_code == 422, response.text
    assert snapshot(root) == before


@pytest.mark.parametrize("sequence_id", [
    "memory-nowhere", "data/omega_vision/workspaces/first/recording",
    "curated/example", "recordings/game/../recording-a", "C:\\external\\recording",
])
def test_no_unregistered_sequence_or_workspace_storage_fallback(service, sequence_id):
    root, _, client, *_ = service
    body = request(client)
    before = snapshot(root)
    response = client.post(PREFIX + "/plan", json={**body, "sequenceId": sequence_id})
    assert response.status_code in {403, 409, 422}, response.text
    assert snapshot(root) == before


def test_external_data_root_configuration_is_not_a_fallback(service, monkeypatch):
    root, _, client, *_ = service
    body = request(client)
    monkeypatch.setenv("OMEGA_VISION_DATA", str(root / "outside"))
    before = snapshot(root)
    response = client.post(PREFIX + "/plan", json=body)
    assert response.status_code == 409, response.text
    assert snapshot(root) == before


def test_unapproved_rule_reference_never_bypasses_independent_evidence_gates(service):
    root, home, client, contexts, *_ = service
    rules = ContextualRuleStore(contexts[0])
    candidate = rules.create({
        "body": [{"predicate": "present", "args": [{"var": "X"}]}],
        "head": {"predicate": "moved", "args": [{"var": "X"}]},
    }, kind="event_detector", scope={"domain": "test"}, source="authored",
        provenance={"code_hash": "unevaluated-fixture"}, inducer_version="test-v1")
    fake = MeTTaMemoryDatabase(home, contexts[0].stm_area(), "deduction").append({
        "entryType": "accepted_rule_reference", "candidateId": candidate["candidate_id"],
        "candidateVersion": candidate["version"], "evaluationId": "not-approved",
        "origin": {"providerRef": "filesystem:omega_vision", "sequenceId": contexts[0].sequence_id,
                   "frameId": "0", "path": "data/" + rules.journal.database.path.relative_to(home).as_posix()},
        "generatedAt": contexts[0].causal, "promotedAt": contexts[0].causal,
        "activation": "requires_current_candidate_status_promoted_and_causal_cutoff",
    })
    body = request(client, "deduction")
    before = snapshot(root)
    response = client.post(PREFIX + "/plan", json={**body, "itemIds": [fake["entryUid"]]})
    assert response.status_code == 409, response.text
    assert snapshot(root) == before and rules.get(candidate["candidate_id"])["status"] == "proposed"


@pytest.mark.parametrize("outside", [False, True])
def test_real_junction_or_symlink_destination_cannot_redirect_a_plan(service, outside):
    import os
    import subprocess
    root, home, client, contexts, *_ = service
    body = request(client)
    target = root / "outside-omega" if outside else home / "recordings" / "another-game" / "memory_level_1_ltm"
    target.mkdir(parents=True)
    link = contexts[2].ltm_area()
    if os.name == "nt":
        result = subprocess.run([
            "powershell", "-NoProfile", "-NonInteractive", "-Command",
            f"New-Item -ItemType Junction -Path '{str(link).replace(chr(39), chr(39)*2)}' "
            f"-Target '{str(target).replace(chr(39), chr(39)*2)}' | Out-Null",
        ], capture_output=True, text=True)
        assert result.returncode == 0, result.stderr
    else:
        link.symlink_to(target, target_is_directory=True)
    try:
        before_target = snapshot(target)
        response = client.post(PREFIX + "/plan", json=body)
        assert response.status_code in {403, 409}, response.text
        assert snapshot(target) == before_target and not list(target.iterdir())
    finally:
        if os.name == "nt":
            link.rmdir()
        else:
            link.unlink()


def test_foreign_level_target_and_omitted_confirmation_are_rejected(service):
    root, home, client, contexts, *_ = service
    body = request(client)
    preview = plan(client, body)
    other_level = replace(contexts[2], current=replace(contexts[2].current, level_id="2"))
    foreign_id = ContextualMemory(home, "first").descriptor(other_level.ltm_area(), "shape", other_level)["memoryLocationId"]
    before = snapshot(root)
    assert client.post(PREFIX + "/commit", json={**body, "confirmationKey": preview["confirmationKey"]}).status_code == 422
    assert client.post(PREFIX + "/plan", json={**body, "destinationId": foreign_id}).status_code == 403
    assert snapshot(root) == before


def test_route_is_registered_without_a_transform_or_automatic_runner():
    from omega_vision.services import registry_api
    app = FastAPI()
    app.include_router(registry_api.router)
    routes = set(app.openapi()["paths"])
    assert {"/memory/publications/options", "/memory/publications/plan", "/memory/publications/commit"} <= routes
    assert all(getattr(runner, "__module__", "") != publication.__name__ for runner in api._SEQUENCE_TRANSFORMS.values())


def test_concurrent_confirmations_publish_one_atomic_native_batch(service):
    from concurrent.futures import ThreadPoolExecutor
    _, home, client, contexts, *_ = service
    body = request(client)
    preview = plan(client, body)
    before = snapshot(contexts[0].directory)
    with ThreadPoolExecutor(max_workers=2) as executor:
        responses = list(executor.map(lambda _: commit(client, body, preview), range(2)))
    assert all(response.status_code == 200 for response in responses), [response.text for response in responses]
    assert sorted(response.json()["status"] for response in responses) == ["already_published", "published"]
    target = MeTTaMemoryDatabase(home, contexts[2].ltm_area(), "shape").read()
    assert len(target) == 2 and snapshot(contexts[0].directory) == before


def test_unrelated_unsupported_observation_payload_is_never_opened(service, monkeypatch):
    root, _, client, contexts, *_ = service
    path = contexts[0].stm_area() / "visual_observations.metta"
    path.write_bytes(b"opaque historical observer state; do not parse or copy")
    before = snapshot(root)
    original_bytes, original_text = Path.read_bytes, Path.read_text
    def read_bytes(current):
        assert current != path, "Publication must not load an unsupported observation payload"
        return original_bytes(current)
    def read_text(current, *args, **kwargs):
        assert current != path, "Publication must not load an unsupported observation payload"
        return original_text(current, *args, **kwargs)
    with monkeypatch.context() as guarded:
        guarded.setattr(Path, "read_bytes", read_bytes)
        guarded.setattr(Path, "read_text", read_text)
        body = request(client)
        preview = plan(client, body)
    assert preview["activation"] == "none" and snapshot(root) == before


def test_nested_object_observations_and_later_published_references_cannot_be_backdated(service):
    _, home, client, contexts, *_ = service
    body = request(client)
    assert commit(client, body, plan(client, body)).status_code == 200
    store = ContextualMemory(home, "first")
    published = store.read(contexts[2].ltm_area(), "shape")[0][0]
    ref = {key: published["source"][key] for key in ("providerRef", "memoryLocationId", "registeredPath")}
    ref.update(recordUid=published["recordUid"], revision=published["revision"])
    store.save(contexts[0].stm_area(), "object", {
        "uid": "reference-before-publication", "shapeReferences": [ref],
    }, context=contexts[1])
    store.save(contexts[0].stm_area(), "object", {
        "uid": "nested-future-observation", "members": [{"lastObservedOrder": 3}],
    }, context=contexts[1])
    response = client.get(PREFIX + "/options", params={
        "workspaceId": "second", "sequenceId": contexts[0].sequence_id, "frameId": "3",
    })
    assert response.status_code == 200, response.text
    objects = next(item for item in response.json()["sources"] if item["kind"] == "object")
    assert objects["eligibleCount"] == 1
    assert len([item for item in objects["items"] if not item["eligible"]]) == 2


def test_existing_native_destination_text_is_preserved_byte_for_byte(service):
    _, home, client, contexts, *_ = service
    store = ContextualMemory(home, "first")
    store.save(contexts[0].ltm_area(), "shape", {"uid": "unrelated-history"}, context=contexts[0])
    database = MeTTaMemoryDatabase(home, contexts[0].ltm_area(), "shape")
    previous = database.path.read_bytes().replace(b"\n", b"\r\n") + b"; retained comment\r\n"
    database.path.write_bytes(previous)
    body = request(client)
    result = commit(client, body, plan(client, body))
    assert result.status_code == 200, result.text
    assert database.path.read_bytes().startswith(previous)
    assert len(store.read(contexts[0].ltm_area(), "shape")[0]) == 3
