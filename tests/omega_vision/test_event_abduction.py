from copy import deepcopy

import pytest

from omega_vision.perception._event_journal import ValidationError
from omega_vision.perception.event_abduction import AbductionBudgets, abduce_events


def term(name, *args):
    return {"predicate": name, "args": list(args)}


X, Y, N = {"var": "X"}, {"var": "Y"}, {"var": "N"}
KNOWN = ["object:ball", "object:wall", "actor:keyboard"]


def rule(body=None, head=None, **changes):
    return {
        "candidate_id": "candidate:move-bounce", "version": "version:1", "kind": "event_transition",
        "scope": {"sequence_ids": ["sequence:one"]}, "status": "promoted", "published_order": 0,
        "promoted_rule_ref": "data/recordings/game/run/memory_level_1_stm/deduction_rules.metta#entry",
        "entity_ids": KNOWN, "rule": {
            "head": head or term("bounce", X), "body": body or [term("moved", X)],
            "delay": {"min": 1, "max": 1},
        }, **changes,
    }


def evidence(value, *, order=1, positive=True, uid="evidence:1"):
    return {"evidence_id": uid, "term": value, "frame_order": order, "polarity": positive,
            "channel": "observed", "authoritative": True, "provenance": {"source": "fixture-observation"}}


def effect(value=None):
    return {"event_id": "event:effect", "term": value or term("bounce", "object:ball"), "frame_order": 2,
            "channel": "observed", "authoritative": True, "evidence": ["pixel:effect"],
            "provenance": {"detector_id": "observed-fixture-detector"}}


def run(candidates=None, facts=None, event=None, **options):
    return abduce_events([event or effect()], candidates=candidates or [rule()], evidence=facts or [],
                         frame_ids=["frame:0", "frame:1", "frame:2"], entity_ids_by_order=[KNOWN] * 3,
                         scope_context={"sequence_id": "sequence:one"}, cutoff_order=2, **options)


def test_reverse_inference_retains_missing_cause_and_never_asserts_observation():
    candidate, observed = rule(), effect()
    original = deepcopy((candidate, observed))
    result = run([candidate], event=observed)
    hypothesis = result["hypotheses"][0]
    assert hypothesis["observed_event_id"] == observed["event_id"]
    assert hypothesis["causes"][0]["term"] == term("moved", "object:ball")
    assert hypothesis["causes"][0]["status"] == "hypothesized"
    assert hypothesis["assumptions"][0]["reason"] == "missing_antecedent"
    assert hypothesis["temporal"]["antecedent_order"] == 1
    assert hypothesis["rule"]["promoted_rule_ref"] == candidate["promoted_rule_ref"]
    assert hypothesis["authoritative"] is False
    assert "confidence" not in hypothesis and "probability" not in hypothesis
    assert (candidate, observed) == original
    assert result["outcome"]["status"] == "complete"


def test_alternatives_rank_by_assumptions_and_are_input_order_independent():
    supported = rule(candidate_id="rule:z", body=[term("moved", X)])
    missing = rule(candidate_id="rule:a", body=[term("rotated", X)])
    facts = [evidence(term("moved", "object:ball"))]
    result = run([missing, supported], facts)
    assert [item["rule"]["candidate_id"] for item in result["hypotheses"]] == ["rule:z", "rule:a"]
    assert result["hypotheses"][0]["satisfied"][0]["evidence_ids"] == ["evidence:1"]
    assert result["hypotheses"][0]["evidence"] == facts
    assert result["hypotheses"][0]["status"] == "supported_explanation"
    assert run([supported, missing], facts) == result


def test_positive_fact_and_arithmetic_ground_extra_variable_without_guessing_number():
    candidate = rule(body=[term("moved", X), term("distance", X, Y, N), term("greater_than", N, 3)])
    result = run([candidate], [evidence(term("distance", "object:ball", "object:wall", 5))])
    hypothesis = result["hypotheses"][0]
    assert hypothesis["causes"][0]["term"] == term("moved", "object:ball")
    assert len(hypothesis["satisfied"]) == 2
    assert hypothesis["assumptions"] == [{
        "term": term("moved", "object:ball"), "frame_order": 1, "polarity": True, "reason": "missing_antecedent",
    }]
    assert not run([candidate])["hypotheses"]
    assert run([candidate])["diagnostics"][0]["reason"] == "ungrounded_variables"


def test_symmetric_head_unification_preserves_both_grounded_alternatives():
    candidate = rule(head=term("collision", X, Y), body=[term("follow", X, Y), term("moved", X)])
    result = run([candidate], event=effect(term("collision", "object:wall", "object:ball")))
    assert {item["causes"][0]["term"]["args"][0] for item in result["hypotheses"]} == {
        "object:ball", "object:wall"}


def test_nested_phase_event_grounding_and_repeated_variables():
    candidate = rule(head=term("end", term("contact", X, Y)), body=[term("start", term("contact", X, Y))])
    result = run([candidate], event=effect(term("end", term("contact", "object:ball", "object:wall"))))
    assert all(item["causes"][0]["term"]["predicate"] == "start" for item in result["hypotheses"])
    repeated = rule(head=term("collision", X, X))
    assert not run([repeated], event=effect(term("collision", "object:ball", "object:wall")))["hypotheses"]


def test_exceptions_are_unknown_unless_observed_absent_and_positive_exceptions_block():
    candidate = rule()
    candidate["rule"]["exceptions"] = [term("absent", X)]
    result = run([candidate])
    assert result["hypotheses"][0]["assumptions"][-1]["reason"] == "exception_absence_not_observed"
    result = run([candidate], [evidence(term("absent", "object:ball"), positive=False)])
    assert result["hypotheses"][0]["satisfied"][0]["polarity"] is False
    result = run([candidate], [evidence(term("absent", "object:ball"))])
    assert result["hypotheses"] == []
    assert result["diagnostics"][0]["reason"] == "contradiction"


@pytest.mark.parametrize("candidate,facts", [
    (rule(), [evidence(term("moved", "object:ball"), positive=False)]),
    (rule(body=[term("moved", X), term("greater_than", 1, 2)]), []),
])
def test_contradictions_are_not_low_ranked_hypotheses(candidate, facts):
    result = run([candidate], facts)
    assert result["hypotheses"] == [] and result["diagnostics"][0]["reason"] == "contradiction"


def test_exclusive_phases_and_explicit_opposite_states_block_causes():
    candidate = rule(body=[term("start", term("move", X))])
    result = run([candidate], [evidence(term("end", term("move", "object:ball")))])
    assert result["hypotheses"] == [] and result["diagnostics"][0]["reason"] == "contradiction"
    candidate = rule(body=[term("moved", X), term("visible", X)])
    result = run([candidate], [evidence(term("absent", "object:ball"))])
    assert not result["hypotheses"]
    candidate["rule"]["body"].append(term("absent", X))
    assert not run([candidate])["hypotheses"]


def test_zero_delay_action_means_input_before_same_pair_effect_not_simultaneous_event():
    candidate = rule(kind="action_effect", body=[term("user_input", "actor:keyboard", "LEFT"), term("present", X)])
    candidate["rule"]["delay"] = {"min": 0, "max": 0}
    assert run([candidate])["diagnostics"][0]["reason"] == "unsupported_same_pair_temporal_order"
    candidate = rule(kind="action_effect", body=[term("user_input", X, "LEFT")])
    candidate["rule"]["delay"] = {"min": 0, "max": 0}
    hypothesis = run([candidate])["hypotheses"][0]
    assert hypothesis["temporal"]["ordering"] == "recorded_action_before_pair_effect"
    assert hypothesis["causes"][0]["term"] == term("user_input", "object:ball", "LEFT")


@pytest.mark.parametrize("changes,reason", [
    ({"status": "proposed"}, "rule_not_accepted"),
    ({"status": "rejected"}, "rule_not_accepted"),
    ({"published_order": 2}, "rule_not_published_strictly_before_effect"),
    ({"published_order": 3}, "rule_not_published_strictly_before_effect"),
    ({"scope": {"sequence_ids": ["other"]}}, "scope_mismatch"),
    ({"kind": "event_detector"}, "unsupported_rule_kind"),
])
def test_registry_scope_lifecycle_and_cutoff_are_not_bypassed(changes, reason):
    result = run([rule(**changes)])
    assert not result["hypotheses"] and result["diagnostics"][0]["reason"] == reason


def test_future_observation_and_future_only_entities_are_not_evidence():
    with pytest.raises(ValidationError, match="frame order"):
        run(facts=[evidence(term("moved", "object:ball"), order=3)])
    candidate = rule(body=[term("moved", X), term("contact", X, "object:future")], entity_ids=KNOWN + ["object:future"])
    assert not run([candidate])["hypotheses"]
    assert run([candidate])["diagnostics"][0]["reason"] == "entity_not_observed_by_antecedent_frame"


@pytest.mark.parametrize("payload", [
    {"channel": "llm_hypotheses"}, {"authoritative": False},
    {"term": term("call", "object:ball")}, {"term": term("bounce", "invented")},
])
def test_hypotheses_and_unsafe_effect_terms_are_rejected(payload):
    with pytest.raises(ValidationError):
        run(event={**effect(), **payload})


def test_unknown_forms_and_threshold_metadata_are_honestly_rejected():
    candidate = rule()
    candidate["rule"]["thresholds"] = {"minimum": 1}
    assert run([candidate])["diagnostics"][0]["reason"] == "unsupported_threshold_metadata"
    candidate["rule"].pop("thresholds")
    candidate["rule"]["body"].append(term("group_member", X, Y))
    assert run([candidate])["diagnostics"][0]["reason"] == "unsupported_grouping_schema"
    candidate["rule"]["body"] = [term("call", X)]
    with pytest.raises(ValidationError, match="allowlisted"):
        run([candidate])


def test_budgets_report_truncation_and_do_not_silently_drop_observed_evidence():
    candidates = [rule(candidate_id=f"rule:{index}") for index in range(4)]
    result = run(candidates, budgets=AbductionBudgets(max_rules=2, max_hypotheses=1))
    assert result["outcome"]["status"] == "budget_exhausted"
    assert result["outcome"]["truncated_by"] == ["max_hypotheses", "max_rules"]
    assert len(result["hypotheses"]) == 1
    with pytest.raises(ValidationError, match="max_evidence"):
        run(facts=[evidence(term("present", "object:ball"), uid=str(index)) for index in range(2)],
            budgets=AbductionBudgets(max_evidence=1))
    result = run(candidates, budgets=AbductionBudgets(max_groundings=1))
    assert "max_groundings" in result["outcome"]["truncated_by"]
