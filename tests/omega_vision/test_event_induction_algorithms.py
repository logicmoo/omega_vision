from __future__ import annotations

import json
import shutil

import pytest

from omega_vision.perception.candidate_rules import CandidateRuleStore, PromotionGates
from omega_vision.perception.event_induction import (
    CandidateProposalError, evaluate_candidate, evaluate_grouping_candidate, evaluate_rule,
    induce_detector_rules, induce_transition_rules,
    ingest_llm_rule_proposals, normalize_example, replay_promoted_detectors, replay_promoted_transitions,
)
from omega_vision.perception.event_records import ValidationError, normalize_rule

pytestmark = pytest.mark.skipif(shutil.which("swipl") is None, reason="SWI-Prolog unavailable")


def term(name, *args):
    return {"predicate": name, "args": list(args)}


def example(sequence, *, order=0, distance=2, label="moved", partition="train", source="deterministic_replay", dependencies=(), action=None):
    entity = f"group-track-{sequence}"
    events = [] if label is None else [{
        "term": term(label, entity), "event_id": f"event-{sequence}-{order}-{label}",
        "confidence": 0.98, "provenance": {"source": source},
    }]
    return {
        "source_pair": {
            "sequence_id": sequence, "from_frame": f"{sequence}-frame-{order}", "to_frame": f"{sequence}-frame-{order + 1}",
            "before_hash": f"{sequence}-image-{order}", "after_hash": f"{sequence}-image-{order + 1}",
        },
        "source_order": order, "target_order": order + 1,
        "sequence_fingerprint": f"recording-content-{sequence}", "entity_ids": [entity],
        "facts": [term("displacement_magnitude", entity, distance), term("present", entity)],
        "context": [], "actions": [term("user_input", entity, action)] if action else [],
        "events": events, "assessment": "changed" if events else "no_material_change",
        "comparison_complete": True, "confidence": 0.98,
        "evidence": [f"measured-source-{sequence}-{order}"], "uncertainty": [],
        "partition": partition, "label_source": source, "label_coverage": ["moved", "rotated"],
        "depends_on_candidates": list(dependencies), "provenance": {"label_artifact": "independent-source"},
        "scope_context": {"domain": "test"},
    }


def test_safe_ast_replay_numeric_bindings_and_explicit_exception_knowledge():
    x, amount = {"var": "X"}, {"var": "Amount"}
    rule = {
        "body": [term("greater_equal", amount, 1.5), term("displacement_magnitude", x, amount)],
        "head": term("moved", x), "exceptions": [term("stationary", x)],
    }
    facts = [term("displacement_magnitude", "track:1", 2)]
    kwargs = dict(kind="event_detector", facts=facts, entity_ids=["track:1"])
    assert evaluate_rule(rule, **kwargs) == []
    assert evaluate_rule(rule, **kwargs, complete_predicates=["stationary"]) == [term("moved", "track:1")]
    assert evaluate_rule(rule, **kwargs, known_absent=[term("stationary", "track:1")]) == [term("moved", "track:1")]
    assert evaluate_rule(rule, **{**kwargs, "facts": [*facts, term("stationary", "track:1")]}, complete_predicates=["stationary"]) == []
    with pytest.raises(ValidationError, match="bound"):
        normalize_rule({"body": [term("present", x), term("greater_equal", amount, 1)], "head": term("moved", x)}, kind="event_detector")
    with pytest.raises(ValidationError):
        evaluate_rule({"body": [term("call", x)], "head": term("moved", x)}, **kwargs)


def test_detector_induction_persists_then_replays_heldout_and_promotes(tmp_path):
    store = CandidateRuleStore(tmp_path)
    examples = [
        example("train-a", distance=2), example("train-b", distance=3),
        example("train-negative", distance=0, label=None),
        example("heldout-a", distance=4, partition="held_out"),
        example("heldout-negative", distance=0, label=None, partition="held_out"),
    ]
    result = induce_detector_rules(
        store, examples, scope={"domain": "test"},
        feature_predicates=["displacement_magnitude"], gates=PromotionGates(), promote=True,
    )
    assert len(result["candidates"]) == 1
    candidate = result["candidates"][0]
    assert candidate["status"] == "promoted"
    assert candidate["history"][0]["operation"] == "create"
    assert any(item["predicate"] == "greater_equal" and item["args"][1] == 1.0 for item in candidate["rule"]["body"])
    actual = replay_promoted_detectors(
        store, [term("displacement_magnitude", "new-track", 5)],
        entity_ids=["new-track"], scope_context={"domain": "test"},
    )
    assert actual["events"][0]["term"] == term("moved", "new-track")
    assert actual["events"][0]["provenance"]["source"] == "prolog"
    assert candidate["candidate_id"] in actual["accepted_detectors"]
    assert replay_promoted_detectors(
        store, [term("displacement_magnitude", "new-track", 5)],
        entity_ids=["new-track"], scope_context={"domain": "unrelated"},
    )["events"] == []
    contradiction = example("new-counterexample", distance=4, label=None, partition="held_out")
    graded = evaluate_candidate(store, candidate["candidate_id"], [contradiction], gates=PromotionGates(), promote=True)
    assert graded["status"] != "promoted"
    assert graded["evaluation"]["metrics"]["counterexample_pairs"] == 1
    assert replay_promoted_detectors(
        store, [term("displacement_magnitude", "new-track", 5)],
        entity_ids=["new-track"], scope_context={"domain": "test"},
    )["events"] == []


def test_llm_training_labels_create_candidates_but_not_independent_confirmation(tmp_path):
    store = CandidateRuleStore(tmp_path)
    samples = [
        example("llm-a", source="llm_hypothesis"),
        example("llm-b", distance=3, source="llm_hypothesis"),
        example("llm-c", distance=4, source="llm_hypothesis", partition="held_out"),
    ]
    result = induce_detector_rules(
        store, samples, scope={"domain": "test"}, feature_predicates=["displacement_magnitude"],
        gates=PromotionGates(), promote=True,
    )
    candidate = result["candidates"][0]
    assert candidate["status"] != "promoted"
    assert result["evaluations"][0]["evaluation"]["metrics"]["independent_positive_pairs"] == 0
    evidence = example("self-dependent", distance=4, partition="held_out", dependencies=[candidate["candidate_id"]])
    graded = evaluate_candidate(store, candidate["candidate_id"], [evidence], gates=PromotionGates())
    assert graded["evaluation"]["metrics"]["independent_positive_pairs"] == 0


def test_heldout_data_never_changes_learned_threshold(tmp_path):
    samples = [example("a", distance=2), example("b", distance=3), example("negative", distance=0, label=None)]
    one = induce_detector_rules(
        CandidateRuleStore(tmp_path / "one"), [*samples, example("h", distance=0.1, partition="held_out")],
        scope={"domain": "test"}, feature_predicates=["displacement_magnitude"],
    )
    two = induce_detector_rules(
        CandidateRuleStore(tmp_path / "two"), [*samples, example("h", distance=99, partition="held_out")],
        scope={"domain": "test"}, feature_predicates=["displacement_magnitude"],
    )
    assert one["candidates"][0]["candidate_id"] == two["candidates"][0]["candidate_id"]


def test_transition_induction_delay_and_open_horizon_are_predictions_only(tmp_path):
    samples = []
    for sequence, partition in (("a", "train"), ("b", "train"), ("c", "held_out")):
        samples.extend([
            example(sequence, order=0, label="moved", partition=partition),
            example(sequence, order=1, label="rotated", partition=partition),
        ])
    store = CandidateRuleStore(tmp_path)
    result = induce_transition_rules(
        store, samples, scope={"domain": "test"}, gates=PromotionGates(), promote=True,
    )
    candidate = result["candidates"][0]
    assert candidate["kind"] == "event_transition" and candidate["status"] == "promoted"
    assert candidate["rule"]["delay"] == {"min": 1, "max": 1}
    predicted = replay_promoted_transitions(
        store, [term("moved", "new-track")], entity_ids=["new-track"],
        scope_context={"domain": "test"}, source_order=10,
    )
    assert predicted[0]["term"] == term("rotated", "new-track")
    assert predicted[0]["due_order"] == {"min": 11, "max": 11}
    assert not predicted[0]["authoritative"]
    pending = evaluate_candidate(store, candidate["candidate_id"], [example("tail")], gates=PromotionGates())
    assert pending["pending_horizons"] == 1


def test_action_effect_induction_is_separate_from_event_transition(tmp_path):
    samples = [example("a", action="up"), example("b", action="up"), example("c", action="up", partition="held_out")]
    store = CandidateRuleStore(tmp_path)
    result = induce_transition_rules(
        store, samples, kind="action_effect", max_delay=0, scope={"domain": "test"},
        gates=PromotionGates(), promote=True,
    )
    candidate = result["candidates"][0]
    assert candidate["kind"] == "action_effect" and candidate["status"] == "promoted"
    assert candidate["rule"]["body"][0]["predicate"] == "user_input"
    assert candidate["rule"]["delay"] == {"min": 0, "max": 0}


def test_unknown_and_empty_examples_never_seed_positive_rules_or_negative_proof(tmp_path):
    store = CandidateRuleStore(tmp_path)
    samples = [example("a", label=None), example("b", label=None)]
    assert induce_detector_rules(store, samples, scope={"domain": "test"})["candidates"] == []
    result = induce_detector_rules(
        store, [example("a"), example("b")], scope={"domain": "test"},
        feature_predicates=["displacement_magnitude"],
    )
    candidate = result["candidates"][0]
    unknown = example("unknown", distance=5, label=None, partition="held_out")
    unknown.update(assessment="unknown", comparison_complete=False, uncertainty=["insufficient comparison"])
    graded = evaluate_candidate(store, candidate["candidate_id"], [unknown], gates=PromotionGates())
    assert graded["evaluation"]["metrics"]["counterexample_pairs"] == 0
    assert graded["traces"][0]["outcome"] == "inconclusive"


def test_llm_rule_proposals_remain_validated_stored_manual_candidates(tmp_path):
    store = CandidateRuleStore(tmp_path)
    proposal = {
        "kind": "event_transition", "scope": {"domain": "test"},
        "rule": {"body": [term("moved", {"var": "Who"})], "head": term("rotated", {"var": "Who"}), "delay": {"min": 1, "max": 1}},
        "confidence": 0.8, "assumptions": ["context stable"], "critiques": [],
    }
    provenance = {"prompt_ref": "prompt:1", "raw_output_ref": "response:1", "model": "model", "backend": "backend"}
    candidates = ingest_llm_rule_proposals(
        store, json.dumps({"candidates": [proposal]}), provenance=provenance, entity_ids=[], inducer_version="model-inducer-v1",
    )
    assert candidates[0]["status"] == "proposed" and candidates[0]["evidence"] == []
    assert not store.evaluate(candidates[0]["candidate_id"], gates=PromotionGates())["eligible"]
    with pytest.raises(ValidationError):
        ingest_llm_rule_proposals(store, ":- assertz(hacked).", provenance=provenance, entity_ids=[], inducer_version="v1")


def test_every_valid_llm_proposal_is_preserved_even_when_another_is_invalid(tmp_path):
    store = CandidateRuleStore(tmp_path)
    valid = {
        "kind": "event_detector", "scope": {"domain": "test"},
        "rule": {"body": [term("present", {"var": "X"})], "head": term("moved", {"var": "X"})},
        "confidence": 0.8, "assumptions": [], "critiques": [],
    }
    invalid = {**valid, "rule": {"body": [term("call", "halt")], "head": term("moved", {"var": "X"})}}
    provenance = {"prompt_ref": "prompt:1", "raw_output_ref": "response:1", "model": "model", "backend": "backend"}
    with pytest.raises(CandidateProposalError) as caught:
        ingest_llm_rule_proposals(
            store, json.dumps({"candidates": [invalid, valid]}),
            provenance=provenance, entity_ids=[], inducer_version="v1",
        )
    assert len(caught.value.candidate_ids) == 1
    assert store.get(caught.value.candidate_ids[0])["status"] == "proposed"
    from omega_vision.perception._event_journal import Journal
    records = Journal(tmp_path / "runtime" / "rule-proposals").read()
    assert records[0]["payload"]["raw_response"] == json.dumps({"candidates": [invalid, valid]})
    assert records[-1]["payload"]["status"] == "partial"


def test_invalid_rule_response_is_durably_audited_before_parse_and_idempotent(tmp_path):
    from omega_vision.perception._event_journal import Journal
    store = CandidateRuleStore(tmp_path)
    provenance = {"prompt_ref": "prompt:1", "raw_output_ref": "response:1", "model": "model", "backend": "backend"}
    raw = ":- call(untrusted)."
    for _ in range(2):
        with pytest.raises(CandidateProposalError):
            ingest_llm_rule_proposals(store, raw, provenance=provenance, entity_ids=[], inducer_version="v1")
    records = Journal(tmp_path / "runtime" / "rule-proposals").read()
    assert len(records) == 2
    assert records[0]["payload"]["raw_response"] == raw
    assert records[1]["payload"]["status"] == "invalid"
    assert store.list() == []


def test_training_negative_context_learns_explicit_exceptions_not_unknown_absence(tmp_path):
    samples = [
        example("positive-a", distance=2), example("positive-b", distance=3),
        example("negative-a", distance=2, label=None), example("negative-b", distance=3, label=None),
        example("heldout", distance=4, partition="held_out"),
    ]
    for sample in samples:
        entity = sample["entity_ids"][0]
        sample["complete_predicates"] = ["stationary"]
        if sample["source_pair"]["sequence_id"].startswith("negative"):
            sample["context"] = [term("stationary", entity)]
    store = CandidateRuleStore(tmp_path)
    result = induce_detector_rules(
        store, samples, scope={"domain": "test"}, feature_predicates=["displacement_magnitude"],
        gates=PromotionGates(), promote=True,
    )
    candidate = result["candidates"][0]
    assert candidate["rule"]["exceptions"][0]["predicate"] == "stationary"
    assert candidate["status"] == "promoted"
    assert evaluate_rule(
        candidate["rule"], kind="event_detector",
        facts=[term("displacement_magnitude", "new-track", 4)],
        entity_ids=["new-track"],
    ) == []


def test_llm_labels_cannot_be_declared_independent_by_changing_envelope():
    raw = example("mislabelled")
    raw["events"][0]["provenance"] = {"source": "llm_hypothesis", "model": "model", "backend": "backend"}
    with pytest.raises(ValidationError, match="relabeled"):
        normalize_example(raw)


def grouping_candidate(store):
    group, score = {"var": "Group"}, {"var": "Score"}
    anchor = "shape-anchor-abc"
    return store.create(
        {
            "body": [
                term("observed_mask_similarity", group, anchor, score),
                term("greater_equal", score, 0.82), term("independent_group_support", group),
            ],
            "head": term("grouping_template_candidate", group, anchor),
        },
        kind="grouping", scope={"domain": "test"}, source="measured_grouping_induction",
        provenance={"algorithm": "observed-shape"}, inducer_version="v1", entity_ids=[anchor],
    )


def grouping_observation(sequence, *, partition="train", valid=True, dependencies=(), prototypes=()):
    group, anchor = f"group-observation-{sequence}", "shape-anchor-abc"
    return {
        "sequence_id": sequence, "sequence_fingerprint": f"source-content-{sequence}",
        "observation_id": f"observed-grouping-{sequence}", "observation_hash": f"measured-content-{sequence}",
        "entity_ids": [group, anchor],
        "facts": [term("observed_mask_similarity", group, anchor, 0.97), term("independent_group_support", group)],
        "labels": [{"term": term("grouping_template_candidate", group, anchor), "grouping_id": group}] if valid else [],
        "label_coverage": ["grouping_template_candidate"], "comparison_complete": True,
        "confidence": 0.98, "evidence_refs": [f"original-mask-{sequence}"],
        "partition": partition, "label_source": "deterministic_replay",
        "depends_on_candidates": list(dependencies), "depends_on_prototypes": list(prototypes),
        "provenance": {"independent_source": "authored-original-pixel-grouper"}, "scope_context": {"domain": "test"},
    }


def test_grouping_promotion_uses_real_typed_observations_not_event_recurrence(tmp_path):
    store = CandidateRuleStore(tmp_path)
    candidate = grouping_candidate(store)
    result = evaluate_grouping_candidate(
        store, candidate["candidate_id"], [
            grouping_observation("a"), grouping_observation("b"),
            grouping_observation("heldout", partition="held_out"),
        ], gates=PromotionGates(), promote=True,
    )
    metrics = result["evaluation"]["metrics"]
    assert result["status"] == "promoted"
    assert metrics["independent_positive_groupings"] == 3
    assert metrics["independent_positive_pairs"] == 0
    assert metrics["held_out_positive_groupings"] == 1
    persisted = store.get(candidate["candidate_id"])
    assert "grouping-rules" in persisted["promoted_rule_ref"]
    assert all("event_ids" not in item and "assessment" not in item for item in persisted["evidence"])
    contradicted = evaluate_grouping_candidate(
        store, candidate["candidate_id"], [grouping_observation("counter", partition="held_out", valid=False)],
        gates=PromotionGates(), promote=True,
    )
    assert contradicted["status"] == "demoted"
    assert contradicted["evaluation"]["metrics"]["counterexample_groupings"] == 1


def test_candidate_or_prototype_derived_grouping_never_self_confirms(tmp_path):
    store = CandidateRuleStore(tmp_path)
    candidate_id = grouping_candidate(store)["candidate_id"]
    result = evaluate_grouping_candidate(
        store, candidate_id, [
            grouping_observation("a", dependencies=["proposer-alias-different-from-store-id"]),
            grouping_observation("b", prototypes=["template-used-for-acceptance"]),
            grouping_observation("heldout", partition="held_out", dependencies=[candidate_id]),
        ],
        gates=PromotionGates(), promote=True,
    )
    assert result["evaluation"]["metrics"]["independent_positive_groupings"] == 0
    assert result["evaluation"]["metrics"]["excluded_nonindependent_records"] == 3
    assert result["status"] != "promoted"


def test_grouping_unknown_comparison_and_reimport_aliases_do_not_promote(tmp_path):
    store = CandidateRuleStore(tmp_path)
    candidate_id = grouping_candidate(store)["candidate_id"]
    first = grouping_observation("a")
    alias = grouping_observation("alias", partition="held_out")
    alias["observation_hash"] = first["observation_hash"]
    unknown = grouping_observation("unknown", partition="held_out", valid=False)
    unknown["comparison_complete"] = False
    result = evaluate_grouping_candidate(store, candidate_id, [first, alias, unknown], gates=PromotionGates())
    assert result["evaluation"]["metrics"]["independent_positive_groupings"] == 1
    assert result["evaluation"]["metrics"]["held_out_positive_groupings"] == 0
    assert result["evaluation"]["metrics"]["counterexample_groupings"] == 0


def test_silver_antecedents_do_not_become_independent_transition_support(tmp_path):
    store = CandidateRuleStore(tmp_path)
    candidate = store.create(
        {"body": [term("moved", {"var": "X"})], "head": term("rotated", {"var": "X"}), "delay": {"min": 1, "max": 1}},
        kind="event_transition", scope={"domain": "test"}, source="deterministic_induction",
        provenance={"algorithm": "test"}, inducer_version="v1",
    )
    samples = []
    for sequence in ("a", "b"):
        samples.extend([
            example(sequence, order=0, source="llm_hypothesis", partition="held_out"),
            example(sequence, order=1, label="rotated", partition="held_out"),
        ])
    result = evaluate_candidate(store, candidate["candidate_id"], samples, gates=PromotionGates(), promote=True)
    assert result["evaluation"]["metrics"]["independent_positive_pairs"] == 0
    assert result["status"] != "promoted"


def test_unclassified_changed_pair_is_not_a_negative_event_label(tmp_path):
    store = CandidateRuleStore(tmp_path)
    candidate = store.create(
        {"body": [term("present", {"var": "X"})], "head": term("moved", {"var": "X"})},
        kind="event_detector", scope={"domain": "test"}, source="deterministic_induction",
        provenance={"algorithm": "test"}, inducer_version="v1",
    )
    unclassified = example("unclassified", label=None, partition="held_out")
    unclassified.update(assessment="changed", label_coverage=[])
    result = evaluate_candidate(store, candidate["candidate_id"], [unclassified], gates=PromotionGates())
    assert result["traces"][0]["outcome"] == "inconclusive"
    assert result["evaluation"]["metrics"]["counterexample_pairs"] == 0


def test_delay_window_support_anchors_actual_effect_and_confirms_before_tail(tmp_path):
    store = CandidateRuleStore(tmp_path)
    candidate = store.create(
        {"body": [term("moved", {"var": "X"})], "head": term("rotated", {"var": "X"}), "delay": {"min": 1, "max": 3}},
        kind="event_transition", scope={"domain": "test"}, source="deterministic_induction",
        provenance={"algorithm": "test"}, inducer_version="v1",
    )
    samples = [example("a", order=0), example("a", order=1, label="rotated")]
    evaluated = evaluate_candidate(store, candidate["candidate_id"], samples, gates=PromotionGates())
    assert evaluated["traces"][0]["outcome"] == "support"
    evidence = store.get(candidate["candidate_id"])["evidence"][0]
    assert evidence["before_hash"] == samples[1]["source_pair"]["before_hash"]
    assert evidence["event_ids"] == [samples[1]["events"][0]["event_id"]]
    extended = [*samples, example("a", order=2, label=None), example("a", order=3, label=None)]
    result = evaluate_candidate(store, candidate["candidate_id"], extended, gates=PromotionGates())
    assert result["evaluation"]["metrics"]["independent_positive_pairs"] == 1


def test_multiple_promoted_proofs_emit_one_event_and_retain_all_dependencies(tmp_path):
    store = CandidateRuleStore(tmp_path)
    result = induce_detector_rules(
        store, [example("a"), example("b"), example("heldout", partition="held_out")],
        scope={"domain": "test"}, feature_predicates=["present", "displacement_magnitude"],
        gates=PromotionGates(), promote=True,
    )
    assert len(result["candidates"]) == 2
    replay = replay_promoted_detectors(
        store, [term("present", "new-track"), term("displacement_magnitude", "new-track", 5)],
        entity_ids=["new-track"], scope_context={"domain": "test"},
    )
    assert len(replay["events"]) == 1
    provenance = replay["events"][0]["provenance"]
    candidate_ids = {candidate["candidate_id"] for candidate in result["candidates"]}
    assert set(provenance["ground_truth_dependencies"]) == candidate_ids
    assert len(provenance["supporting_detectors"]) == 2
    feedback = example("feedback")
    feedback["events"][0]["provenance"] = provenance
    assert set(normalize_example(feedback)["depends_on_candidates"]) == candidate_ids
