from __future__ import annotations

from copy import deepcopy
from dataclasses import replace
from io import BytesIO
import json

from PIL import Image
import pytest

from omega_vision.perception.candidate_rules import CandidateRuleStore, PromotionGates
from omega_vision.perception.grouping_application import (
    apply_promoted_grouping, observe_grouping_with_memory, selected_grouping_memory_revision,
)
from omega_vision.perception.grouping_learning import GroupingEvidence, observe_grouping
from omega_vision.perception.grouping_promotion import (
    GroupingValidationLabel, create_grouping_deployment, evaluate_grouping_promotion,
    evaluate_grouping_sequence, persist_grouping_candidates,
)
from omega_vision.perception.memory_locations import AuthorizedMemoryRoot, MemoryContext, MemoryLocations
from omega_vision.perception.observation_identity import content_hash
from omega_vision.perception.temporal_correspondence import (
    GroupObservation, TemporalFrame, canonical_json, frame_to_dict, stable_id, validate_checkpoint,
)
from omega_vision.perception import grouping_application


def observed(sequence, color, *, order=0, points=((0, 0), (1, 0)), provider="data-provider"):
    image = Image.new("RGBA", (5, 5), (color, 0, 0, 255))
    for point in points:
        image.putpixel(point, (255, 0, 0, 255))
    stream = BytesIO()
    image.save(stream, format="PNG")
    uid = f"{provider}-{sequence}-{order}"
    group = GroupObservation(f"final-group-{uid}", "g1", (f"region-{uid}",), ("r1",),
                             tuple(points), ("red",), (1, 0), "exact_pixel_runs")
    frame = TemporalFrame(f"frame-{uid}", f"bundle-{uid}", provider, sequence, order,
                          5, 5, (group,), {"image": content_hash(stream.getvalue())}, {})
    return frame, stream.getvalue()


def support(frame):
    return {group.uid: GroupingEvidence(
        source_ref=f"authored-acceptance:{frame.uid}:{group.uid}", origin="authored_detector",
        independent=True, outcome="support",
    ) for group in frame.groups}


def environment(tmp_path):
    store = CandidateRuleStore(tmp_path)
    memory = MemoryLocations([AuthorizedMemoryRoot("memory-files", "workspace", tmp_path, "Fixture files", writable=True)])
    context = MemoryContext("memory-files", "workspace", "game", run_id="training")
    destination = next(row["memoryLocationId"] for row in memory.catalog(context)["destinations"]
                       if row["scopeKind"] == "global" and "shape" in row["memoryKinds"])
    return store, memory, context, destination


def prepare(env, suffix="a", points=((0, 0), (1, 0))):
    store, memory, context, destination = env
    seed, image = observed(f"seed-{suffix}", 1, points=points)
    grouping = observe_grouping(seed)
    identity = persist_grouping_candidates(
        store, grouping, training_frames=[seed], source_images={seed.uid: image},
    )[0]["candidateId"]
    for record in [*grouping["checkpoint"]["anchors"], *grouping["checkpoint"]["prototypes"]]:
        memory.save_record("shape", destination, record, context)
    return {"seed": seed, "grouping": grouping, "candidate": identity, "suffix": suffix, "points": points}


def grade(store, model, sequence, color, *, partition, expected=True):
    frame, image = observed(sequence, color, points=model["points"])
    label = GroupingValidationLabel(
        frame.uid, frame.groups[0].uid, model["grouping"]["checkpoint"]["anchors"][0]["uid"],
        expected, f"independent-review:{sequence}", "human_review", True,
    )
    return evaluate_grouping_sequence(
        store, model["candidate"], model["grouping"]["checkpoint"], frames=[frame],
        source_images={frame.uid: image}, labels=[label], partition=partition,
        evaluator_id="fixture-prolog-replay", evaluator_version="v1",
    )


def promote(store, model):
    grade(store, model, f"train-{model['suffix']}", 2, partition="train")
    grade(store, model, f"held-{model['suffix']}", 3, partition="held_out")
    result = evaluate_grouping_promotion(store, model["candidate"], gates=PromotionGates(), promote=True)
    assert result["evaluation"]["eligible"]


def lookup(env):
    _, memory, context, destination = env
    return memory.read_selected("shape", [destination], context)


def observe_with_memory(frame, env, selected, previous=None):
    return observe_grouping_with_memory(
        frame, store=env[0], selected_memory=selected, scope_context={"workspaceId": "workspace"},
        group_support=support(frame), previous_state=previous,
    )


def test_actual_gated_promotion_changes_cross_sequence_prototype_recognition(tmp_path):
    env = environment(tmp_path)
    model = prepare(env)
    target, _ = observed("another-sequence", 4)
    selected = lookup(env)
    original_frame = frame_to_dict(target)
    before = observe_with_memory(target, env, selected)
    assert before["application"]["bindings"] == []
    assert before["observations"][0]["effectivePrototypeUid"] == before["observations"][0]["prototypeUid"]
    promote(env[0], model)
    after = observe_with_memory(target, env, selected)
    binding = after["application"]["bindings"][0]
    saved_uid = model["grouping"]["checkpoint"]["prototypes"][0]["uid"]
    assert binding["prototypeUid"] == saved_uid
    assert after["observations"][0]["effectivePrototypeUid"] == saved_uid
    assert after["observations"][0]["prototypeUid"] != saved_uid
    assert after["checkpoint"]["activeMemoryBindings"] == [binding]
    assert after["checkpoint"]["prototypes"][0]["activeMemoryBindings"]
    assert after["application"]["predictions"][0]["candidateId"] == model["candidate"]
    assert after["application"]["facts"]
    assert after["application"]["selectedMemoryRevision"] == selected_grouping_memory_revision(target, selected)
    assert after["checkpoint"]["checkpointUid"] != before["checkpoint"]["checkpointUid"]
    assert frame_to_dict(target) == original_frame
    assert "events" not in after and "objects" not in after
    validate_checkpoint(after["checkpoint"])
    assert after == observe_with_memory(target, env, selected)


def test_applied_templates_do_not_self_grade_or_repropose_and_demote_themselves(tmp_path):
    env = environment(tmp_path)
    model = prepare(env)
    promote(env[0], model)
    target, image = observed("target", 4)
    result = observe_with_memory(target, env, lookup(env))
    evidence = result["checkpoint"]["prototypes"][0]["evidence"]
    assert evidence and all(not item["eligibleIndependentEvidence"] for item in evidence)
    assert tuple(evidence[0]["used_candidate_ids"]) == (model["candidate"],)
    assert result["candidates"] == [] and result["suppressedCandidates"]
    assert persist_grouping_candidates(env[0], result, training_frames=[target], source_images={target.uid: image}) == []
    assert env[0].get(model["candidate"])["status"] == "promoted"


def test_demotion_removes_effective_bindings_and_retains_historical_provenance(tmp_path):
    env = environment(tmp_path)
    model = prepare(env)
    promote(env[0], model)
    first, _ = observed("target", 4)
    initial = observe_with_memory(first, env, lookup(env))
    grade(env[0], model, "counterexample", 5, partition="held_out", expected=False)
    assert env[0].get(model["candidate"])["status"] == "demoted"
    second, _ = observed("target", 6, order=1)
    after = observe_with_memory(second, env, lookup(env), previous=initial["checkpoint"])
    assert after["application"]["bindings"] == []
    assert after["checkpoint"]["activeMemoryBindings"] == []
    assert all(not prototype.get("activeMemoryBindings") for prototype in after["checkpoint"]["prototypes"])
    assert after["checkpoint"]["prototypes"][0]["memoryBindingHistory"]


def test_memory_selection_and_provider_scope_are_enforced(tmp_path):
    env = environment(tmp_path)
    model = prepare(env)
    promote(env[0], model)
    frame, _ = observed("target", 4)
    assert observe_with_memory(frame, env, {"records": [], "errors": []})["application"]["bindings"] == []
    foreign, _ = observed("target", 4, provider="other-provider")
    result = observe_with_memory(foreign, env, lookup(env))
    assert result["application"]["bindings"] == []
    assert result["application"]["skippedRules"][0]["reason"] == "out_of_scope"
    with pytest.raises(ValueError, match="contradicts"):
        apply_promoted_grouping(frame, env[0], lookup(env), scope_context={"providerId": "forged"})


def test_missing_or_dependent_group_support_cannot_satisfy_template_rule(tmp_path):
    env = environment(tmp_path)
    model = prepare(env)
    promote(env[0], model)
    frame, _ = observed("target", 4)
    selected = lookup(env)
    assert apply_promoted_grouping(frame, env[0], selected, scope_context={})["bindings"] == []
    dependent = {frame.groups[0].uid: GroupingEvidence(
        source_ref="candidate-produced-group", origin="authored_detector", independent=True,
        used_candidate_ids=("different-proposer-alias",),
    )}
    result = observe_grouping_with_memory(
        frame, store=env[0], selected_memory=selected, scope_context={}, group_support=dependent,
    )
    assert result["application"]["bindings"] == []
    assert not result["checkpoint"]["prototypes"][0]["evidence"][0]["eligibleIndependentEvidence"]


def test_unseen_group_only_uses_separately_evaluated_and_promoted_deployment(tmp_path):
    env = environment(tmp_path)
    model = prepare(env)
    promote(env[0], model)
    parent = env[0].get(model["candidate"])
    target, _ = observed("never-reviewed", 8)
    selected = lookup(env)
    child = create_grouping_deployment(
        env[0], model["candidate"], model["grouping"]["checkpoint"], reviewer="review", reason="Evaluate deployment",
    )
    assert apply_promoted_grouping(target, env[0], selected, scope_context={})["bindings"] == []
    deployment = {**model, "candidate": child["candidate_id"], "suffix": "deployment"}
    promote(env[0], deployment)
    result = apply_promoted_grouping(target, env[0], selected, scope_context={})
    assert len(result["bindings"]) == 1
    assert result["bindings"][0]["rules"] == [{
        "candidateId": child["candidate_id"], "candidateVersion": child["version"],
    }]
    assert all(term["predicate"] != "independent_group_support" for term in result["facts"])
    assert env[0].get(model["candidate"]) == parent


def test_grouping_application_identity_ignores_proposal_and_evaluation_receipts(tmp_path):
    env = environment(tmp_path)
    model = prepare(env)
    promote(env[0], model)
    target, _ = observed("target", 8)
    selected = lookup(env)
    before = apply_promoted_grouping(target, env[0], selected, scope_context={}, group_support=support(target))
    candidate = env[0].get(model["candidate"])
    env[0].create(
        candidate["rule"], kind="grouping", scope=candidate["scope"], source="measured_grouping_induction",
        provenance={**candidate["proposals"][0]["provenance"], "auditReceipt": "recaptured"},
        inducer_version=candidate["inducer_version"], entity_ids=candidate["entity_ids"],
    )
    env[0].evaluate(model["candidate"], gates=PromotionGates(min_confidence=0.9))
    after = apply_promoted_grouping(target, env[0], selected, scope_context={}, group_support=support(target))
    assert after == before


def test_current_frame_saved_prototypes_are_not_their_own_priors(tmp_path):
    env = environment(tmp_path)
    model = prepare(env)
    promote(env[0], model)
    result = observe_with_memory(model["seed"], env, lookup(env))
    assert result["application"]["bindings"] == []


def test_self_derived_saved_copies_do_not_compete_with_their_source(tmp_path):
    env = environment(tmp_path)
    model = prepare(env)
    promote(env[0], model)
    first, _ = observed("target", 4)
    initial = observe_with_memory(first, env, lookup(env))
    env[1].save_record("shape", env[3], initial["checkpoint"]["prototypes"][0], env[2])
    second, _ = observed("target", 5, order=1)
    result = observe_with_memory(second, env, lookup(env), previous=initial["checkpoint"])
    assert result["application"]["bindings"][0]["prototypeUid"] == model["grouping"]["checkpoint"]["prototypes"][0]["uid"]
    assert result["application"]["selectedMemoryRevision"] == initial["application"]["selectedMemoryRevision"]
    replay = observe_with_memory(second, env, lookup(env), previous=json.loads(canonical_json(initial["checkpoint"])))
    assert canonical_json(result) == canonical_json(replay)


def test_equal_pixel_and_symbolic_templates_remain_ambiguous(tmp_path):
    env = environment(tmp_path)
    one = prepare(env, "first")
    two = prepare(env, "second")
    assert one["candidate"] == two["candidate"]
    promote(env[0], one)
    frame, _ = observed("target", 4)
    result = observe_with_memory(frame, env, lookup(env))
    assert len(result["application"]["predictions"]) == 1
    assert len(result["application"]["decisions"][0]["matching"]["candidates"]) == 2
    assert result["application"]["bindings"] == []
    assert result["application"]["decisions"][0]["status"] == "ambiguous"


def test_altered_prototype_revision_is_reported_not_used(tmp_path):
    env = environment(tmp_path)
    model = prepare(env)
    promote(env[0], model)
    selected = deepcopy(lookup(env))
    record = next(version for item in selected["records"] for version in item["versions"]
                  if "revisions" in version["payload"])
    record["payload"]["revisions"][0]["points"] = [[3, 3]]
    record["revision"] = content_hash(record["payload"])
    frame, _ = observed("target", 4)
    result = observe_with_memory(frame, env, selected)
    assert result["application"]["bindings"] == []
    assert result["application"]["memoryDiagnostics"]


def test_explicit_counterexample_and_role_are_preserved_separately_from_application(tmp_path):
    env = environment(tmp_path)
    model = prepare(env)
    promote(env[0], model)
    frame, _ = observed("target", 4)
    original = GroupingEvidence(source_ref="independent-human-counterexample", origin="human_review",
                               independent=True, outcome="counterexample", background_role="foreground", confidence=.9)
    result = observe_grouping_with_memory(
        frame, store=env[0], selected_memory=lookup(env), scope_context={},
        group_support=support(frame), evidence_by_group={frame.groups[0].uid: original},
    )
    prototype = result["checkpoint"]["prototypes"][0]
    assert prototype["backgroundRole"]["role"] == "foreground"
    assert any(row["source_ref"] == original.source_ref and row["outcome"] == "counterexample"
               and row["eligibleIndependentEvidence"] for row in prototype["evidence"])
    assert any(row["origin"] == "prototype_prediction" and not row["eligibleIndependentEvidence"]
               for row in prototype["evidence"])
    assert result["suppressedCandidates"][0]["contradictingIds"]
    validate_checkpoint(result["checkpoint"])


def test_prolog_failure_has_no_python_success_fallback(tmp_path, monkeypatch):
    env = environment(tmp_path)
    model = prepare(env)
    promote(env[0], model)
    frame, _ = observed("target", 4)

    def fail(*args, **kwargs):
        raise RuntimeError("SWI fixture failure")

    monkeypatch.setattr(grouping_application, "evaluate_rule", fail)
    with pytest.raises(RuntimeError, match="SWI fixture failure"):
        observe_with_memory(frame, env, lookup(env))


def test_missing_pixels_are_unknown_not_zero_similarity_facts(tmp_path):
    env = environment(tmp_path)
    model = prepare(env)
    promote(env[0], model)
    frame, _ = observed("target", 4)
    missing = replace(frame, groups=(replace(frame.groups[0], points=()),))
    result = observe_with_memory(missing, env, lookup(env))
    assert result["application"]["bindings"] == []
    assert result["application"]["decisions"][0]["status"] == "unmeasurable"
    assert not any(fact["predicate"] == "observed_mask_similarity" for fact in result["application"]["facts"])


def test_rehashed_but_wrong_owner_revision_cannot_join_a_prototype(tmp_path):
    env = environment(tmp_path)
    model = prepare(env)
    promote(env[0], model)
    selected = deepcopy(lookup(env))
    record = next(version for item in selected["records"] for version in item["versions"]
                  if "revisions" in version["payload"])
    revision = record["payload"]["revisions"][0]
    revision["prototypeUid"] = "unrelated-prototype"
    revision["uid"] = stable_id("prototype-revision", {key: value for key, value in revision.items() if key != "uid"})
    record["revision"] = content_hash(record["payload"])
    frame, _ = observed("target", 4)
    result = observe_with_memory(frame, env, selected)
    assert result["application"]["bindings"] == []
    assert "revision chain" in result["application"]["memoryDiagnostics"][0]["reason"]
