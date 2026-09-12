import json

import pytest
from PIL import Image

from omega_vision.evaluation import event_recordings as events
from omega_vision.perception.observation_identity import content_hash
from omega_vision.perception.temporal_correspondence import validate_temporal_result
from omega_vision.services import recording_test_execution as execution
from omega_vision.services import video_import_semantics as semantics

from test_recording_test_execution import advance, create, finish_steps, publish, service
from test_semantic_active_integration import integrated, sequence, plan, commit, finish


def attest(home):
    files = {
        ("recordings", "events_tests", "moved", str(index), "observation_metadata.json"): events._json({
            "clock_id": "recording-relative-seconds", "coordinate_frame_id": "producer-fixed-camera",
            "viewport_complete": True,
        }) for index in range(5)
    }
    events.publish_recording_files(home, files)


def test_real_temporal_consumer_binds_explicit_timing_and_never_turns_frame_ticks_into_inputs(service):
    home, client = service
    publish(home)
    attest(home)
    run = finish_steps(client, create(client))
    assert run["status"] == "completed"
    root, units = semantics._units("arc3_random_player", "data/recordings/events_tests/moved")
    before, after = semantics._frame(units[3]), semantics._frame(units[4])
    temporal = semantics._result(units[4], semantics.TEMPORAL)
    validate_temporal_result(temporal)
    assert temporal["interval"]["seconds"] == events.SAMPLE_SECONDS
    assert temporal["interval"]["coordinateFrameId"] == "producer-fixed-camera"
    assert after.observation_metadata["at_seconds"] == 4 * events.SAMPLE_SECONDS
    state = home / "recordings" / "events_tests" / "moved" / "4" / "state.json"
    assert content_hash(state.read_bytes()) in after.source_hashes.values()
    assert after.observation_metadata["source_hash"] in after.source_hashes.values()
    assert temporal["inputReceipts"] == [] and temporal["actionHint"] is None
    actions, channels = semantics._recorded_actions(units, [{"id": semantics._frame(unit).uid} for unit in units])
    assert actions == [] and channels == []
    assert before.observation_metadata["clock_id"] == after.observation_metadata["clock_id"]


def test_absent_attestation_leaves_physical_time_unknown_and_state_mutation_invalidates_temporal(service):
    home, _ = service
    publish(home)
    _, units = semantics._units("arc3_random_player", "data/recordings/events_tests/moved")
    unit = units[1]
    metadata, hashes = semantics._observation_metadata(unit)
    assert "at_seconds" not in metadata and "coordinate_frame_id" not in metadata
    assert set(metadata) == {"source_ref", "source_hash"}
    assert "recordingInput:state" in hashes
    prior = semantics.runtime_revision(unit, semantics.TEMPORAL)
    path = unit.get("sourceImage", unit["image"]).parent / "state.json"
    state = json.loads(path.read_text())
    state["at_seconds"] += 0.125
    path.write_text(json.dumps(state))
    assert semantics.runtime_revision(unit, semantics.TEMPORAL) != prior


@pytest.mark.parametrize("problem", ["teacher", "source_hash", "clock_without_time", "coordinate_conflict"])
def test_attestation_rejects_teacher_fields_forged_source_hashes_and_conflicts(service, problem):
    home, _ = service
    publish(home)
    _, units = semantics._units("arc3_random_player", "data/recordings/events_tests/moved")
    unit = units[0]
    state_path = unit.get("sourceImage", unit["image"]).parent / "state.json"
    state = json.loads(state_path.read_text())
    metadata = {}
    if problem == "teacher":
        metadata["teacher"] = {"actor": "known_from_oracle"}
    elif problem == "source_hash":
        metadata["source_hash"] = "claimed-by-caller"
    elif problem == "clock_without_time":
        state.pop("at_seconds")
        metadata["clock_id"] = "unanchored-clock"
    else:
        state["observation_metadata"] = {"coordinate_frame_id": "different-camera"}
        metadata["coordinate_frame_id"] = "fixed-camera"
    state_path.write_text(json.dumps(state))
    (state_path.parent / "observation_metadata.json").write_text(json.dumps(metadata))
    with pytest.raises(ValueError):
        semantics._observation_metadata(unit)


def test_attestation_changes_stale_a_bound_run_before_frame_execution(service):
    home, client = service
    publish(home)
    run = create(client)
    attest(home)
    result = advance(client, run)
    assert result["status"] == "stale" and result["progress"]["processedFrames"] == 0


def test_actual_arrow_stays_a_channel_without_independent_visual_actor_binding(service):
    home, client = service
    publish(home)
    directory = home / "recordings" / "events_tests" / "moved"
    state_path = directory / "1" / "state.json"
    state = json.loads(state_path.read_text())
    state["incoming_action"] = "RIGHT"
    state_path.write_text(json.dumps(state))
    manifest_path = directory / "recording.json"
    manifest = json.loads(manifest_path.read_text())
    manifest["moves"][1]["action"] = "RIGHT"
    manifest_path.write_text(json.dumps(manifest))
    run = advance(client, advance(client, create(client)))
    assert run["progress"]["processedFrames"] == 2
    assert any("actor binding" in item for item in run["limitations"])
    assert any("Physical speed unavailable" in item for item in run["limitations"])
    _, units = semantics._units("arc3_random_player", "data/recordings/events_tests/moved")
    temporal = semantics._result(units[1], semantics.TEMPORAL)
    validate_temporal_result(temporal)
    assert temporal["inputReceipts"] == []
    summary = json.loads(semantics._artifact(units[1], semantics.TEMPORAL, "summary.json").read_text())
    assert summary["inputReceiptStatus"]["status"] == "unbound_actual_input"
    frames = [semantics._frame(unit) for unit in units[:2]]
    actions, channels = semantics._recorded_actions(units[:2], [{"id": frame.uid} for frame in frames])
    assert len(actions) == len(channels) == 1
    assert actions[0]["normalized"][0]["args"][1] == "RIGHT"
    assert channels[0] not in {group.uid for group in frames[0].groups}


def test_parent_abduction_verifies_attested_native_inputs_and_stays_before_future_frames(service):
    from fastapi import FastAPI
    from fastapi.testclient import TestClient
    from omega_vision.services import two_frame_x_duction as family
    from omega_vision.services import video_import_api as api
    from omega_vision.services.recording_test_memory import native_execution
    from omega_vision.perception.contextual_memory import recording_context
    from omega_vision.perception.metta_memory import MeTTaMemoryDatabase
    from test_recording_test_execution import fingerprints
    home, client = service
    publish(home)
    attest(home)
    run = finish_steps(client, create(client))
    assert run["status"] == "completed"
    reference = "data/recordings/events_tests/moved"
    root, units = semantics._units("arc3_random_player", reference)
    _, _, catalog = api._sequence_execution_context(root, reference, "arc3_random_player")
    journal = semantics._event_log(root, reference)
    before = journal.read()
    with native_execution(home, reference):
        for step in ("event_abduction_0/deterministic", f"{family.FAMILY}/abduction"):
            spec = api._direct_specs(root)[step]
            outcome = api.run_transform_step(
                units[3], spec["transformation"], spec["doer"], {},
                depends_on=spec["dependsOn"],
                depends_on_resolved=api._stamp_resolved_deps(units[3], spec["dependsOn"], catalog),
            )
            assert outcome["status"] == "written", outcome
        result = semantics._result(units[3], f"{family.FAMILY}/abduction")
    assert result["pair"]["after"]["order"] == 3 and result["supportCutoffOrderExclusive"] == 3
    assert result["authority"] == "non_authoritative_hypotheses"
    context = recording_context(home, units[3]["sequenceRoot"], "3")
    entries = MeTTaMemoryDatabase(home, context.frame_area(), "hypothesis").read()
    assert len(entries) == 1 and entries[0]["causal"]["frameOrder"] == 3
    assert journal.read() == before
    assert not semantics._artifact(units[4], f"{family.FAMILY}/abduction").exists()
    saved = fingerprints(home)
    app = FastAPI()
    app.include_router(api.router)
    with TestClient(app) as reader:
        response = reader.get("/video-import/semantic/execution", params={
            "workspaceId": "arc3_random_player", "sequenceId": reference, "frameId": "3",
        })
    assert response.status_code == 200, response.text
    snapshot = response.json()
    assert snapshot["frameCount"] == 1 and snapshot["targetFrameId"] == "3"
    assert all(row["frameId"] == "3" for row in snapshot["outputs"])
    assert any(row["composite"] == f"{family.FAMILY}/abduction" for row in snapshot["outputs"])
    assert fingerprints(home) == saved, "Row inspection must not persist default preferences or refresh source artifacts"


@pytest.mark.parametrize("scaled", [False, True])
def test_real_dispatcher_measures_exact_components_from_effective_png_not_simplified_contours(integrated, scaled):
    from omega_vision.services import video_import_api as api
    root, client = integrated
    sequence_id = sequence(root, count=2)
    _, units = semantics._units("w", sequence_id)
    source_hashes = []
    for index, unit in enumerate(units):
        image = Image.new("RGB", (96, 64), "black")
        points = [(x, y) for x in range(20, 28) for y in range(20, 28)]
        if index:
            points += [(28, 23), (28, 24)]
        for point in points:
            image.putpixel(point, (32, 100, 240))
        image.save(unit["image"])
        source_hashes.append(content_hash(unit["image"].read_bytes()))
    if scaled:
        api.put_preprocessing_chain({
            "workspaceId": "w", "sequenceId": sequence_id,
            "steps": [{"stepId": "measured-scale", "entryId": "scale_3x_nearest", "params": {}}],
        })
    body, preview = plan(client, sequence_id, stage=semantics.LOG, first_n=2)
    finish(client, commit(client, body, preview, run=True))
    for index, unit in enumerate(units):
        prepared = semantics._prepare(unit)
        assert (prepared["image"] != unit["image"]) is scaled
        assert content_hash(unit["image"].read_bytes()) == source_hashes[index]
        frame = semantics._frame(unit)
        foreground = [group for group in frame.groups if group.colors == ("#2064f0",)]
        assert len(foreground) == 1
        assert foreground[0].mask_source == "exact_image_components"
        assert len(foreground[0].points) == 64 + 2 * index
        geometry = json.loads(semantics._artifact(unit, semantics.PARTS, "geometry.json").read_text())
        assert not any(polygon.get("smallFeature", {}).get("pixelRuns") for polygon in geometry["polygons"].values())
        bundle = json.loads(semantics._artifact(unit, semantics.IDENTITY, "observations.json").read_text())
        assert bundle["frame"]["imageHash"] == content_hash(prepared["image"].read_bytes())
    temporal = semantics._result(units[1], semantics.TEMPORAL)
    assert any(row["exact"] and row["areaDelta"] == 2 for row in temporal["geometry"])
    deductions = semantics._result(units[1], semantics.EVENTS)
    assert "area_changed" in {event["term"]["predicate"] for event in deductions["assessment"]["events"]}
    for stage in (semantics.TEMPORAL, semantics.OBJECTS, semantics.EVENTS):
        assert "frameAdapter" in semantics._implementation_revision(stage)
        metadata = json.loads(semantics._artifact(units[1], stage, "meta.json").read_text())
        assert metadata["options"]["semanticContextRevision"] == semantics.runtime_revision(units[1], stage)
