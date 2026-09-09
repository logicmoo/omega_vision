from __future__ import annotations

from types import SimpleNamespace

import pytest

import service_monitor_api as sm


def _fake_request(port: int = 8000):
    return SimpleNamespace(url=SimpleNamespace(port=port))


@pytest.fixture(autouse=True)
def _clear_cache():
    sm._invalidate_services_cache()
    yield
    sm._invalidate_services_cache()


def test_services_snapshot_is_cached_within_ttl(monkeypatch: pytest.MonkeyPatch):
    calls = {"system_processes": 0, "listeners": 0}

    def counting_system_processes():
        calls["system_processes"] += 1
        return []

    def counting_listeners():
        calls["listeners"] += 1
        return {}

    monkeypatch.setattr(sm, "_system_processes", counting_system_processes)
    monkeypatch.setattr(sm, "_listener_pids", counting_listeners)
    monkeypatch.setattr(sm, "_definitions", lambda _port: [])
    monkeypatch.setattr(sm, "_startup_policy", lambda: {})

    first = sm.list_services(_fake_request(), include_hidden=False)
    second = sm.list_services(_fake_request(), include_hidden=False)

    assert first == second
    # The expensive OS enumerations ran once; the second poll used the cache.
    assert calls["system_processes"] == 1
    assert calls["listeners"] == 1


def test_invalidation_forces_fresh_enumeration(monkeypatch: pytest.MonkeyPatch):
    calls = {"n": 0}
    monkeypatch.setattr(sm, "_system_processes", lambda: calls.__setitem__("n", calls["n"] + 1) or [])
    monkeypatch.setattr(sm, "_listener_pids", lambda: {})
    monkeypatch.setattr(sm, "_definitions", lambda _port: [])
    monkeypatch.setattr(sm, "_startup_policy", lambda: {})

    sm.list_services(_fake_request(), include_hidden=False)
    sm._invalidate_services_cache()
    sm.list_services(_fake_request(), include_hidden=False)

    assert calls["n"] == 2  # invalidation defeated the cache


def test_hidden_and_visible_are_cached_separately(monkeypatch: pytest.MonkeyPatch):
    calls = {"n": 0}
    monkeypatch.setattr(sm, "_system_processes", lambda: calls.__setitem__("n", calls["n"] + 1) or [])
    monkeypatch.setattr(sm, "_listener_pids", lambda: {})
    monkeypatch.setattr(sm, "_definitions", lambda _port: [])
    monkeypatch.setattr(sm, "_startup_policy", lambda: {})

    sm.list_services(_fake_request(), include_hidden=False)
    sm.list_services(_fake_request(), include_hidden=True)

    assert calls["n"] == 2  # different cache keys
