"""Shared combobox choices only; clean reads never inspect sequence contents."""

from __future__ import annotations

import json
import logging
import time
from contextlib import contextmanager
from pathlib import Path
from typing import Any, Callable
from uuid import uuid4

from omega_vision.inherited_source_overlay import shared_storage_path, storage_path, vision_data_root

from ._event_journal import atomic_json, writer_lock
from .observation_identity import content_hash

VERSION = 1
CATALOG_VERSION = "physical-sequence-options-v2"
MAX_AGE_SECONDS = 300
_LOG = logging.getLogger(__name__)
_FIELDS = {
    "id", "visualSequenceId", "label", "dir", "providerRef", "imageCount",
    "reducedCount", "ordered", "canonical", "group", "groupKey", "readOnly",
    "migrationRequired", "kind", "gameId", "game", "recording", "level",
}
_BOOLEANS = {"ordered", "canonical", "readOnly", "migrationRequired"}
_COUNTS = {"imageCount", "reducedCount"}


def _home(root: Path | None) -> Path:
    return shared_storage_path() if root is None else vision_data_root(root)


def _path(home: Path, *parts: str) -> Path:
    expected = home.joinpath(".cache", "visual-sequence-list", *parts)
    resolved = storage_path(home, ".cache", "visual-sequence-list", *parts)
    if resolved != expected:
        raise ValueError("Visual Sequence list cache cannot redirect to another physical path")
    return resolved


def invalidate_visual_sequence_list(root: Path | None = None) -> None:
    atomic_json(_path(_home(root), "dirty.json"), {"generation": uuid4().hex})


@contextmanager
def visual_sequence_list_mutation(root: Path | None = None):
    home = _home(root)
    invalidate_visual_sequence_list(home)
    try:
        yield
    finally:
        invalidate_visual_sequence_list(home)


def _generation(home: Path) -> str:
    try:
        return content_hash(_path(home, "dirty.json").read_bytes())
    except FileNotFoundError:
        return "initial"


def _safe_id(value: Any) -> bool:
    return (
        isinstance(value, str) and bool(value)
        and all(part not in {"", ".", ".."} for part in value.split("/"))
        and not any(char in value for char in "\\:")
        and not any(ord(char) < 32 for char in value)
    )


def _valid_options(entries: Any) -> bool:
    if not isinstance(entries, list):
        return False
    seen: set[str] = set()
    for entry in entries:
        if not isinstance(entry, dict) or set(entry) - _FIELDS or not _safe_id(entry.get("id")):
            return False
        if type(entry.get("imageCount")) is not int or entry["imageCount"] < 0:
            return False
        identity = entry["id"]
        if identity in seen:
            return False
        seen.add(identity)
        for key, value in entry.items():
            if key in _COUNTS:
                if type(value) is not int or value < 0:
                    return False
            elif key in _BOOLEANS:
                if type(value) is not bool:
                    return False
            elif key == "level":
                if value is not None and type(value) not in {int, str}:
                    return False
            elif value is not None and not isinstance(value, str):
                return False
        if entry.get("visualSequenceId", identity) != identity:
            return False
        if any(entry.get(key, f"data/{identity}") != f"data/{identity}" for key in ("dir", "providerRef")):
            return False
    return True


def visual_sequence_options(
    root: Path,
    build: Callable[[], list[dict[str, Any]]],
    *,
    refresh: bool = False,
) -> tuple[list[dict[str, Any]], str, str]:
    """Reuse atomic metadata until dirty/expired; discovery is never authorization."""
    home = _home(root)
    identity = {"root": str(home), "catalogVersion": CATALOG_VERSION}
    target = _path(home, "choices.json")
    requested_at = time.time()
    _path(home, "choices.lock", ".writer.lock")
    with writer_lock(_path(home, "choices.lock")):
        try:
            cached = json.loads(target.read_text(encoding="utf-8"))
        except FileNotFoundError:
            cached = None
        except (ValueError, UnicodeError) as error:
            _LOG.warning("Rebuilding corrupt Visual Sequence choices %s: %s", target, error)
            cached = None
        if cached is not None:
            valid = (
                isinstance(cached, dict) and cached.get("schemaVersion") == VERSION
                and cached.get("identity") == identity
                and _valid_options(cached.get("entries"))
                and type(cached.get("builtAt")) in {int, float}
                and cached.get("revision") == content_hash({"identity": identity, "entries": cached["entries"]})
            )
            if not valid:
                _LOG.warning("Rebuilding invalid Visual Sequence choices %s", target)
            elif (
                cached.get("generation") == _generation(home)
                and 0 <= time.time() - cached["builtAt"] < MAX_AGE_SECONDS
                and (not refresh or cached["builtAt"] >= requested_at)
            ):
                return cached["entries"], cached["revision"], "disk"
        for _ in range(3):
            generation = _generation(home)
            # Only this metadata projection is retained; never persist manifests,
            # image lists, frame bytes, or generated artifacts supplied by a caller.
            entries = [{key: value for key, value in item.items() if key in _FIELDS} for item in build()]
            if not _valid_options(entries):
                raise ValueError("Visual Sequence builder returned invalid combo options")
            if _generation(home) != generation:
                continue
            revision = content_hash({"identity": identity, "entries": entries})
            atomic_json(target, {
                "schemaVersion": VERSION, "identity": identity, "generation": generation,
                "builtAt": time.time(), "revision": revision, "entries": entries,
            })
            # Publication never changes the dirty marker; a concurrent later
            # invalidation remains visible to the very next reader.
            return entries, revision, "refresh" if refresh else "miss"
        raise RuntimeError("Visual Sequence choices changed during rebuild; refresh to retry")
