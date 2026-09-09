from __future__ import annotations

from concurrent.futures import ProcessPoolExecutor
import copy
import json
import multiprocessing

import pytest

from omega_vision.perception._event_journal import ConflictError, IntegrityError, ValidationError
from omega_vision.perception.event_records import HypothesisValidationError
from omega_vision.perception.visual_event_log import VisualSequenceEventLog


ENTITIES = ["player:1", "star:1"]
DETECTORS = {"authored-motion": "v1"}
MODEL = {"model": "vision", "backend": "test", "prompt_version": "v1", "prompt_hash": "sha-prompt"}


def term(predicate, *args):
    return {"predicate": predicate, "args": list(args)}


def frames(count):
    return [{
        "id": f"frame:{index}", "index": index, "input_hash": f"pixels-{index}",
        "entity_ids": ENTITIES, "states": [], "evidence": [f"image:{index}"],
        "provenance": {"artifact": f"frames/{index}"},
    } for index in range(count)]


def event(value):
    return {
        "term": value, "confidence": 0.98, "evidence": ["measurement:1"], "uncertainty": [],
        "provenance": {"source": "prolog", "detector_id": "authored-motion", "detector_version": "v1", "artifact_hash": "deduction-sha"},
    }


def assessment(index, events=None, label="no_material_change"):
    return {
        "from_frame": f"frame:{index}", "to_frame": f"frame:{index + 1}",
        "assessment": label, "comparison_complete": label != "unknown",
        "confidence": 0.9, "evidence": ["pixel-comparison"], "uncertainty": [],
        "events": events or [], "provenance": {"comparison": "deterministic-diff-v1"},
    }


def action(index, direction, **kwargs):
    return {
        "frame_id": f"frame:{index}", "direction": direction,
        "normalized": [term("user_input", "player:1", "up"), term("user_input", "player:1", "fire")],
        "raw_payload": {"buttons": ["ArrowUp", "Space"], "vendor_flag": 7},
        "order": 0, "timestamp": "2026-09-09T00:00:00Z",
        "provenance": {"recording_source": "recording:real-source", "provider": "explicit-test-contract"},
        **kwargs,
    }


def log(path):
    return VisualSequenceEventLog(path, "sequence:one", accepted_detectors=DETECTORS)


def phase(name):
    return event(term(name, term("occlude", "player:1", "star:1")))


def test_boundary_nochange_unknown_and_deterministic_replay(tmp_path):
    store = log(tmp_path)
    records = store.replay(frames(3), [assessment(0), assessment(1, label="unknown")])
    assert [entry["kind"] for entry in records["entries"]] == [
        "frame_assessment", "transition_assessment", "transition_assessment",
    ]
    boundary, unchanged, unknown = records["entries"]
    assert boundary["assessment"] == "initial_observation"
    assert boundary["reason"] == "no_predecessor"
    assert unchanged["assessment"] == "no_material_change" and unchanged["event_ids"] == []
    assert unknown["assessment"] == "unknown" and unknown["event_ids"] == []
    assert log(tmp_path).replay(frames(3), [assessment(0), assessment(1, label="unknown")]) == records
    assert len(store.history()) == 1
    assert all(right["previous_id"] == left["id"] for left, right in zip(records["entries"], records["entries"][1:]))


def test_first_frame_is_not_a_transition_and_no_pairs_can_be_skipped(tmp_path):
    store = log(tmp_path)
    singleton = store.replay(frames(1), [])
    assert len(singleton["entries"]) == 1
    assert store.episodes() == []
    with pytest.raises(ValidationError, match="exactly one"):
        store.replay(frames(3), [assessment(0)])
    with pytest.raises(ValidationError, match="predecessor"):
        store.replay(frames(2), [{**assessment(0), "from_frame": "frame:9"}])
    with pytest.raises(ValidationError, match="contiguous"):
        store.replay([frames(1)[0], {**frames(2)[1], "index": 3}], [assessment(0)])
    with pytest.raises(ValidationError, match="unique"):
        store.replay([frames(1)[0], {**frames(2)[1], "id": "frame:0"}], [assessment(0)])


def test_prolog_only_canonical_and_accepted_detector_versions(tmp_path):
    store = log(tmp_path)
    bad = event(term("moved", "player:1"))
    bad["provenance"]["source"] = "llm"
    with pytest.raises(ValidationError, match="Prolog"):
        store.replay(frames(2), [assessment(0, [bad], "changed")])
    bad["provenance"]["source"] = "prolog"
    bad["provenance"]["detector_version"] = "unpromoted"
    with pytest.raises(ValidationError, match="registry"):
        store.replay(frames(2), [assessment(0, [bad], "changed")])
    result = store.replay(frames(2), [assessment(0, [event(term("moved", "player:1"))], "changed")])
    transition = result["entries"][1]
    deduced = result["entries"][2]
    assert deduced["event_id"] in transition["event_ids"]
    assert deduced["assessment_id"] == transition["assessment_id"]
    with pytest.raises(ValidationError):
        store.replay(frames(2), [assessment(0, [event(term("stationary", "player:1"))], "changed")])


def test_episode_remains_open_until_actual_end_and_active_queries(tmp_path):
    store = log(tmp_path)
    first = assessment(0, [phase("start")], "changed")
    opened = store.replay(frames(2), [first])
    episode = store.episodes()[0]
    assert episode["currently_open"] and episode["open_at_sequence_end"]
    assert episode["duration_frames"] == 0
    assert store.episodes(frame_id="frame:0") == []
    assert store.episodes(frame_id="frame:1")[0]["episode_id"] == episode["episode_id"]
    continuation = assessment(1, [phase("continue")], "changed")
    continued = store.replay(frames(3), [first, continuation])
    assert store.episodes()[0]["duration_frames"] == 1
    assert store.episodes()[0]["continuations"][0]["frame_id"] == "frame:2"
    end = phase("end")
    end["episode_id"] = episode["episode_id"]
    closed = store.replay(frames(4), [first, continuation, assessment(2, [end], "changed")])
    assert closed["entries"][:len(continued["entries"])] == continued["entries"]
    result = store.episodes()[0]
    assert not result["currently_open"] and not result["open_at_sequence_end"]
    assert result["duration_frames"] == 2
    assert result["end_frame"] == "frame:3"
    assert store.episodes(frame_id="frame:2")[0]["active_at_frame"]
    assert store.episodes(frame_id="frame:3") == []
    assert store.read(generation=1) == opened


@pytest.mark.parametrize("events", [
    [phase("continue")], [phase("end")], [phase("start"), phase("end")],
    [phase("start"), phase("start")],
])
def test_unmatched_duplicate_or_contradictory_phases_fail(tmp_path, events):
    with pytest.raises(ValidationError):
        log(tmp_path).replay(frames(2), [assessment(0, events, "changed")])


def test_episode_reference_must_match_and_duplicate_start_rejected(tmp_path):
    first = assessment(0, [phase("start")], "changed")
    ending = phase("end")
    ending["episode_id"] = "not-the-active-episode"
    with pytest.raises(ValidationError, match="episode ID"):
        log(tmp_path).replay(frames(3), [first, assessment(1, [ending], "changed")])
    with pytest.raises(ValidationError, match="duplicate start"):
        log(tmp_path).replay(frames(3), [first, assessment(1, [phase("start")], "changed")])


def test_initial_relation_is_baseline_not_fabricated_start(tmp_path):
    inputs = frames(2)
    inputs[0]["states"] = [term("occlude", "player:1", "star:1"), term("stationary", "player:1")]
    store = log(tmp_path)
    result = store.replay(inputs, [assessment(0, [phase("end")], "changed")])
    events = [entry for entry in result["entries"] if entry["kind"] == "frame_event"]
    assert [entry["term"]["predicate"] for entry in events] == ["end"]
    episode = store.episodes()[0]
    assert episode["baseline_at_sequence_start"] and episode["start_event_id"] is None
    assert episode["duration_is_lower_bound"] and episode["end_frame"] == "frame:1"


def test_incoming_outgoing_actions_exact_payload_and_boundary_records(tmp_path):
    store = log(tmp_path)
    supplied = [
        action(0, "incoming"), action(0, "outgoing"),
        action(1, "incoming"), action(1, "outgoing"),
    ]
    result = store.replay(frames(2), [assessment(0)], actions=supplied)
    actions = [entry for entry in result["entries"] if entry["kind"] == "user_action"]
    assert len(actions) == 4
    assert [(entry["from_frame"], entry["to_frame"]) for entry in actions] == [
        (None, "frame:0"), ("frame:0", "frame:1"), ("frame:0", "frame:1"), ("frame:1", None),
    ]
    transition = next(entry for entry in result["entries"] if entry["kind"] == "transition_assessment")
    assert transition["action_ids"] == [actions[1]["action_id"], actions[2]["action_id"]]
    for entry in actions:
        assert entry["raw_payload"] == supplied[0]["raw_payload"]
        assert len(entry["normalized"]) == 2
        assert entry["provenance"]["recording_source"] == "recording:real-source"
    extended = store.replay(frames(3), [assessment(0), assessment(1)], actions=supplied)
    formerly_boundary = next(entry for entry in extended["entries"] if entry.get("action_id") == actions[-1]["action_id"])
    assert formerly_boundary["to_frame"] == "frame:2"
    assert not formerly_boundary["boundary"]
    assert store.read(generation=1) == result


@pytest.mark.parametrize("invalid", [
    {key: value for key, value in action(0, "outgoing").items() if key != "direction"},
    action(0, "ambiguous"), action(0, "outgoing", provider_direction="incoming"),
    action(0, "incoming", to_frame="frame:9"),
    action(3, "outgoing"),
])
def test_action_direction_is_never_guessed_or_silently_corrected(tmp_path, invalid):
    with pytest.raises(ValidationError):
        log(tmp_path).replay(frames(2), [assessment(0)], actions=[invalid])


def test_conflicting_same_order_actions_fail(tmp_path):
    with pytest.raises(ValidationError, match="contradictory action"):
        log(tmp_path).replay(frames(2), [assessment(0)], actions=[
            action(0, "outgoing"), action(0, "outgoing", raw_payload={"buttons": ["Left"]}),
        ])


def test_suffix_supersession_is_explicit_and_preserves_old_generation(tmp_path):
    store = log(tmp_path)
    original_frames = frames(3)
    assessments = [assessment(0), assessment(1)]
    first = store.replay(original_frames, assessments)
    original_bytes = {path: path.read_bytes() for path in store.path.glob("*.json")}
    changed = copy.deepcopy(original_frames)
    changed[1]["input_hash"] = "reprocessed-image"
    with pytest.raises(ConflictError, match="supersession"):
        store.replay(changed, assessments)
    with pytest.raises(ConflictError):
        store.replay(changed, assessments, supersede=True)
    updated = store.replay(changed, assessments, supersede=True, expected_generation=1)
    assert updated["generation"] == 2 and updated["superseded_from"] == 1
    assert updated["entries"][0] == first["entries"][0]
    assert updated["entries"][1]["id"] != first["entries"][1]["id"]
    assert store.read(generation=1) == first
    assert store.replay(changed, assessments) == updated
    for path, contents in original_bytes.items():
        assert path.read_bytes() == contents
    with pytest.raises(ConflictError, match="current generation"):
        store.replay(changed, assessments, expected_generation=1)
    with pytest.raises(ConflictError):
        store.replay(frames(1), [])


def test_late_action_on_an_earlier_pair_requires_explicit_supersession(tmp_path):
    store = log(tmp_path)
    store.replay(frames(3), [assessment(0), assessment(1)])
    with pytest.raises(ConflictError, match="supersession"):
        store.replay(frames(3), [assessment(0), assessment(1)], actions=[action(0, "outgoing")])


def test_raw_llm_channel_separation_idempotency_and_visible_invalid_output(tmp_path):
    store = log(tmp_path)
    canonical = store.replay(frames(2), [assessment(0, label="unknown")])
    pair = canonical["entries"][1]["source_pair"]
    proposed = {
        "assessment": "changed", "comparison_complete": True,
        "confidence": 0.7, "evidence": ["vision:response"], "uncertainty": ["possible identity ambiguity"],
        "events": [{
            "term": term("moved", "player:1"), "confidence": 0.7, "evidence": ["vision:mask"],
            "uncertainty": [], "rationale": "position differs",
        }],
    }
    raw = json.dumps(proposed, indent=2)
    result = store.record_hypotheses(raw, source_pair=pair, provenance=MODEL, entity_ids=ENTITIES)
    assert result["parsed"]["channel"] == "llm_hypotheses"
    assert store.read() == canonical
    assert store.hypotheses()[0]["raw_response"] == raw
    assert store.record_hypotheses(raw, source_pair=pair, provenance=MODEL, entity_ids=ENTITIES) == result
    assert len(store.hypotheses()) == 2
    bad = ":- assertz(frame_event(hacked))."
    for _ in range(2):
        with pytest.raises(HypothesisValidationError):
            store.record_hypotheses(bad, source_pair=pair, provenance=MODEL, entity_ids=ENTITIES)
    records = store.hypotheses()
    assert records[-2]["raw_response"] == bad
    assert records[-1]["status"] == "invalid" and records[-1]["errors"]
    assert len(records) == 4 and store.read() == canonical
    with pytest.raises(ValidationError, match="adjacent"):
        store.record_hypotheses(raw, source_pair={**pair, "after_hash": "old"}, provenance=MODEL, entity_ids=ENTITIES)


def _replay_worker(path):
    return log(path).replay(frames(3), [assessment(0), assessment(1)])["head_id"]


def test_concurrent_process_replay_is_a_single_generation(tmp_path):
    with ProcessPoolExecutor(max_workers=3, mp_context=multiprocessing.get_context("spawn")) as executor:
        futures = [executor.submit(_replay_worker, str(tmp_path)) for _ in range(6)]
        heads = [future.result(timeout=40) for future in futures]
    assert len(set(heads)) == 1
    assert len(log(tmp_path).history()) == 1


def test_corrupted_log_never_returns_success_shaped_empty_timeline(tmp_path):
    store = log(tmp_path)
    store.replay(frames(2), [assessment(0)])
    path = next(store.path.glob("*.json"))
    path.write_text(path.read_text(encoding="utf-8").replace("no_material_change", "unknown"), encoding="utf-8")
    with pytest.raises(IntegrityError):
        store.read()
