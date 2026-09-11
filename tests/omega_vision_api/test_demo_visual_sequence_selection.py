import json

import pytest

from omega_vision.demos import recognition_demos as demos
from omega_vision.perception._event_journal import ConflictError
from omega_vision.perception import visual_sequence_selection as selection
from omega_vision.services import video_import_api as api


@pytest.fixture
def context(tmp_path, monkeypatch):
    home = tmp_path / "data" / "omega_vision"
    directory = home / "recordings" / "selected"
    directory.mkdir(parents=True)
    for index in range(2):
        (directory / f"frame_{index:06}.png").write_bytes(f"original-{index}".encode())
    monkeypatch.setattr(demos, "_REPO_ROOT", tmp_path)
    monkeypatch.setattr(demos, "_ls20_selected", "recordings/prior")
    monkeypatch.setattr(demos, "_visual_sequence_revision", None)
    monkeypatch.setattr(demos, "_demo_state", {
        "running": False, "results": {"demos": [{"id": "live-ls20"}, {"id": "other", "passed": True}]},
        "startedAt": None, "finishedAt": None, "only": None,
    })
    monkeypatch.setattr(demos, "_play", {})
    monkeypatch.setattr(demos, "_live_preview_done", True)
    monkeypatch.setattr(demos, "_live_preview", {"old": True})
    monkeypatch.setattr(api, "_workspace_root", lambda _: tmp_path)
    monkeypatch.setattr(api, "_cached_visual_catalog", lambda *_: [{"id": "recordings/selected"}])
    initial = selection.load_selection(home)
    selection.save_selection(home, "recordings/selected", initial["revision"], validate=lambda _: None)
    return home, directory


def select_current(home, workspace="first"):
    current = selection.load_selection(home)
    demos.set_visual_sequence_source(current["visualSequenceId"], workspace, current["revision"])
    return current


def test_demo_selection_preserves_identity_and_inputs_without_starting_or_writing(context, monkeypatch):
    home, directory = context
    before = {path: path.read_bytes() for path in home.rglob("*") if path.is_file()}
    monkeypatch.setattr(demos, "start_demo_run", lambda *_: pytest.fail("Selection must never run"))
    select_current(home)
    assert demos._current_ls20_key() == "recordings/selected"
    assert demos._demo_state["results"]["demos"] == [{"id": "other", "passed": True}]
    assert demos._live_preview is None and not demos._live_preview_done
    entries, committed, identity = demos._resolve_ls20(demos._current_ls20_key())
    assert identity == "recordings/selected" and committed is None
    assert [entry[0] for entry in entries] == ["frame_000000.png", "frame_000001.png"]
    assert all(entry[1].startswith(str(directory)) for entry in entries)
    demos._wipe_demo_memory(None)
    assert {path: path.read_bytes() for path in home.rglob("*") if path.is_file()} == before


def test_demo_source_changes_do_not_cancel_active_jobs_or_fallback_to_another_recording(context):
    home, _ = context
    demos._demo_state["running"] = True
    with pytest.raises(ConflictError, match="Stop"):
        select_current(home)
    assert demos._current_ls20_key() == "recordings/prior"
    with pytest.raises(ValueError, match="unavailable"):
        demos.set_visual_sequence_source("recordings/missing", "first", selection.load_selection(home)["revision"])
    assert demos._current_ls20_key() == "recordings/prior"


def test_shared_demo_frame_path_cannot_escape_selected_sequence(context, monkeypatch):
    home, _ = context
    foreign = home / "curated" / "foreign" / "image.png"
    foreign.parent.mkdir(parents=True)
    foreign.write_bytes(b"other")
    monkeypatch.setattr(api, "_resolve_set_images", lambda _: [foreign])
    with pytest.raises(PermissionError, match="escapes"):
        demos._resolve_ls20("recordings/selected")


def test_unchanged_demo_selection_still_acknowledges_to_newly_connected_windows(context):
    home, _ = context
    select_current(home)
    epoch = demos._play_epoch
    select_current(home, "second")
    assert demos._play_epoch == epoch + 1
    assert demos._current_ls20_key() == "recordings/selected"


def test_demo_runs_and_delayed_source_commands_require_the_current_shared_revision(context, monkeypatch):
    home, _ = context
    previous = select_current(home)
    calls = []
    monkeypatch.setattr(demos, "_begin_demo_run", lambda *args: calls.append(args) or {"started": True})
    assert demos.start_demo_run("live-ls20", workspace_id="first",
                               visual_sequence_id=previous["visualSequenceId"],
                               expected_revision=previous["revision"]) == {"started": True}
    selection.save_selection(home, "curated/different", previous["revision"], validate=lambda _: None)
    with pytest.raises(ConflictError, match="Shared Visual Sequence changed"):
        demos.set_visual_sequence_source(previous["visualSequenceId"], "first", previous["revision"])
    with pytest.raises(ConflictError, match="Shared Visual Sequence changed"):
        demos.start_demo_run("live-ls20", workspace_id="first",
                            visual_sequence_id=previous["visualSequenceId"], expected_revision=previous["revision"])
    assert len(calls) == 1
    assert demos._current_ls20_key() == previous["visualSequenceId"]


def test_demo_snapshot_captures_source_and_results_together(context, monkeypatch):
    home, _ = context
    selected = select_current(home)
    demos._demo_state["results"] = {"demos": [{"id": "live-ls20", "frames": [{"source": selected["visualSequenceId"]}]}]}
    def interleave(source):
        with demos._demo_lock:
            demos._ls20_selected = "curated/other"
            demos._visual_sequence_revision = "later"
        return [{"source": source}]
    monkeypatch.setattr(demos, "_ls20_recordings", lambda: pytest.fail("Observing a shared demo must not rescan the catalog"))
    monkeypatch.setattr(demos, "_demo_mem_root", lambda: pytest.fail("No legacy store discovery for shared demo"))
    monkeypatch.setattr(demos, "demo_catalog", interleave)
    result = demos.get_demo_state()
    assert result["visualSequenceId"] == selected["visualSequenceId"]
    assert result["visualSequenceRevision"] == selected["revision"]
    assert result["demos"][0]["frames"][0]["source"] == selected["visualSequenceId"]
    assert result["catalog"][0]["source"] == selected["visualSequenceId"]
