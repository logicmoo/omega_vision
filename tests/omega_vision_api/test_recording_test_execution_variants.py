from copy import deepcopy
from io import BytesIO
import json

from PIL import Image
import pytest

from omega_vision.evaluation import event_recordings as events
from omega_vision.evaluation.event_recording_cases import Body, Case, Expected, Frame
from omega_vision.perception.event_records import Term
from omega_vision.services import recording_test_scoring as scoring

from test_recording_test_execution import PREFIX, fingerprints, publish, service


def variant_files():
    name = "move_warmup_v2"
    frames = tuple(Frame("", (Body("actor", 8 + index * 2, 10),)) for index in range(3))
    files = events._case_files(Case(name, "Causal warmup", frames, (Expected(2, Term("moved", ("actor",))),)))
    test = {
        "id": name, "title": "Movement with warmup", "summary": "Independent causal-history variant",
        "group": "Events", "executionStatus": "not_run", "documentationFile": f"documentation/{name}.md",
        "recordings": [{"visualSequenceId": f"recordings/events_tests/{name}", "label": "Warmup",
                        "partition": "test", "frameCount": 3}],
    }
    files[("recordings", "events_tests", "documentation", name + ".md")] = b"# Causal history\nSaved variant documentation."
    return files, test


@pytest.mark.parametrize("problem", [None, "duplicate_test", "duplicate_recording"])
def test_named_causal_index_is_additive_shared_and_rejects_cross_index_duplicates(service, problem):
    home, client = service
    publish(home)
    originals = fingerprints(home / "recordings" / "events_tests")
    files, test = variant_files()
    if problem == "duplicate_test":
        test.update(id="moved", documentationFile="documentation/moved.md")
    elif problem == "duplicate_recording":
        test["recordings"][0]["visualSequenceId"] = "recordings/events_tests/moved"
    files[("recordings", "events_tests", "causal_event_tests.json")] = events._json({
        "schemaVersion": 1, "count": 1, "tests": [test],
    })
    files[("recordings", "events_tests", "unregistered_tests.json")] = b"not valid JSON; do not enumerate it"
    events.publish_recording_files(home, files)
    after_publication = fingerprints(home)
    inputs_after = fingerprints(home / "recordings" / "events_tests")
    assert all(inputs_after[name] == value for name, value in originals.items())
    for workspace in ("arc3_random_player", "another_workspace"):
        response = client.get(PREFIX, params={"workspaceId": workspace})
        assert response.status_code == (409 if problem else 200), response.text
        if not problem:
            assert {test["id"] for test in response.json()["tests"]} == {"moved", "move_warmup_v2"}
            detail = client.get(f"{PREFIX}/move_warmup_v2", params={"workspaceId": workspace})
            assert detail.status_code == 200
            assert detail.json()["documentation"].startswith("# Causal history")
    assert fingerprints(home) == after_publication


@pytest.mark.parametrize("decision", [None, "1", "2", "-1", "3"])
def test_variant_scoring_uses_recording_oracle_and_declared_decision_not_variant_name(service, decision):
    home, _ = service
    files, test = variant_files()
    prefix = ("recordings", "events_tests", test["id"])
    oracle = json.loads(files[(*prefix, "expected_events.json")])
    if decision is not None:
        oracle["expectedEvents"][0].update(fromFrameId="0", toFrameId="1", decisionFrameId=decision)
        files[(*prefix, "expected_events.json")] = events._json(oracle)
    events.publish_recording_files(home, files)
    detected_term = {"predicate": "moved", "args": ["independently_recognized_track"]}
    frozen = []
    for index in range(3):
        image = Image.open(BytesIO(files[(*prefix, str(index), "image.png")])).convert("RGB")
        points = [(x, y) for y in range(image.height) for x in range(image.width)
                  if image.getpixel((x, y)) != (0, 0, 0)]
        uid = f"measured-group-{index}"
        frozen.append({
            "frameId": str(index), "inferenceFrozen": True,
            "core": {
                "groups": [{"uid": uid, "points": points}],
                "tracks": [{"observationUid": uid, "trackUid": "independently_recognized_track"}],
                "events": {"assessment": {"events": [{"term": deepcopy(detected_term)}] if index == 2 else []},
                           "complete_predicates": ["moved"]},
                "evidenceRefs": [f"test-double:frozen-stage-{index}"],
            },
            "observer": {"supported": True, "nativeMemoryRefs": []},
        })
    directory = home.joinpath(*prefix)
    if decision in {"-1", "3"}:
        with pytest.raises(ValueError, match="decision frame"):
            scoring.score_recording(home, directory, "unrelated_variant_identifier", frozen, {})
        return
    result = scoring.score_recording(home, directory, "unrelated_variant_identifier", frozen, {})
    assert result["outcome"] == ("failed" if decision == "1" else "passed")
    assert result["checks"][0]["name"] == "moved(actor)"
    expected_frame = decision or "2"
    assert result["checks"][0]["evidenceRefs"] == [f"test-double:frozen-stage-{expected_frame}"]
