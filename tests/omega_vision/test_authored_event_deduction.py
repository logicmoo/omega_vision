from __future__ import annotations

from dataclasses import replace
import shutil

import pytest

from omega_vision.perception.event_deduction import (
    ATTACHMENT_FACT_FAMILIES, DetectorConfig, accepted_detectors, attachment_facts_hash,
    deduce_pair_events, deduce_sequence, initial_event_state,
)
from omega_vision.perception.event_records import render_term
from omega_vision.perception.candidate_rules import CandidateRuleStore, PromotionGates
from omega_vision.perception.event_induction import example_from_deduction, induce_detector_rules
from omega_vision.perception.observation_identity import content_hash
from omega_vision.perception.object_evidence import infer_objects_with_evidence as infer_objects
from omega_vision.perception.temporal_correspondence import (
    ActionHint, GroupObservation, TemporalFrame, compare_frames, initial_temporal_state,
)
from omega_vision.perception.visual_event_log import VisualSequenceEventLog

pytestmark = pytest.mark.skipif(shutil.which("swipl") is None, reason="SWI-Prolog unavailable")


def rectangle(x, y, width=3, height=3):
    return [(a, b) for b in range(y, y + height) for a in range(x, x + width)]


def frame(order, shapes, sequence="seq:authored"):
    groups = tuple(GroupObservation(
        uid=f"group-observation-{content_hash([sequence, order, name, points])}",
        alias=f"g{index}", member_uids=(f"region-observation-{sequence}-{order}-{index}",),
        member_aliases=(f"r{index}",), points=tuple(points), colors=(color,),
        symbols=(), mask_source="exact_pixel_runs",
    ) for index, (name, color, points) in enumerate(shapes, 1))
    image_hash = content_hash(shapes)
    regions = [{
        "id": f"r{index}", "color": color, "area": len(points),
        "centroid": [sum(x for x, _ in points) / len(points), sum(y for _, y in points) / len(points)],
        "holes": [],
    } for index, (_, color, points) in enumerate(shapes, 1)]
    shared = []
    for left, (_, _, points) in enumerate(shapes, 1):
        for right, (_, _, other) in enumerate(shapes[left:], left + 1):
            edges = sum((x + dx, y + dy) in set(other) for x, y in points for dx, dy in ((1, 0), (-1, 0), (0, 1), (0, -1)))
            if edges:
                shared.append([f"r{left}", f"r{right}", edges])
    return TemporalFrame(
        uid=f"frame-{sequence}-{order}", bundle_uid=f"bundle-{sequence}-{order}",
        provider_id="measured-fixture", sequence_id=sequence, order=order,
        width=40, height=40, groups=groups, source_hashes={"image": image_hash},
        region_evidence={
            "width": 40, "height": 40, "regions": regions, "sharedEdges": shared,
            "adjacent": [[a, b] for a, b, _ in shared], "encloses": [], "borders": [], "fillpoints": [],
        },
    )


def run_sequence(inputs):
    state = initial_temporal_state(inputs[0])
    pairs = []
    for before, after in zip(inputs, inputs[1:]):
        result = compare_frames(before, after, previous_state=state)
        state = result["checkpoint"]
        pairs.append(result)
    return deduce_sequence(inputs, pairs), pairs


def attachment_context(frame, objects, policy="fixture-extractor-policy-v1"):
    return {
        "frame_uid": frame.uid, "provider_id": frame.provider_id, "sequence_id": frame.sequence_id,
        "facts_hash": attachment_facts_hash(frame), "object_evidence_uid": objects["evidenceUid"],
        "extraction_policy_hash": policy,
        "complete": {family: True for family in ATTACHMENT_FACT_FAMILIES},
        "background_roles_trusted": True,
    }


def terms(assessment, known):
    return {render_term(event["term"], entity_ids=known) for event in assessment["events"]}


def test_actual_temporal_movement_stationary_boundary_and_log_replay(tmp_path):
    inputs = [
        frame(0, [("player", "red", rectangle(2, 2))]),
        frame(1, [("player", "red", rectangle(2, 2))]),
        frame(2, [("player", "red", rectangle(4, 2))]),
        frame(3, [("player", "red", rectangle(6, 2))]),
        frame(4, [("player", "red", rectangle(6, 2))]),
    ]
    result, _ = run_sequence(inputs)
    assert result["assessments"][0]["assessment"] == "no_material_change"
    assert result["assessments"][0]["events"] == []
    player = result["checkpoint"]["entity_ids"][0]
    moving = terms(result["assessments"][1], [player])
    assert f"moved('{player}')" in moving and f"start(move('{player}'))" in moving
    assert all(event["term"]["predicate"] != "stationary" for assessment in result["assessments"] for event in assessment["events"])
    store = VisualSequenceEventLog(tmp_path, inputs[0].sequence_id, accepted_detectors=result["accepted_detectors"])
    timeline = store.replay(result["frames"], result["assessments"])
    assert timeline["entries"][0]["reason"] == "no_predecessor"
    assert store.episodes()[0]["end_frame"] == inputs[4].uid
    assert store.replay(result["frames"], result["assessments"]) == timeline


def test_unknown_empty_and_first_frame_no_forced_event(tmp_path):
    empty = frame(0, [])
    singleton = deduce_sequence([empty], [])
    assert singleton["assessments"] == []
    store = VisualSequenceEventLog(tmp_path, empty.sequence_id)
    assert store.replay(singleton["frames"], [])["entries"][0]["assessment"] == "initial_observation"
    after = replace(frame(1, []), source_hashes={"image": "different-unexplained-image"})
    temporal = compare_frames(empty, after)
    result = deduce_pair_events(empty, after, temporal, previous_state=initial_event_state(empty))
    assert result["assessment"]["assessment"] == "unknown"
    assert result["assessment"]["events"] == []


def test_measured_contact_change_emits_phase_and_baseline_not_fake_start(tmp_path):
    inputs = [
        frame(0, [("one", "red", rectangle(2, 2)), ("two", "blue", rectangle(5, 2))]),
        frame(1, [("one", "red", rectangle(2, 2)), ("two", "blue", rectangle(7, 2))]),
    ]
    result, _ = run_sequence(inputs)
    names = [event["term"]["predicate"] for event in result["assessments"][0]["events"]]
    assert "end" in names
    assert any(state["predicate"] == "contact" for state in result["frames"][0]["states"])
    store = VisualSequenceEventLog(tmp_path, inputs[0].sequence_id, accepted_detectors=result["accepted_detectors"])
    store.replay(result["frames"], result["assessments"])
    contact = next(episode for episode in store.episodes() if episode["relation"].startswith("contact("))
    assert contact["baseline_at_sequence_start"] and contact["end_frame"] == inputs[1].uid


def test_unexplained_disappearance_is_missing_not_occlusion_or_exited():
    before = frame(0, [("one", "red", rectangle(2, 2))])
    after = frame(1, [])
    temporal = compare_frames(before, after)
    result = deduce_pair_events(before, after, temporal, previous_state=initial_event_state(before))
    assert {event["term"]["predicate"] for event in result["assessment"]["events"]} == {"missing"}
    assert not result["assessment"]["comparison_complete"]


@pytest.mark.parametrize("x", [25, 37])
def test_unmatched_visible_is_not_proof_of_appearance_or_border_entry(x):
    before = frame(0, [("known", "red", rectangle(2, 2))])
    after = frame(1, [
        ("known", "red", rectangle(2, 2)), ("unmatched", "blue", rectangle(x, 25)),
    ])
    temporal = compare_frames(before, after)
    assert any(row["status"] == "unmatched_visible" for row in temporal["visibility"])
    result = deduce_pair_events(before, after, temporal, previous_state=initial_event_state(before))
    assert not {"appeared", "entered"} & {event["term"]["predicate"] for event in result["assessment"]["events"]}
    assert any(reason.startswith("unresolved_visibility:") for reason in result["assessment"]["uncertainty"])
    assert not result["assessment"]["comparison_complete"]


def test_tampered_measurements_stale_state_and_operational_errors_are_visible():
    before = frame(0, [("one", "red", rectangle(2, 2))])
    after = frame(1, [("one", "red", rectangle(4, 2))])
    temporal = compare_frames(before, after)
    state = initial_event_state(before)
    with pytest.raises(ValueError, match="hash"):
        deduce_pair_events(before, after, {**temporal, "assessment": "unknown"}, previous_state=state)
    with pytest.raises(ValueError, match="changed"):
        deduce_pair_events(before, after, temporal, previous_state=state, config=DetectorConfig(motion_tolerance=2))
    with pytest.raises(RuntimeError, match="SWI execution failed"):
        deduce_pair_events(before, after, temporal, previous_state=state, swipl_executable="missing-swipl-executable")
    assert accepted_detectors()["authored_motion"].startswith("event-detector-version-")


def test_signed_occlusion_rotation_and_reappearance_are_real_prolog_phases(tmp_path):
    actor = [(10, 14), (10, 15), (10, 16), (11, 16)]
    star = [(10, 9), (11, 9), (12, 9), (12, 8)]
    first = frame(0, [("actor", "red", actor), ("star", "red", star)])
    before = frame(1, [("actor", "red", actor), ("star", "red", star)])
    hidden = frame(2, [("actor", "red", star)])
    restored = frame(3, [
        ("actor", "red", [(10, 3), (11, 3), (12, 3), (12, 2)]), ("star", "red", star),
    ])
    first_pair = compare_frames(first, before)
    action_hint = ActionHint("recorded-action", before.uid, hidden.uid, before.groups[0].uid, (0, -1), provenance="explicit-recording-direction")
    depth = {
        "occluderUid": hidden.groups[0].uid, "occludedUid": before.groups[1].uid,
        "compatible": True, "sourceRef": "signed-measured-contour-depth",
    }
    hidden_pair = compare_frames(before, hidden, previous_state=first_pair["checkpoint"], action_hint=action_hint, depth_evidence=[depth])
    restored_pair = compare_frames(hidden, restored, previous_state=hidden_pair["checkpoint"])
    result = deduce_sequence([first, before, hidden, restored], [first_pair, hidden_pair, restored_pair])
    events = result["assessments"][1]["events"]
    occlusion = next(event["term"] for event in events if event["term"]["predicate"] == "start" and event["term"]["args"][0]["predicate"] == "occlude")
    measured = hidden_pair["occlusions"][0]
    assert occlusion["args"][0]["args"] == [measured["occluderTrackUid"], measured["occludedTrackUid"]]
    assert any(event["term"]["predicate"] == "rotated" for event in events)
    assert any(event["term"]["predicate"] == "reappeared" for event in result["assessments"][2]["events"])
    store = VisualSequenceEventLog(tmp_path, first.sequence_id, accepted_detectors=result["accepted_detectors"])
    store.replay(result["frames"][:3], result["assessments"][:2])
    assert next(item for item in store.episodes() if item["relation"].startswith("occlude("))["open_at_sequence_end"]
    store.replay(result["frames"], result["assessments"])
    assert not next(item for item in store.episodes() if item["relation"].startswith("occlude("))["currently_open"]
    contradicted_pair = compare_frames(
        before, hidden, previous_state=first_pair["checkpoint"], action_hint=action_hint,
        depth_evidence=[depth, {**depth, "compatible": False, "sourceRef": "contrary-depth"}],
    )
    contradicted = deduce_sequence([first, before, hidden], [first_pair, contradicted_pair])
    assert not any(
        event["term"]["predicate"] in {"start", "continue"} and event["term"]["args"][0]["predicate"] == "occlude"
        for event in contradicted["assessments"][1]["events"]
    )
    assert any(event["term"]["predicate"] == "missing" for event in contradicted["assessments"][1]["events"])


def test_projected_exit_requires_prior_measured_motion():
    inputs = [
        frame(0, [("one", "red", rectangle(35, 2, 2, 3))]),
        frame(1, [("one", "red", rectangle(38, 2, 2, 3))]),
        frame(2, []),
    ]
    result, pairs = run_sequence(inputs)
    assert pairs[1]["visibility"][0]["projectionSupported"]
    assert {event["term"]["predicate"] for event in result["assessments"][1]["events"]} == {"exited"}


def test_authored_attachment_baseline_start_and_missing_mask_never_implies_end(tmp_path):
    inputs = [
        frame(0, [("one", "red", rectangle(2, 2, 3, 10)), ("two", "blue", rectangle(8, 2, 3, 10))]),
        frame(1, [("one", "red", rectangle(4, 2, 3, 10)), ("two", "blue", rectangle(7, 2, 3, 10))]),
        frame(2, [("one", "red", rectangle(4, 2, 3, 10))]),
    ]
    temporal_state = initial_temporal_state(inputs[0])
    object_state = infer_objects(inputs[0])
    objects, pairs = [object_state], []
    for before, after in zip(inputs, inputs[1:]):
        pair = compare_frames(before, after, previous_state=temporal_state)
        object_state = infer_objects(after, temporal=pair, previous_state=object_state["checkpoint"])
        temporal_state = pair["checkpoint"]
        pairs.append(pair)
        objects.append(object_state)
    result = deduce_sequence(
        inputs, pairs, object_results=objects,
        attachment_contexts=[attachment_context(item, obj) for item, obj in zip(inputs, objects)],
    )
    assert any(
        event["term"]["predicate"] == "start" and event["term"]["args"][0]["predicate"] == "attached"
        for event in result["assessments"][0]["events"]
    )
    store = VisualSequenceEventLog(tmp_path, inputs[0].sequence_id, accepted_detectors=result["accepted_detectors"])
    store.replay(result["frames"], result["assessments"])
    assert next(episode for episode in store.episodes() if episode["relation"].startswith("attached("))["currently_open"]
    assert not any(state["predicate"] == "attached" for state in result["frames"][-1]["states"])


def test_promoted_typed_detector_changes_subsequent_real_deduction_not_only_registry(tmp_path):
    samples = []
    for index, distance in enumerate((2, 3, 4)):
        entity, sequence = f"training-track-{index}", f"training-sequence-{index}"
        samples.append({
            "source_pair": {
                "sequence_id": sequence, "from_frame": f"{sequence}-before", "to_frame": f"{sequence}-after",
                "before_hash": f"before-image-{index}", "after_hash": f"after-image-{index}",
            },
            "source_order": 0, "target_order": 1, "sequence_fingerprint": f"recording-fingerprint-{index}",
            "entity_ids": [entity],
            "facts": [{"predicate": "displacement_magnitude", "args": [entity, distance]}],
            "context": [], "actions": [],
            "events": [{
                "term": {"predicate": "bounce", "args": [entity]}, "event_id": f"independent-bounce-label-{index}",
                "confidence": 0.98, "provenance": {"source": "human_review", "review_id": f"review-{index}"},
            }],
            "assessment": "changed", "comparison_complete": True, "confidence": 0.98,
            "evidence": [f"independent-frame-evidence-{index}"], "uncertainty": [],
            "partition": "held_out" if index == 2 else "train", "label_source": "human_review",
            "label_coverage": ["bounce"], "depends_on_candidates": [],
            "provenance": {"source": "human_review"}, "scope_context": {"domain": "visual-sequence"},
        })
    candidates = CandidateRuleStore(tmp_path)
    induction = induce_detector_rules(
        candidates, samples, scope={"domain": "visual-sequence"},
        feature_predicates=["displacement_magnitude"], gates=PromotionGates(), promote=True,
    )
    candidate_id = induction["candidates"][0]["candidate_id"]
    before = frame(0, [("player", "blue", rectangle(2, 2))], sequence="new-sequence")
    after = frame(1, [("player", "blue", rectangle(5, 2))], sequence="new-sequence")
    temporal = compare_frames(before, after)
    result = deduce_sequence([before, after], [temporal], candidate_store=candidates)
    learned = next(event for event in result["assessments"][0]["events"] if event["term"]["predicate"] == "bounce")
    assert learned["provenance"]["detector_id"] == candidate_id
    assert learned["provenance"]["source"] == "prolog"
    log = VisualSequenceEventLog(tmp_path, before.sequence_id, accepted_detectors=result["accepted_detectors"])
    log.replay(result["frames"], result["assessments"])
    feedback = example_from_deduction(result["pair_results"][0], sequence_fingerprint="new-content", partition="held_out")
    assert candidate_id in feedback["depends_on_candidates"]
