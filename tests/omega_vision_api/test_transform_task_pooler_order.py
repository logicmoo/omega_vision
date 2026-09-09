from __future__ import annotations

import json
import time
from pathlib import Path

import pytest

from omega_vision.services import transform_task_pooler, video_import_api


def test_concurrent_pooler_never_runs_debug_before_turtle(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    calls: list[str] = []

    def turtle_runner(unit: dict, out_dir: Path, options: dict) -> dict:
        calls.append("turtle-start")
        time.sleep(0.15)
        calls.append("turtle-finished")
        return {"programCount": 1}

    def debug_runner(unit: dict, out_dir: Path, options: dict) -> dict:
        assert (
            unit["dir"]
            / "turtle_programs"
            / "turtle_programs_prolog"
            / "meta.json"
        ).is_file()
        calls.append("debug")
        return {"width": 10, "height": 10}

    monkeypatch.setitem(
        video_import_api._SEQUENCE_TRANSFORMS,
        ("turtle_programs", "turtle_programs_prolog"),
        turtle_runner,
    )
    monkeypatch.setitem(
        video_import_api._SEQUENCE_TRANSFORMS,
        ("parts_debug_0", "python_pil"),
        debug_runner,
    )
    workspace = tmp_path
    tmp_path = workspace / "data" / "omega_vision" / "curated" / "frame"
    tmp_path.mkdir(parents=True)
    monkeypatch.setattr(video_import_api, "_workspace_root", lambda _: workspace)
    unit = {"id": "frame", "dir": tmp_path, "image": None, "workspaceId": "fixture"}
    pipeline = [
        {
            "transformation": "turtle_programs",
            "doer": "turtle_programs_prolog",
            "options": {},
            "priority": 40,
            "type": "py_pl",
            "dependsOn": [],
        },
        {
            "transformation": "parts_debug_0",
            "doer": "python_pil",
            "options": {},
            "priority": 50,
            "type": "ui",
            "dependsOn": ["turtle_programs/turtle_programs_prolog"],
        },
    ]
    video_import_api.write_unit_todos(unit, pipeline)

    first_count = transform_task_pooler.one_pass(
        [tmp_path],
        workers=2,
        limit=0,
        retry_errors=False,
        only_types=None,
        skip_types=None,
    )
    first_todos = json.loads((tmp_path / "todos.json").read_text(encoding="utf-8"))
    debug_todo = next(
        todo
        for todo in first_todos["todos"]
        if todo["transformation"] == "parts_debug_0"
    )

    assert first_count == 2
    assert calls == ["turtle-start", "turtle-finished"]
    assert debug_todo["status"] == "pending"
    assert not (tmp_path / "parts_debug_0" / "python_pil" / "meta.json").exists()

    second_count = transform_task_pooler.one_pass(
        [tmp_path],
        workers=2,
        limit=0,
        retry_errors=False,
        only_types=None,
        skip_types=None,
    )

    assert second_count == 1
    assert calls == ["turtle-start", "turtle-finished", "debug"]
    assert (tmp_path / "parts_debug_0" / "python_pil" / "meta.json").is_file()
