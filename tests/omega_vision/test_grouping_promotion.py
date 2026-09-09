from __future__ import annotations

from dataclasses import replace
from concurrent.futures import ThreadPoolExecutor
from io import BytesIO
from threading import Barrier

from PIL import Image
import pytest

from omega_vision.perception.candidate_rules import CandidateRuleStore, PromotionGates
from omega_vision.perception.grouping_learning import observe_grouping
from omega_vision.perception.grouping_promotion import (
    GroupingValidationLabel, create_grouping_deployment, evaluate_grouping_promotion, evaluate_grouping_sequence,
    persist_grouping_candidates, sequence_source_fingerprint,
)
from omega_vision.perception.temporal_correspondence import GroupObservation, TemporalFrame


def frame(sequence, color=1, points=((0, 0), (1, 0))):
    group = GroupObservation(f"final-group-{sequence}", "g1", (f"region-{sequence}",), ("r1",),
                             points, ("red",), (1, 0), "pixel_runs")
    result = TemporalFrame(f"frame-{sequence}", f"bundle-{sequence}", "provider-a", sequence, 0,
                           5, 5, (group,), {"image": f"image-{color}"}, {})
    stream = BytesIO()
    image = Image.new("RGBA", (5, 5), (color, 0, 0, 255))
    for point in points:
        image.putpixel(point, (255, 0, 0, 255))
    image.save(stream, format="PNG")
    return result, stream.getvalue()


def prepared(tmp_path):
    seed, image = frame("seed")
    grouping = observe_grouping(seed)
    store = CandidateRuleStore(tmp_path)
    mapping = persist_grouping_candidates(store, grouping, training_frames=[seed], source_images={seed.uid: image})
    return store, grouping, mapping[0]["candidateId"], seed, image


def replay(store, grouping, candidate_id, sequence, *, partition="held_out", color=2,
           expected=True, independent=True, used=(), points=((0, 0), (1, 0))):
    observed, image = frame(sequence, color, points)
    label = GroupingValidationLabel(
        observed.uid, observed.groups[0].uid, grouping["checkpoint"]["anchors"][0]["uid"],
        expected, f"authored-label:{sequence}:{expected}", "human_review", independent,
        used_candidate_ids=used,
    )
    result = evaluate_grouping_sequence(
        store, candidate_id, grouping["checkpoint"], frames=[observed], source_images={observed.uid: image},
        labels=[label], partition=partition, evaluator_id="authored-template-replay", evaluator_version="v1",
    )
    return result


def test_proposal_persisted_before_replay_without_fabricated_positive_events(tmp_path):
    store, grouping, identifier, _, _ = prepared(tmp_path)
    candidate = store.get(identifier)
    assert candidate["status"] == "proposed"
    assert candidate["evidence"] == []
    evaluation = evaluate_grouping_promotion(store, identifier, gates=PromotionGates())["evaluation"]
    assert not evaluation["eligible"]
    assert evaluation["metrics"]["independent_positive_pairs"] == 0
    assert candidate["proposals"][0]["provenance"]["groupingTraining"]["sourceImageHashes"]


def test_genuine_cross_sequence_replay_promotes_only_after_explicit_gate_check(tmp_path):
    store, grouping, identifier, seed, image = prepared(tmp_path)
    replay(store, grouping, identifier, "training-two", partition="train", color=2)
    replay(store, grouping, identifier, "held-out", color=3)
    assert store.get(identifier)["status"] == "proposed"
    result = evaluate_grouping_promotion(store, identifier, gates=PromotionGates(), promote=True)
    assert result["evaluation"]["eligible"]
    assert result["evaluation"]["metrics"]["independent_positive_groupings"] == 2
    assert result["evaluation"]["metrics"]["held_out_positive_groupings"] == 1
    assert store.get(identifier)["status"] == "promoted"
    assert (tmp_path / store.get(identifier)["promoted_rule_ref"]).is_file()
    evidence = store.get(identifier)["evidence"]
    assert all(item["evidence_kind"] == "grouping_observation" for item in evidence)
    assert all("event_ids" not in item and "pair_id" not in item for item in evidence)
    assert seed.sequence_id == "seed" and image


def test_deployment_has_its_own_ast_evidence_and_explicit_promotion(tmp_path):
    store, grouping, parent_id, _, _ = prepared(tmp_path)
    replay(store, grouping, parent_id, "training", partition="train", color=2)
    replay(store, grouping, parent_id, "held", color=3)
    evaluate_grouping_promotion(store, parent_id, gates=PromotionGates(), promote=True)
    parent = store.get(parent_id)
    child = create_grouping_deployment(
        store, parent_id, grouping["checkpoint"], reviewer="independent reviewer", reason="Evaluate deployment",
    )
    child_id = child["candidate_id"]
    assert child_id != parent_id and child["version"] != parent["version"]
    assert child["parent_ids"] == [parent_id]
    assert child["status"] == "proposed" and child["promoted_rule_ref"] is None
    assert child["evidence"] == child["evaluations"] == []
    assert any(term["predicate"] == "independent_group_support" for term in parent["rule"]["body"])
    assert all(term["predicate"] != "independent_group_support" for term in child["rule"]["body"])
    with pytest.raises(ValueError, match="promotion blocked"):
        evaluate_grouping_promotion(store, child_id, gates=PromotionGates(), promote=True)
    with pytest.raises(ValueError, match="overlap"):
        replay(store, grouping, child_id, "training", color=2)
    replay(store, grouping, child_id, "deployment-training", partition="train", color=4)
    replay(store, grouping, child_id, "deployment-held", color=5)
    assert store.get(child_id)["status"] != "promoted"
    evaluate_grouping_promotion(store, child_id, gates=PromotionGates(), promote=True)
    deployed = store.get(child_id)
    assert deployed["status"] == "promoted"
    for evidence in deployed["evidence"]:
        assert evidence["provenance"]["evaluatedRuleVersion"] == deployed["version"]
        assert evidence["provenance"]["deployment"] is True
        assert all(term["predicate"] != "independent_group_support" for term in evidence["provenance"]["facts"])
    assert store.get(parent_id) == parent
    revision = store.effective_semantics()
    same = create_grouping_deployment(
        store, parent_id, grouping["checkpoint"], reviewer="another reviewer", reason="Repeat request, no retraining",
    )
    assert same["candidate_id"] == child_id and same["status"] == "promoted"
    assert store.effective_semantics() == revision
    new_parent = store.create(
        parent["rule"], kind="grouping", scope=parent["scope"], source="measured_grouping_induction",
        provenance=parent["proposals"][0]["provenance"], inducer_version="new-measured-proposal-version",
        entity_ids=parent["entity_ids"],
    )
    separate = create_grouping_deployment(
        store, new_parent["candidate_id"], grouping["checkpoint"], reviewer="reviewer", reason="New proposal lineage",
    )
    assert separate["candidate_id"] != child_id and separate["status"] == "proposed"
    assert separate["evidence"] == separate["evaluations"] == []


def test_deployment_uses_real_negative_masks_and_dependent_labels_never_promote(tmp_path):
    store, grouping, parent_id, _, _ = prepared(tmp_path)
    child = create_grouping_deployment(store, parent_id, grouping["checkpoint"], reviewer="review", reason="Test exact AST")
    child_id = child["candidate_id"]
    result = replay(store, grouping, child_id, "self-label", color=2, used=(parent_id,))
    assert result["observations"][0]["outcome"] == "inconclusive"
    assert not evaluate_grouping_promotion(store, child_id, gates=PromotionGates())["evaluation"]["eligible"]
    result = replay(store, grouping, child_id, "false-positive", color=3, expected=False)
    assert result["observations"][0]["outcome"] == "counterexample"
    result = replay(store, grouping, child_id, "false-negative", color=4, points=((0, 0), (4, 4)))
    assert result["observations"][0]["outcome"] == "counterexample"
    assert not evaluate_grouping_promotion(store, child_id, gates=PromotionGates())["evaluation"]["eligible"]


def test_arbitrarily_modified_deployment_ast_is_not_evaluated_as_the_template(tmp_path):
    from copy import deepcopy
    store, grouping, parent_id, _, _ = prepared(tmp_path)
    child = create_grouping_deployment(store, parent_id, grouping["checkpoint"], reviewer="review", reason="Test exact AST")
    changed = deepcopy(child["rule"])
    next(term for term in changed["body"] if term["predicate"] == "greater_equal")["args"][1] = 0.1
    altered = store.create(
        changed, kind="grouping", scope=child["scope"], source="measured_grouping_induction",
        provenance=child["proposals"][0]["provenance"], inducer_version=child["inducer_version"],
        entity_ids=child["entity_ids"], parent_ids=child["parent_ids"],
    )
    with pytest.raises(ValueError, match="deployment AST"):
        replay(store, grouping, altered["candidate_id"], "unseen", color=5)
    assert store.get(altered["candidate_id"])["evidence"] == []


def test_self_confirming_labels_never_count_as_independent_support(tmp_path):
    store, grouping, identifier, _, _ = prepared(tmp_path)
    result = replay(store, grouping, identifier, "dependent", used=("proposer-alias",))
    assert result["observations"][0]["outcome"] == "inconclusive"
    assert not result["observations"][0]["independent"]
    assert not result["observations"][0]["prediction"]
    replay(store, grouping, identifier, "unverified", color=3, independent=False)
    evaluation = evaluate_grouping_promotion(store, identifier, gates=PromotionGates())["evaluation"]
    assert evaluation["metrics"]["independent_positive_groupings"] == 0
    assert not evaluation["eligible"]


def test_counterexample_demotes_previously_promoted_template(tmp_path):
    store, grouping, identifier, _, _ = prepared(tmp_path)
    replay(store, grouping, identifier, "train", partition="train")
    replay(store, grouping, identifier, "held", color=3)
    evaluate_grouping_promotion(store, identifier, gates=PromotionGates(), promote=True)
    replay(store, grouping, identifier, "counter", color=4, expected=False)
    assert store.get(identifier)["status"] == "demoted"
    evaluation = evaluate_grouping_promotion(store, identifier, gates=PromotionGates())["evaluation"]
    assert "unresolved_counterexamples" in evaluation["reasons"]


def test_renamed_reencoded_training_image_cannot_be_called_held_out(tmp_path):
    store, grouping, identifier, seed, image = prepared(tmp_path)
    alias = replace(seed, uid="frame-alias", sequence_id="renamed-sequence")
    reencoded = BytesIO()
    Image.open(BytesIO(image)).save(reencoded, format="PNG", compress_level=0)
    assert reencoded.getvalue() != image
    label = GroupingValidationLabel(alias.uid, alias.groups[0].uid, grouping["checkpoint"]["anchors"][0]["uid"],
                                    True, "review:alias", "human_review", True)
    with pytest.raises(ValueError, match="overlap"):
        evaluate_grouping_sequence(
            store, identifier, grouping["checkpoint"], frames=[alias], source_images={alias.uid: reencoded.getvalue()},
            labels=[label], partition="held_out", evaluator_id="replay", evaluator_version="v1",
        )


def test_replay_is_idempotent_and_sequence_aliases_do_not_make_independence(tmp_path):
    store, grouping, identifier, _, _ = prepared(tmp_path)
    first = replay(store, grouping, identifier, "same", partition="train")
    second = replay(store, grouping, identifier, "same", partition="train")
    assert first == second
    assert len(store.get(identifier)["evidence"]) == 1
    with pytest.raises(ValueError, match="overlap"):
        replay(store, grouping, identifier, "alias", color=2)
    result = evaluate_grouping_promotion(store, identifier, gates=PromotionGates())["evaluation"]
    assert result["metrics"]["distinct_sequences"] == 1
    assert result["metrics"]["independent_positive_groupings"] == 1
    assert not result["eligible"]


def test_later_training_proposal_revokes_old_held_out_credit(tmp_path, monkeypatch):
    store, grouping, identifier, _, _ = prepared(tmp_path)
    replay(store, grouping, identifier, "train", partition="train", color=2)
    replay(store, grouping, identifier, "held", color=3)
    evaluate_grouping_promotion(store, identifier, gates=PromotionGates(), promote=True)
    later, image = frame("held", color=3)
    later_grouping = observe_grouping(later)
    original_create = store.create
    def observe_publish(*args, **kwargs):
        assert store.get(identifier)["status"] == "demoted", "revoke held-out credit before publishing new training sources"
        return original_create(*args, **kwargs)
    monkeypatch.setattr(store, "create", observe_publish)
    mapping = persist_grouping_candidates(store, later_grouping, training_frames=[later], source_images={later.uid: image})
    assert mapping[0]["candidateId"] == identifier
    assert store.get(identifier)["status"] == "demoted"
    result = evaluate_grouping_promotion(store, identifier, gates=PromotionGates())["evaluation"]
    assert result["metrics"]["held_out_positive_groupings"] == 0
    assert not result["eligible"]


def test_concurrent_training_expansion_cannot_leave_template_promoted(tmp_path):
    store, grouping, identifier, _, _ = prepared(tmp_path)
    replay(store, grouping, identifier, "train", partition="train", color=2)
    replay(store, grouping, identifier, "held", color=3)
    evaluate_grouping_promotion(store, identifier, gates=PromotionGates(), promote=True)
    later, image = frame("held", color=3)
    update = observe_grouping(later)
    barrier = Barrier(2)
    def expand():
        barrier.wait()
        return persist_grouping_candidates(store, update, training_frames=[later], source_images={later.uid: image})
    def activate():
        barrier.wait()
        try:
            return evaluate_grouping_promotion(store, identifier, gates=PromotionGates(), promote=True)
        except ValueError:
            return None
    with ThreadPoolExecutor(max_workers=2) as executor:
        expansion, activation = executor.submit(expand), executor.submit(activate)
        expansion.result()
        activation.result()
    assert store.get(identifier)["status"] == "demoted"


def test_true_negative_is_not_positive_grouping_recurrence(tmp_path):
    store, grouping, identifier, _, _ = prepared(tmp_path)
    result = replay(store, grouping, identifier, "different-shape", expected=False, points=((0, 0),))
    assert not result["observations"][0]["prediction"]
    assert result["observations"][0]["outcome"] == "inconclusive"


def test_missing_independently_expected_template_is_still_a_counterexample(tmp_path):
    store, grouping, identifier, _, _ = prepared(tmp_path)
    result = replay(store, grouping, identifier, "missed-template", expected=True, points=((0, 0),))
    assert not result["observations"][0]["prediction"]
    assert result["observations"][0]["outcome"] == "counterexample"
    assert store.get(identifier)["evidence"][0]["provenance"]["predictions"] == []


def test_source_images_and_group_labels_must_match_actual_replay(tmp_path):
    store, grouping, identifier, seed, image = prepared(tmp_path)
    with pytest.raises(ValueError, match="every replay frame"):
        sequence_source_fingerprint([seed], {})
    with pytest.raises(ValueError, match="ordered"):
        sequence_source_fingerprint([seed, seed], {seed.uid: image})
    observed, source = frame("other", 2)
    label = GroupingValidationLabel(observed.uid, "not-a-final-group", grouping["checkpoint"]["anchors"][0]["uid"],
                                    True, "review:bad", "human_review", True)
    with pytest.raises(ValueError, match="actual final G"):
        evaluate_grouping_sequence(
            store, identifier, grouping["checkpoint"], frames=[observed], source_images={observed.uid: source},
            labels=[label], partition="held_out", evaluator_id="replay", evaluator_version="v1",
        )


def test_real_prolog_rule_predictions_and_engine_version_are_audited(tmp_path):
    store, grouping, identifier, _, _ = prepared(tmp_path)
    result = replay(store, grouping, identifier, "prolog-held", color=2)
    assert result["observations"][0]["prediction"]
    provenance = store.get(identifier)["evidence"][0]["provenance"]
    assert provenance["ruleEngineVersion"].startswith("typed-rule-engine-")
    assert provenance["predictions"] == [{
        "predicate": "grouping_template_candidate",
        "args": ["final-group-prolog-held", grouping["checkpoint"]["anchors"][0]["uid"]],
    }]
    assert {fact["predicate"] for fact in provenance["facts"]} == {
        "observed_mask_similarity", "independent_group_support",
    }


def test_prolog_failure_is_visible_and_never_replaced_by_python_support(tmp_path, monkeypatch):
    from omega_vision.perception import grouping_promotion
    store, grouping, identifier, _, _ = prepared(tmp_path)
    def fail(*args, **kwargs):
        raise RuntimeError("Prolog replay failed")
    monkeypatch.setattr(grouping_promotion, "evaluate_rule", fail)
    with pytest.raises(RuntimeError, match="Prolog replay failed"):
        replay(store, grouping, identifier, "failed-replay", color=2)
    assert store.get(identifier)["evidence"] == []
    assert store.get(identifier)["status"] == "proposed"


def test_matching_rule_under_a_different_scope_cannot_collect_support(tmp_path):
    store, grouping, _, _, _ = prepared(tmp_path)
    proposal = {**grouping["candidates"][0]["storeProposal"], "scope": {"providerId": "another-provider"}}
    other = store.create(**proposal)
    with pytest.raises(ValueError, match="provider scope"):
        replay(store, grouping, other["candidate_id"], "wrong-scope", partition="train")
    assert store.get(other["candidate_id"])["evidence"] == []
