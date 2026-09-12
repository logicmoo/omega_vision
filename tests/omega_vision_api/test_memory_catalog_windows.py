from concurrent.futures import ThreadPoolExecutor
import errno
import json
import os
from pathlib import Path
import subprocess
from threading import Event, Lock
import time
from types import SimpleNamespace

import pytest

from omega_vision.perception import _event_journal as journal
from omega_vision.perception import memory_catalog_cache as cache
from omega_vision.perception.contextual_memory import ContextualMemory, recording_context
from omega_vision.perception.metta_memory import MeTTaMemoryDatabase


@pytest.fixture
def home(tmp_path):
    directory = tmp_path / "data" / "omega_vision"
    directory.mkdir(parents=True)
    return directory


def windows_error(code):
    error = OSError(errno.EACCES, "injected Windows replacement error")
    error.winerror = code
    return error


def marker(home):
    return cache.cache_directory(home) / "dirty.json"


def pending(home):
    return list(home.rglob("*.pending-*")) + list(home.rglob(".*.tmp"))


@pytest.mark.parametrize("code", [5, 32, 33])
def test_transient_replace_failure_retries_complete_marker_and_cleans_staging(home, monkeypatch, code):
    cache.invalidate_memory_catalog(home)
    previous = marker(home).read_bytes()
    replace = os.replace
    calls, sleeps = [], []

    def transient(source, destination):
        assert destination == marker(home)
        assert marker(home).read_bytes() == previous
        assert set(json.loads(source.read_bytes())) == {"generation"}
        calls.append(source)
        if len(calls) < 3:
            raise windows_error(code)
        replace(source, destination)

    monkeypatch.setattr(journal.os, "replace", transient)
    monkeypatch.setattr(journal.time, "sleep", sleeps.append)
    cache.invalidate_memory_catalog(home)
    assert len(calls) == 3 and len(set(calls)) == 1
    assert sleeps == list(journal._WINDOWS_REPLACE_DELAYS[:2])
    assert marker(home).read_bytes() != previous
    assert pending(home) == []


@pytest.mark.parametrize("code", [5, 32, 33])
def test_persistent_replace_denial_is_bounded_preserves_marker_and_raises(home, monkeypatch, code):
    cache.invalidate_memory_catalog(home)
    previous = marker(home).read_bytes()
    error = windows_error(code)
    calls, sleeps = [], []

    def denied(source, destination):
        assert marker(home).read_bytes() == previous
        calls.append(source)
        raise error

    monkeypatch.setattr(journal.os, "replace", denied)
    monkeypatch.setattr(journal.time, "sleep", sleeps.append)
    with pytest.raises(OSError) as failed:
        cache.invalidate_memory_catalog(home)
    assert failed.value is error
    assert len(calls) == 10 and len(sleeps) == 9
    assert sum(sleeps) <= 1.32
    assert marker(home).read_bytes() == previous
    assert pending(home) == []


@pytest.mark.parametrize("error", [
    PermissionError(errno.EACCES, "permission denied without Windows sharing error"),
    OSError(errno.ENOSPC, "no space left"),
    windows_error(87),
])
def test_unrelated_replace_errors_are_not_retried(home, monkeypatch, error):
    cache.invalidate_memory_catalog(home)
    previous = marker(home).read_bytes()
    calls, sleeps = [], []

    def denied(*args):
        calls.append(1)
        raise error

    monkeypatch.setattr(journal.os, "replace", denied)
    monkeypatch.setattr(journal.time, "sleep", sleeps.append)
    with pytest.raises(OSError) as failed:
        cache.invalidate_memory_catalog(home)
    assert failed.value is error and calls == [1] and not sleeps
    assert marker(home).read_bytes() == previous and pending(home) == []


def test_staging_permission_denial_is_not_a_retryable_replace_error(home, monkeypatch):
    cache.invalidate_memory_catalog(home)
    previous = marker(home).read_bytes()
    original = Path.open
    calls, sleeps = [], []

    def denied(path, *args, **kwargs):
        if path.name.startswith(".dirty.json.pending-"):
            calls.append(path)
            raise windows_error(5)
        return original(path, *args, **kwargs)

    monkeypatch.setattr(Path, "open", denied)
    monkeypatch.setattr(journal.time, "sleep", sleeps.append)
    with pytest.raises(OSError):
        cache.invalidate_memory_catalog(home)
    assert len(calls) == 1 and not sleeps
    assert marker(home).read_bytes() == previous and pending(home) == []


def test_existing_staging_file_is_not_deleted_or_overwritten(home, monkeypatch):
    cache.invalidate_memory_catalog(home)
    previous = marker(home).read_bytes()
    staging = marker(home).with_name(".dirty.json.pending-collision")
    staging.write_bytes(b"pre-existing file owned by another operation")
    monkeypatch.setattr(journal.uuid, "uuid4", lambda: SimpleNamespace(hex="collision"))
    with pytest.raises(FileExistsError):
        cache.invalidate_memory_catalog(home)
    assert staging.read_bytes() == b"pre-existing file owned by another operation"
    assert marker(home).read_bytes() == previous


def test_other_atomic_json_callers_do_not_implicitly_opt_into_retry(home, monkeypatch):
    calls, sleeps = [], []

    def denied(*args):
        calls.append(1)
        raise windows_error(5)

    monkeypatch.setattr(journal.os, "replace", denied)
    monkeypatch.setattr(journal.time, "sleep", sleeps.append)
    with pytest.raises(OSError):
        journal.atomic_json(home / "untouched.json", {"value": 1})
    assert calls == [1] and not sleeps and pending(home) == []


def test_marker_writers_share_one_store_lock(home, monkeypatch):
    publish = cache.atomic_json
    guard = Lock()
    active, maximum = 0, 0
    entered = Event()

    def slow(*args, **kwargs):
        nonlocal active, maximum
        with guard:
            active += 1
            maximum = max(maximum, active)
        try:
            entered.set()
            time.sleep(0.01)
            return publish(*args, **kwargs)
        finally:
            with guard:
                active -= 1

    monkeypatch.setattr(cache, "atomic_json", slow)
    with ThreadPoolExecutor(max_workers=4) as pool:
        first = pool.submit(cache.invalidate_memory_catalog, home)
        assert entered.wait(5)
        others = [pool.submit(cache.invalidate_memory_catalog, home) for _ in range(7)]
        first.result()
        for future in others:
            future.result()
    assert maximum == 1 and pending(home) == []
    assert (cache.cache_directory(home) / "generation.lock" / ".writer.lock").is_file()
    assert not (home / "workspaces").exists()


@pytest.mark.skipif(os.name != "nt", reason="Real Windows ordinary-reader sharing semantics")
def test_real_windows_generation_reader_blocks_replace_then_retry_recovers(home, monkeypatch, record_property):
    cache.invalidate_memory_catalog(home)
    old = marker(home).read_bytes()
    read, replace = Path.read_bytes, os.replace
    opened, release, closed = Event(), Event(), Event()
    errors = []

    def held_read(path):
        if path != marker(home):
            return read(path)
        try:
            with path.open("rb") as stream:
                opened.set()
                assert release.wait(5)
                return stream.read()
        finally:
            closed.set()

    def observed_replace(source, destination):
        try:
            return replace(source, destination)
        except OSError as error:
            errors.append(error.winerror)
            raise

    def release_reader(_delay):
        release.set()
        assert closed.wait(5)

    monkeypatch.setattr(Path, "read_bytes", held_read)
    monkeypatch.setattr(journal.os, "replace", observed_replace)
    monkeypatch.setattr(journal.time, "sleep", release_reader)
    with ThreadPoolExecutor(max_workers=1) as pool:
        reader = pool.submit(cache._generation, home)
        try:
            assert opened.wait(5)
            cache.invalidate_memory_catalog(home)
        finally:
            release.set()
        assert reader.result() == cache.content_hash(old)
    assert errors and all(code in {5, 32, 33} for code in errors)
    record_property("windows_replace_errors", errors)
    assert read(marker(home)) != old and pending(home) == []


@pytest.mark.skipif(os.name != "nt", reason="Windows extended root prefix normalization")
def test_extended_root_prefix_is_same_shared_store_not_a_redirect(home):
    cache.invalidate_memory_catalog(Path("\\\\?\\" + str(home)))
    assert marker(home).is_file()


def link_directory(link, target):
    link.parent.mkdir(parents=True, exist_ok=True)
    if os.name == "nt":
        result = subprocess.run([
            "powershell.exe", "-NoProfile", "-Command",
            f"New-Item -ItemType Junction -Path '{link}' -Target '{target}' | Out-Null",
        ], capture_output=True, text=True, check=False)
        assert result.returncode == 0, result.stderr
    else:
        link.symlink_to(target, target_is_directory=True)


@pytest.mark.parametrize("relative", [
    (), (".cache",), (".cache", "memory-catalog"),
    (".cache", "memory-catalog", "generation.lock"),
])
@pytest.mark.parametrize("outside", [False, True])
def test_real_directory_redirect_rejected_before_cache_or_lock_writes(home, tmp_path, relative, outside):
    target = (tmp_path if outside or not relative else home) / "redirect-target"
    target.mkdir()
    sentinel = target / "sentinel"
    sentinel.write_bytes(b"preserved")
    link = home.joinpath(*relative)
    if not relative:
        home.rmdir()
    link_directory(link, target)
    try:
        with pytest.raises(PermissionError, match="redirect"):
            cache.invalidate_memory_catalog(home)
        assert list(target.iterdir()) == [sentinel] and sentinel.read_bytes() == b"preserved"
    finally:
        link.rmdir() if os.name == "nt" else link.unlink()


@pytest.mark.parametrize("name", ["dirty.json", "generation.lock/.writer.lock", ".dirty.json.pending-forced"])
def test_redirected_files_are_rejected_before_writes_or_cleanup(home, tmp_path, monkeypatch, name):
    cache.invalidate_memory_catalog(home)
    directory = cache.cache_directory(home)
    target = directory.joinpath(*name.split("/"))
    sentinel = tmp_path / "outside-marker"
    sentinel.write_bytes(b"do not touch")
    original = Path.resolve
    monkeypatch.setattr(Path, "resolve", lambda path, *a, **k:
                        sentinel if path == target else original(path, *a, **k))
    monkeypatch.setattr(journal.uuid, "uuid4", lambda: SimpleNamespace(hex="forced"))
    previous = marker(home).read_bytes()
    with pytest.raises(PermissionError, match="redirect"):
        cache.invalidate_memory_catalog(home)
    assert sentinel.read_bytes() == b"do not touch"
    assert marker(home).read_bytes() == previous
    assert pending(home) == []


def test_retry_rechecks_destination_redirect_without_touching_outside(home, tmp_path, monkeypatch):
    cache.invalidate_memory_catalog(home)
    target = marker(home)
    previous = target.read_bytes()
    sentinel = tmp_path / "outside"
    sentinel.write_bytes(b"preserved")
    original = Path.resolve
    redirected = False
    calls = []

    def resolve(path, *args, **kwargs):
        return sentinel if redirected and path == target else original(path, *args, **kwargs)

    def first_failure(*args):
        nonlocal redirected
        calls.append(1)
        redirected = True
        raise windows_error(32)

    monkeypatch.setattr(Path, "resolve", resolve)
    monkeypatch.setattr(journal.os, "replace", first_failure)
    monkeypatch.setattr(journal.time, "sleep", lambda _: None)
    with pytest.raises(PermissionError, match="redirect"):
        cache.invalidate_memory_catalog(home)
    assert calls == [1]
    assert target.read_bytes() == previous and sentinel.read_bytes() == b"preserved"
    assert pending(home) == []


def test_lock_path_is_reauthorized_after_waiting_before_open(home, tmp_path, monkeypatch):
    directory = cache.cache_directory(home)
    lock = directory / "generation.lock" / ".writer.lock"
    outside = tmp_path / "outside-lock"
    original = Path.resolve
    redirected = False

    class RedirectWhileWaiting:
        def acquire(self, timeout):
            nonlocal redirected
            redirected = True
            return True

        def release(self):
            pass

    monkeypatch.setitem(journal._THREAD_LOCKS, str(lock.resolve()), RedirectWhileWaiting())
    monkeypatch.setattr(Path, "resolve", lambda path, *a, **k:
                        outside if redirected and path == lock else original(path, *a, **k))
    with pytest.raises(PermissionError, match="redirect"):
        cache.invalidate_memory_catalog(home)
    assert not lock.exists() and not outside.exists()
    assert not marker(home).exists() and pending(home) == []


@pytest.mark.parametrize("suffix", [".json", ".lock", ".lock/.writer.lock"])
def test_catalog_metadata_paths_cannot_redirect_read_or_publication(home, tmp_path, monkeypatch, suffix):
    identity = {"scope": "test"}
    key = cache.content_hash({"version": cache.VERSION, "identity": identity})
    directory = cache.cache_directory(home)
    target = directory.joinpath(*(key + suffix).split("/"))
    outside = tmp_path / "outside-metadata"
    outside.write_bytes(b"preserved")
    original = Path.resolve
    monkeypatch.setattr(Path, "resolve", lambda path, *a, **k:
                        outside if path == target else original(path, *a, **k))
    with pytest.raises(PermissionError, match="redirect"):
        cache.catalog_metadata(home, home, identity, lambda: {"locations": [], "errors": []})
    assert outside.read_bytes() == b"preserved"
    assert list(home.iterdir()) == []


def test_generation_read_is_nonwriting_and_rejects_redirect(home, tmp_path, monkeypatch):
    assert cache._generation(home) == "initial" and list(home.iterdir()) == []
    cache.invalidate_memory_catalog(home)
    target = marker(home)
    sentinel = tmp_path / "outside-marker"
    sentinel.write_bytes(b"must not be read")
    original = Path.resolve
    monkeypatch.setattr(Path, "resolve", lambda path, *a, **k:
                        sentinel if path == target else original(path, *a, **k))
    with pytest.raises(PermissionError, match="redirect"):
        cache._generation(home)


def native_fixture(home):
    directory = home / "recordings" / "game" / "recording"
    (directory / "0").mkdir(parents=True)
    (directory / "recording.json").write_text(json.dumps({
        "game_id": "game", "moves": [{"directory": "data/recordings/game/recording/0", "level": "1"}],
    }), encoding="utf-8")
    context = recording_context(home, directory, "0")
    store = ContextualMemory(home, "first")
    initial = store.save(context.stm_area(), "shape", {"uid": "old-shape"}, context=context)
    database = MeTTaMemoryDatabase(home, context.stm_area(), "shape")
    return store, context, database, initial


@pytest.mark.parametrize("after_native_write", [False, True])
def test_native_writer_failure_is_visible_preserves_prior_history_and_cleans_temps(
    home, monkeypatch, after_native_write,
):
    store, context, database, initial = native_fixture(home)
    before = database.path.read_bytes()
    replace = os.replace
    marker_calls, old = [], []
    monkeypatch.setattr(journal.time, "sleep", lambda _: None)

    def fail_marker(source, destination):
        if destination == marker(home):
            marker_calls.append(1)
            if after_native_write and len(marker_calls) == 1:
                return replace(source, destination)
            if not old:
                old.append(marker(home).read_bytes())
            raise windows_error(5)
        return replace(source, destination)

    monkeypatch.setattr(journal.os, "replace", fail_marker)
    with pytest.raises(OSError):
        store.save(context.stm_area(), "shape", {"uid": "new-shape"}, context=context)
    records = ContextualMemory(home, "second").read(context.stm_area(), "shape")[0]
    assert any(item["recordUid"] == initial["recordUid"] for item in records)
    assert database.path.read_bytes().startswith(before)
    assert any(item["payload"]["uid"] == "new-shape" for item in records) == after_native_write
    assert len(marker_calls) == 10 + int(after_native_write)
    assert marker(home).read_bytes() == old[0] and pending(home) == []


@pytest.mark.parametrize("batch", [False, True])
def test_native_append_recovers_and_reloads_with_shared_workspace_identity(home, monkeypatch, batch):
    store, context, database, initial = native_fixture(home)
    before = database.path.read_bytes()
    replace = os.replace
    calls = []
    monkeypatch.setattr(journal.time, "sleep", lambda _: None)

    def transient(source, destination):
        if destination == marker(home):
            calls.append(1)
            if len(calls) == 1:
                raise windows_error(32)
        return replace(source, destination)

    monkeypatch.setattr(journal.os, "replace", transient)
    if batch:
        monkeypatch.setattr(MeTTaMemoryDatabase, "append", lambda db, value: db.append_batch([value])[0])
    store.save(context.stm_area(), "shape", {"uid": "new-shape", "values": [None, False, 1, "1"]}, context=context)
    records = ContextualMemory(home, "second").read(context.stm_area(), "shape")[0]
    assert {item["recordUid"] for item in records} == {
        item["recordUid"] for item in store.read(context.stm_area(), "shape")[0]}
    assert any(item["recordUid"] == initial["recordUid"] for item in records)
    assert next(item for item in records if item["payload"]["uid"] == "new-shape")["payload"]["values"] == [
        None, False, 1, "1"]
    assert len(calls) == 3 and database.path.read_bytes().startswith(before)
    assert pending(home) == [] and not (home / "workspaces").exists()
    assert not (home.parent / ".cache").exists()
    assert not (home.parent.parent / "workspaces").exists()
