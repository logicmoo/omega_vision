import json

from fastapi import FastAPI
from fastapi.testclient import TestClient
import pytest

from omega_vision.perception import visual_sequence_selection as selection
from omega_vision.perception._event_journal import ConflictError
from omega_vision.services import video_import_api as api, video_import_semantics as semantic


@pytest.fixture
def repository(tmp_path, monkeypatch):
    home = tmp_path / "data" / "omega_vision"
    home.mkdir(parents=True)
    for workspace in ("first", "second"):
        (tmp_path / "workspaces" / workspace).mkdir(parents=True)
    monkeypatch.setattr(semantic, "_workspace", lambda name: tmp_path / "workspaces" / name)
    return home


def test_default_is_exact_canonical_unsuffixed_selection_without_writes(repository):
    before = list(repository.rglob("*"))
    value = selection.load_selection(repository)
    assert value["visualSequenceId"] == "recordings/ls20/20260718-154544"
    assert value["version"] == 0
    assert list(repository.rglob("*")) == before


def test_selection_is_shared_between_workspaces_and_rejects_stale_updates(repository):
    first = repository.parents[1] / "workspaces" / "first"
    second = repository.parents[1] / "workspaces" / "second"
    initial = selection.load_selection(first)
    checked = []
    saved = selection.save_selection(first, "recordings/game/recording", initial["revision"], validate=checked.append)
    assert selection.load_selection(second) == saved
    assert checked == ["recordings/game/recording"]
    assert saved["version"] == 1
    assert selection.save_selection(second, saved["visualSequenceId"], saved["revision"], validate=checked.append) == saved
    with pytest.raises(ConflictError):
        selection.save_selection(second, "curated/other", initial["revision"], validate=checked.append)
    assert selection.load_selection(first) == saved
    assert not list(first.rglob("*")) and not list(second.rglob("*"))
    assert set(json.loads((repository / "preferences" / "visual_sequence_selection.json").read_text())) == {
        "schemaVersion", "visualSequenceId", "version", "revision",
    }


@pytest.mark.parametrize("identifier", ["../outside", "recordings/../outside", "data\\recordings\\game",
                                      "C:/outside", "recordings//game", "recordings/game\nbad"])
def test_unsafe_selection_ids_fail_without_creating_preferences(repository, identifier):
    value = selection.load_selection(repository)
    with pytest.raises(ValueError):
        selection.save_selection(repository, identifier, value["revision"], validate=lambda _: None)
    assert not (repository / "preferences").exists()


def test_corrupt_preferences_are_not_replaced_by_default(repository):
    path = repository / "preferences" / "visual_sequence_selection.json"
    path.parent.mkdir()
    path.write_text('{"schemaVersion":1,"visualSequenceId":"curated/one","version":1,"revision":"wrong"}')
    before = path.read_bytes()
    with pytest.raises(ValueError, match="revision"):
        selection.load_selection(repository)
    assert path.read_bytes() == before


def test_redirected_preference_file_is_rejected_before_writes(repository, monkeypatch):
    original = selection.storage_path
    def redirected(root, *parts):
        if parts == ("preferences", "visual_sequence_selection.json"):
            return repository / "elsewhere" / "visual_sequence_selection.json"
        return original(root, *parts)
    monkeypatch.setattr(selection, "storage_path", redirected)
    with pytest.raises(PermissionError, match="redirect"):
        selection.load_selection(repository)
    assert list(repository.iterdir()) == []


def test_http_selection_validates_catalog_and_preserves_read_only_legacy_sources(repository, monkeypatch):
    old = repository / "video" / "historical"
    old.mkdir(parents=True)
    (old / "frame.png").write_bytes(b"do-not-change")
    entry = {"id": "video/historical", "providerRef": "data/video/historical",
             "readOnly": True, "imageCount": 1}
    monkeypatch.setattr(api, "_cached_visual_catalog", lambda *_: [entry])
    app = FastAPI()
    app.include_router(semantic.router)
    with TestClient(app) as client:
        initial = client.get("/semantic/visual-sequence-selection?workspaceId=first")
        assert initial.headers["Cache-Control"] == "no-store"
        saved = client.put("/semantic/visual-sequence-selection", json={
            "workspaceId": "first", "visualSequenceId": entry["id"],
            "expectedRevision": initial.json()["revision"],
        })
        assert saved.status_code == 200, saved.text
        assert client.get("/semantic/visual-sequence-selection?workspaceId=second").json() == saved.json()
        invalid = client.put("/semantic/visual-sequence-selection", json={
            "workspaceId": "second", "visualSequenceId": "recordings/missing",
            "expectedRevision": saved.json()["revision"],
        })
        assert invalid.status_code == 422
        conflict = client.put("/semantic/visual-sequence-selection", json={
            "workspaceId": "second", "visualSequenceId": entry["id"],
            "expectedRevision": initial.json()["revision"],
        })
        assert conflict.status_code == 409
    assert (old / "frame.png").read_bytes() == b"do-not-change"
    assert list(old.iterdir()) == [old / "frame.png"]
