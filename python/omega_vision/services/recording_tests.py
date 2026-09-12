"""Read-only, file-backed Sanity Test documentation in the shared fixture dataset."""

from __future__ import annotations

import json
from pathlib import Path
import re
from typing import Any

from fastapi import APIRouter, HTTPException, Query

from omega_vision.inherited_source_overlay import shared_storage_path, storage_path

from .arc3_play import _workspace_root

router = APIRouter(prefix="/recognition/recording-tests")
_IDENTIFIER = re.compile(r"[a-z][a-z0-9_]{0,79}\Z")
_PREFIX = ("recordings", "events_tests")
_FIELDS = ("id", "group", "title", "summary", "executionStatus", "recordings")
_INDEX_FILES = (
    "tests.json", "visual_memory_tests.json", "action_mechanism_tests.json",
    "causal_event_tests.json", "fog_action_tests.json",
)


def _path(home: Path, *parts: str) -> Path:
    try:
        resolved = storage_path(home, *_PREFIX, *parts)
    except (ValueError, OSError) as error:
        raise HTTPException(403, f"Recording test path is unavailable: {error}") from error
    if resolved != home.joinpath(*_PREFIX, *parts):
        raise HTTPException(403, "Recording test resources cannot redirect to another physical path")
    return resolved


def _text(path: Path, resource: str) -> str:
    try:
        if path.stat().st_size > 2_000_000:
            raise HTTPException(409, f"{resource} is too large")
        return path.read_text(encoding="utf-8")
    except FileNotFoundError as error:
        raise HTTPException(404, f"{resource} is unavailable") from error
    except (OSError, UnicodeError) as error:
        raise HTTPException(409, f"{resource} is unreadable or corrupt") from error


def _json(path: Path, resource: str) -> dict[str, Any]:
    try:
        value = json.loads(_text(path, resource))
    except ValueError as error:
        raise HTTPException(409, f"{resource} contains invalid JSON") from error
    if not isinstance(value, dict):
        raise HTTPException(409, f"{resource} must be a JSON object")
    return value


def _identifier(value: Any) -> bool:
    return isinstance(value, str) and _IDENTIFIER.fullmatch(value) is not None


def _home(workspace_id: str) -> Path:
    _workspace_root(workspace_id)  # Validate the editor context, never partition storage by it.
    try:
        return shared_storage_path()
    except (ValueError, OSError) as error:
        raise HTTPException(403, f"Shared recording tests are unavailable: {error}") from error


def _index(home: Path) -> list[dict[str, Any]] | None:
    tests: list[dict[str, Any]] = []
    published = False
    for filename in _INDEX_FILES:
        path = _path(home, filename)
        if not path.exists():
            continue
        index = _json(path, f"Recording test index {filename}")
        entries = index.get("tests")
        if (type(index.get("schemaVersion")) is not int or index["schemaVersion"] != 1
                or not isinstance(entries, list) or type(index.get("count")) is not int
                or index["count"] != len(entries)):
            raise HTTPException(409, f"Recording test index {filename} has an invalid schema or count")
        published = True
        tests.extend(entries)
    if not published:
        return None
    seen: set[str] = set()
    sequences: set[str] = set()
    for test in tests:
        if not isinstance(test, dict) or not _identifier(test.get("id")):
            raise HTTPException(409, "Recording test index contains an unsafe test ID")
        test_id = test["id"]
        if test_id in seen:
            raise HTTPException(409, "Recording test index contains duplicate test IDs")
        seen.add(test_id)
        if (test.get("group") not in {"Events", "Pressure plates", "Pushing"}
                or test.get("executionStatus") != "not_run"
                or any(not isinstance(test.get(key), str) or not test[key].strip() for key in ("title", "summary"))
                or test.get("documentationFile") != f"documentation/{test_id}.md"
                or not isinstance(test.get("recordings"), list) or not test["recordings"]):
            raise HTTPException(409, f"Recording test metadata is corrupt: {test_id}")
        for recording in test["recordings"]:
            if not isinstance(recording, dict):
                raise HTTPException(409, f"Recording reference is corrupt: {test_id}")
            identity = recording.get("visualSequenceId")
            parts = identity.split("/") if isinstance(identity, str) else []
            if (len(parts) != 3 or tuple(parts[:2]) != _PREFIX or not _identifier(parts[2])
                    or identity in sequences
                    or type(recording.get("frameCount")) is not int or not 2 <= recording["frameCount"] <= 1000
                    or any(not isinstance(recording.get(key), str) or not recording[key].strip()
                           for key in ("label", "partition"))):
                raise HTTPException(409, f"Recording test contains an unsafe or corrupt recording reference: {test_id}")
            sequences.add(identity)
    return tests


def _availability(home: Path, test: dict[str, Any], *, frames: bool = False) -> None:
    test_id = test["id"]
    document = _path(home, "documentation", f"{test_id}.md")
    if not document.is_file():
        raise HTTPException(404, f"Recording test documentation is unavailable: {test_id}")
    for recording in test["recordings"]:
        identity = recording["visualSequenceId"]
        name = identity.split("/")[2]
        manifest = _json(_path(home, name, "recording.json"), f"Recording {name}")
        moves = manifest.get("moves")
        if (manifest.get("kind") != "arc3_play_recording" or manifest.get("game_id") != "events_tests"
                or manifest.get("game_directory") != "events_tests" or not isinstance(moves, list)
                or len(moves) != recording["frameCount"]):
            raise HTTPException(409, f"Recording manifest disagrees with test index: {name}")
        for index, move in enumerate(moves):
            if (not isinstance(move, dict) or type(move.get("index")) is not int or move["index"] != index
                    or move.get("directory") != f"data/{identity}/{index}"):
                raise HTTPException(409, f"Recording manifest has invalid numbered frame paths: {name}")
            if frames:
                for filename in ("image.png", "state.json"):
                    if not _path(home, name, str(index), filename).is_file():
                        raise HTTPException(404, f"Recording frame is unavailable: {name}/{index}/{filename}")


def _metadata(test: dict[str, Any]) -> dict[str, Any]:
    return {
        **{key: test[key] for key in _FIELDS if key != "recordings"},
        "recordings": [
            {key: recording[key] for key in ("visualSequenceId", "label", "partition", "frameCount")}
            for recording in test["recordings"]
        ],
    }


@router.get("")
def list_recording_tests(workspaceId: str = Query(...)) -> dict[str, Any]:
    home = _home(workspaceId)
    tests = _index(home)
    if tests is None:
        return {"tests": [], "count": 0, "message": "Recording test dataset has not been published."}
    for test in tests:
        _availability(home, test)
    return {"tests": [_metadata(test) for test in tests], "count": len(tests)}


from .recording_test_execution import router as execution_router

router.include_router(execution_router)


@router.get("/{test_id}")
def get_recording_test(test_id: str, workspaceId: str = Query(...)) -> dict[str, Any]:
    if not _identifier(test_id):
        raise HTTPException(422, "Test ID must be a plain lowercase identifier")
    home = _home(workspaceId)
    tests = _index(home)
    test = next((item for item in tests or [] if item["id"] == test_id), None)
    if test is None:
        raise HTTPException(404, f"Recording test is unknown or not published: {test_id}")
    _availability(home, test, frames=True)
    documentation = _text(_path(home, "documentation", f"{test_id}.md"), f"Documentation for {test_id}")
    if not documentation.strip():
        raise HTTPException(409, f"Recording test documentation is empty: {test_id}")
    return {**_metadata(test), "documentation": documentation}
