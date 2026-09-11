import json

from fastapi import FastAPI
from fastapi.testclient import TestClient
from PIL import Image
import pytest

from omega_vision.perception._event_journal import ConflictError, ValidationError, content_id
from omega_vision.perception.candidate_rules import PromotionGates
from omega_vision.perception.contextual_memory import ContextualMemory, recording_context
from omega_vision.perception.contextual_rules import ContextualRuleStore
from omega_vision.perception.metta_memory import MeTTaMemoryDatabase
from omega_vision.perception.observation_identity import build_observation_bundle, content_hash
from omega_vision.perception.visual_event_log import VisualSequenceEventLog
from omega_vision.services import video_import_abduction as abduction
from omega_vision.services import video_import_api as api
from omega_vision.services import video_import_semantics as semantics


def write(path, value):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(value), encoding="utf-8")


def term(name, *args):
    return {"predicate": name, "args": list(args)}


def promote(context, predicate="moved"):
    store = ContextualRuleStore(context)
    variable = {"var": "X"}
    candidate = store.create(
        {"body": [term(predicate, variable)], "head": term("bounce", variable), "delay": {"min": 1, "max": 1}},
        kind="event_transition", scope={"domain": "visual-sequence"}, source="authored",
        provenance={"source": "inert unit fixture"}, inducer_version="fixture-v1",
    )
    for index in (1, 2):
        store.record_evidence(candidate["candidate_id"], {
            "sequence_id": f"fixture:{index}", "sequence_fingerprint": f"fingerprint:{index}",
            "pair_id": f"pair:{index}", "before_hash": f"before:{index}", "after_hash": f"after:{index}",
            "partition": "held_out", "outcome": "support", "assessment": "changed",
            "comparison_complete": True, "confidence": .95, "event_ids": [f"event:{index}"],
            "evidence_refs": [f"evidence:{index}"], "source": "deterministic_replay",
            "evaluator_id": "fixture", "evaluator_version": "1", "depends_on_candidates": [],
        })
    return store.promote(candidate["candidate_id"], gates=PromotionGates())


def tree_bytes(root):
    return {path.relative_to(root).as_posix(): path.read_bytes() for path in root.rglob("*") if path.is_file()}


@pytest.fixture
def recorded(tmp_path, monkeypatch):
    root, home = tmp_path, tmp_path / "data" / "omega_vision"
    for name in ("alpha", "beta"):
        (root / "workspaces" / name).mkdir(parents=True)
    monkeypatch.setattr(api, "_workspace_root", lambda name: (
        root / "workspaces" / name if name in {"alpha", "beta"} else (_ for _ in ()).throw(KeyError(name))))
    directory = home / "recordings" / "game" / "run"
    for index in range(4):
        frame = directory / f"frame_{index:06}"
        frame.mkdir(parents=True)
        Image.new("RGB", (2, 2), (index, 0, 0)).save(frame / "image.png")
    write(directory / "recording.json", {
        "game_id": "game", "moves": [{"directory": f"frame_{index:06}", "level": "1"} for index in range(4)],
    })
    sequence = "data/recordings/game/run"
    _, units = semantics._units("alpha", sequence)
    contexts = [recording_context(home, directory, item["id"]) for item in units]
    candidate = promote(contexts[0])
    locations, memory_context = semantics._memory("alpha", sequence, frame_id=units[2]["id"])
    native = ContextualMemory(home, "alpha")
    preferences = {"schemaVersion": 1, "expanded": False}
    for kind in ("shape", "object"):
        preferences[kind] = {"saveTo": native.descriptor(contexts[2].frame_area(), kind, contexts[2])["memoryLocationId"],
                             "lookIn": [], "recentLookIn": []}
    preferences["revision"] = content_hash(preferences)
    _, preference_path = locations._preference_path(memory_context)
    write(preference_path, preferences)
    detectors = {"fixture-detector": "fixture-v1"}
    frames = []
    for index, unit in enumerate(units):
        geometry = {"width": 2, "height": 2, "polygons": {}}
        paths = {
            "image": unit["image"], "partsFacts": semantics._artifact(unit, semantics.PARTS, "result.pl"),
            "groupingFacts": semantics._artifact(unit, semantics.GROUPS, "result.pl"),
            "acceptanceFacts": semantics._artifact(unit, semantics.ACCEPTANCE, "result.pl"),
            "geometry": semantics._artifact(unit, semantics.PARTS, "geometry.json"),
            "acceptanceMetadata": semantics._artifact(unit, semantics.ACCEPTANCE, "meta.json"),
            "extractionMetadata": semantics._artifact(unit, semantics.PARTS, "meta.json"),
        }
        for role in ("partsFacts", "groupingFacts", "acceptanceFacts"):
            paths[role].parent.mkdir(parents=True, exist_ok=True)
            paths[role].write_text("", encoding="utf-8")
        write(paths["geometry"], geometry)
        write(paths["acceptanceMetadata"], {"acceptedGroups": []})
        write(paths["extractionMetadata"], {"visualGroups": []})
        hashes = {key: content_hash(path.read_bytes()) for key, path in paths.items()}
        bundle = build_observation_bundle(
            frame_alias=unit["id"], sequence_id=unit["sequenceId"], frame_order=index,
            frame_key=unit["frameSourceKey"], image_bytes=unit["image"].read_bytes(),
            extraction_text="", grouping_text="", acceptance_text="", geometry=geometry, source_artifact_hashes=hashes,
        )
        write(semantics._artifact(unit, semantics.IDENTITY, "observations.json"), bundle)
        hashes.update(geometry=content_hash(geometry), lineage=content_hash({}), temporalPartsFacts=content_hash(""))
        frames.append({
            "id": bundle["frame"]["uid"], "index": index, "input_hash": content_id("frame-input", hashes),
            "entity_ids": ["object:ball"], "evidence": [bundle["bundleUid"]],
            "states": [term("visible", "object:ball")],
            "provenance": {"provider": unit["providerId"], "artifact_hashes": hashes},
        })
    assessments = [{
        "from_frame": frames[index - 1]["id"], "to_frame": frames[index]["id"],
        "assessment": "changed" if index == 2 else "no_material_change", "comparison_complete": True,
        "confidence": .95, "evidence": [f"pixels:{index}"], "uncertainty": [],
        "provenance": {"source": "inert-fixture"},
        "events": [{
            "term": term("bounce", "object:ball"), "confidence": .95, "evidence": ["pixels:2"], "uncertainty": [],
            "provenance": {"source": "prolog", "detector_id": "fixture-detector", "detector_version": "fixture-v1",
                           "artifact_hash": "fixture-proof:2"},
        }] if index == 2 else [],
    } for index in range(1, 4)]
    # Build only typed journals; neither real deduction nor a game engine runs.
    log = VisualSequenceEventLog(home, sequence, accepted_detectors=detectors)
    for index, unit in enumerate(units):
        snapshot = log.replay(frames[:index + 1], assessments[:index])
        write(semantics._artifact(unit, semantics.EVENTS), {
            "frame": frames[index], "accepted_detectors": detectors,
            "assessment": assessments[index - 1] if index else "initial_observation",
            "registryRevision": semantics._registry_revision(
                semantics._store(unit["workspaceRoot"], unit), kinds=semantics.EVENT_RULE_KINDS),
        })
        write(semantics._artifact(unit, semantics.LOG), snapshot)
    app = FastAPI()
    app.include_router(abduction.router)
    return {
        "root": root, "home": home, "units": units, "contexts": contexts, "candidate": candidate,
        "preference_path": preference_path, "client": TestClient(app), "log": log,
    }


def execute(recorded, **options):
    unit = recorded["units"][2]
    target = semantics._artifact(unit, abduction.STEP).parent
    summary = abduction.run_abduction(unit, target, options)
    return summary, semantics._json(target / "result.json")


def test_working_adapter_persists_typed_frame_hypotheses_without_promoting_or_rewriting_observations(recorded):
    before = tree_bytes(recorded["home"])
    summary, result = execute(recorded)
    assert summary["hypothesisCount"] == 1
    hypothesis = result["hypotheses"][0]
    assert hypothesis["causes"][0]["term"] == term("moved", "object:ball")
    assert hypothesis["rule"]["candidate_id"] == recorded["candidate"]["candidate_id"]
    assert result["causal"]["frameOrder"] == 2
    assert result["inputRevision"]["canonical_generation"] == 4
    assert hypothesis["observed_event_id"].startswith("event-")
    database = MeTTaMemoryDatabase(recorded["home"], recorded["contexts"][2].frame_area(), "hypothesis")
    assert database.path.name == "abduced_events.metta"
    assert database.read()[0]["result"] == result
    after = tree_bytes(recorded["home"])
    for name, value in before.items():
        if not name.startswith(".cache/"):
            assert after[name] == value
    assert not (recorded["home"] / "runtime" / "rule-candidates").exists()
    assert not (recorded["home"] / "workspaces").exists()
    execute(recorded)
    assert len(database.read()) == 1


def test_two_workspaces_share_identity_and_read_does_not_enumerate_sequences_or_write(recorded, monkeypatch):
    _, first = execute(recorded)
    unit = dict(recorded["units"][2], workspaceId="beta",
                workspaceRoot=recorded["root"] / "workspaces" / "beta")
    abduction.run_abduction(unit, semantics._artifact(unit, abduction.STEP).parent, {})
    assert semantics._json(semantics._artifact(unit, abduction.STEP)) == first
    before = tree_bytes(recorded["root"])
    monkeypatch.setattr(semantics, "_units", lambda *args: pytest.fail("Read-only inspection enumerated sequences"))
    for workspace in ("alpha", "beta"):
        response = recorded["client"].get("/semantic/abductions", params={
            "workspaceId": workspace, "sequenceId": unit["sequenceId"], "frameId": unit["id"],
        })
        assert response.status_code == 200, response.text
        assert response.headers["cache-control"] == "no-store"
        assert response.json()["entries"][0]["result"] == first
    assert tree_bytes(recorded["root"]) == before


@pytest.mark.parametrize("kind,field", [("shape", "saveTo"), ("object", "saveTo"), ("shape", "lookIn")])
def test_nowhere_rejects_before_any_write(recorded, kind, field):
    from omega_vision.perception.memory_locations import NOWHERE
    preferences = semantics._json(recorded["preference_path"])
    preferences[kind][field] = NOWHERE if field == "saveTo" else [NOWHERE]
    preferences["revision"] = content_hash({key: value for key, value in preferences.items() if key != "revision"})
    write(recorded["preference_path"], preferences)
    before = tree_bytes(recorded["root"])
    with pytest.raises(ValidationError, match="Nowhere"):
        execute(recorded)
    assert tree_bytes(recorded["root"]) == before


def test_missing_preferences_does_not_populate_discovery_caches(recorded):
    recorded["preference_path"].unlink()
    before = tree_bytes(recorded["root"])
    with pytest.raises(ValidationError, match="explicit persistent"):
        execute(recorded)
    assert tree_bytes(recorded["root"]) == before


def test_stage_failures_and_stale_journal_are_not_treated_as_no_explanation(recorded):
    unit = recorded["units"][2]
    failed = semantics._artifact(unit, semantics.EVENTS).parent / ".transform-failed.json"
    write(failed, {"failed": True})
    with pytest.raises(ValidationError, match="failed latest"):
        execute(recorded)
    failed.unlink()
    artifact = semantics._artifact(unit, semantics.LOG)
    damaged = semantics._json(artifact)
    damaged["entries"][-1]["id"] = "tampered"
    write(artifact, damaged)
    with pytest.raises(ConflictError, match="stale"):
        execute(recorded)
    assert not (recorded["contexts"][2].frame_area() / "abduced_events.metta").exists()


def test_changed_pixels_are_not_treated_as_current_observed_evidence(recorded):
    image = recorded["units"][2]["image"]
    Image.new("RGB", (2, 2), "blue").save(image)
    before = tree_bytes(recorded["root"])
    with pytest.raises(ConflictError, match="Observation image changed"):
        execute(recorded)
    assert tree_bytes(recorded["root"]) == before


def test_changed_recorded_actions_and_browser_receipts_cannot_become_persistent_evidence(recorded):
    unit = recorded["units"][1]
    write(unit["dir"] / "state.json", {"incoming_action": "LEFT"})
    with pytest.raises(ConflictError, match="Recorded input evidence"):
        execute(recorded)
    (unit["dir"] / "state.json").unlink()
    write(semantics._artifact(unit, semantics.OBJECTS), {"storage": "browser_session", "resultHash": "receipt"})
    before = tree_bytes(recorded["root"])
    with pytest.raises(ValidationError, match="Browser-only evidence"):
        execute(recorded)
    assert tree_bytes(recorded["root"]) == before


def test_future_pixels_are_not_used_or_required_for_current_abduction(recorded):
    recorded["units"][3]["image"].write_bytes(b"unreadable future observation")
    assert execute(recorded)[0]["hypothesisCount"] == 1


def test_recorded_action_explains_effect_backward_and_missing_action_stays_an_alternative(recorded):
    units = recorded["units"]
    write(units[1]["dir"] / "state.json", {"incoming_action": "LEFT"})
    snapshot = recorded["log"].read()
    actions, actors = semantics._recorded_actions(units, snapshot["inputs"]["frames"])
    store = ContextualRuleStore(recorded["contexts"][0])
    for name in ("LEFT", "RIGHT"):
        candidate = store.create(
            {"body": [term("user_input", actors[0], name)], "head": term("bounce", "object:ball"),
             "delay": {"min": 1, "max": 1}},
            kind="action_effect", entity_ids=[actors[0], "object:ball"],
            scope={"domain": "visual-sequence"}, source="authored",
            provenance={"source": "inert fixture"}, inducer_version="fixture-v1",
        )
        for evidence in recorded["candidate"]["evidence"]:
            store.record_evidence(candidate["candidate_id"],
                                  {key: value for key, value in evidence.items() if key != "evidence_id"})
        store.promote(candidate["candidate_id"], gates=PromotionGates())
    log = VisualSequenceEventLog(recorded["home"], units[0]["sequenceId"],
                                accepted_detectors={"fixture-detector": "fixture-v1"}, actor_ids=actors)
    snapshot = log.replay(snapshot["inputs"]["frames"], snapshot["inputs"]["assessments"], actions=actions,
                          expected_generation=snapshot["generation"], supersede=True)
    for unit in units:
        write(semantics._artifact(unit, semantics.LOG), snapshot)
        result = semantics._json(semantics._artifact(unit, semantics.EVENTS))
        result["registryRevision"] = semantics._registry_revision(
            semantics._store(unit["workspaceRoot"], unit), kinds=semantics.EVENT_RULE_KINDS)
        write(semantics._artifact(unit, semantics.EVENTS), result)
    _, result = execute(recorded)
    by_action = {row["causes"][0]["term"]["args"][1]: row for row in result["hypotheses"]
                 if row["rule"]["kind"] == "action_effect"}
    assert by_action["LEFT"]["causes"][0]["status"] == "observed"
    assert by_action["LEFT"]["satisfied"][0]["evidence_ids"][0].startswith("action-term-")
    assert by_action["LEFT"]["evidence"][0]["provenance"]["action_id"].startswith("action-")
    assert by_action["RIGHT"]["causes"][0]["status"] == "hypothesized"
    assert by_action["RIGHT"]["assumptions"][0]["reason"] == "missing_antecedent"


def test_rule_snapshot_uses_strictly_earlier_publications_and_ignores_future_rejection(recorded):
    earlier = recorded["contexts"][0]
    current, future = recorded["contexts"][2:]
    promote(current, "rotated")
    promote(future, "scaled")
    ContextualRuleStore(future, origin=earlier).reject(
        recorded["candidate"]["candidate_id"], reason="future review", provenance={"source": "fixture"})
    candidates, _ = abduction._registry(ContextualRuleStore(current))
    assert [row["candidate_id"] for row in candidates] == [recorded["candidate"]["candidate_id"]]
    assert candidates[0]["published_order"] == 0
    assert abduction._registry(ContextualRuleStore(future))[0][0]["rule"]["body"][0]["predicate"] == "rotated"


def test_registry_change_during_search_prevents_hypothesis_publication(recorded, monkeypatch):
    original = abduction.event_abduction.abduce_events

    def changed(*args, **kwargs):
        result = original(*args, **kwargs)
        ContextualRuleStore(recorded["contexts"][2], origin=recorded["contexts"][0]).reject(
            recorded["candidate"]["candidate_id"], reason="withdrawn", provenance={"source": "fixture"})
        return result

    monkeypatch.setattr(abduction.event_abduction, "abduce_events", changed)
    with pytest.raises(ConflictError, match="registry changed"):
        execute(recorded)
    assert not (recorded["contexts"][2].frame_area() / "abduced_events.metta").exists()


def test_paths_and_arbitrary_rule_payloads_cannot_redirect_writes(recorded):
    unit = recorded["units"][2]
    outside = recorded["root"] / "unauthorized"
    with pytest.raises(PermissionError, match="current registered frame"):
        abduction.run_abduction(unit, outside, {})
    with pytest.raises(ValidationError, match="only explicit budgets"):
        execute(recorded, candidates=[recorded["candidate"]], path=str(outside))
    for area in (recorded["home"] / "memory_inherited", recorded["home"] / "workspaces" / "alpha" / "memory"):
        with pytest.raises(PermissionError):
            MeTTaMemoryDatabase(recorded["home"], area, "hypothesis")
    assert not outside.exists()


def test_redirected_hypothesis_database_is_rejected(recorded, monkeypatch):
    from omega_vision.perception import metta_memory
    original = metta_memory.storage_path

    def redirected(root, *parts):
        if parts and parts[-1] == "abduced_events.metta":
            return recorded["root"] / "outside.metta"
        return original(root, *parts)

    monkeypatch.setattr(metta_memory, "storage_path", redirected)
    with pytest.raises(PermissionError, match="redirected"):
        execute(recorded)
    assert not (recorded["root"] / "outside.metta").exists()


def test_registration_runtime_revision_and_read_integrity(recorded):
    registry, metadata = {}, {}
    abduction.register_transforms(registry, metadata)
    key = tuple(abduction.STEP.split("/"))
    assert registry[key] is abduction.run_abduction
    assert metadata[key]["dependsOn"] == [semantics.LOG, semantics.EVENTS]
    before = tree_bytes(recorded["root"])
    assert abduction.runtime_revision(recorded["units"][2]) == abduction.runtime_revision(recorded["units"][2])
    assert before == tree_bytes(recorded["root"])
    execute(recorded)
    path = recorded["contexts"][2].frame_area() / "abduced_events.metta"
    path.write_text(path.read_text(encoding="utf-8").replace("possible_cause", "observed_fact"), encoding="utf-8")
    with pytest.raises(ValueError, match="integrity"):
        MeTTaMemoryDatabase(recorded["home"], path.parent, "hypothesis").read()


def test_active_execution_registry_and_revision_dispatch_include_abduction(monkeypatch):
    from omega_vision.services import video_import_api
    assert abduction.STEP in video_import_api._semantic_stage_ids()
    definition = video_import_api._transform_definitions()[abduction.STEP]
    assert definition["dependsOn"] == [semantics.LOG, semantics.EVENTS]
    assert definition["label"] == "Abduce event explanations"
    assert definition["orderedOnly"] is True
    marker = object()
    monkeypatch.setattr(abduction, "runtime_revision", lambda unit: "exact-revision" if unit is marker else None)
    assert semantics.runtime_revision(marker, abduction.STEP) == "exact-revision"
    assert semantics.runtime_revision(marker, tuple(abduction.STEP.split("/"))) == "exact-revision"


def test_abduction_accepts_only_matching_dispatcher_revision(recorded):
    from omega_vision.services import video_import_api
    unit = recorded["units"][2]
    options = video_import_api._runtime_transform_options(unit, abduction.STEP, {})
    output = unit["dir"].joinpath(*abduction.STEP.split("/"))
    before = tree_bytes(recorded["root"])
    with pytest.raises(ConflictError, match="dispatcher revision"):
        abduction.run_abduction(unit, output, {**options, "semanticContextRevision": "stale"})
    assert tree_bytes(recorded["root"]) == before
    output.mkdir(parents=True, exist_ok=True)
    abduction.run_abduction(unit, output, options)
    assert (recorded["contexts"][2].frame_area() / "abduced_events.metta").is_file()


def test_prefix_log_receipts_survive_later_extension_and_repeated_abduction(recorded):
    unit = recorded["units"][2]
    receipt = semantics._json(semantics._artifact(unit, semantics.LOG))
    assert receipt["generation"] == 3 and len(receipt["inputs"]["frames"]) == 3
    assert recorded["log"].read()["generation"] == 4
    first, result = execute(recorded)
    second, repeated = execute(recorded)
    assert first == second and result == repeated
    assert semantics._json(semantics._artifact(unit, semantics.LOG)) == receipt


def test_nowhere_and_missing_preferences_have_inspectable_revisions_but_cannot_run(recorded):
    unit = recorded["units"][2]
    before_revision = abduction.runtime_revision(unit)
    preferences = semantics._json(recorded["preference_path"])
    preferences["shape"]["saveTo"] = "memory-nowhere"
    preferences["revision"] = content_hash({key: value for key, value in preferences.items() if key != "revision"})
    write(recorded["preference_path"], preferences)
    before = tree_bytes(recorded["root"])
    assert abduction.runtime_revision(unit) != before_revision
    assert tree_bytes(recorded["root"]) == before
    with pytest.raises(ValidationError, match="Nowhere"):
        execute(recorded)
    recorded["preference_path"].unlink()
    before = tree_bytes(recorded["root"])
    assert abduction.runtime_revision(unit)
    assert tree_bytes(recorded["root"]) == before
    with pytest.raises(ValidationError, match="explicit persistent"):
        execute(recorded)
