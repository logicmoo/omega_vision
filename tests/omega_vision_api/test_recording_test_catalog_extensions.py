import json

from fastapi import FastAPI, HTTPException
from fastapi.testclient import TestClient
import pytest

from omega_vision.evaluation.event_recording_cases import event_cases
from omega_vision.evaluation.event_recordings import _case_files, _json, publish_recording_files
from omega_vision.services import recording_tests as api


@pytest.fixture
def client(tmp_path, monkeypatch):
    def workspace(name):
        if name not in {"arc3_random_player", "second"}:
            raise HTTPException(404, "Unknown workspace")
        return tmp_path / "workspaces" / name

    monkeypatch.setattr(api, "_workspace_root", workspace)
    app = FastAPI()
    app.include_router(api.router, prefix="/workbench")
    with TestClient(app) as connection:
        yield connection


def publish(root, name, index_file):
    case = next(case for case in event_cases() if case.name == name)
    files = _case_files(case)
    metadata = {
        "id": name, "group": "Events", "title": name, "summary": case.description,
        "executionStatus": "not_run", "documentationFile": f"documentation/{name}.md",
        "recordings": [{
            "visualSequenceId": f"recordings/events_tests/{name}", "label": name,
            "partition": "example", "frameCount": len(case.frames),
        }],
    }
    files[("recordings", "events_tests", "documentation", f"{name}.md")] = (
        f"# {name}\n\nCompare current evidence against earlier local memory.\n"
    ).encode()
    files[("recordings", "events_tests", index_file)] = _json({
        "schemaVersion": 1, "count": 1, "tests": [metadata],
    })
    publish_recording_files(root, files)
    return root / "data" / "omega_vision" / "recordings" / "events_tests"


def snapshot(root):
    return {path: (path.read_bytes(), path.stat().st_mtime_ns) for path in root.rglob("*") if path.is_file()}


def test_explicit_supplements_aggregate_without_rewriting_or_partitioning(tmp_path, client):
    suite = publish(tmp_path, "moved", "tests.json")
    original = snapshot(suite)
    publish(tmp_path, "rotated", "visual_memory_tests.json")
    publish(tmp_path, "missing", "action_mechanism_tests.json")
    assert all(snapshot(suite)[path] == value for path, value in original.items())
    (suite / "unregistered-tests.json").write_text("Not a registered input; do not read me.")
    before = snapshot(tmp_path)
    results = []
    for workspace in ("arc3_random_player", "second"):
        response = client.get("/workbench/recognition/recording-tests", params={"workspaceId": workspace})
        assert response.status_code == 200, response.text
        payload = response.json()
        assert payload["count"] == 3
        assert [test["id"] for test in payload["tests"]] == ["moved", "rotated", "missing"]
        results.append(payload)
        for name in ("moved", "rotated", "missing"):
            detail = client.get(f"/workbench/recognition/recording-tests/{name}", params={"workspaceId": workspace})
            assert detail.status_code == 200, detail.text
            assert detail.json()["documentation"].startswith(f"# {name}")
            assert detail.json()["executionStatus"] == "not_run"
    assert results[0] == results[1]
    assert snapshot(tmp_path) == before


def test_supplement_can_be_published_without_original_dataset(tmp_path, client):
    publish(tmp_path, "rotated", "visual_memory_tests.json")
    response = client.get("/workbench/recognition/recording-tests?workspaceId=arc3_random_player")
    assert response.status_code == 200
    assert response.json()["count"] == 1
    assert response.json()["tests"][0]["id"] == "rotated"


@pytest.mark.parametrize("duplicate", ["test_id", "recording"])
def test_duplicates_across_indices_are_not_silently_overridden(tmp_path, client, duplicate):
    suite = publish(tmp_path, "moved", "tests.json")
    value = json.loads((suite / "tests.json").read_text())
    if duplicate == "recording":
        value["tests"][0].update(id="different_test", documentationFile="documentation/different_test.md")
    (suite / "visual_memory_tests.json").write_text(json.dumps(value))
    response = client.get("/workbench/recognition/recording-tests?workspaceId=arc3_random_player")
    assert response.status_code == 409


@pytest.mark.parametrize("payload", ["invalid-json", '{"schemaVersion":true,"count":0,"tests":[]}',
                                   '{"schemaVersion":1,"count":2,"tests":[]}'])
def test_corrupt_supplement_never_falls_back_to_original_catalog(tmp_path, client, payload):
    suite = publish(tmp_path, "moved", "tests.json")
    (suite / "action_mechanism_tests.json").write_text(payload)
    response = client.get("/workbench/recognition/recording-tests?workspaceId=arc3_random_player")
    assert response.status_code == 409
    assert "action_mechanism_tests.json" in response.json()["detail"]


@pytest.mark.parametrize("name", ["visual_memory_tests.json", "action_mechanism_tests.json"])
def test_supplement_path_redirection_rejected_even_if_unpublished(tmp_path, client, monkeypatch, name):
    original = api.storage_path
    home = tmp_path / "data" / "omega_vision"

    def redirected(root, *parts):
        if parts[-1] == name:
            return home / "elsewhere" / name
        return original(root, *parts)

    monkeypatch.setattr(api, "storage_path", redirected)
    before = snapshot(tmp_path)
    response = client.get("/workbench/recognition/recording-tests?workspaceId=arc3_random_player")
    assert response.status_code == 403
    assert snapshot(tmp_path) == before


def test_missing_supplement_document_is_explicit_not_an_omitted_test(tmp_path, client):
    suite = publish(tmp_path, "moved", "tests.json")
    publish(tmp_path, "rotated", "visual_memory_tests.json")
    (suite / "documentation" / "rotated.md").unlink()
    response = client.get("/workbench/recognition/recording-tests/rotated?workspaceId=arc3_random_player")
    assert response.status_code == 404
    assert "rotated" in response.json()["detail"]
