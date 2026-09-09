from __future__ import annotations

from concurrent.futures import ProcessPoolExecutor
import multiprocessing

import pytest

from omega_vision.perception._event_journal import IntegrityError
from omega_vision.perception.candidate_rules import CandidateRuleStore, PromotionGates, ValidationError


def term(predicate, *args):
    return {"predicate": predicate, "args": list(args)}


def rule(variable="X"):
    return {"body": [term("present", {"var": variable})], "head": term("moved", {"var": variable})}


def create(store, source="prolog_induction", **kwargs):
    provenance = {"code_hash": "code-v1"}
    if source == "llm_proposal":
        provenance.update({"model": "model", "backend": "backend", "prompt_ref": "prompts/p1", "raw_output_ref": "outputs/r1"})
    return store.create(
        rule(), kind="event_detector", scope={"domain": "test"}, source=source,
        provenance=provenance, inducer_version="v1", **kwargs,
    )


def evidence(index, **kwargs):
    return {
        "sequence_id": f"sequence-{index}", "sequence_fingerprint": f"sequence-content-{index}",
        "pair_id": f"pair-{index}", "before_hash": f"before-{index}", "after_hash": f"after-{index}",
        "partition": "held_out", "outcome": "support", "assessment": "changed",
        "comparison_complete": True, "confidence": 0.95, "event_ids": [f"event-{index}"],
        "evidence_refs": [f"measurement-{index}"], "source": "deterministic_replay",
        "evaluator_id": "accepted-detector", "evaluator_version": "1", "depends_on_candidates": [],
        **kwargs,
    }


def _writer(path, index):
    store = CandidateRuleStore(path)
    candidate = create(store)
    result = store.record_evidence(candidate["candidate_id"], evidence(index))
    return result["candidate_id"]


def test_candidate_is_persisted_before_evaluation_and_alpha_deduplicates(tmp_path):
    store = CandidateRuleStore(tmp_path)
    candidate = create(store)
    assert candidate["status"] == "proposed"
    assert candidate["evaluations"] == [] and candidate["evidence"] == []
    reopened = CandidateRuleStore(tmp_path)
    assert reopened.get(candidate["candidate_id"]) == candidate
    duplicate = store.create(
        rule("Renamed"), kind="event_detector", scope={"domain": "test"}, source="prolog_induction",
        provenance={"code_hash": "code-v1"}, inducer_version="v1",
    )
    assert duplicate == candidate and len(store.list()) == 1
    variant = store.create(
        rule(), kind="event_detector", scope={"domain": "other"}, source="prolog_induction",
        provenance={"code_hash": "code-v1"}, inducer_version="v1",
    )
    assert variant["candidate_id"] != candidate["candidate_id"]


def test_evidence_replay_promotion_and_contradiction_demote_without_mutation(tmp_path):
    store = CandidateRuleStore(tmp_path)
    candidate_id = create(store)["candidate_id"]
    first = store.record_evidence(candidate_id, evidence(1))
    assert store.record_evidence(candidate_id, evidence(1)) == first
    store.record_evidence(candidate_id, evidence(2))
    gates = PromotionGates()
    evaluated = store.evaluate(candidate_id, gates=gates)
    assert evaluated["eligible"] and evaluated["metrics"]["independent_positive_pairs"] == 2
    promoted = store.promote(candidate_id, gates=gates)
    assert promoted["status"] == "promoted"
    assert (tmp_path / promoted["promoted_rule_ref"]).is_file()
    assert store.promote(candidate_id, gates=gates) == promoted
    files_before = {path: path.read_bytes() for path in store.path.glob("*.json")}
    contradictory = evidence(1, outcome="counterexample", evaluator_id="independent-review")
    demoted = store.record_evidence(candidate_id, contradictory)
    assert demoted["status"] == "demoted"
    evaluation = store.evaluate(candidate_id, gates=gates)
    assert not evaluation["eligible"]
    assert evaluation["metrics"]["contradictory_pairs"] == 1
    with pytest.raises(ValidationError, match="counterexamples"):
        store.promote(candidate_id, gates=gates)
    for path, original in files_before.items():
        assert path.read_bytes() == original
    assert len(store.get(candidate_id)["evidence"]) == 3


def test_distinct_sequence_content_not_import_aliases(tmp_path):
    store = CandidateRuleStore(tmp_path)
    candidate_id = create(store)["candidate_id"]
    store.record_evidence(candidate_id, evidence(1, sequence_fingerprint="same-recording-content"))
    store.record_evidence(candidate_id, evidence(2, sequence_fingerprint="same-recording-content"))
    result = store.evaluate(candidate_id, gates=PromotionGates())
    assert result["metrics"]["independent_positive_pairs"] == 2
    assert result["metrics"]["distinct_sequences"] == 1
    assert not result["eligible"]


def test_sequence_aliases_and_revisions_do_not_manufacture_distinct_sequences(tmp_path):
    store = CandidateRuleStore(tmp_path)
    candidate_id = create(store)["candidate_id"]
    store.record_evidence(candidate_id, evidence(1, sequence_id="same-source", sequence_fingerprint="content-a"))
    store.record_evidence(candidate_id, evidence(2, sequence_id="same-source", sequence_fingerprint="content-b"))
    store.record_evidence(candidate_id, evidence(3, sequence_id="alias-of-source", sequence_fingerprint="content-a"))
    result = store.evaluate(candidate_id, gates=PromotionGates())
    assert result["metrics"]["distinct_sequences"] == 1
    assert not result["eligible"]


def test_reimported_identical_frame_pair_is_not_independent(tmp_path):
    store = CandidateRuleStore(tmp_path)
    candidate_id = create(store)["candidate_id"]
    store.record_evidence(candidate_id, evidence(1))
    store.record_evidence(candidate_id, evidence(2, before_hash="before-1", after_hash="after-1"))
    result = store.evaluate(candidate_id, gates=PromotionGates())
    assert result["metrics"]["independent_positive_pairs"] == 1
    assert not result["eligible"]


def test_renamed_pair_and_duplicate_evaluator_do_not_create_recurrence(tmp_path):
    store = CandidateRuleStore(tmp_path)
    candidate_id = create(store)["candidate_id"]
    store.record_evidence(candidate_id, evidence(1))
    store.record_evidence(candidate_id, evidence(1, pair_id="another-pair-name", evaluator_id="another-evaluator"))
    result = store.evaluate(candidate_id, gates=PromotionGates(min_distinct_sequences=1))
    assert result["metrics"]["independent_positive_pairs"] == 1
    assert not result["eligible"]


def test_training_pair_cannot_be_relabelled_held_out(tmp_path):
    store = CandidateRuleStore(tmp_path)
    candidate_id = create(store)["candidate_id"]
    for index in (1, 2):
        store.record_evidence(candidate_id, evidence(index, partition="train"))
        store.record_evidence(candidate_id, evidence(index))
    result = store.evaluate(candidate_id, gates=PromotionGates())
    assert result["metrics"]["held_out_positive_pairs"] == 0
    assert not result["eligible"]


def test_llm_default_manual_and_no_self_confirmation(tmp_path):
    store = CandidateRuleStore(tmp_path)
    candidate_id = create(store, source="llm_proposal")["candidate_id"]
    store.record_evidence(candidate_id, evidence(1, source="llm_hypothesis"))
    store.record_evidence(candidate_id, evidence(2, depends_on_candidates=[candidate_id]))
    store.record_evidence(candidate_id, evidence(3, evaluator_id=candidate_id))
    result = store.evaluate(candidate_id, gates=PromotionGates())
    assert result["metrics"]["independent_positive_pairs"] == 0
    assert result["metrics"]["excluded_nonindependent_records"] == 3
    store.record_evidence(candidate_id, evidence(4))
    store.record_evidence(candidate_id, evidence(5))
    assert not store.evaluate(candidate_id, gates=PromotionGates())["eligible"]
    with pytest.raises(ValidationError, match="manual"):
        store.promote(candidate_id, gates=PromotionGates(allow_llm=True))
    promoted = store.promote(candidate_id, gates=PromotionGates(allow_llm=True), manual_approval_by="reviewer:1")
    assert promoted["status"] == "promoted"


def test_unknown_empty_and_boundary_never_become_positive_recurrence(tmp_path):
    store = CandidateRuleStore(tmp_path)
    candidate_id = create(store)["candidate_id"]
    for assessment in ("unknown", "initial_observation", "no_material_change"):
        with pytest.raises(ValidationError):
            store.record_evidence(candidate_id, evidence(1, assessment=assessment, event_ids=[]))
    for index in (1, 2):
        store.record_evidence(candidate_id, evidence(
            index, assessment="unknown", outcome="inconclusive", comparison_complete=False, event_ids=[],
        ))
    result = store.evaluate(candidate_id, gates=PromotionGates())
    assert result["metrics"]["independent_positive_pairs"] == 0
    assert result["metrics"]["counterexample_pairs"] == 0
    with pytest.raises(ValidationError, match="uncertainty"):
        store.record_evidence(candidate_id, evidence(3, assessment="unknown", outcome="counterexample"))


def test_valid_nochange_counterexample_blocks_and_rejection_is_durable(tmp_path):
    store = CandidateRuleStore(tmp_path)
    candidate_id = create(store)["candidate_id"]
    store.record_evidence(candidate_id, evidence(1))
    store.record_evidence(candidate_id, evidence(2))
    store.record_evidence(candidate_id, evidence(3, outcome="counterexample", assessment="no_material_change", event_ids=[]))
    assert not store.evaluate(candidate_id, gates=PromotionGates())["eligible"]
    rejected = store.reject(candidate_id, reason="fails held-out replay", provenance={"reviewer": "human"})
    assert rejected["status"] == "rejected"
    assert len(CandidateRuleStore(tmp_path).get(candidate_id)["evidence"]) == 3
    assert store.list(status="rejected")[0]["candidate_id"] == candidate_id


def test_detector_requires_deterministic_heldout_and_gate_configuration(tmp_path):
    store = CandidateRuleStore(tmp_path)
    candidate_id = create(store)["candidate_id"]
    for index in (1, 2):
        store.record_evidence(candidate_id, evidence(index, source="human_review"))
    result = store.evaluate(candidate_id, gates=PromotionGates())
    assert "detector_requires_held_out_deterministic_replay" in result["reasons"]
    with pytest.raises(ValidationError):
        PromotionGates(min_independent_pairs=1)
    with pytest.raises(ValidationError):
        store.evaluate(candidate_id, gates=None)


def test_cross_process_writers_append_once_without_lost_evidence(tmp_path):
    context = multiprocessing.get_context("spawn")
    with ProcessPoolExecutor(max_workers=4, mp_context=context) as executor:
        futures = [executor.submit(_writer, str(tmp_path), index % 4) for index in range(8)]
        ids = [future.result(timeout=40) for future in futures]
    assert len(set(ids)) == 1
    candidate = CandidateRuleStore(tmp_path).get(ids[0])
    assert len(candidate["evidence"]) == 4
    assert len(candidate["proposals"]) == 1
    assert len(candidate["history"]) == 5


def test_corrupted_history_is_visible(tmp_path):
    store = CandidateRuleStore(tmp_path)
    create(store)
    record = next(store.path.glob("*.json"))
    record.write_text(record.read_text(encoding="utf-8").replace('"proposed"', '"promoted"'), encoding="utf-8")
    with pytest.raises(IntegrityError):
        store.list()


def test_failed_atomic_publication_raises_without_committing_a_partial_candidate(tmp_path, monkeypatch):
    from omega_vision.perception import _event_journal

    store = CandidateRuleStore(tmp_path)

    def fail_replace(source, target):
        raise PermissionError("publication denied")

    with monkeypatch.context() as patch:
        patch.setattr(_event_journal.os, "replace", fail_replace)
        with pytest.raises(PermissionError, match="denied"):
            create(store)
    assert store.list() == []
    assert not list(store.path.glob("*.pending-*"))
    assert create(store)["status"] == "proposed"


def test_measured_grouping_source_is_durable_and_cannot_claim_visual_detector_authority(tmp_path):
    store = CandidateRuleStore(tmp_path)
    group, score = {"var": "Group"}, {"var": "Score"}
    anchor = "shape-anchor-012345"
    candidate = store.create(
        {
            "body": [
                term("observed_mask_similarity", group, anchor, score),
                term("greater_equal", score, 0.82),
                term("independent_group_support", group),
            ],
            "head": term("grouping_template_candidate", group, anchor),
        },
        kind="grouping", scope={"domain": "test"}, source="measured_grouping_induction",
        provenance={"code_hash": "grouping-v1", "anchor_id": anchor}, inducer_version="v1",
        entity_ids=[anchor],
    )
    assert candidate["status"] == "proposed"
    assert candidate["proposals"][0]["source"] == "measured_grouping_induction"
    assert not store.evaluate(candidate["candidate_id"], gates=PromotionGates())["eligible"]
    assert CandidateRuleStore(tmp_path).get(candidate["candidate_id"])["kind"] == "grouping"
    with pytest.raises(ValidationError, match="only valid for grouping"):
        create(store, source="measured_grouping_induction")
