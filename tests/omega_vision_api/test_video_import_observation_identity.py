from __future__ import annotations

from hashlib import sha256
import json
from pathlib import Path

from PIL import Image

from omega_vision.services import video_import_api


def _write_final_group_fixture(unit_dir: Path) -> None:
    extraction = unit_dir / "parts_extraction_0" / "python_opencv"
    grouping = unit_dir / "parts_grouping_0" / "group_regions_prolog"
    acceptance = unit_dir / "group_acceptance_0" / "group_acceptance_prolog"
    extraction.mkdir(parents=True)
    grouping.mkdir(parents=True)
    acceptance.mkdir(parents=True)
    Image.new("RGB", (40, 30), "white").save(unit_dir / "image.png")
    (extraction / "result.pl").write_text(
        "\n".join([
            "region(r1, red, 100, centroid(10,10)).",
            "region(r2, blue, 100, centroid(20,10)).",
            "vision_group(v1, connected_component, [r1,r2], evidence(confidence(0.75))).",
        ]) + "\n",
        encoding="utf-8",
    )
    (extraction / "geometry.json").write_text(json.dumps({
        "width": 40,
        "height": 30,
        "polygons": {
            "1": {"outer": [[5, 5], [15, 5], [15, 15], [5, 15]], "holes": []},
            "2": {"outer": [[15, 5], [25, 5], [25, 15], [15, 15]], "holes": []},
        },
    }), encoding="utf-8")
    (extraction / "meta.json").write_text(json.dumps({
        "visualGroups": [{
            "id": "v1",
            "method": "connected_component",
            "members": ["r1", "r2"],
            "confidence": 0.75,
        }],
    }), encoding="utf-8")
    (grouping / "result.pl").write_text(
        "part_group(w1, [r1,r2]).\ngroup_area(w1, 200).\n",
        encoding="utf-8",
    )
    (grouping / "meta.json").write_text('{"groupCount":1}', encoding="utf-8")
    (acceptance / "result.pl").write_text(
        "accepted_group(g1, [r1,r2]).\n"
        "group_acceptance(g1, exact_consensus([v1],[w1]), score(1.0)).\n",
        encoding="utf-8",
    )
    (acceptance / "meta.json").write_text(json.dumps({
        "acceptedGroupCount": 1,
        "acceptedGroups": [{
            "id": "g1",
            "members": ["r1", "r2"],
            "mode": "exact_consensus",
            "provenance": {
                "visualGroups": ["v1"],
                "symbolicGroups": ["w1"],
            },
        }],
    }), encoding="utf-8")


def test_observation_identity_transform_is_replayable_and_creates_no_image(
    tmp_path: Path,
) -> None:
    unit_dir = tmp_path / "frame_000003"
    _write_final_group_fixture(unit_dir)
    unit = {
        "id": "frame_000003",
        "dir": unit_dir,
        "image": unit_dir / "image.png",
        "sequenceId": "data/recordings/example",
        "frameOrder": 3,
        "frameSourceKey": "frame_000003/image.png",
        "sequenceOrdered": True,
    }
    first = unit_dir / "observation_identity_0" / "content_hash"
    second = unit_dir / "observation_identity_replay"
    first.mkdir(parents=True)
    second.mkdir(parents=True)

    first_stats = video_import_api._transform_observation_identity(unit, first, {})
    second_stats = video_import_api._transform_observation_identity(unit, second, {})

    assert first_stats["observationBundleId"] == second_stats["observationBundleId"]
    assert first_stats["frameObservationId"] == second_stats["frameObservationId"]
    assert first_stats["regionObservationCount"] == 2
    assert first_stats["visualGroupObservationCount"] == 1
    assert first_stats["symbolicGroupObservationCount"] == 1
    assert first_stats["finalGroupObservationCount"] == 1
    bundle = json.loads((first / "observations.json").read_text(encoding="utf-8"))
    geometry_file = unit_dir / "parts_extraction_0" / "python_opencv" / "geometry.json"
    assert bundle["artifactHashes"]["geometry"] == sha256(geometry_file.read_bytes()).hexdigest()
    assert (first / "observations.json").read_bytes() == (second / "observations.json").read_bytes()
    assert (first / "result.pl").read_bytes() == (second / "result.pl").read_bytes()
    assert not (first / "debug_image.png").exists()
    assert "object_at(" not in (first / "result.pl").read_text(encoding="utf-8")


def test_extraction_manifest_exposes_persisted_geometry(tmp_path: Path) -> None:
    unit_dir = tmp_path / "frame"
    _write_final_group_fixture(unit_dir)
    (unit_dir / "todos.json").write_text(json.dumps({
        "kind": "transformation_todos",
        "todos": [{
            "transformation": "parts_extraction_0",
            "doer": "python_opencv",
            "output": "parts_extraction_0/python_opencv",
            "status": "done",
            "dependsOn": [],
        }],
    }), encoding="utf-8")

    summary = video_import_api._unit_transforms(tmp_path, unit_dir)

    assert summary is not None
    assert summary["list"][0]["geometryPath"].endswith(
        "parts_extraction_0/python_opencv/geometry.json"
    )
    assert summary["list"][0]["geometryRevision"]


def test_transform_manifest_preserves_started_and_error_details(tmp_path: Path) -> None:
    unit_dir = tmp_path / "frame"
    unit_dir.mkdir()
    (unit_dir / "todos.json").write_text(json.dumps({
        "kind": "transformation_todos",
        "todos": [
            {
                "transformation": "group_acceptance_0",
                "doer": "group_acceptance_prolog",
                "output": "group_acceptance_0/group_acceptance_prolog",
                "status": "error",
                "error": "invalid acceptance evidence",
                "erroredAt": "2026-09-09T00:00:00Z",
                "dependsOn": [],
            },
            {
                "transformation": "observation_identity_0",
                "doer": "content_hash",
                "output": "observation_identity_0/content_hash",
                "status": "started",
                "startedBy": "worker-1",
                "startedAt": "2026-09-09T00:01:00Z",
                "dependsOn": [],
            },
        ],
    }), encoding="utf-8")

    summary = video_import_api._unit_transforms(tmp_path, unit_dir)

    assert summary is not None
    acceptance, observations = summary["list"]
    assert acceptance["error"] == "invalid acceptance evidence"
    assert acceptance["erroredAt"] == "2026-09-09T00:00:00Z"
    assert observations["status"] == "started"
    assert observations["claimedBy"] == "worker-1"
    assert observations["startedAt"] == "2026-09-09T00:01:00Z"


def test_observation_identity_metadata_is_visible_in_transform_manifest(
    tmp_path: Path,
) -> None:
    unit_dir = tmp_path / "data" / "omega_vision" / "recordings" / "frame_000003"
    _write_final_group_fixture(unit_dir)
    unit = {
        "id": "frame_000003",
        "dir": unit_dir,
        "workspaceRoot": tmp_path,
        "image": unit_dir / "image.png",
        "sequenceId": "data/recordings/example",
        "frameOrder": 3,
        "frameSourceKey": "frame_000003/image.png",
        "sequenceOrdered": True,
    }
    spec = {
        "transformation": "observation_identity_0",
        "doer": "content_hash",
        "options": {},
        "priority": 37,
        "type": "py_pl",
        "dependsOn": [
            "parts_extraction_0/python_opencv",
            "parts_grouping_0/group_regions_prolog",
            "group_acceptance_0/group_acceptance_prolog",
        ],
    }

    result = video_import_api.run_transform_step(
        unit,
        spec["transformation"],
        spec["doer"],
        {},
        depends_on=spec["dependsOn"],
    )
    video_import_api.write_unit_todos(unit, [spec], [result])
    summary = video_import_api._unit_transforms(tmp_path, unit_dir)
    todo_payload = json.loads((unit_dir / "todos.json").read_text(encoding="utf-8"))

    assert result["status"] == "written"
    assert result["observationCount"] == 6
    assert summary is not None
    cell = summary["list"][0]
    assert cell["summary"]["observationCount"] == 6
    assert cell["summary"]["regionObservationCount"] == 2
    assert cell["summary"]["finalGroupObservationCount"] == 1
    assert cell["resultPath"].endswith(
        "observation_identity_0/content_hash/result.pl"
    )
    assert todo_payload["sequenceId"] == "data/recordings/example"
    assert todo_payload["frameOrder"] == 3
    assert todo_payload["frameSourceKey"] == "frame_000003/image.png"
    assert todo_payload["sequenceOrdered"] is True


def test_unordered_transform_ignores_enumeration_position(tmp_path: Path) -> None:
    unit_dir = tmp_path / "frame"
    _write_final_group_fixture(unit_dir)
    base_unit = {
        "id": "local_alias",
        "dir": unit_dir,
        "image": unit_dir / "image.png",
        "sequenceId": "data/unordered/images",
        "frameSourceKey": "pool/source.png",
        "sequenceOrdered": False,
    }
    first_dir = unit_dir / "identity_first"
    second_dir = unit_dir / "identity_second"
    first_dir.mkdir()
    second_dir.mkdir()

    first = video_import_api._transform_observation_identity(
        {**base_unit, "frameOrder": 2},
        first_dir,
        {},
    )
    second = video_import_api._transform_observation_identity(
        {**base_unit, "frameOrder": 99},
        second_dir,
        {},
    )

    assert first["frameObservationId"] == second["frameObservationId"]


def test_exact_final_group_pipeline_migrates_to_observation_identity(
    tmp_path: Path,
) -> None:
    template = video_import_api._safe_workspace_child(tmp_path, video_import_api._PIPELINE_TEMPLATE_REL)
    template.parent.mkdir(parents=True)
    previous = video_import_api._PRE_OBSERVATION_DEFAULT_PIPELINE_TEMPLATE
    template.write_text(json.dumps({"pipeline": previous}), encoding="utf-8")

    upgraded = video_import_api.load_pipeline_template(tmp_path)

    observation = next(
        step
        for step in upgraded
        if step["transformation"] == "observation_identity_0"
    )
    assert observation["doer"] == "content_hash"
    assert observation["dependsOn"] == [
        "parts_extraction_0/python_opencv",
        "parts_grouping_0/group_regions_prolog",
        "group_acceptance_0/group_acceptance_prolog",
    ]


def test_exact_observation_pipeline_migrates_debug_after_turtle(
    tmp_path: Path,
) -> None:
    template = video_import_api._safe_workspace_child(tmp_path, video_import_api._PIPELINE_TEMPLATE_REL)
    template.parent.mkdir(parents=True)
    previous = video_import_api._PRE_DEBUG_LAST_DEFAULT_PIPELINE_TEMPLATE
    template.write_text(json.dumps({"pipeline": previous}), encoding="utf-8")

    upgraded = video_import_api.load_pipeline_template(tmp_path)

    assert [step["transformation"] for step in upgraded][-2:] == [
        "turtle_programs",
        "parts_debug_0",
    ]
    debug = upgraded[-1]
    assert debug["doer"] == "python_pil"
    assert debug["priority"] == 50
    assert debug["dependsOn"] == [
        "parts_extraction_0/python_opencv",
        "turtle_programs/turtle_programs_prolog",
    ]
    assert sum(
        step["transformation"] == "parts_debug_0"
        for step in upgraded
    ) == 1


def test_typed_legacy_default_pipeline_migrates_to_canonical_chain(
    tmp_path: Path,
) -> None:
    template = video_import_api._safe_workspace_child(tmp_path, video_import_api._PIPELINE_TEMPLATE_REL)
    template.parent.mkdir(parents=True)
    template.write_text(json.dumps({
        "pipeline": video_import_api._TYPED_LEGACY_DEFAULT_PIPELINE_TEMPLATE,
    }), encoding="utf-8")

    upgraded = video_import_api.load_pipeline_template(tmp_path)

    assert upgraded == video_import_api._DEFAULT_PIPELINE_TEMPLATE
    assert [step["transformation"] for step in upgraded] == [
        "parts_extraction_0",
        "parts_grouping_0",
        "group_acceptance_0",
        "observation_identity_0",
        "turtle_programs",
        "parts_debug_0",
    ]


def test_transform_manifest_orders_debug_after_turtle(tmp_path: Path) -> None:
    unit_dir = tmp_path / "data" / "omega_vision" / "curated" / "frame"
    unit = {"id": "frame", "dir": unit_dir, "image": None, "workspaceRoot": tmp_path}
    for step in video_import_api._DEFAULT_PIPELINE_TEMPLATE:
        output = unit_dir / step["transformation"] / step["doer"]
        output.mkdir(parents=True)
        (output / "meta.json").write_text(
            json.dumps({"elapsedMs": step["priority"]}),
            encoding="utf-8",
        )
    video_import_api.write_unit_todos(
        unit,
        video_import_api._DEFAULT_PIPELINE_TEMPLATE,
    )

    summary = video_import_api._unit_transforms(tmp_path, unit_dir)

    assert summary is not None
    names = [cell["name"] for cell in summary["list"]]
    assert names[-2:] == ["turtle_programs", "parts_debug_0"]
    assert names.count("parts_debug_0") == 1


def test_customized_final_group_pipeline_is_not_migrated(tmp_path: Path) -> None:
    template = video_import_api._safe_workspace_child(tmp_path, video_import_api._PIPELINE_TEMPLATE_REL)
    template.parent.mkdir(parents=True)
    custom = [
        {
            **step,
            "options": dict(step.get("options") or {}),
            "dependsOn": list(step.get("dependsOn") or []),
        }
        for step in video_import_api._PRE_OBSERVATION_DEFAULT_PIPELINE_TEMPLATE
    ]
    custom[3]["options"] = {"symbolicGeometryTolerance": 0.2}
    template.write_text(json.dumps({"pipeline": custom}), encoding="utf-8")

    loaded = video_import_api.load_pipeline_template(tmp_path)

    assert loaded == custom
    assert all(
        step["transformation"] != "observation_identity_0"
        for step in loaded
    )


def test_pipeline_lane_customization_is_not_migrated(tmp_path: Path) -> None:
    template = video_import_api._safe_workspace_child(tmp_path, video_import_api._PIPELINE_TEMPLATE_REL)
    template.parent.mkdir(parents=True)
    custom = [
        {
            **step,
            "options": dict(step.get("options") or {}),
            "dependsOn": list(step.get("dependsOn") or []),
        }
        for step in video_import_api._PRE_OBSERVATION_DEFAULT_PIPELINE_TEMPLATE
    ]
    custom[1]["type"] = "py_pl"
    template.write_text(json.dumps({"pipeline": custom}), encoding="utf-8")

    loaded = video_import_api.load_pipeline_template(tmp_path)

    assert loaded == custom
    assert all(
        step["transformation"] != "observation_identity_0"
        for step in loaded
    )


def test_customized_observation_pipeline_keeps_debug_order(tmp_path: Path) -> None:
    template = video_import_api._safe_workspace_child(tmp_path, video_import_api._PIPELINE_TEMPLATE_REL)
    template.parent.mkdir(parents=True)
    custom = [
        {
            **step,
            "options": dict(step.get("options") or {}),
            "dependsOn": list(step.get("dependsOn") or []),
        }
        for step in video_import_api._PRE_DEBUG_LAST_DEFAULT_PIPELINE_TEMPLATE
    ]
    debug = next(
        step for step in custom
        if step["transformation"] == "parts_debug_0"
    )
    debug["options"] = {"lineWidth": 3}
    template.write_text(json.dumps({"pipeline": custom}), encoding="utf-8")

    loaded = video_import_api.load_pipeline_template(tmp_path)

    assert loaded == custom
    assert loaded[1]["transformation"] == "parts_debug_0"
    assert loaded[1]["options"] == {"lineWidth": 3}
