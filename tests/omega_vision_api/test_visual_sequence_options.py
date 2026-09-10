import json
import os
import subprocess
import sys
import threading
from concurrent.futures import ThreadPoolExecutor
from contextlib import contextmanager
from pathlib import Path

import pytest
from fastapi import FastAPI
from fastapi.testclient import TestClient

from omega_vision.perception import visual_sequence_list_cache as cache
from omega_vision.perception.observation_identity import content_hash
from omega_vision.services import video_import_api as api


def option(count=801):
    return {
        "id": "recordings/capture", "visualSequenceId": "recordings/capture",
        "dir": "data/recordings/capture", "providerRef": "data/recordings/capture",
        "label": "Actual capture", "group": "Recordings", "groupKey": "recordings",
        "imageCount": count, "reducedCount": 0, "ordered": True, "readOnly": False,
        "level": "1",
    }


def choices_path(root):
    return root / "data" / "omega_vision" / ".cache" / "visual-sequence-list" / "choices.json"


def test_clean_hit_never_scans_or_rebuilds_and_restart_reuses_disk(tmp_path, monkeypatch):
    initial = cache.visual_sequence_options(tmp_path, lambda: [option()])
    def forbidden(*args, **kwargs):
        raise AssertionError("clean option hit scanned sources")
    monkeypatch.setattr(os, "scandir", forbidden)
    monkeypatch.setattr(os, "walk", forbidden)
    assert cache.visual_sequence_options(tmp_path, forbidden) == (initial[0], initial[1], "disk")
    script = """
import json, os, sys
from pathlib import Path
from omega_vision import inherited_source_overlay as overlay
from omega_vision.perception.visual_sequence_list_cache import visual_sequence_options
overlay._REPO_ROOT = Path(sys.argv[1])
def forbidden(*args, **kwargs):
    raise AssertionError("restarted clean hit scanned sources")
os.scandir = os.walk = forbidden
entries, revision, state = visual_sequence_options(overlay._REPO_ROOT, forbidden)
print(json.dumps({"state": state, "count": entries[0]["imageCount"]}))
"""
    result = subprocess.run([sys.executable, "-c", script, str(tmp_path)], text=True, capture_output=True, check=True)
    assert json.loads(result.stdout) == {"state": "disk", "count": 801}


def test_dirty_refresh_and_expiry_rebuild_only_the_option_projection(tmp_path, monkeypatch):
    calls = []
    def build():
        calls.append(1)
        return [{**option(len(calls) + 800), "frames": [{"image": "not-cacheable"}], "payload": {"secret": "not-cacheable"}}]
    cache.visual_sequence_options(tmp_path, build)
    cache.visual_sequence_options(tmp_path, build)
    assert len(calls) == 1
    cache.invalidate_visual_sequence_list(tmp_path)
    assert cache.visual_sequence_options(tmp_path, build)[0][0]["imageCount"] == 802
    assert cache.visual_sequence_options(tmp_path, build, refresh=True)[2] == "refresh"
    document = json.loads(choices_path(tmp_path).read_text())
    monkeypatch.setattr(cache.time, "time", lambda: document["builtAt"] + cache.MAX_AGE_SECONDS + 1)
    assert cache.visual_sequence_options(tmp_path, build)[0][0]["imageCount"] == 804
    assert "frames" not in choices_path(tmp_path).read_text()
    assert "payload" not in choices_path(tmp_path).read_text()
    assert "not-cacheable" not in choices_path(tmp_path).read_text()


def test_rebuild_invalidated_while_building_retries_without_losing_dirty_signal(tmp_path):
    calls = []
    def build():
        calls.append(1)
        if len(calls) == 1:
            cache.invalidate_visual_sequence_list(tmp_path)
        return [option(800 + len(calls))]
    assert cache.visual_sequence_options(tmp_path, build)[0][0]["imageCount"] == 802
    assert len(calls) == 2
    assert cache.visual_sequence_options(tmp_path, build)[2] == "disk"


def test_invalidation_after_publication_is_seen_by_next_reader(tmp_path, monkeypatch):
    atomic = cache.atomic_json
    published = False
    def publish(path, value):
        nonlocal published
        atomic(path, value)
        if path.name == "choices.json" and not published:
            published = True
            cache.invalidate_visual_sequence_list(tmp_path)
    monkeypatch.setattr(cache, "atomic_json", publish)
    calls = []
    def build():
        calls.append(1)
        return [option()]
    cache.visual_sequence_options(tmp_path, build)
    cache.visual_sequence_options(tmp_path, build)
    assert len(calls) == 2


def test_concurrent_refreshes_serialize_and_share_one_publication(tmp_path, monkeypatch):
    original = cache.writer_lock
    entered = threading.Barrier(4)
    @contextmanager
    def concurrent_lock(path):
        entered.wait(timeout=5)
        with original(path):
            yield
    monkeypatch.setattr(cache, "writer_lock", concurrent_lock)
    calls = []
    def build():
        calls.append(1)
        return [option()]
    with ThreadPoolExecutor(max_workers=4) as executor:
        results = list(executor.map(lambda _: cache.visual_sequence_options(tmp_path, build, refresh=True), range(4)))
    assert len(calls) == 1
    assert len({result[1] for result in results}) == 1


def test_corruption_unsafe_metadata_and_failed_rebuild_are_visible(tmp_path, caplog):
    cache.visual_sequence_options(tmp_path, lambda: [option()])
    path = choices_path(tmp_path)
    document = json.loads(path.read_text())
    document["entries"][0]["dir"] = "data/../../outside"
    document["revision"] = content_hash({"identity": document["identity"], "entries": document["entries"]})
    path.write_text(json.dumps(document))
    assert cache.visual_sequence_options(tmp_path, lambda: [option(802)])[0][0]["imageCount"] == 802
    assert "invalid Visual Sequence" in caplog.text
    document = json.loads(path.read_text())
    del document["entries"][0]["imageCount"]
    document["revision"] = content_hash({"identity": document["identity"], "entries": document["entries"]})
    path.write_text(json.dumps(document))
    assert cache.visual_sequence_options(tmp_path, lambda: [option(803)])[0][0]["imageCount"] == 803
    path.write_text("{broken")
    def failed():
        raise PermissionError("source access denied")
    with pytest.raises(PermissionError, match="source access denied"):
        cache.visual_sequence_options(tmp_path, failed)
    assert "corrupt Visual Sequence" in caplog.text
    with pytest.raises(ValueError, match="Unrecognized Omega"):
        cache.visual_sequence_options(tmp_path.parent / "outside", lambda: [option()])


def test_root_and_catalog_identity_changes_cannot_reuse_old_choices(tmp_path, monkeypatch):
    from omega_vision import inherited_source_overlay as overlay
    cache.visual_sequence_options(tmp_path, lambda: [option()])
    old = choices_path(tmp_path).read_text()
    monkeypatch.setattr(cache, "CATALOG_VERSION", "next-options-version")
    assert cache.visual_sequence_options(tmp_path, lambda: [option(802)])[2] == "miss"
    next_repo = tmp_path / "other-repository"
    target = choices_path(next_repo)
    target.parent.mkdir(parents=True)
    target.write_text(old)
    monkeypatch.setattr(overlay, "_REPO_ROOT", next_repo)
    assert cache.visual_sequence_options(next_repo, lambda: [option(803)])[0][0]["imageCount"] == 803


def test_cache_read_permission_error_is_not_hidden_by_a_rebuild(tmp_path, monkeypatch):
    cache.visual_sequence_options(tmp_path, lambda: [option()])
    original = Path.read_text
    def denied(path, *args, **kwargs):
        if path == choices_path(tmp_path):
            raise PermissionError("cannot read option cache")
        return original(path, *args, **kwargs)
    monkeypatch.setattr(Path, "read_text", denied)
    with pytest.raises(PermissionError, match="cannot read option cache"):
        cache.visual_sequence_options(tmp_path, lambda: pytest.fail("must not hide permission failure"))


def test_cache_redirect_cannot_overwrite_other_data_inside_the_shared_root(tmp_path, monkeypatch):
    victim = tmp_path / "data" / "omega_vision" / "knowledge" / "record.json"
    victim.parent.mkdir(parents=True)
    victim.write_text("preserved")
    monkeypatch.setattr(cache, "storage_path", lambda *args: victim)
    with pytest.raises(ValueError, match="cannot redirect"):
        cache.visual_sequence_options(tmp_path, lambda: [option()])
    with pytest.raises(ValueError, match="cannot redirect"):
        cache.invalidate_visual_sequence_list(tmp_path)
    assert victim.read_text() == "preserved"


def test_two_workspaces_share_options_and_access_rechecks_selected_paths(tmp_path, monkeypatch):
    home = tmp_path / "data" / "omega_vision"
    sequence = home / "recordings" / "capture"
    sequence.mkdir(parents=True)
    (sequence / "frame_0.png").write_bytes(b"metadata listing must not decode images")
    for name in ("one", "two"):
        (tmp_path / "workspaces" / name).mkdir(parents=True)
    monkeypatch.setattr(api, "_workspace_root", lambda workspace: tmp_path / "workspaces" / workspace)
    app = FastAPI()
    app.include_router(api.router)
    with TestClient(app) as client:
        path = f"{api.router.prefix}/visual-sequences"
        first = client.get(path, params={"workspaceId": "one"})
        assert first.status_code == 200
        entries = first.json()["visualSequences"]
        def forbidden(*args, **kwargs):
            raise AssertionError("clean hit enumerated frame folders")
        monkeypatch.setattr(api, "_list_image_sets", forbidden)
        monkeypatch.setattr(api, "_scan_set_images", forbidden)
        second = client.get(path, params={"workspaceId": "two"})
        assert second.json()["visualSequences"] == entries
        assert second.headers["etag"] == first.headers["etag"]
        assert client.get(path, params={"workspaceId": "two"}, headers={"If-None-Match": first.headers["etag"]}).status_code == 304
        assert len(list((home / ".cache" / "visual-sequence-list").glob("choices.json"))) == 1
        with pytest.raises(ValueError):
            api._resolve_set_dir(tmp_path, "data/../../../outside")


def test_managed_source_images_and_manifests_invalidate_but_previews_do_not(tmp_path):
    from PIL import Image
    home = tmp_path / "data" / "omega_vision"
    calls = []
    def build():
        calls.append(1)
        return [option()]
    cache.visual_sequence_options(tmp_path, build)
    image = Image.new("RGB", (2, 2))
    api._save_image_with_provenance(tmp_path, image, home / "curated" / "input" / "image.png", operation="test_import")
    cache.visual_sequence_options(tmp_path, build)
    api._atomic_json_write(home / "curated" / "input" / "manifest.json", {"items": []})
    cache.visual_sequence_options(tmp_path, build)
    assert len(calls) == 3
    api._save_image_with_provenance(tmp_path, image, home / "video_import" / "previews" / "preview.png", operation="test_preview")
    api._atomic_json_write(home / "runtime" / "executions" / "receipt.json", {"state": "done"})
    assert cache.visual_sequence_options(tmp_path, build)[2] == "disk"
    assert len(calls) == 3
