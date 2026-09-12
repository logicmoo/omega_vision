"""Small immutable, hash-chained journals shared by the temporal stores."""

from __future__ import annotations

from contextlib import contextmanager
import errno
import hashlib
import json
import math
import os
from pathlib import Path
import threading
import time
from typing import Any, Callable, Iterator
import uuid


class ValidationError(ValueError):
    """A supplied temporal record violates its explicit contract."""


class IntegrityError(RuntimeError):
    """Persisted history is incomplete, modified, or has an invalid predecessor."""


class ConflictError(RuntimeError):
    """A writer is using a stale generation or proposing an implicit fork."""


def canonical_json(value: Any) -> str:
    def check(item: Any) -> None:
        if isinstance(item, dict):
            if not all(isinstance(key, str) for key in item):
                raise ValidationError("JSON object keys must be strings")
            for child in item.values():
                check(child)
        elif isinstance(item, (list, tuple)):
            for child in item:
                check(child)
        elif isinstance(item, float):
            if not math.isfinite(item):
                raise ValidationError("non-finite numbers are not valid evidence")
        elif item is not None and not isinstance(item, (str, int, bool)):
            raise ValidationError(f"not a JSON value: {type(item).__name__}")
    check(value)
    return json.dumps(value, sort_keys=True, separators=(",", ":"), ensure_ascii=False, allow_nan=False)


def content_id(prefix: str, value: Any) -> str:
    return prefix + "-" + hashlib.sha256(canonical_json(value).encode("utf-8")).hexdigest()


def json_copy(value: Any) -> Any:
    return json.loads(canonical_json(value))


def strict_json(text: str) -> Any:
    def pairs(items: list[tuple[str, Any]]) -> dict[str, Any]:
        result: dict[str, Any] = {}
        for key, value in items:
            if key in result:
                raise ValidationError(f"duplicate JSON key: {key}")
            result[key] = value
        return result

    def constant(value: str) -> Any:
        raise ValidationError(f"invalid JSON constant: {value}")
    try:
        return json.loads(text, object_pairs_hook=pairs, parse_constant=constant)
    except (json.JSONDecodeError, RecursionError) as error:
        raise ValidationError(f"invalid structured JSON: {error}") from error


_THREAD_LOCKS: dict[str, threading.Lock] = {}
_LOCKS_GUARD = threading.Lock()


@contextmanager
def writer_lock(
    directory: Path, timeout: float = 30.0, *,
    validate_path: Callable[[Path], None] | None = None,
) -> Iterator[None]:
    """OS-owned locks survive neither process exit nor crashes; no stale PID locks."""
    lock_path = directory / ".writer.lock"
    if validate_path:
        validate_path(directory)
        validate_path(lock_path)
    directory.mkdir(parents=True, exist_ok=True)
    with _LOCKS_GUARD:
        thread_lock = _THREAD_LOCKS.setdefault(str(lock_path.resolve()), threading.Lock())
    if not thread_lock.acquire(timeout=timeout):
        raise TimeoutError(f"timed out waiting for writer: {lock_path}")
    try:
        if validate_path:
            validate_path(lock_path)
        with lock_path.open("a+b") as stream:
            if os.fstat(stream.fileno()).st_size == 0:
                stream.write(b"\0")
                stream.flush()
            deadline = time.monotonic() + timeout
            while True:
                try:
                    stream.seek(0)
                    if os.name == "nt":
                        import msvcrt
                        msvcrt.locking(stream.fileno(), msvcrt.LK_NBLCK, 1)
                    else:
                        import fcntl
                        fcntl.flock(stream.fileno(), fcntl.LOCK_EX | fcntl.LOCK_NB)
                    break
                except OSError as error:
                    if error.errno not in {errno.EACCES, errno.EAGAIN, errno.EDEADLK}:
                        raise
                    if time.monotonic() >= deadline:
                        raise TimeoutError(f"timed out waiting for writer: {lock_path}") from error
                    time.sleep(0.01)
            try:
                yield
            finally:
                stream.seek(0)
                if os.name == "nt":
                    import msvcrt
                    msvcrt.locking(stream.fileno(), msvcrt.LK_UNLCK, 1)
                else:
                    import fcntl
                    fcntl.flock(stream.fileno(), fcntl.LOCK_UN)
    finally:
        thread_lock.release()


_WINDOWS_REPLACE_DELAYS = (0.01, 0.02, 0.04, 0.08, 0.16, 0.25, 0.25, 0.25, 0.25)
_WINDOWS_SHARING_ERRORS = frozenset({5, 32, 33})


def atomic_json(
    path: Path, value: Any, *,
    retry_windows_sharing: bool = False,
    validate_path: Callable[[Path], None] | None = None,
) -> None:
    """Publish a complete file from a same-directory, fsynced staging file."""
    data = canonical_json(value).encode("utf-8")
    if validate_path:
        validate_path(path.parent)
        validate_path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    staging = path.with_name(f".{path.name}.pending-{uuid.uuid4().hex}")
    created, published = False, False
    try:
        if validate_path:
            validate_path(staging)
        with staging.open("xb") as stream:
            created = True
            stream.write(data)
            stream.flush()
            os.fsync(stream.fileno())
        delays = _WINDOWS_REPLACE_DELAYS if retry_windows_sharing else ()
        for attempt in range(len(delays) + 1):
            if validate_path:
                validate_path(staging)
                validate_path(path)
            try:
                os.replace(staging, path)
                published = True
                break
            except OSError as error:
                # Only the rename can have this transient Windows sharing race.
                # Permission failures during mkdir/open/write are never retried.
                if getattr(error, "winerror", None) not in _WINDOWS_SHARING_ERRORS or attempt == len(delays):
                    raise
                time.sleep(delays[attempt])
        if os.name != "nt":
            descriptor = os.open(path.parent, os.O_RDONLY)
            try:
                os.fsync(descriptor)
            finally:
                os.close(descriptor)
    finally:
        if created and not published:
            if validate_path:
                validate_path(staging)
            staging.unlink(missing_ok=True)


class Journal:
    """One immutable JSON transaction per revision, serialized across processes."""

    def __init__(self, path: Path, *, lock_timeout: float = 30.0):
        self.path = Path(path)
        self.lock_timeout = lock_timeout

    @contextmanager
    def transaction(self) -> Iterator[list[dict[str, Any]]]:
        with writer_lock(self.path, self.lock_timeout):
            yield self._read()

    def _read(self) -> list[dict[str, Any]]:
        records: list[dict[str, Any]] = []
        previous = None
        for revision, path in enumerate(sorted(self.path.glob("*.json")), 1):
            record = strict_json(path.read_text(encoding="utf-8"))
            if not isinstance(record, dict) or set(record) != {"revision", "previous_id", "payload", "id"}:
                raise IntegrityError(f"invalid journal record: {path}")
            body = {key: value for key, value in record.items() if key != "id"}
            expected = content_id("transaction", body)
            if (
                record["revision"] != revision or record["previous_id"] != previous
                or record["id"] != expected or path.name != f"{revision:012d}-{expected}.json"
            ):
                raise IntegrityError(f"broken journal chain: {path}")
            records.append(record)
            previous = expected
        return records

    def append(self, records: list[dict[str, Any]], payload: dict[str, Any]) -> dict[str, Any]:
        """Call only inside transaction(); update its in-memory revision list."""
        body = {
            "revision": len(records) + 1,
            "previous_id": records[-1]["id"] if records else None,
            "payload": json_copy(payload),
        }
        record = {**body, "id": content_id("transaction", body)}
        path = self.path / f"{body['revision']:012d}-{record['id']}.json"
        if path.exists():
            raise ConflictError(f"journal revision already exists: {path}")
        atomic_json(path, record)
        records.append(record)
        return record

    def read(self) -> list[dict[str, Any]]:
        with self.transaction() as records:
            return records
