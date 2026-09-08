from __future__ import annotations

import pytest

from omega_vision.perception.observation_identity import (
    build_observation_bundle,
    render_observation_facts,
)


def _bundle(
    *,
    red_alias: str = "r1",
    blue_alias: str = "r2",
    visual_alias: str = "v1",
    symbolic_alias: str = "w1",
    final_alias: str = "g1",
    reverse_source_order: bool = False,
    frame_order: int | None = 3,
    frame_key: str | None = None,
    final_mode: str = "exact_consensus",
) -> dict:
    region_lines = [
        f"region({red_alias}, red, 100, centroid(10,10)).",
        f"region({blue_alias}, blue, 100, centroid(20,10)).",
    ]
    if reverse_source_order:
        region_lines.reverse()
    extraction = "\n".join([
        *region_lines,
        (
            f"vision_group({visual_alias}, connected_component, "
            f"[{blue_alias},{red_alias}], evidence(confidence(0.75)))."
        ),
    ])
    grouping = (
        f"part_group({symbolic_alias}, [{red_alias},{blue_alias}]).\n"
        f"group_area({symbolic_alias}, 200).\n"
    )
    acceptance = (
        f"accepted_group({final_alias}, [{blue_alias},{red_alias}]).\n"
        f"group_acceptance({final_alias}, exact_consensus([{visual_alias}],"
        f"[{symbolic_alias}]), score(1.0)).\n"
    )
    geometry = {
        "width": 40,
        "height": 30,
        "polygons": {
            red_alias.removeprefix("r"): {
                "outer": [[5, 5], [15, 5], [15, 15], [5, 15], [5, 5]],
                "holes": [],
            },
            blue_alias.removeprefix("r"): {
                "outer": [[15, 15], [25, 15], [25, 5], [15, 5], [15, 15]],
                "holes": [],
            },
        },
    }
    return build_observation_bundle(
        frame_alias="frame_000003",
        sequence_id="data/recordings/example",
        frame_order=frame_order,
        image_bytes=b"same deterministic frame",
        extraction_text=extraction,
        grouping_text=grouping,
        acceptance_text=acceptance,
        geometry=geometry,
        accepted_groups=[{
            "id": final_alias,
            "members": [red_alias, blue_alias],
            "mode": final_mode,
            "provenance": {
                "visualGroups": [visual_alias],
                "symbolicGroups": [symbolic_alias],
            },
        }],
        frame_key=frame_key,
    )


def test_observation_uids_ignore_reordered_local_aliases() -> None:
    original = _bundle()
    renamed = _bundle(
        red_alias="r4",
        blue_alias="r9",
        visual_alias="v8",
        symbolic_alias="w3",
        final_alias="g7",
        reverse_source_order=True,
    )

    assert original["frame"]["uid"] == renamed["frame"]["uid"]
    original_regions = {region["color"]: region["uid"] for region in original["regions"]}
    renamed_regions = {region["color"]: region["uid"] for region in renamed["regions"]}
    assert original_regions == renamed_regions
    for kind in ("visual", "symbolic", "final"):
        assert original["groups"][kind][0]["uid"] == renamed["groups"][kind][0]["uid"]
    assert original["aliasIndex"]["final"]["g1"] == renamed["aliasIndex"]["final"]["g7"]


def test_frame_observation_distinguishes_repeated_content_by_sequence_order() -> None:
    first = _bundle(frame_order=3)
    second = _bundle(frame_order=4)

    assert first["artifactHashes"]["image"] == second["artifactHashes"]["image"]
    assert first["frame"]["uid"] != second["frame"]["uid"]


def test_unordered_frame_identity_uses_source_key_not_enumeration_position() -> None:
    first = _bundle(frame_order=None, frame_key="pool/a.png")
    replay = _bundle(frame_order=None, frame_key="pool/a.png")
    other = _bundle(frame_order=None, frame_key="pool/b.png")

    assert first["frame"]["uid"] == replay["frame"]["uid"]
    assert first["frame"]["uid"] != other["frame"]["uid"]


def test_bundle_identity_includes_group_evidence_without_changing_group_uid() -> None:
    exact = _bundle(final_mode="exact_consensus")
    analogy = _bundle(final_mode="symbolic_shape_analogy")

    assert exact["groups"]["final"][0]["uid"] == analogy["groups"]["final"][0]["uid"]
    assert exact["groups"]["final"][0]["evidenceHash"] != analogy["groups"]["final"][0]["evidenceHash"]
    assert exact["bundleUid"] != analogy["bundleUid"]


def test_observation_facts_preserve_truthful_aliases_and_content_ids() -> None:
    bundle = _bundle()
    facts = render_observation_facts(bundle)

    assert f"observation_bundle('{bundle['bundleUid']}'" in facts
    assert f"frame_observation('{bundle['frame']['uid']}'" in facts
    assert "'r1'" in facts
    assert "'v1'" in facts
    assert "'w1'" in facts
    assert "'g1'" in facts
    assert "group_observation(" in facts
    assert "object_at(" not in facts


def test_indistinguishable_regions_fail_instead_of_using_alias_identity() -> None:
    extraction = "\n".join([
        "region(r1, red, 100, centroid(10,10)).",
        "region(r2, red, 100, centroid(10,10)).",
    ])

    with pytest.raises(ValueError, match="indistinguishable region observations"):
        build_observation_bundle(
            frame_alias="frame",
            sequence_id="sequence",
            frame_order=0,
            image_bytes=b"frame",
            extraction_text=extraction,
            grouping_text="",
            acceptance_text="",
            geometry={},
            accepted_groups=[],
        )
