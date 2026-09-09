from __future__ import annotations

from pathlib import Path

import pytest
from fastapi import HTTPException
from PIL import Image

from omega_vision.perception.image_preprocessing import (
    ORIGINAL_PIXELS_ID,
    default_chain,
)
from omega_vision.services import video_import_api as v


def _make_source(tmp_path: Path) -> Path:
    unit_dir = tmp_path / "transforms" / "frame0"
    unit_dir.mkdir(parents=True)
    src = unit_dir / "image.png"
    Image.new("RGB", (4, 3), (10, 20, 30)).save(src)
    return src


def test_catalog_index_has_builtin_filters(tmp_path: Path):
    index = v._filter_catalog_index(tmp_path)
    assert "scale_3x_nearest" in index
    assert index["scale_3x_nearest"]["filter"] == "scale_3x_nearest"


def test_chain_step_body_coerces_numeric_params(tmp_path: Path):
    entry = {"id": "downscale", "filter": "downscale", "params": {}}
    body = v._chain_step_transform_body(entry, {"colors": "8", "scale": "2", "note": "x"})
    assert body["filter"] == "downscale"
    assert body["colors"] == 8 and body["scale"] == 2
    assert body["params"]["note"] == "x"


def test_load_chain_missing_is_empty(tmp_path: Path):
    assert v._load_preprocessing_chain_at(tmp_path) == []


def test_materialize_original_chain_is_passthrough(tmp_path: Path):
    src = _make_source(tmp_path)
    unit = {"id": "frame0", "dir": src.parent, "image": src}
    out = v._materialize_preprocessed_image(tmp_path, unit, default_chain(), v._filter_catalog_index(tmp_path))
    assert out == src  # nothing materialized
    assert not (src.parent / "preprocessing").exists()


def test_materialize_real_chain_is_cached_and_deterministic(tmp_path: Path):
    src = _make_source(tmp_path)
    unit = {"id": "frame0", "dir": src.parent, "image": src}
    chain = [{"stepId": "s1", "entryId": "scale_3x_nearest", "params": {}}]
    index = v._filter_catalog_index(tmp_path)
    out1 = v._materialize_preprocessed_image(tmp_path, unit, chain, index)
    assert out1 != src and out1.is_file()
    assert out1.parent == src.parent / "preprocessing"
    with Image.open(out1) as produced:
        assert produced.size == (12, 9)  # 3x nearest upscale of the 4x3 source
    mtime = out1.stat().st_mtime_ns
    out2 = v._materialize_preprocessed_image(tmp_path, unit, chain, index)
    assert out2 == out1
    assert out2.stat().st_mtime_ns == mtime  # reused cache, not rewritten


def test_put_rejects_unknown_filter(tmp_path: Path, monkeypatch: pytest.MonkeyPatch):
    monkeypatch.setattr(v, "_workspace_root", lambda _wid: tmp_path)
    with pytest.raises(HTTPException) as info:
        v.put_preprocessing_chain({"workspaceId": "w", "sequenceId": "data/seq",
                                    "steps": [{"entryId": "does_not_exist"}]})
    assert info.value.status_code == 400
    assert "not a registered filter" in str(info.value.detail)


def test_put_then_get_round_trips(tmp_path: Path, monkeypatch: pytest.MonkeyPatch):
    monkeypatch.setattr(v, "_workspace_root", lambda _wid: tmp_path)
    (tmp_path / "data" / "seq").mkdir(parents=True)
    saved = v.put_preprocessing_chain({
        "workspaceId": "w", "sequenceId": "data/seq",
        "steps": [{"stepId": "keep", "entryId": "scale_3x_nearest", "params": {}}],
    })
    assert saved["errors"] == []
    assert saved["effectivelyOriginal"] is False
    loaded = v.get_preprocessing_chain("w", "data/seq")
    assert [s["entryId"] for s in loaded["steps"]] == ["scale_3x_nearest"]
    assert loaded["steps"][0]["stepId"] == "keep"


def test_get_default_when_unsaved_is_effectively_original(tmp_path: Path, monkeypatch: pytest.MonkeyPatch):
    monkeypatch.setattr(v, "_workspace_root", lambda _wid: tmp_path)
    (tmp_path / "data" / "seq2").mkdir(parents=True)
    loaded = v.get_preprocessing_chain("w", "data/seq2")
    assert loaded["effectivelyOriginal"] is True
    assert [s["entryId"] for s in loaded["steps"]] == [ORIGINAL_PIXELS_ID, ORIGINAL_PIXELS_ID]
