from __future__ import annotations

from copy import deepcopy
from dataclasses import replace
from pathlib import Path

import numpy as np
import pytest

from omega_vision.perception.grouping_learning import (
    GroupingEvidence, grouping_candidate_evaluations, match_prototypes, observe_grouping,
)
from omega_vision.perception.object_tracking import (
    aggregate_object_occlusions, deduce_compositions, infer_objects, measure_composition_input,
)
from omega_vision.perception.observation_identity import build_observation_bundle
from omega_vision.perception.pixels_to_regions_cv import _pixel_runs
from omega_vision.perception.temporal_correspondence import (
    ActionHint, compare_frames, frame_from_dict, frame_to_dict, initial_temporal_state,
    load_checkpoint, measure_frame_relations, persist_checkpoint, shape_comparison, temporal_frame_from_bundle,
)


def rectangle(x: int, y: int, width: int = 3, height: int = 3) -> list[tuple[int, int]]:
    return [(a, b) for b in range(y, y + height) for a in range(x, x + width)]


def make_frame(
    order: int, shapes: list[tuple[str, str, list[tuple[int, int]]]], *,
    extra: str = "", provider: str = "opencv", sequence: str = "recording-a",
    scale: int = 1, width: int = 40, height: int = 40,
    hypotheses: bool = False,
):
    geometry = {"width": width * scale, "height": height * scale, "polygons": {}}
    facts, accepted = [], []
    for index, (alias, color, points) in enumerate(shapes, 1):
        region = f"r{index}"
        scaled = [(x * scale + a, y * scale + b) for x, y in points for a in range(scale) for b in range(scale)]
        layer = np.zeros((height * scale, width * scale), dtype=np.int32)
        for x, y in scaled:
            layer[y, x] = index
        runs = _pixel_runs(layer, index)
        cx, cy = np.mean(scaled, axis=0)
        facts.append(f"region({region},'{color}',{len(scaled)},centroid({cx},{cy})).")
        geometry["polygons"][str(index)] = {"outer": [], "holes": [], "smallFeature": {"pixelRuns": runs}}
        accepted.append({"id": alias, "members": [region], "acceptance": "fixture_authored_rule"})
    facts.append(extra)
    if hypotheses and shapes:
        facts.append("vision_group(v1,connected_component,[r1],[]).")
    extraction = "\n".join(facts)
    bundle = build_observation_bundle(
        frame_alias=f"frame{order}", sequence_id=sequence, frame_order=order,
        image_bytes=f"deterministic-fixture:{order}:{shapes}:{scale}".encode(),
        extraction_text=extraction, grouping_text="part_group(w1,[r1])." if hypotheses and shapes else "",
        acceptance_text="fixture_final_acceptance", geometry=geometry, accepted_groups=accepted,
    )
    lineage = None if scale == 1 else {
        "transform": {"originalSize": [width, height], "size": [width * scale, height * scale],
                      "variantToSource": [1 / scale, 0, 0, 0, 1 / scale, 0]},
    }
    frame = temporal_frame_from_bundle(
        bundle, provider_id=provider, geometry=geometry, extraction_text=extraction, lineage=lineage,
    )
    return frame, bundle, geometry, extraction


def group(frame, alias):
    return next(item for item in frame.groups if item.alias == alias)


def test_adapter_keeps_final_identity_independent_from_v_and_w_and_aliases():
    frame, bundle, _, _ = make_frame(0, [("g1", "red", rectangle(2, 3))], hypotheses=True)
    assert len(frame.groups) == 1
    assert frame.groups[0].uid == bundle["groups"]["final"][0]["uid"]
    assert frame.groups[0].uid not in {bundle["groups"][kind][0]["uid"] for kind in ("visual", "symbolic")}
    assert frame.groups[0].mask_source == "exact_pixel_runs"
    assert frame_to_dict(frame_from_dict(frame_to_dict(frame))) == frame_to_dict(frame)


def test_adapter_uses_original_variant_lineage_and_inclusive_pixel_runs():
    before, _, _, _ = make_frame(0, [("g1", "red", rectangle(2, 3))], scale=1)
    after, bundle, geometry, facts = make_frame(1, [("g8", "red", rectangle(2, 3))], scale=3)
    assert before.groups[0].points == after.groups[0].points
    pair = compare_frames(before, after)
    assert pair["assessment"] == "no_material_change"
    assert pair["motion"][0]["state"] == "stationary"
    assert pair["motion"][0]["displacement"] == [0, 0]
    with pytest.raises(ValueError, match="unsupported"):
        temporal_frame_from_bundle(bundle, provider_id="opencv", geometry=geometry, extraction_text=facts,
                                   lineage={"originalSize": [40, 40], "variantToSource": [1, 1, 0, 0, 1, 0]})


def test_adapter_rasterizes_real_contours_without_a_small_feature():
    _, bundle, geometry, facts = make_frame(0, [("g1", "red", rectangle(2, 3))])
    geometry["polygons"]["1"] = {"outer": [[2, 3], [4, 3], [4, 5], [2, 5]], "holes": []}
    frame = temporal_frame_from_bundle(bundle, provider_id="opencv", geometry=geometry, extraction_text=facts)
    assert set(frame.groups[0].points) == set(rectangle(2, 3))
    assert frame.groups[0].mask_source == "rasterized_contour"


def test_bootstrap_is_not_transition_or_event():
    frame, _, _, _ = make_frame(5, [("g1", "red", rectangle(2, 3))])
    state = initial_temporal_state(frame)
    assert state["assessment"] == "initial_observation"
    assert state["pairUid"] is None
    assert "events" not in state
    assert all("objectUid" not in track for track in state["tracks"])


def test_matching_one_to_one_replay_and_renamed_aliases():
    before, _, _, _ = make_frame(0, [("g1", "red", rectangle(2, 3)), ("g2", "blue", rectangle(20, 3))])
    after, _, _, _ = make_frame(1, [("g9", "red", rectangle(4, 3)), ("g1", "blue", rectangle(22, 3))])
    pair = compare_frames(before, after)
    assert len(pair["matches"]) == len({m["toUid"] for m in pair["matches"]}) == 2
    assert {m["fromUid"]: m["toUid"] for m in pair["matches"]}[group(before, "g1").uid] == group(after, "g9").uid
    assert pair == compare_frames(before, after)
    assert all(m["state"] == "moving" for m in pair["motion"])


def test_equal_global_assignments_stay_ambiguous_not_identity_swaps():
    before, _, _, _ = make_frame(0, [("g1", "red", rectangle(5, 8)), ("g2", "red", rectangle(15, 8))])
    after, _, _, _ = make_frame(1, [("g8", "red", rectangle(10, 3)), ("g9", "red", rectangle(10, 13))])
    pair = compare_frames(before, after)
    assert pair["matches"] == []
    assert len(pair["ambiguities"]) == 2
    assert pair["assessment"] == "unknown"


def test_symbolic_color_tie_breaks_equal_pixel_assignments_only():
    before, _, _, _ = make_frame(0, [("g1", "red", rectangle(5, 8)), ("g2", "blue", rectangle(15, 8))])
    after, _, _, _ = make_frame(1, [("g8", "red", rectangle(10, 3)), ("g9", "blue", rectangle(10, 13))])
    pair = compare_frames(before, after)
    assert len(pair["matches"]) == 2
    assert all(match["symbolicallyResolved"] for match in pair["matches"])
    assert {m["fromUid"]: m["toUid"] for m in pair["matches"]}[group(before, "g1").uid] == group(after, "g8").uid


@pytest.mark.parametrize("change", ["gap", "provider", "sequence", "stale", "tampered"])
def test_rejects_gaps_cross_scope_and_stale_or_tampered_checkpoints(change):
    before, _, _, _ = make_frame(0, [("g1", "red", rectangle(2, 3))])
    after, _, _, _ = make_frame(1, [("g2", "red", rectangle(3, 3))])
    state = initial_temporal_state(before)
    if change == "gap":
        after = replace(after, order=2)
    elif change == "provider":
        after = replace(after, provider_id="different")
    elif change == "sequence":
        after = replace(after, sequence_id="different")
    elif change == "stale":
        before = replace(before, bundle_uid="revised")
    else:
        state["frameOrder"] = 22
    with pytest.raises(ValueError):
        compare_frames(before, after, previous_state=state)


def test_absence_is_not_occlusion_or_exit_without_supported_projection():
    before, _, _, _ = make_frame(0, [("g1", "red", rectangle(38, 4, 2, 2))])
    after, _, _, _ = make_frame(1, [])
    result = compare_frames(before, after)
    assert result["occlusions"] == []
    assert result["visibility"][0]["status"] == "missing"
    assert not result["visibility"][0]["projectionSupported"]


def test_empty_unmeasurable_frames_do_not_claim_no_change():
    before, _, _, _ = make_frame(0, [])
    after, _, _, _ = make_frame(1, [])
    assert compare_frames(before, after)["assessment"] == "unknown"


def test_color_change_is_not_no_material_change():
    before, _, _, _ = make_frame(0, [("g1", "red", rectangle(2, 3))])
    after, _, _, _ = make_frame(1, [("g7", "blue", rectangle(2, 3))])
    assert compare_frames(before, after)["assessment"] == "material_change"


def test_far_lookalike_is_not_reappearance():
    first, _, _, _ = make_frame(0, [("g1", "red", rectangle(2, 3))])
    missing, _, _, _ = make_frame(1, [])
    later, _, _, _ = make_frame(2, [("g9", "red", rectangle(12, 3))])
    old = compare_frames(first, missing)
    new = compare_frames(missing, later, previous_state=old["checkpoint"])
    assert new["matches"] == []
    assert not any(row["status"] == "reappeared" for row in new["visibility"])


def test_exit_requires_prior_measured_motion_leaving_frame():
    first, _, _, _ = make_frame(0, [("g1", "red", rectangle(34, 4, 2, 2))])
    before, _, _, _ = make_frame(1, [("g2", "red", rectangle(38, 4, 2, 2))])
    after, _, _, _ = make_frame(2, [])
    previous = compare_frames(first, before)
    result = compare_frames(before, after, previous_state=previous["checkpoint"])
    assert result["occlusions"] == []
    assert result["visibility"][0]["status"] == "exited"
    assert result["visibility"][0]["projectedExitFraction"] == 1


def test_partial_occlusion_retains_visible_successor_and_signed_depth():
    first, _, _, _ = make_frame(0, [("g1", "red", rectangle(8, 8, 4, 3))])
    before, _, _, _ = make_frame(1, [("g2", "red", rectangle(8, 8, 4, 3))])
    after, _, _, _ = make_frame(2, [
        ("g8", "red", rectangle(8, 8, 3, 3)), ("g9", "blue", rectangle(11, 8, 1, 3)),
    ])
    previous = compare_frames(first, before)
    hints = [{"occluderUid": group(after, "g9").uid, "occludedUid": group(before, "g2").uid,
              "compatible": True, "sourceRef": "measured_contour_depth"}]
    result = compare_frames(before, after, previous_state=previous["checkpoint"], depth_evidence=hints)
    assert len(result["matches"]) == 1
    assert result["occlusions"][0]["status"] == "partial_occlusion"
    assert result["occlusions"][0]["confirmed"]
    contradicted = compare_frames(before, after, previous_state=previous["checkpoint"], depth_evidence=[
        *hints, {**hints[0], "compatible": False, "sourceRef": "counter-depth"},
    ])
    assert not contradicted["occlusions"][0]["confirmed"]


def actor_star_frames():
    actor = [(10, 14), (10, 15), (10, 16), (11, 16)]
    rotated_star = [(10, 9), (11, 9), (12, 9), (12, 8)]
    first, _, _, _ = make_frame(3, [("g1", "red", actor), ("g2", "red", rotated_star)])
    before, _, _, _ = make_frame(4, [("g3", "red", actor), ("g4", "red", rotated_star)])
    after, _, _, _ = make_frame(5, [("g9", "red", rotated_star)])
    return first, before, after


def test_upward_authoritative_actor_rotation_does_not_swap_with_hidden_star():
    first, before, after = actor_star_frames()
    previous = compare_frames(first, before)
    hint = ActionHint("action1", before.uid, after.uid, group(before, "g3").uid, (0, -1),
                      provenance="recording_contract:incoming_frame5")
    result = compare_frames(before, after, previous_state=previous["checkpoint"], action_hint=hint)
    assert len(result["matches"]) == 1
    assert result["matches"][0]["fromUid"] == group(before, "g3").uid
    assert result["matches"][0]["toUid"] == group(after, "g9").uid
    assert result["matches"][0]["transforms"] == ["rot90"]
    assert result["motion"][0]["displacement"][1] < 0
    assert len(result["occlusions"]) == 1
    assert result["occlusions"][0]["occludedUid"] == group(before, "g4").uid
    assert result["occlusions"][0]["occluderUid"] == group(after, "g9").uid
    assert result["occlusions"][0]["status"] == "full_occlusion"
    assert not result["occlusions"][0]["confirmed"]
    assert any(row["relation"] == "contact" and row["after"] for row in result["topology"])
    assert result["checkpoint"]["occlusionEpisodes"][0]["endPairUid"] is None
    assert result == compare_frames(before, after, previous_state=previous["checkpoint"], action_hint=hint)


def test_reappearance_confirms_account_but_final_frame_does_not_fake_an_end():
    first, before, after = actor_star_frames()
    previous = compare_frames(first, before)
    hint = ActionHint("action1", before.uid, after.uid, group(before, "g3").uid, (0, -1), provenance="explicit")
    hidden = compare_frames(before, after, previous_state=previous["checkpoint"], action_hint=hint)
    later, _, _, _ = make_frame(6, [
        ("g5", "red", [(10, 3), (11, 3), (12, 3), (12, 2)]),
        ("g6", "red", [(10, 9), (11, 9), (12, 9), (12, 8)]),
    ])
    restored = compare_frames(after, later, previous_state=hidden["checkpoint"])
    reappeared = [m for m in restored["matches"] if m["reappeared"]]
    assert len(reappeared) == 1
    assert reappeared[0]["fromUid"] == group(before, "g4").uid
    episode = restored["checkpoint"]["occlusionEpisodes"][0]
    assert episode["endPairUid"] == restored["pairUid"]
    assert episode["confirmingPairUid"] == restored["pairUid"]
    assert hidden["checkpoint"]["occlusionEpisodes"][0]["endPairUid"] is None


def test_hidden_lookalike_does_not_steal_a_stopped_occluder_identity():
    first, before, after = actor_star_frames()
    previous = compare_frames(first, before)
    hint = ActionHint("action1", before.uid, after.uid, group(before, "g3").uid, (0, -1), provenance="explicit")
    hidden = compare_frames(before, after, previous_state=previous["checkpoint"], action_hint=hint)
    later, _, _, _ = make_frame(6, [("g5", "red", [(10, 9), (11, 9), (12, 9), (12, 8)])])
    continued = compare_frames(after, later, previous_state=hidden["checkpoint"])
    assert len(continued["matches"]) == 1
    assert continued["matches"][0]["trackUid"] == hidden["matches"][0]["trackUid"]
    assert not continued["matches"][0]["reappeared"]
    assert continued["checkpoint"]["occlusionEpisodes"][0]["endPairUid"] is None
    assert any(row.get("excludedReason") == "occluder_not_separately_observed" for row in continued["candidates"])


def test_predicted_hidden_masks_are_not_prior_observed_topology():
    first, before, after = actor_star_frames()
    previous = compare_frames(first, before)
    hint = ActionHint("action1", before.uid, after.uid, group(before, "g3").uid, (0, -1), provenance="explicit")
    hidden = compare_frames(before, after, previous_state=previous["checkpoint"], action_hint=hint)
    assert hidden["topology"][0]["before"] is False
    later, _, _, _ = make_frame(6, [("g5", "red", [(10, 9), (11, 9), (12, 9), (12, 8)])])
    continued = compare_frames(after, later, previous_state=hidden["checkpoint"])
    assert all(row["before"] is None for row in continued["topology"])
    assert all(row["prediction"] for row in continued["topology"])


def test_action_actor_and_pair_direction_are_never_guessed():
    _, before, after = actor_star_frames()
    for hint in (
        ActionHint("action1", after.uid, before.uid, group(before, "g3").uid, (0, -1), provenance="explicit"),
        ActionHint("action1", before.uid, after.uid, "player", (0, -1), provenance="explicit"),
    ):
        with pytest.raises(ValueError):
            compare_frames(before, after, action_hint=hint)
    assert compare_frames(before, after)["actionHint"] is None


def test_contact_and_containment_measurements():
    ring = [(x, y) for x, y in rectangle(2, 2, 12, 12) if x in (2, 13) or y in (2, 13)]
    first, _, _, _ = make_frame(0, [("g1", "blue", ring), ("g2", "red", rectangle(6, 6))])
    later, _, _, _ = make_frame(1, [("g8", "blue", ring), ("g9", "red", rectangle(10, 6))])
    result = compare_frames(first, later)
    assert any(row["relation"] == "contain" and row["before"] and row["after"] for row in result["topology"])
    assert any(row["relation"] == "contact" and row["after"] and not row["before"] for row in result["topology"])


def test_frame_relation_baseline_and_current_snapshot_preserve_track_identities():
    first, _, _, _ = make_frame(0, [("g1", "red", rectangle(2, 3)), ("g2", "blue", rectangle(10, 3))])
    after, _, _, _ = make_frame(1, [("g8", "red", rectangle(3, 3)), ("g9", "blue", rectangle(10, 3))])
    baseline = measure_frame_relations(first)
    pair = compare_frames(first, after)
    current = measure_frame_relations(after, temporal_state=pair["checkpoint"])
    assert baseline["comparisonComplete"] and current["comparisonComplete"]
    assert {tuple(row["subjects"]) for row in baseline["relations"]} == {
        tuple(row["subjects"]) for row in current["relations"]
    }
    assert all(row["truth"] is False for row in baseline["relations"])
    assert "events" not in baseline


def attached_frames(extra="shared_edge(r1,r2,8).", delta=2):
    before, _, _, _ = make_frame(0, [
        ("g1", "red", rectangle(2, 4, 3, 8)), ("g2", "blue", rectangle(5, 4, 3, 8)),
    ], extra=extra)
    after, _, _, _ = make_frame(1, [
        ("g8", "red", rectangle(2 + delta, 4, 3, 8)), ("g9", "blue", rectangle(5 + delta, 4, 3, 8)),
    ], extra=extra)
    return before, after


def test_prolog_creates_o_only_for_two_attached_co_moving_final_groups():
    before, after = attached_frames()
    bootstrap = infer_objects(before)
    assert bootstrap["objects"] == []
    temporal = compare_frames(before, after)
    result = infer_objects(after, temporal=temporal, previous_state=bootstrap["checkpoint"])
    assert len(result["objects"]) == 1
    obj = result["objects"][0]
    assert obj["alias"] == "o1"
    assert len(obj["memberTrackUids"]) == 2
    assert obj["authority"] == "authored_prolog_deduction"
    assert obj["status"] == "supported"
    assert result == infer_objects(after, temporal=temporal, previous_state=bootstrap["checkpoint"])


@pytest.mark.parametrize("extra,delta", [("", 2), ("adjacent(r1,r2).", 2), ("shared_edge(r1,r2,7).", 2), ("shared_edge(r1,r2,8).", 0)])
def test_co_motion_adjacency_weak_edge_or_stationary_attachment_is_insufficient(extra, delta):
    before, after = attached_frames(extra, delta)
    bootstrap = infer_objects(before)
    temporal = compare_frames(before, after)
    result = infer_objects(after, temporal=temporal, previous_state=bootstrap["checkpoint"])
    assert result["objects"] == []


def test_single_final_g_is_never_an_object():
    before, _, _, _ = make_frame(0, [("g1", "red", rectangle(2, 3))])
    after, _, _, _ = make_frame(1, [("g7", "red", rectangle(4, 3))])
    bootstrap = infer_objects(before)
    result = infer_objects(after, temporal=compare_frames(before, after), previous_state=bootstrap["checkpoint"])
    assert result["objects"] == []


def test_prolog_reuses_valid_smooth_cutout_not_enclosure_alone():
    before, after = attached_frames("")
    temporal = compare_frames(before, after)
    evidence = measure_composition_input(after, temporal)
    evidence["encloses"] = [["r1", "r2"]]
    outer = next(region for region in evidence["regions"] if region["id"] == "r1")
    outer["holes"] = [[[2, 2], [20, 2], [20, 20], [2, 20]]]
    evidence["fillpoints"] = [["r2", 10, 10, 1]]
    result = deduce_compositions(evidence)
    assert len(result["components"]) == 1
    assert result["attachments"][0]["witness"]["kind"] == "smooth_cutout"
    outer["holes"] = []
    assert deduce_compositions(evidence)["components"] == []


def test_prolog_treats_background_shared_edges_as_non_attachment():
    before, after = attached_frames()
    evidence = measure_composition_input(after, compare_frames(before, after))
    evidence["borders"] = ["r1"]
    next(region for region in evidence["regions"] if region["id"] == "r1")["area"] = 1000
    assert deduce_compositions(evidence)["components"] == []


def test_object_ids_remain_stable_and_exited_members_are_not_deleted():
    first, second = attached_frames()
    temporal = compare_frames(first, second)
    initial = infer_objects(first)
    objects = infer_objects(second, temporal=temporal, previous_state=initial["checkpoint"])
    third, _, _, _ = make_frame(2, [])
    missing = compare_frames(second, third, previous_state=temporal["checkpoint"])
    retained = infer_objects(third, temporal=missing, previous_state=objects["checkpoint"])
    assert retained["objects"][0]["uid"] == objects["objects"][0]["uid"]
    assert retained["objects"][0]["alias"] == "o1"
    assert len(retained["objects"][0]["members"]) == 2
    assert all(member["visibility"] == "missing" for member in retained["objects"][0]["members"])
    assert retained["objects"][0]["status"] == "retained_identity"
    assert "end" not in retained["objects"][0]


def test_object_aggregation_uses_only_confirmed_g_evidence_and_distinguishes_self():
    objects = [{"uid": "oa", "memberTrackUids": ["ga", "gb"]}, {"uid": "ob", "memberTrackUids": ["gc", "gd"]}]
    base = {"occluderTrackUid": "ga", "occludedTrackUid": "gc", "pairUid": "pair",
            "confirmed": True, "depthEvidence": [{"compatible": True, "sourceRef": "depth"}],
            "projectionHash": "mask", "motionEvidence": "motion", "overlapPixels": 8}
    result = aggregate_object_occlusions(objects, [base])
    assert result[0]["occluderUid"] == "oa" and result[0]["occludedUid"] == "ob"
    assert result[0]["relation"] == "object_occluded_by"
    assert aggregate_object_occlusions(objects, [{**base, "confirmed": False}]) == []
    assert aggregate_object_occlusions(objects, [{**base, "occludedTrackUid": "gb"}])[0]["relation"] == "self_occlusion"


def test_object_checkpoint_rejects_temporal_forks_and_swi_failure_is_visible():
    before, after = attached_frames()
    temporal = compare_frames(before, after)
    with pytest.raises(ValueError, match="bootstrap"):
        infer_objects(after, temporal=temporal)
    with pytest.raises(RuntimeError, match="execution failed"):
        deduce_compositions(measure_composition_input(after, temporal), swipl_executable="no-such-swi-executable")


def test_immutable_checkpoints_round_trip_and_reject_tamper(tmp_path: Path):
    frame, _, _, _ = make_frame(0, [("g1", "red", rectangle(2, 3))])
    state = initial_temporal_state(frame)
    path = persist_checkpoint(tmp_path / "runtime", state)
    assert path == persist_checkpoint(tmp_path / "runtime", state)
    assert load_checkpoint(path) == state
    assert not list(path.parent.glob("*.pending"))
    with pytest.raises(ValueError):
        persist_checkpoint(tmp_path / "legacy", state)
    broken = deepcopy(state)
    broken["tracks"] = []
    with pytest.raises(ValueError, match="hash mismatch"):
        persist_checkpoint(tmp_path / "runtime", broken)


def test_grouping_immutable_anchors_versioned_observations_and_replay():
    first, _, _, _ = make_frame(0, [("g1", "red", rectangle(2, 3))])
    second, _, _, _ = make_frame(1, [("g8", "red", rectangle(5, 3))])
    a = observe_grouping(first)
    anchor = deepcopy(a["checkpoint"]["anchors"])
    b = observe_grouping(second, previous_state=a["checkpoint"])
    assert b["checkpoint"]["anchors"] == anchor
    assert len(b["checkpoint"]["prototypes"]) == 1
    revisions = b["checkpoint"]["prototypes"][0]["revisions"]
    assert len(revisions) == 2 and revisions[1]["previousRevisionUid"] == revisions[0]["uid"]
    assert revisions[0]["observationUid"] == first.groups[0].uid
    assert b == observe_grouping(second, previous_state=a["checkpoint"])
    assert not b["candidates"][0]["promotionAllowed"]


def test_background_role_is_revisable_with_signed_provenance():
    previous = None
    for order, role in enumerate(("background", "foreground", "foreground")):
        frame, _, _, _ = make_frame(order, [("g1", "red", rectangle(2, 3))])
        result = observe_grouping(frame, previous_state=previous, evidence_by_group={
            frame.groups[0].uid: GroupingEvidence(f"independent:{order}", "human_review", True, background_role=role),
        })
        previous = result["checkpoint"]
        expected = ("background", "unknown", "foreground")[order]
        assert previous["prototypes"][0]["backgroundRole"]["role"] == expected
    role = previous["prototypes"][0]["backgroundRole"]
    assert len(role["support"]) == 1 and len(role["counterexamples"]) == 2
    assert role["revisable"]


def test_no_self_confirming_rule_promotion_and_counterexamples_survive():
    first, _, _, _ = make_frame(0, [("g1", "red", rectangle(2, 3))])
    a = observe_grouping(first, evidence_by_group={first.groups[0].uid: GroupingEvidence("review0", "human_review", True)})
    prototype = a["checkpoint"]["prototypes"][0]
    candidate_uid = a["candidates"][0]["candidateUid"]
    second, _, _, _ = make_frame(1, [("g8", "red", rectangle(5, 3))])
    b = observe_grouping(second, previous_state=a["checkpoint"], evidence_by_group={
        second.groups[0].uid: GroupingEvidence(
            "self-derived", "authored_detector", True,
            used_candidate_ids=(candidate_uid,), used_prototype_ids=(prototype["uid"],)),
    })
    assert b["candidates"][0]["evaluation"]["supportCount"] == 1
    assert len(b["candidates"][0]["excludedEvidenceIds"]) == 1
    third, _, _, _ = make_frame(2, [("g9", "red", rectangle(6, 3))])
    c = observe_grouping(third, previous_state=b["checkpoint"], evidence_by_group={
        third.groups[0].uid: GroupingEvidence("failed-independent-review", "human_review", True, outcome="counterexample"),
    })
    assert c["candidates"][0]["evaluation"]["counterexampleCount"] == 1
    assert not c["candidates"][0]["promotionAllowed"]


def test_candidate_heldout_requires_independent_other_sequence_and_cannot_promote():
    frame, _, _, _ = make_frame(0, [("g1", "red", rectangle(2, 3))])
    result = observe_grouping(frame, evidence_by_group={frame.groups[0].uid: GroupingEvidence("review0", "human_review", True)})
    uid = result["candidates"][0]["candidateUid"]
    rows = [
        {"candidateUid": uid, "providerId": "opencv", "sequenceId": sequence,
         "sourceRef": sequence, "agrees": True, "independent": True}
        for sequence in ("recording-a", "recording-b")
    ]
    evaluated = grouping_candidate_evaluations(result["checkpoint"], held_out=rows)
    assert evaluated[0]["evaluation"]["heldOutCount"] == 1
    assert evaluated[0]["evaluation"]["heldOutAgreement"] == 1
    assert not evaluated[0]["promotionAllowed"]
    proposal = evaluated[0]["storeProposal"]
    assert proposal["kind"] == "grouping"
    assert proposal["source"] == "measured_grouping_induction"
    assert proposal["rule"]["head"]["args"][0] == {"var": "Group"}
    assert proposal["rule"]["body"][0]["args"][2] == {"var": "Score"}
    assert proposal["entity_ids"] == [proposal["rule"]["head"]["args"][1]]
    assert "event_ids" not in proposal


def test_observed_grouping_proposal_persists_in_shared_candidate_store(tmp_path: Path):
    from omega_vision.perception.candidate_rules import CandidateRuleStore, PromotionGates

    frame, _, _, _ = make_frame(0, [("g1", "red", rectangle(2, 3))])
    observed = observe_grouping(frame, evidence_by_group={
        frame.groups[0].uid: GroupingEvidence("independent-review", "human_review", True),
    })
    proposal = observed["candidates"][0]["storeProposal"]
    store = CandidateRuleStore(tmp_path)
    created = store.create(**proposal)
    assert created["kind"] == "grouping"
    assert created["rule"]["head"]["predicate"] == "grouping_template_candidate"
    assert created["status"] == "proposed"
    assert store.create(**proposal)["candidate_id"] == created["candidate_id"]
    restored = CandidateRuleStore(tmp_path).get(created["candidate_id"])
    assert restored["proposals"][0]["source"] == "measured_grouping_induction"
    assert restored["proposals"][0]["provenance"]["checkpointUid"] == observed["checkpoint"]["checkpointUid"]
    assert restored["evidence"] == []
    assert not store.evaluate(created["candidate_id"], gates=PromotionGates())["eligible"]


def test_provider_and_sequence_scope_keep_prototype_source_ids_distinct():
    a, _, _, _ = make_frame(0, [("g1", "red", rectangle(2, 3))])
    b, _, _, _ = make_frame(0, [("g1", "red", rectangle(2, 3))], provider="other")
    c, _, _, _ = make_frame(0, [("g1", "red", rectangle(2, 3))], sequence="other")
    ids = {observe_grouping(frame)["checkpoint"]["prototypes"][0]["uid"] for frame in (a, b, c)}
    assert len(ids) == 3
    with pytest.raises(ValueError):
        observe_grouping(b, previous_state=observe_grouping(a)["checkpoint"])


def test_prototype_matching_pixel_first_and_ambiguous_equal_anchors():
    frame, _, _, _ = make_frame(0, [("g1", "red", rectangle(2, 3))])
    state = observe_grouping(frame)["checkpoint"]
    prototype = state["prototypes"][0]
    competitor = {**deepcopy(prototype), "uid": "other-prototype"}
    matched = match_prototypes(frame.groups[0], [prototype, competitor])
    assert matched["status"] == "ambiguous"
    competitor["revisions"][0]["colors"] = ["blue"]
    assert match_prototypes(frame.groups[0], [prototype, competitor])["selected"]["prototypeUid"] == prototype["uid"]
    assert shape_comparison([(0, 0), (0, 1), (1, 1)], [(0, 0), (1, 0), (0, 1)])["iou"] == 1
