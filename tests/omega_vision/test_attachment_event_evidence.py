from copy import deepcopy
from dataclasses import replace
import shutil

import pytest

from omega_vision.perception.event_deduction import (
    ATTACHMENT_FACT_FAMILIES, deduce_sequence, initial_event_state,
)
from omega_vision.perception.object_evidence import infer_objects_with_evidence
from omega_vision.perception.object_tracking import infer_objects
from omega_vision.perception.temporal_correspondence import compare_frames, initial_temporal_state
from omega_vision.perception.visual_event_log import VisualSequenceEventLog
from test_authored_event_deduction import attachment_context, frame, rectangle, run_sequence


pytestmark = pytest.mark.skipif(shutil.which("swipl") is None, reason="SWI-Prolog unavailable")


def attached_frame(order, right_x=5):
    return frame(order, [
        ("one", "red", rectangle(2, 2, 3, 10)),
        ("two", "blue", rectangle(right_x, 2, 3, 10)),
    ], sequence="seq:attachment-evidence")


def inputs_with_objects(inputs):
    temporal_state = initial_temporal_state(inputs[0])
    objects = [infer_objects_with_evidence(inputs[0])]
    pairs = []
    for before, after in zip(inputs, inputs[1:]):
        pair = compare_frames(before, after, previous_state=temporal_state)
        objects.append(infer_objects_with_evidence(
            after, temporal=pair, previous_state=objects[-1]["checkpoint"],
        ))
        pairs.append(pair)
        temporal_state = pair["checkpoint"]
    contexts = [attachment_context(item, obj) for item, obj in zip(inputs, objects)]
    return objects, pairs, contexts


def phases(result, relation="attached"):
    return [
        [event["term"]["predicate"] for event in assessment["events"]
         if event["term"]["predicate"] in {"start", "continue", "end"}
         and event["term"]["args"][0]["predicate"] == relation]
        for assessment in result["assessments"]
    ]


def test_bootstrap_attachment_uses_full_proofs_without_a_composed_object():
    first = attached_frame(0)
    objects = infer_objects_with_evidence(first)
    assert objects["objects"] == []
    assert objects["compositionEvidence"]["attachments"]
    unverified = initial_event_state(first, objects=objects)
    assert not any(term["predicate"] == "attached" for term in unverified["observed_relations"])
    verified = initial_event_state(first, objects=objects, attachment_context=attachment_context(first, objects))
    assert len(verified["attachment_pairs"]) == 1
    assert verified["attachment_snapshot"]["proofs"][0]["witness"]["kind"] == "strong_edge"


@pytest.mark.parametrize("incomplete", [*ATTACHMENT_FACT_FAMILIES, "background", "context"])
def test_incomplete_visible_evidence_is_unknown_and_keeps_episode_open(tmp_path, incomplete):
    inputs = [attached_frame(0), attached_frame(1)]
    objects, pairs, contexts = inputs_with_objects(inputs)
    if incomplete == "context":
        contexts[1] = None
    elif incomplete == "background":
        contexts[1]["background_roles_trusted"] = False
    else:
        contexts[1]["complete"][incomplete] = False
    result = deduce_sequence(inputs, pairs, object_results=objects, attachment_contexts=contexts)
    assert phases(result) == [[]]
    assert result["assessments"][0]["assessment"] == "unknown"
    assert not result["assessments"][0]["comparison_complete"]
    assert not any(term["predicate"] == "attached" for term in result["frames"][1]["states"])
    log = VisualSequenceEventLog(tmp_path, inputs[0].sequence_id, accepted_detectors=result["accepted_detectors"])
    log.replay(result["frames"], result["assessments"])
    episode = next(item for item in log.episodes() if item["relation"].startswith("attached("))
    assert episode["currently_open"]


def test_truncated_shared_edge_facts_never_prove_detachment():
    before, after = attached_frame(0), attached_frame(1)
    after = replace(after, region_evidence={**after.region_evidence, "sharedEdges": []})
    objects, pairs, contexts = inputs_with_objects([before, after])
    assert not objects[1]["compositionEvidence"]["attachments"]
    contexts[1]["complete"]["shared_edges"] = False
    result = deduce_sequence([before, after], pairs, object_results=objects, attachment_contexts=contexts)
    assert phases(result) == [[]]
    assert result["assessments"][0]["assessment"] == "unknown"
    assert result["checkpoint"]["active_relations"]


def test_repeated_missing_object_snapshots_stay_unknown_not_complete_unchanged():
    inputs = [attached_frame(index) for index in range(3)]
    objects, pairs, contexts = inputs_with_objects(inputs)
    result = deduce_sequence(
        inputs, pairs, object_results=[objects[0], None, None],
        attachment_contexts=[contexts[0], None, None],
    )
    assert phases(result) == [[], []]
    assert all(item["assessment"] == "unknown" for item in result["assessments"])
    assert result["checkpoint"]["attachment_requested"]


def test_complete_comparable_snapshot_proves_real_detachment(tmp_path):
    inputs = [attached_frame(0), attached_frame(1, right_x=8)]
    objects, pairs, contexts = inputs_with_objects(inputs)
    result = deduce_sequence(inputs, pairs, object_results=objects, attachment_contexts=contexts)
    assert phases(result) == [["end"]]
    log = VisualSequenceEventLog(tmp_path, inputs[0].sequence_id, accepted_detectors=result["accepted_detectors"])
    log.replay(result["frames"], result["assessments"])
    assert not next(item for item in log.episodes() if item["relation"].startswith("attached("))["currently_open"]


def test_sparse_retained_composition_history_does_not_override_current_proofs():
    inputs = [
        attached_frame(0),
        frame(1, [("one", "red", rectangle(4, 2, 3, 10)), ("two", "blue", rectangle(7, 2, 3, 10))],
              sequence="seq:attachment-evidence"),
        frame(2, [("one", "red", rectangle(6, 2, 3, 10)), ("two", "blue", rectangle(12, 2, 3, 10))],
              sequence="seq:attachment-evidence"),
    ]
    objects, pairs, contexts = inputs_with_objects(inputs)
    assert objects[1]["objects"]
    assert objects[2]["objects"][0]["compositionHistory"][-1]["attachments"]
    assert objects[2]["compositionEvidence"]["attachments"] == []
    result = deduce_sequence(inputs, pairs, object_results=objects, attachment_contexts=contexts)
    assert phases(result)[1] == ["end"]


@pytest.mark.parametrize("change", ["policy", "resolution"])
def test_policy_changes_never_close_old_episode_and_require_explicit_replay(tmp_path, change):
    first, second, third = attached_frame(0), attached_frame(1), attached_frame(2)
    second = replace(second, region_evidence={**second.region_evidence, "sharedEdges": [["r1", "r2", 5]]})
    if change == "resolution":
        second = replace(second, region_evidence={**second.region_evidence, "width": 20, "height": 20})
        third = replace(third, region_evidence={**third.region_evidence, "width": 20, "height": 20})
    inputs = [first, second, third]
    objects, pairs, contexts = inputs_with_objects(inputs)
    if change == "policy":
        for context in contexts[1:]:
            context["extraction_policy_hash"] = "new-extractor-preprocessing-policy"
    result = deduce_sequence(inputs, pairs, object_results=objects, attachment_contexts=contexts)
    assert phases(result) == [[], []]
    assert result["checkpoint"]["attachment_requires_replay"]
    assert all("attachment_policy_changed_requires_replay" in item["uncertainty"] for item in result["assessments"])
    log = VisualSequenceEventLog(tmp_path, first.sequence_id, accepted_detectors=result["accepted_detectors"])
    log.replay(result["frames"], result["assessments"])
    assert next(item for item in log.episodes() if item["relation"].startswith("attached("))["currently_open"]


def test_overlapping_group_memberships_are_not_authoritative_attachments():
    first = attached_frame(0)
    left, right = first.groups
    right = replace(right, member_uids=left.member_uids + right.member_uids, member_aliases=left.member_aliases + right.member_aliases)
    first = replace(first, groups=(left, right))
    objects = infer_objects_with_evidence(first)
    assert objects["compositionEvidence"]["attachments"]
    state = initial_event_state(first, objects=objects, attachment_context=attachment_context(first, objects))
    assert not state["attachment_pairs"]
    assert not state["attachment_snapshot"]["proofs"]


def test_unsealed_or_mutated_object_evidence_is_rejected_not_resealed():
    first = attached_frame(0)
    with pytest.raises(ValueError, match="unsealed"):
        initial_event_state(first, objects=infer_objects(first))
    sealed = infer_objects_with_evidence(first)
    altered = deepcopy(sealed)
    altered["compositionEvidence"]["attachments"] = []
    with pytest.raises(ValueError, match="hash"):
        initial_event_state(first, objects=altered)


@pytest.mark.parametrize("field", ["frame_uid", "provider_id", "sequence_id", "facts_hash", "object_evidence_uid"])
def test_completeness_attestation_must_match_actual_source_evidence(field):
    first = attached_frame(0)
    objects = infer_objects_with_evidence(first)
    context = attachment_context(first, objects)
    context[field] = "unrelated-source"
    with pytest.raises(ValueError, match="does not match"):
        initial_event_state(first, objects=objects, attachment_context=context)


def test_completeness_flags_are_boolean_and_cannot_be_replaced_by_field_presence():
    first = attached_frame(0)
    objects = infer_objects_with_evidence(first)
    context = attachment_context(first, objects)
    context["complete"]["holes"] = "true"
    with pytest.raises(ValueError, match="booleans"):
        initial_event_state(first, objects=objects, attachment_context=context)
    context = attachment_context(first, objects)
    del context["complete"]["holes"]
    with pytest.raises(ValueError, match="booleans"):
        initial_event_state(first, objects=objects, attachment_context=context)


def test_rigid_comotion_uses_shared_transform_key_not_equal_centroid_displacement():
    one = [(5, 5), (5, 6), (5, 7), (6, 7)]
    two = [(12 + x, 5 + y) for x, y in [
        (0, 0), (1, 0), (0, 1), (1, 1), (-1, 1), (0, 2), (1, 2), (0, 3),
    ]]
    rotated_one = [(20 - y, x) for x, y in one]
    rotated_two = [(20 - y, x) for x, y in two]
    independent_one = [(20 - y, x) for x, y in rotated_one]
    independent_two = [(27 - y, x + 7) for x, y in rotated_two]
    inputs = [
        frame(0, [("one", "red", one), ("two", "blue", two)]),
        frame(1, [("one", "red", one), ("two", "blue", two)]),
        frame(2, [("one", "red", rotated_one), ("two", "blue", rotated_two)]),
        frame(3, [("one", "red", independent_one), ("two", "blue", independent_two)]),
    ]
    result, pairs = run_sequence(inputs)
    assert pairs[1]["matches"][0]["displacement"] != pairs[1]["matches"][1]["displacement"]
    assert pairs[2]["matches"][0]["displacement"] == pairs[2]["matches"][1]["displacement"]
    assert phases(result, "co_move") == [[], ["start"], ["end"]]
