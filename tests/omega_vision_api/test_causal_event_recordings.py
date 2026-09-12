import json

from omega_vision.evaluation.causal_event_recordings import causal_cases, create_causal_recordings
from omega_vision.evaluation.event_recording_cases import event_cases
from omega_vision.evaluation.event_recordings import create_event_recordings, render_frame
from omega_vision.perception.contextual_memory import recording_context
from omega_vision.perception.event_records import validate_term
from omega_vision.services import video_import_api as api


def snapshot(root):
    return {path: (path.read_bytes(), path.stat().st_mtime_ns) for path in root.rglob("*")
            if path.is_file() and path.name != ".writer.lock"}


def test_warmups_establish_observed_stationary_baseline_before_motion_start():
    cases = {case.name: case for case in causal_cases()}
    for name in ("move_warmup_v2", "co_move_warmup_v2"):
        case = cases[name]
        assert render_frame(case.frames[0]) == render_frame(case.frames[1])
        assert render_frame(case.frames[1]) != render_frame(case.frames[2])
        assert [event.frame for event in case.expected] == [2, 3, 4]
    for name in ("collision_confirmed_v2", "group_formed_confirmed_v2"):
        assert [event.frame for event in cases[name].expected] == [2]
    for name in ("follow_confirmed_v2", "carry_confirmed_v2"):
        assert len(cases[name].frames) == 5
        assert [event.frame for event in cases[name].expected] == [2, 3, 4]


def test_grouping_variants_include_join_and_joint_motion_before_the_target_change():
    cases = {case.name: case for case in causal_cases()}
    for name in ("group_dissolved_history_v2", "member_added_history_v2", "member_removed_history_v2"):
        case = cases[name]
        assert not case.frames[0].annotations
        assert len(case.frames) == 6
        assert case.expected[0].frame >= 4
        left = {body.entity: body for body in case.frames[1].bodies}
        right = {body.entity: body for body in case.frames[2].bodies}
        for entity in ("actor", "other"):
            assert right[entity].x - left[entity].x == 4
        assert any("inconclusive" in requirement for requirement in case.requirements)


def test_versions_preserve_originals_and_remain_real_numbered_recordings(tmp_path):
    create_event_recordings(tmp_path)
    home = tmp_path / "data" / "omega_vision"
    originals = snapshot(home / "recordings")
    result = create_causal_recordings(tmp_path)
    assert result["testCount"] == result["recordingCount"] == 9
    after = snapshot(home / "recordings")
    assert all(after[path] == value for path, value in originals.items())
    assert {case.name for case in event_cases()}.isdisjoint(case.name for case in causal_cases())
    index = json.loads((home / "recordings" / "events_tests" / "causal_event_tests.json").read_text())
    for case in causal_cases():
        directory = home / "recordings" / "events_tests" / case.name
        context = recording_context(home, directory, "0")
        assert len(context.moments) == len(case.frames)
        assert [item.frame_id for item in context.moments] == [str(i) for i in range(len(case.frames))]
        assert len(api._resolve_set_images(directory)) == len(case.frames)
        expected = json.loads((directory / "expected_events.json").read_text())
        for event in expected["expectedEvents"]:
            validate_term(event["term"], entity_ids=expected["entityIds"], categories={"event"})
        entry = next(item for item in index["tests"] if item["id"] == case.name)
        assert (home / "recordings" / "events_tests" / entry["documentationFile"]).is_file()
        for i in range(len(case.frames)):
            state = json.loads((directory / str(i) / "state.json").read_text())
            assert state["action_data"] == {}
            assert state["incoming_action"] == (None if i == 0 else "FRAME")
            assert "authoredAnnotations" not in state
    before = snapshot(home)
    assert create_causal_recordings(tmp_path)["createdFileCount"] == 0
    assert snapshot(home) == before
