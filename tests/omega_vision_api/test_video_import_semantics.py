from __future__ import annotations

from copy import deepcopy
import json
from pathlib import Path

from fastapi import FastAPI
from fastapi.testclient import TestClient
from PIL import Image, ImageDraw
import pytest

from omega_vision.perception.observation_identity import build_observation_bundle, content_hash
from omega_vision.services import video_import_api as api
from omega_vision.services import video_import_semantics as semantics


def write_json(path, value):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(value), encoding="utf-8")


@pytest.fixture
def workspace(tmp_path, monkeypatch):
    monkeypatch.setattr(api, "_workspace_root", lambda name: tmp_path if name == "test" else (_ for _ in ()).throw(KeyError(name)))
    monkeypatch.setattr(api, "_data_homes", lambda root: [root / "data"])
    registry, metadata = dict(api._SEQUENCE_TRANSFORMS), dict(api._TRANSFORM_METADATA)
    semantics.register_transforms(registry, metadata)
    monkeypatch.setattr(api, "_SEQUENCE_TRANSFORMS", registry)
    monkeypatch.setattr(api, "_TRANSFORM_METADATA", metadata)
    app = FastAPI()
    app.include_router(semantics.router)
    return tmp_path, TestClient(app)


def make_sequence(root: Path, *, name="one", count=4, seed=10, ordered=True, layout="recording", motion=2,
                  attest=True, provenance_recording=None):
    sequence = root / "sequences" / name
    sequence.mkdir(parents=True)
    if ordered:
        write_json(sequence / "recording.json", {"game_id": "fixture-game", "level": "1", "moves": []})
    moves = []
    for order in range(count):
        if layout == "recording":
            source = sequence / "image.png" if order == 0 else sequence / str(order - 1) / "image.png"
        else:
            source = sequence / "pool" / f"frame_{order:06}.png"
        source.parent.mkdir(parents=True, exist_ok=True)
        x = 2 + order * motion
        image = Image.new("RGB", (48, 24), (seed, 0, order))
        draw = ImageDraw.Draw(image)
        draw.rectangle((x, 4, x + 2, 13), fill="red")
        draw.rectangle((x + 3, 4, x + 7, 13), fill="blue")
        image.save(source)
        if order and layout == "recording":
            write_json(source.parent / "state.json", {
                "incoming_action": "ACTION2", "action_data": {"recorded_order": order},
                "recorded_at": f"2026-01-01T00:00:{order:02}Z",
            })
        if provenance_recording:
            if order:
                moves.append({
                    "index": order - 1, "action": "ACTION2", "data": {"recorded_order": order},
                    "directory": f"{provenance_recording}/{order - 1}", "level": "7",
                    "recorded_at": f"2026-01-01T00:00:{order:02}Z",
                })
            write_json(source.with_suffix(".provenance.json"), {
                "kind": "video_import_image_provenance", "operation": "import_arc_playback_frame",
                "createdAt": "2026-06-01T00:00:00Z", "transform": {},
                "source": {
                    "arcRecording": provenance_recording, "arcFrame": f"{order - 1}/image.png" if order else "image.png",
                    "frameIndex": order, "incomingAction": "ACTION2" if order else None,
                    "actionData": {"recorded_order": order} if order else None,
                    "level": "7", "moveCount": len(moves), "moveList": moves,
                },
            })
    _, units = semantics._units("test", f"sequences/{name}")
    for order, unit in enumerate(units):
        x = 2 + order * motion
        geometry = {"width": 48, "height": 24, "polygons": {}}
        facts, accepted = [], []
        for index, (start, color) in enumerate(((x, "red"), (x + 3, "blue")), 1):
            width = 3 if index == 1 else 5
            geometry["polygons"][str(index)] = {
                "outer": [[start, 4], [start + width - 1, 4], [start + width - 1, 13], [start, 13]],
                "holes": [], "pixelRuns": [[y, start, start + width - 1] for y in range(4, 14)],
            }
            facts.append(f"region(r{index},'{color}',{width * 10},centroid({start + (width - 1) / 2},8.5)).")
            accepted.append({"id": f"g{index}", "members": [f"r{index}"], "acceptance": "fixture_measured_group"})
        facts.extend(["adjacent(r1,r2).", "shared_edge(r1,r2,10)."])
        parts = "\n".join(facts)
        grouping = "part_group(w1,[r1,r2])."
        acceptance = "accepted_group(g1,[r1]).\naccepted_group(g2,[r2])."
        for step, text in [(semantics.PARTS, parts), (semantics.GROUPS, grouping),
                           (semantics.ACCEPTANCE, acceptance), (semantics.TURTLE, "turtle_program(g1,[forward(3)]).")]:
            path = semantics._artifact(unit, step, "result.pl")
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(text, encoding="utf-8")
        write_json(semantics._artifact(unit, semantics.PARTS, "geometry.json"), geometry)
        extraction_meta = {"visualGroups": []}
        if attest:
            extraction_meta["attachmentEvidence"] = {
                "schemaVersion": 1,
                "complete": {family: True for family in (
                    "regions", "shared_edges", "adjacency", "enclosure", "borders", "holes", "probes",
                )},
                "backgroundRolesTrusted": True,
                "extractionPolicyHash": content_hash({
                    "producer": "test_complete_two_solid_rectangles_v1", "dimensions": [48, 24],
                    "background": "excluded_from_the_two_foreground_groups",
                }),
            }
        write_json(semantics._artifact(unit, semantics.PARTS, "meta.json"), extraction_meta)
        write_json(semantics._artifact(unit, semantics.ACCEPTANCE, "meta.json"), {"acceptedGroups": accepted})
        source_files = {
            "image": unit["image"], "partsFacts": semantics._artifact(unit, semantics.PARTS, "result.pl"),
            "groupingFacts": semantics._artifact(unit, semantics.GROUPS, "result.pl"),
            "acceptanceFacts": semantics._artifact(unit, semantics.ACCEPTANCE, "result.pl"),
            "geometry": semantics._artifact(unit, semantics.PARTS, "geometry.json"),
            "acceptanceMetadata": semantics._artifact(unit, semantics.ACCEPTANCE, "meta.json"),
            "extractionMetadata": semantics._artifact(unit, semantics.PARTS, "meta.json"),
        }
        bundle = build_observation_bundle(
            frame_alias=unit["id"], sequence_id=unit["sequenceId"],
            frame_order=order if unit["sequenceOrdered"] else None,
            frame_key=unit["frameSourceKey"], image_bytes=unit["image"].read_bytes(),
            extraction_text=parts, grouping_text=grouping, acceptance_text=acceptance,
            geometry=geometry, accepted_groups=accepted,
            source_artifact_hashes={key: content_hash(path.read_bytes()) for key, path in source_files.items()},
        )
        write_json(semantics._artifact(unit, semantics.IDENTITY, "observations.json"), bundle)
    return units


def invoke(unit, step, options=None):
    runner = api._SEQUENCE_TRANSFORMS[tuple(step.split("/"))]
    out = semantics._artifact(unit, step).parent
    out.mkdir(parents=True, exist_ok=True)
    stats = runner(unit, out, options or {})
    assert (out / "result.json").is_file()
    assert (out / "result.pl").is_file()
    assert (out / "summary.json").is_file()
    return stats, semantics._result(unit, step)


def run_core(units, *, grouping=False):
    for unit in units:
        for step in (semantics.TEMPORAL, semantics.OBJECTS, semantics.EVENTS, semantics.LOG):
            invoke(unit, step)
        if grouping:
            invoke(unit, semantics.GROUPING)


def test_registration_is_pure_and_boundaries_are_declared(workspace):
    root, _ = workspace
    registry, metadata = {}, {}
    semantics.register_transforms(registry, metadata)
    assert len(registry) == 8 and all(callable(runner) for runner in registry.values())
    assert json.loads(json.dumps(list(metadata.values())))
    assert metadata[tuple(semantics.TEMPORAL.split("/"))]["firstFrameDependsOn"] == [
        semantics.IDENTITY, semantics.PARTS, semantics.GROUPS, semantics.ACCEPTANCE,
    ]
    assert metadata[tuple(semantics.LLM_EVENTS.split("/"))]["skipFirstFrame"] is True
    assert metadata[tuple(semantics.LLM_EVENTS.split("/"))]["type"] == "llm"
    assert all(value["orderedOnly"] is True for value in metadata.values())
    assert f"frame[-1]@{semantics.TURTLE}" in metadata[tuple(semantics.LLM_EVENTS.split("/"))]["dependsOn"]
    assert not (root / "runtime").exists()
    assert not any(step["type"] == "llm" for step in api._DEFAULT_PIPELINE_TEMPLATE)


def test_parent_boundary_seam_skips_unordered_jobs_and_bootstraps_first_frame(workspace):
    root, _ = workspace
    unordered = make_sequence(root, name="unordered", count=1, ordered=False, layout="pool")
    ordered = make_sequence(root, name="ordered", count=1)
    definitions = api._transform_definitions()
    for stage in (semantics.TEMPORAL, semantics.OBJECTS, semantics.GROUPING, semantics.EVENTS,
                  semantics.LOG, semantics.INDUCTION, semantics.LLM_EVENTS, semantics.LLM_RULES):
        assert api._step_for_unit(definitions[stage], unordered[0]) is None
    first_temporal = api._step_for_unit(definitions[semantics.TEMPORAL], ordered[0])
    assert first_temporal["dependsOn"] == [semantics.IDENTITY, semantics.PARTS, semantics.GROUPS, semantics.ACCEPTANCE]
    assert api._step_for_unit(definitions[semantics.LLM_EVENTS], ordered[0]) is None


def test_object_evidence_implementation_invalidates_cached_producer(workspace, monkeypatch):
    from omega_vision.perception import object_evidence
    root, _ = workspace
    unit = make_sequence(root, count=1)[0]
    options = api._runtime_transform_options(unit, semantics.OBJECTS, {})
    meta = semantics._artifact(unit, semantics.OBJECTS, "meta.json")
    write_json(meta, {"options": options})
    assert api._step_meta_is_stale(meta, [], options=options) == (False, "current")
    copied_source = root / "object_evidence_copy.py"
    copied_source.write_bytes(Path(object_evidence.__file__).read_bytes())
    monkeypatch.setattr(object_evidence, "__file__", str(copied_source))
    assert api._runtime_transform_options(unit, semantics.OBJECTS, {}) == options
    copied_source.write_bytes(copied_source.read_bytes() + b"\n# Changed evidence contract.\n")
    changed = api._runtime_transform_options(unit, semantics.OBJECTS, {})
    assert changed != options
    assert api._step_meta_is_stale(meta, [], options=changed) == (True, "options-changed")


@pytest.mark.parametrize("stage", [semantics.PARTS, semantics.TEMPORAL])
def test_pure_implementation_revisions_do_not_require_workspace(stage, monkeypatch):
    monkeypatch.setattr(semantics, "_workspace", lambda _: pytest.fail("Pure producer versions must not access a workspace"))
    before = semantics.runtime_revision({}, stage)
    assert before == semantics.runtime_revision({}, tuple(stage.split("/")))
    implementation = semantics._implementation_revision
    monkeypatch.setattr(semantics, "_implementation_revision", lambda selected: {
        **implementation(selected), "simulatedImplementation": "updated",
    })
    after = semantics.runtime_revision({}, stage)
    assert after != before
    assert api._runtime_transform_options({}, stage, {}) == {"semanticContextRevision": after}
    assert semantics.runtime_revision({}, "unrelated/stage") is None


@pytest.mark.parametrize("source", ["pixels_to_regions", "pixels_to_regions_cv"])
def test_cv_implementation_revision_includes_both_producer_sources(tmp_path, monkeypatch, source):
    from omega_vision.perception import pixels_to_regions, pixels_to_regions_cv
    module = {"pixels_to_regions": pixels_to_regions, "pixels_to_regions_cv": pixels_to_regions_cv}[source]
    before = semantics.runtime_revision({}, semantics.PARTS)
    changed = tmp_path / "changed_producer.py"
    changed.write_text("# simulated revised producer implementation\n")
    monkeypatch.setattr(module, "__file__", str(changed))
    assert semantics.runtime_revision({}, semantics.PARTS) != before


@pytest.mark.parametrize("dependency", ["tracking_source", "tracking_rules", "authored_detector"])
def test_runtime_revision_tracks_object_and_authored_event_implementations(workspace, monkeypatch, dependency):
    from omega_vision.perception import event_deduction, object_tracking
    root, _ = workspace
    unit = make_sequence(root, count=1)[0]
    stage = semantics.EVENTS if dependency == "authored_detector" else semantics.OBJECTS
    before = semantics.runtime_revision(unit, stage)
    if dependency == "tracking_source":
        changed = root / "changed_tracking.py"
        changed.write_text("# simulated revised tracking implementation\n")
        monkeypatch.setattr(object_tracking, "__file__", str(changed))
    elif dependency == "tracking_rules":
        rules = object_tracking._rule_hashes()
        monkeypatch.setattr(object_tracking, "_rule_hashes", lambda: {**rules, "object_tracking.pl": "new-authored-rules"})
    else:
        monkeypatch.setattr(event_deduction, "implementation_version", lambda *_: "new-authored-detector")
    assert semantics.runtime_revision(unit, stage) != before


def test_runtime_revision_tracks_promoted_rule_lifecycle_without_writes(workspace):
    root, client = workspace
    unit = make_sequence(root, count=1)[0]
    initial = semantics.runtime_revision(unit, semantics.EVENTS)
    assert isinstance(initial, str) and semantics.runtime_revision(unit, ("unrelated", "stage")) is None
    assert not (root / "runtime").exists()
    store = semantics._store(root)
    candidate = store.create(
        {"body": [{"predicate": "present", "args": [{"var": "Object"}]}],
         "head": {"predicate": "moved", "args": [{"var": "Object"}]}},
        kind="event_detector", scope={"domain": "visual-sequence"}, source="authored",
        provenance={"code_hash": "test-revision-fixture"}, inducer_version="test-runtime-revision-v1",
    )
    proposed = semantics.runtime_revision(unit, semantics.EVENTS)
    assert proposed == initial
    for index in (1, 2):
        store.record_evidence(candidate["candidate_id"], {
            "sequence_id": f"fixture-sequence-{index}", "sequence_fingerprint": f"fixture-content-{index}",
            "pair_id": f"fixture-pair-{index}", "before_hash": f"fixture-before-{index}",
            "after_hash": f"fixture-after-{index}", "partition": "held_out", "outcome": "support",
            "assessment": "changed", "comparison_complete": True, "confidence": 0.95,
            "event_ids": [f"fixture-event-{index}"], "evidence_refs": [f"fixture-measurement-{index}"],
            "source": "deterministic_replay", "evaluator_id": "fixture", "evaluator_version": "1",
            "depends_on_candidates": [],
        })
    store.promote(candidate["candidate_id"], gates=semantics.PromotionGates())
    snapshot = {path: path.read_bytes() for path in root.rglob("*") if path.is_file()}
    promoted = semantics.runtime_revision(unit, tuple(semantics.EVENTS.split("/")))
    assert promoted != proposed
    assert {path: path.read_bytes() for path in root.rglob("*") if path.is_file()} == snapshot
    store.evaluate(candidate["candidate_id"], gates=semantics.PromotionGates(min_confidence=0.9))
    assert store.get(candidate["candidate_id"])["status"] == "promoted"
    assert semantics.runtime_revision(unit, semantics.EVENTS) == promoted
    store.create(
        candidate["rule"], kind=candidate["kind"], scope=candidate["scope"], source="authored",
        provenance={"code_hash": "same-rule-new-receipt"}, inducer_version=candidate["inducer_version"],
    )
    store.evaluate(candidate["candidate_id"], gates=semantics.PromotionGates())
    assert semantics.runtime_revision(unit, semantics.EVENTS) == promoted
    changed = deepcopy(store.get(candidate["candidate_id"])["evidence"][0])
    changed.pop("evidence_id")
    changed["confidence"] = 0.9
    store.record_evidence(candidate["candidate_id"], changed)
    assert semantics.runtime_revision(unit, semantics.EVENTS) == initial
    store.promote(candidate["candidate_id"], gates=semantics.PromotionGates())
    assert semantics.runtime_revision(unit, semantics.EVENTS) not in {initial, promoted}
    rejected = client.post(f"/semantic/candidates/{candidate['candidate_id']}/reject", json={
        "workspaceId": "test", "reviewer": "revision-test", "reason": "Test activation revision after rejection",
    })
    assert rejected.status_code == 200, rejected.text
    assert semantics.runtime_revision(unit, semantics.EVENTS) == initial


def _promote_registry_fixture(store, candidate):
    for index in (1, 2):
        store.record_evidence(candidate["candidate_id"], {
            "sequence_id": f"registry-{index}", "sequence_fingerprint": f"registry-content-{index}",
            "pair_id": f"registry-pair-{index}", "before_hash": f"registry-before-{index}",
            "after_hash": f"registry-after-{index}", "partition": "held_out", "outcome": "support",
            "assessment": "changed", "comparison_complete": True, "confidence": 0.95,
            "event_ids": [f"registry-event-{index}"], "evidence_refs": [f"registry-measurement-{index}"],
            "source": "deterministic_replay", "evaluator_id": "registry-fixture", "evaluator_version": "1",
            "depends_on_candidates": [],
        })
    store.promote(candidate["candidate_id"], gates=semantics.PromotionGates())


def test_grouping_registry_publication_ignores_promotions_in_other_families(workspace):
    root, _ = workspace
    store = semantics._store(root)
    grouping_revision = semantics._registry_revision(store, kinds={"grouping"})
    event_revision = semantics._registry_revision(store, kinds=semantics.EVENT_RULE_KINDS)
    candidate = store.create(
        {"body": [{"predicate": "present", "args": [{"var": "Object"}]}],
         "head": {"predicate": "moved", "args": [{"var": "Object"}]}},
        kind="event_detector", scope={"domain": "visual-sequence"}, source="authored",
        provenance={"code_hash": "unrelated-promotion"}, inducer_version="registry-isolation-test",
    )
    _promote_registry_fixture(store, candidate)
    assert semantics._registry_revision(store, kinds=semantics.EVENT_RULE_KINDS) != event_revision
    assert semantics._registry_revision(store, kinds={"grouping"}) == grouping_revision
    with semantics._registry_publication(store, grouping_revision):
        pass


@pytest.mark.parametrize("promoted", [False, True])
def test_only_effective_registry_change_rebuilds_real_prefix(workspace, monkeypatch, promoted):
    from omega_vision.perception import event_deduction
    root, _ = workspace
    units = make_sequence(root, count=3)
    run_core(units)
    store = semantics._store(root)
    candidate = store.create(
        {"body": [{"predicate": "present", "args": [{"var": "Object"}]}],
         "head": {"predicate": "moved", "args": [{"var": "Object"}]}},
        kind="event_detector", scope={"domain": "visual-sequence"}, source="authored",
        provenance={"code_hash": "new-registry-fixture"}, inducer_version="prefix-replay-test",
    )
    if promoted:
        _promote_registry_fixture(store, candidate)
    original = event_deduction.deduce_sequence
    calls = []

    def replay(frames, temporal, **kwargs):
        calls.append([frame.uid for frame in frames])
        return original(frames, temporal, **kwargs)

    monkeypatch.setattr(event_deduction, "deduce_sequence", replay)
    summary, result = invoke(units[-1], semantics.EVENTS)
    assert calls == ([[semantics._frame(unit).uid for unit in units]] if promoted else [])
    revision = semantics._registry_revision(store, kinds=semantics.EVENT_RULE_KINDS)
    assert result["registryRevision"] == summary["registryRevision"] == revision
    assert result["assessment"]["provenance"]["candidate_registry"] == revision
    before = semantics._event_log(root, units[0]["sequenceId"]).read()
    replayed = semantics._replay(root, units, supersede=promoted, expected_generation=before["generation"])
    # A changed registry requires replay, not a new generation when proofs are unchanged.
    assert replayed["generation"] == before["generation"]


@pytest.mark.parametrize("stage", [semantics.EVENTS, semantics.LOG])
@pytest.mark.parametrize("promoted", [False, True])
def test_registry_race_only_blocks_effective_semantic_changes(workspace, monkeypatch, stage, promoted):
    from omega_vision.perception import event_deduction
    root, _ = workspace
    units = make_sequence(root, count=2)
    run_core(units)
    before_log = semantics._event_log(root, units[0]["sequenceId"]).read()
    output = semantics._artifact(units[-1], stage)
    before_output = output.read_bytes()
    name = "deduce_pair_events" if stage == semantics.EVENTS else "deduce_sequence"
    original = getattr(event_deduction, name)

    def concurrent_change(*args, **kwargs):
        result = original(*args, **kwargs)
        store = semantics._store(root)
        candidate = store.create(
            {"body": [{"predicate": "present", "args": [{"var": "Object"}]}],
             "head": {"predicate": "moved", "args": [{"var": "Object"}]}},
            kind="event_detector", scope={"domain": "visual-sequence"}, source="authored",
            provenance={"code_hash": "concurrent-fixture"}, inducer_version="publication-race-test",
        )
        if promoted:
            _promote_registry_fixture(store, candidate)
        return result

    monkeypatch.setattr(event_deduction, name, concurrent_change)
    if promoted:
        with pytest.raises(semantics.ConflictError, match="registry changed during deduction"):
            invoke(units[-1], stage)
        assert output.read_bytes() == before_output
    else:
        invoke(units[-1], stage)
    assert semantics._event_log(root, units[0]["sequenceId"]).read() == before_log


def test_runtime_memory_revision_ignores_disclosure_and_own_records_but_tracks_reset(workspace):
    from omega_vision.perception.memory_locations import NOWHERE
    root, client = workspace
    unit = make_sequence(root, count=1)[0]
    unit["memorySessionId"] = "runtime-revision-session"
    body = {"workspaceId": "test", "sequenceId": unit["sequenceId"], "memorySessionId": unit["memorySessionId"]}
    setup = client.get("/semantic/memory", params=body).json()
    initial = semantics.runtime_revision(unit, semantics.OBJECTS)
    preferences = deepcopy(setup["preferences"])
    preferences["expanded"] = not preferences["expanded"]
    saved = client.put("/semantic/memory/preferences", json={
        **body, "preferences": preferences, "expectedRevision": setup["preferences"]["revision"],
    })
    assert saved.status_code == 200
    assert semantics.runtime_revision(unit, semantics.OBJECTS) == initial
    preferences = saved.json()
    preferences["shape"]["saveTo"] = NOWHERE
    saved = client.put("/semantic/memory/preferences", json={
        **body, "preferences": preferences, "expectedRevision": preferences["revision"],
    })
    assert saved.status_code == 200
    rerouted = semantics.runtime_revision(unit, semantics.OBJECTS)
    assert rerouted != initial
    response = client.post("/semantic/memory/save", json={
        **body, "memorySnapshot": None, "kind": "shape", "destinationId": NOWHERE, "payload": {"uid": "revision-stable-record"},
    })
    assert response.status_code == 200
    assert semantics.runtime_revision(unit, semantics.OBJECTS) == rerouted
    assert client.post("/semantic/memory/reset", json=body).status_code == 200
    unit["memorySessionId"] = "replacement-browser-session"
    assert semantics.runtime_revision(unit, semantics.OBJECTS) != rerouted


@pytest.mark.parametrize("layout", ["recording", "pool"])
def test_actual_unit_layouts_temporal_objects_and_event_replay(workspace, layout):
    root, client = workspace
    units = make_sequence(root, layout=layout)
    if layout == "recording":
        assert units[0]["dir"] == root / "sequences" / "one" / "transforms" / "image"
        assert units[1]["dir"] == root / "sequences" / "one" / "0"
    run_core(units, grouping=True)
    first = semantics._result(units[0], semantics.TEMPORAL)
    assert first["assessment"] == "initial_observation" and "pairUid" not in first
    pair = semantics._result(units[1], semantics.TEMPORAL)
    assert pair["sourceFrameUid"] == semantics._frame(units[0]).uid
    assert len(pair["matches"]) == 2
    assert all(match["displacement"] == [2.0, 0.0] for match in pair["matches"])
    objects = semantics._result(units[-1], semantics.OBJECTS)
    assert len(objects["objects"]) == 1
    assert len(objects["objects"][0]["memberTrackUids"]) == 2
    assert objects["objects"][0]["authority"] == "authored_prolog_deduction"
    assert list((root / "runtime" / "temporal-checkpoints").glob("*.json"))
    assert not list((root / "sequences").rglob("debug_image.png"))
    assert not list((root / "sequences").rglob("todos.json"))
    response = client.get("/semantic/events", params={"workspaceId": "test", "sequenceId": units[0]["sequenceId"]})
    assert response.status_code == 200, response.text
    assert response.headers["cache-control"] == "no-store"
    log = response.json()
    assert sum(entry["kind"] == "transition_assessment" for entry in log["entries"]) == len(units) - 1
    assert log["entries"][0]["assessment"] == "initial_observation"
    assert any(entry["kind"] == "frame_event" for entry in log["entries"])
    if layout == "recording":
        action = next(entry for entry in log["entries"] if entry["kind"] == "user_action")
        assert action["direction"] == "incoming"
        assert action["from_frame"] == semantics._frame(units[0]).uid
        assert action["to_frame"] == semantics._frame(units[1]).uid
        assert action["raw_payload"]["incoming_action"] == "ACTION2"
    episodes = client.get("/semantic/events/episodes", params={"workspaceId": "test", "sequenceId": units[0]["sequenceId"]})
    assert episodes.status_code == 200
    replay = client.post("/semantic/events/replay", json={"workspaceId": "test", "sequenceId": units[0]["sequenceId"]})
    assert replay.status_code == 200 and replay.json()["generation"] == log["generation"]
    assert semantics._store(root).list(kind="grouping")
    assert all(not candidate["evidence"] for candidate in semantics._store(root).list(kind="grouping"))


def test_unordered_inputs_never_fabricate_adjacency(workspace, monkeypatch):
    root, _ = workspace
    units = make_sequence(root, ordered=False, layout="pool")
    from omega_vision.services import video_import_pipeline
    monkeypatch.setattr(video_import_pipeline, "invoke_model", lambda *args: pytest.fail("unordered model call"))
    for step in (semantics.TEMPORAL, semantics.OBJECTS, semantics.GROUPING, semantics.LLM_EVENTS):
        with pytest.raises(ValueError, match="Unordered"):
            invoke(units[0], step, {"confirmModel": True})
    assert not list((root / "runtime").rglob("*.json"))


def test_imported_arc_provenance_supplies_real_actions_timestamps_and_memory_context(workspace):
    root, client = workspace
    recording = "data/recordings/actual-game/run"
    write_json(root / "data" / "recordings" / "actual-game" / "run" / "recording.json",
               {"game_id": "actual-game-v7", "level": "7", "moves": []})
    units = make_sequence(root, name="imported", count=2, ordered=False, layout="pool",
                          provenance_recording=recording)
    assert all(unit["sequenceOrdered"] for unit in units)
    assert not (Path(units[0]["sequenceRoot"]) / "recording.json").exists()
    setup = client.get("/semantic/memory", params={"workspaceId": "test", "sequenceId": units[0]["sequenceId"]})
    assert setup.status_code == 200, setup.text
    assert setup.json()["catalog"]["context"]["gameId"] == "actual-game-v7"
    assert setup.json()["catalog"]["context"]["levelId"] == "7"
    assert setup.json()["catalog"]["context"]["runId"] == recording
    run_core(units)
    log = semantics._event_log(root, units[0]["sequenceId"]).read()
    actions = [entry for entry in log["entries"] if entry["kind"] == "user_action"]
    assert len(actions) == 1
    action = actions[0]
    assert action["direction"] == "incoming"
    assert action["from_frame"] == semantics._frame(units[0]).uid
    assert action["to_frame"] == semantics._frame(units[1]).uid
    assert action["raw_payload"] == units[1]["sourceProvenance"]["source"]
    assert action["timestamp"] == "2026-01-01T00:00:01Z"
    assert action["raw_payload"]["actionData"] == {"recorded_order": 1}
    assert action["provenance"]["recording_source"].endswith("frame_000001.provenance.json")
    previous_revision = semantics.runtime_revision(units[1], semantics.EVENTS)
    path = Path(units[1].get("sourceImage") or units[1]["image"]).with_suffix(".provenance.json")
    provenance = json.loads(path.read_text(encoding="utf-8"))
    provenance["source"]["actionData"] = {"changed": True}
    write_json(path, provenance)
    assert semantics.runtime_revision(units[1], semantics.EVENTS) != previous_revision
    with pytest.raises(semantics.ConflictError, match="provenance changed"):
        semantics._recorded_actions(units, [{"id": semantics._frame(unit).uid} for unit in units])


def test_imported_actions_reject_missing_original_frames_and_conflicting_move_receipts(workspace):
    root, _ = workspace
    units = make_sequence(root, count=2, ordered=False, layout="pool",
                          provenance_recording="data/recordings/game/run")
    path = Path(units[1].get("sourceImage") or units[1]["image"]).with_suffix(".provenance.json")
    provenance = json.loads(path.read_text(encoding="utf-8"))
    provenance["source"]["frameIndex"] = 4
    write_json(path, provenance)
    _, units = semantics._units("test", units[0]["sequenceId"])
    with pytest.raises(ValueError, match="missing or different original"):
        semantics._recorded_actions(units, [{"id": "first"}, {"id": "second"}])
    provenance["source"]["frameIndex"] = 1
    provenance["source"]["moveList"][-1]["action"] = "ACTION4"
    write_json(path, provenance)
    _, units = semantics._units("test", units[0]["sequenceId"])
    with pytest.raises(ValueError, match="contradicts"):
        semantics._recorded_actions(units, [{"id": "first"}, {"id": "second"}])


def test_imported_memory_uses_declared_namespace_without_authorizing_outside_source_paths(workspace):
    root, client = workspace
    units = make_sequence(root, count=1, ordered=False, layout="pool",
                          provenance_recording="data/recordings/missing/run")
    body = {"workspaceId": "test", "sequenceId": units[0]["sequenceId"]}
    response = client.get("/semantic/memory", params=body)
    assert response.status_code == 200, response.text
    assert response.json()["catalog"]["context"]["gameId"] == "missing"
    assert response.json()["catalog"]["context"]["levelId"] == "7"
    assert response.json()["catalog"]["context"]["runId"] == "data/recordings/missing/run"
    assert not (root / "data" / "recordings" / "missing" / "run").exists()
    path = Path(units[0].get("sourceImage") or units[0]["image"]).with_suffix(".provenance.json")
    provenance = json.loads(path.read_text(encoding="utf-8"))
    provenance["source"]["arcRecording"] = "archives/untyped-run"
    write_json(path, provenance)
    response = client.get("/semantic/memory", params=body)
    assert response.status_code == 200
    assert response.json()["catalog"]["context"]["gameId"] is None
    assert response.json()["catalog"]["context"]["levelId"] is None
    provenance["source"]["gameId"] = "explicit-game-v2"
    write_json(path, provenance)
    response = client.get("/semantic/memory", params=body)
    assert response.status_code == 200
    assert response.json()["catalog"]["context"]["gameId"] == "explicit-game-v2"
    assert response.json()["catalog"]["context"]["levelId"] == "7"
    provenance["source"]["arcRecording"] = "../../unauthorized"
    write_json(path, provenance)
    response = client.get("/semantic/memory", params=body)
    assert response.status_code in {400, 403}


def test_imported_memory_does_not_assign_one_level_to_mixed_level_frames(workspace):
    root, client = workspace
    units = make_sequence(root, count=2, ordered=False, layout="pool",
                          provenance_recording="data/recordings/ls20/attempt")
    path = Path(units[1].get("sourceImage") or units[1]["image"]).with_suffix(".provenance.json")
    provenance = json.loads(path.read_text(encoding="utf-8"))
    provenance["source"]["level"] = "8"
    write_json(path, provenance)
    response = client.get("/semantic/memory", params={"workspaceId": "test", "sequenceId": units[0]["sequenceId"]})
    assert response.status_code == 200, response.text
    assert response.json()["catalog"]["context"]["gameId"] == "ls20"
    assert response.json()["catalog"]["context"]["levelId"] is None
    assert response.json()["catalog"]["context"]["runId"] == "data/recordings/ls20/attempt"


@pytest.mark.parametrize("tamper", ["remove_seal", "change_attachment"])
def test_object_stage_seals_producer_output_and_consumers_reject_modified_artifacts(workspace, tamper):
    from omega_vision.perception.object_evidence import validate_object_result
    root, _ = workspace
    unit = make_sequence(root, count=1)[0]
    invoke(unit, semantics.TEMPORAL)
    _, result = invoke(unit, semantics.OBJECTS)
    validate_object_result(result, expected_frame_uid=semantics._frame(unit).uid)
    if tamper == "remove_seal":
        result.pop("evidenceUid")
        result.pop("evidenceVersion")
    else:
        result["compositionEvidence"]["attachments"][0]["witness"]["sharedPixels"] += 1
    write_json(semantics._artifact(unit, semantics.OBJECTS), result)
    with pytest.raises(ValueError, match="unsealed|content hash mismatch"):
        invoke(unit, semantics.EVENTS)


def test_missing_attachment_attestation_never_becomes_positive_or_complete_evidence(workspace):
    root, _ = workspace
    units = make_sequence(root, count=2, motion=0, attest=False)
    run_core(units)
    assessment = semantics._result(units[-1], semantics.EVENTS)["assessment"]
    assert assessment["assessment"] == "unknown" and not assessment["comparison_complete"]
    assert assessment["events"] == []
    assert "attachment_facts_incomplete_or_untrusted" in assessment["uncertainty"]
    examples, _ = semantics._examples(root, units, "held_out")
    assert all(not item["comparison_complete"] for item in examples)


def test_attachment_attestation_must_match_observation_metadata_hash(workspace):
    root, _ = workspace
    unit = make_sequence(root, count=1)[0]
    invoke(unit, semantics.TEMPORAL)
    _, objects = invoke(unit, semantics.OBJECTS)
    frame = semantics._frame(unit)
    context = semantics._attachment_context(unit, frame, objects)
    assert context["object_evidence_uid"] == objects["evidenceUid"]
    metadata_path = semantics._artifact(unit, semantics.PARTS, "meta.json")
    metadata = json.loads(metadata_path.read_text(encoding="utf-8"))
    metadata["attachmentEvidence"]["backgroundRolesTrusted"] = False
    write_json(metadata_path, metadata)
    with pytest.raises(ValueError, match="not anchored"):
        semantics._attachment_context(unit, frame, objects)


def test_changed_observation_dependency_and_wrong_unit_are_rejected(workspace):
    root, _ = workspace
    units = make_sequence(root, count=2)
    invoke(units[0], semantics.TEMPORAL)
    bad = dict(units[1], dir=units[0]["dir"])
    with pytest.raises(ValueError, match="directory"):
        invoke(bad, semantics.TEMPORAL)
    path = semantics._artifact(units[1], semantics.PARTS, "result.pl")
    path.write_text(path.read_text() + "\nchanged_evidence.\n", encoding="utf-8")
    with pytest.raises(ValueError, match="Stale observation"):
        invoke(units[1], semantics.TEMPORAL)


def test_semantic_reads_do_not_consume_active_or_failed_outputs(workspace):
    root, _ = workspace
    units = make_sequence(root, count=1)
    invoke(units[0], semantics.TEMPORAL)
    from omega_vision.perception._event_journal import ConflictError
    claim = semantics._artifact(units[0], semantics.TEMPORAL, "claim.json")
    write_json(claim, {"claimedAt": api._utc_now(), "claimedBy": "fixture-running"})
    with pytest.raises(ConflictError, match="rewritten"):
        semantics._result(units[0], semantics.TEMPORAL)
    claim.unlink()
    write_json(semantics._artifact(units[0], semantics.IDENTITY, ".transform-failed.json"), {"error": "failed latest attempt"})
    with pytest.raises(ValueError, match="failed latest"):
        semantics._frame(units[0])


def setup_model(monkeypatch, raw_response):
    from omega_vision.services import video_import_pipeline as pipeline
    calls = []
    monkeypatch.setattr(pipeline, "load_state", lambda _: {"allCallsModel": "test-vision"})
    monkeypatch.setattr(pipeline, "_resolved_model_records", lambda _: [{
        "document": {"id": "test-vision"},
        "resolved": {"enabled": True, "capabilities": {"vision": True}, "backend": {"id": "test-backend"}},
    }])
    monkeypatch.setattr(pipeline, "_model_execution_parameters", lambda *args: {
        "backendId": "test-backend", "model": "remote-test",
    })

    def model(root, model_id, prompt, image):
        calls.append({"root": root, "model": model_id, "prompt": prompt, "image": image})
        audits = list(root.rglob("audit/*/provenance.json"))
        assert audits and audits[-1].with_name("prompt.txt").is_file()
        return raw_response

    monkeypatch.setattr(pipeline, "invoke_model", model)
    return calls


def test_model_revision_pin_rejects_changed_configuration_before_audit_or_network(workspace, monkeypatch):
    root, _ = workspace
    calls = setup_model(monkeypatch, "")
    pipeline, model_id, provenance = semantics._model(root, "test", {"confirmModel": True})
    pin = provenance["resolved_model_hash"]
    assert semantics._model(root, "test", {"confirmModel": True, "modelRevision": pin})[1] == model_id
    records = pipeline._resolved_model_records(root)
    records[0]["resolved"]["backend"]["id"] = "edited-backend"
    monkeypatch.setattr(pipeline, "_resolved_model_records", lambda _: records)
    monkeypatch.setattr(pipeline, "_model_execution_parameters",
                        lambda *args: pytest.fail("A stale authorization must fail before execution setup"))
    for revision in (pin, None, ""):
        with pytest.raises(ValueError, match="configuration changed after authorization"):
            semantics._invoke_audited(
                root, {"workspaceId": "test", "dir": root / "unit"}, root / "unit" / "llm",
                {"confirmModel": True, "modelId": model_id, "modelRevision": revision},
                template_name="semantic_event_deduction.txt", context={}, images=[],
            )
    assert not calls and not (root / "unit").exists()


@pytest.mark.parametrize("local_vision,effective_vision,backend_vision,enabled,allowed", [
    (True, None, True, True, True),
    (False, None, True, True, False),
    (True, None, False, True, False),
    (True, None, True, False, False),
    (None, True, True, True, True),
    (True, False, True, True, False),
])
def test_actual_model_record_capabilities_respect_document_inheritance_and_backend(
    workspace, monkeypatch, local_vision, effective_vision, backend_vision, enabled, allowed,
):
    from omega_vision.services import video_import_pipeline as pipeline
    root, _ = workspace
    calls = setup_model(monkeypatch, "")
    document = {"id": "test-vision"}
    if local_vision is not None:
        document["capabilities"] = {"vision": local_vision}
    resolved = {
        "enabled": enabled, "backendId": "test-backend", "model": "remote-test",
        "configuration": {}, "defaults": {},
        "backend": {"id": "test-backend", "capabilities": ["llm.complete"] + (["llm.vision"] if backend_vision else [])},
    }
    if effective_vision is not None:
        resolved["propertyInheritanceResolution"] = {"document": {"capabilities": {"vision": effective_vision}}}
    assert "capabilities" not in resolved
    monkeypatch.setattr(pipeline, "_resolved_model_records", lambda _: [{"document": document, "resolved": resolved}])
    if allowed:
        _, identifier, provenance = semantics._model(root, "test", {"confirmModel": True})
        assert identifier == "test-vision" and provenance["backend"] == "test-backend"
        assert provenance["resolved_model_hash"] == content_hash(resolved)
    else:
        with pytest.raises(ValueError, match="vision|disabled"):
            semantics._model(root, "test", {"confirmModel": True})
    assert not calls and not list(root.rglob("audit"))


def test_llm_uses_real_preprocessed_pair_and_persists_raw_before_validation(workspace, monkeypatch):
    root, client = workspace
    units = make_sequence(root, count=2)
    run_core(units)
    raw = '{"assessment":"unknown","comparison_complete":false,"confidence":0,"evidence":[],"uncertainty":["insufficient"],"events":[]}'
    calls = setup_model(monkeypatch, raw)
    invoke(units[0], semantics.LLM_EVENTS)
    assert not calls
    with pytest.raises(ValueError, match="confirmation"):
        invoke(units[1], semantics.LLM_EVENTS)
    assert not calls
    revision = semantics._model(root, "test", {"confirmModel": True})[2]["resolved_model_hash"]
    _, result = invoke(units[1], semantics.LLM_EVENTS, {"confirmModel": True, "modelRevision": revision})
    assert result["parsed"]["authoritative"] is False
    assert len(calls) == 1
    assert "turtle_program(g1" in calls[0]["prompt"]
    assert "ACTION2" in calls[0]["prompt"] and '"direction": "incoming"' in calls[0]["prompt"]
    assert calls[0]["image"].startswith("data:image/png;base64,")
    provenance = result["parsed"]["provenance"]
    assert (root / provenance["raw_output_ref"]).read_text() == raw
    assert (root / provenance["prompt_ref"]).read_text() == calls[0]["prompt"]
    before = semantics._event_log(root, units[0]["sequenceId"]).read()
    calls = setup_model(monkeypatch, "this is not json :- shell('no').")
    with pytest.raises(ValueError):
        invoke(units[1], semantics.LLM_EVENTS, {"confirmModel": True})
    assert calls
    assert any(path.read_text() == "this is not json :- shell('no')." for path in root.rglob("raw-response.txt"))
    assert semantics._event_log(root, units[0]["sequenceId"]).read() == before
    response = client.get("/semantic/events/hypotheses", params={"workspaceId": "test", "sequenceId": units[0]["sequenceId"]})
    assert response.status_code == 200
    assert any(item.get("status") == "invalid" for item in response.json()["hypotheses"])


def test_event_candidate_induction_evaluation_promotion_and_rejection(workspace):
    root, client = workspace
    train = make_sequence(root, name="train", seed=10)
    held = make_sequence(root, name="held", seed=20)
    run_core(train)
    run_core(held)
    _, proposals = invoke(train[-1], semantics.INDUCTION)
    assert proposals["candidateIds"]
    store = semantics._store(root)
    detector = next(item for item in store.list(kind="event_detector") if item["rule"]["head"]["predicate"] == "moved")
    candidate_id = detector["candidate_id"]
    path = f"/semantic/candidates/{candidate_id}"
    rejected = client.post(path + "/promote", json={"workspaceId": "test"})
    assert rejected.status_code == 422 and "promotion blocked" in rejected.text
    overlap = client.post(path + "/evaluate", json={
        "workspaceId": "test", "sequences": [{"sequenceId": train[0]["sequenceId"], "partition": "held_out"}],
    })
    assert overlap.status_code == 422 and "overlaps" in overlap.text
    evaluated = client.post(path + "/evaluate", json={
        "workspaceId": "test", "sequences": [
            {"sequenceId": train[0]["sequenceId"], "partition": "train"},
            {"sequenceId": held[0]["sequenceId"], "partition": "held_out"},
        ],
    })
    assert evaluated.status_code == 200, evaluated.text
    promoted = client.post(path + "/promote", json={"workspaceId": "test"})
    assert promoted.status_code == 200, promoted.text
    assert promoted.json()["requiresReplay"]
    assert (root / "design" / "event-rules" / f"{candidate_id}.json").is_file()
    # Typed promoted rules are replayed in the real deduction adapter.
    _, replay = invoke(held[1], semantics.EVENTS)
    assert candidate_id in replay["learned_rule_replay"]["accepted_detectors"]
    evidence = client.get(path + "/evidence", params={"workspaceId": "test"})
    assert evidence.status_code == 200 and evidence.json()["evidence"]
    rejected = client.post(path + "/reject", json={"workspaceId": "test", "reviewer": "tester", "reason": "withdraw"})
    assert rejected.status_code == 200 and rejected.json()["status"] == "rejected"
    _, replay = invoke(held[1], semantics.EVENTS)
    assert candidate_id not in replay["learned_rule_replay"]["accepted_detectors"]


def test_memory_setup_explicit_refresh_rebuilds_metadata_without_saving_preferences(workspace, monkeypatch):
    from omega_vision.perception.memory_locations import MemoryLocations
    root, client = workspace
    units = make_sequence(root, count=1)
    calls = []
    original = MemoryLocations._discovered

    def track(self, mount, **kwargs):
        calls.append(mount.root)
        yield from original(self, mount, **kwargs)

    monkeypatch.setattr(MemoryLocations, "_discovered", track)
    body = {"workspaceId": "test", "sequenceId": units[0]["sequenceId"]}
    assert client.post("/semantic/memory/setup", json=body).status_code == 200
    initial = len(calls)
    assert client.post("/semantic/memory/setup", json=body).status_code == 200
    assert len(calls) == initial
    assert client.post("/semantic/memory/setup", json={**body, "refresh": True}).status_code == 200
    assert len(calls) > initial
    assert client.post("/semantic/memory/setup", json={**body, "refresh": "true"}).status_code == 422
    assert not (root / "runtime" / "memory-settings").exists()


def test_memory_contract_independent_destinations_and_browser_volatile(workspace):
    root, client = workspace
    units = make_sequence(root, count=1)
    body = {"workspaceId": "test", "sequenceId": units[0]["sequenceId"]}
    response = client.get("/semantic/memory", params=body)
    assert response.status_code == 200, response.text
    result = response.json()
    assert response.headers["cache-control"] == "no-store"
    preferences = deepcopy(result["preferences"])
    from omega_vision.perception.memory_locations import NOWHERE
    preferences["shape"]["saveTo"] = NOWHERE
    saved = client.put("/semantic/memory/preferences", json={
        **body, "preferences": preferences, "expectedRevision": result["preferences"]["revision"],
    })
    assert saved.status_code == 200
    assert saved.json()["shape"]["saveTo"] == NOWHERE
    assert saved.json()["object"]["saveTo"] == preferences["object"]["saveTo"]
    conflict = client.put("/semantic/memory/preferences", json={
        **body, "preferences": result["preferences"], "expectedRevision": result["preferences"]["revision"],
    })
    assert conflict.status_code == 409
    before = {str(path) for path in root.rglob("*.memory.json")}
    payload = {"uid": "shape-original", "name": "real user-authored shape"}
    volatile = client.post("/semantic/memory/save", json={
        **body, "memorySessionId": "browser-page-test", "memorySnapshot": None,
        "kind": "shape", "destinationId": NOWHERE, "payload": payload,
    })
    assert volatile.status_code == 200 and volatile.json()["volatile"] is True
    assert {str(path) for path in root.rglob("*.memory.json")} == before
    loaded = client.post("/semantic/memory/read", json={
        **body, "memorySessionId": "browser-page-test", "memorySnapshot": volatile.json()["memorySnapshot"],
        "kind": "shape", "locationIds": [NOWHERE],
    })
    assert loaded.status_code == 200 and len(loaded.json()["records"]) == 1
    reloaded = client.post("/semantic/memory/read", json={**body, "kind": "shape", "locationIds": [NOWHERE]})
    assert reloaded.status_code == 200 and reloaded.json()["records"] == []
    location = next(item["memoryLocationId"] for item in result["catalog"]["destinations"]
                    if item["memoryKinds"] == ["shape"] and item["capabilities"]["write"])
    disk = client.post("/semantic/memory/save", json={**body, "kind": "shape", "destinationId": location, "payload": payload})
    assert disk.status_code == 200, disk.text
    assert list(root.rglob("*.memory.json"))
    copied = client.post("/semantic/memory/copy", json={
        **body, "memorySessionId": "browser-page-test", "memorySnapshot": None,
        "kind": "shape", "sourceLocationId": location,
        "recordUid": disk.json()["record"]["recordUid"], "destinationId": NOWHERE,
    })
    assert copied.status_code == 200 and copied.json()["record"]["origin"]["recordUid"] == disk.json()["record"]["recordUid"]
    bad = client.post("/semantic/memory/save", json={
        **body, "kind": "shape", "destinationId": preferences["object"]["saveTo"], "payload": payload,
    })
    assert bad.status_code == 403
    bad = client.post("/semantic/memory/read", json={
        **body, "kind": "shape", "locationIds": ["../../not-authorized"],
    })
    assert bad.status_code == 422
    bad = client.post("/semantic/memory/save", json={
        **body, "kind": "shape", "destinationId": NOWHERE, "payload": payload, "workspaceRoot": str(root),
    })
    assert bad.status_code == 422


def test_missing_resources_return_explicit_errors(workspace):
    _, client = workspace
    assert client.get("/semantic/candidates/missing", params={"workspaceId": "test"}).status_code == 404
    assert client.get("/semantic/memory", params={"workspaceId": "not-authorized"}).status_code == 404
    assert client.get("/semantic/events", params={"workspaceId": "test", "sequenceId": "missing"}).status_code == 404


def test_memory_sessions_require_browser_snapshot_without_server_or_disk_retention(workspace):
    from omega_vision.perception.memory_locations import NOWHERE
    root, client = workspace
    units = make_sequence(root, count=1)
    selection = {"workspaceId": "test", "sequenceId": units[0]["sequenceId"]}
    a = {**selection, "memorySessionId": "browser-session-aaaa"}
    b = {**selection, "memorySessionId": "browser-session-bbbb"}
    setup = client.get("/semantic/memory", params=a)
    assert setup.status_code == 200 and setup.headers["cache-control"] == "no-store"
    assert setup.json()["catalog"]["context"]["gameId"] == "fixture-game"
    assert setup.json()["catalog"]["context"]["levelId"] == "1"
    assert setup.json()["catalog"]["context"]["runId"] == units[0]["sequenceId"]
    original = client.post("/semantic/memory/save", json={
        **a, "memorySnapshot": None, "kind": "shape", "destinationId": NOWHERE, "payload": {"uid": "shape-session-only"},
    })
    assert original.status_code == 200, original.text
    assert original.headers["cache-control"] == "no-store"
    record = original.json()["record"]
    snapshot = original.json()["memorySnapshot"]
    for _ in range(2):
        read = client.post("/semantic/memory/read", json={
            **a, "memorySnapshot": snapshot, "kind": "shape", "locationIds": [NOWHERE],
        })
        assert read.status_code == 200, read.text
        assert read.json()["records"][0]["preferred"] == record
    other = client.post("/semantic/memory/read", json={**b, "kind": "shape", "locationIds": [NOWHERE]})
    assert other.json()["records"] == []
    assert client.post("/semantic/memory/read", json={**a, "kind": "shape", "locationIds": [NOWHERE]}).json()["records"] == []
    assert not hasattr(semantics, "_MEMORY_LEASES")
    counts = client.post("/semantic/memory/setup", json={**a, "memorySnapshot": snapshot}).json()["catalog"]["locations"]
    assert next(item for item in counts if item["memoryLocationId"] == NOWHERE)["counts"]["shape"] == 1
    assert not list(root.rglob("*.memory.json"))
    assert not list((root / "runtime").glob("*checkpoints*"))
    destination = setup.json()["preferences"]["shape"]["saveTo"]
    blocked_copy = client.post("/semantic/memory/copy", json={
        **b, "memorySnapshot": None, "kind": "shape", "sourceLocationId": NOWHERE,
        "recordUid": record["recordUid"], "destinationId": destination,
    })
    assert blocked_copy.status_code == 404
    copied = client.post("/semantic/memory/copy", json={
        **a, "memorySnapshot": snapshot, "kind": "shape", "sourceLocationId": NOWHERE,
        "recordUid": record["recordUid"], "destinationId": destination,
    })
    assert copied.status_code == 200, copied.text
    assert copied.json()["record"]["origin"]["recordUid"] == record["recordUid"]
    assert list(root.rglob("*.memory.json"))
    reset = client.post("/semantic/memory/reset", json=a)
    assert reset.status_code == 200 and reset.json()["requiresNewSession"] is True
    assert reset.headers["cache-control"] == "no-store"
    after = client.post("/semantic/memory/read", json={**a, "kind": "shape", "locationIds": [NOWHERE]})
    assert after.status_code == 200 and after.json()["records"] == []
    assert after.headers["cache-control"] == "no-store"
    persistent = client.post("/semantic/memory/read", json={**b, "kind": "shape", "locationIds": [destination]})
    assert persistent.status_code == 200 and len(persistent.json()["records"]) == 1
    invalid = client.get("/semantic/memory", params={**selection, "memorySessionId": "../../arbitrary"})
    assert invalid.status_code == 422
    bypass = client.post("/semantic/memory/read", json={
        **b, "kind": "shape", "locationIds": [NOWHERE], "memorySnapshot": snapshot,
    })
    assert bypass.status_code == 422


def _nowhere_consumer_memory(*sequences):
    from omega_vision.perception.memory_locations import BrowserMemory, NOWHERE
    state = BrowserMemory("test", "consumer-browser-session")
    for units in sequences:
        locations, context = semantics._memory("test", units[0]["sequenceId"])
        preferences = locations.load_preferences(context)
        for kind in ("shape", "object"):
            preferences[kind].update(saveTo=NOWHERE, lookIn=[NOWHERE])
        locations.save_preferences(context, preferences, expected_revision=preferences["revision"])
        for unit in units:
            unit.update(memorySessionId=state.session_id, _browserMemory=state)
    return state


def _assert_consumer_receipts_only(root, state):
    forbidden = []
    for output in state.outputs.values():
        forbidden.extend(json.dumps(value, sort_keys=True) for value in (
            output["result"], output["result"]["checkpoint"],
        ))
    for path in root.rglob("*.json"):
        encoded = json.dumps(json.loads(path.read_text(encoding="utf-8")), sort_keys=True)
        assert '"memorySnapshot"' not in encoded and '"snapshotUid"' not in encoded, path
        assert all(contents not in encoded for contents in forbidden), path
    assert not list(root.rglob("*.memory.json"))


def test_nowhere_replay_and_event_evaluation_require_browser_owned_sealed_results(workspace, monkeypatch):
    import gc
    import weakref
    from omega_vision.perception.memory_locations import BrowserMemory
    root, client = workspace
    train = make_sequence(root, name="consumer-train", seed=11, count=3)
    held = make_sequence(root, name="consumer-held", seed=21, count=3)
    state = _nowhere_consumer_memory(train, held)
    run_core(train)
    run_core(held)
    invoke(train[-1], semantics.INDUCTION)
    detector = next(item for item in semantics._store(root).list(kind="event_detector")
                    if item["rule"]["head"]["predicate"] == "moved")
    snapshot = state.to_wire()
    transport = {"memorySessionId": state.session_id, "memorySnapshot": snapshot}
    parsed, attached = [], []
    parse, resolve = semantics.browser_memory, semantics._consumer_units

    def observe_parse(body):
        request_state = parse(body)
        if request_state is not None:
            parsed.append(weakref.ref(request_state))
        return request_state

    def observe_units(workspace_id, sequence_id, request_state):
        root, units = resolve(workspace_id, sequence_id, request_state)
        if request_state is not None:
            attached.extend((unit["sequenceId"], weakref.ref(unit["_browserMemory"])) for unit in units)
        return root, units

    monkeypatch.setattr(semantics, "browser_memory", observe_parse)
    monkeypatch.setattr(semantics, "_consumer_units", observe_units)
    actions = [
        ("/semantic/events/replay", {"workspaceId": "test", "sequenceId": held[0]["sequenceId"]}),
        (f"/semantic/candidates/{detector['candidate_id']}/evaluate", {
            "workspaceId": "test", "sequences": [
                {"sequenceId": train[0]["sequenceId"], "partition": "train"},
                {"sequenceId": held[0]["sequenceId"], "partition": "held_out"},
            ],
        }),
    ]
    for path, body in actions:
        for missing in ({}, {"memorySessionId": state.session_id}, {
            "memorySessionId": state.session_id, "memorySnapshot": None,
        }):
            blocked = client.post(path, json={**body, **missing})
            assert blocked.status_code == 409 and "current browser snapshot" in blocked.text
        invalid = client.post(path, json={**body, **transport, "memorySessionId": "different-browser-session"})
        assert invalid.status_code == 422 and "another workspace or page session" in invalid.text
        parsed.clear()
        attached.clear()
        accepted = client.post(path, json={**body, **transport})
        assert accepted.status_code == 200, accepted.text
        assert accepted.headers["cache-control"] == "no-store"
        assert "memorySnapshot" not in accepted.json()
        assert len(parsed) == 1 and attached
        assert all(reference is parsed[0] for _, reference in attached)
        expected = {row["sequenceId"] for row in body["sequences"]} if "sequences" in body else {body["sequenceId"]}
        assert {sequence for sequence, _ in attached} == expected
        gc.collect()
        assert parsed[0]() is None  # No request working copy survives in server registries.
        blocked = client.post(path, json={**body, "memorySessionId": state.session_id})
        assert blocked.status_code == 409, blocked.text
    partial = BrowserMemory("test", state.session_id, snapshot)
    partial.outputs = {key: value for key, value in partial.outputs.items()
                       if json.loads(key)[0] != held[0]["sequenceId"]}
    blocked = client.post(actions[1][0], json={
        **actions[1][1], "memorySessionId": state.session_id, "memorySnapshot": partial.to_wire(),
    })
    assert blocked.status_code == 409 and "current browser snapshot" in blocked.text
    assert state.to_wire() == snapshot
    _assert_consumer_receipts_only(root, state)


def test_nowhere_grouping_evaluation_and_distinct_deployment_consume_browser_checkpoint(workspace):
    root, client = workspace
    train = make_sequence(root, name="consumer-group-train", seed=31, count=1)
    held = make_sequence(root, name="consumer-group-held", seed=61, count=1)
    state = _nowhere_consumer_memory(train, held)
    invoke(train[0], semantics.GROUPING)
    parent = semantics._store(root).list(kind="grouping")[0]
    checkpoint = semantics._result(train[0], semantics.GROUPING)["checkpoint"]
    anchor_uid = parent["rule"]["head"]["args"][1]
    anchor = next(item for item in checkpoint["anchors"] if item["uid"] == anchor_uid)
    frame = semantics._frame(held[0])
    group = next(group for group in frame.groups if len(group.points) == len(anchor["canonicalPoints"]))
    snapshot = state.to_wire()
    transport = {"memorySessionId": state.session_id, "memorySnapshot": snapshot}
    path = f"/semantic/candidates/{parent['candidate_id']}"
    actions = [
        (path + "/evaluate", {
            "workspaceId": "test", "trainingSequenceId": train[0]["sequenceId"],
            "sequenceId": held[0]["sequenceId"], "partition": "held_out",
            "labels": [{"frameUid": frame.uid, "groupUid": group.uid, "anchorUid": anchor_uid,
                        "expectedTemplateMatch": True, "reviewer": "independent reviewer",
                        "reason": "Inspected original held-out producer masks"}],
        }),
        (path + "/deployment", {
            "workspaceId": "test", "trainingSequenceId": train[0]["sequenceId"],
            "reviewer": "independent reviewer", "reason": "Create a separately evaluated deployment",
        }),
    ]
    for url, body in actions:
        for missing in ({}, {"memorySessionId": state.session_id}):
            blocked = client.post(url, json={**body, **missing})
            assert blocked.status_code == 409 and "current browser snapshot" in blocked.text
        accepted = client.post(url, json={**body, **transport})
        assert accepted.status_code == 200, accepted.text
        assert accepted.headers["cache-control"] == "no-store"
        assert "memorySnapshot" not in accepted.json()
        if url.endswith("/deployment"):
            deployment = accepted.json()["candidate"]
            assert deployment["status"] == "proposed" and deployment["parent_ids"] == [parent["candidate_id"]]
            assert deployment["evidence"] == deployment["evaluations"] == []
        else:
            assert accepted.json()["observations"][0]["outcome"] == "support"
        blocked = client.post(url, json={**body, "memorySessionId": state.session_id})
        assert blocked.status_code == 409, blocked.text
    assert state.to_wire() == snapshot
    _assert_consumer_receipts_only(root, state)


def test_generated_nowhere_memory_is_not_a_persistent_object_or_grouping_cache(workspace):
    from omega_vision.perception.memory_locations import BrowserMemory, NOWHERE
    root, client = workspace
    units = make_sequence(root, count=3)
    body = {"workspaceId": "test", "sequenceId": units[0]["sequenceId"], "memorySessionId": "stage-memory-session"}
    setup = client.get("/semantic/memory", params=body).json()
    preferences = deepcopy(setup["preferences"])
    preferences["shape"]["saveTo"] = preferences["object"]["saveTo"] = NOWHERE
    saved = client.put("/semantic/memory/preferences", json={
        **body, "preferences": preferences, "expectedRevision": setup["preferences"]["revision"],
    })
    assert saved.status_code == 200, saved.text
    assert saved.headers["cache-control"] == "no-store"
    invoke(units[0], semantics.TEMPORAL)
    with pytest.raises(ValueError, match="memorySessionId"):
        invoke(units[0], semantics.OBJECTS)
    assert not semantics._artifact(units[0], semantics.OBJECTS).exists()
    offline_unit = {**units[0], "memorySessionId": "unopened-offline-token"}
    with pytest.raises(ValueError, match="explicit browser memory snapshot"):
        invoke(offline_unit, semantics.OBJECTS)
    state = BrowserMemory("test", body["memorySessionId"])
    for unit in units:
        unit["memorySessionId"] = body["memorySessionId"]
        unit["_browserMemory"] = state
        invoke(unit, semantics.TEMPORAL)
        objects, _ = invoke(unit, semantics.OBJECTS)
        grouping, _ = invoke(unit, semantics.GROUPING)
        assert objects["memory"]["object"]["volatile"] is True
        assert grouping["memory"]["shape"]["volatile"] is True
    assert not list(root.rglob("*.memory.json"))
    assert not (root / "runtime" / "object-checkpoints").exists()
    assert not (root / "runtime" / "grouping-checkpoints").exists()
    for unit in units:
        for step in (semantics.OBJECTS, semantics.GROUPING):
            assert not semantics._artifact(unit, step, "checkpoint.json").exists()
            receipt = json.loads(semantics._artifact(unit, step).read_text())
            assert set(receipt) == {"schemaVersion", "storage", "resultHash", "checkpointHash"}
            assert receipt["storage"] == "browser_session"
            assert "persistent_object(" not in semantics._artifact(unit, step, "result.pl").read_text()
    assert semantics._store(root).list(kind="grouping")
    snapshot = state.to_wire()
    objects = client.post("/semantic/memory/read", json={
        **body, "memorySnapshot": snapshot, "kind": "object", "locationIds": [NOWHERE],
    })
    assert objects.status_code == 200, objects.text
    assert objects.json()["records"]
    payload = objects.json()["records"][0]["preferred"]["payload"]
    assert len(payload["memberTrackUids"]) == 2 and payload["shapeReferences"]
    assert all(ref["memoryLocationId"] == NOWHERE for ref in payload["shapeReferences"])
    new_session = client.get("/semantic/memory", params={**body, "memorySessionId": "fresh-browser-session"})
    assert new_session.status_code == 200
    assert all(not location["counts"]["object"] for location in new_session.json()["catalog"]["locations"])
    assert client.post("/semantic/memory/reset", json=body).status_code == 200
    units[-1].pop("_browserMemory")
    with pytest.raises(ValueError, match="explicit browser memory snapshot"):
        invoke(units[-1], semantics.OBJECTS)
    units[-1]["_browserMemory"] = BrowserMemory("test", "new-browser-session")
    with pytest.raises(semantics.ConflictError, match="current browser snapshot"):
        semantics._result(units[-1], semantics.OBJECTS)


@pytest.mark.parametrize(("stage", "kind", "selection"), [
    (semantics.OBJECTS, "shape", "saveTo"),
    (semantics.OBJECTS, "object", "saveTo"),
    (semantics.OBJECTS, "shape", "lookIn"),
    (semantics.GROUPING, "shape", "saveTo"),
    (semantics.GROUPING, "shape", "lookIn"),
])
def test_pooler_cannot_borrow_even_an_existing_api_memory_lease(workspace, stage, kind, selection):
    from omega_vision.perception.memory_locations import NOWHERE
    root, client = workspace
    unit = make_sequence(root, count=1)[0]
    token = "existing-api-page-session"
    assert client.get("/semantic/memory", params={"workspaceId": "test", "memorySessionId": token}).status_code == 200
    unit = {**unit, "memorySessionId": token, "executionMode": "pooler"}
    locations, context = semantics._memory("test", unit["sequenceId"])
    original = locations.load_preferences(context)
    preferences = deepcopy(original)
    preferences[kind][selection] = NOWHERE if selection == "saveTo" else [NOWHERE]
    changed = locations.save_preferences(context, preferences, expected_revision=original["revision"])
    invoke(unit, semantics.TEMPORAL)
    with pytest.raises(semantics.ConflictError, match="Run now/direct"):
        invoke(unit, stage)
    assert not semantics._artifact(unit, stage).exists()
    assert not list(root.rglob("*.memory.json"))
    assert not hasattr(semantics, "_MEMORY_LEASES")
    locations.save_preferences(context, original, expected_revision=changed["revision"])
    invoke(unit, stage)
    assert list(root.rglob("*.memory.json"))


@pytest.mark.parametrize(("shape_nowhere", "object_nowhere"), [(True, False), (False, True), (True, True), (False, False)])
def test_independent_destinations_and_request_roundtrip_never_spill_nowhere_checkpoints(
    workspace, shape_nowhere, object_nowhere,
):
    from omega_vision.perception.memory_locations import BrowserMemory, NOWHERE
    root, _ = workspace
    units = make_sequence(root, count=3)
    locations, context = semantics._memory("test", units[0]["sequenceId"])
    preferences = locations.load_preferences(context)
    for kind, nowhere in (("shape", shape_nowhere), ("object", object_nowhere)):
        if nowhere:
            preferences[kind]["saveTo"] = NOWHERE
        preferences[kind]["lookIn"] = [NOWHERE] if nowhere else []
    locations.save_preferences(context, preferences, expected_revision=preferences["revision"])
    wire = None
    for unit in units:
        state = BrowserMemory("test", "browser-destination-test", wire)
        unit.update(memorySessionId=state.session_id, _browserMemory=state)
        invoke(unit, semantics.TEMPORAL)
        invoke(unit, semantics.OBJECTS)
        invoke(unit, semantics.GROUPING)
        wire = state.to_wire()
        for step, transient in ((semantics.OBJECTS, shape_nowhere or object_nowhere), (semantics.GROUPING, shape_nowhere)):
            receipt = json.loads(semantics._artifact(unit, step).read_text())
            assert (receipt.get("storage") == "browser_session") == transient
            assert semantics._artifact(unit, step, "checkpoint.json").exists() != transient
        if object_nowhere:
            for path in Path(unit["dir"]).rglob("*.json"):
                assert '"memberTrackUids"' not in path.read_text(), path
    persisted = [json.loads(path.read_text()) for path in root.rglob("*.memory.json")]
    assert {item["memoryKind"] for item in persisted} == {
        kind for kind, nowhere in (("shape", shape_nowhere), ("object", object_nowhere)) if not nowhere
    }
    if shape_nowhere:
        for path in root.rglob("*.json"):
            assert '"canonicalPoints"' not in path.read_text(), path
            assert '"prototype-revision"' not in path.read_text(), path


def test_nowhere_future_runs_preserve_but_do_not_reuse_older_disk_checkpoints(workspace):
    from omega_vision.perception.memory_locations import BrowserMemory, NOWHERE
    root, _ = workspace
    units = make_sequence(root, count=2)
    for unit in units:
        invoke(unit, semantics.TEMPORAL)
        invoke(unit, semantics.OBJECTS)
    old = {semantics._artifact(unit, semantics.OBJECTS, "checkpoint.json"):
           semantics._artifact(unit, semantics.OBJECTS, "checkpoint.json").read_bytes() for unit in units}
    locations, context = semantics._memory("test", units[0]["sequenceId"])
    preferences = locations.load_preferences(context)
    preferences["object"]["saveTo"] = NOWHERE
    locations.save_preferences(context, preferences, expected_revision=preferences["revision"])
    state = BrowserMemory("test", "browser-preserve-old")
    units[-1].update(memorySessionId=state.session_id, _browserMemory=state)
    with pytest.raises(semantics.ConflictError, match="older disk checkpoint"):
        invoke(units[-1], semantics.OBJECTS)
    for unit in units:
        unit.update(memorySessionId=state.session_id, _browserMemory=state)
        invoke(unit, semantics.OBJECTS)
    assert all(path.read_bytes() == original for path, original in old.items())


def test_generated_shape_and_object_destinations_stay_independent(workspace):
    root, client = workspace
    units = make_sequence(root, count=2)
    body = {"workspaceId": "test", "sequenceId": units[0]["sequenceId"]}
    setup = client.get("/semantic/memory", params=body).json()
    preferences = deepcopy(setup["preferences"])
    preferences["shape"]["saveTo"] = next(
        item["memoryLocationId"] for item in setup["catalog"]["destinations"]
        if item["scopeKind"] == "global" and item["memoryKinds"] == ["shape"]
    )
    response = client.put("/semantic/memory/preferences", json={
        **body, "preferences": preferences, "expectedRevision": setup["preferences"]["revision"],
    })
    assert response.status_code == 200, response.text
    for unit in units:
        invoke(unit, semantics.TEMPORAL)
        summary, _ = invoke(unit, semantics.OBJECTS)
    assert summary["memory"]["shape"]["destinationId"] == preferences["shape"]["saveTo"]
    assert summary["memory"]["object"]["destinationId"] == preferences["object"]["saveTo"]
    result = client.post("/semantic/memory/read", json={
        **body, "kind": "object", "locationIds": [preferences["object"]["saveTo"]],
    })
    assert result.status_code == 200, result.text
    obj = result.json()["records"][0]["preferred"]
    assert obj["source"]["memoryLocationId"] == preferences["object"]["saveTo"]
    assert obj["payload"]["shapeReferences"]
    for reference in obj["payload"]["shapeReferences"]:
        assert reference["memoryLocationId"] == preferences["shape"]["saveTo"]
        shape = client.post("/semantic/memory/read", json={
            **body, "kind": "shape", "locationIds": [reference["memoryLocationId"]],
        })
        assert any(version["recordUid"] == reference["recordUid"] and version["revision"] == reference["revision"]
                   for item in shape.json()["records"] for version in item["versions"])
    assert not (root / "runtime" / "object-checkpoints").exists()


def test_real_opencv_prolog_observation_outputs_feed_semantic_stages(workspace, monkeypatch):
    root, _ = workspace
    sequence = root / "sequences" / "actual-extractor"
    write_json(sequence / "recording.json", {"game_id": "measured", "moves": []})
    for index, directory in enumerate((sequence, sequence / "0")):
        directory.mkdir(parents=True, exist_ok=True)
        image = Image.new("RGB", (40, 30), "black")
        ImageDraw.Draw(image).rectangle((4 + index * 2, 5, 10 + index * 2, 15), fill="yellow")
        image.save(directory / "image.png")
    _, units = semantics._units("test", "sequences/actual-extractor")
    write_json(sequence / "preprocessing_chain.json", {
        "steps": [{"stepId": "scale", "entryId": "scale_3x_nearest", "params": {}}],
    })
    for unit in units:
        prepared = semantics._prepare(unit)
        for step in (semantics.PARTS, semantics.GROUPS, semantics.ACCEPTANCE, semantics.IDENTITY, semantics.TURTLE):
            transformation, doer = step.split("/")
            result = api.run_transform_step(prepared, transformation, doer, {}, force=True)
            assert result["status"] == "written", result
        invoke(unit, semantics.TEMPORAL)
        invoke(unit, semantics.OBJECTS)
        invoke(unit, semantics.EVENTS)
        invoke(unit, semantics.LOG)
    pair = semantics._result(units[1], semantics.TEMPORAL)
    assert pair["matches"]
    assert pair["sourceHashes"]["partsFacts"] == content_hash(semantics._artifact(units[0], semantics.PARTS, "result.pl").read_bytes())
    assert semantics._frame(units[1]).groups
    assert (semantics._frame(units[1]).width, semantics._frame(units[1]).height) == (40, 30)
    raw = '{"assessment":"unknown","comparison_complete":false,"confidence":0,"evidence":[],"uncertainty":["insufficient"],"events":[]}'
    calls = setup_model(monkeypatch, raw)
    invoke(units[1], semantics.LLM_EVENTS, {"confirmModel": True})
    from base64 import b64decode
    from io import BytesIO
    with Image.open(BytesIO(b64decode(calls[0]["image"].split(",", 1)[1]))) as sheet:
        assert sheet.size == (240, 122)
        assert sheet.convert("RGB").getpixel((18, 50)) == (255, 255, 0)


def test_grouping_review_replays_actual_held_out_masks_before_promotion(workspace, monkeypatch):
    from dataclasses import replace
    root, client = workspace
    train = make_sequence(root, name="group-train", seed=30, count=2)
    held = make_sequence(root, name="group-held", seed=60, count=2)
    for units in (train, held):
        locations, context = semantics._memory("test", units[0]["sequenceId"])
        preferences = locations.load_preferences(context)
        destination = next(item["memoryLocationId"] for item in locations.catalog(context)["destinations"]
                           if item["scopeKind"] == "global" and item["memoryKinds"] == ["shape"])
        preferences["shape"]["saveTo"] = destination
        preferences["shape"]["lookIn"] = [destination]
        locations.save_preferences(context, preferences, expected_revision=preferences["revision"])
    for units in (train, held):
        for unit in units:
            invoke(unit, semantics.TEMPORAL)
            if units is train:
                invoke(unit, semantics.GROUPING)
    store = semantics._store(root)
    candidate = store.list(kind="grouping")[0]
    checkpoint = semantics._result(train[-1], semantics.GROUPING)["checkpoint"]
    anchor_uid = candidate["rule"]["head"]["args"][1]
    anchor = next(item for item in checkpoint["anchors"] if item["uid"] == anchor_uid)
    path = f"/semantic/candidates/{candidate['candidate_id']}"
    _, before = invoke(held[0], semantics.GROUPING)
    assert before["templateInference"]["applications"] == []
    assert before["persistedCandidates"] == [] and before["deferredCandidates"]
    assert store.get(candidate["candidate_id"]) == candidate
    for partition, units in (("train", train), ("held_out", held)):
        frame = semantics._frame(units[0])
        group = next(group for group in frame.groups if len(group.points) == len(anchor["canonicalPoints"]))
        response = client.post(path + "/evaluate", json={
            "workspaceId": "test", "trainingSequenceId": train[0]["sequenceId"],
            "sequenceId": units[0]["sequenceId"], "partition": partition,
            "labels": [{"frameUid": frame.uid, "groupUid": group.uid, "anchorUid": anchor_uid,
                        "expectedTemplateMatch": True, "reviewer": "test reviewer",
                        "reason": "Inspected original pixels and independently matched the frozen template"}],
        })
        assert response.status_code == 200, response.text
        assert response.json()["observations"][0]["outcome"] == "support"
    previous_revision = semantics.runtime_revision(train[-1], semantics.GROUPING)
    result = client.post(path + "/promote", json={"workspaceId": "test"})
    assert result.status_code == 200, result.text
    assert result.json()["promotion"]["status"] == "promoted"
    assert semantics.runtime_revision(train[-1], semantics.GROUPING) != previous_revision
    assert list((root / "runtime" / "grouping-reviews").glob("*.json"))
    frozen = store.get(candidate["candidate_id"])
    execution_revision = semantics.runtime_revision(held[0], semantics.GROUPING)
    summary, after = invoke(held[0], semantics.GROUPING)
    assert after["registryRevision"]["kinds"] == ["grouping"]
    applied = [row for row in after["templateInference"]["applications"] if row["status"] == "applied"]
    assert summary["appliedTemplateCount"] == 1 and len(applied) == 1
    assert applied[0]["candidateId"] == candidate["candidate_id"]
    assert applied[0]["anchorReferences"] and applied[0]["prototypeReferences"]
    assert applied[0]["evidenceIds"] and applied[0]["dependsOnCandidates"] == [candidate["candidate_id"]]
    assert applied[0]["dependsOnPrototypes"] and applied[0]["ruleEngineVersion"]
    assert any(term["predicate"] == "independent_group_support" for term in applied[0]["facts"])
    assert any(row["appliedTemplates"] for row in after["observations"])
    assert "grouping_template_candidate(" in semantics._artifact(held[0], semantics.GROUPING, "result.pl").read_text()
    assert store.get(candidate["candidate_id"]) == frozen
    assert semantics.runtime_revision(held[0], semantics.GROUPING) == execution_revision
    summary, unreviewed = invoke(held[1], semantics.GROUPING)
    assert summary["appliedTemplateCount"] == 0
    assert any(row["status"] == "independent_evidence_required" for row in unreviewed["templateInference"]["applications"])
    assert all(row["status"] in {"independent_evidence_required", "no_match"}
               for row in unreviewed["templateInference"]["applications"])
    assert all(not row["evidenceIds"] for row in unreviewed["templateInference"]["applications"])
    assert store.get(candidate["candidate_id"]) == frozen
    locations, context = semantics._memory("test", held[0]["sequenceId"])
    selected = locations.read_selected("shape", [destination], context)
    other_provider = replace(semantics._frame(held[0]), provider_id="filesystem:another-provider")
    assert semantics._apply_grouping_templates(
        held[0], other_provider, [frozen], selected["records"], memory_context=context,
    ) == {"applications": [], "unavailable": []}
    preferences = locations.load_preferences(context)
    preferences["shape"]["lookIn"] = []
    locations.save_preferences(context, preferences, expected_revision=preferences["revision"])
    summary, unavailable = invoke(held[0], semantics.GROUPING)
    assert summary["appliedTemplateCount"] == 0 and summary["unavailableTemplateCount"] == 1
    assert unavailable["templateInference"]["unavailable"][0]["reason"] == \
        "select_saved_training_anchor_and_prototype_in_shape_look_in"
    assert store.get(candidate["candidate_id"]) == frozen
    lookup = next(item["memoryLocationId"] for item in locations.catalog(context)["destinations"]
                  if item["scopeKind"] == "level" and item["memoryKinds"] == ["shape"])
    preferences = locations.load_preferences(context)
    preferences["shape"]["lookIn"] = [lookup]
    locations.save_preferences(context, preferences, expected_revision=preferences["revision"])
    missing_revision = semantics.runtime_revision(held[0], semantics.GROUPING)
    training_prototypes = {uid for item in frozen["proposals"] for uid in item["provenance"]["prototypeUids"]}
    for item in selected["records"]:
        record = item["preferred"]
        if record["payload"].get("uid") in {anchor_uid, *training_prototypes}:
            locations.save_copy(record, lookup, context)
    assert semantics.runtime_revision(held[0], semantics.GROUPING) != missing_revision
    summary, copied = invoke(held[0], semantics.GROUPING)
    assert summary["appliedTemplateCount"] == 1
    assert all(reference["memoryLocationId"] == lookup for row in copied["templateInference"]["applications"]
               for reference in row["prototypeReferences"])
    assert store.get(candidate["candidate_id"]) == frozen
    output = semantics._artifact(held[0], semantics.GROUPING)
    saved_output = output.read_bytes()
    saved_memory = {path: path.read_bytes() for path in root.rglob("*.memory.json")}
    apply_templates = semantics._apply_grouping_templates

    def reject_during_application(*args, **kwargs):
        prediction = apply_templates(*args, **kwargs)
        rejected = client.post(path + "/reject", json={
            "workspaceId": "test", "reviewer": "concurrent reviewer", "reason": "Revoke during application",
        })
        assert rejected.status_code == 200, rejected.text
        return prediction

    monkeypatch.setattr(semantics, "_apply_grouping_templates", reject_during_application)
    with pytest.raises(semantics.ConflictError, match="registry changed"):
        invoke(held[0], semantics.GROUPING)
    assert output.read_bytes() == saved_output
    assert {path: path.read_bytes() for path in root.rglob("*.memory.json")} == saved_memory


def test_grouping_deployment_requires_separate_replay_and_promotion_before_unseen_application(workspace):
    root, client = workspace
    train = make_sequence(root, name="deployment-train", seed=31, count=1)
    held = make_sequence(root, name="deployment-held", seed=61, count=1)
    unseen = make_sequence(root, name="deployment-unseen", seed=91, count=1)
    for units in (train, held, unseen):
        locations, context = semantics._memory("test", units[0]["sequenceId"])
        preferences = locations.load_preferences(context)
        destination = next(item["memoryLocationId"] for item in locations.catalog(context)["destinations"]
                           if item["scopeKind"] == "global" and item["memoryKinds"] == ["shape"])
        preferences["shape"]["saveTo"] = destination
        preferences["shape"]["lookIn"] = [destination]
        locations.save_preferences(context, preferences, expected_revision=preferences["revision"])
    invoke(train[0], semantics.GROUPING)
    store = semantics._store(root)
    parent = store.list(kind="grouping")[0]
    response = client.post(f"/semantic/candidates/{parent['candidate_id']}/deployment", json={
        "workspaceId": "test", "trainingSequenceId": train[0]["sequenceId"],
        "reviewer": "independent reviewer", "reason": "Evaluate unguarded deployment against original masks",
    })
    assert response.status_code == 200, response.text
    deployment = response.json()["candidate"]
    assert deployment["status"] == "proposed" and deployment["evidence"] == deployment["evaluations"] == []
    assert deployment["parent_ids"] == [parent["candidate_id"]]
    path = f"/semantic/candidates/{deployment['candidate_id']}"
    blocked = client.post(path + "/promote", json={"workspaceId": "test"})
    assert blocked.status_code == 422, blocked.text
    summary, _ = invoke(unseen[0], semantics.GROUPING)
    assert summary["appliedTemplateCount"] == 0
    checkpoint = semantics._result(train[0], semantics.GROUPING)["checkpoint"]
    anchor_id = deployment["rule"]["head"]["args"][1]
    anchor = next(item for item in checkpoint["anchors"] if item["uid"] == anchor_id)
    for partition, units in (("train", train), ("held_out", held)):
        frame = semantics._frame(units[0])
        group = next(group for group in frame.groups if len(group.points) == len(anchor["canonicalPoints"]))
        response = client.post(path + "/evaluate", json={
            "workspaceId": "test", "trainingSequenceId": train[0]["sequenceId"],
            "sequenceId": units[0]["sequenceId"], "partition": partition,
            "labels": [{"frameUid": frame.uid, "groupUid": group.uid, "anchorUid": anchor_id,
                        "expectedTemplateMatch": True, "reviewer": "independent reviewer",
                        "reason": "Independently inspected original producer masks"}],
        })
        assert response.status_code == 200, response.text
        assert response.json()["observations"][0]["outcome"] == "support"
    evaluated = store.get(deployment["candidate_id"])
    assert evaluated["status"] == "eligible"
    assert all(all(term["predicate"] != "independent_group_support" for term in evidence["provenance"]["facts"])
               for evidence in evaluated["evidence"])
    assert client.post(path + "/promote", json={"workspaceId": "test"}).status_code == 200
    revision = semantics.runtime_revision(unseen[0], semantics.GROUPING)
    summary, result = invoke(unseen[0], semantics.GROUPING)
    applied = [row for row in result["templateInference"]["applications"] if row["status"] == "applied"]
    assert summary["appliedTemplateCount"] == 1 and len(applied) == 1
    assert applied[0]["candidateId"] == deployment["candidate_id"] and applied[0]["evidenceIds"] == []
    assert all(term["predicate"] != "independent_group_support" for term in applied[0]["facts"])
    assert semantics.runtime_revision(unseen[0], semantics.GROUPING) == revision
    assert store.get(parent["candidate_id"]) == parent
    assert any(term["predicate"] == "independent_group_support" for term in parent["rule"]["body"])


def test_llm_rule_proposals_are_stored_unevaluated_and_errors_are_audited(workspace, monkeypatch):
    root, _ = workspace
    units = make_sequence(root, count=3)
    run_core(units)
    proposal = {"candidates": [{
        "kind": "event_detector", "scope": {"domain": "visual-sequence", "provider_id": "filesystem:test"},
        "rule": {"head": {"predicate": "moved", "args": [{"var": "Object"}]},
                 "body": [{"predicate": "displacement_magnitude", "args": [{"var": "Object"}, {"var": "Distance"}]},
                          {"predicate": "greater_than", "args": [{"var": "Distance"}, 0.5]}]},
        "confidence": 0.9, "assumptions": ["Independent replay still required"], "critiques": [],
    }]}
    raw = json.dumps(proposal)
    calls = setup_model(monkeypatch, raw)
    _, result = invoke(units[-1], semantics.LLM_RULES, {"confirmModel": True})
    assert len(calls) == 1 and len(result["candidateIds"]) == 1
    candidate = semantics._store(root).get(result["candidateIds"][0])
    assert candidate["status"] == "proposed" and candidate["evidence"] == [] and candidate["evaluations"] == []
    assert candidate["proposals"][0]["source"] == "llm_proposal"
    assert semantics._training(candidate)
    assert (root / result["provenance"]["raw_output_ref"]).read_text() == raw
    calls = setup_model(monkeypatch, '{"candidates":[{"kind":"event_detector","rule":"halt."}]}')
    with pytest.raises(ValueError):
        invoke(units[-1], semantics.LLM_RULES, {"confirmModel": True})
    assert calls and len(semantics._store(root).list()) == 1
    assert any("invalid" in path.read_text() for path in (root / "runtime" / "rule-proposals").glob("*.json"))


def test_nonvision_and_disabled_models_are_rejected_before_network(workspace, monkeypatch):
    root, _ = workspace
    calls = setup_model(monkeypatch, "")
    from omega_vision.services import video_import_pipeline as pipeline
    for enabled, vision in ((False, True), (True, False)):
        monkeypatch.setattr(pipeline, "_resolved_model_records", lambda _, enabled=enabled, vision=vision: [{
            "document": {"id": "test-vision"}, "resolved": {"enabled": enabled, "capabilities": {"vision": vision}},
        }])
        with pytest.raises(ValueError):
            semantics._model(root, "test", {"confirmModel": True})
    assert not calls


def test_internal_log_prefix_preserves_outgoing_action_links_and_does_not_replay_future(workspace, monkeypatch):
    from omega_vision.perception import event_deduction
    root, _ = workspace
    units = make_sequence(root, count=3)
    write_json(units[0]["image"].with_name("state.json"), {
        "outgoing_action": "ACTION1", "recorded_at": "2026-01-01T00:00:00Z",
    })
    run_core(units)
    log = semantics._event_log(root, units[0]["sequenceId"])
    before = log.read()
    history = {path: path.read_bytes() for path in log.path.glob("*.json")}
    original = event_deduction.deduce_sequence
    calls = []

    def prefix_only(frames, temporal, **kwargs):
        calls.append(len(frames))
        assert len(frames) < 3, "Internal prefix reuse must not recompute the future tail"
        return original(frames, temporal, **kwargs)

    monkeypatch.setattr(event_deduction, "deduce_sequence", prefix_only)
    for count in (1, 2):
        summary, result = invoke(units[count - 1], semantics.LOG)
        assert result["entries"] == before["entries"]
        assert result["inputs"] == before["inputs"]
        assert result["head_id"] == before["head_id"] == result["entries"][-1]["id"]
        assert result["executionScope"] == summary["executionScope"]
        assert result["executionScope"]["requestedFrameCount"] == count
        assert result["executionScope"]["canonicalFrameCount"] == 3
        assert result["executionScope"]["reusedExistingTail"] is True
        outgoing = next(entry for entry in result["entries"]
                        if entry["kind"] == "user_action" and entry["direction"] == "outgoing")
        assert outgoing["to_frame"] == before["inputs"]["frames"][1]["id"]
    assert calls == [1, 2]
    assert log.read() == before
    assert {path: path.read_bytes() for path in log.path.glob("*.json")} == history


@pytest.mark.parametrize("changed", ["frame", "assessment", "action", "removed_action", "detector", "registry"])
def test_internal_log_prefix_changes_still_require_explicit_supersession(workspace, monkeypatch, changed):
    from omega_vision.perception import event_deduction
    root, client = workspace
    units = make_sequence(root, count=3)
    action_path = units[0]["image"].with_name("state.json")
    write_json(action_path, {"outgoing_action": "ACTION1", "recorded_at": "2026-01-01T00:00:00Z"})
    run_core(units)
    log = semantics._event_log(root, units[0]["sequenceId"])
    before = log.read()
    history = {path: path.read_bytes() for path in log.path.glob("*.json")}
    count = 2 if changed in {"frame", "assessment"} else 1
    if changed in {"frame", "assessment"}:
        original = event_deduction.deduce_sequence

        def revised(*args, **kwargs):
            result = original(*args, **kwargs)
            if changed == "frame":
                result["frames"][0]["input_hash"] += "-changed-source"
            else:
                result["assessments"][0]["confidence"] = 0.25
            return result

        monkeypatch.setattr(event_deduction, "deduce_sequence", revised)
    elif changed in {"action", "removed_action"}:
        write_json(action_path, {"outgoing_action": "ACTION2"} if changed == "action" else {})
    elif changed == "detector":
        monkeypatch.setattr(event_deduction, "implementation_version", lambda *_: "updated-authored-detector")
    else:
        store = semantics._store(root)
        candidate = store.create(
            {"body": [{"predicate": "present", "args": [{"var": "Object"}]}],
             "head": {"predicate": "moved", "args": [{"var": "Object"}]}},
            kind="event_detector", scope={"domain": "visual-sequence"}, source="authored",
            provenance={"code_hash": "changed-registry"}, inducer_version="tail-registry-test",
        )
        _promote_registry_fixture(store, candidate)
    with pytest.raises(semantics.ConflictError, match="explicit suffix supersession"):
        invoke(units[count - 1], semantics.LOG)
    assert log.read() == before
    assert {path: path.read_bytes() for path in log.path.glob("*.json")} == history
    replayed = client.post("/semantic/events/replay", json={
        "workspaceId": "test", "sequenceId": units[0]["sequenceId"],
        "expectedGeneration": before["generation"], "supersede": True,
    })
    assert replayed.status_code == 200, replayed.text


def test_event_replay_requires_explicit_supersession_not_silent_overwrite(workspace):
    root, client = workspace
    units = make_sequence(root, count=3)
    run_core(units)
    body = {"workspaceId": "test", "sequenceId": units[0]["sequenceId"], "firstN": 2}
    previous = semantics._event_log(root, units[0]["sequenceId"]).read()
    failed = client.post("/semantic/events/replay", json=body)
    assert failed.status_code == 409
    replayed = client.post("/semantic/events/replay", json={**body, "expectedGeneration": previous["generation"], "supersede": True})
    assert replayed.status_code == 200
    assert replayed.json()["generation"] == previous["generation"] + 1
    assert semantics._event_log(root, units[0]["sequenceId"]).read(generation=previous["generation"]) == previous


def test_no_change_pairs_are_not_positive_recurrence(workspace):
    root, _ = workspace
    units = make_sequence(root, count=3, motion=0)
    run_core(units)
    log = semantics._event_log(root, units[0]["sequenceId"]).read()
    assessments = [item for item in log["entries"] if item["kind"] == "transition_assessment"]
    assert len(assessments) == 2
    assert all(item["assessment"] == "no_material_change" and item["event_count"] == 0 for item in assessments)
    _, result = invoke(units[-1], semantics.INDUCTION)
    assert result["candidateIds"] == []
