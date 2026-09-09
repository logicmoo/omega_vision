import json
import time

import pytest
from fastapi import FastAPI, HTTPException
from fastapi.testclient import TestClient
from PIL import Image, ImageDraw

from omega_vision.services import video_import_api as api
from omega_vision.services import video_import_semantics as semantics
from omega_vision.services import transform_task_pooler as pooler


@pytest.fixture
def integrated(tmp_path, monkeypatch):
    monkeypatch.setattr(api, "_workspace_root", lambda _: tmp_path)
    monkeypatch.setattr(api, "_data_homes", lambda root: [root / "data" / "omega_vision"])
    monkeypatch.setattr(api, "_direct_jobs", {})
    monkeypatch.setattr(api, "_pooler_point_at", lambda *args: pytest.fail("Do not retarget the live pooler"))
    registry, metadata = dict(api._SEQUENCE_TRANSFORMS), dict(api._TRANSFORM_METADATA)
    assert tuple(semantics.LOG.split("/")) in registry
    assert metadata[tuple(semantics.LOG.split("/"))]["orderedOnly"]
    monkeypatch.setattr(api, "_SEQUENCE_TRANSFORMS", registry)
    monkeypatch.setattr(api, "_TRANSFORM_METADATA", metadata)
    app = FastAPI()
    app.include_router(api.router)
    return tmp_path, TestClient(app)


def sequence(root, name="seq", count=3, ordered=True):
    directory = root / "data" / "omega_vision" / "recordings" / name
    directory.mkdir(parents=True)
    if ordered:
        (directory / "recording.json").write_text(json.dumps({"game_id": "integration", "level": 1}))
    for index in range(count):
        path = directory / "image.png" if index == 0 else directory / str(index - 1) / "image.png"
        path.parent.mkdir(parents=True, exist_ok=True)
        image = Image.new("RGB", (48, 32), "black")
        ImageDraw.Draw(image).rectangle((4 + index, 5, 14 + index, 18), fill="red")
        image.save(path)
    return "data/recordings/" + name


def finish(client, job, expected="done"):
    deadline = time.monotonic() + 60
    while time.monotonic() < deadline:
        value = client.get(f"/video-import/direct-calls/{job['id']}", params={"workspaceId": "w"}).json()
        if value["state"] not in {"running", "starting"}:
            assert value["state"] == expected, value
            return value
        time.sleep(0.03)
    pytest.fail("Semantic execution did not finish")


def plan(client, sequence_id, stage=semantics.LOG, first_n=2, **extra):
    body = {"workspaceId": "w", "sequenceId": sequence_id, "firstN": first_n, "stageId": stage, **extra}
    response = client.post("/video-import/semantic/execution/plan", json=body)
    assert response.status_code == 200, response.text
    return body, response.json()


def commit(client, body, preview, *, run):
    response = client.post("/video-import/semantic/execution/commit", json={
        **body, "confirmed": True, "confirmationKey": preview["confirmationKey"], "run": run,
    })
    assert response.status_code == 200, response.text
    if "application/x-ndjson" in response.headers.get("content-type", ""):
        return json.loads(response.text.splitlines()[-1])
    return response.json()


def test_first_direct_plan_resolves_default_preferences_once_without_foreign_memory_scan(integrated, monkeypatch):
    from omega_vision.perception import memory_locations as memory
    root, client = integrated
    sequence_id = sequence(root, count=2)
    external = root / "unrelated-provider"
    external.mkdir()
    for index in range(8):
        frame = external / "recordings" / str(index) / "outputs"
        frame.mkdir(parents=True)
        (frame / "result.json").write_text("unrelated generated payload")
    mounts = [
        memory.AuthorizedMemoryRoot("filesystem:omega_vision", "omega_vision", root / "workspace", "Shared", writable=True),
        memory.AuthorizedMemoryRoot("external", "w", external, "External recordings"),
    ]
    mounts[0].root.mkdir()
    monkeypatch.setattr(semantics, "authorized_memory_roots", lambda _: mounts)
    discoveries = []
    discover = memory.MemoryLocations._discovered

    def counted(self, mount, **kwargs):
        assert mount.provider_ref == "filesystem:omega_vision", "Default planning must not traverse unrelated providers"
        discoveries.append(mount.root)
        yield from discover(self, mount, **kwargs)

    monkeypatch.setattr(memory.MemoryLocations, "_discovered", counted)
    monkeypatch.setattr(memory.MemoryLocations, "catalog",
                        lambda *args, **kwargs: pytest.fail("Planning must not enumerate memory counts/payloads"))
    response = client.post("/video-import/direct-calls", json={
        "workspaceId": "w", "sequenceId": sequence_id, "firstN": 2,
        "composite": semantics.LOG, "planOnly": True,
    })
    assert response.status_code == 200, response.text
    assert response.json()["steps"] and len(discoveries) == 1
    assert memory._DEFAULT_PREFERENCE_READS.get() is None
    assert not api._direct_jobs
    assert not list(root.rglob("todos.json")) and not list(root.rglob("*.memory.json"))
    assert not (mounts[0].root / "runtime").exists()
    assert not list(root.rglob("meta.json"))


def test_real_cv_objects_events_and_inspectable_sources(integrated):
    root, client = integrated
    sequence_id = sequence(root)
    body, preview = plan(client, sequence_id)
    assert preview["blockedReasons"] == []
    assert preview["frameCount"] == 2 and preview["pairCount"] == 1
    assert not list(root.rglob("meta.json")) and not list(root.rglob("todos.json"))
    job = finish(client, commit(client, body, preview, run=True))
    assert job["imageCount"] == 2
    assert not list(root.rglob("todos.json"))
    assert not (root / "data" / "omega_vision" / "recordings" / "seq" / "1" / "event_log_0").exists()
    response = client.get("/video-import/semantic/execution", params={
        "workspaceId": "w", "sequenceId": sequence_id, "firstN": 2,
    })
    assert response.status_code == 200, response.text
    state = response.json()
    assert response.headers["cache-control"] == "no-store"
    assert len(state["frames"]) == 2 and state["outputs"] and state["artifacts"]
    assert not state["errors"]
    assert all(output["status"] == "done" and output["error"] is None and output["staleReason"] is None
               for output in state["outputs"])
    assert any(entry["path"].endswith("checkpoint.json") for entry in state["artifacts"])
    units = api._sequence_execution_context(root, sequence_id, "w")[1]
    bundle = json.loads(semantics._artifact(units[0], semantics.IDENTITY, "observations.json").read_text())
    assert bundle["groups"]
    canonical = semantics._event_log(root, sequence_id).read()
    assert canonical["entries"][0]["assessment"] == "initial_observation"
    assert any(entry["kind"] == "transition_assessment" for entry in canonical["entries"])
    assert list((root / "data" / "omega_vision" / "runtime" / "temporal-checkpoints").glob("*.json"))


@pytest.mark.parametrize("legacy_metadata", [False, True])
def test_implementation_upgrade_refreshes_prefix_before_persistent_to_nowhere_rerun(
    integrated, monkeypatch, legacy_metadata,
):
    from omega_vision.perception import temporal_correspondence
    from omega_vision.perception.object_evidence import validate_object_result

    root, client = integrated
    sequence_id = sequence(root, count=2)
    epoch = [0]
    hashes = temporal_correspondence.implementation_hashes
    monkeypatch.setattr(temporal_correspondence, "implementation_hashes", lambda: {
        **hashes(), "pixels_to_regions_cv.py": f"producer-implementation-{epoch[0]}",
    })
    implementation = semantics._implementation_revision
    monkeypatch.setattr(semantics, "_implementation_revision", lambda stage: {
        **implementation(stage), **({"testProducerVersion": epoch[0]} if stage == semantics.PARTS else {}),
    })
    original_runtime = semantics.runtime_revision
    legacy = [legacy_metadata]
    monkeypatch.setattr(semantics, "runtime_revision", lambda unit, stage:
                        None if legacy[0] and stage in {semantics.PARTS, semantics.TEMPORAL}
                        else original_runtime(unit, stage))
    body, preview = plan(client, sequence_id, stage=semantics.LOG)
    finish(client, commit(client, body, preview, run=True))
    previous_log = semantics._event_log(root, sequence_id).read()
    units = api._sequence_execution_context(root, sequence_id, "w")[1]
    old_temporal = [semantics._result(unit, semantics.TEMPORAL)["checkpoint"] for unit in units]
    old_parts = [api._read_output_revision(semantics._artifact(unit, semantics.PARTS, "meta.json")) for unit in units]
    immutable = {path: path.read_bytes() for path in (root / "data" / "omega_vision" / "runtime" / "temporal-checkpoints").glob("*.json")}
    protected = units[0]["dir"] / "todos.json"
    protected.write_text('{"todos":[],"note":"must not change during direct execution"}')
    protected_bytes = protected.read_bytes()

    epoch[0] = 1
    legacy[0] = False
    locations, context = semantics._memory("w", sequence_id)
    preferences = locations.load_preferences(context)
    for kind in ("shape", "object"):
        preferences[kind]["saveTo"] = "memory-nowhere"
        preferences[kind]["lookIn"] = ["memory-nowhere"]
    locations.save_preferences(context, preferences, expected_revision=preferences["revision"])
    session_id = "00000000-0000-4000-8000-000000000055"
    body, preview = plan(client, sequence_id, stage=semantics.LOG,
                         memorySessionId=session_id, memorySnapshot=None)
    result = commit(client, body, preview, run=True)
    job = finish(client, result, expected="error")
    failures = [item for item in job["recent"] if item["status"] in {"error", "blocked"}]
    assert failures and all(item["step"] == semantics.LOG for item in failures), failures
    assert "explicit suffix supersession" in failures[0]["error"]
    for stage in (semantics.PARTS, semantics.TEMPORAL, semantics.OBJECTS, semantics.EVENTS):
        assert all(item["status"] == "written" for item in job["recent"] if item["step"] == stage)
    state = semantics.browser_memory({
        "workspaceId": "w", "memorySessionId": session_id, "memorySnapshot": result["memorySnapshot"],
    })
    for index, unit in enumerate(units):
        unit["_browserMemory"] = state
        current = semantics._result(unit, semantics.TEMPORAL)["checkpoint"]
        assert current["implementationHashes"] == temporal_correspondence.implementation_hashes()
        assert current["checkpointUid"] != old_temporal[index]["checkpointUid"]
        assert api._read_output_revision(semantics._artifact(unit, semantics.PARTS, "meta.json")) != old_parts[index]
        objects = semantics._result(unit, semantics.OBJECTS)
        validate_object_result(objects, expected_temporal_checkpoint_uid=current["checkpointUid"])
        if index:
            assert current["previousCheckpointUid"] == semantics._result(units[index - 1], semantics.TEMPORAL)["checkpoint"]["checkpointUid"]
    assert protected.read_bytes() == protected_bytes
    assert all(path.read_bytes() == value for path, value in immutable.items())
    assert semantics._event_log(root, sequence_id).read() == previous_log
    replayed = client.post("/video-import/semantic/events/replay", json={
        "workspaceId": "w", "sequenceId": sequence_id, "firstN": 2,
        "memorySessionId": session_id, "memorySnapshot": result["memorySnapshot"],
        "expectedGeneration": previous_log["generation"], "supersede": True,
    })
    assert replayed.status_code == 200, replayed.text
    assert replayed.json()["generation"] == previous_log["generation"] + 1
    assert semantics._event_log(root, sequence_id).read(generation=previous_log["generation"]) == previous_log


@pytest.mark.parametrize("nowhere", [False, True])
def test_repeated_direct_log_reuses_verified_prefix_without_truncating_canonical_tail(integrated, nowhere):
    root, client = integrated
    sequence_id = sequence(root, count=2)
    body, preview = plan(client, sequence_id, stage=semantics.LOG, first_n=2)
    first = finish(client, commit(client, body, preview, run=True))
    assert first["done"] == 16 and first["state"] == "done"
    log = semantics._event_log(root, sequence_id)
    canonical = log.read()
    history = {path: path.read_bytes() for path in log.path.glob("*.json")}
    extra = {}
    if nowhere:
        locations, context = semantics._memory("w", sequence_id)
        preferences = locations.load_preferences(context)
        for kind in ("shape", "object"):
            preferences[kind]["saveTo"] = "memory-nowhere"
            preferences[kind]["lookIn"] = ["memory-nowhere"]
        locations.save_preferences(context, preferences, expected_revision=preferences["revision"])
        extra = {"memorySessionId": "00000000-0000-4000-8000-000000000066", "memorySnapshot": None}
    body, preview = plan(client, sequence_id, stage=semantics.LOG, first_n=2, **extra)
    response = commit(client, body, preview, run=True)
    second = finish(client, response)
    assert second["done"] == 16
    assert all(item["status"] in {"written", "skipped"} for item in second["recent"])
    assert log.read() == canonical
    assert {path: path.read_bytes() for path in log.path.glob("*.json")} == history
    unit = api._sequence_execution_context(root, sequence_id, "w")[1][0]
    receipt = semantics._result(unit, semantics.LOG)
    assert receipt["entries"] == canonical["entries"] and receipt["inputs"] == canonical["inputs"]
    assert receipt["head_id"] == canonical["head_id"] == receipt["entries"][-1]["id"]
    assert receipt["generation"] == canonical["generation"]
    assert receipt["executionScope"] == {
        "requestedFrameIds": [canonical["inputs"]["frames"][0]["id"]],
        "requestedFrameCount": 1, "canonicalFrameCount": 2, "reusedExistingTail": True,
    }
    # The public replay endpoint still interprets First N as an explicit truncation request.
    replay = client.post("/video-import/semantic/events/replay", json={
        "workspaceId": "w", "sequenceId": sequence_id, "firstN": 1,
        **({**extra, "memorySnapshot": response["memorySnapshot"]} if nowhere else {}),
    })
    assert replay.status_code == 409, replay.text
    assert log.read() == canonical


def test_semantic_queue_runs_real_dependencies_offline(integrated):
    root, client = integrated
    sequence_id = sequence(root)
    body, preview = plan(client, sequence_id, first_n=2)
    result = commit(client, body, preview, run=False)
    assert result["state"] == "stamped"
    units = api._sequence_execution_context(root, sequence_id, "w")[1]
    assert not (units[2]["dir"] / "todos.json").exists()
    for _ in range(10):
        if not pooler.one_pass([api._vision_data_root(root)], workers=1, limit=0, retry_errors=False, only_types=None, skip_types={"llm"}):
            break
    for unit in units[:2]:
        payload = json.loads((unit["dir"] / "todos.json").read_text())
        assert all(todo["status"] == "done" for todo in payload["todos"]), payload
    assert semantics._event_log(root, sequence_id).read()["entries"]


def test_initial_or_unordered_model_plan_never_calls_model(integrated, monkeypatch):
    root, client = integrated
    monkeypatch.setattr(semantics, "_model", lambda *args: pytest.fail("No pair, no model resolution"))
    ordered = sequence(root, name="one", count=1)
    _, preview = plan(client, ordered, stage=semantics.LLM_EVENTS, first_n=1)
    assert preview["llmCallCount"] == 0 and preview["blockedReasons"]
    unordered = sequence(root, name="still", ordered=False)
    _, preview = plan(client, unordered, stage=semantics.LOG)
    assert preview["blockedReasons"] and not preview["raw"]["steps"]
    assert not list(root.rglob("todos.json"))
    assert not list(root.rglob("meta.json"))


def test_confirmation_is_bound_to_sequence_scope(integrated):
    root, client = integrated
    sequence_id = sequence(root)
    body, preview = plan(client, sequence_id)
    response = client.post("/video-import/semantic/execution/commit", json={
        **body, "firstN": 3, "confirmed": True, "confirmationKey": preview["confirmationKey"], "run": False,
    })
    assert response.status_code == 409
    assert not list(root.rglob("todos.json"))


@pytest.mark.parametrize("run", [False, True])
def test_semantic_confirmation_binds_mutable_runtime_inputs(integrated, monkeypatch, run):
    root, client = integrated
    sequence_id = sequence(root)
    revision = ["before-review"]
    monkeypatch.setattr(semantics, "runtime_revision",
                        lambda _unit, step: revision[0] if step == semantics.EVENTS else None)
    monkeypatch.setattr(semantics, "_model", lambda *_args: (
        {}, "vision-test", {"backend": "test-provider", "resolved_model_hash": "unchanged-model"},
    ))
    body, preview = plan(client, sequence_id, stage=semantics.LLM_EVENTS)
    revision[0] = "changed-after-review"
    response = client.post("/video-import/semantic/execution/commit", json={
        **body, "confirmed": True, "confirmationKey": preview["confirmationKey"], "run": run,
    })
    assert response.status_code == 409
    assert not list(root.rglob("todos.json"))
    assert not list(root.rglob("direct-*.json"))


def test_ordinary_todo_confirmation_binds_mutable_runtime_inputs(integrated, monkeypatch):
    root, _client = integrated
    sequence(root)
    revision = ["before-review"]
    monkeypatch.setattr(semantics, "runtime_revision",
                        lambda _unit, step: revision[0] if step == semantics.EVENTS else None)
    monkeypatch.setattr(semantics, "_model", lambda *_args: (
        {}, "vision-test", {"backend": "test-provider", "resolved_model_hash": "unchanged-model"},
    ))
    body = {"workspaceId": "w", "set": "recordings/seq", "firstN": 2, "planOnly": True,
            "pipeline": [{"transformation": stage.split("/")[0], "doer": stage.split("/")[1]}
                         for stage in (semantics.EVENTS, semantics.LLM_EVENTS)]}
    with pytest.raises(HTTPException) as preview:
        api.sequence_set_transform(body)
    assert preview.value.status_code == 409
    revision[0] = "changed-after-review"
    with pytest.raises(HTTPException) as stale:
        api.sequence_set_transform({**body, "confirmed": True,
                                    "confirmationKey": preview.value.detail["confirmationKey"]})
    assert stale.value.status_code == 409
    assert stale.value.detail["confirmationKey"] != preview.value.detail["confirmationKey"]
    assert not list(root.rglob("todos.json"))


def test_model_queue_persists_exact_authorization_and_rejects_changed_configuration(integrated, monkeypatch):
    root, client = integrated
    sequence_id = sequence(root)
    model_revision = ["first-model-revision"]
    monkeypatch.setattr(semantics, "_model", lambda *args: (
        {}, "vision-test", {"backend": "test-provider", "resolved_model_hash": model_revision[0]},
    ))
    body, preview = plan(client, sequence_id, stage=semantics.LLM_EVENTS)
    assert preview["modelId"] == "vision-test" and preview["llmCallCount"] == 1
    model_revision[0] = "changed-model-revision"
    rejected = client.post("/video-import/semantic/execution/commit", json={
        **body, "confirmed": True, "confirmationKey": preview["confirmationKey"], "run": False,
    })
    assert rejected.status_code == 409 and not list(root.rglob("todos.json"))
    body, preview = plan(client, sequence_id, stage=semantics.LLM_EVENTS)
    assert commit(client, body, preview, run=False)["state"] == "stamped"
    units = api._sequence_execution_context(root, sequence_id, "w")[1]
    for index, unit in enumerate(units[:2]):
        todos = json.loads((unit["dir"] / "todos.json").read_text())["todos"]
        paid = [todo for todo in todos if todo.get("type") == "llm"]
        assert len(paid) == (0 if index == 0 else 1)
        for todo in paid:
            assert todo["options"]["modelId"] == "vision-test" and todo["options"]["confirmModel"]
            assert todo["options"]["modelRevision"] == "changed-model-revision"
            assert todo["authorization"] == {
                "confirmationKey": preview["confirmationKey"], "confirmed": True,
                "firstN": 2, "imageCount": 2, "modelId": "vision-test",
                "backendId": "test-provider", "llmCallCount": 1,
            }
    assert not (units[2]["dir"] / "todos.json").exists()
    assert not list(root.rglob("meta.json"))


def test_pooler_preserves_each_merged_todos_browser_session(integrated, monkeypatch):
    root, _ = integrated
    sequence_id = sequence(root, count=1)
    unit = api._sequence_execution_context(root, sequence_id, "w")[1][0]
    unit["memorySessionId"] = "newer-page-session"
    specs = [
        {"transformation": "first", "doer": "local", "memorySessionId": "original-page-session"},
        {"transformation": "second", "doer": "local", "memorySessionId": "newer-page-session"},
    ]
    api.write_unit_todos(unit, specs)
    observed = {}

    def run(queued_unit, transformation, doer, _options, **_):
        observed[transformation] = queued_unit["memorySessionId"]
        return {"step": f"{transformation}/{doer}", "status": "written", "elapsedMs": 0}

    monkeypatch.setattr(pooler, "run_transform_step", run)
    assert pooler.one_pass([api._vision_data_root(root)], workers=1, limit=0, retry_errors=False, only_types=None, skip_types=None) == 2
    assert observed == {"first": "original-page-session", "second": "newer-page-session"}
    saved = json.loads((unit["dir"] / "todos.json").read_text())["todos"]
    assert {todo["transformation"]: todo["memorySessionId"] for todo in saved} == observed


@pytest.mark.parametrize("valid", [True, False])
def test_real_direct_model_boundary_persists_audit_and_validates_ast(integrated, monkeypatch, valid):
    from omega_vision.services import video_import_pipeline as pipeline
    root, client = integrated
    sequence_id = sequence(root)
    calls = []
    raw = ('{"assessment":"unknown","comparison_complete":false,"confidence":0,'
           '"evidence":[],"uncertainty":["insufficient"],"events":[]}') if valid else "unsafe(g1) :- shell('no')."
    monkeypatch.setattr(pipeline, "load_state", lambda _: {"allCallsModel": "vision-test"})
    monkeypatch.setattr(pipeline, "_resolved_model_records", lambda _: [{
        "document": {"id": "vision-test", "capabilities": {"vision": True}},
        "resolved": {"enabled": True, "backend": {"id": "test-provider", "capabilities": ["llm.vision"]}},
    }])
    monkeypatch.setattr(pipeline, "_model_execution_parameters", lambda *args: {
        "backendId": "test-provider", "model": "test-remote",
    })

    def invoke(_root, model_id, prompt, image):
        calls.append((model_id, prompt, image))
        assert list(root.rglob("prompt.txt")) and list(root.rglob("provenance.json"))
        return raw

    monkeypatch.setattr(pipeline, "invoke_model", invoke)
    body, preview = plan(client, sequence_id, stage=semantics.LLM_EVENTS, modelId="vision-test")
    assert not calls and preview["llmCallCount"] == 1
    assert preview["backendId"] == "test-provider"
    finish(client, commit(client, body, preview, run=True), expected="done" if valid else "error")
    assert len(calls) == 1
    assert calls[0][0] == "vision-test" and calls[0][2].startswith("data:image/png;base64,")
    assert any(path.read_text(encoding="utf-8") == raw for path in root.rglob("raw-response.txt"))
    hypotheses = semantics._event_log(root, sequence_id).hypotheses()
    assert hypotheses
    if valid:
        assert hypotheses[-1]["parsed"]["authoritative"] is False
    else:
        assert any(item.get("status") == "invalid" for item in hypotheses)
    assert not (root / "data" / "omega_vision" / "recordings" / "seq" / "transforms" / "image" / "llm_event_deduction_0").exists()


def test_promoted_rule_revision_invalidates_dependency_reuse(integrated, monkeypatch):
    root, _ = integrated
    sequence_id = sequence(root, count=1)
    unit = api._sequence_execution_context(root, sequence_id, "w")[1][0]
    promoted = []
    class Rules:
        path = root

        def list(self, **_kwargs):
            return promoted
    monkeypatch.setattr(semantics, "_store", lambda _: Rules())
    calls = []
    def runner(_unit, out, options):
        calls.append(options["semanticContextRevision"])
        (out / "result.pl").write_text("% Typed deduction boundary\n")
        return {"schema": "test"}
    transformation, doer = semantics.EVENTS.split("/")
    monkeypatch.setitem(api._SEQUENCE_TRANSFORMS, (transformation, doer), runner)
    assert api.run_transform_step(unit, transformation, doer, {})["status"] == "written"
    assert api.run_transform_step(unit, transformation, doer, {})["status"] == "skipped"
    promoted.append({"candidate_id": "rule-revision", "kind": "event_detector", "version": 1,
                     "status": "promoted",
                     "scope": {"workspace_id": "w"}, "rule": {"revision": 2},
                     "evidence": [], "evaluations": [{"metrics": {"minimum_support_confidence": 0.95}}]})
    assert api.run_transform_step(unit, transformation, doer, {})["status"] == "written"
    assert len(calls) == 2 and calls[0] != calls[1]
    promoted[0]["evaluations"].append({"id": "receipt-only", "metrics": {"minimum_support_confidence": 0.95}})
    assert api.run_transform_step(unit, transformation, doer, {})["status"] == "skipped"
    promoted[0]["evaluations"].append({"id": "held-out-v2", "metrics": {"minimum_support_confidence": 0.8}})
    assert api.run_transform_step(unit, transformation, doer, {})["status"] == "written"
    assert calls[2] != calls[1]
    promoted.clear()
    assert api.run_transform_step(unit, transformation, doer, {})["status"] == "written"
    assert calls[3] == calls[0]


def test_imported_arc_provenance_declares_order_without_fabricating_image_set_adjacency(integrated):
    root, client = integrated
    directory = root / "data" / "omega_vision" / "recordings" / "import"
    directory.mkdir(parents=True)
    for index in range(2):
        image = directory / f"frame_{index:06}.png"
        Image.new("RGB", (12, 12), "red").save(image)
        image.with_suffix(".provenance.json").write_text(json.dumps({
            "kind": "video_import_image_provenance", "operation": "import_arc_playback_frame",
            "source": {"arcRecording": "data/recordings/game/run", "frameIndex": index,
                       "incomingAction": "ACTION1" if index else None, "level": "7"},
        }))
    _, units, catalog = api._sequence_execution_context(root, "data/recordings/import", "w")
    assert catalog["ordered"]
    assert units[1]["sourceProvenance"]["source"]["incomingAction"] == "ACTION1"
    body, preview = plan(client, "data/recordings/import")
    assert preview["pairCount"] == 1 and not preview["blockedReasons"]
    last = directory / "frame_000001.provenance.json"
    changed = json.loads(last.read_text())
    changed["source"]["arcRecording"] = "data/recordings/game/other"
    last.write_text(json.dumps(changed))
    assert api._sequence_execution_context(root, "data/recordings/import", "w")[2]["ordered"] is False
    _, preview = plan(client, "data/recordings/import")
    assert preview["blockedReasons"]


def test_new_grouping_memory_honors_preferences_and_isolates_page_sessions(integrated):
    root, client = integrated
    sequence_id = sequence(root, count=2)
    endpoint = "/video-import/semantic/memory"
    first = {"workspaceId": "w", "sequenceId": sequence_id, "memorySessionId": "00000000-0000-4000-8000-000000000001"}
    second = {**first, "memorySessionId": "00000000-0000-4000-8000-000000000002"}
    response = client.get(endpoint, params=first)
    assert response.status_code == 200, response.text
    assert response.headers["cache-control"] == "no-store"
    setup = response.json()
    preferences = setup["preferences"]
    original_object = dict(preferences["object"])
    preferences["shape"]["saveTo"] = "memory-nowhere"
    preferences["shape"]["lookIn"] = ["memory-nowhere"]
    saved = client.put(endpoint + "/preferences", json={
        **first, "preferences": preferences, "expectedRevision": preferences["revision"],
    })
    assert saved.status_code == 200, saved.text
    assert saved.json()["object"] == original_object
    body, preview = plan(client, sequence_id, stage=semantics.GROUPING,
                         memorySessionId=first["memorySessionId"], memorySnapshot=None)
    queued = client.post("/video-import/semantic/execution/commit", json={
        **body, "confirmed": True, "confirmationKey": preview["confirmationKey"], "run": False,
    })
    assert queued.status_code == 409 and "direct" in queued.json()["detail"]
    assert not list(root.rglob("todos.json"))
    result = commit(client, body, preview, run=True)
    finish(client, result)
    first["memorySnapshot"] = result["memorySnapshot"]

    def read(session):
        result = client.post(endpoint + "/read", json={**session, "kind": "shape", "locationIds": ["memory-nowhere"]})
        assert result.status_code == 200, result.text
        assert result.headers["cache-control"] == "no-store"
        return result.json()["records"]

    records = read(first)
    assert records and not read(second)
    state = client.post("/video-import/semantic/execution/read", json={**first, "firstN": 2}).json()
    units = api._sequence_execution_context(root, sequence_id, "w")[1]
    assert [frame["id"] for frame in state["frames"]] == [unit["id"] for unit in units]
    assert [frame["index"] for frame in state["frames"]] == [0, 1]
    assert all(output["status"] == "done" for output in state["outputs"] if output["composite"] == semantics.GROUPING)
    another_page = client.get("/video-import/semantic/execution", params={**second, "firstN": 2}).json()
    assert all(output["status"] == "stale" for output in another_page["outputs"]
               if output["composite"] == semantics.GROUPING)
    assert not list(root.rglob("*.memory.json"))
    reset = client.post(endpoint + "/reset", json=second)
    assert reset.status_code == 200, reset.text
    assert read(first)
    record = records[0]["preferred"]
    destination = next(item["memoryLocationId"] for item in setup["catalog"]["destinations"]
                       if "shape" in item["memoryKinds"] and item["memoryLocationId"] != "memory-nowhere"
                       and item["capabilities"]["write"])
    copied = client.post(endpoint + "/copy", json={
        **first, "kind": "shape", "sourceLocationId": "memory-nowhere",
        "recordUid": record["recordUid"], "destinationId": destination,
    })
    assert copied.status_code == 200, copied.text
    assert copied.json()["record"]["origin"]["recordUid"] == record["recordUid"]
    assert list(root.rglob("*.memory.json"))
    first.pop("memorySnapshot")
    assert client.post(endpoint + "/reset", json=first).status_code == 200
    assert not read(first)
    assert not read({**first, "memorySessionId": "00000000-0000-4000-8000-000000000003"})


def test_direct_nowhere_returns_snapshot_only_on_its_request_and_binds_plan_to_page(integrated):
    root, client = integrated
    sequence_id = sequence(root, count=1)
    locations, context = semantics._memory("w", sequence_id)
    preferences = locations.load_preferences(context)
    persistent_destination = preferences["shape"]["saveTo"]
    preferences["shape"]["saveTo"] = "memory-nowhere"
    preferences["shape"]["lookIn"] = ["memory-nowhere"]
    locations.save_preferences(context, preferences, expected_revision=preferences["revision"])
    session_id = "00000000-0000-4000-8000-000000000004"
    body, preview = plan(client, sequence_id, stage=semantics.GROUPING, first_n=1,
                         memorySessionId=session_id, memorySnapshot=None)
    assert not hasattr(semantics, "_MEMORY_LEASES")
    result = commit(client, body, preview, run=True)
    status = finish(client, result)
    assert "memorySnapshot" not in status
    assert all("memorySnapshot" not in job for job in api._direct_jobs.values())
    assert result["memorySnapshot"]
    assert not any("memorySnapshot" in path.read_text() for path in (root / "data" / "omega_vision" / "runtime" / "executions").glob("*"))
    read = client.post("/video-import/semantic/memory/read", json={
        "workspaceId": "w", "sequenceId": sequence_id, "memorySessionId": session_id,
        "memorySnapshot": result["memorySnapshot"],
        "kind": "shape", "locationIds": ["memory-nowhere"],
    })
    assert read.status_code == 200 and read.json()["records"]
    assert client.post("/video-import/semantic/memory/reset", json={
        "workspaceId": "w", "memorySessionId": session_id,
    }).status_code == 200
    retired = client.post("/video-import/semantic/execution/commit", json={
        **body, "memorySessionId": "replacement-browser-session",
        "confirmed": True, "confirmationKey": preview["confirmationKey"], "run": True,
    })
    assert retired.status_code == 409 and "plan changed" in retired.json()["detail"]["message"]
    body, preview = plan(client, sequence_id, stage=semantics.GROUPING, first_n=1, memorySessionId=session_id)
    retired = client.post("/video-import/semantic/execution/commit", json={
        **body, "confirmed": True, "confirmationKey": preview["confirmationKey"], "run": True,
    })
    assert retired.status_code == 409 and "snapshot" in retired.json()["detail"]
    assert len(list((root / "data" / "omega_vision" / "runtime" / "executions").glob("direct-*.json"))) == 1
    preferences = locations.load_preferences(context)
    preferences["shape"]["saveTo"] = persistent_destination
    locations.save_preferences(context, preferences, expected_revision=preferences["revision"])
    body, preview = plan(client, sequence_id, stage=semantics.GROUPING, first_n=1, memorySessionId=session_id)
    queued = client.post("/video-import/semantic/execution/commit", json={
        **body, "confirmed": True, "confirmationKey": preview["confirmationKey"], "run": False,
    })
    assert queued.status_code == 409 and "Look In" in queued.json()["detail"]
    assert not list(root.rglob("todos.json"))


def test_failed_paid_rerun_stays_error_until_explicitly_restamped(integrated, monkeypatch):
    root, _client = integrated
    sequence_id = sequence(root, count=1)
    unit = api._sequence_execution_context(root, sequence_id, "w")[1][0]
    calls = []

    def fail_model(*_args):
        calls.append(True)
        raise ValueError("Invalid typed model output")

    monkeypatch.setitem(api._SEQUENCE_TRANSFORMS, ("paid", "model"), fail_model)
    spec = {"transformation": "paid", "doer": "model", "type": "llm",
            "options": {"confirmModel": True}}
    directory = unit["dir"] / "paid" / "model"
    directory.mkdir(parents=True)
    (directory / "meta.json").write_text(json.dumps({"options": {}, "inputSignature": unit.get("inputSignature")}))
    api.write_unit_todos(unit, [spec])
    assert pooler.one_pass([api._vision_data_root(root)], workers=1, limit=0, retry_errors=False, only_types=None, skip_types=set()) == 1
    saved = json.loads((unit["dir"] / "todos.json").read_text())["todos"]
    assert saved[0]["status"] == "error" and "Invalid typed" in saved[0]["error"]
    assert pooler.one_pass([api._vision_data_root(root)], workers=1, limit=0, retry_errors=False, only_types=None, skip_types=set()) == 0

    # Rewriting another task must not silently re-enable a failed paid task.
    api.write_unit_todos(unit, saved, [{"step": "other/local", "status": "written"}])
    assert json.loads((unit["dir"] / "todos.json").read_text())["todos"][0]["status"] == "error"
    assert calls == [True]
    api.write_unit_todos(unit, [spec])
    assert pooler.one_pass([api._vision_data_root(root)], workers=1, limit=0, retry_errors=False, only_types=None, skip_types=set()) == 1
    assert calls == [True, True]


def test_queued_grouping_revalidates_volatile_lookups_after_submission(integrated, monkeypatch):
    root, client = integrated
    sequence_id = sequence(root, count=1)
    body, preview = plan(client, sequence_id, stage=semantics.GROUPING, first_n=1)
    commit(client, body, preview, run=False)
    locations, context = semantics._memory("w", sequence_id)
    preferences = locations.load_preferences(context)
    preferences["shape"]["lookIn"] = ["memory-nowhere"]
    locations.save_preferences(context, preferences, expected_revision=preferences["revision"])
    monkeypatch.setitem(api._SEQUENCE_TRANSFORMS, tuple(semantics.GROUPING.split("/")),
                        lambda *_args: pytest.fail("An offline task cannot use browser-local volatile lookup"))
    for _ in range(10):
        if not pooler.one_pass([api._vision_data_root(root)], workers=1, limit=0, retry_errors=False, only_types=None, skip_types=None):
            break
    unit = api._sequence_execution_context(root, sequence_id, "w")[1][0]
    saved = json.loads((unit["dir"] / "todos.json").read_text())["todos"]
    grouping = next(item for item in saved if item["output"] == semantics.GROUPING)
    assert grouping["status"] == "error" and "Look In" in grouping["error"]
    assert semantics._artifact(unit, semantics.GROUPING, ".transform-failed.json").is_file()


def test_memory_heartbeat_and_server_lease_are_removed(integrated):
    root, client = integrated
    before = {str(path.relative_to(root)) for path in root.rglob("*")}
    endpoint = "/video-import/semantic/memory/heartbeat"
    response = client.post(endpoint, json={"workspaceId": "w", "memorySessionId": "former-page-token"})
    assert response.status_code == 404
    assert not hasattr(semantics, "_memory_lease") and not hasattr(semantics, "_MEMORY_LEASES")
    assert {str(path.relative_to(root)) for path in root.rglob("*")} == before


def test_browser_execution_disconnect_cancels_and_cleans_request_owned_payload(integrated, monkeypatch):
    import asyncio
    import threading
    root, client = integrated
    sequence_id = sequence(root, count=1)
    locations, context = semantics._memory("w", sequence_id)
    preferences = locations.load_preferences(context)
    preferences["shape"]["saveTo"] = "memory-nowhere"
    locations.save_preferences(context, preferences, expected_revision=preferences["revision"])
    body, preview = plan(client, sequence_id, stage=semantics.GROUPING, first_n=1,
                         memorySessionId="browser-disconnect-test", memorySnapshot=None)
    entered, release, finished = threading.Event(), threading.Event(), threading.Event()
    captured = []

    def run(unit, transformation, doer, *_args, **_kwargs):
        state = unit["_browserMemory"]
        captured.append(state)
        state.memory.put("shape", {"uid": "private-disconnect-shape"},
                         source={"providerRef": "filesystem:omega_vision", "workspaceId": "w"})
        entered.set()
        assert release.wait(10)
        finished.set()
        return {"step": f"{transformation}/{doer}", "status": "written"}

    monkeypatch.setattr(api, "run_transform_step", run)
    response = api.start_direct_call({
        **body, "composite": semantics.GROUPING, "confirmed": True,
        "confirmationKey": preview["raw"]["confirmationKey"],
    })

    async def disconnect():
        stream = response.body_iterator
        progress = json.loads(await anext(stream))["progress"]
        assert await asyncio.to_thread(entered.wait, 10)
        await stream.aclose()
        assert api._direct_jobs[progress["id"]]["cancel"] is True
        release.set()
        assert await asyncio.to_thread(finished.wait, 10)
        for _ in range(100):
            if not captured[0].memory.records("shape"):
                break
            await asyncio.sleep(0.01)
        assert captured[0].memory.records("shape") == []
        assert all("memorySnapshot" not in job and "_browserMemory" not in job for job in api._direct_jobs.values())

    try:
        asyncio.run(disconnect())
    finally:
        release.set()
