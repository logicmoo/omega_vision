from __future__ import annotations

from concurrent.futures import ProcessPoolExecutor
import multiprocessing

import pytest

from omega_vision.perception.candidate_rules import CandidateRuleStore, PromotionGates, ValidationError


def _training(provider="opencv", sequence="training-source", fingerprint="training-fingerprint", image="training-image"):
    return {
        "providerId": provider, "sequenceId": sequence, "sequenceFingerprint": fingerprint,
        "sourceImageHashes": [image], "frameUids": [f"frame-{sequence}"], "adapterVersion": "test-v1",
    }


def _proposal(training):
    group, anchor, score = {"var": "Group"}, "shape-anchor-abc", {"var": "Score"}
    return {
        "rule": {
            "head": {"predicate": "grouping_template_candidate", "args": [group, anchor]},
            "body": [
                {"predicate": "observed_mask_similarity", "args": [group, anchor, score]},
                {"predicate": "greater_equal", "args": [score, 0.82]},
                {"predicate": "independent_group_support", "args": [group]},
            ],
        },
        "kind": "grouping", "scope": {"domain": "test"}, "source": "measured_grouping_induction",
        "provenance": {"groupingTraining": training}, "inducer_version": "test-v1", "entity_ids": [anchor],
    }


def _evidence(held_out=False, nested=False):
    name = "heldout" if held_out else "training"
    provenance = {
        "providerId": "opencv", "sourceSequenceId": f"{name}-source",
        "sourceImageHash": f"{name}-image",
    }
    return {
        "sequence_id": f"opencv:{name}-source", "sequence_fingerprint": f"{name}-fingerprint",
        "observation_id": f"{name}-observation", "observation_hash": f"{name}-observation-hash",
        "partition": "held_out" if held_out else "train", "outcome": "support",
        "comparison_complete": True, "confidence": 0.98, "grouping_ids": [f"group-observation-{name}"],
        "evidence_refs": [f"{name}-source-ref"], "source": "deterministic_replay",
        "evaluator_id": "independent-template-replay", "evaluator_version": "v1",
        "depends_on_candidates": [], "depends_on_prototypes": [],
        "provenance": {"observation": provenance} if nested else provenance,
    }


def _ready(store, status="promoted", nested=False):
    candidate = store.create(**_proposal(_training()))
    candidate_id = candidate["candidate_id"]
    store.record_grouping_evidence(candidate_id, _evidence())
    store.record_grouping_evidence(candidate_id, _evidence(held_out=True, nested=nested))
    assert store.evaluate(candidate_id, gates=PromotionGates())["eligible"]
    if status == "promoted":
        store.promote(candidate_id, gates=PromotionGates())
    return candidate_id


@pytest.mark.parametrize("status", ["eligible", "promoted"])
@pytest.mark.parametrize("overlap", ["source", "fingerprint", "image"])
@pytest.mark.parametrize("nested", [False, True])
def test_new_training_proposal_atomically_invalidates_heldout_promotion(tmp_path, status, overlap, nested):
    store = CandidateRuleStore(tmp_path)
    candidate_id = _ready(store, status=status, nested=nested)
    old_bytes = {path: path.read_bytes() for path in store.path.glob("*.json")}
    training = _training("another-provider", "another-source", "another-fingerprint", "another-image")
    if overlap == "source":
        training.update(providerId="opencv", sequenceId="heldout-source")
    elif overlap == "fingerprint":
        training["sequenceFingerprint"] = "heldout-fingerprint"
    else:
        training["sourceImageHashes"] = ["heldout-image"]
    updated = store.create(**_proposal(training))
    assert updated["candidate_id"] == candidate_id
    assert updated["status"] == "demoted"
    assert CandidateRuleStore(tmp_path).get(candidate_id)["status"] == "demoted"
    assert updated["history"][-1]["operation"] == "proposal"
    assert updated["history"][-1]["status"] == "demoted"
    assert len(updated["evidence"]) == 2
    assert updated["evidence"][1]["partition"] == "held_out"
    evaluation = store.evaluate(candidate_id, gates=PromotionGates())
    assert not evaluation["eligible"]
    assert evaluation["metrics"]["held_out_positive_groupings"] == 0
    assert evaluation["metrics"]["deterministic_held_out_groupings"] == 0
    assert evaluation["metrics"]["training_overlap_held_out_records"] == 1
    with pytest.raises(ValidationError, match="held_out"):
        store.promote(candidate_id, gates=PromotionGates())
    assert all(path.read_bytes() == original for path, original in old_bytes.items())


def test_exact_duplicate_training_proposal_does_not_demote_or_append(tmp_path):
    store = CandidateRuleStore(tmp_path)
    candidate_id = _ready(store)
    before = store.get(candidate_id)
    assert store.create(**_proposal(_training())) == before


def test_training_receipt_only_changes_do_not_demote_or_invalidate_semantics(tmp_path):
    store = CandidateRuleStore(tmp_path)
    candidate_id = _ready(store)
    before = store.effective_semantics()
    proposal = _proposal(_training())
    proposal["provenance"]["auditReceipt"] = "another-capture-of-the-same-training-input"
    updated = store.create(**proposal)
    assert updated["status"] == "promoted" and len(updated["proposals"]) == 2
    assert store.effective_semantics() == before
    assert store.evaluate(candidate_id, gates=PromotionGates(min_confidence=0.9))["eligible"]
    assert store.get(candidate_id)["status"] == "promoted"
    assert store.effective_semantics() == before


@pytest.mark.parametrize("training", [
    _training("different-provider", "heldout-source", "new-fingerprint", "new-image"),
    _training("opencv", "different-source", "new-fingerprint", "new-image"),
])
def test_source_overlap_requires_both_provider_and_sequence(tmp_path, training):
    store = CandidateRuleStore(tmp_path)
    candidate_id = _ready(store)
    updated = store.create(**_proposal(training))
    assert updated["status"] == "demoted"
    evaluation = store.evaluate(candidate_id, gates=PromotionGates())
    assert evaluation["eligible"]
    assert evaluation["metrics"]["held_out_positive_groupings"] == 1
    assert evaluation["metrics"]["training_overlap_held_out_records"] == 0


def test_initial_proposal_training_excludes_mislabeled_heldout_records(tmp_path):
    store = CandidateRuleStore(tmp_path)
    candidate_id = store.create(**_proposal(_training(image="heldout-image")))["candidate_id"]
    store.record_grouping_evidence(candidate_id, _evidence())
    store.record_grouping_evidence(candidate_id, _evidence(held_out=True))
    assert not store.evaluate(candidate_id, gates=PromotionGates())["eligible"]


def test_renamed_evidence_cannot_restore_heldout_credit_for_overlapping_observation(tmp_path):
    store = CandidateRuleStore(tmp_path)
    candidate_id = _ready(store)
    alias = _evidence(held_out=True)
    alias.update(sequence_id="renamed-copy", sequence_fingerprint="different-fingerprint")
    alias["provenance"] = {
        "providerId": "different-provider", "sourceSequenceId": "renamed-source",
        "sourceImageHash": "unrelated-provenance-hash",
    }
    store.record_grouping_evidence(candidate_id, alias)
    store.create(**_proposal(_training("another", "another", "another", "heldout-image")))
    evaluation = store.evaluate(candidate_id, gates=PromotionGates())
    assert evaluation["metrics"]["held_out_positive_groupings"] == 0
    assert evaluation["metrics"]["distinct_sequences"] <= evaluation["metrics"]["independent_positive_examples"]
    assert not evaluation["eligible"]


def test_malformed_training_provenance_fails_before_persistence(tmp_path):
    store = CandidateRuleStore(tmp_path)
    with pytest.raises(ValidationError, match="groupingTraining"):
        store.create(**_proposal({"providerId": "opencv"}))
    assert store.list() == []


def _promote_worker(path, candidate_id):
    try:
        CandidateRuleStore(path).promote(candidate_id, gates=PromotionGates())
        return "promoted"
    except ValidationError:
        return "blocked"


def _training_worker(path):
    return CandidateRuleStore(path).create(**_proposal(_training(
        "different-provider", "different-source", "different-fingerprint", "heldout-image",
    )))["status"]


def test_cross_process_training_update_cannot_leave_stale_promotion_active(tmp_path):
    store = CandidateRuleStore(tmp_path)
    candidate_id = _ready(store, status="eligible")
    with ProcessPoolExecutor(max_workers=2, mp_context=multiprocessing.get_context("spawn")) as executor:
        promote = executor.submit(_promote_worker, str(tmp_path), candidate_id)
        training = executor.submit(_training_worker, str(tmp_path))
        assert promote.result(timeout=30) in {"promoted", "blocked"}
        assert training.result(timeout=30) == "demoted"
    assert CandidateRuleStore(tmp_path).get(candidate_id)["status"] == "demoted"
    assert not store.evaluate(candidate_id, gates=PromotionGates())["eligible"]


@pytest.mark.parametrize("overlap", ["sequence_id", "fingerprint", "image", "provider_sequence"])
@pytest.mark.parametrize("nested", [False, True])
def test_declared_train_grouping_invalidates_other_heldout_observations_from_source(tmp_path, overlap, nested):
    store = CandidateRuleStore(tmp_path)
    candidate_id = _ready(store, nested=nested)
    later = _evidence()
    later.update(
        sequence_id="another-source-id", sequence_fingerprint="another-fingerprint",
        observation_id="different-frame-or-group", observation_hash="different-observation-content",
        grouping_ids=["group-observation-later-training"],
    )
    provenance = {
        "providerId": "another-provider", "sourceSequenceId": "another-source",
        "sourceImageHash": "another-source-image",
    }
    if overlap == "sequence_id":
        later["sequence_id"] = "opencv:heldout-source"
    elif overlap == "fingerprint":
        later["sequence_fingerprint"] = "heldout-fingerprint"
    elif overlap == "image":
        provenance["sourceImageHash"] = "heldout-image"
    else:
        provenance.update(providerId="opencv", sourceSequenceId="heldout-source")
    later["provenance"] = {"observation": provenance} if nested else provenance
    assert store.record_grouping_evidence(candidate_id, later)["status"] == "demoted"
    evaluated = store.evaluate(candidate_id, gates=PromotionGates())
    assert evaluated["metrics"]["held_out_positive_groupings"] == 0
    assert evaluated["metrics"]["deterministic_held_out_groupings"] == 0
    assert evaluated["metrics"]["training_overlap_held_out_records"] == 1
    with pytest.raises(ValidationError, match="held_out"):
        store.promote(candidate_id, gates=PromotionGates())
    assert store.get(candidate_id)["evidence"][1]["partition"] == "held_out"


def test_grouping_source_exclusion_does_not_change_event_pair_holdout_policy(tmp_path):
    store = CandidateRuleStore(tmp_path)
    x = {"var": "X"}
    candidate = store.create(
        {"body": [{"predicate": "present", "args": [x]}], "head": {"predicate": "moved", "args": [x]}},
        kind="event_detector", scope={"domain": "test"}, source="authored",
        provenance={"code_hash": "authored-v1"}, inducer_version="v1",
    )
    for index, partition in enumerate(("train", "held_out")):
        store.record_evidence(candidate["candidate_id"], {
            "sequence_id": "same-sequence", "sequence_fingerprint": "same-source-content",
            "pair_id": f"pair-{index}", "before_hash": f"before-{index}", "after_hash": f"after-{index}",
            "partition": partition, "outcome": "support", "assessment": "changed", "comparison_complete": True,
            "confidence": 0.95, "event_ids": [f"event-{index}"], "evidence_refs": [f"measurement-{index}"],
            "source": "deterministic_replay", "evaluator_id": "independent-detector", "evaluator_version": "v1",
            "depends_on_candidates": [],
        })
    result = store.evaluate(candidate["candidate_id"], gates=PromotionGates(min_distinct_sequences=1))
    assert result["eligible"]
    assert result["metrics"]["held_out_positive_pairs"] == 1
