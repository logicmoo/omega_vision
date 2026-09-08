from __future__ import annotations

import shutil
import subprocess
from pathlib import Path

import pytest

ROOT = Path(__file__).resolve().parents[2]
RULES = ROOT / "prolog" / "omega_vision" / "group_regions.pl"


def _group_facts(tmp_path: Path, facts: str) -> str:
    facts_path = tmp_path / "regions.pl"
    output_path = tmp_path / "groups.pl"
    facts_path.write_text(facts, encoding="utf-8")
    goal = "consult('{}'), consult('{}'), write_groups('{}')".format(
        RULES.as_posix(), facts_path.as_posix(), output_path.as_posix()
    )
    result = subprocess.run(
        ["swipl", "-q", "-g", goal, "-t", "halt"],
        capture_output=True,
        text=True,
        timeout=30,
        check=False,
    )
    assert result.returncode == 0, result.stderr or result.stdout
    return output_path.read_text(encoding="utf-8")


@pytest.mark.skipif(shutil.which("swipl") is None, reason="swipl not on PATH")
def test_large_dominant_color_mass_does_not_bridge_attached_parts(
    tmp_path: Path,
) -> None:
    grouped = _group_facts(
        tmp_path,
        """
:- dynamic region/4, shared_edge/3, encloses/2, border/1, img_size/2.
img_size(100, 100).
region(mass, green, 6500, centroid(50, 50)).
region(detail, gray, 900, centroid(25, 25)).
region(accent_a, red, 400, centroid(20, 20)).
region(accent_b, red, 300, centroid(30, 20)).
region(marker, yellow, 500, centroid(75, 75)).
shared_edge(mass, detail, 20).
shared_edge(mass, marker, 20).
shared_edge(detail, accent_a, 20).
shared_edge(detail, accent_b, 20).
""",
    )

    assert "part_group(g1, [mass])." in grouped
    assert "part_group(g2, [accent_a,accent_b,detail])." in grouped
    assert "part_group(g3, [marker])." in grouped


@pytest.mark.skipif(shutil.which("swipl") is None, reason="swipl not on PATH")
def test_small_dominant_color_region_stays_with_its_attached_detail(
    tmp_path: Path,
) -> None:
    grouped = _group_facts(
        tmp_path,
        """
:- dynamic region/4, shared_edge/3, encloses/2, border/1, img_size/2.
img_size(1000, 1000).
region(mass, green, 1600, centroid(50, 50)).
region(detail, red, 400, centroid(55, 50)).
shared_edge(mass, detail, 20).
""",
    )

    assert "part_group(g1, [detail,mass])." in grouped
    assert "part_group(g2," not in grouped


@pytest.mark.skipif(shutil.which("swipl") is None, reason="swipl not on PATH")
def test_matching_color_region_in_exposed_cutout_belongs_to_background(
    tmp_path: Path,
) -> None:
    grouped = _group_facts(
        tmp_path,
        """
:- dynamic region/4, adjacent/2, encloses/2, border/1, img_size/2, hole/2.
img_size(100, 100).
region(exterior, blue, 5000, centroid(50, 50)).
region(shell, red, 1000, centroid(30, 30)).
region(cutout, blue, 100, centroid(30, 30)).
border(exterior).
adjacent(exterior, shell).
encloses(shell, cutout).
hole(shell, [xy(20,20),xy(40,20),xy(40,40),xy(20,40),xy(20,20)]).
""",
    )

    assert "background(exterior)." in grouped
    assert "background(cutout)." in grouped
    assert "part_group(g1, [shell])." in grouped
    assert "part_group(g2," not in grouped
    assert "detachable(cutout)." not in grouped


@pytest.mark.skipif(shutil.which("swipl") is None, reason="swipl not on PATH")
def test_only_matching_color_region_in_shared_cutout_becomes_background(
    tmp_path: Path,
) -> None:
    grouped = _group_facts(
        tmp_path,
        """
:- dynamic region/4, adjacent/2, encloses/2, border/1, img_size/2, hole/2.
img_size(200, 200).
region(exterior, yellow, 25000, centroid(100, 100)).
region(shell, green, 1000, centroid(60, 60)).
region(yellow_fill, yellow, 100, centroid(50, 50)).
region(red_item, red, 100, centroid(55, 50)).
region(blue_item, blue, 100, centroid(60, 50)).
border(exterior).
adjacent(exterior, shell).
encloses(shell, yellow_fill).
encloses(shell, red_item).
encloses(shell, blue_item).
hole(shell, [xy(20,20),xy(80,20),xy(80,80),xy(20,80),xy(20,20)]).
""",
    )

    assert "background(exterior)." in grouped
    assert "background(yellow_fill)." in grouped
    assert "background(red_item)." not in grouped
    assert "background(blue_item)." not in grouped
    assert "part_group(g1, [blue_item,red_item,shell])." in grouped
    assert "yellow_fill" not in "\n".join(
        line for line in grouped.splitlines() if line.startswith("part_group(")
    )
    assert "detachable(yellow_fill)." not in grouped
    assert "detachable(red_item)." in grouped
    assert "detachable(blue_item)." in grouped


@pytest.mark.skipif(shutil.which("swipl") is None, reason="swipl not on PATH")
@pytest.mark.parametrize(
    ("touches_background", "cutout_color"),
    [(False, "blue"), (True, "green")],
)
def test_cutout_region_requires_background_touch_and_matching_color(
    tmp_path: Path,
    touches_background: bool,
    cutout_color: str,
) -> None:
    adjacency = "adjacent(exterior, shell)." if touches_background else ""
    grouped = _group_facts(
        tmp_path,
        f"""
:- dynamic region/4, adjacent/2, encloses/2, border/1, img_size/2, hole/2.
img_size(100, 100).
region(exterior, blue, 5000, centroid(50, 50)).
region(shell, red, 1000, centroid(30, 30)).
region(cutout, {cutout_color}, 100, centroid(30, 30)).
border(exterior).
{adjacency}
encloses(shell, cutout).
hole(shell, [xy(20,20),xy(40,20),xy(40,40),xy(20,40),xy(20,20)]).
""",
    )

    assert "background(exterior)." in grouped
    assert "background(cutout)." not in grouped
    assert "part_group(g1, [shell])." in grouped
    assert "part_group(g2, [cutout])." in grouped
    assert "detachable(cutout)." in grouped
