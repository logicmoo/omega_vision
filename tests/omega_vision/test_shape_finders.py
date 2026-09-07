"""All three parts_extraction_0 doers (python_scikit, python_opencv,
shape_finder_prolog) must find shapes and emit the same fact schema:
OUTER EDGE (polygon/2), INNER EDGES (hole/2), INNER MEDIALS (midline/2)."""
from __future__ import annotations

import shutil
import sys
from pathlib import Path

import pytest
from PIL import Image, ImageDraw

ROOT = Path(__file__).resolve().parents[2]
for entry in (ROOT / "python", ROOT / "python" / "workbench_api_server"):
    if str(entry) not in sys.path:
        sys.path.insert(0, str(entry))


@pytest.fixture()
def shapes_image(tmp_path: Path) -> Path:
    """White canvas, blue rectangle with a punched hole, red bar: exercises
    outer edges, an inner edge, and elongated + compact medials."""
    img = Image.new("RGB", (120, 120), "white")
    draw = ImageDraw.Draw(img)
    draw.rectangle([20, 20, 70, 90], fill=(20, 40, 200))
    draw.rectangle([35, 40, 55, 60], fill="white")  # inner edge (hole)
    draw.rectangle([85, 15, 100, 110], fill=(200, 30, 30))  # bar with a long medial
    path = tmp_path / "shapes.png"
    img.save(path)
    return path


def _assert_full_contract(prolog_text: str) -> None:
    assert "polygon(" in prolog_text, "missing outer edges"
    assert "hole(" in prolog_text, "missing inner edges"
    assert "midline(" in prolog_text, "missing inner medials"


def test_scikit_finder_outputs_outer_inner_and_medials(shapes_image: Path) -> None:
    from omega_vision.perception.pixels_to_regions import extract_region_facts

    facts = extract_region_facts(shapes_image, tolerance=24, max_dim=200)
    _assert_full_contract(facts["prolog"])
    assert facts["regionCount"] >= 3


def test_opencv_finder_outputs_outer_inner_and_medials(shapes_image: Path) -> None:
    pytest.importorskip("cv2")
    from omega_vision.perception.pixels_to_regions_cv import extract_region_facts_cv

    facts = extract_region_facts_cv(shapes_image, tolerance=24, max_dim=200)
    _assert_full_contract(facts["prolog"])
    assert facts["regionCount"] >= 3
    # the hole in the blue rectangle must be reported as an inner edge
    blue = [p for p in facts["parts"] if p["holes"] >= 1]
    assert blue, "no part carries an inner edge"


def test_opencv_and_scikit_agree_on_region_topology(shapes_image: Path) -> None:
    pytest.importorskip("cv2")
    from omega_vision.perception.pixels_to_regions import extract_region_facts
    from omega_vision.perception.pixels_to_regions_cv import extract_region_facts_cv

    sk = extract_region_facts(shapes_image, tolerance=24, max_dim=200)
    cv = extract_region_facts_cv(shapes_image, tolerance=24, max_dim=200)
    # same segmentation feeds both, so parts and adjacency counts match
    assert cv["regionCount"] == sk["regionCount"]
    assert cv["adjacencyCount"] == sk["adjacencyCount"]
    sk_holes = sum(p["holes"] for p in sk["parts"])
    cv_holes = sum(p["holes"] for p in cv["parts"])
    # contour tracing semantics differ slightly between the two libraries;
    # both must SEE inner edges and land within one ring of each other
    assert sk_holes >= 1 and cv_holes >= 1
    assert abs(cv_holes - sk_holes) <= 1


@pytest.mark.skipif(shutil.which("swipl") is None, reason="swipl not on PATH")
def test_prolog_shape_finder_outputs_outer_inner_and_medials(shapes_image: Path, tmp_path: Path) -> None:
    from omega_vision.services.video_import_api import _transform_parts_extraction_prolog

    out_dir = tmp_path / "out"
    out_dir.mkdir()
    unit = {"id": "shapes", "dir": tmp_path, "image": shapes_image}
    stats = _transform_parts_extraction_prolog(unit, out_dir, {"maxDim": 64, "colors": 6, "timeout": 300})
    text = (out_dir / "result.pl").read_text(encoding="utf-8")
    _assert_full_contract(text)
    assert stats["regionCount"] >= 3
    assert stats["holeCount"] >= 1
    assert stats["midlineCount"] >= 1
