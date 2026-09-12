import json

from fastapi import FastAPI
from fastapi.testclient import TestClient
import pytest

from omega_vision.services import video_import_api as api


@pytest.fixture
def selected(tmp_path, monkeypatch):
    directory = tmp_path / "data" / "omega_vision" / "recordings" / "events_tests" / "rotated"
    for number in (0, 1):
        frame = directory / str(number)
        frame.mkdir(parents=True)
        (frame / "image.png").write_bytes(b"not decoded by metadata")
    (directory / "recording.json").write_text(json.dumps({
        "game_id": "events_tests", "level": "1", "moves": [{"directory": str(index)} for index in (0, 1)],
    }))
    monkeypatch.setattr(api, "_workspace_root", lambda _: tmp_path)

    def forbidden(*args, **kwargs):
        pytest.fail("Selected source depends on unrelated catalog/provenance scan")

    monkeypatch.setattr(api, "_list_image_sets", forbidden)
    monkeypatch.setattr(api, "visual_sequence_options", forbidden)
    monkeypatch.setattr(api, "_read_image_provenance", forbidden)
    app = FastAPI()
    app.include_router(api.router)
    with TestClient(app) as client:
        yield directory, client


def test_selected_source_is_independent_shared_exact_and_read_only(selected):
    directory, client = selected
    before = {path: path.read_bytes() for path in directory.rglob("*") if path.is_file()}
    results = []
    for workspace in ("arc3_random_player", "second"):
        response = client.get(f"{api.router.prefix}/visual-sequences/resolve",
                              params={"workspaceId": workspace, "sequenceId": "recordings/events_tests/rotated"})
        assert response.status_code == 200, response.text
        assert response.headers["cache-control"] == "no-store"
        value = response.json()["visualSequence"]
        assert value["id"] == "recordings/events_tests/rotated"
        assert value["providerRef"] == "data/recordings/events_tests/rotated"
        assert value["imageCount"] == 2
        assert value["kind"] == "arc-recording" and value["ordered"]
        assert value["game"] == value["gameId"] == "events_tests"
        results.append(value)
    assert results[0] == results[1]
    assert before == {path: path.read_bytes() for path in directory.rglob("*") if path.is_file()}


@pytest.mark.parametrize("identifier,status", [
    ("../escape", 422), ("recordings/../escape", 422), ("recordings\\events_tests\\rotated", 422),
    ("recordings/events_tests/missing", 404), ("arc_recordings/old", 410),
    ("recordings/events_tests/rotated/memory", 400), ("recordings/events_tests/rotated/0", 422),
])
def test_invalid_selected_source_never_substitutes_another_sequence(selected, identifier, status):
    _, client = selected
    response = client.get(f"{api.router.prefix}/visual-sequences/resolve",
                          params={"workspaceId": "arc3_random_player", "sequenceId": identifier})
    assert response.status_code == status, response.text


def test_corrupt_recording_manifest_is_explicit(selected):
    directory, client = selected
    (directory / "recording.json").write_text("{not json")
    response = client.get(f"{api.router.prefix}/visual-sequences/resolve",
                          params={"workspaceId": "arc3_random_player", "sequenceId": "recordings/events_tests/rotated"})
    assert response.status_code == 422
    assert "manifest" in response.json()["detail"]
