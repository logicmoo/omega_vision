from __future__ import annotations

from dataclasses import replace
from io import BytesIO
import json
import re
import shutil

import pytest
from PIL import Image

from omega_vision.perception.event_deduction import DetectorConfig, deduce_pair_events, deduce_sequence, initial_event_state
from omega_vision.perception.event_records import validate_term
from omega_vision.perception.measured_event_features import affine_mask_comparison, mask_geometry
from omega_vision.perception.observation_identity import build_observation_bundle, content_hash
from omega_vision.perception.pixels_to_regions_cv import extract_region_facts_cv
from omega_vision.perception.temporal_correspondence import (
    GroupObservation, InputReceipt, TemporalFrame, compare_frames, initial_temporal_state, temporal_frame_from_bundle,
)

pytestmark = pytest.mark.skipif(shutil.which("swipl") is None, reason="SWI-Prolog unavailable")


def rectangle(x, y, width=4, height=4):
    return [(a, b) for b in range(y, y + height) for a in range(x, x + width)]


def frame(order, shapes, *, seconds=None, clock="sensor-clock", coordinates="fixed-camera"):
    groups = tuple(GroupObservation(
        uid="group-observation-" + content_hash([order, index, color, points]),
        alias=f"g{index}", member_uids=(f"region-observation-{order}-{index}",),
        member_aliases=(f"r{index}",), points=tuple(points), colors=(color,), symbols=(),
        mask_source="exact_pixel_runs",
    ) for index, (color, points) in enumerate(shapes, 1))
    source_hash = content_hash([order, seconds, clock, coordinates])
    metadata = None if seconds is None else {
        "at_seconds": seconds, "clock_id": clock, "coordinate_frame_id": coordinates,
        "source_ref": f"acquisition-{order}", "source_hash": source_hash,
    }
    return TemporalFrame(
        uid=f"frame-measured-{order}", bundle_uid=f"bundle-measured-{order}",
        provider_id="measured-sensor", sequence_id="measured-sequence", order=order,
        width=100, height=80, groups=groups,
        source_hashes={"image": content_hash(shapes), "acquisition": source_hash},
        region_evidence={}, observation_metadata=metadata,
    )


def sequence(frames, receipts=None):
    pairs, state = [], initial_temporal_state(frames[0])
    for index, (before, after) in enumerate(zip(frames, frames[1:])):
        pair = compare_frames(before, after, previous_state=state, input_receipts=(receipts or {}).get(index, []))
        state = pair["checkpoint"]
        pairs.append(pair)
    return deduce_sequence(frames, pairs), pairs


def names(result, index=-1):
    return {event["term"]["predicate"] for event in result["assessments"][index]["events"]}


def relation_events(result, relation):
    return [(index, event["term"]["predicate"]) for index, assessment in enumerate(result["assessments"])
            for event in assessment["events"] if event["term"]["predicate"] in {"start", "continue", "end"}
            and event["term"]["args"][0]["predicate"] == relation]


def receipt(before, after, actor=0, direction=(1, 0), receipt_id=None):
    return InputReceipt(
        receipt_id or f"receipt-{after.order}", before.uid, after.uid, before.groups[actor].uid,
        "RIGHT", direction, f"acquisition-{after.order}", after.source_hashes["acquisition"],
        "independent-prior-input-actor-binding",
    )


def test_three_frame_derivatives_use_seconds_and_not_first_frame_velocity():
    frames = [frame(i, [("blue", rectangle(x, 15))], seconds=t)
              for i, (x, t) in enumerate([(10, 0), (12, 1), (16, 2), (18, 3)])]
    result, _ = sequence(frames)
    assert not {"accelerated", "decelerated", "turned"} & names(result, 0)
    assert "accelerated" in names(result, 1)
    assert "decelerated" in names(result, 2)
    assert result["pair_results"][1]["measurements"]["derivatives"][0]["speedDelta"] == 2
    assert frames[0].uid in result["assessments"][1]["events"][0]["evidence"] or any(
        frames[0].uid in event["evidence"] for event in result["assessments"][1]["events"]
        if event["term"]["predicate"] == "accelerated"
    )


def test_unequal_sampling_does_not_invent_acceleration():
    frames = [frame(i, [("blue", rectangle(x, 15))], seconds=t)
              for i, (x, t) in enumerate([(10, 0), (12, 1), (16, 3)])]
    result, _ = sequence(frames)
    assert not {"accelerated", "decelerated"} & names(result)
    assert result["pair_results"][-1]["measurements"]["derivatives"][0]["speedDelta"] == 0


def test_heading_is_not_sprite_rotation_and_missing_time_is_not_seconds():
    frames = [frame(i, [("blue", rectangle(x, y))]) for i, (x, y) in enumerate([(10, 10), (12, 10), (12, 14)])]
    result, _ = sequence(frames)
    assert "turned" in names(result) and "rotated" not in names(result)
    assert "accelerated" not in names(result)
    assert result["pair_results"][-1]["measurements"]["unsupported"][0]["measurement"] == "physical_speed_delta"


@pytest.mark.parametrize("last_clock,last_coordinates", [("other-clock", "fixed-camera"), ("sensor-clock", "moving-camera")])
def test_changed_clock_or_coordinate_reference_withholds_speed(last_clock, last_coordinates):
    frames = [frame(0, [("blue", rectangle(10, 10))], seconds=0),
              frame(1, [("blue", rectangle(12, 10))], seconds=1),
              frame(2, [("blue", rectangle(16, 10))], seconds=2, clock=last_clock, coordinates=last_coordinates)]
    result, _ = sequence(frames)
    assert "accelerated" not in names(result)


def spatial_frame(order, position, reference, *, timed=True, clock="sensor-clock"):
    observed = frame(order, [("blue", rectangle(*position))], seconds=order if timed else None,
                     coordinates=reference or "fixed-camera", clock=clock)
    metadata = dict(observed.observation_metadata or {
        "source_ref": f"acquisition-{order}", "source_hash": observed.source_hashes["acquisition"],
    })
    metadata.pop("coordinate_frame_id", None)
    if reference is not None:
        metadata["coordinate_frame_id"] = reference
    return replace(observed, observation_metadata=metadata)


@pytest.mark.parametrize("references", [("A", "A", "B"), ("A", "B", "B"), ("A", None, "A")])
@pytest.mark.parametrize("timed", [True, False])
def test_heading_withholds_incompatible_three_frame_spatial_references(references, timed):
    frames = [spatial_frame(i, position, references[i], timed=timed)
              for i, position in enumerate([(10, 10), (14, 10), (14, 14)])]
    result, _ = sequence(frames)
    assert "turned" not in names(result)
    assert not any(term["predicate"] in {"heading_delta", "frame_displacement_delta"}
                   for term in result["pair_results"][-1]["facts"])
    assert result["pair_results"][-1]["measurements"]["derivatives"] == []
    assert result["assessments"][-1]["comparison_complete"] is False
    assert any(row["measurement"] == "motion_derivatives"
               for row in result["pair_results"][-1]["measurements"]["unsupported"])


@pytest.mark.parametrize("timed,clock", [(False, "sensor-clock"), (True, "changed-clock")])
def test_compatible_spatial_reference_preserves_heading_without_a_shared_clock(timed, clock):
    frames = [spatial_frame(i, position, "A", timed=timed, clock=clock if i == 2 else "sensor-clock")
              for i, position in enumerate([(10, 10), (14, 10), (14, 14)])]
    result, _ = sequence(frames)
    assert "turned" in names(result)
    assert any(term["predicate"] == "heading_delta" and term["args"][-1] == 90
               for term in result["pair_results"][-1]["facts"])
    assert not any(term["predicate"] == "speed_delta" for term in result["pair_results"][-1]["facts"])


def test_invalid_time_metadata_and_receipts_are_rejected():
    before = frame(0, [("blue", rectangle(10, 10))], seconds=1)
    after = frame(1, [("blue", rectangle(12, 10))], seconds=1)
    with pytest.raises(ValueError, match="increase"):
        compare_frames(before, after)
    with pytest.raises(ValueError, match="unsupported"):
        replace(before, observation_metadata={**before.observation_metadata, "blocked": True})
    with pytest.raises(ValueError, match="source hash"):
        replace(before, observation_metadata={**before.observation_metadata, "source_hash": "unbound"})
    after = frame(1, [("blue", rectangle(10, 10))], seconds=2)
    with pytest.raises(ValueError, match="source final G"):
        compare_frames(before, after, input_receipts=[replace(receipt(before, after), actor_uid="teacher-player")])
    with pytest.raises(ValueError, match="hash"):
        compare_frames(before, after, input_receipts=[replace(receipt(before, after), source_hash="unbound")])
    with pytest.raises(ValueError, match="typed InputReceipt"):
        compare_frames(before, after, input_receipts=[{"blocked": True}])


@pytest.mark.parametrize("target,event", [
    (rectangle(13, 13, 10, 10), "scaled"),
    (rectangle(12, 16, 12, 3), "deformed"),
    (rectangle(15, 15, 6, 6), "color_changed"),
])
def test_geometry_transforms_and_color_preserve_measured_correspondence(target, event):
    before = frame(0, [("blue", rectangle(15, 15, 6, 6))])
    after = frame(1, [("red" if event == "color_changed" else "blue", target)])
    result, pairs = sequence([before, after])
    assert len(pairs[0]["matches"]) == 1
    assert event in names(result)
    if event == "deformed":
        assert "scaled" not in names(result)
    if event in {"scaled", "deformed"}:
        assert "shape_changed" not in names(result)
    assert len(result["checkpoint"]["entity_ids"]) == 1


def test_quarter_turn_rectangle_is_not_certified_as_nonuniform_deformation():
    frames = [
        frame(0, [("blue", rectangle(20, 20, 6, 10))]),
        frame(1, [("blue", rectangle(18, 22, 10, 6))]),
    ]
    result, pairs = sequence(frames)
    assert pairs[0]["matches"][0]["maskIou"] == 1
    assert len(pairs[0]["matches"][0]["transforms"]) > 1
    assert result["pair_results"][0]["measurements"]["geometry"][0]["nonuniformScale"] is True
    assert result["pair_results"][0]["measurements"]["geometry"][0]["explanationAlternatives"] == [
        "rigid_transform", "axis_aligned_deformation",
    ]
    assert not {"deformed", "rotated"} & names(result)
    assert any("rigid" in reason for reason in result["assessments"][0]["uncertainty"])
    assert result["assessments"][0]["comparison_complete"] is False


def test_equal_area_non_affine_shape_change_and_two_pixel_area_change():
    old = rectangle(15, 15, 8, 8)
    added = old + [(23, 18), (23, 19)]
    result, _ = sequence([frame(0, [("blue", old)]), frame(1, [("blue", added)])])
    assert "area_changed" in names(result)
    assert result["pair_results"][0]["measurements"]["geometry"][0]["areaDelta"] == 2
    square = rectangle(15, 15, 6, 6)
    deformed = [p for p in square if p not in {(15, 15), (20, 20)}] + [(21, 16), (14, 19)]
    result, _ = sequence([frame(0, [("blue", square)]), frame(1, [("blue", deformed)])])
    assert "shape_changed" in names(result)


def test_hole_change_uses_actual_enclosed_pixels_and_excludes_occluder():
    full = rectangle(15, 15, 8, 8)
    hole = set(rectangle(18, 18, 2, 2))
    ring = [point for point in full if point not in hole]
    result, _ = sequence([frame(0, [("blue", full)]), frame(1, [("blue", ring)]), frame(2, [("blue", full)])])
    assert "hole_opened" in names(result, 0) and "hole_closed" in names(result, 1)
    assert mask_geometry(ring)["holeAreas"] == [4]
    exterior_notch = [p for p in full if p not in {(18, y) for y in range(15, 20)}]
    assert mask_geometry(exterior_notch)["holeCount"] == 0
    occluded, _ = sequence([frame(0, [("blue", full)]), frame(1, [("blue", ring), ("red", list(hole))])])
    assert "hole_opened" not in names(occluded)


def test_inexact_or_clipped_geometry_cannot_prove_shape_area_or_holes():
    first = frame(0, [("blue", rectangle(0, 15, 8, 8))])
    second = frame(1, [("blue", rectangle(0, 15, 9, 8))])
    result, _ = sequence([first, second])
    assert not {"scaled", "area_changed", "shape_changed"} & names(result)
    first = frame(0, [("blue", rectangle(15, 15, 8, 8))])
    second = frame(1, [("blue", rectangle(15, 15, 9, 8))])
    first = replace(first, groups=(replace(first.groups[0], mask_source="rasterized_contour"),))
    result, _ = sequence([first, second])
    assert not {"scaled", "area_changed", "shape_changed"} & names(result)


def test_inside_inverse_lifecycle_keeps_directional_roles():
    outer = set(rectangle(20, 20, 16, 16)) - set(rectangle(21, 21, 14, 14))
    frames = [frame(i, [("blue", sorted(outer)), ("red", rectangle(x, 25, 3, 3))])
              for i, x in enumerate([15, 25, 26, 38])]
    result, _ = sequence(frames)
    assert relation_events(result, "inside") == relation_events(result, "contain")
    assert relation_events(result, "inside") == [(0, "start"), (1, "continue"), (2, "end")]
    for assessment in result["assessments"]:
        relations = [event["term"]["args"][0] for event in assessment["events"] if event["term"]["predicate"] in {"start", "continue", "end"}]
        inside = next(row for row in relations if row["predicate"] == "inside")
        contain = next(row for row in relations if row["predicate"] == "contain")
        assert inside["args"] == list(reversed(contain["args"]))


@pytest.mark.parametrize("two_moving", [False, True])
def test_contact_response_is_decided_now_not_backdated(two_moving):
    left = [10, 14, 10]
    right = [22, 18, 22] if two_moving else [18, 18, 18]
    frames = [frame(i, [("red", rectangle(a, 20)), ("blue", rectangle(b, 20))], seconds=i)
              for i, (a, b) in enumerate(zip(left, right))]
    result, _ = sequence(frames)
    expected = "collision" if two_moving else "bounce"
    assert expected not in names(result, 0) and expected in names(result, 1)
    event = next(e for e in result["assessments"][1]["events"] if e["term"]["predicate"] == expected)
    assert frames[1].uid in event["evidence"] and frames[2].uid in event["evidence"]
    assert result["assessments"][1]["to_frame"] == frames[2].uid
    stopped = [frames[0], frames[1], frame(2, [("red", rectangle(14, 20)), ("blue", rectangle(18, 20))], seconds=2)]
    result, _ = sequence(stopped)
    assert not {"bounce", "collision"} & names(result)


def test_failed_input_requires_three_observed_attempts_and_pause_is_not_blocked():
    frames = [frame(i, [("red", rectangle(10 if i == 0 else 14, 20)), ("blue", rectangle(18, 15, 4, 20))], seconds=i)
              for i in range(6)]
    receipts = {i: [receipt(frames[i], frames[i + 1])] for i in range(5)}
    result, pairs = sequence(frames, receipts)
    assert relation_events(result, "blocked") == [(3, "start"), (4, "continue")]
    no_continuations = deduce_sequence(frames, pairs, config=DetectorConfig(continuations=False))
    assert relation_events(no_continuations, "blocked") == [(3, "start")]
    assert any(t["predicate"] == "failed_attempts" and t["args"][-1] == 3 for t in result["pair_results"][3]["facts"])
    pause, _ = sequence(frames)
    assert relation_events(pause, "blocked") == []
    interrupted, _ = sequence(frames, {i: receipts[i] for i in [0, 1, 3, 4]})
    assert relation_events(interrupted, "blocked") == []
    wrong_direction, _ = sequence(frames, {i: [receipt(frames[i], frames[i + 1], direction=(-1, 0))] for i in range(5)})
    assert relation_events(wrong_direction, "blocked") == []
    multiple = {0: [receipt(frames[0], frames[1], receipt_id=f"multi-{i}") for i in range(4)]}
    assert relation_events(sequence(frames[:2], multiple)[0], "blocked") == []
    mixed = {i: [receipt(frames[i], frames[i + 1], receipt_id=f"right-{i}"),
                 receipt(frames[i], frames[i + 1], direction=(-1, 0), receipt_id=f"left-{i}")] for i in range(5)}
    assert relation_events(sequence(frames, mixed)[0], "blocked") == []
    without_preparation = [replace(item, order=i, uid=f"frame-no-approach-{i}", bundle_uid=f"bundle-no-approach-{i}")
                           for i, item in enumerate(frames[1:])]
    unprepared, _ = sequence(without_preparation, {
        i: [receipt(without_preparation[i], without_preparation[i + 1])] for i in range(4)
    })
    assert relation_events(unprepared, "blocked") == []
    assert any(reason.startswith("blocked_initial_boundary_unestablished") for reason in unprepared["assessments"][2]["uncertainty"])
    assert all(term["predicate"] != "blocked" for row in unprepared["pair_results"][:2] for term in row["known_absent"])


def test_blocked_end_requires_observed_clearance_and_successful_input():
    frames = [frame(i, [("red", rectangle(10 if i == 0 else 14, 20)), ("blue", rectangle(18, 15, 4, 20))], seconds=i)
              for i in range(5)]
    frames.append(frame(5, [("red", rectangle(19, 20))], seconds=5))
    result, _ = sequence(frames, {i: [receipt(frames[i], frames[i + 1])] for i in range(5)})
    assert relation_events(result, "blocked") == [(3, "start"), (4, "end")]


def test_downward_contact_loss_is_measurement_not_assumed_gravity_or_carry():
    floor = rectangle(10, 30, 8, 3)
    frames = [frame(0, [("red", rectangle(14, 26)), ("blue", floor)]),
              frame(1, [("red", rectangle(19, 26)), ("blue", floor)])]
    result, _ = sequence(frames)
    assert any(t["predicate"] == "image_down_contact_delta" and t["args"][-1] == -4 for t in result["pair_results"][0]["facts"])
    assert relation_events(result, "carry") == []


def test_four_hidden_frames_preserve_observation_and_remote_alternatives():
    frames = [frame(0, [("blue", rectangle(10, 10))]), frame(1, [("blue", rectangle(12, 10))])]
    frames += [frame(i, []) for i in range(2, 6)]
    frames += [frame(6, [("blue", rectangle(65, 10))])]
    result, pairs = sequence(frames)
    hidden_track = pairs[-2]["checkpoint"]["tracks"][0]
    assert hidden_track["lastObservedPoints"] == [list(p) for p in frames[1].groups[0].points]
    assert hidden_track["pointsStatus"] == "predicted"
    alternative = pairs[-1]["reappearanceAlternatives"][0]
    assert alternative["hiddenFrames"] == 4
    assert {"accelerated_continuation", "teleport"} <= set(alternative["alternatives"])
    assert alternative["observedIdentity"] is False
    assert not {"reappeared", "accelerated"} & names(result)


def test_causal_prefix_and_forged_future_state_cannot_change_earlier_decision():
    frames = [frame(i, [("blue", rectangle(x, 15))], seconds=i) for i, x in enumerate([10, 12, 16])]
    prefix, pairs = sequence(frames[:2])
    full, _ = sequence(frames)
    assert prefix["assessments"] == full["assessments"][:1]
    with pytest.raises(ValueError, match="stale predecessor"):
        deduce_pair_events(frames[0], frames[1], pairs[0], previous_state=full["checkpoint"])
    changed = {**initial_event_state(frames[0]), "motion": {"teacher": {"speed": 1}}}
    with pytest.raises(ValueError, match="hash"):
        deduce_pair_events(frames[0], frames[1], pairs[0], previous_state=changed)


def test_follow_requires_two_lagged_positions_and_prior_measured_nonfollow():
    leader = [(20, 20), (24, 20), (28, 20), (28, 24), (28, 28)]
    follower = [(8, 20), (16, 20), (24, 20), (28, 20), (35, 20)]
    def distinct_tail(x, y):
        return [point for point in rectangle(x, y) if point not in {(x, y), (x + 3, y), (x, y + 3), (x + 3, y + 3)}]
    frames = [frame(i, [("red", rectangle(*lead)), ("blue", distinct_tail(*tail))], seconds=i)
              for i, (lead, tail) in enumerate(zip(leader, follower))]
    result, _ = sequence(frames)
    phases = relation_events(result, "follow")
    assert phases == [(2, "start"), (3, "end")]
    proof = next(row for row in result["pair_results"][2]["measurements"]["laggedPaths"] if row["truth"] is True)
    assert proof["matchedPositions"] == 2 and proof["sampleLag"] == 1
    parallel = [frame(i, [("red", rectangle(20 + 4 * i, 20)), ("blue", rectangle(20 + 4 * i, 35))])
                for i in range(5)]
    result, _ = sequence(parallel)
    assert relation_events(result, "follow") == []


def test_indistinguishable_contact_reversal_keeps_identity_and_collision_unknown():
    frames = [frame(i, [("red", rectangle(a, 20)), ("red", rectangle(b, 20))])
              for i, (a, b) in enumerate([(10, 22), (14, 18), (10, 22)])]
    result, pairs = sequence(frames)
    assert pairs[-1]["ambiguities"]
    assert "collision" not in names(result)
    assert "ambiguous_correspondence" in result["assessments"][-1]["uncertainty"]


def test_new_measurement_terms_are_strict_and_normalized():
    validate_term({"predicate": "directional_contact", "args": ["track-a", "track-b", 1, 0, 3]}, entity_ids=["track-a", "track-b"])
    with pytest.raises(ValueError, match="finite number"):
        validate_term({"predicate": "speed_delta", "args": ["track-a", float("nan")]}, entity_ids=["track-a"])
    with pytest.raises(ValueError, match="allowlisted"):
        validate_term({"predicate": "hidden_plate_wiring", "args": []})
    assert affine_mask_comparison(rectangle(0, 0, 6, 6), rectangle(4, 4, 10, 10)) == {"iou": 1.0, "scale": [10 / 6, 10 / 6]}


def observed_png_frame(order, png, directory):
    image_path, geometry_path = directory / f"pixels-{order}.png", directory / f"geometry-{order}.json"
    image_path.write_bytes(png)
    extracted = extract_region_facts_cv(image_path, filter_mode="none", max_dim=0, geometry_out=geometry_path)
    geometry = json.loads(geometry_path.read_text(encoding="utf-8"))
    # A singleton-region final-G policy, using measured foreground regions.
    # No actor color, fixture identity or expected event enters this adapter.
    backgrounds = set(re.findall(r"opencv_background_candidate\((r\d+)\)", extracted["prolog"]))
    accepted = [{"id": f"g{index}", "members": [region], "acceptance": "measured_singleton_region"}
                for index, region in enumerate(re.findall(r"region\((r\d+),", extracted["prolog"]), 1)
                if region not in backgrounds]
    bundle = build_observation_bundle(
        frame_alias=f"frame{order}", sequence_id="pixel-sensor", frame_order=order,
        image_bytes=png, extraction_text=extracted["prolog"],
        grouping_text="", acceptance_text="measured_singleton_region", geometry=geometry,
        accepted_groups=accepted,
    )
    current = temporal_frame_from_bundle(
        bundle, provider_id="opencv", geometry=geometry, extraction_text=extracted["prolog"], image_bytes=png,
    )
    return current, bundle, geometry


def test_actual_png_cv_bundle_recovers_two_pixel_change_without_contour_oracle(tmp_path):
    frames = []
    for order in range(2):
        image = Image.new("RGB", (64, 64), "#101010")
        points = rectangle(20, 20, 8, 8) + ([(28, 23), (28, 24)] if order else [])
        for point in points:
            image.putpixel(point, (32, 100, 240))
        stream = BytesIO()
        image.save(stream, format="PNG")
        current, bundle, geometry = observed_png_frame(order, stream.getvalue(), tmp_path)
        assert all(group.mask_source == "exact_image_components" for group in current.groups)
        frames.append(current)
    result, _ = sequence(frames)
    assert "area_changed" in names(result)
    assert any(row["usable"] and row["areaDelta"] == 2 for row in result["pair_results"][0]["measurements"]["geometry"])
    with pytest.raises(ValueError, match="image hash"):
        temporal_frame_from_bundle(bundle, provider_id="opencv", geometry=geometry, image_bytes=b"different pixels")


@pytest.mark.parametrize("fixture,predicate", [
    ("move_warmup_v2", "move"), ("co_move_warmup_v2", "co_move"),
    ("collision_confirmed_v2", "collision"),
    ("follow_confirmed_v2", "follow"),
])
def test_causal_revisions_use_only_rendered_cv_observations(tmp_path, fixture, predicate):
    from omega_vision.evaluation.causal_event_recordings import causal_cases
    from omega_vision.evaluation.event_recordings import render_frame

    case = next(case for case in causal_cases() if case.name == fixture)
    # Rendering is fixture setup. The entire observer boundary is PNG bytes,
    # ordinal sampling and an unrelated sensor identifier, never oracle fields.
    frames = [observed_png_frame(order, render_frame(item), tmp_path)[0]
              for order, item in enumerate(case.frames)]
    result, pairs = sequence(frames)
    if predicate == "collision":
        assert predicate not in names(result, 0) and predicate in names(result, 1)
        assert result["assessments"][1]["to_frame"] == frames[2].uid
    elif predicate == "follow":
        # Two lagged matches do not establish a prior false relation. A corner
        # also cannot force an ambiguous association to match the fixture.
        assert not any(phase == "start" for _, phase in relation_events(result, predicate))
        assert any(pair["ambiguities"] for pair in pairs) or any(
            row["truth"] is True for item in result["pair_results"] for row in item["measurements"]["laggedPaths"]
        )
    else:
        assert relation_events(result, predicate) == [(1, "start"), (2, "continue"), (3, "end")]
