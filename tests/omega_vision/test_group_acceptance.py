from __future__ import annotations

from copy import deepcopy
from pathlib import Path
import shutil
import subprocess
import tempfile

from omega_vision.perception.group_acceptance import (
    PIXEL_SHAPE_FALLBACK_THRESHOLD,
    SYMBOLIC_GEOMETRY_TOLERANCE,
    parse_group_acceptance_result,
    prepare_current_frame_group_evidence,
    render_group_acceptance_input,
)

ROOT = Path(__file__).resolve().parents[2]


def _accept(evidence: dict, *, frame_id: str = "frame") -> tuple[dict, dict, str]:
    if shutil.which("swipl") is None:
        raise RuntimeError("SWI-Prolog is required for final group acceptance tests")
    prepared = prepare_current_frame_group_evidence(evidence, frame_id=frame_id)
    with tempfile.TemporaryDirectory() as directory:
        input_path = Path(directory) / "acceptance_input.pl"
        output_path = Path(directory) / "result.pl"
        input_path.write_text(render_group_acceptance_input(prepared), encoding="utf-8")
        rules = ROOT / "prolog" / "omega_vision" / "group_acceptance.pl"
        goal = (
            f"consult('{rules.as_posix()}'),"
            f"consult('{input_path.as_posix()}'),"
            f"write_group_acceptance('{output_path.as_posix()}')"
        )
        process = subprocess.run(
            ["swipl", "-q", "-g", goal, "-t", "halt"],
            capture_output=True,
            text=True,
            timeout=30,
            check=False,
        )
        assert process.returncode == 0, process.stderr or process.stdout
        output = output_path.read_text(encoding="utf-8")
    return parse_group_acceptance_result(output, prepared), prepared, output


def _region(
    region_id: str,
    color: str,
    area: float,
    x: float,
    y: float,
    source_order: int,
) -> dict:
    return {
        "id": region_id,
        "color": color,
        "area": area,
        "centroid": [x, y],
        "sourceOrder": source_order,
    }


def _rectangle(x0: int, y0: int, x1: int, y1: int) -> dict:
    return {
        "outer": [[x0, y0], [x1, y0], [x1, y1], [x0, y1], [x0, y0]],
        "holes": [],
    }


def _evidence(
    regions: list[dict],
    *,
    visual: list[dict] | None = None,
    symbolic: list[dict] | None = None,
    adjacent: set[tuple[str, str]] | None = None,
    shared_edge: set[tuple[str, str]] | None = None,
    encloses: set[tuple[str, str]] | None = None,
    cutout: set[tuple[str, str]] | None = None,
    background: set[str] | None = None,
    polygons: dict[str, dict] | None = None,
) -> dict:
    return {
        "regions": {region["id"]: region for region in regions},
        "visualGroups": visual or [],
        "symbolicGroups": symbolic or [],
        "relations": {
            "adjacent": adjacent or set(),
            "shared_edge": shared_edge or set(),
            "encloses": encloses or set(),
            "cutout": cutout or set(),
        },
        "background": background or set(),
        "geometry": {
            "width": 240,
            "height": 120,
            "polygons": polygons or {},
        },
    }


def test_exact_consensus_deduplicates_hypotheses_and_preserves_provenance() -> None:
    regions = [
        _region("r1", "red", 100, 15, 15, 0),
        _region("r2", "gray", 100, 25, 15, 1),
    ]
    evidence = _evidence(
        regions,
        visual=[
            {"id": "v1", "members": ["r1", "r2"], "sourceOrder": 0, "evidence": {"component": "cc1"}},
            {"id": "v2", "members": ["r2", "r1"], "sourceOrder": 1, "evidence": {"component": "cc2"}},
        ],
        symbolic=[
            {"id": "w1", "members": ["r1", "r2"], "sourceOrder": 0},
            {"id": "w2", "members": ["r2", "r1"], "sourceOrder": 1},
        ],
    )

    result, _, rendered = _accept(evidence, frame_id="frame-a")

    assert len(result["acceptedGroups"]) == 1
    accepted = result["acceptedGroups"][0]
    assert accepted["id"] == "g1"
    assert accepted["members"] == ["r1", "r2"]
    assert accepted["mode"] == "exact_consensus"
    assert accepted["provenance"]["visualGroups"] == ["v1", "v2"]
    assert accepted["provenance"]["symbolicGroups"] == ["w1", "w2"]
    assert [item["id"] for item in accepted["provenance"]["symbolicEvidence"]] == ["w1", "w2"]
    assert "accepted_group(g1, [r1,r2])." in rendered
    assert "exact_consensus([v1,v2],[w1,w2])" in rendered


def test_v_only_and_untemplated_w_groups_are_not_force_accepted() -> None:
    regions = [
        _region("r1", "red", 100, 10, 10, 0),
        _region("r2", "red", 100, 20, 10, 1),
    ]
    v_only, _, _ = _accept(_evidence(
        regions,
        visual=[{"id": "v1", "members": ["r1", "r2"], "sourceOrder": 0}],
    ))
    w_only, _, _ = _accept(_evidence(
        regions,
        symbolic=[{"id": "w1", "members": ["r1", "r2"], "sourceOrder": 0}],
    ))

    assert {group["mode"] for group in v_only["acceptedGroups"]} == {"singleton_remainder"}
    assert {group["mode"] for group in w_only["acceptedGroups"]} == {"singleton_remainder"}
    assert w_only["rejectedSymbolicGroups"][0]["attempts"] == [
        "symbolic_shape_analogy",
        "pixel_shape_fallback",
    ]
    assert w_only["rejectedSymbolicGroups"][0]["reason"] == "no_trusted_template"


def test_overlapping_exact_template_rejection_retains_full_provenance() -> None:
    regions = [
        _region("r1", "red", 100, 10, 10, 0),
        _region("r2", "gray", 100, 20, 10, 1),
        _region("r3", "blue", 100, 30, 10, 2),
    ]
    result, _, output = _accept(_evidence(
        regions,
        visual=[
            {"id": "v1", "members": ["r1", "r2"], "sourceOrder": 0, "evidence": {"component": "cc1"}},
            {"id": "v2", "members": ["r2", "r3"], "sourceOrder": 1, "evidence": {"component": "cc2"}},
        ],
        symbolic=[
            {"id": "w1", "members": ["r1", "r2"], "sourceOrder": 0},
            {"id": "w2", "members": ["r2", "r3"], "sourceOrder": 1},
        ],
    ))

    assert result["acceptedGroups"][0]["members"] == ["r1", "r2"]
    assert result["acceptedGroups"][1]["members"] == ["r3"]
    assert result["rejectedTemplateCandidates"] == [{
        "id": "t2",
        "reason": "exact_overlap_or_background",
        "evidence": {
            "frame": "frame",
            "mode": "exact_consensus",
            "score": 1.0,
            "symbolicEvidence": [{"area": None, "id": "w2", "sourceId": None}],
            "symbolicGroups": ["w2"],
            "visualEvidence": [{"component": "cc2"}],
            "visualGroups": ["v2"],
        },
    }]
    assert "template_rejection(t2, exact_overlap_or_background" in output


def _analogy_evidence() -> dict:
    regions = [
        _region("r1", "red", 100, 10, 10, 0),
        _region("r2", "red", 100, 30, 10, 1),
        _region("r3", "gray", 100, 20, 25, 2),
        _region("r4", "red", 121, 70, 20, 3),
        _region("r5", "red", 121, 92, 20, 4),
        _region("r6", "gray", 121, 81, 36.5, 5),
    ]
    polygons = {
        "1": _rectangle(5, 5, 15, 15),
        "2": _rectangle(25, 5, 35, 15),
        "3": _rectangle(15, 20, 25, 30),
        "4": _rectangle(64, 14, 76, 26),
        "5": _rectangle(86, 14, 98, 26),
        "6": _rectangle(75, 30, 87, 43),
    }
    adjacent = {
        ("r1", "r3"), ("r2", "r3"),
        ("r4", "r6"), ("r5", "r6"),
    }
    return _evidence(
        regions,
        visual=[{"id": "v1", "members": ["r1", "r2", "r3"], "sourceOrder": 0}],
        symbolic=[
            {"id": "w1", "members": ["r1", "r2", "r3"], "sourceOrder": 0},
            {"id": "w2", "members": ["r4", "r5", "r6"], "sourceOrder": 1},
        ],
        adjacent=adjacent,
        shared_edge=set(adjacent),
        polygons=polygons,
    )


def test_symbolic_shape_analogy_precedes_pixel_fallback_and_maps_duplicate_colors() -> None:
    result, _, _ = _accept(_analogy_evidence())

    assert [group["mode"] for group in result["acceptedGroups"]] == [
        "exact_consensus",
        "symbolic_shape_analogy",
    ]
    analogy = result["acceptedGroups"][1]
    assert analogy["provenance"]["attempts"] == ["symbolic_shape_analogy"]
    assert analogy["provenance"]["templateGroup"] == "g1"
    assert analogy["provenance"]["measures"]["error"] <= SYMBOLIC_GEOMETRY_TOLERANCE
    assert analogy["provenance"]["correspondence"] == [
        {"template": "r1", "candidate": "r4"},
        {"template": "r2", "candidate": "r5"},
        {"template": "r3", "candidate": "r6"},
    ]


def test_wrong_color_topology_and_geometry_do_not_pass_symbolic_analogy() -> None:
    wrong_color = _analogy_evidence()
    wrong_color["regions"]["r4"]["color"] = "blue"
    color_result, _, _ = _accept(wrong_color)
    assert "symbolic_shape_analogy" not in {
        group["mode"] for group in color_result["acceptedGroups"]
    }

    wrong_topology = _analogy_evidence()
    wrong_topology["relations"]["adjacent"].discard(("r5", "r6"))
    wrong_topology["relations"]["shared_edge"].discard(("r5", "r6"))
    wrong_topology["geometry"]["polygons"]["4"] = _rectangle(140, 5, 145, 70)
    wrong_topology["geometry"]["polygons"]["5"] = _rectangle(180, 5, 185, 70)
    wrong_topology["geometry"]["polygons"]["6"] = _rectangle(150, 90, 210, 95)
    topology_result, _, _ = _accept(wrong_topology)
    assert all(
        group["mode"] == "singleton_remainder"
        for group in topology_result["acceptedGroups"][1:]
    )

    wrong_geometry = _analogy_evidence()
    wrong_geometry["regions"]["r4"]["centroid"] = [130, 5]
    wrong_geometry["regions"]["r5"]["centroid"] = [132, 90]
    wrong_geometry["regions"]["r6"]["centroid"] = [210, 50]
    wrong_geometry["geometry"]["polygons"]["4"] = _rectangle(128, 3, 132, 7)
    wrong_geometry["geometry"]["polygons"]["5"] = _rectangle(130, 88, 134, 92)
    wrong_geometry["geometry"]["polygons"]["6"] = _rectangle(190, 45, 230, 55)
    geometry_result, _, _ = _accept(wrong_geometry)
    assert all(
        group["mode"] == "singleton_remainder"
        for group in geometry_result["acceptedGroups"][1:]
    )


def _pixel_fallback_evidence(*, duplicate_template: bool = False) -> dict:
    regions = [
        _region("r1", "red", 400, 20, 20, 0),
        _region("r2", "gray", 200, 35, 20, 1),
        _region("r4", "red", 200, 85, 20, 2),
        _region("r5", "red", 200, 95, 20, 3),
        _region("r6", "gray", 200, 105, 20, 4),
    ]
    visual = [{"id": "v1", "members": ["r1", "r2"], "sourceOrder": 0}]
    symbolic = [
        {"id": "w1", "members": ["r1", "r2"], "sourceOrder": 0},
        {"id": "w2", "members": ["r4", "r5", "r6"], "sourceOrder": 1},
    ]
    polygons = {
        "1": _rectangle(10, 10, 30, 30),
        "2": _rectangle(30, 10, 40, 30),
        "4": _rectangle(80, 10, 90, 30),
        "5": _rectangle(90, 10, 100, 30),
        "6": _rectangle(100, 10, 110, 30),
    }
    if duplicate_template:
        regions.extend([
            _region("r7", "red", 400, 150, 20, 5),
            _region("r8", "gray", 200, 165, 20, 6),
        ])
        visual.append({"id": "v2", "members": ["r7", "r8"], "sourceOrder": 1})
        symbolic.insert(1, {"id": "w3", "members": ["r7", "r8"], "sourceOrder": 1})
        polygons["7"] = _rectangle(140, 10, 160, 30)
        polygons["8"] = _rectangle(160, 10, 170, 30)
    return _evidence(
        regions,
        visual=visual,
        symbolic=symbolic,
        polygons=polygons,
    )


def test_pixel_fallback_runs_only_after_a_failure_and_accepts_partition_variation() -> None:
    result, _, _ = _accept(_pixel_fallback_evidence())

    fallback = next(
        group for group in result["acceptedGroups"]
        if group["mode"] == "pixel_shape_fallback"
    )
    assert fallback["members"] == ["r4", "r5", "r6"]
    assert fallback["provenance"]["attempts"] == [
        "symbolic_shape_analogy",
        "pixel_shape_fallback",
    ]
    assert fallback["provenance"]["score"] >= PIXEL_SHAPE_FALLBACK_THRESHOLD
    assert fallback["provenance"]["templateGroup"] == "g1"


def test_pixel_fallback_rejects_ambiguous_and_poor_matches() -> None:
    ambiguous, _, _ = _accept(_pixel_fallback_evidence(duplicate_template=True))
    assert not any(
        group["mode"] == "pixel_shape_fallback"
        for group in ambiguous["acceptedGroups"]
    )
    assert any(
        rejected["reason"] == "ambiguous"
        for rejected in ambiguous["rejectedSymbolicGroups"]
    )

    poor = _pixel_fallback_evidence()
    poor["geometry"]["polygons"]["4"] = _rectangle(80, 5, 84, 50)
    poor["geometry"]["polygons"]["5"] = _rectangle(95, 5, 99, 50)
    poor["geometry"]["polygons"]["6"] = _rectangle(110, 5, 114, 50)
    poor_result, _, _ = _accept(poor)
    assert not any(
        group["mode"] == "pixel_shape_fallback"
        for group in poor_result["acceptedGroups"]
    )


def test_singleton_remainder_covers_foreground_once_and_excludes_background() -> None:
    regions = [
        _region("r1", "red", 100, 10, 10, 0),
        _region("r2", "blue", 100, 20, 10, 1),
        _region("r3", "black", 1000, 30, 10, 2),
    ]
    result, prepared, _ = _accept(_evidence(
        regions,
        symbolic=[{"id": "w1", "members": ["r1", "r2"], "sourceOrder": 0}],
        background={"r3"},
    ))

    assert [group["members"] for group in result["acceptedGroups"]] == [["r1"], ["r2"]]
    assert all(group["mode"] == "singleton_remainder" for group in result["acceptedGroups"])
    flattened = [member for group in result["acceptedGroups"] for member in group["members"]]
    assert flattened == ["r1", "r2"]
    assert "r3" not in flattened
    assert prepared["background"] == ["r3"]
    assert result["rejectedSymbolicGroups"][0]["members"] == ["r1", "r2"]


def test_templates_are_never_reused_from_an_earlier_frame() -> None:
    first, first_prepared, _ = _accept(_pixel_fallback_evidence(), frame_id="frame-1")
    assert first_prepared["templateCandidates"][0]["id"] == "t1"
    assert any(group["mode"] == "exact_consensus" for group in first["acceptedGroups"])

    second_evidence = deepcopy(_pixel_fallback_evidence())
    second_evidence["visualGroups"] = []
    second_evidence["symbolicGroups"] = [
        {"id": "w2", "members": ["r4", "r5", "r6"], "sourceOrder": 0},
    ]
    second, second_prepared, _ = _accept(second_evidence, frame_id="frame-2")

    assert second_prepared["templateCandidates"] == []
    assert {group["mode"] for group in second["acceptedGroups"]} == {"singleton_remainder"}


def test_python_emits_measurements_but_not_acceptance_decisions() -> None:
    prepared = prepare_current_frame_group_evidence(_pixel_fallback_evidence())
    measurement_facts = render_group_acceptance_input(prepared)

    assert "exact_template_candidate(" in measurement_facts
    assert "symbolic_shape_measure(" in measurement_facts
    assert "pixel_shape_measure(" in measurement_facts
    assert "accepted_group(" not in measurement_facts
    assert "group_acceptance(" not in measurement_facts
