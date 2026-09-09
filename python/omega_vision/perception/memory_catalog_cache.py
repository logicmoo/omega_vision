"""Persistent discovery metadata, never memory records or browser snapshots."""

from __future__ import annotations

import json
import logging
import time
from contextlib import contextmanager
from pathlib import Path
from typing import Any, Callable
from uuid import uuid4

from ._event_journal import atomic_json, writer_lock
from .observation_identity import content_hash

VERSION = 1
MAX_AGE_SECONDS = 300
_LOG = logging.getLogger(__name__)
_LOCATION_KEYS = {
    "memoryLocationId", "providerRef", "workspaceId", "providerLabel", "label",
    "scopeKind", "context", "memoryKinds", "pathLabel", "format", "capabilities",
    "counts", "revision", "versionCount", "recordSelector",
}


def cache_directory(root: Path) -> Path:
    return root / ".cache" / "memory-catalog"


def invalidate_memory_catalog(root: Path) -> None:
    """A fresh token also invalidates snapshots built by other workspace readers."""
    atomic_json(cache_directory(root) / "dirty.json", {"generation": uuid4().hex})


@contextmanager
def memory_catalog_mutation(root: Path):
    invalidate_memory_catalog(root)
    try:
        yield
    finally:
        invalidate_memory_catalog(root)


def _generation(root: Path) -> str:
    try:
        raw = (cache_directory(root) / "dirty.json").read_bytes()
    except FileNotFoundError:
        return "initial"
    # Hashing this tiny marker, rather than walking source trees, detects even a
    # damaged/replaced marker without ever confusing it with a previous token.
    return content_hash(raw)


def _valid_metadata(value: Any) -> bool:
    if not isinstance(value, dict) or set(value) != {"locations", "errors"}:
        return False
    if not isinstance(value["errors"], list) or not all(
        isinstance(error, dict) and set(error) <= {"providerRef", "workspaceId", "memoryLocationId", "message"}
        and isinstance(error.get("message"), str) for error in value["errors"]
    ):
        return False
    if not isinstance(value["locations"], list):
        return False
    for item in value["locations"]:
        if (
            not isinstance(item, dict) or set(item) - _LOCATION_KEYS
            or item.get("format") not in {"memory_json", "legacy_shape", "legacy_object", "checkpoint"}
            or item.get("scopeKind") not in {"global", "game", "level", "run"}
            or not all(isinstance(item.get(key), str) for key in (
                "memoryLocationId", "providerRef", "workspaceId", "pathLabel",
            ))
            or item.get("memoryKinds") not in (["shape"], ["object"])
            or not isinstance(item.get("counts"), dict)
        ):
            return False
    return True


def catalog_metadata(
    owner: Path, source: Path, identity: dict[str, Any],
    build: Callable[[], dict[str, Any]], *, refresh: bool = False,
) -> dict[str, Any]:
    """Cache a metadata-only projection with cross-process atomic publication.

    Writes invalidate before and after mutation. A rebuild spanning either
    invalidation is retried, never published as clean under the newer token.
    External filesystem edits are seen on explicit refresh or expiry.
    """
    directory = cache_directory(owner)
    key = content_hash({"version": VERSION, "identity": identity})
    target = directory / f"{key}.json"
    def generation_token() -> str:
        return content_hash([_generation(source), _generation(owner)])

    with writer_lock(directory / f"{key}.lock"):
        generation = generation_token()
        if not refresh:
            try:
                document = json.loads(target.read_text(encoding="utf-8"))
            except FileNotFoundError:
                document = None
            except (ValueError, UnicodeError) as error:
                _LOG.warning("Rebuilding corrupt memory catalog metadata %s: %s", target, error)
                document = None
            if document is not None:
                valid = (
                    isinstance(document, dict) and document.get("schemaVersion") == VERSION
                    and document.get("identity") == identity
                    and _valid_metadata(document.get("metadata"))
                    and type(document.get("builtAt")) in {int, float}
                    and document.get("metadataHash") == content_hash(document["metadata"])
                )
                if not valid:
                    _LOG.warning("Rebuilding invalid memory catalog metadata %s", target)
                elif document.get("generation") == generation and 0 <= time.time() - document["builtAt"] < MAX_AGE_SECONDS:
                    return document["metadata"]
        for _ in range(2):
            generation = generation_token()
            metadata = build()
            if not _valid_metadata(metadata):
                raise ValueError("Memory catalog builder returned invalid metadata or record payloads")
            if generation_token() != generation:
                continue
            atomic_json(target, {
                "schemaVersion": VERSION, "identity": identity, "generation": generation,
                "builtAt": time.time(), "metadata": metadata, "metadataHash": content_hash(metadata),
            })
            # A later invalidation stays observable: publication never writes the
            # source marker and therefore cannot clear a concurrent dirty signal.
            return metadata
        raise RuntimeError("Memory changed during catalog rebuild; retry discovery")
