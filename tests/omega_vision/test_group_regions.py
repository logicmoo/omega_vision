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
