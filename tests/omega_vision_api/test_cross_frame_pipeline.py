from __future__ import annotations

import json
from pathlib import Path

import pytest

from omega_vision.services import video_import_api


def _write_png(path: Path) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    # Minimal 1x1 PNG so _recording_step_dirs recognizes the frame dir.
    path.write_bytes(
        bytes.fromhex(
            "89504e470d0a1a0a0000000d49484452000000010000000108060000001f15c4"
            "890000000a49444154789c6360000002000154a24f5f0000000049454e44ae42"
            "6082"
        )
    )


def _unit(root: Path, frame_id: str, order: int) -> dict:
    return {
        "id": frame_id,
        "dir": root / frame_id,
        "image": root / frame_id / "image.png",
        "frameOrder": order,
        "sequenceOrdered": True,
        "sequenceId": "seq",
    }


@pytest.fixture()
def two_frames(tmp_path: Path, monkeypatch: pytest.MonkeyPatch):
    root = tmp_path / "rec"
    for fid in ("0", "1"):
        _write_png(root / fid / "image.png")

    produced: dict[str, str] = {"payload": "v1"}

    def producer(unit: dict, out_dir: Path, options: dict) -> dict:
        (out_dir / "result.pl").write_text(
            f"produced({unit['id']}, {produced['payload']}).", encoding="utf-8"
        )
        return {}

    def consumer(unit: dict, out_dir: Path, options: dict) -> dict:
        (out_dir / "result.pl").write_text(f"consumed({unit['id']}).", encoding="utf-8")
        return {}

    monkeypatch.setitem(video_import_api._SEQUENCE_TRANSFORMS, ("producer", "p"), producer)
    monkeypatch.setitem(video_import_api._SEQUENCE_TRANSFORMS, ("consumer", "c"), consumer)
    return root, produced


def test_cross_frame_dependency_blocks_until_target_complete(two_frames):
    root, _ = two_frames
    frame1 = _unit(root, "1", 1)
    resolved = [{"selector": "frame[-1]@producer/p", "output": "producer/p",
                 "resolved": True, "frameId": "0", "frameOrder": 0, "reason": "relative"}]

    blocked = video_import_api.run_transform_step(
        frame1, "consumer", "c", {},
        depends_on=["frame[-1]@producer/p"], depends_on_resolved=resolved,
    )
    assert blocked["status"] == "blocked"
    assert blocked["missing"] == "frame[-1]@producer/p"

    # Produce the previous frame's output, then the consumer becomes runnable.
    frame0 = _unit(root, "0", 0)
    made = video_import_api.run_transform_step(frame0, "producer", "p", {})
    assert made["status"] == "written"

    ran = video_import_api.run_transform_step(
        frame1, "consumer", "c", {},
        depends_on=["frame[-1]@producer/p"], depends_on_resolved=resolved,
    )
    assert ran["status"] == "written"
    meta = json.loads((root / "1" / "consumer" / "c" / "meta.json").read_text(encoding="utf-8"))
    assert meta["consumedDeps"]["frame[-1]@producer/p"]["frameId"] == "0"
    assert meta["consumedDeps"]["frame[-1]@producer/p"]["revision"]


def test_out_of_range_relative_is_unresolvable_not_run(two_frames):
    root, _ = two_frames
    frame0 = _unit(root, "0", 0)
    resolved = [{"selector": "frame[-1]@producer/p", "output": "producer/p",
                 "resolved": False, "frameId": None, "reason": "out-of-range"}]
    result = video_import_api.run_transform_step(
        frame0, "consumer", "c", {},
        depends_on=["frame[-1]@producer/p"], depends_on_resolved=resolved,
    )
    assert result["status"] == "blocked"
    assert result["reason"] == "out-of-range"
    assert not (root / "0" / "consumer" / "c" / "meta.json").exists()


def test_stamped_todos_persist_resolution_and_go_stale_on_revision_change(two_frames):
    root, produced = two_frames
    catalog = {"frame_ids_in_order": ["0", "1"], "ordered": True, "frame_id_set": {"0", "1"}}
    frame0 = _unit(root, "0", 0)
    frame1 = _unit(root, "1", 1)
    pipeline = [
        {"transformation": "producer", "doer": "p", "options": {}, "priority": 10,
         "dependsOn": []},
        {"transformation": "consumer", "doer": "c", "options": {}, "priority": 20,
         "dependsOn": ["frame[-1]@producer/p"]},
    ]

    # Produce frame 0 and frame 1's consumer, then stamp frame 1's todos.
    video_import_api.run_transform_step(frame0, "producer", "p", {})
    resolved = [{"selector": "frame[-1]@producer/p", "output": "producer/p",
                 "resolved": True, "frameId": "0", "frameOrder": 0, "reason": "relative"}]
    video_import_api.run_transform_step(
        frame1, "consumer", "c", {},
        depends_on=["frame[-1]@producer/p"], depends_on_resolved=resolved,
    )
    video_import_api.write_unit_todos(frame1, pipeline, catalog=catalog)
    todos = json.loads((root / "1" / "todos.json").read_text(encoding="utf-8"))
    consumer_todo = next(t for t in todos["todos"] if t["transformation"] == "consumer")
    assert consumer_todo["status"] == "done"
    assert consumer_todo["dependsOnResolved"][0]["frameId"] == "0"

    # Re-run the previous frame's producer with different content -> new revision.
    produced["payload"] = "v2"
    video_import_api.run_transform_step(frame0, "producer", "p", {}, force=True)
    pending = video_import_api.write_unit_todos(frame1, pipeline, catalog=catalog)
    todos2 = json.loads((root / "1" / "todos.json").read_text(encoding="utf-8"))
    consumer_todo2 = next(t for t in todos2["todos"] if t["transformation"] == "consumer")
    assert consumer_todo2["status"] == "pending"
    assert consumer_todo2["stale"] is True
    assert consumer_todo2["staleReason"] == "revision-changed"
    assert pending >= 1

    # A non-force re-run now recomputes the stale consumer instead of skipping.
    reran = video_import_api.run_transform_step(
        frame1, "consumer", "c", {},
        depends_on=["frame[-1]@producer/p"], depends_on_resolved=resolved,
    )
    assert reran["status"] == "written"
