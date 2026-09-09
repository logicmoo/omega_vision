import json
import threading
import time

import pytest
from fastapi import HTTPException
from PIL import Image

from omega_vision.services import video_import_api as api


@pytest.fixture
def direct_workspace(tmp_path, monkeypatch):
    root = tmp_path
    sequence = root / "data" / "seq"
    pool = sequence / "pool"
    pool.mkdir(parents=True)
    for index in range(3):
        Image.new("RGB", (4, 3), (index * 20, 50, 80)).save(pool / f"frame{index}.png")
    monkeypatch.setattr(api, "_workspace_root", lambda _: root)
    monkeypatch.setattr(api, "_direct_jobs", {})

    def forbidden(*args, **kwargs):
        raise AssertionError("Direct calls must never stamp todos, adopt results, or touch the pooler")

    monkeypatch.setattr(api, "write_unit_todos", forbidden)
    monkeypatch.setattr(api, "_pooler_point_at", forbidden)
    monkeypatch.setattr(api, "_llm_adoption_maker", forbidden)
    return root, sequence


def wait_for_call(job_id):
    deadline = time.monotonic() + 10
    while time.monotonic() < deadline:
        job = api.direct_call_status(job_id, "w")
        if job["state"] not in {"running", "starting"}:
            return job
        time.sleep(0.01)
    pytest.fail("Direct execution did not finish")


def register(monkeypatch, calls, *, blocking=None, fail=None):
    def runner(name):
        def invoke(unit, out, options):
            calls.append((unit["id"], name, options))
            if blocking is not None and name == "extract":
                blocking[0].set()
                assert blocking[1].wait(5)
            if fail == name:
                raise RuntimeError("intentional failure")
            (out / "result.pl").write_text(f"% {name} {unit['id']} {options}\n")
            return {"schema": "direct-test"}
        return invoke
    monkeypatch.setattr(api, "_SEQUENCE_TRANSFORMS", {
        (name, "python"): runner(name) for name in ("extract", "group", "render")
    })
    monkeypatch.setattr(api, "_TRANSFORM_METADATA", {
        ("group", "python"): {"dependsOn": ["extract/python"]},
        ("render", "python"): {"dependsOn": ["group/python", "extract/python"]},
    })


def test_call_runs_dependencies_once_and_does_not_stamp_or_retarget(direct_workspace, monkeypatch):
    root, sequence = direct_workspace
    calls = []
    register(monkeypatch, calls)
    body = {"workspaceId": "w", "sequenceId": "data/seq", "composite": "render/python", "firstN": 1}
    first = wait_for_call(api.start_direct_call(body)["id"])
    assert first["state"] == "done"
    assert [entry[1] for entry in calls] == ["extract", "group", "render"]
    assert not list(sequence.rglob("todos.json"))
    assert not (sequence / "transforms" / "frame1").exists()
    assert json.loads((root / first["path"]).read_text())["state"] == "done"
    assert len((root / first["eventsPath"]).read_text().splitlines()) == 3
    summary = api._unit_transforms(root, sequence / "transforms" / "frame0", sequence)
    assert summary["done"] == 3
    second = wait_for_call(api.start_direct_call(body)["id"])
    assert second["state"] == "done"
    assert [entry[1] for entry in calls] == ["extract", "group", "render", "render"]


def test_updated_dependency_options_invalidate_derived_results(direct_workspace, monkeypatch):
    root, _ = direct_workspace
    calls = []
    register(monkeypatch, calls)
    body = {"workspaceId": "w", "sequenceId": "data/seq", "composite": "render/python", "firstN": 1}
    assert wait_for_call(api.start_direct_call(body)["id"])["state"] == "done"
    (root / api._PIPELINE_TEMPLATE_REL).write_text(json.dumps({"pipeline": [{
        "transformation": "extract", "doer": "python", "options": {"threshold": 2}, "dependsOn": [],
    }]}))
    assert wait_for_call(api.start_direct_call(body)["id"])["state"] == "done"
    assert [entry[1] for entry in calls] == ["extract", "group", "render"] * 2


def test_failure_blocks_dependents_and_does_not_become_a_cache_hit(direct_workspace, monkeypatch):
    root, sequence = direct_workspace
    calls = []
    register(monkeypatch, calls, fail="extract")
    body = {"workspaceId": "w", "sequenceId": "data/seq", "composite": "render/python", "firstN": 1}
    failed = wait_for_call(api.start_direct_call(body)["id"])
    assert failed["state"] == "error"
    assert [entry[1] for entry in calls] == ["extract"]
    assert (sequence / "transforms" / "frame0" / "extract" / "python" / ".transform-failed.json").is_file()
    register(monkeypatch, calls)
    assert wait_for_call(api.start_direct_call(body)["id"])["state"] == "done"
    assert not list(sequence.rglob(".transform-failed.json"))


def test_model_call_requires_confirmation_bound_to_current_plan(direct_workspace, monkeypatch):
    root, _ = direct_workspace
    calls = []
    register(monkeypatch, calls)
    api._TRANSFORM_METADATA[("render", "python")]["type"] = "llm"
    body = {"workspaceId": "w", "sequenceId": "data/seq", "composite": "render/python", "firstN": 1}
    with pytest.raises(HTTPException) as prompt:
        api.start_direct_call(body)
    assert prompt.value.status_code == 409
    assert prompt.value.detail["confirmationRequired"]
    assert not calls
    assert not (root / "runtime").exists()
    with pytest.raises(HTTPException):
        api.start_direct_call({**body, "confirmed": True, "confirmationKey": "stale"})
    confirmed = api.start_direct_call({**body, "confirmed": True, "confirmationKey": prompt.value.detail["confirmationKey"]})
    assert wait_for_call(confirmed["id"])["state"] == "done"


def test_canonical_claims_and_cancellation_are_respected(direct_workspace, monkeypatch):
    _, sequence = direct_workspace
    entered, release = threading.Event(), threading.Event()
    calls = []
    register(monkeypatch, calls, blocking=(entered, release))
    body = {"workspaceId": "w", "sequenceId": "data/seq", "composite": "render/python", "firstN": 1}
    first = api.start_direct_call(body)
    assert entered.wait(3)
    try:
        second = wait_for_call(api.start_direct_call(body)["id"])
        assert second["state"] == "error"
        assert second["counts"]["claimed"] == 1
        assert api._cancel_workspace_job("w", first["id"])
    finally:
        release.set()
    assert wait_for_call(first["id"])["state"] == "cancelled"
    assert [entry[1] for entry in calls] == ["extract"]
    assert not list(sequence.rglob("claim.json"))


def test_mixed_recording_layout_resolves_previous_root_image(direct_workspace, monkeypatch):
    root, _ = direct_workspace
    rec = root / "data" / "recording"
    (rec / "0").mkdir(parents=True)
    (rec / "recording.json").write_text("{}")
    Image.new("RGB", (4, 4), "red").save(rec / "image.png")
    Image.new("RGB", (4, 4), "blue").save(rec / "0" / "image.png")
    calls = []
    register(monkeypatch, calls)
    api._TRANSFORM_METADATA[("render", "python")] = {
        "dependsOn": ["extract/python", "frame[-1]@extract/python"], "skipFirstFrame": True,
    }
    job = wait_for_call(api.start_direct_call({
        "workspaceId": "w", "sequenceId": "data/recording", "composite": "render/python", "firstN": 2,
    })["id"])
    assert job["state"] == "done"
    metadata = json.loads((rec / "0" / "render" / "python" / "meta.json").read_text())
    assert metadata["consumedDeps"]["frame[-1]@extract/python"]["frameId"] == "image"
    assert metadata["consumedDeps"]["frame[-1]@extract/python"]["revision"]


def test_invalid_scope_or_cycle_fails_before_any_execution(direct_workspace, monkeypatch):
    root, _ = direct_workspace
    calls = []
    register(monkeypatch, calls)
    api._TRANSFORM_METADATA[("extract", "python")] = {"dependsOn": ["render/python"]}
    with pytest.raises(HTTPException, match="cycle"):
        api.start_direct_call({"workspaceId": "w", "sequenceId": "data/seq", "composite": "render/python"})
    assert not calls
    assert not (root / "runtime").exists()
    for invalid in (-1, 1.5, True):
        with pytest.raises(HTTPException):
            api.start_direct_call({"workspaceId": "w", "sequenceId": "data/seq", "composite": "render/python", "firstN": invalid})
