from __future__ import annotations

from copy import deepcopy
from io import BytesIO
import json
from pathlib import Path
import shutil

from PIL import Image
import pytest

from omega_vision.perception.object_evidence import (
    infer_objects_with_evidence, seal_object_result, validate_object_result,
)
from omega_vision.perception.object_tracking import infer_objects
from omega_vision.perception.observation_identity import build_observation_bundle
from omega_vision.perception.temporal_correspondence import compare_frames, stable_id, temporal_frame_from_bundle


def observed_frame(order=0, shift=0):
    geometry = {"width": 20, "height": 20, "polygons": {
        "1": {"outer": [], "holes": [], "smallFeature": {"pixelRuns": [[y, 2 + shift, 3 + shift] for y in range(2, 10)]}},
        "2": {"outer": [], "holes": [], "smallFeature": {"pixelRuns": [[y, 4 + shift, 5 + shift] for y in range(2, 10)]}},
    }}
    image = Image.new("RGBA", (20, 20), (0, 0, 0, 0))
    for y in range(2, 10):
        for x in range(2 + shift, 6 + shift):
            image.putpixel((x, y), (255, 0, 0, 255) if x < 4 + shift else (0, 0, 255, 255))
    stream = BytesIO()
    image.save(stream, format="PNG")
    facts = (
        f"region(r1,red,16,centroid({2.5 + shift},5.5)).\n"
        f"region(r2,blue,16,centroid({4.5 + shift},5.5)).\n"
        "shared_edge(r1,r2,8).\nadjacent(r1,r2).\n"
    )
    bundle = build_observation_bundle(
        frame_alias=f"frame{order}", sequence_id="object-evidence-fixture", frame_order=order,
        image_bytes=stream.getvalue(), extraction_text=facts, geometry=geometry,
        grouping_text="", acceptance_text="fixture_authored_acceptance",
        accepted_groups=[{"id": "g1", "members": ["r1"], "acceptance": "fixture_authored_rule"},
                         {"id": "g2", "members": ["r2"], "acceptance": "fixture_authored_rule"}],
    )
    return temporal_frame_from_bundle(bundle, provider_id="fixture-provider", geometry=geometry, extraction_text=facts)


@pytest.fixture(scope="module")
def sample():
    swipl = shutil.which("swipl")
    if swipl is None:
        installed = Path(r"C:\Program Files\swipl\bin\swipl.exe")
        if not installed.is_file():
            pytest.skip("SWI-Prolog is not installed")
        swipl = str(installed)
    frame = observed_frame()
    raw = infer_objects(frame, swipl_executable=swipl)
    assert raw["objects"] == []
    assert raw["compositionEvidence"]["attachments"]
    return frame, raw, swipl


def test_bootstrap_attachments_are_sealed_without_inventing_an_object(sample):
    frame, raw, _ = sample
    original = deepcopy(raw)
    sealed = seal_object_result(raw)
    validate_object_result(
        sealed, expected_frame_uid=frame.uid,
        expected_temporal_checkpoint_uid=raw["checkpoint"]["temporalCheckpointUid"],
        expected_evidence_uid=sealed["evidenceUid"], group_uids=[group.uid for group in frame.groups],
    )
    assert sealed["objects"] == []
    assert sealed["checkpoint"] == raw["checkpoint"]
    assert raw == original and "evidenceUid" not in raw


def test_seal_is_deterministic_and_survives_json_round_trip(sample):
    _, raw, _ = sample
    first = seal_object_result(raw)
    reordered = json.loads(json.dumps(dict(reversed(list(raw.items())))))
    assert seal_object_result(reordered) == first
    assert seal_object_result(first) == first
    validate_object_result(json.loads(json.dumps(first)))


@pytest.mark.parametrize("change", [
    lambda result: result["compositionEvidence"]["attachments"].clear(),
    lambda result: result["compositionEvidence"]["attachments"][0]["witness"].update(sharedPixels=9),
    lambda result: result["compositionEvidence"]["components"].append(["invented-group-a", "invented-group-b"]),
    lambda result: result["ruleHashes"].update(forged="rule-hash"),
    lambda result: result["occlusions"].append({"invented": True}),
    lambda result: result.update(frameUid="another-frame"),
    lambda result: result["checkpoint"].update(frameOrder=7),
])
def test_any_edited_top_level_or_checkpoint_evidence_fails_validation(sample, change):
    _, raw, _ = sample
    changed = seal_object_result(raw)
    change(changed)
    with pytest.raises(ValueError, match="hash mismatch"):
        validate_object_result(changed)
    with pytest.raises(ValueError):
        seal_object_result(changed)


def test_unsealed_legacy_output_is_rejected_not_silently_upgraded(sample):
    _, raw, _ = sample
    with pytest.raises(ValueError, match="unsealed"):
        validate_object_result(raw)


def test_parent_identity_anchors_reject_cross_frame_or_unknown_group_use(sample):
    _, raw, _ = sample
    sealed = seal_object_result(raw)
    with pytest.raises(ValueError, match="another frame"):
        validate_object_result(sealed, expected_frame_uid="wrong-frame")
    with pytest.raises(ValueError, match="another temporal"):
        validate_object_result(sealed, expected_temporal_checkpoint_uid="wrong-checkpoint")
    with pytest.raises(ValueError, match="unknown final"):
        validate_object_result(sealed, group_uids=[])
    with pytest.raises(ValueError, match="trusted reference"):
        validate_object_result(sealed, expected_evidence_uid="wrong-evidence")


def test_recomputed_outer_hash_does_not_hide_checkpoint_inconsistency(sample):
    _, raw, _ = sample
    changed = seal_object_result(raw)
    changed["frameUid"] = "other-frame"
    changed["evidenceUid"] = stable_id("object-evidence", {key: value for key, value in changed.items() if key != "evidenceUid"})
    with pytest.raises(ValueError, match="disagrees"):
        validate_object_result(changed)


def test_forwarding_wrapper_preserves_frozen_core_result(sample):
    frame, raw, swipl = sample
    sealed = infer_objects_with_evidence(frame, swipl_executable=swipl)
    assert sealed == seal_object_result(raw)


def test_forwarding_wrapper_accepts_real_multi_group_composition_and_replay(sample):
    before, initial, swipl = sample
    after = observed_frame(order=1, shift=1)
    temporal = compare_frames(before, after)
    result = infer_objects_with_evidence(
        after, temporal=temporal, previous_state=initial["checkpoint"], swipl_executable=swipl,
    )
    validate_object_result(
        result, expected_frame_uid=after.uid, group_uids=[group.uid for group in after.groups],
        expected_temporal_checkpoint_uid=temporal["checkpoint"]["checkpointUid"],
    )
    assert len(result["objects"]) == 1
    assert result["objects"][0]["status"] == "supported"
    assert len(result["objects"][0]["memberTrackUids"]) == 2
    assert result == infer_objects_with_evidence(
        after, temporal=temporal, previous_state=initial["checkpoint"], swipl_executable=swipl,
    )
