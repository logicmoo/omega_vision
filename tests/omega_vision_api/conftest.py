"""Omega API fixtures use the production repository layout, never legacy fallbacks."""

import pytest


@pytest.fixture(autouse=True)
def omega_repository(tmp_path, monkeypatch):
    from omega_vision import inherited_source_overlay as storage
    from omega_vision.services import video_import_api as api

    home = tmp_path / "data" / "omega_vision"
    monkeypatch.delenv("OMEGA_VISION_DATA", raising=False)
    monkeypatch.setattr(storage, "_REPO_ROOT", tmp_path)
    monkeypatch.setattr(api, "_POOLER_CONTROL_PATH", home / "pooler_control.json")
    return tmp_path
