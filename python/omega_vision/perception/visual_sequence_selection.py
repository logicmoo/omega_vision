"""One shared, revisioned Visual Sequence choice; no payloads or workspace keys."""
from __future__ import annotations

from collections.abc import Callable
from contextlib import contextmanager
import json
from pathlib import Path
import re
from typing import Any

from omega_vision.inherited_source_overlay import storage_path
from omega_vision.perception._event_journal import ConflictError, atomic_json, writer_lock
from omega_vision.perception.observation_identity import content_hash

DEFAULT_VISUAL_SEQUENCE = "recordings/ls20/20260718-154544"


def _identifier(value: Any) -> str:
    if (not isinstance(value, str) or not re.fullmatch(r"[A-Za-z0-9][A-Za-z0-9._/-]*", value)
            or any(part in {"", ".", ".."} for part in value.split("/"))):
        raise ValueError("Visual Sequence selection requires an exact catalog ID, not a path")
    return value


def _path(root: Path, filename: str) -> Path:
    home = storage_path(root)
    expected = home / "preferences" / filename
    path = storage_path(root, "preferences", filename)
    if path != expected or storage_path(root, "preferences") != expected.parent:
        raise PermissionError("Shared Visual Sequence preferences cannot redirect to another location")
    return path


def _state(identifier: str, version: int) -> dict[str, Any]:
    value = {"schemaVersion": 1, "visualSequenceId": identifier, "version": version}
    return {**value, "revision": content_hash(value)}


def load_selection(root: Path) -> dict[str, Any]:
    path = _path(root, "visual_sequence_selection.json")
    if not path.exists():
        return _state(DEFAULT_VISUAL_SEQUENCE, 0)
    value = json.loads(path.read_text(encoding="utf-8"))
    if (not isinstance(value, dict)
            or set(value) != {"schemaVersion", "visualSequenceId", "version", "revision"}
            or value.get("schemaVersion") != 1
            or type(value.get("version")) is not int or value["version"] < 1):
        raise ValueError("Invalid shared Visual Sequence preference schema")
    expected = _state(_identifier(value["visualSequenceId"]), value["version"])
    if value != expected:
        raise ValueError("Shared Visual Sequence preference revision mismatch")
    return value


def save_selection(root: Path, identifier: str, expected_revision: str, *,
                   validate: Callable[[str], None]) -> dict[str, Any]:
    identifier = _identifier(identifier)
    if not isinstance(expected_revision, str) or not expected_revision:
        raise ValueError("expectedRevision is required")
    path = _path(root, "visual_sequence_selection.json")
    _path(root, ".writer.lock")
    with writer_lock(path.parent):
        previous = load_selection(root)
        if previous["revision"] != expected_revision:
            raise ConflictError("The shared Visual Sequence changed; reload before selecting again")
        validate(identifier)
        if previous["visualSequenceId"] == identifier:
            return previous
        value = _state(identifier, previous["version"] + 1)
        atomic_json(_path(root, path.name), value)
        return value


@contextmanager
def selection_guard(root: Path, identifier: str, expected_revision: str):
    """Bind a source-sensitive command to the selection without changing it."""
    identifier = _identifier(identifier)
    if not isinstance(expected_revision, str) or not expected_revision:
        raise ValueError("An expected shared selection revision is required")
    path = _path(root, "visual_sequence_selection.json")
    _path(root, ".writer.lock")
    with writer_lock(path.parent):
        current = load_selection(root)
        if current["visualSequenceId"] != identifier or current["revision"] != expected_revision:
            raise ConflictError("Shared Visual Sequence changed; refresh before running this source")
        yield current
