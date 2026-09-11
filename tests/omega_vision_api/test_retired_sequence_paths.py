import json

from fastapi import HTTPException
from PIL import Image
import pytest

from omega_vision.demos import recognition_demos as demos
from omega_vision.perception.visual_sequence_selection import load_selection, save_selection
from omega_vision.services import video_import_api as api, phase3_live


@pytest.mark.parametrize("family", [
    "arc_recordings", "arc3_recordings", "vision_frames/arc_recordings", "vision_frames/arc3_recordings",
])
def test_retired_roots_are_not_catalog_choices_or_resolvable_sequences(tmp_path, family):
    home = tmp_path / "data" / "omega_vision"
    old = home.joinpath(*family.split("/"), "old")
    old.mkdir(parents=True)
    Image.new("RGB", (2, 2), "red").save(old / "frame_000000.png")
    before = (old / "frame_000000.png").read_bytes()
    assert all(not entry["id"].startswith(family + "/") for entry in api._list_image_sets(tmp_path))
    for resolve in (api._resolve_set_dir, api._sequence_root_for):
        with pytest.raises(HTTPException) as error:
            resolve(tmp_path, f"data/{family}/old")
        assert error.value.status_code == 410
    assert (old / "frame_000000.png").read_bytes() == before


def test_demo_preview_uses_captured_selection_not_a_longest_or_retired_default(tmp_path, monkeypatch):
    from omega_vision.perception import symbolic_arc
    import numpy
    observed = []
    monkeypatch.setattr(demos, "_resolve_ls20", lambda key: (
        observed.append(key) or [("frame.png", "verified-input", None)], None, key,
    ))
    monkeypatch.setattr(symbolic_arc, "decode_grid", lambda path: (numpy.zeros((1, 1), dtype=int), ["#123456"], 1, 1))
    preview = demos._preview_live_ls20("recordings/selected")
    assert observed == ["recordings/selected"]
    assert preview["cells"][0]["color"] == "#123456"


def test_live_demo_starts_from_the_shared_selection_without_a_legacy_fallback(monkeypatch):
    monkeypatch.setattr(demos, "_current_ls20_key", lambda: "recordings/chosen")
    def selected(identifier):
        assert identifier == "recordings/chosen"
        raise RuntimeError("selected source reached without computation")
    monkeypatch.setattr(demos, "_resolve_ls20", selected)
    with pytest.raises(RuntimeError, match="selected source reached"):
        demos._demo_live_ls20_sequence()


def test_phase3_uses_shared_selection_and_manifest_order_without_alternate_roots(tmp_path, monkeypatch):
    home = tmp_path / "data" / "omega_vision"
    directory = home / "recordings" / "game" / "run"
    moves = []
    for frame in ("z-first", "a-second"):
        (directory / frame).mkdir(parents=True)
        Image.new("RGB", (2, 2), "red").save(directory / frame / "image.png")
        moves.append({"directory": f"data/recordings/game/run/{frame}", "level": "1"})
    (directory / "recording.json").write_text(json.dumps({"game_id": "game", "moves": moves}))
    initial = load_selection(home)
    save_selection(home, "recordings/game/run", initial["revision"], validate=lambda _: None)
    monkeypatch.setattr(phase3_live, "_REPO_ROOT", tmp_path)
    assert phase3_live._selected_sequence_directory() == directory
    assert phase3_live._frame_ids(directory) == ["z-first/image.png", "a-second/image.png"]
    assert phase3_live._frame_image(directory, "a-second/image.png") == directory / "a-second" / "image.png"
    with pytest.raises((PermissionError, ValueError)):
        phase3_live._frame_image(directory, "../../../outside.png")
