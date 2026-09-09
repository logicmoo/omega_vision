from concurrent.futures import ThreadPoolExecutor
from pathlib import Path

import pytest
from fastapi import FastAPI
from fastapi.testclient import TestClient

from omega_vision.perception.visual_sequence_cache import CatalogCache, catalog_revision
from omega_vision.services import video_import_api as api


def test_cache_memory_disk_refresh_and_errors(tmp_path):
    cache = CatalogCache()
    path = tmp_path / "cache.json"
    calls = []

    def build():
        calls.append(1)
        return [{"id": "real"}]

    assert cache.get(path, lambda: "a", build)[2] == "miss"
    assert cache.get(path, lambda: "a", build)[2] == "memory"
    assert CatalogCache().get(path, lambda: "a", build)[2] == "disk"
    assert cache.get(path, lambda: "a", build, refresh=True)[2] == "refresh"
    assert len(calls) == 2
    with pytest.raises(RuntimeError, match="source failure"):
        cache.get(path, lambda: "b", lambda: (_ for _ in ()).throw(RuntimeError("source failure")))


def test_cache_single_flight(tmp_path):
    cache = CatalogCache()
    calls = []
    def request(_):
        return cache.get(tmp_path / "cache.json", lambda: "r", lambda: calls.append(1) or [{"id": "a"}])
    with ThreadPoolExecutor(max_workers=4) as pool:
        list(pool.map(request, range(8)))
    assert len(calls) == 1


def test_signature_observes_frame_membership_not_generated_contents(tmp_path):
    rec = tmp_path / "recordings" / "game" / "attempt"
    step = rec / "named"
    step.mkdir(parents=True)
    (rec / "recording.json").write_text("{}")
    revision = lambda: catalog_revision([tmp_path], ["recordings"])
    before = revision()
    (step / "image.png").write_bytes(b"source")
    assert revision() != before
    output = step / "operation" / "doer"
    output.mkdir(parents=True)
    before = revision()
    (output / "result.pl").write_text("generated.")
    assert revision() == before
    (rec / "recording.json").write_text('{"level": 7}')
    assert revision() != before
    before = revision()
    (step / "image.png").unlink()
    assert revision() != before


def test_catalog_etag_and_refresh_keep_guard_counts(tmp_path, monkeypatch):
    root = tmp_path
    monkeypatch.setattr(api, "_workspace_root", lambda _: root)
    monkeypatch.setattr(api, "_data_homes", lambda _: [root / "data" / "omega_vision"])
    monkeypatch.setattr(api, "_visual_catalog_cache", CatalogCache())
    calls = []
    monkeypatch.setattr(api, "_list_image_sets", lambda _: calls.append(1) or [{"id": "large", "imageCount": 801}])
    app = FastAPI()
    app.include_router(api.router)
    with TestClient(app) as client:
        url = "/video-import/visual-sequences?workspaceId=w"
        # Router mounts can vary; use the router's actual prefix.
        url = f"{api.router.prefix}/visual-sequences?workspaceId=w"
        first = client.get(url)
        assert first.status_code == 200
        assert first.json()["visualSequences"][0]["imageCount"] == 801
        second = client.get(url, headers={"If-None-Match": first.headers["etag"]})
        assert second.status_code == 304
        assert len(calls) == 1
        assert client.get(url + "&refresh=true").status_code == 200
        assert len(calls) == 2


def test_catalog_does_not_wait_for_a_watcher_to_yield(tmp_path, monkeypatch):
    import threading
    import watchfiles
    from omega_vision.perception.visual_sequence_cache import CatalogRevisionTracker
    watching = threading.Event()

    def busy_watcher(*roots, watch_filter, stop_event, **kwargs):
        # watchfiles can keep receiving filtered-out runtime events without
        # yielding. An HTTP request must never advance this generator itself.
        watch_filter(None, str(tmp_path / "pooler_status.json"))
        watching.set()
        stop_event.wait(10)
        yield set()

    monkeypatch.setattr(watchfiles, "watch", busy_watcher)
    tracker = CatalogRevisionTracker([tmp_path], ["recordings"])
    try:
        assert watching.wait(2)
        with ThreadPoolExecutor(max_workers=1) as executor:
            future = executor.submit(tracker)
            assert future.result(timeout=1) == catalog_revision([tmp_path], ["recordings"])
        (tmp_path / "recordings").mkdir()
        tracker._changed(None, str(tmp_path / "recordings"))
        assert tracker() == catalog_revision([tmp_path], ["recordings"])
    finally:
        tracker.close()
