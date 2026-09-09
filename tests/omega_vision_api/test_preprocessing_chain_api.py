from __future__ import annotations

from pathlib import Path
import json

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


def test_todos_record_variant_so_pooler_inherits_it(tmp_path: Path):
    """The offline pooler rebuilds a unit from todos.json ``imagePath``; wiring
    the unit image to the materialized variant and stamping todos must record
    the VARIANT path so the pooler extracts from the preprocessed pixels."""
    import json

    src = _make_source(tmp_path)
    unit = {"id": "frame0", "dir": src.parent, "image": src, "sequenceId": "data/seq"}
    chain = [{"stepId": "s1", "entryId": "scale_3x_nearest", "params": {}}]
    variant = v._materialize_preprocessed_image(tmp_path, unit, chain, v._filter_catalog_index(tmp_path))
    unit["image"] = variant
    v.write_unit_todos(unit, [{"transformation": "parts_extraction_0", "doer": "python_opencv",
                               "options": {}, "dependsOn": [], "priority": 10}])
    todos = json.loads((unit["dir"] / "todos.json").read_text(encoding="utf-8"))
    assert todos["imagePath"].startswith("preprocessing/")
    assert todos["imagePath"].endswith(".png")
    # and the original stamping (no preprocessing) keeps the source image
    unit2 = {"id": "frame0", "dir": src.parent, "image": src, "sequenceId": "data/seq"}
    v.write_unit_todos(unit2, [{"transformation": "parts_extraction_0", "doer": "python_opencv",
                                "options": {}, "dependsOn": [], "priority": 10}])
    todos2 = json.loads((unit["dir"] / "todos.json").read_text(encoding="utf-8"))
    assert todos2["imagePath"] == "image.png"


def test_saved_empty_chain_stays_empty(tmp_path, monkeypatch):
    monkeypatch.setattr(v, "_workspace_root", lambda _: tmp_path)
    (tmp_path / "data" / "seq").mkdir(parents=True)
    v.put_preprocessing_chain({"workspaceId": "w", "sequenceId": "data/seq", "steps": []})
    assert v.get_preprocessing_chain("w", "data/seq")["steps"] == []


@pytest.mark.parametrize("raw", ["{", '{"steps": null}', '{"steps": [null]}', '{"schemaVersion": 999, "steps": []}'])
def test_corrupt_chain_is_not_silently_original(tmp_path, raw):
    (tmp_path / "preprocessing_chain.json").write_text(raw)
    with pytest.raises(HTTPException) as error:
        v._load_preprocessing_chain_at(tmp_path)
    assert error.value.status_code == 422


@pytest.mark.parametrize("steps", [None, {}, [None], [{"entryId": "downscale", "params": {"scale": "bad"}}]])
def test_invalid_save_preserves_previous_chain(tmp_path, monkeypatch, steps):
    monkeypatch.setattr(v, "_workspace_root", lambda _: tmp_path)
    directory = tmp_path / "data" / "seq"
    directory.mkdir(parents=True)
    path = directory / "preprocessing_chain.json"
    path.write_text('{"steps": []}')
    with pytest.raises(HTTPException):
        v.put_preprocessing_chain({"workspaceId": "w", "sequenceId": "data/seq", "steps": steps})
    assert path.read_text() == '{"steps": []}'


def test_unannotated_filter_is_not_materializable():
    with pytest.raises(HTTPException, match="not deterministic/materializable"):
        v._validated_preprocessing_chain(
            [{"entryId": "custom", "params": {}}],
            {"custom": {"id": "custom", "filter": "skill", "params": {}}},
        )


def test_alpha_lineage_and_intermediate_cache(tmp_path):
    src = _make_source(tmp_path)
    image = Image.new("RGBA", (4, 3), (20, 30, 40, 90))
    image.putpixel((0, 0), (200, 0, 0, 0))
    image.save(src)
    unit = {"id": "frame0", "dir": src.parent, "image": src}
    chain = [{"entryId": "scale_3x_nearest", "params": {}}] * 2
    out = v._materialize_preprocessed_image(tmp_path, unit, chain, v._filter_catalog_index(tmp_path))
    with Image.open(out) as result:
        assert result.size == (36, 27)
        assert result.getpixel((0, 0))[3] == 0
        assert result.getpixel((35, 26))[3] == 90
    assert len(list(out.parent.glob("*.png"))) == 2
    provenance = json.loads(out.with_suffix(".provenance.json").read_text())
    assert provenance["transform"]["sourceToVariant"] == [9, 0, 0, 0, 9, 0]
    assert provenance["source"]["implementationVersions"]


def test_source_change_invalidates_variant(tmp_path):
    src = _make_source(tmp_path)
    unit = {"id": "frame0", "dir": src.parent, "image": src}
    chain = [{"entryId": "scale_3x_nearest", "params": {}}]
    index = v._filter_catalog_index(tmp_path)
    first = v._materialize_preprocessed_image(tmp_path, unit, chain, index)
    Image.new("RGB", (4, 3), "red").save(src)
    second = v._materialize_preprocessed_image(tmp_path, unit, chain, index)
    assert first != second
    assert first.is_file() and second.is_file()


def test_preview_is_sequence_bound_and_creates_no_todos(tmp_path, monkeypatch):
    monkeypatch.setattr(v, "_workspace_root", lambda _: tmp_path)
    pool = tmp_path / "data" / "seq" / "pool"
    pool.mkdir(parents=True)
    Image.new("RGB", (3, 2), "blue").save(pool / "one.png")
    frames = v.preprocessing_frames("w", "data/seq")
    assert frames["total"] == 1
    body = {"workspaceId": "w", "sequenceId": "data/seq", "image": "data/seq/pool/one.png",
            "steps": [{"entryId": "scale_3x_nearest", "params": {}}]}
    result = v.preprocessing_preview(body)
    assert result["before"] == body["image"]
    assert "preprocessing/" in result["after"]
    assert not list(tmp_path.rglob("todos.json"))
    with pytest.raises(HTTPException, match="not an input"):
        v.preprocessing_preview({**body, "image": "data/wrong.png"})


def test_stale_pipeline_and_offline_pooler_use_same_input(tmp_path, monkeypatch):
    from omega_vision.services.transform_task_pooler import load_unit
    src = _make_source(tmp_path)
    sequence_root = src.parent.parent
    chain = [{"entryId": "scale_3x_nearest", "params": {}}]
    (sequence_root / "preprocessing_chain.json").write_text(json.dumps({"steps": chain}))
    unit = {"id": "frame0", "dir": src.parent, "image": src, "sequenceRoot": sequence_root}
    index = v._filter_catalog_index(tmp_path)
    unit["image"] = v._materialize_preprocessed_image(tmp_path, unit, chain, index)
    spec = {"transformation": "test", "doer": "test", "dependsOn": [], "options": {}}
    calls = []
    monkeypatch.setitem(v._SEQUENCE_TRANSFORMS, ("test", "test"),
                        lambda unit, out, options: calls.append(unit["image"]) or {})
    assert v.run_transform_step(unit, "test", "test", {})["status"] == "written"
    assert v.run_transform_step(unit, "test", "test", {})["status"] == "skipped"
    newer = [{"entryId": "scale_3x_nearest", "params": {}}] * 2
    (sequence_root / "preprocessing_chain.json").write_text(json.dumps({"steps": newer}))
    assert v.run_transform_step(unit, "test", "test", {})["status"] == "blocked"
    unit["image"] = v._materialize_preprocessed_image(tmp_path, unit, newer, index)
    assert v.write_unit_todos(unit, [spec]) == 1
    loaded, _, _ = load_unit(src.parent / "todos.json", retry_errors=False)
    assert loaded["image"] == unit["image"]
    assert loaded["inputSignature"] == unit["inputSignature"]
    assert v.run_transform_step(loaded, "test", "test", {})["status"] == "written"
    assert len(calls) == 2


def test_headless_model_input_and_coordinates_match_final_variant(tmp_path):
    import base64
    import io
    from omega_vision.services.video_import_pipeline import image_dimensions, image_to_data_url
    pool = tmp_path / "data" / "seq" / "pool"
    pool.mkdir(parents=True)
    Image.new("RGBA", (3, 2), (30, 50, 70, 100)).save(pool / "frame.png")
    (pool.parent / "preprocessing_chain.json").write_text(json.dumps({
        "steps": [{"entryId": "scale_3x_nearest", "params": {}}],
    }))
    image_path = "data/seq/pool/frame.png"
    final = v._preprocessed_model_image(tmp_path, image_path)
    assert image_dimensions(tmp_path, image_path) == (9, 6)
    data = base64.b64decode(image_to_data_url(tmp_path, image_path).split(",", 1)[1])
    assert data == final.read_bytes()
    with Image.open(io.BytesIO(data)) as image:
        assert image.size == (9, 6)
        assert image.getpixel((0, 0))[3] == 100
    assert v._preprocessed_model_image(tmp_path, final.relative_to(tmp_path).as_posix()) == final


def test_frame_ids_cover_named_steps_and_manifest_selection(tmp_path):
    sequence = tmp_path / "data" / "recordings" / "game" / "attempt"
    (sequence / "named").mkdir(parents=True)
    (sequence / "recording.json").write_text("{}")
    image = sequence / "named" / "image.png"
    Image.new("RGB", (2, 2), "blue").save(image)
    unit = v._preprocessing_unit(sequence, image)
    manifest = v._flat_set_manifest(tmp_path, "recordings/game/attempt")
    assert unit["id"] == manifest["items"][0]["unitId"] == "named"


def test_full_extraction_endpoint_preprocesses_only_selected_frames(tmp_path, monkeypatch):
    monkeypatch.setattr(v, "_workspace_root", lambda _: tmp_path)
    monkeypatch.setattr(v, "_pooler_point_at", lambda *args: {"pid": 0})
    sequence = tmp_path / "data" / "seq"
    pool = sequence / "pool"
    pool.mkdir(parents=True)
    for name in ("frame0", "frame1"):
        Image.new("RGB", (16, 12), "blue").save(pool / f"{name}.png")
    steps = [{"entryId": "scale_3x_nearest", "params": {}}]
    v.put_preprocessing_chain({"workspaceId": "w", "sequenceId": "data/seq", "steps": steps})
    preview = v.preprocessing_preview({
        "workspaceId": "w", "sequenceId": "data/seq", "steps": steps, "image": "data/seq/pool/frame0.png",
    })
    result = v.sequence_set_transform({
        "workspaceId": "w", "set": "seq", "moves": ["frame0"],
        "pipeline": [{"transformation": "parts_extraction_0", "doer": "python_opencv"}],
    })
    assert result["moveCount"] == 1
    assert result["counts"]["parts_extraction_0/python_opencv"] == {"written": 1}
    unit = sequence / "transforms" / "frame0"
    todo = json.loads((unit / "todos.json").read_text())
    assert (unit / todo["imagePath"]).resolve() == (tmp_path / preview["after"]).resolve()
    metadata = json.loads((unit / "parts_extraction_0" / "python_opencv" / "meta.json").read_text())
    assert (metadata["width"], metadata["height"]) == (48, 36)
    assert metadata["inputSignature"] == todo["inputSignature"]
    assert not (sequence / "transforms" / "frame1").exists()


def test_dependency_must_use_current_preprocessed_input(tmp_path, monkeypatch):
    dependency = tmp_path / "extract" / "test"
    dependency.mkdir(parents=True)
    (dependency / "meta.json").write_text('{"inputSignature": "chain:old"}')
    called = []
    monkeypatch.setitem(v._SEQUENCE_TRANSFORMS, ("group", "test"), lambda *args: called.append(1) or {})
    unit = {"id": "x", "dir": tmp_path, "inputSignature": "chain:new"}
    result = v.run_transform_step(unit, "group", "test", {}, depends_on=["extract/test"])
    assert result["status"] == "blocked"
    assert result["reason"] == "preprocessing-input-changed"
    assert not called


def test_preprocessing_has_no_small_step_limit(tmp_path, monkeypatch):
    monkeypatch.setattr(v, "_workspace_root", lambda _: tmp_path)
    (tmp_path / "data" / "seq").mkdir(parents=True)
    steps = [{"stepId": f"step-{index}", "entryId": ORIGINAL_PIXELS_ID, "params": {}} for index in range(300)]
    saved = v.put_preprocessing_chain({"workspaceId": "w", "sequenceId": "data/seq", "steps": steps})
    assert saved["steps"] == steps
    assert v.get_preprocessing_chain("w", "data/seq")["steps"] == steps


def test_preprocessing_outputs_never_become_collection_inputs(tmp_path):
    from omega_vision.perception.visual_sequence_cache import catalog_revision
    sequence = tmp_path / "curated" / "collection"
    nested = sequence / "source"
    nested.mkdir(parents=True)
    source = nested / "portrait.png"
    Image.new("RGB", (8, 8), "red").save(source)
    index = v._filter_catalog_index(tmp_path)
    signature = catalog_revision([tmp_path], ["curated"])
    v._materialize_preprocessed_image(tmp_path, v._preprocessing_unit(sequence, source),
                                     [{"entryId": "scale_3x_nearest", "params": {}}], index)
    assert v._resolve_set_images(sequence) == [source]
    assert catalog_revision([tmp_path], ["curated"]) == signature


def test_skill_source_revision_changes_cached_pixels_even_with_same_mtime(tmp_path):
    import os
    skill_dir = v._skills_dir(tmp_path)
    skill_dir.mkdir(parents=True)
    skill = skill_dir / "changing.py"
    text = ('from PIL import Image\n'
            'SKILL = {"params": {}, "preprocessing": {"geometry": "identity"}}\n'
            'def apply(image, params): return Image.new("RGB", image.size, "red")\n')
    skill.write_text(text)
    source = _make_source(tmp_path)
    unit = {"id": "frame0", "dir": source.parent, "image": source}
    chain = [{"entryId": "skill:changing", "params": {}}]
    index = v._filter_catalog_index(tmp_path)
    first = v._materialize_preprocessed_image(tmp_path, unit, chain, index)
    stat = skill.stat()
    skill.write_text(text.replace('"red"', '"tan"'))
    os.utime(skill, ns=(stat.st_atime_ns, stat.st_mtime_ns))
    second = v._materialize_preprocessed_image(tmp_path, unit, chain, index)
    assert first != second
    with Image.open(second) as image:
        assert image.getpixel((0, 0)) == (210, 180, 140)


def test_legacy_outputs_are_visibly_stale_without_deleting_their_artifacts(tmp_path):
    sequence = tmp_path / "data" / "seq"
    unit = sequence / "transforms" / "frame0"
    output = unit / "extract" / "test"
    output.mkdir(parents=True)
    (output / "meta.json").write_text("{}")
    (output / "result.pl").write_text("region(r1).")
    (unit / "todos.json").write_text(json.dumps({
        "todos": [{"transformation": "extract", "doer": "test", "output": "extract/test", "status": "done"}],
    }))
    (sequence / "preprocessing_chain.json").write_text(json.dumps({
        "steps": [{"entryId": "scale_3x_nearest", "params": {}}],
    }))
    summary = v._unit_transforms(tmp_path, unit, sequence)
    assert summary["done"] == 0
    assert summary["list"][0]["status"] == "stale"
    assert summary["list"][0]["resultPath"].endswith("result.pl")
    assert json.loads((unit / "todos.json").read_text())["todos"][0]["status"] == "done"


def test_scaling_keeps_cut_and_outline_on_the_same_variant(tmp_path, monkeypatch):
    monkeypatch.setattr(v, "_workspace_root", lambda _: tmp_path)
    pool = tmp_path / "data" / "seq" / "pool"
    pool.mkdir(parents=True)
    Image.new("RGB", (8, 8), "red").save(pool / "frame.png")
    chain = [{"entryId": "scale_3x_nearest", "params": {}}]
    (pool.parent / "preprocessing_chain.json").write_text(json.dumps({"steps": chain}))
    body = {"workspaceId": "w", "image": "data/seq/pool/frame.png", "name": "part", "fill": "hole",
            "box": [3, 3, 15, 15], "outlineSourceImage": "data/seq/pool/frame.png",
            "outlineSourceDimensions": {"width": 24, "height": 24}, "enlargeForNextPass": False}
    cut = v.member_cut(body)
    assert cut["outlineAlignment"]["verified"]
    variant = cut["outlineAlignment"]["outlineSourceImage"]
    assert variant == cut["outlineAlignment"]["cutImage"]
    assert "/preprocessing/" in variant
    (pool.parent / "preprocessing_chain.json").write_text(json.dumps({
        "steps": [*chain, {"entryId": "cartoon", "params": {}}],
    }))
    with pytest.raises(HTTPException) as error:
        v.member_cut({**body, "outlineSourceImage": variant, "step": 2})
    assert error.value.status_code == 409


def test_republishing_filter_kind_changes_variant_identity(tmp_path):
    source = _make_source(tmp_path)
    image = Image.new("RGB", (16, 16))
    for x in range(16):
        for y in range(16):
            image.putpixel((x, y), (x * 16, y * 16, (x + y) * 8))
    image.save(source)
    entry = {"id": "preset", "filter": "cartoon", "params": {"scale": 2, "colors": 8},
             "preprocessing": {"geometry": "identity"}}
    unit = {"id": "frame0", "dir": source.parent, "image": source}
    chain = [{"entryId": "preset", "params": {}}]
    first = v._materialize_preprocessed_image(tmp_path, unit, chain, {"preset": entry})
    second = v._materialize_preprocessed_image(tmp_path, unit, chain, {"preset": {**entry, "filter": "pixelate"}})
    assert first != second
    with Image.open(first) as left, Image.open(second) as right:
        assert left.tobytes() != right.tobytes()
