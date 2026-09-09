"""Core Omega storage tests receive a real canonical home in a temporary repository."""

import pytest


@pytest.fixture(autouse=True)
def tmp_path(tmp_path, monkeypatch):
    from omega_vision import inherited_source_overlay as storage

    repository = tmp_path
    home = repository / "data" / "omega_vision"
    home.mkdir(parents=True)
    monkeypatch.delenv("OMEGA_VISION_DATA", raising=False)
    monkeypatch.setattr(storage, "_REPO_ROOT", repository)
    return home
