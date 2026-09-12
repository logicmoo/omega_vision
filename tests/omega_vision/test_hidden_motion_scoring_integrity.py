from copy import deepcopy
import json

import pytest

from omega_vision.evaluation import visual_memory_recordings as visual
from omega_vision.evaluation import action_mechanism_recordings as mechanisms
from omega_vision.perception.observation_identity import content_hash
from omega_vision.services import recording_test_observers as observers
from omega_vision.services import recording_test_scoring as scoring


def freeze_clip(clip, files, reference):
    prefix = ("recordings", "events_tests", clip.name)
    prior, frames = {}, []
    for index, current in enumerate(clip.frames):
        raw_state = files[(*prefix, str(index), "state.json")]
        state = json.loads(raw_state)
        source = {
            "visualSequenceId": reference["visualSequenceId"], "frameId": str(index), "order": index,
            "imageHash": content_hash(current.png), "stateHash": content_hash(raw_state),
            "observationMetadataHash": None,
            "receipt": {"atSeconds": state["at_seconds"], "action": state["incoming_action"],
                        "data": state.get("action_data", {})},
        }
        frame = observers.ObservationInput(
            current.png, clip.frames[index - 1].png if index else None,
            source["receipt"]["action"], source["receipt"]["data"],
            state["at_seconds"], source, True,
        )
        result = observers.observe("hidden_motion_portal" if clip.family == "teleporter" else "hidden_motion", frame, prior)
        prior = result["state"]
        frames.append({"frameId": str(index), "source": source, "inferenceFrozen": True,
                       "observer": {key: value for key, value in result.items() if key != "state"}})
    return {
        "oracle": json.loads(files[(*prefix, "evaluation.json")]), "frames": frames,
        "images": [frame.png for frame in clip.frames], "files": files, "prefix": prefix,
    }


@pytest.fixture(scope="module")
def frozen_pole():
    clip = next(clip for clip in visual.visual_memory_clips()
                if clip.family == "occlusion_pole" and clip.suffix == "train_a")
    return freeze_clip(clip, *visual._clip_files(clip))


@pytest.fixture(scope="module")
def frozen_portal():
    clip = next(clip for clip in mechanisms.action_mechanism_clips()
                if clip.family == "teleporter" and clip.suffix == "train_delayed")
    return freeze_clip(clip, *mechanisms._files_for_clip(clip))


def grade(case):
    return scoring.summary(scoring._hidden_motion_checks(
        case["oracle"], case["frames"], source_images=case["images"],
    )[0])


def test_ordinary_frozen_pole_is_a_conditional_model_pass(frozen_pole):
    assert grade(frozen_pole)["outcome"] == "passed"


def test_fabricated_eighty_pixel_full_visibility_in_four_hidden_frames_fails(frozen_pole):
    case = deepcopy(frozen_pole)
    hidden = case["oracle"]["teacher"]["expectedFullyHiddenFrameIds"]
    for frame_id in hidden:
        for row in case["frames"][int(frame_id)]["observer"]["observed"]:
            if row["kind"] == "hidden_motion_visibility":
                row.update(visibility="full_candidate", observedCandidatePixelCount=80,
                           observedCandidatePixelRuns=[[0, 0, 80]], observedHiddenPixelCount=0)
    assert grade(case)["outcome"] == "failed"


def test_all_projected_centers_cannot_be_arbitrary(frozen_pole):
    case = deepcopy(frozen_pole)

    def corrupt(value):
        if isinstance(value, dict):
            if "projectedCenter" in value:
                value["projectedCenter"] = [999, 999]
            for item in value.values():
                corrupt(item)
        elif isinstance(value, list):
            for item in value:
                corrupt(item)
    corrupt(case["frames"])
    assert grade(case)["outcome"] == "failed"


def test_stale_evaluator_hashes_and_shifted_times_are_not_a_pass(frozen_pole):
    case = deepcopy(frozen_pole)
    for expected in case["oracle"]["frames"]:
        expected["sha256"] = "f" * 64
        expected["atSeconds"] += 100
    with pytest.raises(ValueError, match="evaluator|Evaluator"):
        grade(case)


@pytest.mark.parametrize("field,value", [
    ("frameId", "99"), ("frameId", None), ("order", 99), ("frameOrder", True),
    ("sha256", "f" * 64), ("sha256", None),
    ("atSeconds", 100), ("atSeconds", None), ("atSeconds", float("inf")), ("atSeconds", True),
])
def test_wrong_or_missing_evaluator_frame_bindings_reject_before_grading(frozen_pole, monkeypatch, field, value):
    case = deepcopy(frozen_pole)
    if value is None:
        case["oracle"]["frames"][0].pop(field)
    else:
        case["oracle"]["frames"][0][field] = value
    monkeypatch.setattr(scoring, "_source_raster", lambda *args: pytest.fail("Bind evaluator before inspecting measurements"))
    with pytest.raises(scoring.HiddenMotionScoringIntegrityError):
        grade(case)


@pytest.mark.parametrize("mutation", ["swap", "missing_frame", "wrong_sequence"])
def test_evaluator_order_count_and_optional_recording_identity_are_checked(frozen_pole, mutation):
    case = deepcopy(frozen_pole)
    if mutation == "swap":
        case["oracle"]["frames"][0], case["oracle"]["frames"][1] = case["oracle"]["frames"][1], case["oracle"]["frames"][0]
    elif mutation == "missing_frame":
        case["oracle"]["frames"].pop()
    else:
        case["oracle"]["visualSequenceId"] = "recordings/events_tests/another_recording"
    with pytest.raises(scoring.HiddenMotionScoringIntegrityError):
        grade(case)


def projection(case):
    return next(row for frame in case["frames"] for row in frame["observer"]["predictions"]
                if row["kind"] == "conditional_constant_speed_projection")


@pytest.mark.parametrize("mutation", ["direction", "magnitude", "clock_claim", "assumptions", "evidence_geometry"])
def test_finite_but_false_projection_claims_fail(frozen_pole, mutation):
    case = deepcopy(frozen_pole)
    value = projection(case)
    if mutation == "direction":
        value["projectedCenter"][0] *= -1
    elif mutation == "magnitude":
        value["projectedCenter"][0] += 80
    elif mutation == "clock_claim":
        value["physicalClockAttested"] = True
    elif mutation == "assumptions":
        value["assumptions"].remove("common_recorded_acquisition_clock")
    else:
        for evidence in value["evidence"]:
            evidence["component"]["centroid"][0] += 20
        value["projectedCenter"][0] += 20
    assert grade(case)["outcome"] == "failed"


@pytest.mark.parametrize("field,value", [
    ("projectedCenter", [float("inf"), 0]), ("projectedCenter", [float("nan"), 0]),
    ("projectedCenter", [True, 0]), ("projectedCenter", [0]),
    ("decisionSeconds", float("inf")), ("predictionObservationSeconds", float("nan")),
    ("predictionObservationOrder", 15),
])
def test_malformed_nonfinite_or_future_projections_raise_integrity_errors(frozen_pole, field, value):
    case = deepcopy(frozen_pole)
    projection(case)[field] = value
    with pytest.raises(scoring.HiddenMotionScoringIntegrityError):
        grade(case)


def test_wrong_coordinates_do_not_hide_other_malformed_projection_values(frozen_pole):
    case = deepcopy(frozen_pole)
    projection(case).update(projectedCenter=[999, 999], decisionSeconds=float("inf"))
    with pytest.raises(scoring.HiddenMotionScoringIntegrityError, match="finite"):
        grade(case)


def test_oversized_numeric_projection_is_an_integrity_error(frozen_pole):
    case = deepcopy(frozen_pole)
    projection(case)["projectedCenter"] = [10 ** 1000, 0]
    with pytest.raises(scoring.HiddenMotionScoringIntegrityError, match="finite"):
        grade(case)


def test_fabricated_geometry_in_gap_copies_is_not_accepted(frozen_pole):
    case = deepcopy(frozen_pole)
    decision = next(row for frame in case["frames"] for row in frame["observer"]["observed"]
                    if row["kind"] == "hidden_motion_comparison")
    hidden = next(row for row in decision["gapSamples"] if row["visibility"] == "not_visible")
    hidden.update(visibility="full_candidate", observedCandidatePixelRuns=[[0, 0, 80]],
                  observedCandidatePixelCount=80, observedHiddenPixelCount=0)
    assert grade(case)["outcome"] == "failed"


@pytest.mark.parametrize("field,value", [
    ("projectedCenter", [999, 999]), ("velocity", [-400, 0]),
    ("expectedDisplacement", [999, 0]), ("observedCenter", [999, 0]),
    ("elapsedRecordedSeconds", 999),
])
def test_comparison_coordinate_and_time_claims_are_recomputed(frozen_pole, field, value):
    case = deepcopy(frozen_pole)
    decision = next(row for frame in case["frames"] for row in frame["observer"]["observed"]
                    if row["kind"] == "hidden_motion_comparison")
    decision[field] = value
    assert grade(case)["outcome"] == "failed"


def test_component_and_source_side_copies_cannot_certify_themselves(frozen_pole):
    case = deepcopy(frozen_pole)
    for frame in case["frames"]:
        frame["source"]["imageHash"] = "f" * 64
        for row in frame["observer"]["observed"]:
            if row["kind"] == "observed_uniform_components":
                row["source"]["imageHash"] = "f" * 64
    for expected in case["oracle"]["frames"]:
        expected["sha256"] = "f" * 64
    with pytest.raises(scoring.HiddenMotionScoringIntegrityError, match="hash"):
        grade(case)


def test_absent_actual_source_evidence_is_not_a_pass(frozen_pole):
    with pytest.raises(scoring.HiddenMotionScoringIntegrityError, match="source image"):
        scoring._hidden_motion_checks(frozen_pole["oracle"], frozen_pole["frames"])


def test_consistently_relabelled_undecodable_image_is_not_source_evidence(frozen_pole):
    case = deepcopy(frozen_pole)
    case["images"][0] = b"not a PNG"
    digest = content_hash(case["images"][0])
    case["oracle"]["frames"][0]["sha256"] = case["frames"][0]["source"]["imageHash"] = digest
    with pytest.raises(scoring.HiddenMotionScoringIntegrityError, match="decodable"):
        grade(case)


@pytest.fixture
def source_copy(tmp_path, frozen_pole):
    for relative, content in frozen_pole["files"].items():
        path = tmp_path.joinpath(*relative)
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_bytes(content)
    return tmp_path, tmp_path.joinpath(*frozen_pole["prefix"])


def test_public_grader_reads_actual_sources_after_freeze_without_any_observer(source_copy, frozen_pole, monkeypatch):
    from omega_vision.perception import hidden_motion_observer as hidden
    home, directory = source_copy
    monkeypatch.setattr(observers, "observe", lambda *a, **k: pytest.fail("Grading must not observe again"))
    monkeypatch.setattr(hidden, "_components", lambda *a, **k: pytest.fail("Grading must not rerun the detector"))
    score = scoring.score_recording(home, directory, "occlusion_pole", frozen_pole["frames"], {})
    assert score["outcome"] == "passed"
    assert score["physicalCause"] == score["identityAcrossGap"] == "not_established"
    case = deepcopy(frozen_pole)
    case["frames"][0]["inferenceFrozen"] = False
    monkeypatch.setattr(scoring, "_oracle", lambda *a: pytest.fail("Unfrozen inference must not read an evaluator"))
    with pytest.raises(scoring.HiddenMotionScoringIntegrityError, match="frozen"):
        scoring.score_recording(home, directory, "occlusion_pole", case["frames"], {})


@pytest.mark.parametrize("source", ["imageHash", "stateHash", "observationMetadataHash"])
def test_public_grader_rejects_actual_source_integrity_mismatch(source_copy, frozen_pole, monkeypatch, source):
    home, directory = source_copy
    case = deepcopy(frozen_pole)
    case["frames"][0]["source"][source] = "f" * 64
    monkeypatch.setattr(scoring, "_oracle", lambda *a: pytest.fail("Source integrity must precede evaluator grading"))
    with pytest.raises(scoring.HiddenMotionScoringIntegrityError, match="hash"):
        scoring.score_recording(home, directory, "occlusion_pole", case["frames"], {})


@pytest.mark.parametrize("field", ["atSeconds", "action", "data"])
def test_self_consistent_evaluator_and_receipts_still_require_actual_source_state(source_copy, frozen_pole, field):
    home, directory = source_copy
    case = deepcopy(frozen_pole)
    if field == "atSeconds":
        for frame, expected in zip(case["frames"], case["oracle"]["frames"]):
            frame["source"]["receipt"]["atSeconds"] += 100
            expected["atSeconds"] += 100
    else:
        case["frames"][0]["source"]["receipt"][field] = "RIGHT" if field == "action" else {"x": 999}
    with pytest.raises(scoring.HiddenMotionScoringIntegrityError, match="Actual source acquisition|Actual input"):
        scoring.score_recording(home, directory, "occlusion_pole", case["frames"], {})


def test_missing_actual_source_image_raises_the_same_integrity_error(source_copy, frozen_pole):
    home, directory = source_copy
    (directory / "0" / "image.png").unlink()
    with pytest.raises(scoring.HiddenMotionScoringIntegrityError, match="source"):
        scoring.score_recording(home, directory, "occlusion_pole", frozen_pole["frames"], {})


def test_association_prediction_endpoint_is_verified_from_pixels(frozen_portal):
    checks, predictions = scoring._association_prediction_checks(
        frozen_portal["oracle"], frozen_portal["frames"], frozen_portal["images"],
    )
    assert predictions
    assert scoring.summary(checks)["outcome"] == "passed"


@pytest.mark.parametrize("field", ["expectedCenter", "observedCenter"])
def test_association_correct_label_cannot_certify_fabricated_coordinates(frozen_portal, field):
    case = deepcopy(frozen_portal)
    for frame in case["frames"]:
        for prediction in frame["observer"]["predictions"]:
            if prediction.get("status") == "correct":
                prediction[field] = [999, 999]
    checks, _ = scoring._association_prediction_checks(case["oracle"], case["frames"], case["images"])
    assert scoring.summary(checks)["outcome"] == "failed"


@pytest.mark.parametrize("field,value", [
    ("expectedCenter", [float("inf"), 0]), ("observedCenter", [float("nan"), 0]),
    ("observedAtSeconds", 999), ("predictionObservationSeconds", float("inf")),
])
def test_association_endpoint_geometry_and_time_must_be_finite_and_bound(frozen_portal, field, value):
    case = deepcopy(frozen_portal)
    prediction = next(prediction for frame in case["frames"] for prediction in frame["observer"]["predictions"]
                      if prediction.get("status") == "correct")
    prediction[field] = value
    with pytest.raises(scoring.HiddenMotionScoringIntegrityError):
        scoring._association_prediction_checks(case["oracle"], case["frames"], case["images"])
