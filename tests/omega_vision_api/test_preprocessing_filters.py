from __future__ import annotations

from pathlib import Path

from PIL import Image

from omega_vision.services import video_import_api


def test_scale_3x_nearest_is_registered_as_a_deterministic_builtin():
    entry = next(
        (f for f in video_import_api._BUILTIN_FILTERS if f["id"] == "scale_3x_nearest"),
        None,
    )
    assert entry is not None
    assert entry["filter"] == "scale_3x_nearest"
    assert entry.get("deterministic") is True
    assert entry.get("params") == {}


def test_scale_3x_nearest_upscales_every_pixel_into_an_exact_3x3_block():
    src = Image.new("RGB", (2, 2))
    colors = {(0, 0): (10, 20, 30), (1, 0): (40, 50, 60),
              (0, 1): (70, 80, 90), (1, 1): (100, 110, 120)}
    for (x, y), rgb in colors.items():
        src.putpixel((x, y), rgb)

    out = video_import_api._apply_prepass_filter(src, "scale_3x_nearest", 8, 8)

    assert out.size == (6, 6)  # 2x2 -> 6x6
    out_rgb = out.convert("RGB")
    for (x, y), rgb in colors.items():
        for dx in range(3):
            for dy in range(3):
                assert out_rgb.getpixel((x * 3 + dx, y * 3 + dy)) == rgb
    # Original image is untouched (byte-for-byte pixel identity preserved).
    for (x, y), rgb in colors.items():
        assert src.getpixel((x, y)) == rgb


def test_resolve_transform_builds_deterministic_3x_transform(tmp_path: Path):
    label, transform = video_import_api._resolve_transform(tmp_path, {"filter": "scale_3x_nearest"})
    assert label == "scale_3x_nearest"
    src = Image.new("RGB", (4, 3), (5, 6, 7))
    out = transform(src.convert("RGB"))
    assert out.size == (12, 9)
    # Deterministic: same input yields identical bytes across runs.
    again = transform(src.convert("RGB"))
    assert list(out.convert("RGB").getdata()) == list(again.convert("RGB").getdata())


def test_denoise_filters_already_exist_in_the_registry(tmp_path: Path):
    # DeNoise is provided by the existing skimage_effects skill, not re-added.
    skill = (
        Path(video_import_api.__file__).resolve().parents[3]
        / "data" / "omega_vision" / "video_import" / "filter_skills" / "skimage_effects.py"
    )
    text = skill.read_text(encoding="utf-8") if skill.is_file() else ""
    assert "denoise_tv_light" in text
