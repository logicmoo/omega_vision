"""Isolated leaf contracts, not runtime producer or acceptance coverage.

Criterion approval and coordinate attestations below are explicit test fixtures.
They do not implement the trusted upstream producers required for integration.
"""

from __future__ import annotations

from copy import deepcopy
from dataclasses import replace
import json
import re
import shutil

import pytest
from PIL import Image

from omega_vision.perception.composition_event_features import (
    CRITERION_ID, CompositionCriterion, SourceCheckpointBinding, build_composition_snapshot,
    deduce_composition_transitions, validate_composition_snapshot,
)
from omega_vision.perception.event_deduction import attachment_facts_hash
from omega_vision.perception.object_evidence import infer_objects_with_evidence
from omega_vision.perception.observation_identity import build_observation_bundle
from omega_vision.perception.pixels_to_regions_cv import extract_region_facts_cv
from omega_vision.perception.temporal_correspondence import compare_frames, initial_temporal_state, temporal_frame_from_bundle
from omega_vision.perception.visibility_event_features import build_visibility_coverage, measure_visibility_transition

pytestmark = pytest.mark.skipif(shutil.which("swipl") is None, reason="SWI-Prolog unavailable")


def observed_frame(directory, index, positions, *, edge=10, widths=(4, 6, 5), colors=((32, 100, 240), (240, 60, 32), (32, 220, 90))):
    image = Image.new("RGB", (96, 64), "#101010")
    for position, color, width in zip(positions, colors, widths):
        if position is None:
            continue
        x0, y0 = position
        for y in range(y0, y0 + edge):
            for x in range(x0, x0 + width):
                image.putpixel((x, y), color)
    image_path, geometry_path = directory / f"image-{index}.png", directory / f"geometry-{index}.json"
    image.save(image_path)
    extracted = extract_region_facts_cv(image_path, filter_mode="none", max_dim=0, geometry_out=geometry_path)
    geometry = json.loads(geometry_path.read_text(encoding="utf-8"))
    backgrounds = set(re.findall(r"opencv_background_candidate\((r\d+)\)", extracted["prolog"]))
    accepted = [{"id": f"g{n}", "members": [region], "acceptance": "measured_foreground_singleton"}
                for n, region in enumerate(re.findall(r"region\((r\d+),", extracted["prolog"]), 1)
                if region not in backgrounds]
    bundle = build_observation_bundle(
        frame_alias=f"frame{index}", sequence_id="measured-composition-sensor", frame_order=index,
        image_bytes=image_path.read_bytes(), extraction_text=extracted["prolog"], grouping_text="",
        acceptance_text="measured_foreground_singleton", geometry=geometry, accepted_groups=accepted,
    )
    frame = temporal_frame_from_bundle(
        bundle, provider_id="opencv", geometry=geometry, extraction_text=extracted["prolog"],
        image_bytes=image_path.read_bytes(),
    )
    return frame, extracted["attachmentEvidence"]


def context(frame, objects, attestation):
    return {
        "frame_uid": frame.uid, "provider_id": frame.provider_id, "sequence_id": frame.sequence_id,
        "facts_hash": attachment_facts_hash(frame), "object_evidence_uid": objects["evidenceUid"],
        "extraction_policy_hash": attestation["extractionPolicyHash"],
        "complete": attestation["complete"], "background_roles_trusted": attestation["backgroundRolesTrusted"],
    }


def binding(temporal_checkpoint, objects, previous):
    return SourceCheckpointBinding(
        temporal_checkpoint_uid=temporal_checkpoint["checkpointUid"],
        object_checkpoint_uid=objects["checkpoint"]["checkpointUid"],
        source_temporal_checkpoint_uid=temporal_checkpoint["previousCheckpointUid"],
        source_object_checkpoint_uid=objects["checkpoint"]["previousCheckpointUid"],
        previous_snapshot_uid=previous["snapshotUid"] if previous is not None else None,
    )


DEFAULT_POSITIONS = [
    [(10, 20), (30, 20)], [(20, 20), (24, 20)], [(24, 20), (28, 20)],
    [(28, 20), (32, 20)], [(14, 20), (44, 20)],
]


def measure_sequence(directory, positions=None, *, edge=10, context_changes=None, criterion_changes=None):
    results, previous_frame, previous_objects, previous_snapshot, temporal_checkpoint = [], None, None, None, None
    for index, locations in enumerate(positions or DEFAULT_POSITIONS):
        frame, attestation = observed_frame(directory, index, locations, edge=edge)
        temporal = compare_frames(previous_frame, frame, previous_state=temporal_checkpoint) if previous_frame is not None else None
        temporal_checkpoint = temporal["checkpoint"] if temporal is not None else initial_temporal_state(frame)
        objects = infer_objects_with_evidence(
            frame, temporal=temporal, previous_state=previous_objects["checkpoint"] if previous_objects is not None else None,
        )
        criterion = CompositionCriterion(
            CRITERION_ID, objects["ruleHashes"], "accepted-repository-object-composition", independent=True,
        )
        current_context = context(frame, objects, attestation)
        if context_changes and index in context_changes:
            current_context = context_changes[index](deepcopy(current_context))
        if criterion_changes and index in criterion_changes:
            criterion = replace(criterion, **criterion_changes[index])
        source_binding = binding(temporal_checkpoint, objects, previous_snapshot)
        snapshot = build_composition_snapshot(
            frame, objects, temporal=temporal, attachment_context=current_context,
            criterion=criterion, source_checkpoint_binding=source_binding, previous_snapshot=previous_snapshot,
        )
        result = deduce_composition_transitions(previous_snapshot, snapshot)
        results.append({
            "frame": frame, "temporal": temporal, "objects": objects, "context": current_context,
            "criterion": criterion, "binding": source_binding, "snapshot": snapshot, "result": result,
        })
        previous_frame, previous_objects, previous_snapshot = frame, objects, snapshot
    return results


def deductions(records):
    return [(record["frame"].order, row["term"]["predicate"], row["term"]["args"][0])
            for record in records for row in record["result"]["deductions"]]


def test_real_authored_composition_forms_after_motion_and_dissolves_after_visible_separation(tmp_path):
    records = measure_sequence(tmp_path)
    assert records[0]["result"]["assessment"] == "initial_observation"
    assert records[0]["result"]["reason"] == "no_predecessor"
    assert records[0]["result"]["deductions"] == records[1]["result"]["deductions"] == []
    formed, dissolved = deductions(records)
    assert formed[:2] == (2, "group_formed") and dissolved[:2] == (4, "group_dissolved")
    assert formed[2] == dissolved[2]
    assert records[2]["objects"]["objects"][0]["uid"] == records[3]["objects"]["objects"][0]["uid"] == formed[2]
    assert any(edge["witness"].get("sharedPixels", 0) >= 8 for edge in records[2]["objects"]["compositionEvidence"]["attachments"])
    event = records[2]["result"]["deductions"][0]
    assert records[0]["frame"].uid in event["evidence"]
    assert records[2]["frame"].uid in event["evidence"]
    assert event["decisionFrameOrder"] == 2
    assert {term["predicate"] for record in records for term in record["result"]["facts"]} <= {
        "group_member", "group_formed", "group_dissolved",
    }


def test_same_members_reform_without_rewriting_object_identity_or_history(tmp_path):
    positions = DEFAULT_POSITIONS + [[(20, 20), (24, 20)], [(24, 20), (28, 20)]]
    records = measure_sequence(tmp_path, positions)
    events = deductions(records)
    assert [(index, name) for index, name, _ in events] == [
        (2, "group_formed"), (4, "group_dissolved"), (6, "group_formed"),
    ]
    assert len({uid for _, _, uid in events}) == 1
    assert records[2]["objects"]["objects"][0]["compositionHistory"][0] == records[6]["objects"]["objects"][0]["compositionHistory"][0]


def test_changed_membership_does_not_silently_rename_the_old_object_or_claim_lineage(tmp_path):
    positions = [row + [(62, 20)] for row in DEFAULT_POSITIONS[:3]]
    positions += [[(28, 20), (32, 20), (38, 20)], [(32, 20), (36, 20), (42, 20)]]
    records = measure_sequence(tmp_path, positions)
    old = records[2]["objects"]["objects"][0]
    larger = next(obj for obj in records[4]["objects"]["objects"] if len(obj["memberTrackUids"]) == 3)
    assert old["uid"] != larger["uid"]
    assert next(obj for obj in records[4]["objects"]["objects"] if obj["uid"] == old["uid"])["memberTrackUids"] == old["memberTrackUids"]
    assert any(reason.startswith("membership_continuity_unresolved") for reason in records[4]["result"]["limitations"])
    assert [(index, name) for index, name, _ in deductions(records)] == [(2, "group_formed")]


def test_six_pixel_shared_edge_does_not_lower_the_accepted_criterion(tmp_path):
    records = measure_sequence(tmp_path, DEFAULT_POSITIONS[:4], edge=6)
    assert deductions(records) == []
    assert all(not record["objects"]["compositionEvidence"]["components"] for record in records)


def test_stationary_attached_and_missing_members_never_mean_dissolved(tmp_path):
    positions = DEFAULT_POSITIONS[:3] + [[(24, 20), (28, 20)], [(24, 20), None]]
    records = measure_sequence(tmp_path, positions)
    assert [(index, name) for index, name, _ in deductions(records)] == [(2, "group_formed")]
    assert records[3]["snapshot"]["compositions"][0]["truth"] is None
    assert records[4]["snapshot"]["compositions"][0]["truth"] is None
    assert any(reason.startswith("members_missing") for reason in records[4]["result"]["limitations"])
    assert records[4]["result"]["assessment"] == "unknown"


def test_incomplete_contrary_measurement_is_unknown_even_if_object_status_says_contradicted(tmp_path):
    records = measure_sequence(tmp_path, context_changes={
        4: lambda value: {**value, "complete": {**value["complete"], "adjacency": False}},
    })
    assert records[4]["objects"]["objects"][0]["status"] == "composition_contradicted"
    assert records[4]["snapshot"]["compositions"][0]["truth"] is None
    assert [(index, name) for index, name, _ in deductions(records)] == [(2, "group_formed")]
    assert "incomplete_attachment_measurements" in records[4]["result"]["limitations"]


@pytest.mark.parametrize("taint", [
    {"independent": False}, {"used_prototype_ids": ("prototype-used-in-current-acceptance",)},
    {"used_candidate_ids": ("candidate-used-in-current-acceptance",)},
])
def test_self_dependent_or_unattested_proof_cannot_supply_formation(tmp_path, taint):
    records = measure_sequence(tmp_path, DEFAULT_POSITIONS[:3], criterion_changes={2: taint})
    assert records[2]["objects"]["compositionEvidence"]["components"]
    assert records[2]["snapshot"]["eligible"] is False
    assert records[2]["result"]["facts"] == records[2]["result"]["deductions"] == []
    assert "criterion_support_not_independent" in records[2]["result"]["limitations"]


def test_unknown_initial_assembly_is_not_given_a_fabricated_formation_baseline(tmp_path):
    records = measure_sequence(tmp_path, [[(20, 20), (24, 20)], [(24, 20), (28, 20)]])
    assert records[1]["snapshot"]["compositions"][0]["truth"] is True
    assert deductions(records) == []
    assert any(reason.startswith("formation_baseline_unavailable") for reason in records[1]["result"]["limitations"])
    assert any(term["predicate"] == "group_member" for term in records[1]["result"]["facts"])


def test_snapshot_binding_hash_policy_and_causal_prefix_are_checked(tmp_path):
    records = measure_sequence(tmp_path, DEFAULT_POSITIONS[:3])
    last, previous = records[2], records[1]["snapshot"]
    original = deepcopy(previous)
    replay = build_composition_snapshot(
        last["frame"], last["objects"], temporal=last["temporal"], attachment_context=last["context"],
        criterion=last["criterion"], source_checkpoint_binding=last["binding"], previous_snapshot=previous,
    )
    assert replay == last["snapshot"] and original == previous
    replay["separationHistory"][0]["visibleTrackUids"].clear()
    assert original == previous
    replay = last["snapshot"]
    with pytest.raises(ValueError, match="trusted reference"):
        validate_composition_snapshot(replay, expected_uid="other-snapshot")
    with pytest.raises(ValueError, match="source checkpoint binding"):
        build_composition_snapshot(
            last["frame"], last["objects"], temporal=last["temporal"], attachment_context=last["context"],
            criterion=last["criterion"], source_checkpoint_binding=replace(last["binding"], source_object_checkpoint_uid="wrong"),
            previous_snapshot=previous,
        )
    with pytest.raises(ValueError, match="policy changed"):
        build_composition_snapshot(
            last["frame"], last["objects"], temporal=last["temporal"],
            attachment_context={**last["context"], "extraction_policy_hash": "another-policy"},
            criterion=last["criterion"], source_checkpoint_binding=last["binding"], previous_snapshot=previous,
        )
    tampered = deepcopy(replay)
    tampered["compositions"][0]["truth"] = False
    with pytest.raises(ValueError, match="content hash"):
        deduce_composition_transitions(previous, tampered)
    with pytest.raises(ValueError, match="trusted reference"):
        deduce_composition_transitions(records[0]["snapshot"], replay)
    bad_objects = deepcopy(last["objects"])
    bad_objects["compositionEvidence"]["components"] = []
    with pytest.raises(ValueError, match="content hash"):
        build_composition_snapshot(
            last["frame"], bad_objects, temporal=last["temporal"], attachment_context=last["context"],
            criterion=last["criterion"], source_checkpoint_binding=last["binding"], previous_snapshot=previous,
        )


def test_untrusted_background_and_incomplete_positive_proof_remain_ungraded(tmp_path):
    records = measure_sequence(tmp_path, DEFAULT_POSITIONS[:3], context_changes={
        2: lambda value: {**value, "background_roles_trusted": False},
    })
    assert records[2]["objects"]["compositionEvidence"]["components"]
    assert deductions(records) == []
    assert records[2]["result"]["facts"] == []


def fixed_coordinate_frame(frame):
    return replace(frame, observation_metadata={
        "source_ref": "fixed-raster-acquisition", "source_hash": frame.source_hashes["image"],
        "coordinate_frame_id": "fixed-raster",
    })


def visibility_pair(directory, *, partial=True, unknown=False, fixed=True):
    before = observed_frame(directory, 0, [(0, 20)] if partial else [], widths=(5,))[0]
    after = observed_frame(directory, 1, [(1, 20)] if partial else [(20, 20)], widths=(6,))[0]
    if fixed:
        before, after = fixed_coordinate_frame(before), fixed_coordinate_frame(after)
    first = build_visibility_coverage(
        before, (directory / "image-0.png").read_bytes(), source_ref="source-image-0",
        unknown_pixel_runs=((20, 0, 4),) if unknown else (),
    )
    second = build_visibility_coverage(after, (directory / "image-1.png").read_bytes(), source_ref="source-image-1")
    temporal = compare_frames(before, after)
    return before, after, temporal, first, second


def test_unique_exact_border_clipping_and_inward_continuation_support_entered(tmp_path):
    before, after, temporal, first, second = visibility_pair(tmp_path)
    result = measure_visibility_transition(before, after, temporal, before_coverage=first, after_coverage=second)
    assert [row["term"]["predicate"] for row in result["deductions"]] == ["entered"]
    assert result["passages"][0]["edge"] == "left"
    assert result["passages"][0]["translation"] == [2, 0]
    assert result["passages"][0]["sourceExtensionObserved"] is False
    assert result["deductions"][0]["decisionFrameUid"] == after.uid
    assert result == measure_visibility_transition(before, after, temporal, before_coverage=first, after_coverage=second)


@pytest.mark.parametrize("edge,source,target,delta", [
    ("right", ((91, 20), 5, 10), ((88, 20), 6, 10), [-3, 0]),
    ("top", ((20, 0), 6, 9), ((20, 2), 6, 10), [0, 3]),
    ("bottom", ((20, 55), 6, 9), ((20, 50), 6, 10), [0, -5]),
])
def test_border_passage_uses_image_axes_for_each_edge(tmp_path, edge, source, target, delta):
    frames, receipts = [], []
    for index, (position, width, height) in enumerate((source, target)):
        frame = fixed_coordinate_frame(observed_frame(tmp_path, index, [position], edge=height, widths=(width,))[0])
        frames.append(frame)
        receipts.append(build_visibility_coverage(frame, (tmp_path / f"image-{index}.png").read_bytes(), source_ref=f"image-{index}"))
    temporal = compare_frames(*frames)
    result = measure_visibility_transition(*frames, temporal, before_coverage=receipts[0], after_coverage=receipts[1])
    assert [row["term"]["predicate"] for row in result["deductions"]] == ["entered"]
    assert result["passages"][0]["edge"] == edge and result["passages"][0]["translation"] == delta


def test_another_matching_visible_template_keeps_border_passage_ambiguous(tmp_path):
    before = fixed_coordinate_frame(observed_frame(tmp_path, 0, [(0, 20)], widths=(5,))[0])
    after = fixed_coordinate_frame(observed_frame(
        tmp_path, 1, [(1, 20), (1, 40)], widths=(6, 6), colors=((32, 100, 240), (32, 100, 240)),
    )[0])
    first = build_visibility_coverage(before, (tmp_path / "image-0.png").read_bytes(), source_ref="image-0")
    second = build_visibility_coverage(after, (tmp_path / "image-1.png").read_bytes(), source_ref="image-1")
    result = measure_visibility_transition(before, after, compare_frames(before, after), before_coverage=first, after_coverage=second)
    assert result["deductions"] == []
    assert any(reason.startswith("ambiguous_border_passage") for reason in result["limitations"])


@pytest.mark.parametrize("unknown,fixed", [(True, True), (False, False)])
def test_unknown_pixels_or_unbound_camera_withhold_border_entry(tmp_path, unknown, fixed):
    before, after, temporal, first, second = visibility_pair(tmp_path, unknown=unknown, fixed=fixed)
    result = measure_visibility_transition(before, after, temporal, before_coverage=first, after_coverage=second)
    assert result["deductions"] == []
    assert result["limitations"]


def test_first_observed_interior_is_not_physical_creation_or_proven_absence(tmp_path):
    before, after, temporal, first, second = visibility_pair(tmp_path, partial=False)
    result = measure_visibility_transition(before, after, temporal, before_coverage=first, after_coverage=second)
    assert result["deductions"] == []
    assert result["firstVisible"]
    assert result["firstVisible"][0]["physicalCreationObserved"] is False
    assert result["firstVisible"][0]["priorAbsenceEstablished"] is False
    assert first["semanticAbsenceEstablished"] is False
    initial = measure_visibility_transition(None, before, None, before_coverage=None, after_coverage=first)
    assert initial["assessment"] == "initial_observation" and initial["reason"] == "no_predecessor"


def test_visibility_hash_bounds_source_and_causal_cutoff_validation(tmp_path):
    before, after, temporal, first, second = visibility_pair(tmp_path)
    with pytest.raises(ValueError, match="image hash"):
        build_visibility_coverage(before, (tmp_path / "image-1.png").read_bytes(), source_ref="wrong-image")
    with pytest.raises(ValueError, match="outside"):
        build_visibility_coverage(before, (tmp_path / "image-0.png").read_bytes(), source_ref="bad-mask",
                                  unknown_pixel_runs=((64, 0, 4),))
    bad = deepcopy(first)
    bad["semanticAbsenceEstablished"] = True
    with pytest.raises(ValueError, match="content hash"):
        measure_visibility_transition(before, after, temporal, before_coverage=bad, after_coverage=second)
    with pytest.raises(ValueError, match="unbound"):
        measure_visibility_transition(before, after, temporal, before_coverage=second, after_coverage=first)
    bad_temporal = deepcopy(temporal)
    bad_temporal["targetOrder"] = 99
    with pytest.raises(ValueError, match="content hash"):
        measure_visibility_transition(before, after, bad_temporal, before_coverage=first, after_coverage=second)
