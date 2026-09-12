from dataclasses import FrozenInstanceError
import hashlib
from io import BytesIO
import json

from fastapi import FastAPI
from fastapi.testclient import TestClient
from PIL import Image
import pytest

from omega_vision.evaluation import action_mechanism_recordings as fixtures
from omega_vision.evaluation import event_recordings as publisher
from omega_vision.perception.contextual_memory import recording_context
from omega_vision.services import arc3_play, video_import_api as video
from workbench_api_server import arc3_play_api as workbench_play


@pytest.fixture(scope="module")
def clips():
    return fixtures.action_mechanism_clips()


@pytest.fixture(scope="module")
def publication():
    return fixtures.action_mechanism_files()


def _fingerprint(root):
    return {path.relative_to(root).as_posix(): (hashlib.sha256(path.read_bytes()).hexdigest(), path.stat().st_mtime_ns)
            for path in root.rglob("*") if path.is_file() and path.name != ".writer.lock"}


def _actor_pixels(frame, color):
    image = Image.open(BytesIO(frame.png)).convert("RGB")
    return {(x, y) for y in range(image.height) for x in range(image.width) if image.getpixel((x, y)) == color}


def _zero_groups(counts):
    groups = []
    for index, count in enumerate(counts):
        if count == 0:
            if groups and groups[-1][-1] == index - 1:
                groups[-1].append(index)
            else:
                groups.append([index])
    return groups


def test_two_independent_index_entries_have_real_docs_and_ordinary_inputs(publication, clips):
    files, counts = publication
    index = json.loads(files[("recordings", "events_tests", "action_mechanism_tests.json")])
    assert index["schemaVersion"] == 1 and index["count"] == 2
    assert {test["id"] for test in index["tests"]} == {"teleporter", "stairs_gravity"}
    assert counts["recordingCount"] == 12 and counts["frameCount"] == 442
    assert counts["families"] == {
        "teleporter": {"recordings": 6, "frames": 236},
        "stairs_gravity": {"recordings": 6, "frames": 206},
    }
    assert len(files) == 912
    for old_index in ("tests.json", "suite.json", "visual_memory_tests.json"):
        assert ("recordings", "events_tests", old_index) not in files
    names = {clip.name for clip in clips}
    assert all(parts[:2] == ("recordings", "events_tests") for parts in files)
    assert all(parts[2] in names | {"documentation", "action_mechanism_tests.json"} for parts in files)
    for test in index["tests"]:
        assert test["group"] == "Events" and test["executionStatus"] == "not_run"
        document = files[("recordings", "events_tests", "documentation", f"{test['id']}.md")].decode()
        assert test["documentationFile"] == f"documentation/{test['id']}.md"
        for term in ("memory", "earlier", "observed", "prediction", "control", "held-out", "not run", "oracle", "unknown"):
            assert term in document.lower()
        for recording in test["recordings"]:
            assert recording["visualSequenceId"] in document
            assert recording["partition"] and recording["frameCount"] > 0
        for clip in clips:
            if clip.family == test["id"]:
                assert f"- **{clip.suffix}**: {clip.description}" in document
        assert "No GET" in document


def test_state_is_only_real_receipts_and_acquisition_metadata_not_teacher_maps(publication, clips):
    files, _ = publication
    allowed = {
        "kind", "game_id", "game_directory", "level", "state", "step_count",
        "incoming_action", "action_data", "action_directory", "parent_node",
        "action_path", "at_seconds", "recorded_at", "image_hash",
    }
    for clip in clips:
        prefix = ("recordings", "events_tests", clip.name)
        manifest = json.loads(files[(*prefix, "recording.json")])
        evaluator = json.loads(files[(*prefix, "evaluation.json")])
        assert evaluator["recognizerStatus"] == "not_run"
        assert evaluator["groundTruthIsRecognizerInput"] is False
        assert "teacher" not in manifest
        assert (*prefix, "image.png") not in files
        for index, frame in enumerate(clip.frames):
            state = json.loads(files[(*prefix, str(index), "state.json")])
            assert set(state) == allowed
            assert state["incoming_action"] == frame.action
            assert state["action_data"] == {}
            assert state["at_seconds"] == index * fixtures.INTERVAL
            assert state["image_hash"] == hashlib.sha256(frame.png).hexdigest()[:16]
            assert clip.family not in json.dumps(state)
            assert manifest["moves"][index]["directory"] == f"data/recordings/events_tests/{clip.name}/{index}"
            assert manifest["moves"][index]["action"] == frame.action
            assert evaluator["frames"][index]["sha256"] == hashlib.sha256(frame.png).hexdigest()
        assert {frame.oracle["actorId"] for frame in clip.frames} == {"teacher_same_actor"}
    assert not any(part == "memory" or part.endswith(".metta") for parts in files for part in parts)


@pytest.mark.parametrize("suffix", ["train_a", "train_delayed", "validation_reverse", "test_layout",
                                  "control_near_miss", "control_decorative"])
def test_portal_has_real_contact_remote_jump_and_four_frame_occlusion_contrast(clips, suffix):
    clip = next(clip for clip in clips if clip.family == "teleporter" and clip.suffix == suffix)
    pixels = [_actor_pixels(frame, clip.teacher["actorColor"]) for frame in clip.frames]
    counts = [len(mask) for mask in pixels]
    assert counts[0] == counts[-1] == 24
    assert all(count <= 24 for count in counts)
    groups = _zero_groups(counts)
    if suffix == "control_near_miss":
        assert groups == []
    else:
        assert groups[0] == [7, 8, 9, 10]
        assert 0 < counts[6] < 24 and 0 < counts[11] < 24
        dx = (-2 if suffix == "validation_reverse" else 2)
        before_x = min(x for x, _ in pixels[4])
        after_x = min(x for x, _ in pixels[13])
        assert after_x - before_x == dx * (13 - 4)  # normal occlusion matches remembered motion
    departures = [index for index, frame in enumerate(clip.frames)
                  if str(frame.oracle["mechanismEvent"]).startswith("departure:")]
    if suffix.startswith("control"):
        assert not departures
        assert all(frame.oracle["transitCount"] == 0 for frame in clip.frames)
        assert len(groups) == (0 if suffix == "control_near_miss" else 1)
        return
    assert len(departures) == 3
    delay = clip.teacher["transitHiddenFrames"]
    assert len(groups) == (4 if delay else 1)
    for index in departures:
        source = clip.frames[index].oracle["mechanismEvent"].split(":")[1]
        gate_x, gate_y, _ = clip.teacher["gates"][source]
        assert counts[index - 1] == 24
        before = pixels[index - 1]
        # Actual actor pixels reach the visible line aperture before the departure.
        assert min(x for x, _ in before) <= gate_x + 2 and max(x for x, _ in before) >= gate_x - 3
        assert min(y for _, y in before) <= gate_y <= max(y for _, y in before) + 1
        arrival = index + delay
        if delay:
            assert [counts[step] for step in range(index, arrival)] == [0] * 4
            assert all(clip.frames[step].action is None for step in range(index + 1, arrival + 1))
        assert counts[arrival] == 24
        start_x = min(x for x, _ in before)
        end_x = min(x for x, _ in pixels[arrival])
        assert abs(end_x - start_x) > 2 * (delay + 1)
        # No intermediate sample depicts the actor walking through intervening pixels.
        assert not any(pixels[step] for step in range(index, arrival))


def test_portal_predictions_use_only_past_observed_associations_and_freeze_before_third_transit(clips, monkeypatch):
    selected = [clip for clip in clips if clip.family == "teleporter" and not clip.suffix.startswith("control")]
    original_open = Image.open

    def png_only(source, *args, **kwargs):
        assert isinstance(source, BytesIO), "Portal baseline attempted a filesystem or metadata read"
        return original_open(source, *args, **kwargs)

    monkeypatch.setattr(Image, "open", png_only)
    monkeypatch.setattr("builtins.open", lambda *args, **kwargs: pytest.fail("Portal baseline opened a file"))
    for clip in selected:
        memory = fixtures.PortalAssociationMemory()
        departures = [index for index, frame in enumerate(clip.frames)
                      if str(frame.oracle["mechanismEvent"]).startswith("departure:")]
        third = departures[2]
        frozen = None
        evidence_at_prediction = None
        scored = False
        for index, frame in enumerate(clip.frames):
            if index:
                prediction = memory.predict(clip.frames[index - 1].png, frame.action)
                if index == departures[0]:
                    assert prediction is None  # visible line gates do not reveal wiring
                if index == third:
                    assert prediction is not None
                    frozen = prediction
                    evidence_at_prediction = frozenset(memory.evidence)
                    assert all(item.after_seconds < index * fixtures.INTERVAL for item in frozen.evidence)
                    with pytest.raises(FrozenInstanceError):
                        frozen.expected_arrival_center = (0, 0)
            observed = memory.observe(frame.png, index * fixtures.INTERVAL, learn=index < third)
            if index == third + clip.teacher["transitHiddenFrames"]:
                assert frozen is not None and observed is not None
                assert memory.last_actor.center == frozen.expected_arrival_center
                assert frozen.evidence <= evidence_at_prediction
                assert frozenset(memory.evidence) == evidence_at_prediction
                assert observed.constant_velocity_projection != frozen.expected_arrival_center
                scored = True
        assert scored
    for clip in clips:
        if clip.family == "teleporter" and clip.suffix.startswith("control"):
            memory = fixtures.PortalAssociationMemory()
            for index, frame in enumerate(clip.frames):
                if index:
                    assert memory.predict(clip.frames[index - 1].png, frame.action) is None
                assert memory.observe(frame.png, index * fixtures.INTERVAL) is None
            assert memory.evidence == set()


def test_portal_baseline_rejects_unordered_missing_frames_and_invalid_acquisition_time(clips):
    clip = next(clip for clip in clips if clip.name == "teleporter_train_delayed_lines_v2")
    memory = fixtures.PortalAssociationMemory()
    memory.observe(clip.frames[0].png, 0.0)
    memory.observe(clip.frames[7].png, 1.0)
    with pytest.raises(ValueError, match="increasing"):
        memory.observe(clip.frames[8].png, 0.5)
    for bad in (float("nan"), float("inf"), -1, True):
        with pytest.raises(ValueError, match="finite"):
            memory.observe(clip.frames[8].png, bad)


def test_portal_v2_has_actual_double_rails_and_three_contrasting_diagonal_stripes(clips):
    for clip in clips:
        if clip.family != "teleporter":
            continue
        assert clip.name.endswith("_lines_v2")
        image = Image.open(BytesIO(clip.frames[0].png)).convert("RGB")
        measured_gates, actor = fixtures._portal_pixels(clip.frames[0].png)
        assert actor is not None and len(measured_gates) == 2
        for gx, gy, color in clip.teacher["gates"].values():
            rails = {(x, y) for left in (gx - 5, gx + 3)
                     for x in (left, left + 1) for y in range(gy - 10, gy + 10)}
            assert len(rails) == 80
            assert all(image.getpixel(point) == color for point in rails)
            for offset in (-6, -1, 4):
                stripe = [(gx - 3 + step, gy + offset + round(step * 3 / 5)) for step in range(6)]
                assert all(image.getpixel(point) == (235, 240, 245) for point in stripe)
            # The central device is striped open space, not a filled panel or generic ring.
            assert image.getpixel((gx, gy - 9)) == fixtures.BACKGROUND
            assert (color, (gx, gy)) in {(gate.signature, gate.center) for gate in measured_gates}
        if clip.suffix == "control_decorative":
            assert clip.teacher["portalLinks"] == {}
            assert all(frame.oracle["transitCount"] == 0 for frame in clip.frames)


def test_measured_velocity_and_elapsed_gap_explain_occlusion_but_not_remote_arrival(clips, publication):
    document = publication[0][("recordings", "events_tests", "documentation", "teleporter.md")].decode()
    assert "special-looking striped DOUBLE LINE GATES" in document
    assert "one unexplained fast jump" in document
    for clip in clips:
        if clip.family != "teleporter" or clip.suffix.startswith("control"):
            continue
        masks = [_actor_pixels(frame, clip.teacher["actorColor"]) for frame in clip.frames]
        times = [index * fixtures.INTERVAL for index in range(len(masks))]
        x = [min((px for px, _ in mask), default=None) for mask in masks]
        measured_velocities = [(x[index] - x[index - 1]) / (times[index] - times[index - 1])
                               for index in (1, 2, 3, 4)]
        assert len(set(measured_velocities)) == 1
        velocity = measured_velocities[0]
        assert abs(velocity) == 8
        assert [index for index in range(5, 13) if not masks[index]] == [7, 8, 9, 10]
        normal_before, normal_after = 4, 13
        normal_dt = times[normal_after] - times[normal_before]
        normal_dx = x[normal_after] - x[normal_before]
        assert normal_dt == 2.25 and normal_dx == velocity * normal_dt
        departure = next(index for index, frame in enumerate(clip.frames)
                         if str(frame.oracle["mechanismEvent"]).startswith("departure:"))
        before = departure - 1
        after = departure + clip.teacher["transitHiddenFrames"]
        assert len(masks[before]) == len(masks[after]) == 24
        portal_dt = times[after] - times[before]
        portal_dx = abs(x[after] - x[before])
        envelope = abs(velocity) * portal_dt
        assert portal_dx > envelope
        assert portal_dx / portal_dt > abs(velocity)
        assert f"{normal_before} -> {normal_after}: {normal_dx:+.0f} px / {normal_dt:.2f} s" in document
        assert f"{before} -> {after}: {portal_dx:.0f} px / {portal_dt:.2f} s > {envelope:.0f} px envelope" in document


def test_sequential_phase_contract_first_rejects_constant_speed_without_grading_a_cause(publication, clips):
    files, _ = publication
    clip = next(clip for clip in clips if clip.name == "teleporter_train_delayed_lines_v2")
    prefix = ("recordings", "events_tests", clip.name)
    assessment = json.loads(files[(*prefix, "observer_assessment.json")])
    assert assessment["executionStatus"] == "not_run"
    assert assessment["groundTruthIsRecognizerInput"] is False
    assert assessment["teacherCause"]["usableAsStudentEvidence"] is False
    assert assessment["role"] == "evaluator_only_observer_assessment_contract"
    assert "not registered runtime predicates" in assessment["expectationFormat"]
    _, initial = fixtures._portal_pixels(clip.frames[0].png)
    masks = [_actor_pixels(frame, initial.signature) for frame in clip.frames]
    assert _zero_groups([len(mask) for mask in masks])[:2] == [[7, 8, 9, 10], [19, 20, 21, 22]]
    velocity = assessment["priorVelocityPixelsPerSecond"]
    assert velocity == 8
    for phase_name in ("phase1", "phase2"):
        phase = assessment[phase_name]
        measured = phase["measurement"]
        before, after = measured["beforeFrame"], measured["afterFrame"]
        times = [json.loads(files[(*prefix, str(index), "state.json")])["at_seconds"] for index in (before, after)]
        displacement = min(x for x, _ in masks[after]) - min(x for x, _ in masks[before])
        assert measured["elapsedSeconds"] == times[1] - times[0]
        assert measured["measuredHorizontalDisplacementPixels"] == displacement
        assert measured["priorConstantSpeedPredictionPixels"] == velocity * (times[1] - times[0])
        if phase_name == "phase1":
            assert displacement == measured["priorConstantSpeedPredictionPixels"] == 18
            assert phase["fullyHiddenFrames"] == [7, 8, 9, 10]
        else:
            assert displacement == 43 > measured["priorConstantSpeedPredictionPixels"] == 10
            assert phase["firstRequiredConclusion"] == "constant-speed model mismatch"
            assert phase["predictionObservationCutoffFrame"] == 18
            assert phase["earliestMismatchDecisionFrame"] == 23
            assert phase["requiredUnresolvedAlternatives"] == ["unseen acceleration or fast motion", "teleportation"]
            assert phase["claimsNotEstablishedAtDecision"] == ["definitive teleportation", "definitive acceleration"]
            assert phase["absenceAloneEstablishesCause"] is False
            assert "MUST NOT be graded as definitive teleportation" in phase["gradingRule"]
    assert assessment["laterDiscrimination"]["mayBackdateKnowledgeToFirstJump"] is False
    assert assessment["laterDiscrimination"]["repeatEntryFrame"] > assessment["phase2"]["earliestMismatchDecisionFrame"]
    old_outputs, _ = fixtures._files_for_clip(clip)
    assert all(files[parts] == data for parts, data in old_outputs.items())
    assert (*prefix, "observer_assessment.json") not in old_outputs
    document = files[("recordings", "events_tests", "documentation", "teleporter.md")].decode()
    for required in ("FIRST conclusion is constant-speed model mismatch", "earlier",
                     "unseen acceleration/fast motion AND teleportation", "frames 0-13", "frames 14-23",
                     "frame 23", "frames 24-43", "observer_assessment.json", "never student inputs"):
        assert required in document


def test_first_two_phase_mismatch_uses_frozen_prior_motion_not_a_known_portal_destination(clips):
    clip = next(clip for clip in clips if clip.name == "teleporter_train_delayed_lines_v2")
    memory = fixtures.PortalAssociationMemory()
    for index, frame in enumerate(clip.frames[:23]):
        if index:
            assert memory.predict(clip.frames[index - 1].png, frame.action) is None
        assert memory.observe(frame.png, index * fixtures.INTERVAL) is None
    assert not memory.evidence
    assert memory.last_time == 18 * fixtures.INTERVAL
    assert memory.velocity == (8, 0)
    upcoming_time = 23 * fixtures.INTERVAL
    frozen_position = tuple(memory.last_actor.center[axis] + memory.velocity[axis] * (upcoming_time - memory.last_time)
                            for axis in (0, 1))
    assert frozen_position == (53, 28)
    association = memory.observe(clip.frames[23].png, upcoming_time)
    assert association is not None
    assert association.constant_velocity_projection == frozen_position
    assert memory.last_actor.center == (86, 28) != frozen_position
    assert association.before_seconds == 18 * fixtures.INTERVAL
    assert association.after_seconds == upcoming_time
    # This is one observed association, not a semantic mechanism verdict or prior prediction.
    assert len(memory.evidence) == 1
    assert not hasattr(association, "teleportation_confirmed")


def test_legacy_portal_replay_is_preserved_and_line_revision_changes_only_visible_cues(clips):
    legacy = fixtures._portal_clips(revision=1)
    current = {clip.suffix: clip for clip in clips if clip.family == "teleporter"}
    for old in legacy:
        new = current[old.suffix]
        assert old.name != new.name and not old.name.endswith("_lines_v2")
        assert len(old.frames) == len(new.frames)
        assert all(a.action == b.action and a.oracle == b.oracle for a, b in zip(old.frames, new.frames))
        assert old.frames[0].png != new.frames[0].png
        memory = fixtures.PortalAssociationMemory()
        found = []
        for index, frame in enumerate(old.frames):
            event = memory.observe(frame.png, index * fixtures.INTERVAL)
            if event:
                found.append(event)
        assert len(found) == (0 if old.suffix.startswith("control") else 3)


@pytest.mark.parametrize("suffix", ["train_a", "train_b", "validation_pattern", "test_drops", "control_flat", "control_pause_fall"])
def test_stairs_right_only_motion_support_collision_falls_and_landing(clips, suffix):
    clip = next(clip for clip in clips if clip.family == "stairs_gravity" and clip.suffix == suffix)
    assert all(frame.action in {None, "RIGHT"} for frame in clip.frames)
    assert set(clip.teacher["treadsInCells"]) <= {2, 3}
    poses = []
    for frame in clip.frames:
        pixels = _actor_pixels(frame, clip.teacher["actorColor"])
        assert len(pixels) == 15
        x, y = min(px for px, _ in pixels), min(py for _, py in pixels)
        assert (x, y) == frame.oracle["authoredPosition"]
        assert x + 4 <= clip.teacher["barrierX"]
        assert 0 <= y < 64 - 4
        assert all(y + 4 <= clip.teacher["floorTopPixels"][px // 4] for px in range(x, x + 4))
        poses.append((x, y))
    for previous, current, frame in zip(poses, poses[1:], clip.frames[1:]):
        dx, dy = current[0] - previous[0], current[1] - previous[1]
        assert dx in ({0, 4} if frame.action == "RIGHT" else {0})
        assert 0 <= dy <= 4
    if suffix == "control_pause_fall":
        assert clip.frames[1].action == "RIGHT"
        assert all(frame.action is None for frame in clip.frames[2:])
        assert len({x for x, _ in poses[1:]}) == 1
        assert poses[2][1] > poses[1][1] and poses[3][1] > poses[2][1]
        assert clip.frames[-1].oracle["supported"]
        return
    assert [frame.action for frame in clip.frames[-3:]] == ["RIGHT"] * 3
    assert len(set(poses[-4:])) == 1
    assert len({frame.png for frame in clip.frames[-4:]}) == 1
    assert all(frame.oracle["supported"] for frame in clip.frames[-4:])
    for frame, (x, y) in zip(clip.frames[-4:], poses[-4:]):
        image = Image.open(BytesIO(frame.png)).convert("RGB")
        assert image.getpixel((x + 4, y)) == (190, 120, 95)  # signed visible barrier
        assert all(image.getpixel((px, y + 4)) == (175, 185, 195) for px in range(x, x + 4))
    if suffix == "control_flat":
        assert len({y for _, y in poses}) == 1
    else:
        assert poses[-1][1] > poses[0][1]
        assert any(frame.action is None and after[1] > before[1]
                   for frame, before, after in zip(clip.frames[1:], poses, poses[1:]))


def test_terminal_documentation_references_actual_attempt_frames_and_pause_control(publication, clips):
    files, _ = publication
    document = files[("recordings", "events_tests", "documentation", "stairs_gravity.md")].decode()
    expected = {
        "train_a": (37, 37, [38, 39, 40]),
        "train_b": (37, 39, [40, 41, 42]),
        "validation_pattern": (40, 40, [41, 42, 43]),
        "test_drops": (39, 39, [40, 41, 42]),
        "control_flat": (21, 21, [22, 23, 24]),
    }
    for suffix, (success, stop, attempts) in expected.items():
        clip = next(clip for clip in clips if clip.name == f"stairs_gravity_{suffix}")
        assert f"| `{clip.name}` | {success - 1} -> {success} | {stop} | {', '.join(map(str, attempts))} |" in document
        assert clip.frames[success].action == "RIGHT"
        assert clip.frames[success].oracle["authoredPosition"][0] > clip.frames[success - 1].oracle["authoredPosition"][0]
        for index in attempts:
            assert clip.frames[index].png == clip.frames[stop].png
            state = json.loads(files[("recordings", "events_tests", clip.name, str(index), "state.json")])
            assert state["incoming_action"] == "RIGHT"
            assert not {"blocked", "blockedToRight", "supported", "floorTopPixels"} & state.keys()
    pause = next(clip for clip in clips if clip.name == "stairs_gravity_control_pause_fall")
    assert len({frame.png for frame in pause.frames[4:]}) == 1
    assert all(frame.action is None for frame in pause.frames[2:])
    assert "Stationary alone" in document
    assert "earliest fully" in document and "do not backdate" in document


def test_gravity_updates_from_actual_support_not_a_prescribed_y_trace():
    world = fixtures.StairsWorld((24,) * 24, 4, 4, (45, 155, 240))
    heights, velocities = [], []
    for _ in range(7):
        world.step(None)
        heights.append(world.y)
        velocities.append(world.vertical_velocity)
    assert heights == [5, 7, 10, 14, 18, 20, 20]
    assert velocities == [1, 2, 3, 4, 4, 0, 0]
    assert world.x == 4 and world.supported()
    world.step("RIGHT")
    assert (world.x, world.y) == (8, 20)
    with pytest.raises(ValueError, match="RIGHT only"):
        world.step("DOWN")
    world.x = world.barrier_x - 4
    position = (world.x, world.y)
    for _ in range(3):
        world.step("RIGHT")
        assert (world.x, world.y) == position
    # The same right input on a different, observed support surface has a different y effect.
    dropping = fixtures.StairsWorld((24, 24) + (32,) * 22, 4, 20, (45, 155, 240))
    dropping.step("RIGHT")
    assert (dropping.x, dropping.y) == (8, 21)
    dropping.step(None)
    assert (dropping.x, dropping.y) == (8, 23)


def test_all_new_recordings_are_shared_loadable_numbered_frames_without_root_duplicates(tmp_path, monkeypatch, publication, clips):
    monkeypatch.setattr(fixtures, "action_mechanism_files", lambda: publication)
    fixtures.create_action_mechanism_recordings(tmp_path)
    home = tmp_path / "data" / "omega_vision"
    for name in ("arc3_random_player", "second"):
        (tmp_path / "workspaces" / name).mkdir(parents=True)
    for module in (video, arc3_play, workbench_play):
        monkeypatch.setattr(module, "_workspace_root", lambda name: tmp_path / "workspaces" / name)
    app = FastAPI()
    app.include_router(video.router)
    expected = {f"recordings/events_tests/{clip.name}" for clip in clips}
    listings = []
    with TestClient(app) as client:
        for workspace in ("arc3_random_player", "second"):
            response = client.get(f"{video.router.prefix}/visual-sequences", params={"workspaceId": workspace})
            assert response.status_code == 200, response.text
            selected = {item["id"]: item for item in response.json()["visualSequences"] if item["id"] in expected}
            assert set(selected) == expected
            listings.append(selected)
            for module in (arc3_play, workbench_play):
                result = module.list_recording_dirs(workspace, gameId="events_tests")["recordingDirs"]
                assert expected <= {item["path"][5:] for item in result}
        assert listings[0] == listings[1]
        for clip in clips:
            identity = f"recordings/events_tests/{clip.name}"
            directory = home / "recordings" / "events_tests" / clip.name
            response = client.get(f"{video.router.prefix}/preprocessing-frames",
                                  params={"workspaceId": "arc3_random_player", "sequenceId": f"data/{identity}", "limit": 100})
            assert response.status_code == 200, response.text
            assert response.json()["total"] == len(clip.frames)
            assert [item["label"] for item in response.json()["frames"]] == [
                f"{index}/image.png" for index in range(len(clip.frames))]
            _, units, ordering = video._sequence_execution_context(tmp_path, f"data/{identity}")
            assert ordering["ordered"]
            assert [unit["id"] for unit in units] == [str(index) for index in range(len(clip.frames))]
            for index in range(len(clip.frames)):
                context = recording_context(home, directory, str(index))
                assert context.current.frame_id == str(index)
                assert len(context.moments) == len(clip.frames)
    assert not (home / "workspaces").exists()
    assert not (home / "preferences").exists()
    assert not list((tmp_path / "workspaces").rglob("*.*"))


def test_idempotent_additions_preserve_all_prior_index_and_document_families(tmp_path, monkeypatch, publication):
    home = tmp_path / "data" / "omega_vision"
    prior = {
        ("recordings", "events_tests", "tests.json"): b"Original test index",
        ("recordings", "events_tests", "visual_memory_tests.json"): b"Four-family index",
        ("recordings", "events_tests", "documentation", "color_band_cycle.md"): b"Prior four-family documentation",
        ("recordings", "events_tests", "moved", "0", "state.json"): b"Original state",
        ("recordings", "events_tests", "color_band_cycle_train_a", "0", "image.png"): b"Prior image",
    }
    publisher.publish_recording_files(tmp_path, prior)
    before = _fingerprint(home / "recordings" / "events_tests")
    monkeypatch.setattr(fixtures, "action_mechanism_files", lambda: publication)
    assert fixtures.create_action_mechanism_recordings(tmp_path)["createdFileCount"] == 912
    after = _fingerprint(home / "recordings" / "events_tests")
    assert all(after[name] == value for name, value in before.items())
    before = _fingerprint(home)
    assert fixtures.create_action_mechanism_recordings(tmp_path)["createdFileCount"] == 0
    assert before == _fingerprint(home)


@pytest.mark.parametrize("parts", [
    ("recordings", "events_tests", "teleporter_train_a_lines_v2", "0", "image.png"),
    ("recordings", "events_tests", "stairs_gravity_train_a", "0", "state.json"),
    ("recordings", "events_tests", "teleporter_train_a_lines_v2", "recording.json"),
    ("recordings", "events_tests", "stairs_gravity_train_a", "evaluation.json"),
    ("recordings", "events_tests", "teleporter_train_delayed_lines_v2", "observer_assessment.json"),
    ("recordings", "events_tests", "documentation", "teleporter.md"),
    ("recordings", "events_tests", "action_mechanism_tests.json"),
    ("locks", publisher.SUITE_ID, ".writer.lock"),
])
def test_all_output_types_reject_redirects_before_any_publication(tmp_path, monkeypatch, publication, parts):
    home = tmp_path / "data" / "omega_vision"
    original = publisher.storage_path
    monkeypatch.setattr(fixtures, "action_mechanism_files", lambda: publication)
    monkeypatch.setattr(publisher, "storage_path", lambda root, *requested:
                        home / "redirect" / requested[-1] if requested == parts else original(root, *requested))
    with pytest.raises(ValueError, match="redirect"):
        fixtures.create_action_mechanism_recordings(tmp_path)
    assert not (home / "recordings").exists()
    assert not (home / "redirect").exists()


@pytest.mark.parametrize("conflicting_parts", [
    ("documentation", "stairs_gravity.md"),
    ("teleporter_train_delayed_lines_v2", "observer_assessment.json"),
])
def test_conflicting_new_document_external_root_and_cache_escape_are_rejected(tmp_path, monkeypatch, publication, conflicting_parts):
    from omega_vision.perception import visual_sequence_list_cache as cache
    home = tmp_path / "data" / "omega_vision"
    monkeypatch.setattr(fixtures, "action_mechanism_files", lambda: publication)
    with pytest.raises(ValueError, match="Unrecognized"):
        fixtures.create_action_mechanism_recordings(tmp_path / "external")
    original = cache.storage_path
    monkeypatch.setattr(cache, "storage_path", lambda root, *parts:
                        home / "redirect" if parts == (".cache", "visual-sequence-list", "dirty.json")
                        else original(root, *parts))
    with pytest.raises(ValueError, match="redirect"):
        fixtures.create_action_mechanism_recordings(tmp_path)
    assert not (home / "recordings").exists()
    document = (home / "recordings" / "events_tests").joinpath(*conflicting_parts)
    document.parent.mkdir(parents=True)
    document.write_bytes(b"Concurrent user's document")
    with pytest.raises(FileExistsError, match="preserved without overwrite"):
        fixtures.create_action_mechanism_recordings(tmp_path)
    assert document.read_bytes() == b"Concurrent user's document"
    assert not (document.parents[1] / "teleporter_train_a_lines_v2").exists()
