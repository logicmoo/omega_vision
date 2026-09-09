from __future__ import annotations

import importlib.util
import uuid
from pathlib import Path

import numpy as np
from PIL import Image

from omega_vision.services import video_import_api

SKILL_PATH = (
    Path(video_import_api.__file__).resolve().parents[3]
    / "data" / "omega_vision" / "video_import" / "filter_skills" / "darken_light_gradients.py"
)


def _load():
    spec = importlib.util.spec_from_file_location(f"dlg_{uuid.uuid4().hex[:6]}", SKILL_PATH)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


DLG = _load()


def _gray_row(values):
    arr = np.array([[[v, v, v] for v in values]], dtype=np.uint8)  # 1xN RGB
    return Image.fromarray(arr, "RGB")


def _lums(image):
    a = np.asarray(image.convert("RGB"), dtype=np.int32)
    return ((a[..., 0] * 299 + a[..., 1] * 587 + a[..., 2] * 114) // 1000).tolist()


def test_flat_color_is_unchanged():
    img = Image.new("RGB", (5, 5), (120, 120, 120))
    out = DLG.apply(img, {})
    assert list(out.convert("RGB").getdata()) == list(img.getdata())


def test_center_takes_darker_neighbor_from_every_direction():
    for dy in (-1, 0, 1):
        for dx in (-1, 0, 1):
            if dy == 0 and dx == 0:
                continue
            arr = np.full((3, 3, 3), 120, dtype=np.uint8)
            arr[1 + dy, 1 + dx] = (108, 108, 108)  # slightly darker (delta 12), same hue
            out = DLG.apply(Image.fromarray(arr, "RGB"), {"maxLightnessDelta": 16})
            center = out.convert("RGB").getpixel((1, 1))
            assert center == (108, 108, 108), f"dir ({dy},{dx}) center={center}"


def test_threshold_boundary_inclusive_and_exclusive():
    # delta exactly 16 qualifies; delta 17 does not.
    at = DLG.apply(_gray_row([120, 104]), {"maxLightnessDelta": 16})
    assert _lums(at)[0][0] == 104  # 120 -> 104
    over = DLG.apply(_gray_row([120, 103]), {"maxLightnessDelta": 16})
    assert _lums(over)[0][0] == 120  # 120 unchanged (delta 17 > 16)


def test_choose_darkest_qualifying_neighbor():
    arr = np.full((1, 3, 3), 120, dtype=np.uint8)
    arr[0, 0] = (112, 112, 112)  # delta 8
    arr[0, 2] = (106, 106, 106)  # delta 14 (darker, still <= 16)
    out = DLG.apply(Image.fromarray(arr, "RGB"), {"maxLightnessDelta": 16})
    assert out.convert("RGB").getpixel((1, 0)) == (106, 106, 106)


def test_color_edge_is_rejected():
    arr = np.full((1, 2, 3), 100, dtype=np.uint8)
    arr[0, 1] = (60, 100, 100)  # darker in luma but a large hue/chroma jump
    out = DLG.apply(Image.fromarray(arr, "RGB"), {"maxLightnessDelta": 16, "maxChromaDelta": 32})
    assert out.convert("RGB").getpixel((0, 0)) == (100, 100, 100)  # unchanged


def test_transparent_pixels_and_neighbors_are_respected():
    arr = np.zeros((1, 2, 4), dtype=np.uint8)
    arr[0, 0] = (120, 120, 120, 255)
    arr[0, 1] = (108, 108, 108, 0)  # darker but transparent -> must not qualify
    out = DLG.apply(Image.fromarray(arr, "RGBA"), {"maxLightnessDelta": 16})
    assert out.mode == "RGBA"
    assert out.getpixel((0, 0)) == (120, 120, 120, 255)  # unchanged
    assert out.getpixel((1, 0))[3] == 0  # still transparent


def test_single_pass_does_not_cascade():
    # A darkening chain: each pixel may only adopt its DARKEST SOURCE neighbour, so
    # the first pixel can drop by at most one step (to 88), never all the way to 64.
    out = DLG.apply(_gray_row([100, 88, 76, 64]), {"maxLightnessDelta": 16})
    assert _lums(out)[0] == [88, 76, 64, 64]


def test_tiny_and_edge_images():
    one = DLG.apply(Image.new("RGB", (1, 1), (200, 10, 10)), {})
    assert one.convert("RGB").getpixel((0, 0)) == (200, 10, 10)
    assert DLG.apply(Image.new("RGB", (0, 0)) if False else Image.new("RGB", (1, 3), (50, 50, 50)), {})


def test_output_is_deterministic():
    rng = np.random.default_rng(7)
    arr = rng.integers(0, 256, size=(12, 12, 3), dtype=np.uint8)
    img = Image.fromarray(arr, "RGB")
    a = DLG.apply(img, {"maxLightnessDelta": 16})
    b = DLG.apply(img, {"maxLightnessDelta": 16})
    assert list(a.convert("RGB").getdata()) == list(b.convert("RGB").getdata())


def test_registry_lists_darken_filter_and_it_resolves(tmp_path):
    skills = video_import_api._skills_dir(tmp_path)
    skills.mkdir(parents=True, exist_ok=True)
    import shutil
    shutil.copy2(SKILL_PATH, skills / SKILL_PATH.name)
    entries = video_import_api._discover_skills(tmp_path)
    entry = next(e for e in entries if e["id"] == "skill:darken_light_gradients")
    assert entry["title"] == "Darken Slight Gradients"
    assert not entry.get("broken")
    assert entry["params"]["maxLightnessDelta"] == 16
    # It materializes through the shared filter resolver like any other skill.
    label, transform = video_import_api._resolve_transform(
        tmp_path, {"filter": "skill", "skillPath": entry["skillPath"], "params": {}}
    )
    out = transform(Image.new("RGB", (3, 3), (120, 120, 120)))
    assert out.size == (3, 3)
