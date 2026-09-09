"""Revision-validated catalog snapshots; no image decoding or implementation imports."""

from __future__ import annotations

import hashlib
import json
import logging
import os
import threading
import uuid
import atexit
from pathlib import Path
from typing import Any, Callable, Sequence

SCHEMA_VERSION = 2
_LOG = logging.getLogger(__name__)


class CatalogRevisionTracker:
    """Reuse a validated signature until native filesystem notifications change it."""

    def __init__(self, homes: Sequence[Path], families: Sequence[str]) -> None:
        self.homes = tuple(homes)
        self.families = tuple(families)
        self.signature: str | None = None
        self._lock = threading.Lock()
        self._ready = threading.Event()
        self._stop = threading.Event()
        self._generation = 0
        self._signature_generation = -1
        self._error: Exception | None = None
        self._thread = threading.Thread(target=self._watch, name="visual-sequence-revisions", daemon=True)
        self._thread.start()
        atexit.register(self.close)

    def _watch(self) -> None:
        from watchfiles import watch
        roots = {home if home.is_dir() else home.parent for home in self.homes}
        try:
            for _ in watch(
                *sorted(roots), watch_filter=self._changed,
                debounce=25, step=5, rust_timeout=100, yield_on_timeout=True,
                force_polling=False, ignore_permission_denied=False, stop_event=self._stop,
            ):
                self._ready.set()
        except (OSError, RuntimeError) as error:
            self._error = error
            self._ready.set()
            _LOG.error("Visual Sequence source watcher failed: %s", error)

    def _changed(self, change: Any, raw: str) -> bool:
        relevant = self._relevant(change, raw)
        if relevant:
            with self._lock:
                self._generation += 1
        self._ready.set()
        return relevant

    def close(self) -> None:
        self._stop.set()

    def invalidate(self) -> None:
        with self._lock:
            self._generation += 1
            self.signature = None

    def _relevant(self, change: Any, raw: str) -> bool:
        path = Path(raw)
        for home in self.homes:
            try:
                parts = path.relative_to(home).parts
            except ValueError:
                continue
            if not parts:
                return True
            if any(part in {"transforms", "preprocessing"} for part in parts[1:-1]):
                return False
            if parts[0] == "recordings" and len(parts) >= 5 and parts[4] != "image.png":
                return False
            if parts[:2] == ("arc3_games", "recordings") and len(parts) >= 6 and parts[5] != "image.png":
                return False
            return (
                path.name in {"manifest.json", "recording.json"}
                or path.suffix.lower() in {".png", ".jpg", ".jpeg", ".gif", ".webp", ".bmp"}
                or not path.suffix
            )
        # A watched parent may report creation/removal of a previously absent home.
        return any(path == home or path in home.parents for home in self.homes)

    def __call__(self) -> str:
        if self._error is not None:
            raise RuntimeError("Visual Sequence source watcher failed") from self._error
        # Never advance a blocking watch generator on an HTTP worker: continuous
        # *irrelevant* runtime events can prevent it from yielding indefinitely.
        if not self._ready.is_set():
            return catalog_revision(self.homes, self.families)
        with self._lock:
            generation = self._generation
            if self.signature is not None and generation == self._signature_generation:
                return self.signature
        signature = catalog_revision(self.homes, self.families)
        with self._lock:
            if generation == self._generation:
                self.signature = signature
                self._signature_generation = generation
        return signature


def catalog_revision(homes: Sequence[Path], families: Sequence[str]) -> str:
    """Watch source membership and manifests without statting/decoding images.

    Windows can delay directory mtime updates on deletion, so membership is
    authoritative. Recording traversal stops at source frames, never processing
    artifacts. Ordinary runtime JSON edits do not invalidate the catalog.
    """
    digest = hashlib.sha256(f"catalog:{SCHEMA_VERSION}".encode())
    visited: set[Path] = set()

    def scan(path: Path, depth: int | None, recording: bool = False) -> None:
        if path in visited:
            return
        visited.add(path)
        digest.update(str(path).encode())
        try:
            with os.scandir(path) as iterator:
                children = sorted(iterator, key=lambda entry: entry.name)
        except FileNotFoundError:
            digest.update(b":missing")
            return
        for entry in children:
            directory = entry.is_dir(follow_symlinks=False)
            if directory and entry.name in {"transforms", "preprocessing"}:
                continue
            if directory and recording and depth == 0:
                continue
            if directory:
                digest.update(f"directory:{entry.name}\0".encode())
            elif entry.name in {"manifest.json", "recording.json"}:
                stat = entry.stat(follow_symlinks=False)
                digest.update(f"{entry.name}:{stat.st_mtime_ns}:{stat.st_size}\0".encode())
            elif Path(entry.name).suffix.lower() in {".png", ".jpg", ".jpeg", ".gif", ".webp", ".bmp"}:
                digest.update(f"image:{entry.name}\0".encode())
            if directory and (depth is None or depth > 0):
                scan(Path(entry.path), None if depth is None else depth - 1, recording)

    for home in homes:
        # Order is significant: changing overlay precedence must invalidate.
        digest.update(f"home:{home}\0".encode())
        scan(home, 0)
        if not home.is_dir():
            continue
        with os.scandir(home) as iterator:
            children = sorted(iterator, key=lambda entry: entry.name)
        for child in children:
            if child.is_dir(follow_symlinks=False):
                directory = Path(child.path)
                if (directory / "pool").is_dir() or (directory / "manifest.json").is_file():
                    scan(directory, None)
        for family in families:
            arc = family in {"recordings", "arc3_games/recordings"}
            scan(home / family, 3 if arc else None, arc)
    return digest.hexdigest()


def etag_matches(header: str | None, etag: str) -> bool:
    def bare(value: str) -> str:
        return value.removeprefix("W/")
    return bool(header) and any(
        item.strip() == "*" or bare(item.strip()) == bare(etag)
        for item in (header or "").split(",")
    )


class CatalogCache:
    def __init__(self) -> None:
        self._lock = threading.RLock()
        self._memory: dict[Path, tuple[str, list[dict[str, Any]]]] = {}

    def get(
        self, path: Path, revision: Callable[[], str],
        build: Callable[[], list[dict[str, Any]]], *, refresh: bool = False,
    ) -> tuple[list[dict[str, Any]], str, str]:
        with self._lock:
            signature = revision()
            cached = self._memory.get(path)
            if not refresh and cached is not None and cached[0] == signature:
                return cached[1], signature, "memory"
            if not refresh and path.is_file():
                try:
                    payload = json.loads(path.read_text(encoding="utf-8"))
                    if (
                        payload.get("schemaVersion") == SCHEMA_VERSION
                        and payload.get("revision") == signature
                        and isinstance(payload.get("entries"), list)
                        and all(isinstance(item, dict) and isinstance(item.get("id"), str) for item in payload["entries"])
                    ):
                        entries = payload["entries"]
                        self._memory[path] = (signature, entries)
                        return entries, signature, "disk"
                except (ValueError, AttributeError) as error:
                    _LOG.warning("Discarding malformed catalog cache %s: %s", path, error)
            entries = build()
            # Never publish a scan stamped with a revision it did not observe.
            if revision() != signature:
                raise RuntimeError("Visual Sequence sources changed during catalog enumeration; retry the request")
            path.parent.mkdir(parents=True, exist_ok=True)
            temporary = path.with_name(f".{path.name}.{uuid.uuid4().hex}.tmp")
            try:
                temporary.write_text(json.dumps({
                    "schemaVersion": SCHEMA_VERSION, "revision": signature,
                    "entries": entries,
                }), encoding="utf-8")
                os.replace(temporary, path)
            finally:
                temporary.unlink(missing_ok=True)
            self._memory[path] = (signature, entries)
            return entries, signature, "refresh" if refresh else "miss"
