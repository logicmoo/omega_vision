from dataclasses import FrozenInstanceError
import hashlib
from io import BytesIO
import json

from fastapi import FastAPI
from fastapi.testclient import TestClient
from PIL import Image
import pytest

from omega_vision.evaluation import event_recordings as publisher
from omega_vision.evaluation import visual_memory_recordings as fixtures
from omega_vision.evaluation.visual_memory_baselines import ColorBandMemory, SpotlightMemory, observe_color_band
from omega_vision.perception.contextual_memory import recording_context
from omega_vision.services import arc3_play, video_import_api as video
from workbench_api_server import arc3_play_api as workbench_play


@pytest.fixture(scope="module")
def clips():
    return fixtures.visual_memory_clips()


@pytest.fixture(scope="module")
def publication():
    return fixtures.visual_memory_files()


def _fingerprint(root):
    return {path.relative_to(root).as_posix(): (hashlib.sha256(path.read_bytes()).hexdigest(), path.stat().st_mtime_ns)
            for path in root.rglob("*") if path.is_file() and path.name != ".writer.lock"}


def test_four_individually_documented_families_have_only_additive_outputs(publication, clips):
    files, counts = publication
    index = json.loads(files[("recordings", "events_tests", "visual_memory_tests.json")])
    assert index["schemaVersion"] == 1 and index["count"] == 4
    assert {item["id"] for item in index["tests"]} == set(fixtures.FAMILY_IDS)
    assert counts["recordingCount"] == 20 and counts["frameCount"] == 336
    assert counts["families"] == {
        "color_band_cycle": {"recordings": 6, "frames": 70},
        "spotlight_scene": {"recordings": 6, "frames": 154},
        "occlusion_pole": {"recordings": 4, "frames": 64},
        "occlusion_large_object": {"recordings": 4, "frames": 48},
    }
    assert len(files) == 717
    assert ("recordings", "events_tests", "tests.json") not in files
    assert ("recordings", "events_tests", "suite.json") not in files
    for parts in files:
        assert parts[:2] == ("recordings", "events_tests")
        assert parts[2] in {clip.name for clip in clips} | {"documentation", "visual_memory_tests.json"}
    for test in index["tests"]:
        assert test["group"] == "Events" and test["executionStatus"] == "not_run"
        assert test["documentationFile"] == f"documentation/{test['id']}.md"
        document = files[("recordings", "events_tests", "documentation", f"{test['id']}.md")].decode()
        for text in ("Local memory", "earlier", "Predictions", "observed", "Controls", "held-out", "not run", "oracle"):
            assert text.lower() in document.lower()
        for item in test["recordings"]:
            assert item["visualSequenceId"] in document
            assert item["frameCount"] > 0 and item["partition"]
            manifest = json.loads(files[(*item["visualSequenceId"].split("/"), "recording.json")])
            assert len(manifest["moves"]) == item["frameCount"]
        for clip in clips:
            if clip.family == test["id"]:
                assert f"- **{clip.suffix}**: {clip.description}" in document


def test_numbered_acquisition_states_and_manifests_never_contain_teacher_answers(publication, clips):
    files, _ = publication
    allowed = {
        "kind", "game_id", "game_directory", "level", "state", "step_count",
        "incoming_action", "action_data", "action_directory", "parent_node",
        "action_path", "at_seconds", "recorded_at", "image_hash",
    }
    for clip in clips:
        prefix = ("recordings", "events_tests", clip.name)
        oracle = json.loads(files[(*prefix, "evaluation.json")])
        assert oracle["recognizerStatus"] == "not_run"
        assert oracle["groundTruthIsRecognizerInput"] is False
        manifest = json.loads(files[(*prefix, "recording.json")])
        assert "teacher" not in manifest
        assert (*prefix, "image.png") not in files
        assert [move["index"] for move in manifest["moves"]] == list(range(len(clip.frames)))
        for index, frame in enumerate(clip.frames):
            state = json.loads(files[(*prefix, str(index), "state.json")])
            assert set(state) == allowed
            assert state["incoming_action"] == frame.action
            assert state["action_data"] == frame.action_data
            assert set(frame.action_data) <= {"x", "y"}
            assert state["at_seconds"] == index * clip.interval
            assert state["image_hash"] == hashlib.sha256(frame.png).hexdigest()[:16]
            assert manifest["moves"][index]["directory"] == f"data/recordings/events_tests/{clip.name}/{index}"
            assert manifest["moves"][index]["action"] == frame.action
            assert oracle["frames"][index]["sha256"] == hashlib.sha256(frame.png).hexdigest()
            assert clip.family not in json.dumps(state)
            assert frame.action in {None, "CLICK", "MOVE_POINTER", "WAIT"}
    assert not any(part.endswith(".metta") or part == "memory" for parts in files for part in parts)


def test_click_on_every_target_pixel_advances_and_outside_never_does(clips):
    for clip in clips:
        if clip.family != "color_band_cycle":
            continue
        x0, y0, x1, y1 = clip.teacher["targetBounds"]
        size = len(clip.teacher["palette"])
        for y in range(y0, y1):
            for x in range(x0, x1):
                assert fixtures._color_step(size - 1, size, (x0, y0, x1, y1), (x, y)) == (0, True)
        for point in ((x0 - 1, y0), (x1, y1 - 1), (x0, y0 - 1), (x1 - 1, y1)):
            assert fixtures._color_step(0, size, (x0, y0, x1, y1), point) == (0, False)
        observed = [observe_color_band(frame.png) for frame in clip.frames]
        hits = []
        for before, after, frame in zip(observed, observed[1:], clip.frames[1:]):
            point = (frame.action_data["x"], frame.action_data["y"])
            hit = point in before.target.pixels
            hits.append(hit)
            expected = before.colors[(before.colors.index(before.target.color) + int(hit)) % len(before.colors)]
            assert after.target.color == expected
        if clip.suffix == "control_a":
            assert not any(hits)
        else:
            assert any(hits) and not all(hits)
            assert any(frame.oracle["wrapped"] for frame in clip.frames)


def _train_color(memory, clip):
    results = []
    for before, after in zip(clip.frames, clip.frames[1:]):
        prediction = memory.predict(before.png, after.action, after.action_data)
        results.append(memory.observe(prediction, after.png))
    return results


def test_color_baseline_learns_then_generalizes_reordered_and_unseen_palettes_without_heldout_learning(clips):
    color = {clip.suffix: clip for clip in clips if clip.family == "color_band_cycle"}
    memory = ColorBandMemory()
    first = _train_color(memory, color["train_a"])
    assert sum(result.status == "unknown" for result in first) == 1
    assert all(result.status != "incorrect" for result in first)
    assert memory.learned_step == 1
    assert observe_color_band(color["train_a"].frames[0].png).colors != observe_color_band(color["train_b"].frames[0].png).colors
    assert all(result.status == "correct" for result in _train_color(memory, color["train_b"]))
    evidence = memory.evidence
    known_colors = set(observe_color_band(color["train_a"].frames[0].png).colors)
    for suffix in ("validation_a", "test_a", "control_a", "control_boundary"):
        clip = color[suffix]
        if suffix in {"validation_a", "test_a"}:
            assert not known_colors & set(observe_color_band(clip.frames[0].png).colors)
        for before, after in zip(clip.frames, clip.frames[1:]):
            prediction = memory.predict(before.png, after.action, after.action_data)
            assert prediction.expected_color is not None
            result = memory.observe(prediction, after.png, learn=False)
            assert result.status == "correct", (suffix, prediction, result)
        assert memory.evidence == evidence


def test_color_predictions_are_frozen_before_future_images_and_evidence_is_idempotent(clips):
    clip = next(clip for clip in clips if clip.name == "color_band_cycle_train_a")
    before, after = clip.frames[1], clip.frames[2]
    memory = ColorBandMemory()
    prediction = memory.predict(before.png, after.action, after.action_data)
    assert prediction.expected_color is None
    memory.observe(prediction, after.png)
    evidence = memory.evidence
    assert prediction.expected_color is None
    memory.observe(prediction, after.png)
    assert memory.evidence == evidence
    with pytest.raises(FrozenInstanceError):
        prediction.expected_color = (1, 2, 3)
    next_prediction = memory.predict(after.png, after.action, after.action_data)
    saved = next_prediction.expected_color
    # Construct a different future only after the prediction has been frozen.
    alternative = Image.open(BytesIO(after.png)).convert("RGB")
    for point in next_prediction.before.target.pixels:
        alternative.putpixel(point, next_prediction.before.target.color)
    result = memory.observe(next_prediction, fixtures.png_bytes(alternative))
    assert result.status == "incorrect"
    assert next_prediction.expected_color == saved
    assert memory.learned_step is None  # retain, rather than erase, the counterexample
    assert prediction.expected_color is None


def test_color_and_spotlight_baselines_have_no_file_or_metadata_input(clips, monkeypatch):
    color = next(clip for clip in clips if clip.name == "color_band_cycle_train_a")
    spotlight = next(clip for clip in clips if clip.name == "spotlight_scene_train_a")
    original = Image.open

    def byte_stream_only(source, *args, **kwargs):
        assert isinstance(source, BytesIO), "Baseline attempted a path or metadata read"
        return original(source, *args, **kwargs)

    monkeypatch.setattr(Image, "open", byte_stream_only)
    monkeypatch.setattr("builtins.open", lambda *args, **kwargs: pytest.fail("Baseline opened a file"))
    memory = ColorBandMemory()
    assert all(result.status != "incorrect" for result in _train_color(memory, color))
    reveal = SpotlightMemory()
    reveal.observe(spotlight.frames[0].png)
    assert reveal.known_count < 48 * 32
    with pytest.raises(ValueError, match="actual CLICK"):
        memory.predict(color.frames[0].png, "CLICK", {"x": 0, "y": 0, "nextColor": 1})


@pytest.mark.parametrize("suffix", ["train_a", "train_b", "validation_a", "test_a", "control_partial", "control_revisit"])
def test_spotlight_prefix_union_preserves_black_unknown_and_retains_seen_pixels(clips, suffix):
    clip = next(clip for clip in clips if clip.family == "spotlight_scene" and clip.suffix == suffix)
    assert len(clip.frames) <= 100
    memory = SpotlightMemory()
    known = {}
    scene = Image.new("RGB", (clip.teacher["width"], clip.teacher["height"]))
    scene.putdata(clip.teacher["fullSceneRgb"])
    observed_black = False
    retained_after_aperture_moves = False
    for frame in clip.frames:
        sensor = Image.open(BytesIO(frame.png))
        assert sensor.mode == "RGBA"
        prior = dict(known)
        for y in range(sensor.height):
            for x in range(sensor.width):
                rgba = sensor.getpixel((x, y))
                if rgba[3] == 255:
                    known[(x, y)] = rgba
                    observed_black |= rgba == (0, 0, 0, 255)
                else:
                    assert rgba == (0, 0, 0, 0), "Unknown pixels leaked hidden RGB"
                    retained_after_aperture_moves |= (x, y) in prior
        memory.observe(frame.png)
        snapshot = memory.image()
        assert memory.known_count == len(known)
        assert memory.unknown_count == scene.width * scene.height - len(known)
        for y in range(sensor.height):
            for x in range(sensor.width):
                assert snapshot.getpixel((x, y)) == known.get((x, y), (0, 0, 0, 0))
        assert memory.observe(frame.png) == 0
        assert snapshot.tobytes() == memory.image().tobytes()
        if memory.unknown_count:
            assert snapshot.tobytes() != scene.convert("RGBA").tobytes()
        else:
            assert snapshot.convert("RGB").tobytes() == scene.tobytes()
    assert observed_black
    if suffix != "control_revisit":
        assert retained_after_aperture_moves
    if suffix.startswith("control"):
        assert memory.unknown_count > 0
    else:
        assert memory.unknown_count == 0
        assert memory.image().convert("RGB").tobytes() == scene.tobytes()


def test_spotlight_ignores_hidden_rgb_and_rejects_static_scene_conflicts_transactionally(clips):
    clip = next(clip for clip in clips if clip.name == "spotlight_scene_control_partial")
    frame = Image.open(BytesIO(clip.frames[0].png))
    hidden = frame.copy()
    for y in range(hidden.height):
        for x in range(hidden.width):
            if hidden.getpixel((x, y))[3] == 0:
                hidden.putpixel((x, y), (255, 20, 240, 0))
    one, two = SpotlightMemory(), SpotlightMemory()
    one.observe(clip.frames[0].png)
    two.observe(fixtures.png_bytes(hidden))
    assert one.image().tobytes() == two.image().tobytes()
    before = one.image().tobytes()
    wrong = frame.copy()
    wrong.putpixel((47, 31), (100, 100, 100, 255))  # a new pixel must not be partly committed
    wrong.putpixel((0, 0), (1, 2, 3, 255))  # known black contradicts this later reading
    with pytest.raises(ValueError, match="contradict"):
        one.observe(fixtures.png_bytes(wrong))
    assert one.image().tobytes() == before
    with pytest.raises(ValueError, match="RGBA"):
        one.observe(fixtures.png_bytes(frame.convert("RGB")))
    wrong = frame.copy()
    wrong.putpixel((47, 31), (0, 0, 0, 120))
    with pytest.raises(ValueError, match="binary"):
        one.observe(fixtures.png_bytes(wrong))
    with pytest.raises(ValueError, match="dimensions"):
        one.observe(fixtures.png_bytes(Image.new("RGBA", (10, 10))))


@pytest.mark.parametrize("family,hidden,entry,exit_frame", [
    ("occlusion_pole", [6, 7, 8, 9], 5, 10),
    ("occlusion_large_object", [4, 5, 6, 7], 3, 8),
])
def test_occlusion_has_exactly_four_completely_hidden_samples_from_actual_pixels(clips, family, hidden, entry, exit_frame):
    for clip in clips:
        if clip.family != family:
            continue
        color = clip.teacher["actorColor"]
        full_area = sum(row.count("1") for row in clip.teacher["actorMask"])
        masks = [
            {(x, y) for y in range(image.height) for x in range(image.width) if image.getpixel((x, y)) == color}
            for image in (Image.open(BytesIO(frame.png)).convert("RGB") for frame in clip.frames)
        ]
        counts = [len(mask) for mask in masks]
        assert [index for index, count in enumerate(counts) if count == 0] == hidden
        assert hidden == list(range(hidden[0], hidden[0] + 4))
        assert counts[:3] == [full_area] * 3
        assert counts[-2:] == [full_area] * 2
        if clip.suffix == "control_absence":
            assert clip.teacher["occluderBounds"] is None
            assert counts[entry] == counts[exit_frame] == full_area
        else:
            assert 0 < counts[entry] < full_area and 0 < counts[exit_frame] < full_area
            assert clip.teacher["occluderBounds"] is not None
        x0 = min(x for x, _ in masks[0])
        dx = min(x for x, _ in masks[1]) - x0
        assert dx != 0
        assert dx == (6 if family == "occlusion_large_object" else 2) * (
            -1 if clip.suffix == "validation_a" else 1)
        for index in hidden:
            assert x0 + dx * index == clip.frames[index].oracle["authoredPosition"][0]
            assert masks[index] == set()  # projected positions are not observations
        assert {frame.oracle["actorId"] for frame in clip.frames} == {"teacher_same_actor"}


def test_real_recordings_preview_order_and_all_frame_contexts_shared_between_workspaces(tmp_path, monkeypatch, publication, clips):
    monkeypatch.setattr(fixtures, "visual_memory_files", lambda: publication)
    fixtures.create_visual_memory_recordings(tmp_path)
    home = tmp_path / "data" / "omega_vision"
    for name in ("arc3_random_player", "second"):
        (tmp_path / "workspaces" / name).mkdir(parents=True)
    for module in (video, arc3_play, workbench_play):
        monkeypatch.setattr(module, "_workspace_root", lambda name: tmp_path / "workspaces" / name)
    app = FastAPI()
    app.include_router(video.router)
    identities = {f"recordings/events_tests/{clip.name}" for clip in clips}
    listings = []
    with TestClient(app) as client:
        for workspace in ("arc3_random_player", "second"):
            response = client.get(f"{video.router.prefix}/visual-sequences", params={"workspaceId": workspace})
            assert response.status_code == 200, response.text
            entries = {item["id"]: item for item in response.json()["visualSequences"] if item["id"] in identities}
            assert set(entries) == identities
            listings.append(entries)
            for module in (arc3_play, workbench_play):
                result = module.list_recording_dirs(workspace, gameId="events_tests")["recordingDirs"]
                assert identities <= {item["path"][5:] for item in result}
        assert listings[0] == listings[1]
        for clip in clips:
            count = len(clip.frames)
            logical = f"recordings/events_tests/{clip.name}"
            directory = home / "recordings" / "events_tests" / clip.name
            response = client.get(f"{video.router.prefix}/preprocessing-frames",
                                  params={"workspaceId": "arc3_random_player", "sequenceId": f"data/{logical}", "limit": 100})
            assert response.status_code == 200, response.text
            assert response.json()["total"] == count
            assert [frame["label"] for frame in response.json()["frames"]] == [f"{index}/image.png" for index in range(count)]
            _, units, ordering = video._sequence_execution_context(tmp_path, f"data/{logical}")
            assert ordering["ordered"]
            assert [unit["id"] for unit in units] == [str(index) for index in range(count)]
            for index in range(count):
                context = recording_context(home, directory, str(index))
                assert context.current.frame_id == str(index)
                assert [moment.frame_id for moment in context.moments] == [str(step) for step in range(count)]
    assert not (home / "workspaces").exists()
    assert not (home / "preferences").exists()
    assert not list((tmp_path / "workspaces").rglob("*.*"))


def test_create_only_publication_is_idempotent_and_preserves_prior_indices_docs_and_inputs(tmp_path, monkeypatch, publication):
    home = tmp_path / "data" / "omega_vision"
    prior = {
        ("recordings", "events_tests", "tests.json"): b'{"user":"prior index"}',
        ("recordings", "events_tests", "suite.json"): b'{"user":"prior event suite"}',
        ("recordings", "events_tests", "documentation", "plate_momentary.md"): b"User's existing documentation",
        ("recordings", "events_tests", "moved", "0", "state.json"): b"Preserve original state",
        ("recordings", "events_tests", "plate_momentary_train_a", "0", "image.png"): b"Preserve induction image",
    }
    publisher.publish_recording_files(tmp_path, prior)
    before = _fingerprint(home / "recordings" / "events_tests")
    monkeypatch.setattr(fixtures, "visual_memory_files", lambda: publication)
    assert fixtures.create_visual_memory_recordings(tmp_path)["createdFileCount"] == 717
    after = _fingerprint(home / "recordings" / "events_tests")
    assert all(after[name] == value for name, value in before.items())
    before = _fingerprint(home)
    assert fixtures.create_visual_memory_recordings(tmp_path)["createdFileCount"] == 0
    assert _fingerprint(home) == before


@pytest.mark.parametrize("parts", [
    ("recordings", "events_tests", "color_band_cycle_train_a", "0", "image.png"),
    ("recordings", "events_tests", "spotlight_scene_train_a", "0", "state.json"),
    ("recordings", "events_tests", "occlusion_pole_train_a", "recording.json"),
    ("recordings", "events_tests", "occlusion_large_object_train_a", "evaluation.json"),
    ("recordings", "events_tests", "documentation", "color_band_cycle.md"),
    ("recordings", "events_tests", "visual_memory_tests.json"),
    ("locks", publisher.SUITE_ID, ".writer.lock"),
])
def test_every_publication_type_rejects_redirects_before_writing(tmp_path, monkeypatch, publication, parts):
    home = tmp_path / "data" / "omega_vision"
    original = publisher.storage_path
    monkeypatch.setattr(fixtures, "visual_memory_files", lambda: publication)
    monkeypatch.setattr(publisher, "storage_path", lambda root, *requested:
                        home / "redirect" / requested[-1] if requested == parts else original(root, *requested))
    with pytest.raises(ValueError, match="redirect"):
        fixtures.create_visual_memory_recordings(tmp_path)
    assert not (home / "recordings").exists()
    assert not (home / "redirect").exists()


def test_conflicting_document_aborts_entire_new_publication(tmp_path, monkeypatch, publication):
    home = tmp_path / "data" / "omega_vision"
    document = home / "recordings" / "events_tests" / "documentation" / "spotlight_scene.md"
    document.parent.mkdir(parents=True)
    document.write_bytes(b"A concurrent user-authored document")
    monkeypatch.setattr(fixtures, "visual_memory_files", lambda: publication)
    with pytest.raises(FileExistsError, match="preserved without overwrite"):
        fixtures.create_visual_memory_recordings(tmp_path)
    assert document.read_bytes() == b"A concurrent user-authored document"
    assert not (document.parents[1] / "color_band_cycle_train_a").exists()
    assert not (home / ".cache").exists()


def test_external_root_and_cache_redirect_are_rejected(tmp_path, monkeypatch, publication):
    from omega_vision.perception import visual_sequence_list_cache as cache
    home = tmp_path / "data" / "omega_vision"
    monkeypatch.setattr(fixtures, "visual_memory_files", lambda: publication)
    with pytest.raises(ValueError, match="Unrecognized"):
        fixtures.create_visual_memory_recordings(tmp_path / "external")
    original = cache.storage_path
    monkeypatch.setattr(cache, "storage_path", lambda root, *parts:
                        home / "redirect" if parts == (".cache", "visual-sequence-list", "dirty.json")
                        else original(root, *parts))
    with pytest.raises(ValueError, match="redirect"):
        fixtures.create_visual_memory_recordings(tmp_path)
    assert not (home / "recordings").exists()
    assert not (home / "redirect").exists()
