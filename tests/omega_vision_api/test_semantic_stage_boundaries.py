import json

import pytest
from fastapi import HTTPException
from PIL import Image

from omega_vision.services import video_import_api as api
from omega_vision.services.transform_task_pooler import load_unit


def test_model_todos_require_confirmation_and_skip_initial_frame(tmp_path, monkeypatch):
    sequence = tmp_path / "data" / "recording"
    (sequence / "0").mkdir(parents=True)
    (sequence / "recording.json").write_text("{}")
    Image.new("RGB", (4, 4), "red").save(sequence / "image.png")
    Image.new("RGB", (4, 4), "blue").save(sequence / "0" / "image.png")
    monkeypatch.setattr(api, "_workspace_root", lambda _: tmp_path)
    monkeypatch.setattr(api, "_pooler_point_at", lambda *args: {"pid": 0})
    monkeypatch.setattr(api, "_SEQUENCE_TRANSFORMS", {
        ("input", "python"): lambda *args: {},
        ("pair", "model"): lambda *args: {},
    })
    monkeypatch.setattr(api, "_TRANSFORM_METADATA", {
        ("pair", "model"): {"type": "llm", "orderedOnly": True, "skipFirstFrame": True,
                            "dependsOn": ["input/python", "frame[-1]@input/python"]},
    })
    body = {"workspaceId": "w", "set": "recording", "planOnly": True,
            "pipeline": [{"transformation": "input", "doer": "python", "dependsOn": []},
                         {"transformation": "pair", "doer": "model"}]}
    with pytest.raises(HTTPException) as prompt:
        api.sequence_set_transform(body)
    assert prompt.value.status_code == 409
    assert not list(sequence.rglob("todos.json"))
    with pytest.raises(HTTPException) as missing_receipt:
        api.sequence_set_transform({**body, "confirmed": True})
    assert missing_receipt.value.status_code == 409
    api.sequence_set_transform({**body, "confirmed": True,
                                "confirmationKey": prompt.value.detail["confirmationKey"]})
    initial = json.loads((sequence / "transforms" / "image" / "todos.json").read_text())
    assert [entry["output"] for entry in initial["todos"]] == ["input/python"]
    later = json.loads((sequence / "0" / "todos.json").read_text())
    pair = next(entry for entry in later["todos"] if entry["output"] == "pair/model")
    assert pair["type"] == "llm"
    assert pair["authorization"]["llmCallCount"] == 1
    assert pair["authorization"]["confirmationKey"] == prompt.value.detail["confirmationKey"]
    assert pair["dependsOnResolved"][0]["unitPath"] == "transforms/image"
    assert later["workspaceId"] == "w"
    unit, _, _ = load_unit(sequence / "0" / "todos.json", retry_errors=False)
    assert unit["workspaceId"] == "w"
    dependency = api._resolve_step_deps(unit, ["frame[-1]@input/python"], pair["dependsOnResolved"])[0]
    assert dependency["metaPath"] == sequence / "transforms" / "image" / "input" / "python" / "meta.json"


def test_unordered_inputs_never_receive_pair_todos(tmp_path, monkeypatch):
    pool = tmp_path / "data" / "still" / "pool"
    pool.mkdir(parents=True)
    Image.new("RGB", (3, 3), "red").save(pool / "a.png")
    monkeypatch.setattr(api, "_workspace_root", lambda _: tmp_path)
    monkeypatch.setattr(api, "_pooler_point_at", lambda *args: {"pid": 0})
    monkeypatch.setattr(api, "_SEQUENCE_TRANSFORMS", {("pair", "model"): lambda *args: {}})
    monkeypatch.setattr(api, "_TRANSFORM_METADATA", {
        ("pair", "model"): {"type": "llm", "orderedOnly": True, "skipFirstFrame": True,
                            "dependsOn": ["frame[-1]@pair/model"]},
    })
    api.sequence_set_transform({"workspaceId": "w", "set": "still", "confirmed": True,
                                "planOnly": True, "pipeline": [{"transformation": "pair", "doer": "model"}]})
    payload = json.loads((pool.parent / "transforms" / "a" / "todos.json").read_text())
    assert payload["todos"] == []
