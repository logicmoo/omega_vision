from __future__ import annotations

import json
import shutil
import subprocess

import pytest

from omega_vision.perception.event_records import (
    HypothesisValidationError, ValidationError, hypothesis_json_schema, normalize_rule, parse_hypotheses,
    render_rule, render_term, validate_term,
)


ENTITIES = ["player:1", "star:1", "wall:1"]
PAIR = {
    "sequence_id": "seq-one", "from_frame": "frame:0", "to_frame": "frame:1",
    "before_hash": "before-content", "after_hash": "after-content",
}
PROVENANCE = {"model": "vision-model", "backend": "offline-test", "prompt_version": "v1", "prompt_hash": "prompt-sha"}


def term(predicate, *args):
    return {"predicate": predicate, "args": list(args)}


def bundle(events=None, assessment="changed", **kwargs):
    return {
        "assessment": assessment, "comparison_complete": assessment != "unknown",
        "confidence": 0.95, "evidence": ["pixel-diff:1"], "uncertainty": [],
        "events": events or [], **kwargs,
    }


def hypothesis(value):
    return {"term": value, "confidence": 0.9, "evidence": ["mask:1"], "uncertainty": [], "rationale": "Visible overlap"}


def parse(value, **kwargs):
    return parse_hypotheses(
        json.dumps(value), entity_ids=ENTITIES, source_pair=PAIR, provenance=PROVENANCE, **kwargs,
    )


def test_directional_and_symmetric_normalization():
    assert render_term(term("start", term("occlude", "player:1", "star:1")), entity_ids=ENTITIES) == "start(occlude('player:1', 'star:1'))"
    assert validate_term(term("contact", "star:1", "player:1"), entity_ids=ENTITIES).to_dict() == term("contact", "player:1", "star:1")
    assert validate_term(term("occlude", "star:1", "player:1"), entity_ids=ENTITIES).to_dict() == term("occlude", "star:1", "player:1")


def test_provider_schema_lists_typed_events_not_stationary_or_executable_predicates():
    schema = hypothesis_json_schema(ENTITIES)
    names = {item["properties"]["predicate"]["const"] for item in schema["$defs"]["event"]["oneOf"]}
    assert {"start", "continue", "end", "moved"} <= names
    assert not {"stationary", "call", "assert", "consult"} & names
    assert schema["additionalProperties"] is False
    assert schema["properties"]["events"]["items"]["properties"]["term"] == {"$ref": "#/$defs/event"}


@pytest.mark.parametrize("value", [
    ":- consult('evil.pl').", term("call", "player:1"), term("assertz", term("moved", "player:1")),
    term("eval", "player:1"), term("moved", "invented"), term("moved", "player:1", "star:1"),
    term("moved", {"var": "Who"}), term("start", term("rotated", "player:1")),
    term("continue", term("start", term("move", "player:1"))),
    {"predicate": "moved", "args": ["player:1"], "clause": "halt"},
    term("displacement", "player:1", float("nan"), 0),
    term("displacement", "player:1", True, 0),
])
def test_unsafe_malformed_and_unbound_terms_are_rejected(value):
    with pytest.raises(ValidationError):
        validate_term(value, entity_ids=ENTITIES)


@pytest.mark.parametrize("alias", ["r1", "v12", "w5", "g1", "o9"])
def test_supplied_frame_local_alias_is_not_persistent_identity(alias):
    with pytest.raises(ValidationError, match="frame-local"):
        validate_term(term("moved", alias), entity_ids=[alias])


def test_rendering_quotes_data_without_executable_source():
    raw = "up'); halt. %\\path"
    rendered = render_term(term("user_input", "player:1", raw), entity_ids=ENTITIES)
    assert rendered == "user_input('player:1', 'up''); halt. %\\\\path')"
    with pytest.raises(ValidationError):
        render_term("moved(player1).", entity_ids=ENTITIES)


def test_rendered_data_is_exactly_one_prolog_term(tmp_path):
    swipl = shutil.which("swipl")
    if not swipl:
        pytest.skip("SWI-Prolog is not installed")
    rendered = render_term(term("user_input", "player:1", "up'); halt(99). %\\path"), entity_ids=ENTITIES)
    result = subprocess.run(
        [
            swipl, "-q", "-g",
            "read_term(user_input,T,[]),functor(T,user_input,2),"
            "read_term(user_input,End,[]),(End==end_of_file->halt(0);halt(7))",
        ],
        input=rendered + ".\n", text=True, capture_output=True, cwd=tmp_path, timeout=15,
    )
    assert result.returncode == 0, result.stderr


def test_unknown_unchanged_and_stationary_are_distinct():
    unknown = parse(bundle(assessment="unknown", uncertainty=["occluded pixels"]))
    unchanged = parse(bundle(assessment="no_material_change"))
    changed_unclassified = parse(bundle(assessment="changed"))
    assert unknown["assessment"] == "unknown"
    assert unchanged["assessment"] == "no_material_change"
    assert changed_unclassified["events"] == []
    for value in [
        bundle(assessment="no_material_change", comparison_complete=False),
        bundle(assessment="no_material_change", evidence=[]),
        bundle([hypothesis(term("moved", "player:1"))], assessment="unknown"),
        bundle([hypothesis(term("stationary", "player:1"))]),
    ]:
        with pytest.raises(HypothesisValidationError):
            parse(value)
    assert validate_term(term("stationary", "player:1"), entity_ids=ENTITIES, categories={"state"})


def test_phases_require_active_episode_and_preserve_provenance():
    start = parse(bundle([hypothesis(term("start", term("occlude", "player:1", "star:1")))]))
    event = start["events"][0]
    assert event["episode_id"].startswith("hypothesis-episode-")
    assert start["authoritative"] is False
    assert start["source_pair"] == PAIR and start["provenance"] == PROVENANCE
    relation = "occlude('player:1', 'star:1')"
    for phase in ("continue", "end"):
        proposed = bundle([hypothesis(term(phase, term("occlude", "player:1", "star:1")))])
        with pytest.raises(HypothesisValidationError, match="active episode"):
            parse(proposed)
        parsed = parse(proposed, active_episodes={relation: event["episode_id"]})
        assert parsed["events"][0]["episode_id"] == event["episode_id"]
        proposed["events"][0]["episode_id"] = "wrong-episode"
        with pytest.raises(HypothesisValidationError):
            parse(proposed, active_episodes={relation: event["episode_id"]})
    with pytest.raises(HypothesisValidationError, match="new episode"):
        parse(bundle([hypothesis(term("start", term("occlude", "player:1", "star:1")))]), active_episodes={relation: event["episode_id"]})


@pytest.mark.parametrize("raw", ['{"events":[],"events":[]}', '```json\n{}\n```', '{"events": NaN}', "not JSON"])
def test_exact_bad_model_response_is_retained_in_error(raw):
    with pytest.raises(HypothesisValidationError) as caught:
        parse_hypotheses(raw, entity_ids=ENTITIES, source_pair=PAIR, provenance=PROVENANCE)
    assert caught.value.raw_response == raw
    assert caught.value.errors


def test_alpha_normalized_typed_rules_and_bindings():
    first = {"body": [term("displacement", {"var": "Who"}, {"var": "Dx"}, 0)], "head": term("moved", {"var": "Who"})}
    second = {"body": [term("displacement", {"var": "Subject"}, {"var": "Distance"}, 0.0)], "head": term("moved", {"var": "Subject"})}
    assert normalize_rule(first, kind="event_detector") == normalize_rule(second, kind="event_detector")
    assert render_rule(first, kind="event_detector") == "moved(V0) :- displacement(V0, V1, 0)."
    with pytest.raises(ValidationError, match="bound"):
        normalize_rule({"body": [term("present", {"var": "X"})], "head": term("moved", {"var": "Y"})}, kind="event_detector")
    with pytest.raises(ValidationError, match="incompatible"):
        normalize_rule({"body": [term("displacement", {"var": "X"}, {"var": "X"}, 0)], "head": term("moved", {"var": "X"})}, kind="event_detector")
    with pytest.raises(ValidationError):
        normalize_rule({"body": [term("moved", {"var": "X"})], "head": term("rotated", {"var": "X"})}, kind="event_detector")


def test_candidate_kind_requires_correct_antecedent_and_consequent():
    x, y = {"var": "X"}, {"var": "Y"}
    transition = {"body": [term("moved", x)], "head": term("rotated", x)}
    assert normalize_rule(transition, kind="event_transition")
    action = {"body": [term("user_input", x, "up")], "head": term("rotated", x)}
    assert normalize_rule(action, kind="action_effect")
    grouping = {"body": [term("same_color", x, y)], "head": term("same_object", x, y)}
    assert normalize_rule(grouping, kind="grouping")
    with pytest.raises(ValidationError, match="event antecedent"):
        normalize_rule({"body": [term("present", x)], "head": term("moved", x)}, kind="event_transition")
    with pytest.raises(ValidationError, match="user_input"):
        normalize_rule(transition, kind="action_effect")


def test_measured_grouping_template_uses_typed_bound_variables_and_stable_anchor():
    group, score = {"var": "Group"}, {"var": "Score"}
    anchor = "shape-anchor-012345"
    rule = {
        "body": [
            term("observed_mask_similarity", group, anchor, score),
            term("greater_equal", score, 0.82),
            term("independent_group_support", group),
        ],
        "head": term("grouping_template_candidate", group, anchor),
    }
    normalized = normalize_rule(rule, kind="grouping", entity_ids=[anchor])
    assert normalized["head"]["predicate"] == "grouping_template_candidate"
    assert render_rule(rule, kind="grouping", entity_ids=[anchor]) == (
        "grouping_template_candidate(V0, 'shape-anchor-012345') :- "
        "observed_mask_similarity(V0, 'shape-anchor-012345', V1), "
        "greater_equal(V1, 0.82), independent_group_support(V0)."
    )
    with pytest.raises(ValidationError, match="unknown entity"):
        normalize_rule(rule, kind="grouping")
    with pytest.raises(ValidationError):
        validate_term(term("grouping_template_candidate", "player:1", anchor), entity_ids=[*ENTITIES, anchor], categories={"event"})
