from io import BytesIO
import json

from PIL import Image

from omega_vision.evaluation.fog_action_recordings import TEST_ID, create_fog_action_recordings, fog_action_clips
from omega_vision.evaluation.visual_memory_baselines import SpotlightMemory
from omega_vision.evaluation.visual_memory_recordings import visual_memory_clips
from omega_vision.perception.contextual_memory import recording_context


def test_movement_and_clicking_use_identical_frames_but_distinct_actual_inputs():
    movement, clicking = fog_action_clips()
    source = next(clip for clip in visual_memory_clips()
                  if clip.family == "spotlight_scene" and clip.suffix == "train_a")
    assert len(movement.frames) == len(clicking.frames) == 35
    assert movement.teacher["visualFingerprint"] == clicking.teacher["visualFingerprint"]
    assert not movement.teacher["independentVisualTrial"] and not clicking.teacher["independentVisualTrial"]
    assert [frame.png for frame in movement.frames] == [frame.png for frame in clicking.frames] == [frame.png for frame in source.frames]
    for index, (move, click) in enumerate(zip(movement.frames, clicking.frames, strict=True)):
        if index == 0:
            assert move.action is click.action is None
            assert move.action_data == click.action_data == {}
            continue
        assert move.action in {"RIGHT", "LEFT", "DOWN"}
        assert move.action_data == {}
        assert click.action == "CLICK"
        current, previous = move.oracle["apertureCenter"], movement.frames[index - 1].oracle["apertureCenter"]
        dx, dy = current[0] - previous[0], current[1] - previous[1]
        assert (dx > 0, dx < 0, dy > 0) == (move.action == "RIGHT", move.action == "LEFT", move.action == "DOWN")
        assert click.action_data == {"x": current[0], "y": current[1]}


def test_prefix_reconstruction_depends_only_on_observations_not_action_labels():
    movement, clicking = fog_action_clips()
    memories = SpotlightMemory(), SpotlightMemory()
    for pair in zip(movement.frames, clicking.frames, strict=True):
        for memory, frame in zip(memories, pair, strict=True):
            memory.observe(frame.png)
            image = Image.open(BytesIO(frame.png)).convert("RGBA")
            assert all(pixel[:3] == (0, 0, 0) for pixel in image.getdata() if pixel[3] == 0)
        assert memories[0].image().tobytes() == memories[1].image().tobytes()
        assert memories[0].known_count == memories[1].known_count
    assert memories[0].unknown_count == memories[1].unknown_count == 0


def test_action_variants_publish_additively_and_have_valid_numbered_context(tmp_path):
    home = tmp_path / "data" / "omega_vision"
    old = home / "recordings" / "events_tests" / "spotlight_scene_train_a" / "user.txt"
    old.parent.mkdir(parents=True)
    old.write_text("Existing recording must remain unchanged.")
    before = old.read_bytes(), old.stat().st_mtime_ns
    result = create_fog_action_recordings(tmp_path)
    assert result["recordingCount"] == 2 and result["frameCount"] == 70
    for clip in fog_action_clips():
        directory = home / "recordings" / "events_tests" / clip.name
        assert len(recording_context(home, directory, "0").moments) == 35
        manifest = json.loads((directory / "recording.json").read_text())
        for index, frame in enumerate(clip.frames):
            state = json.loads((directory / str(index) / "state.json").read_text())
            assert state["incoming_action"] == manifest["moves"][index]["action"] == frame.action
            assert state["action_data"] == frame.action_data
            assert "teacher" not in state and "fullSceneRgb" not in state
    index = json.loads((home / "recordings" / "events_tests" / "fog_action_tests.json").read_text())
    assert index["tests"][0]["id"] == TEST_ID
    assert (home / "recordings" / "events_tests" / index["tests"][0]["documentationFile"]).is_file()
    assert before == (old.read_bytes(), old.stat().st_mtime_ns)
    assert create_fog_action_recordings(tmp_path)["createdFileCount"] == 0
