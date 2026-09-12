import json
import pytest
from fastapi import HTTPException

from omega_vision.evaluation import event_recordings as events
from omega_vision.evaluation.event_recording_cases import Body, Case, Expected, Frame
from omega_vision.perception.contextual_memory import recording_context
from omega_vision.perception.contextual_rules import ContextualRuleStore
from omega_vision.perception.event_records import Term
from omega_vision.services import recording_test_execution as execution
from omega_vision.services import recording_test_learning as learning
from omega_vision.services import video_import_semantics as semantics

from test_recording_test_execution import PREFIX, advance, create, finish_steps, fingerprints, service


@pytest.mark.parametrize("processed_future", [True, False])
def test_activation_rejects_already_processed_future_before_any_audit(service, monkeypatch, processed_future):
    home, _ = service
    activation = publish_learning_inputs(home)
    marker = home.joinpath(*activation.split("/"), "1", "event_deduction_0", "authored_prolog", "result.json")
    if processed_future:
        marker.parent.mkdir(parents=True)
        marker.write_text("{}")
    class ReadOnlyProposal:
        def __init__(self, context):
            pass

        def get(self, candidate_id):
            return {"candidate_id": candidate_id}

        def evaluate(self, *args, **kwargs):
            if processed_future:
                pytest.fail("Rejected activation must not write an evaluation audit")
            return {"eligible": False}
    monkeypatch.setattr(learning, "ContextualRuleStore", ReadOnlyProposal)
    state = {
        "candidates": [{"id": "candidate", "origin": {"visualSequenceId": "recordings/events_tests/learning_train_b", "frameId": "4"}}],
        "learning": {"controlsExecuted": True, "heldOutExampleCount": 1}, "learningExamples": [],
    }
    before = fingerprints(home)
    with pytest.raises(HTTPException, match="already-processed" if processed_future else "Native promotion gates"):
        learning.approve_candidate(home, state, "candidate", {
            "approvedBy": "reviewer", "activation": {"visualSequenceId": activation, "frameId": "0"},
        })
    assert fingerprints(home) == before


def publish_learning_inputs(home):
    files, references = {}, []
    definitions = [
        ("train_a", "training", 7, (225, 60, 50), 2),
        ("train_b", "training", 22, (50, 125, 230), 3),
        ("negative", "training_control", 31, (55, 205, 75), 0),
        ("heldout_a", "validation", 14, (215, 180, 30), 4),
        ("heldout_negative", "test_control", 27, (155, 70, 210), 0),
        ("reuse", "test", 11, (55, 185, 190), 3),
    ]
    for suffix, partition, y, color, dx in definitions:
        name = "learning_" + suffix
        frames = tuple(Frame("", (Body("actor", 4 + index * dx, y, ("1" * 10,) * 10, color),))
                       for index in range(5))
        case = Case(name, "Independent measured displacement", frames,
                    (Expected(4, Term("moved", ("actor",))),) if dx else (),
                    assessment=None if dx else "no_material_change")
        files.update(events._case_files(case))
        references.append({"visualSequenceId": "recordings/events_tests/" + name, "label": suffix,
                           "partition": partition, "frameCount": len(frames)})
    tests = []
    for test_id, sources in (("moved", references[:-1]), ("reuse_case", references[-1:])):
        tests.append({"id": test_id, "title": test_id, "summary": "Independent pixel measurements",
                      "group": "Events", "executionStatus": "not_run",
                      "documentationFile": f"documentation/{test_id}.md", "recordings": sources})
        files[("recordings", "events_tests", "documentation", test_id + ".md")] = b"# Measured test"
    files[("recordings", "events_tests", "tests.json")] = events._json({"schemaVersion": 1, "count": 2, "tests": tests})
    events.publish_recording_files(home, files)
    return references[-1]["visualSequenceId"]


def test_real_induction_freezes_heldout_requires_approval_and_reuses_native_rule(service, monkeypatch):
    home, client = service
    activation = publish_learning_inputs(home)
    original = semantics._examples
    labels = []
    def measured_examples(root, units, partition):
        result, source = original(root, units, partition)
        assert all(example["label_source"] != "candidate" for example in result)
        labels.extend(result)
        return result, source
    monkeypatch.setattr(semantics, "_examples", measured_examples)
    train_rules = {}
    run = create(client, learn=True)
    while run["status"] not in execution._TERMINAL:
        if len([item for item in run["recordings"] if item["status"] == "completed"]) == 3 and not train_rules:
            assert any(item["evaluation"]["metrics"]["training_pairs"] >= 2
                       and item["evaluation"]["metrics"]["distinct_sequences"] >= 2 for item in run["candidates"])
            train_rules = {item["id"]: item["rule"] for item in run["candidates"]}
            monkeypatch.setattr(learning, "induce_detector_rules", lambda *a, **k: (_ for _ in ()).throw(AssertionError("Held-out threshold fitting")))
            monkeypatch.setattr(learning, "induce_transition_rules", lambda *a, **k: (_ for _ in ()).throw(AssertionError("Held-out transition fitting")))
        run = advance(client, run)
    assert run["status"] == "completed"
    assert labels and train_rules
    assert run["learning"]["controlsExecuted"] and run["learning"]["heldOutExampleCount"] > 0
    assert all(item["rule"] == train_rules[item["id"]] for item in run["candidates"])
    candidate = next(item for item in run["candidates"] if item["eligible"] and item["kind"] == "event_detector"
                     and item["rule"]["head"]["predicate"] == "moved")
    assert candidate["status"] != "promoted" and not candidate["automaticPromotion"]
    body = {"workspaceId": "arc3_random_player", "expectedRevision": run["revision"],
            "confirmed": True, "approvedBy": "test-reviewer"}
    before = fingerprints(home)
    bad = {**body, "activation": {"visualSequenceId": run["recordings"][0]["visualSequenceId"], "frameId": "0"}}
    response = client.post(f"{PREFIX}/runs/{run['id']}/candidates/{candidate['id']}/approve", json=bad)
    assert response.status_code == 409 and "backdate" in response.text
    assert before == fingerprints(home), "Rejected activation wrote a native audit"
    response = client.post(f"{PREFIX}/runs/{run['id']}/candidates/{candidate['id']}/approve", json={
        **body, "activation": {"visualSequenceId": activation, "frameId": "0"},
    })
    assert response.status_code == 200, response.text
    approved = response.json()["candidate"]
    assert approved["status"] == "promoted" and approved["activation"]["effectiveAfterFrameOrder"] == 0
    directory = home.joinpath(*activation.split("/"))
    assert not ContextualRuleStore(recording_context(home, directory, "0")).published_candidates()
    published = ContextualRuleStore(recording_context(home, directory, "1")).published_candidates()
    assert candidate["id"] in {item["candidate_id"] for item in published}
    reuse = finish_steps(client, create(client, "reuse_case"))
    assert reuse["status"] == "completed"
    result = json.loads((directory / "4" / semantics.EVENTS / "result.json").read_text())
    assert candidate["id"] in json.dumps(result), "Later real event deduction did not reuse the approved native rule"


@pytest.mark.parametrize("overlap", ["sequence", "fingerprint", "image", "none"])
def test_held_out_independence_uses_actual_source_images_not_composite_pair_hashes(overlap):
    from omega_vision.services.recording_test_learning import _split_independent_examples
    training = {"sequenceId": "train", "sequenceFingerprint": "train-sequence",
                "sourceImageHashes": ["raw-training-pixels"]}
    held = {"sequenceId": "held", "sequenceFingerprint": "held-sequence",
            "sourceImageHashes": ["raw-held-pixels"]}
    if overlap == "sequence":
        held["sequenceId"] = training["sequenceId"]
    elif overlap == "fingerprint":
        held["sequenceFingerprint"] = training["sequenceFingerprint"]
    elif overlap == "image":
        held["sourceImageHashes"].append(training["sourceImageHashes"][0])
    example = {"partition": "held_out", "sequence_fingerprint": held["sequenceFingerprint"],
               "source_pair": {"sequence_id": held["sequenceId"], "before_hash": "composite-before",
                               "after_hash": "composite-after"}}
    sources = {(held["sequenceId"], held["sequenceFingerprint"]): held}
    accepted, excluded = _split_independent_examples([example], sources, [training])
    assert accepted == ([example] if overlap == "none" else [])
    assert excluded == ([] if overlap == "none" else [example])


def test_missing_held_out_image_provenance_is_not_independent_evidence():
    from omega_vision.services.recording_test_learning import _split_independent_examples
    example = {"partition": "held_out", "sequence_fingerprint": "held",
               "source_pair": {"sequence_id": "held"}}
    with pytest.raises(ValueError, match="source-image provenance"):
        _split_independent_examples([example], {}, [])
