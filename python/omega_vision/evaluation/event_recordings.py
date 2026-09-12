"""Materialize the event vocabulary examples as ordinary shared recordings.

Run from the user's checkout:
    python -m omega_vision.evaluation.event_recordings

No recognition, rules, memory, preference changes, services or game simulation
are run. Existing equal inputs are reused; differing files are never overwritten.
"""

from __future__ import annotations

from dataclasses import asdict
from io import BytesIO
import hashlib
import json
from pathlib import Path
from typing import Any

from PIL import Image

from omega_vision.inherited_source_overlay import shared_storage_path, storage_path, vision_data_root
from omega_vision.perception._event_journal import writer_lock
from omega_vision.perception.event_records import PHASES, PREDICATES, Term, render_term, validate_term
from omega_vision.perception.visual_sequence_list_cache import visual_sequence_list_mutation

from .event_recording_cases import BACKGROUND, SIZE, Case, Frame, event_cases

SUITE_ID = "event-mini-recordings-v1"
GAME_ID = "events_tests"
SAMPLE_SECONDS = 1
# An explicit fixture clock, not the date of a captured game or current execution.
FIXTURE_TIME = "2000-01-01T00:00:00Z"


def target_key(term: Term) -> str:
    if term.predicate in PHASES:
        return f"{term.predicate}({term.args[0].predicate})"
    return term.predicate


def required_targets() -> set[str]:
    return {
        name for name, spec in PREDICATES.items()
        if spec.category == "event" and name not in PHASES
    } | {
        f"{phase}({name})"
        for name, spec in PREDICATES.items() if spec.category == "relation"
        for phase in PHASES
    }


def validate_cases(cases: tuple[Case, ...]) -> None:
    if len({case.name for case in cases}) != len(cases):
        raise ValueError("Duplicate event recording name")
    covered = set()
    for case in cases:
        if not case.name or any(char not in "abcdefghijklmnopqrstuvwxyz_" for char in case.name):
            raise ValueError("Event recording names must be plain lowercase identifiers")
        if not 2 <= len(case.frames) <= 8:
            raise ValueError(f"{case.name}: miniature recordings need two to eight frames")
        for frame in case.frames:
            if len({body.entity for body in frame.bodies}) != len(frame.bodies):
                raise ValueError(f"{case.name}: duplicate entity in a frame")
            for body in frame.bodies:
                if (not body.mask or not body.mask[0]
                        or any(len(row) != len(body.mask[0]) or set(row) - {"0", "1"} for row in body.mask)
                        or not any("1" in row for row in body.mask)):
                    raise ValueError(f"{case.name}: invalid binary mask")
            for term in frame.annotations:
                validate_term(term, entity_ids=case.entity_ids)
        for event in case.expected:
            if not 1 <= event.frame < len(case.frames):
                raise ValueError(f"{case.name}: event must target an actual noninitial frame")
            validate_term(event.term, entity_ids=case.entity_ids, categories={"event"})
            covered.add(target_key(event.term))
        if not case.expected and case.assessment not in {"unknown", "no_material_change"}:
            raise ValueError(f"{case.name}: case needs an event target or explicit assessment")
    if covered != required_targets():
        raise ValueError(f"Event coverage mismatch: missing={sorted(required_targets() - covered)}, "
                         f"extra={sorted(covered - required_targets())}")


def render_frame(frame: Frame) -> bytes:
    image = Image.new("RGB", SIZE, BACKGROUND)
    for body in frame.bodies:
        for y, row in enumerate(body.mask):
            for x, pixel in enumerate(row):
                px, py = body.x + x, body.y + y
                if pixel == "1" and 0 <= px < SIZE[0] and 0 <= py < SIZE[1]:
                    image.putpixel((px, py), body.color)
    stream = BytesIO()
    image.save(stream, format="PNG")
    return stream.getvalue()


def _json(value: Any) -> bytes:
    return (json.dumps(value, indent=2, sort_keys=True, ensure_ascii=True) + "\n").encode("utf-8")


def _case_files(case: Case) -> dict[tuple[str, ...], bytes]:
    prefix = ("recordings", GAME_ID, case.name)
    reference = "/".join(("data", *prefix))
    files = {}
    moves = []
    frames = []
    for index, frame in enumerate(case.frames):
        png = render_frame(frame)
        frame_id = str(index)
        image_ref = f"{reference}/{frame_id}/image.png"
        files[(*prefix, frame_id, "image.png")] = png
        # FRAME means advance a sampled observation, never the oracle event name.
        action = None if index == 0 else "FRAME"
        state = {
            "kind": "synthetic_event_test_frame", "game_id": GAME_ID,
            "game_directory": GAME_ID, "level": "1", "state": "NOT_FINISHED",
            "step_count": index, "incoming_action": action,
            "action_directory": frame_id if index else None,
            "action_data": {}, "parent_node": f"../{index - 1}" if index else None,
            "action_path": [str(step) for step in range(1, index + 1)],
            "at_seconds": index * SAMPLE_SECONDS, "recorded_at": FIXTURE_TIME,
            "image_hash": hashlib.sha256(png).hexdigest()[:16],
        }
        files[(*prefix, frame_id, "state.json")] = _json(state)
        moves.append({
            "index": index, "action": action, "data": {},
            "directory": f"{reference}/{frame_id}", "state": "NOT_FINISHED",
            "level": "1", "recorded_at": FIXTURE_TIME,
        })
        frames.append({
            "frameId": frame_id, "frameOrder": index, "atSeconds": index * SAMPLE_SECONDS,
            "image": image_ref, "sha256": hashlib.sha256(png).hexdigest(),
            "caption": frame.caption, "authoredObjects": [asdict(body) for body in frame.bodies],
            "authoredAnnotations": [term.to_dict() for term in frame.annotations],
        })
    expected = {
        "schemaVersion": 1, "suiteId": SUITE_ID, "caseId": case.name,
        "description": case.description, "sequenceId": reference,
        "origin": "authored_synthetic_test_oracle", "recognizerStatus": "not_run",
        "entityIds": case.entity_ids, "canvas": {"width": SIZE[0], "height": SIZE[1], "background": BACKGROUND},
        "sampleIntervalSeconds": SAMPLE_SECONDS, "requirements": case.requirements,
        "fixtureArgumentConventions": {
            "group_member": ["member", "group"],
            "member_added": ["member", "group"], "member_removed": ["member", "group"],
            "split": ["source", "child_a", "child_b"], "merged": ["source_a", "source_b", "result"],
            "status": "fixture_conventions_not_a_new_runtime_schema",
        },
        "frames": frames, "expectedEvents": [
            {
                "fromFrameId": str(event.frame - 1), "toFrameId": str(event.frame),
                "term": validate_term(event.term, entity_ids=case.entity_ids).to_dict(),
                "target": target_key(event.term),
                "display": render_term(event.term, entity_ids=case.entity_ids),
            }
            for event in case.expected
        ],
        "expectedAssessment": case.assessment,
        "comparisonPolicy": {
            "eventMatching": "required_subset_after_independent_entity_alignment",
            "incidentalEventsAllowed": True,
            "initialFrame": "baseline_only",
            "groundTruthIsRecognizerInput": False,
        },
    }
    files[(*prefix, "expected_events.json")] = _json(expected)
    # Publish the ordinary discovery marker after every numbered image and oracle.
    files[(*prefix, "recording.json")] = _json({
        "kind": "arc3_play_recording", "source": "synthetic_event_tests",
        "session_id": None, "game_id": GAME_ID, "game_directory": GAME_ID,
        "level": "1", "level_directory": reference,
        "started_at": FIXTURE_TIME, "updated_at": FIXTURE_TIME, "last_event": "fixture_created",
        "description": case.description, "fixture_suite": SUITE_ID,
        "expected_events_file": "expected_events.json", "moves": moves,
    })
    return files


def _path(home: Path, parts: tuple[str, ...]) -> Path:
    path = storage_path(home, *parts)
    if path != home.joinpath(*parts):
        raise ValueError("Event recording output cannot redirect to another physical path")
    return path


def event_recording_files() -> tuple[dict[tuple[str, ...], bytes], dict[str, Any]]:
    """Build the immutable v1 inputs without touching storage."""
    cases = event_cases()
    validate_cases(cases)
    files = {path: data for case in cases for path, data in _case_files(case).items()}
    inventory = {
        "schemaVersion": 1, "suiteId": SUITE_ID, "gameId": GAME_ID,
        "description": "One miniature recording per event type or lasting relation, plus assessment controls.",
        "loadInstructions": "Choose the events_tests recording group, then an individual event type.",
        "recognizerStatus": "not_run",
        "scope": "Every registered event and every start/continue/end relation phase, not all real-world events.",
        "oraclePolicy": "Expected events and world annotations are test intent, never detected facts or published memory.",
        "frameCount": sum(len(case.frames) for case in cases),
        "targetCount": len(required_targets()),
        "cases": [{
            "caseId": case.name, "description": case.description,
            "recording": f"data/recordings/{GAME_ID}/{case.name}",
            "frameCount": len(case.frames),
            "targets": [target_key(event.term) for event in case.expected],
            "expectedAssessment": case.assessment,
        } for case in cases],
    }
    files[("recordings", GAME_ID, "suite.json")] = _json(inventory)
    return files, inventory


def publish_recording_files(root: Path, files: dict[tuple[str, ...], bytes]) -> dict[str, int]:
    """Preflight an additive publication under the event suite's shared writer lock."""
    home = vision_data_root(root)
    if any(parts[:2] != ("recordings", GAME_ID) for parts in files):
        raise ValueError("Event fixture publication is restricted to recordings/events_tests")
    lock_parts = ("locks", SUITE_ID)
    _path(home, (*lock_parts, ".writer.lock"))
    with writer_lock(_path(home, lock_parts)):
        # Preflight the entire suite before writing any recording: do not quietly
        # overwrite a user's edited case or partially replace a prior generation.
        pending = []
        for parts, data in files.items():
            path = _path(home, parts)
            for parent in path.parents:
                if parent == home:
                    break
                if parent.exists() and not parent.is_dir():
                    raise FileExistsError(f"Existing fixture parent is not a directory; preserved: {parent}")
            if path.exists():
                if not path.is_file() or path.read_bytes() != data:
                    raise FileExistsError(f"Existing event fixture differs; preserved without overwrite: {path}")
            else:
                pending.append((parts, data))
        if pending:
            with visual_sequence_list_mutation(home):
                for parts, data in pending:
                    path = _path(home, parts)
                    path.parent.mkdir(parents=True, exist_ok=True)
                    with path.open("xb") as stream:
                        stream.write(data)
    return {"createdFileCount": len(pending), "reusedFileCount": len(files) - len(pending)}


def create_event_recordings(root: Path) -> dict[str, Any]:
    vision_data_root(root)
    files, inventory = event_recording_files()
    return {**inventory, **publish_recording_files(root, files)}


def main() -> None:
    result = create_event_recordings(shared_storage_path())
    print(json.dumps({
        "directory": str(shared_storage_path("recordings", GAME_ID)),
        "recordings": len(result["cases"]), "frames": result["frameCount"],
        "eventTargets": result["targetCount"], "createdFiles": result["createdFileCount"],
        "reusedFiles": result["reusedFileCount"],
    }, indent=2))


if __name__ == "__main__":
    main()
