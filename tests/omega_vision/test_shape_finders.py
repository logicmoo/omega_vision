"""All three parts_extraction_0 doers (python_scikit, python_opencv,
shape_finder_prolog) must find shapes and emit the same fact schema:
OUTER EDGE (polygon/2), INNER EDGES (hole/2), INNER MEDIALS (midline/2)."""
from __future__ import annotations

import shutil
import subprocess
import sys
from pathlib import Path

import pytest
from PIL import Image, ImageDraw

ROOT = Path(__file__).resolve().parents[2]
LS20_SMALL_MARK_CROP = Path(__file__).parent / "fixtures" / "ls20_frame000000_small_mark_crop.png"
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


def _assert_opencv_grouping_contract(prolog_text: str) -> None:
    for predicate in (
        "opencv_background_candidate(",
        "opencv_component(",
        "opencv_component_area(",
        "opencv_component_centroid(",
        "opencv_contour(",
        "opencv_contour_hierarchy(",
        "opencv_morphology(",
        "opencv_shape_metrics(",
        "opencv_watershed_count(",
        "opencv_watershed_segment(",
        "vision_group(",
    ):
        assert predicate in prolog_text, f"missing {predicate}"


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
    _assert_opencv_grouping_contract(facts["prolog"])
    assert facts["regionCount"] >= 3
    assert facts["componentCount"] >= 2
    assert facts["visualGroupCount"] == facts["componentCount"]
    assert [group["id"] for group in facts["visualGroups"]] == [
        f"v{index}" for index in range(1, facts["visualGroupCount"] + 1)
    ]
    assert all(group["method"] == "connected_component" for group in facts["visualGroups"])
    assert all(group["members"] for group in facts["visualGroups"])
    assert all(
        {
            "component",
            "pixelArea",
            "centroid",
            "contourCount",
            "hierarchyLinkCount",
            "watershedSegmentCount",
        } <= group["evidence"].keys()
        for group in facts["visualGroups"]
    )
    assert facts["contourCount"] >= facts["regionCount"]
    assert facts["watershedSegmentCount"] >= 2
    # the hole in the blue rectangle must be reported as an inner edge
    blue = [p for p in facts["parts"] if p["holes"] >= 1]
    assert blue, "no part carries an inner edge"


def test_opencv_visual_group_hypotheses_are_replayably_deterministic(
    shapes_image: Path,
    tmp_path: Path,
) -> None:
    pytest.importorskip("cv2")
    from omega_vision.perception.pixels_to_regions_cv import extract_region_facts_cv

    first = extract_region_facts_cv(shapes_image, tolerance=24, max_dim=200)
    second = extract_region_facts_cv(shapes_image, tolerance=24, max_dim=200)

    assert first["visualGroups"] == second["visualGroups"]
    first_facts = [
        line for line in first["prolog"].splitlines()
        if line.startswith("vision_group(")
    ]
    second_facts = [
        line for line in second["prolog"].splitlines()
        if line.startswith("vision_group(")
    ]
    assert first_facts == second_facts
    assert len(first_facts) == first["visualGroupCount"]
    assert not (tmp_path / "debug_image.png").exists()


def test_opencv_preserves_real_ls20_small_contrast_mark() -> None:
    pytest.importorskip("cv2")
    from omega_vision.perception.pixels_to_regions_cv import extract_region_facts_cv

    filtered = extract_region_facts_cv(
        LS20_SMALL_MARK_CROP,
        minfrac=0.03,
        small_feature_floor=201,
    )
    recovered = extract_region_facts_cv(
        LS20_SMALL_MARK_CROP,
        minfrac=0.03,
        small_feature_floor=16,
    )

    assert filtered["minArea"] == recovered["minArea"] == 330
    assert all(part["color"] != "#0074d9" for part in filtered["parts"])
    mark = next(part for part in recovered["parts"] if part["color"] == "#0074d9")
    assert (mark["id"], mark["area"], mark["smallFeature"]) == ("r4", 200, True)
    evidence = mark["smallFeatureEvidence"]
    host = next(part for part in recovered["parts"] if part["id"] == f"r{evidence['host']}")
    assert f"opencv_background_candidate({host['id']})." not in recovered["prolog"]
    assert host["area"] >= 4 * mark["area"]
    assert evidence["sharedEdge"] / evidence["perimeter"] >= 0.25
    assert evidence["minContrast"] == 153
    assert evidence["bboxFill"] == 1.0
    assert recovered["smallFeatures"][0]["pixelRuns"] == [
        [y, 30, 49] for y in range(70, 80)
    ]
    assert "region(r4, '#0074d9', 200, centroid(40,74))." in recovered["prolog"]
    assert "opencv_small_feature(r4, host(" in recovered["prolog"]
    assert "opencv_small_feature_pixel_run(r4, 70, 30, 49)." in recovered["prolog"]
    assert any("r4" in group["members"] for group in recovered["visualGroups"])


def test_opencv_small_feature_rule_rejects_speckles_and_thin_noise(
    tmp_path: Path,
) -> None:
    pytest.importorskip("cv2")
    from omega_vision.perception.pixels_to_regions_cv import extract_region_facts_cv

    image = Image.new("RGB", (120, 120), (170, 170, 170))
    draw = ImageDraw.Draw(image)
    draw.rectangle([20, 20, 99, 99], fill=(46, 204, 64))
    for point in ((40, 40), (45, 50), (70, 75), (105, 20), (110, 40)):
        draw.point(point, fill=(0, 116, 217))
    draw.line([5, 110, 24, 110], fill=(0, 116, 217), width=1)
    path = tmp_path / "speckles.png"
    image.save(path)

    facts = extract_region_facts_cv(path, minfrac=0.02)

    assert facts["minArea"] == 288
    assert facts["smallFeatureCount"] == 0
    assert {part["color"] for part in facts["parts"]} == {"#aaaaaa", "#2ecc40"}
    assert "opencv_small_feature(" not in "\n".join(
        line
        for line in facts["prolog"].splitlines()
        if not line.startswith((":- dynamic", ":- discontiguous"))
    )


def test_opencv_small_feature_rule_excludes_every_exterior_background(
    tmp_path: Path,
) -> None:
    pytest.importorskip("cv2")
    from omega_vision.perception.pixels_to_regions_cv import extract_region_facts_cv

    image = Image.new("RGB", (120, 120), (170, 170, 170))
    draw = ImageDraw.Draw(image)
    draw.rectangle([0, 0, 59, 119], fill=(190, 20, 40))
    draw.rectangle([55, 50, 64, 69], fill=(0, 116, 217))
    path = tmp_path / "two_exteriors.png"
    image.save(path)

    facts = extract_region_facts_cv(path, minfrac=0.03)
    background_facts = [
        line
        for line in facts["prolog"].splitlines()
        if line.startswith("opencv_background_candidate(")
    ]

    assert len(background_facts) == 2
    assert facts["smallFeatureCount"] == 0
    assert all(part["color"] != "#0074d9" for part in facts["parts"])


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
def test_opencv_grouping_facts_are_valid_prolog(
    shapes_image: Path,
    tmp_path: Path,
) -> None:
    pytest.importorskip("cv2")
    from omega_vision.perception.pixels_to_regions_cv import extract_region_facts_cv

    facts = extract_region_facts_cv(shapes_image, tolerance=24, max_dim=200)
    facts_path = tmp_path / "opencv_facts.pl"
    facts_path.write_text(facts["prolog"], encoding="utf-8")
    result = subprocess.run(
        ["swipl", "-q", "-g", f"consult('{facts_path.as_posix()}')", "-t", "halt"],
        capture_output=True,
        text=True,
        timeout=30,
        check=False,
    )
    assert result.returncode == 0, result.stderr or result.stdout
    assert "Warning:" not in result.stderr


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
