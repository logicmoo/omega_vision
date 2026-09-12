import json
from pathlib import Path

import pytest
from PIL import Image

from omega_vision.perception.contextual_memory import ContextualMemory
from omega_vision.perception.metta_memory import MeTTaMemoryDatabase
from omega_vision.services import recognition_object_resolution as resolution
from omega_vision.services import video_import_api as api

from test_recording_test_execution import fingerprints
from test_semantic_active_integration import integrated, sequence, finish


def plan(client, sequence_id, stage, frame_id="frame_000001", workspace="w"):
    body = {"workspaceId": workspace, "sequenceId": sequence_id, "frameId": frame_id, "stageId": stage}
    response = client.post("/video-import/semantic/execution/plan", json=body)
    assert response.status_code == 200, response.text
    return body, response.json()


def commit(client, body, preview, **changes):
    return client.post("/video-import/semantic/execution/commit", json={
        **body, "confirmed": True, "run": True, "confirmationKey": preview["confirmationKey"], **changes,
    })


def test_discovery_exposes_only_verified_first_pass_roots_without_writes(integrated, monkeypatch):
    root, client = integrated
    sequence_id = sequence(root)
    other = ("parts_extraction_0", "python_scikit")
    monkeypatch.setitem(api._TRANSFORM_METADATA, other, {"inputContract": {"frameInputCount": 1, "usesSTM": False}})
    before = fingerprints(root)
    response = client.post("/video-import/semantic/execution/read", json={
        "workspaceId": "w", "sequenceId": sequence_id, "frameId": "frame_000001",
    })
    assert response.status_code == 200, response.text
    stages = {item["id"] for item in response.json()["stages"]}
    assert set(resolution.FIRST_PASS) <= stages
    assert "/".join(other) not in stages
    assert response.headers["cache-control"] == "no-store"
    assert fingerprints(root) == before and not api._direct_jobs
    monkeypatch.delitem(api._SEQUENCE_TRANSFORMS, tuple(resolution.FIRST_PASS[0].split("/")))
    assert resolution.FIRST_PASS[0] not in api._semantic_stage_ids()


@pytest.mark.parametrize("stage", resolution.FIRST_PASS)
@pytest.mark.parametrize("frame_id", ["frame_000001", "image"])
def test_confirmed_first_pass_executes_only_actual_row_without_other_images_or_memory(integrated, monkeypatch, stage, frame_id):
    root, client = integrated
    sequence_id = sequence(root)
    directory = root / "data" / "omega_vision" / "recordings" / "integration" / "seq"
    if frame_id == "image":
        Image.new("RGB", (48, 32), "green").save(directory / "image.png")
    _, units, _ = resolution.execution_context(root, sequence_id, "w")
    unit = next(item for item in units if item["id"] == frame_id)
    others = [item for item in units if item["id"] != frame_id]
    for other in others:
        other["image"].with_suffix(".provenance.json").write_text(json.dumps({
            "operation": "extract_video_frame", "source": {"sourceVideo": "unread.mp4", "atSeconds": 999},
        }), encoding="utf-8")
    before = fingerprints(root)
    read_bytes, read_text = Path.read_bytes, Path.read_text

    def permitted(path):
        assert all(path != item["image"] and not path.is_relative_to(item["dir"]) for item in others), path
        if path.is_relative_to(root):
            assert not any(part.startswith("memory") or part.endswith("_stm") for part in path.parts), path

    def bytes_of(path):
        permitted(path)
        return read_bytes(path)

    def text_of(path, *args, **kwargs):
        permitted(path)
        return read_text(path, *args, **kwargs)

    def forbidden(*args, **kwargs):
        pytest.fail("A single-frame first pass must not consult native memory")

    with monkeypatch.context() as guard:
        guard.setattr(Path, "read_bytes", bytes_of)
        guard.setattr(Path, "read_text", text_of)
        guard.setattr(ContextualMemory, "read", forbidden)
        guard.setattr(MeTTaMemoryDatabase, "read", forbidden)
        body, preview = plan(client, sequence_id, stage, frame_id)
        assert not preview["blockedReasons"]
        assert preview["requestedFrameIds"] == preview["supportFrameIds"] == [frame_id]
        assert {step["frameId"] for step in preview["raw"]["steps"]} == {frame_id}
    assert fingerprints(root) == before and not api._direct_jobs
    with monkeypatch.context() as guard:
        guard.setattr(Path, "read_bytes", bytes_of)
        guard.setattr(Path, "read_text", text_of)
        guard.setattr(ContextualMemory, "read", forbidden)
        guard.setattr(MeTTaMemoryDatabase, "read", forbidden)
        response = commit(client, body, preview)
        assert response.status_code == 200, response.text
        job = finish(client, response.json())
    assert job["requestedFrameIds"] == job["supportFrameIds"] == [frame_id]
    assert (unit["dir"].joinpath(*stage.split("/")) / "meta.json").is_file()
    if frame_id == "image":
        assert job["targetContext"]["previousFrameId"] is None
        assert job["targetContext"]["currentFrameOrder"] == 0
    assert all(not list(item["dir"].rglob("meta.json")) for item in others)
    assert not list(root.rglob("todos.json"))
    after = fingerprints(root)
    assert all(after.get(path) == value for path, value in before.items())
    assert all(path.startswith("data/omega_vision/") for path in after.keys() - before.keys())


@pytest.mark.parametrize("stage", resolution.FIRST_PASS)
def test_first_pass_confirmation_cannot_be_waived_or_retargeted(integrated, stage):
    root, client = integrated
    sequence_id = sequence(root)
    other = sequence(root, name="other")
    body, preview = plan(client, sequence_id, stage)
    before = fingerprints(root)
    for changes in [
        {"confirmed": False}, {"confirmationKey": "wrong"}, {"frameId": "frame_000000"},
        {"sequenceId": other}, {"options": {"cutoutPadding": 3}},
    ]:
        response = commit(client, body, preview, **changes)
        assert response.status_code == 409, response.text
        assert not api._direct_jobs and fingerprints(root) == before
    missing_frame = {key: value for key, value in body.items() if key != "frameId"}
    response = commit(client, missing_frame, preview)
    assert response.status_code == 409 and not api._direct_jobs
    assert fingerprints(root) == before


def test_first_pass_rejects_changed_source_and_invalid_scope_before_writes(integrated):
    root, client = integrated
    sequence_id = sequence(root)
    body, preview = plan(client, sequence_id, resolution.FIRST_PASS[-1])
    directory, units, _ = resolution.execution_context(root, sequence_id, "w")
    Image.new("RGB", (48, 32), "blue").save(units[1]["image"])
    before = fingerprints(root)
    response = commit(client, body, preview)
    assert response.status_code == 409, response.text
    for changes in [
        {"frameId": None}, {"frameId": 1}, {"frameId": "0_image"}, {"frameId": "../frame_000000"},
        {"firstN": 2}, {"sequenceId": "data/../private"},
    ]:
        response = client.post("/video-import/semantic/execution/plan", json={**body, **changes})
        assert response.status_code in {400, 403}, response.text
    assert directory.is_dir() and not api._direct_jobs and fingerprints(root) == before


def test_unordered_single_frame_root_and_two_workspace_output_identity(integrated):
    root, client = integrated
    sequence_id = sequence(root, ordered=False)
    body, preview = plan(client, sequence_id, resolution.FIRST_PASS[-1])
    assert preview["targetContext"]["status"] == "unordered_input"
    response = commit(client, body, preview)
    assert response.status_code == 200, response.text
    finish(client, response.json())
    _, units, _ = resolution.execution_context(root, sequence_id, "w")
    output = units[1]["dir"].joinpath(*resolution.FIRST_PASS[-1].split("/")) / "observations.json"
    original = output.read_bytes()
    other, other_plan = plan(client, sequence_id, resolution.FIRST_PASS[-1], workspace="another_workspace")
    response = commit(client, other, other_plan)
    assert response.status_code == 200, response.text
    finish(client, response.json())
    assert output.read_bytes() == original
    assert not (root / "data" / "omega_vision" / "workspaces").exists()
    assert not (root / "another_workspace").exists()


def test_first_pass_preserves_provenance_ordering_without_a_recording_manifest(integrated):
    root, client = integrated
    sequence_id = sequence(root, ordered=False)
    _, units, _ = resolution.execution_context(root, sequence_id, "w")
    for index, unit in enumerate(units):
        unit["image"].with_suffix(".provenance.json").write_text(json.dumps({
            "operation": "extract_video_frame", "source": {"sourceVideo": "original.mp4", "atSeconds": index},
        }), encoding="utf-8")
    before = fingerprints(root)
    _, preview = plan(client, sequence_id, resolution.FIRST_PASS[-1])
    assert preview["raw"]["ordered"] is True
    assert preview["targetContext"]["previousFrameId"] == "frame_000000"
    assert preview["supportFrameIds"] == ["frame_000001"]
    assert fingerprints(root) == before


@pytest.mark.parametrize("dependency", [
    "frame[-1]@parts_extraction_0/python_opencv",
    "parts_debug_0/python_pil",
])
def test_first_pass_cannot_smuggle_extra_scope_through_a_pipeline_template(integrated, monkeypatch, dependency):
    root, client = integrated
    sequence_id = sequence(root)
    target = resolution.FIRST_PASS[-1]
    specs = api._direct_specs

    def modified(root):
        result = specs(root)
        result[target] = {**result[target], "dependsOn": [dependency]}
        return result

    monkeypatch.setattr(api, "_direct_specs", modified)
    monkeypatch.setattr(api, "_runtime_transform_options", lambda *a, **k: pytest.fail("Reject the graph before consulting runtime memory"))
    before = fingerprints(root)
    response = client.post("/video-import/semantic/execution/plan", json={
        "workspaceId": "w", "sequenceId": sequence_id, "frameId": "frame_000001", "stageId": target,
    })
    assert response.status_code == 400 and "FIRST_PASS" in response.text
    assert fingerprints(root) == before and not api._direct_jobs
