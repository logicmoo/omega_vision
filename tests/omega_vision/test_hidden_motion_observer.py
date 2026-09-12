from copy import deepcopy
from dataclasses import replace
import json

import pytest
from PIL import Image
from io import BytesIO

from omega_vision.evaluation import action_mechanism_recordings as mechanisms
from omega_vision.evaluation import visual_memory_recordings as visual
from omega_vision.perception import hidden_motion_observer as hidden
from omega_vision.perception.observation_identity import content_hash


def observe_clip(clip):
    prior, results = {}, []
    interval = clip.interval if isinstance(clip, visual.Clip) else mechanisms.INTERVAL
    for index, frame in enumerate(clip.frames):
        source = {
            "frameId": str(index), "order": index, "imageHash": content_hash(frame.png),
            "stateHash": content_hash({"at_seconds": index * interval, "action": frame.action}),
        }
        result = hidden.observe_hidden_motion(
            frame.png, at_seconds=index * interval, source=source, prior=prior,
            previous_image_hash=content_hash(clip.frames[index - 1].png) if index else None,
        )
        prior = result["state"]
        results.append(result)
    return results


@pytest.mark.parametrize("family", ["occlusion_pole", "occlusion_large_object"])
@pytest.mark.parametrize("suffix", ["train_a", "train_b", "validation_a", "control_absence"])
def test_actual_pixels_four_missing_samples_and_conditional_normal_return(family, suffix):
    clip = next(clip for clip in visual.visual_memory_clips() if clip.family == family and clip.suffix == suffix)
    results = observe_clip(clip)
    decisions = [row for result in results for row in result["observed"] if row["kind"] == "hidden_motion_comparison"]
    assert len(decisions) == 1
    result = decisions[0]
    assert result["assessment"] == "constant_speed_consistent"
    assert result["unobservedOrders"] == list(map(int, clip.teacher["expectedFullyHiddenFrameIds"]))
    assert len(result["unobservedOrders"]) == 4
    assert result["occlusionConsistent"] is (suffix != "control_absence")
    assert result["identityEstablished"] is result["hiddenPathObserved"] is result["causeEstablished"] is False
    for index in result["unobservedOrders"]:
        visibility = next(row for row in results[index]["observed"] if row["kind"] == "hidden_motion_visibility")
        assert visibility["observedCandidatePixelRuns"] == []
        assert visibility["observedHiddenPixelCount"] == 0
        assert all(not row["pixelsObserved"] for row in results[index]["predictions"])
    assert all(row["source"]["order"] <= result["predictionObservationOrder"] for row in result["velocityEvidence"])


def test_delayed_contrast_freezes_normal_then_remote_model_mismatch_at_decision():
    clip = next(clip for clip in mechanisms.action_mechanism_clips() if clip.family == "teleporter" and clip.suffix == "train_delayed")
    results = observe_clip(clip)
    normal = next(row for row in results[13]["observed"] if row["kind"] == "hidden_motion_comparison")
    assert normal["assessment"] == "constant_speed_consistent"
    assert normal["unobservedOrders"] == [7, 8, 9, 10]
    assert normal["occlusionConsistent"]
    assert not any(row["kind"] == "constant_speed_model_mismatch" for result in results[:23] for row in result["observed"])
    mismatch = next(row for row in results[23]["observed"] if row["kind"] == "constant_speed_model_mismatch")
    assert mismatch["predictionObservationOrder"] == 18
    assert mismatch["unobservedOrders"] == [19, 20, 21, 22]
    assert mismatch["expectedDisplacement"] == [10, 0]
    assert mismatch["observedDisplacement"] == [43, 0]
    assert {"teleportation", "unseen acceleration or fast motion"} <= {row["explanation"] for row in results[23]["hypotheses"]}
    assert all(not row["authoritative"] for row in results[23]["hypotheses"])


@pytest.mark.parametrize("corruption", ["order", "image", "seal", "version", "future"])
def test_rejects_wrong_predecessor_hash_version_and_future_cumulative_state(corruption):
    clip = next(clip for clip in visual.visual_memory_clips() if clip.family == "occlusion_pole" and clip.suffix == "train_a")
    prior = deepcopy(observe_clip(replace(clip, frames=clip.frames[:3]))[-1]["state"])
    source = {"frameId": "3", "order": 3, "imageHash": content_hash(clip.frames[3].png), "stateHash": content_hash("receipt")}
    previous = content_hash(clip.frames[2].png)
    if corruption == "order":
        source.update(frameId="4", order=4)
    elif corruption == "image":
        previous = content_hash("wrong predecessor")
    elif corruption == "seal":
        prior["atSeconds"] = 0
    else:
        if corruption == "version":
            prior["version"] = "old"
        else:
            prior["models"][0]["history"][0]["source"]["order"] = 10
        prior = hidden._seal({key: value for key, value in prior.items() if key != "stateUid"})
    with pytest.raises(ValueError, match="ordering|hash|changed|Future"):
        hidden.observe_hidden_motion(clip.frames[3].png, at_seconds=1.5, source=source,
                                     previous_image_hash=previous, prior=prior)


def test_same_looking_distractors_are_not_resolved_by_nearest_prediction():
    clip = next(clip for clip in visual.visual_memory_clips() if clip.family == "occlusion_pole" and clip.suffix == "train_a")
    frames = list(clip.frames)
    # Duplicate the actually observed first-frame component, not an authored mask.
    image = Image.open(BytesIO(frames[0].png)).convert("RGB")
    _, _, components = hidden._components(frames[0].png)
    moving = min(components, key=lambda component: component["pixelCount"])
    for index in (2, 3):
        current = Image.open(BytesIO(frames[index].png)).convert("RGB")
        for x, y in hidden._points(moving):
            current.putpixel((x + 50, y), image.getpixel((x, y)))
        frames[index] = replace(frames[index], png=visual.png_bytes(current))
    results = observe_clip(replace(clip, frames=tuple(frames)))
    decisions = [row for result in results for row in result["observed"] if row["kind"] == "hidden_motion_comparison"]
    assert all(row["assessment"] != "constant_speed_consistent" for row in decisions)
    assert any("indistinguishable" in text for result in results for text in result["limitations"])


@pytest.mark.parametrize("corruption", ["time", "hash", "pending"])
def test_portal_association_cannot_smuggle_future_or_unbound_evidence_into_native_state(corruption):
    from omega_vision.services import recording_test_observers as observers
    clip = next(clip for clip in mechanisms.action_mechanism_clips()
                if clip.family == "teleporter" and clip.suffix == "train_delayed")
    prior = {}
    for index in range(25):
        current = clip.frames[index]
        at = index * mechanisms.INTERVAL
        source = {
            "frameId": str(index), "order": index, "imageHash": content_hash(current.png),
            "stateHash": content_hash({"at_seconds": at, "action": current.action}),
            "receipt": {"atSeconds": at},
        }
        frame = observers.ObservationInput(
            current.png, clip.frames[index - 1].png if index else None,
            current.action, {}, at, source, True,
        )
        if index == 24:
            evidence = prior["portal"]["evidence"][0]
            if corruption == "pending":
                prior["pendingPortalPrediction"] = {
                    "predictionObservationSeconds": 999, "decisionSeconds": 1000,
                    "evidence": [deepcopy(evidence)],
                }
            else:
                evidence["after_seconds" if corruption == "time" else "after_hash"] = 1000 if corruption == "time" else "f" * 64
            with pytest.raises(hidden.HiddenMotionIntegrityError, match="association"):
                observers.observe("hidden_motion_portal", frame, prior)
        else:
            prior = observers.observe("hidden_motion_portal", frame, prior)["state"]


def test_recorded_sampling_intervals_not_frame_count_determine_projection_and_snapshots_do_not_alias():
    clip = next(clip for clip in visual.visual_memory_clips()
                if clip.family == "occlusion_pole" and clip.suffix == "train_a")
    prior, sources = {}, []
    for order, selected in enumerate((0, 1, 3, 5)):
        png = clip.frames[selected].png
        at = selected * clip.interval
        source = {"frameId": str(order), "order": order, "imageHash": content_hash(png),
                  "stateHash": content_hash({"at_seconds": at})}
        previous = deepcopy(prior)
        result = hidden.observe_hidden_motion(png, at_seconds=at, source=source, prior=prior,
                                              previous_image_hash=sources[-1] if sources else None)
        assert prior == previous
        if order == 3:
            prediction = result["predictions"][0]
            assert prediction["physicalClockAttested"] is False
            evidence = prediction["evidence"]
            assert [sample["atSeconds"] for sample in evidence] == [0, 0.5, 1.5]
            assert prediction["projectedCenter"][0] - evidence[-1]["component"]["centroid"][0] == 4
            result["state"]["models"][0]["anchor"]["source"]["imageHash"] = "changed"
            assert prior == previous
        prior = result["state"]
        sources.append(source["imageHash"])


@pytest.mark.parametrize("family", ["occlusion_pole", "occlusion_large_object", "teleporter"])
def test_all_existing_family_variants_pass_pixel_model_and_delayed_scorer_contract(family):
    from omega_vision.services import recording_test_observers as observers
    from omega_vision.services.recording_test_scoring import _association_prediction_checks, _hidden_motion_checks, summary
    clips = mechanisms.action_mechanism_clips() if family == "teleporter" else visual.visual_memory_clips()
    for clip in (clip for clip in clips if clip.family == family):
        prior, frozen = {}, []
        interval = clip.interval if isinstance(clip, visual.Clip) else mechanisms.INTERVAL
        for index, current in enumerate(clip.frames):
            at = index * interval
            source = {
                "visualSequenceId": "recordings/events_tests/" + clip.name,
                "frameId": str(index), "order": index, "imageHash": content_hash(current.png),
                "stateHash": content_hash({"at_seconds": at, "action": current.action}),
                "receipt": {"atSeconds": at},
            }
            frame = observers.ObservationInput(
                current.png, clip.frames[index - 1].png if index else None,
                current.action, {}, at, source, True,
            )
            result = observers.observe("hidden_motion_portal" if family == "teleporter" else "hidden_motion", frame, prior)
            prior = result["state"]
            frozen.append({
                "frameId": str(index), "source": source, "observer": result, "inferenceFrozen": True,
            })
        # Only now expose evaluator identity/visibility to the independent grader.
        oracle = json.loads(json.dumps({
            "visualSequenceId": "recordings/events_tests/" + clip.name, "teacher": clip.teacher,
            "frames": [{**frame.oracle, "frameId": str(index), "sha256": content_hash(frame.png),
                        "atSeconds": index * interval} for index, frame in enumerate(clip.frames)],
        }))
        checks, _ = _hidden_motion_checks(oracle, frozen, source_images=[frame.png for frame in clip.frames])
        association_checks, _ = _association_prediction_checks(oracle, frozen, [frame.png for frame in clip.frames])
        checks.extend(association_checks)
        assert summary(checks)["outcome"] == "passed", (clip.name, [row for row in checks if row["outcome"] != "passed"])
