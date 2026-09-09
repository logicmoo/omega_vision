"""Authorized filesystem memory catalog and independent Shape/Object preferences.

Integration: construct MemoryLocations with explicit AuthorizedMemoryRoot mounts;
never infer authorization from browser-supplied paths. catalog/read_selected are
read-only. New copies go to knowledge/artifacts/memory; existing Prolog stores and
core checkpoints are never rewritten. Preferences use runtime/memory-settings.
VolatileMemory must belong to one browser/session and be reset on reload/reset;
it has no filesystem serialization or process-global singleton.

Parent API contract: catalog(context, volatile=...) -> MemoryCatalog matching
MemorySetupModel.ts; load_preferences -> MemoryPreferences; onSave calls
save_preferences(context, preferences, expected_revision=...). Return responses
with Cache-Control: no-store. Each explicit mount grants only its provider/root.
read_selected(kind, location_ids, context) returns merged concepts with attributed
versions, source badges, conflicts and scope-preferred records. save_record and
save_copy are explicit writes, never triggered by lookups or changing Save To.
Object payload.shapeReferences retain providerRef/workspaceId/memoryLocationId/
recordUid/revision and arbitrary constituent attribution. Legacy unresolved
shape keys are retained separately, not represented as verified modern links.
"""
from __future__ import annotations

from dataclasses import asdict, dataclass, replace
from contextlib import contextmanager
from contextvars import ContextVar
import json
import os
from pathlib import Path
import re
from typing import Any, Iterable, Mapping
from urllib.parse import quote, unquote
from uuid import uuid4

from omega_vision.perception._event_journal import atomic_json, writer_lock
from omega_vision.perception.observation_identity import content_hash


NOWHERE = "memory-nowhere"
MAX_BROWSER_SNAPSHOT_BYTES = 16 * 1024 * 1024
KINDS = ("shape", "object")
SCOPE_ORDER = {"run": 0, "level": 1, "game": 2, "global": 3, "volatile": 4}
_DEFAULT_PREFERENCE_READS: ContextVar[dict | None] = ContextVar("memory_default_preference_reads", default=None)


@contextmanager
def default_preference_snapshot():
    """Reuse only default selection metadata within one execution plan."""
    values = {}
    token = _DEFAULT_PREFERENCE_READS.set(values)
    try:
        yield
    finally:
        values.clear()
        _DEFAULT_PREFERENCE_READS.reset(token)


def _copy(value: Any) -> Any:
    return json.loads(json.dumps(value, ensure_ascii=False, allow_nan=False))


def _id(prefix: str, value: Any) -> str:
    return f"{prefix}-{content_hash(value)}"


@dataclass(frozen=True)
class MemoryContext:
    provider_ref: str
    workspace_id: str
    game_id: str | None = None
    level_id: str | None = None
    run_id: str | None = None

    def __post_init__(self) -> None:
        if not self.provider_ref or not self.workspace_id:
            raise ValueError("provider and workspace identifiers are required")
        if self.level_id is not None and self.game_id is None:
            raise ValueError("level context requires a game")
        if any(value in {".", ".."} for value in (self.game_id, self.level_id, self.run_id)):
            raise ValueError("memory scope identifiers cannot be relative path components")
        if any(value is not None and (not value or any(ord(char) < 32 for char in value))
               for value in asdict(self).values()):
            raise ValueError("memory context identifiers must be nonempty printable strings")


@dataclass(frozen=True)
class AuthorizedMemoryRoot:
    provider_ref: str
    workspace_id: str
    root: Path
    label: str
    readable: bool = True
    writable: bool = False
    game_id: str | None = None
    level_id: str | None = None
    run_id: str | None = None


class VolatileMemory:
    """Caller-owned volatile state; wire snapshots are transient transport only."""

    def __init__(self, *, session_id: str | None = None) -> None:
        if session_id is not None and (
            not isinstance(session_id, str) or not session_id.strip()
            or len(session_id) > 256 or any(ord(char) < 32 for char in session_id)
        ):
            raise ValueError("volatile session ID must be an opaque nonempty printable token")
        self._session_id = session_id if session_id is not None else uuid4().hex
        self._records: dict[str, dict[str, Any]] = {}

    @property
    def session_id(self) -> str:
        return self._session_id

    def put(self, kind: str, payload: Mapping[str, Any], *, concept_uid: str | None = None,
            source: Mapping[str, Any] | None = None, origin: Mapping[str, Any] | None = None) -> dict[str, Any]:
        _validate_payload(kind, payload)
        if concept_uid is not None and (not isinstance(concept_uid, str) or not concept_uid):
            raise ValueError("volatile concept UID must be a nonempty string")
        if source is not None and not isinstance(source, Mapping):
            raise ValueError("volatile source must be structured metadata")
        source = {key: value for key, value in (source or {}).items()
                  if key not in {"memoryLocationId", "sessionId", "scopeKind"}}
        concept = concept_uid or _id("volatile-concept", [self._session_id, kind, payload["uid"]])
        record = {
            "recordUid": _id("volatile-memory", [self._session_id, kind, concept, dict(payload), dict(source or {})]),
            "conceptUid": concept,
            "revision": content_hash(dict(payload)), "memoryKind": kind,
            "recordType": "volatile", "payload": _copy(payload),
            "source": {**_copy(source or {}), "memoryLocationId": NOWHERE, "sessionId": self._session_id,
                       "scopeKind": "volatile"},
        }
        if origin:
            record["origin"] = _copy(origin)
        self._records[record["recordUid"]] = record
        return _copy(record)

    def records(self, kind: str) -> list[dict[str, Any]]:
        if kind not in KINDS:
            raise ValueError("unknown memory kind")
        return [_copy(record) for _, record in sorted(self._records.items()) if record["memoryKind"] == kind]

    def reset(self) -> None:
        self._records.clear()
        self._session_id = uuid4().hex

    def to_wire(self) -> str:
        """Return an opaque browser-memory-only string; never persist/cache/log it.

        Keeping this string opaque avoids JavaScript's conversion of 1.0 to 1
        invalidating existing content-addressed record/prototype revisions.
        The session ID is a namespace, not an authorization credential.
        """
        payload = {
            "schemaVersion": 1, "sessionId": self._session_id,
            "records": [_copy(value) for _, value in sorted(self._records.items())],
        }
        return json.dumps({**payload, "snapshotUid": _id("volatile-snapshot", payload)},
                          ensure_ascii=False, allow_nan=False, sort_keys=True, separators=(",", ":"))

    @classmethod
    def from_wire(cls, wire: str, *, session_id: str) -> VolatileMemory:
        """Rehydrate one request from its browser-owned, nonpersistent snapshot."""
        store = cls(session_id=session_id)
        if not isinstance(wire, str):
            raise ValueError("volatile wire snapshot must remain an opaque string")
        value = json.loads(wire)
        if (not isinstance(value, dict) or set(value) != {"schemaVersion", "sessionId", "records", "snapshotUid"}
                or type(value["schemaVersion"]) is not int or value["schemaVersion"] != 1):
            raise ValueError("invalid volatile wire snapshot schema")
        payload = {key: item for key, item in value.items() if key != "snapshotUid"}
        if value["snapshotUid"] != _id("volatile-snapshot", payload):
            raise ValueError("volatile wire snapshot content hash mismatch")
        if value["sessionId"] != session_id:
            raise ValueError("volatile records belong to another browser session")
        if not isinstance(value["records"], list):
            raise ValueError("volatile snapshot records must be a list")
        for record in value["records"]:
            if not isinstance(record, dict) or not isinstance(record.get("source"), dict):
                raise ValueError("invalid volatile record envelope")
            source = record["source"]
            if source.get("memoryLocationId") != NOWHERE or source.get("sessionId") != session_id or source.get("scopeKind") != "volatile":
                raise ValueError("volatile record source disagrees with its session")
            if not isinstance(record.get("recordUid"), str) or not record["recordUid"]:
                raise ValueError("volatile record requires its stable record UID")
            if record.get("recordUid") in store._records:
                raise ValueError("volatile snapshot contains duplicate record IDs")
            if not isinstance(record.get("conceptUid"), str) or not record["conceptUid"]:
                raise ValueError("volatile record requires its stable concept UID")
            expected = store.put(
                record.get("memoryKind"), record.get("payload"),
                concept_uid=record["conceptUid"], source=source, origin=record.get("origin"),
            )
            if record != expected:
                raise ValueError("volatile record identity/revision/envelope is inconsistent")
        return store


class BrowserMemory:
    """One request's working copy of an opaque, browser-RAM-owned snapshot.

    This object must never be placed in a job/status registry or serialized to
    disk. The hash detects transport corruption, not authorization.
    """

    def __init__(self, workspace_id: str, session_id: str, wire: str | None = None) -> None:
        self.workspace_id = workspace_id
        self.session_id = session_id
        self.memory = VolatileMemory(session_id=session_id)
        self.outputs: dict[str, dict[str, Any]] = {}
        if wire is None:
            return
        if not isinstance(wire, str) or len(wire.encode("utf-8")) > MAX_BROWSER_SNAPSHOT_BYTES:
            raise ValueError("Browser memory snapshot must be an opaque string of at most 16 MiB")
        value = json.loads(wire)
        if not isinstance(value, dict) or set(value) != {
            "schemaVersion", "workspaceId", "sessionId", "memory", "outputs", "snapshotUid",
        } or type(value["schemaVersion"]) is not int or value["schemaVersion"] != 1:
            raise ValueError("Invalid browser memory snapshot")
        if (value["workspaceId"], value["sessionId"]) != (workspace_id, session_id):
            raise ValueError("Browser memory snapshot belongs to another workspace or page session")
        payload = {key: item for key, item in value.items() if key != "snapshotUid"}
        if value["snapshotUid"] != _id("browser-snapshot", payload):
            raise ValueError("Browser memory snapshot hash mismatch")
        self.memory = VolatileMemory.from_wire(value["memory"], session_id=session_id)
        if not isinstance(value["outputs"], dict) or len(value["outputs"]) > 1024:
            raise ValueError("Browser memory has too many transient outputs; clear session memory")
        for key, output in value["outputs"].items():
            if (not isinstance(output, dict) or set(output) != {"result", "resultHash"}
                    or not isinstance(output["result"], dict)
                    or output["resultHash"] != content_hash(output["result"])):
                raise ValueError("Invalid browser-owned output receipt")
        self.outputs = value["outputs"]

    def to_wire(self) -> str:
        payload = {"schemaVersion": 1, "workspaceId": self.workspace_id, "sessionId": self.session_id,
                   "memory": self.memory.to_wire(), "outputs": self.outputs}
        wire = json.dumps({**payload, "snapshotUid": _id("browser-snapshot", payload)},
                          ensure_ascii=False, allow_nan=False, sort_keys=True, separators=(",", ":"))
        if len(wire.encode("utf-8")) > MAX_BROWSER_SNAPSHOT_BYTES or len(self.outputs) > 1024:
            raise ValueError("Browser memory exceeds its bounded snapshot; clear memory or select a durable destination")
        return wire

    @staticmethod
    def output_key(sequence_id: str, frame_id: str, step: str) -> str:
        return json.dumps([sequence_id, frame_id, step], separators=(",", ":"))

    def put_output(self, sequence_id: str, frame_id: str, step: str, result: dict[str, Any]) -> str:
        key = self.output_key(sequence_id, frame_id, step)
        digest = content_hash(result)
        self.outputs[key] = {"result": _copy(result), "resultHash": digest}
        self.to_wire()  # Reject overflow before publishing a receipt that cannot be returned.
        return digest


def _validate_payload(kind: str, payload: Mapping[str, Any]) -> None:
    if kind not in KINDS or not isinstance(payload, Mapping):
        raise ValueError("memory kind must be shape or object with a typed payload")
    if not isinstance(payload.get("uid"), str) or not payload["uid"]:
        raise ValueError("memory records require a stable uid")
    if re.fullmatch(r"[rvwgo]\d+", payload["uid"]):
        raise ValueError("frame-local aliases cannot identify persistent memory records")
    if kind == "object" and "memberTrackUids" in payload:
        members = payload["memberTrackUids"]
        if not isinstance(members, list) or len(members) < 2 or not all(isinstance(item, str) and item for item in members) or len(set(members)) != len(members):
            raise ValueError("persistent objects require at least two distinct member G tracks")
    references = payload.get("shapeReferences", [])
    if not isinstance(references, list):
        raise ValueError("shape references must be an attributed list, never a flattened value")
    for reference in references:
        required = ("providerRef", "workspaceId", "memoryLocationId", "recordUid", "revision")
        if not isinstance(reference, Mapping) or any(not isinstance(reference.get(key), str) or not reference[key] for key in required):
            raise ValueError("shape references require attributed provider/workspace/location/record/revision")
    _copy(dict(payload))


def _record_type(kind: str, payload: Mapping[str, Any]) -> str:
    if "legacyKey" in payload and "facts" in payload:
        return "legacy_shape" if kind == "shape" else "legacy_known_object"
    if kind == "shape" and payload.get("kind") == "shape_point_anchor":
        return "shape_anchor"
    if kind == "shape" and "anchorUid" in payload and "revisions" in payload:
        return "observed_prototype"
    if kind == "object" and "memberTrackUids" in payload:
        return "persistent_object"
    return f"saved_{kind}"


def _scope(context: Mapping[str, Any]) -> str:
    for field, name in (("runId", "run"), ("levelId", "level"), ("gameId", "game")):
        if context.get(field) is not None:
            return name
    return "global"


def _context(root: AuthorizedMemoryRoot) -> dict[str, Any]:
    return {"gameId": root.game_id, "levelId": root.level_id, "runId": root.run_id}


def _split_arguments(value: str) -> list[str]:
    output, start, depth, quoted, index = [], 0, 0, False, 0
    while index < len(value):
        char = value[index]
        if quoted:
            if char == "\\":
                index += 2
                continue
            if char == "'":
                if index + 1 < len(value) and value[index + 1] == "'":
                    index += 2
                    continue
                quoted = False
        elif char == "'":
            quoted = True
        elif char in "([":
            depth += 1
        elif char in ")]":
            depth -= 1
        elif char == "," and depth == 0:
            output.append(value[start:index].strip())
            start = index + 1
        index += 1
    if quoted or depth:
        raise ValueError("unbalanced legacy memory fact")
    output.append(value[start:].strip())
    return output


def _atom(raw: str) -> Any:
    if raw.startswith("'") and raw.endswith("'"):
        return re.sub(r"\\(.)", r"\1", raw[1:-1].replace("''", "'"))
    if re.fullmatch(r"-?\d+", raw):
        return int(raw)
    return raw


def _legacy_records(path: Path, kind: str) -> list[dict[str, Any]]:
    """Read generated shape/3 and SWI persistency facts without executing Prolog."""
    live: dict[tuple[str, tuple[Any, ...]], list[Any]] = {}
    history: list[dict[str, Any]] = []
    allowed = {"shape": 3, "variant": 4} if kind == "shape" else {
        "known_object": 4, "known_variation": 4, "known_placement": 5,
    }
    for number, line in enumerate(path.read_text(encoding="utf-8").splitlines(), 1):
        source = line.strip()
        if not source or source.startswith(("%", ":-", "created(")):
            continue
        operation = "assert"
        if source.endswith("."):
            source = source[:-1]
        match = re.fullmatch(r"(assert|retract|retractall)\((.*)\)", source)
        if match:
            operation, source = match.groups()
        match = re.fullmatch(r"(\w+)\((.*)\)", source)
        if not match or match[1] not in allowed:
            raise ValueError(f"unsupported legacy memory data at line {number}")
        name, raw = match.groups()
        args = [_atom(arg) for arg in _split_arguments(raw)]
        if len(args) != allowed[name]:
            raise ValueError(f"invalid {name} arity at line {number}")
        history.append({"operation": operation, "predicate": name, "args": args, "line": number})
        key = (name, tuple(args))
        if operation == "assert":
            live[key] = args
        else:
            for candidate in list(live):
                if candidate[0] == name and all(a == "_" or a == b for a, b in zip(args, candidate[1])):
                    del live[candidate]
    output = []
    primary = "shape" if kind == "shape" else "known_object"
    for (name, _), args in sorted(live.items(), key=lambda pair: repr(pair[0])):
        if name != primary:
            continue
        key = str(args[0])
        related = [item for item in history if item["args"][0] == args[0]]
        current = [{"predicate": predicate, "args": values} for (predicate, _), values in live.items()
                   if values[0] == args[0] or (
                       predicate == "known_placement" and values[2] in {key, "gobj_" + key})]
        payload = {"uid": _id("legacy-memory", [kind, key]), "legacyKey": key,
                   "facts": current, "history": related}
        if kind == "shape":
            payload.update({"shapeKey": key, "name": args[1],
                            "turtle": json.loads(args[2]) if isinstance(args[2], str) and args[2].startswith("{") else None})
        if kind == "object":
            payload.update({"key": key, "firstSeen": args[1], "lastSeen": args[2], "seen": args[3],
                            "variations": [{"color": values[1], "size": values[2], "seen": values[3]}
                                           for (predicate, _), values in live.items()
                                           if predicate == "known_variation" and values[0] == args[0]]})
            payload["placements"] = [values for (predicate, _), values in live.items()
                                     if predicate == "known_placement" and values[2] in {key, "gobj_" + key}]
            # Trajectories may attribute more than one shape. These are honest
            # unresolved legacy references, not fabricated modern provider links.
            payload["legacyShapeReferences"] = sorted({
                item.rsplit(",", 1)[-1] for values in payload["placements"]
                for item in str(values[3]).split(";") if item and "," in item
            })
            payload["placementHistory"] = [
                item for item in history if item["predicate"] == "known_placement"
                and item["args"][2] in {key, "gobj_" + key}
            ]
        output.append({"kind": kind, "type": f"legacy_{primary}", "payload": payload})
    return output


class MemoryLocations:
    def __init__(self, roots: Iterable[AuthorizedMemoryRoot]) -> None:
        self.roots = tuple(replace(root, root=root.root.resolve()) for root in roots)
        self._boundaries = {id(root): root.root for root in self.roots}
        keys = [(root.provider_ref, root.workspace_id, str(root.root.resolve())) for root in self.roots]
        if len(set(keys)) != len(keys):
            raise ValueError("duplicate authorized memory mount")

    def _safe(self, root: AuthorizedMemoryRoot, path: Path) -> Path:
        resolved = path.resolve()
        boundary = self._boundaries[id(root)]
        if root.root.resolve() != boundary or not resolved.is_relative_to(boundary):
            raise PermissionError("memory path escapes its authorized provider root")
        return resolved

    @staticmethod
    def _location_id(root: AuthorizedMemoryRoot, path: Path) -> str:
        return _id("memory-location", [
            root.provider_ref, root.workspace_id,
            str(root.root.resolve()), path.relative_to(root.root).as_posix(),
        ])

    def _location(self, root: AuthorizedMemoryRoot, path: Path, kind: str, context: dict[str, Any], format: str) -> dict[str, Any]:
        self._safe(root, path)
        writable = format == "memory_json" and root.writable and os.access(root.root, os.W_OK)
        scope = _scope(context)
        return {
            "memoryLocationId": self._location_id(root, path), "providerRef": root.provider_ref,
            "workspaceId": root.workspace_id, "providerLabel": root.label,
            "label": {"run": "This Run", "level": "Level Shared", "game": "Game Shared", "global": "Global Shared"}[scope],
            "scopeKind": scope, "context": context, "memoryKinds": [kind],
            "pathLabel": str(path), "format": format,
            "capabilities": {"read": root.readable, "write": writable,
                             "reason": None if writable else (
                                 "Existing generated/legacy memory is browse-only; save a copy to a writable scope"
                                 if format != "memory_json" else "Provider does not authorize writes")},
            "counts": {"shape": 0, "object": 0}, "revision": None,
        }

    def _destinations(self, root: AuthorizedMemoryRoot, context: MemoryContext) -> list[tuple[dict[str, Any], Path]]:
        if any(bound is not None and bound != actual for bound, actual in (
            (root.game_id, context.game_id), (root.level_id, context.level_id), (root.run_id, context.run_id),
        )):
            return []
        base = root.root / "knowledge" / "artifacts" / "memory"
        branches = [(base / "global", {"gameId": None, "levelId": None, "runId": None})]
        path = base
        current = {"gameId": None, "levelId": None, "runId": None}
        for field, segment, value in (("gameId", "games", context.game_id),
                                      ("levelId", "levels", context.level_id), ("runId", "runs", context.run_id)):
            if value is None:
                continue
            path = path / segment / quote(value, safe="")
            current = {**current, field: value}
            branches.append((path, current))
        return [
            (self._location(root, directory / f"{kind}s", kind, ctx, "memory_json"), directory / f"{kind}s")
            for directory, ctx in branches for kind in KINDS
            if all(bound is None or bound == ctx[field] for field, bound in (
                ("gameId", root.game_id), ("levelId", root.level_id), ("runId", root.run_id),
            ))
        ]

    def _discovered(self, root: AuthorizedMemoryRoot, *,
                    effective_context: MemoryContext | None = None) -> Iterable[tuple[dict[str, Any], Path]]:
        def failed(error: OSError) -> None:
            raise PermissionError("a memory provider subtree is not readable") from error

        self._safe(root, root.root)
        for directory, children, files in os.walk(root.root, followlinks=False, onerror=failed):
            path = Path(directory)
            children[:] = sorted(name for name in children if name not in {".git", "node_modules", ".venv", "__pycache__"}
                                 and not (path / name).is_symlink() and not (path / name).is_junction())
            parts = path.relative_to(root.root).parts
            if effective_context is not None and len(parts) % 2 == 0 and parts[:3] == (
                "knowledge", "artifacts", "memory",
            ):
                field = {"games": "game_id", "levels": "level_id", "runs": "run_id"}.get(path.name)
                if field:
                    selected = getattr(effective_context, field)
                    children[:] = [name for name in children if selected is not None and unquote(name) == selected]
            context = _context(root)
            kind, format = None, None
            if path.name == "shape_dir" and "shapes.pl" in files:
                kind, format = "shape", "legacy_shape"
            elif "identities.db.pl" in files and (path.name == "identity_dir" or path.parent.name == "identity_dir"):
                kind, format = "object", "legacy_object"
                if path.parent.name == "identity_dir" and path.name != "_all_games_":
                    context = {**context, "gameId": path.name}
            elif path.name in {"grouping-checkpoints", "object-checkpoints"} and any(name.endswith(".json") for name in files):
                kind, format = ("shape" if path.name == "grouping-checkpoints" else "object"), "checkpoint"
                sequences = set()
                for name in sorted(files):
                    if name.endswith(".json"):
                        source = self._safe(root, path / name)
                        snapshot = json.loads(source.read_text(encoding="utf-8"))
                        if not isinstance(snapshot, dict):
                            raise ValueError("checkpoint must be a typed object")
                        snapshot = snapshot.get("checkpoint", snapshot)
                        if not isinstance(snapshot, dict):
                            raise ValueError("checkpoint must be a typed object")
                        if snapshot.get("sequenceId"):
                            sequences.add(str(snapshot["sequenceId"]))
                for sequence in sorted(sequences):
                    scoped = {**context, "runId": sequence}
                    if effective_context is not None and not self._effective({
                        "providerRef": root.provider_ref, "workspaceId": root.workspace_id,
                        "scopeKind": _scope(scoped), "context": scoped,
                    }, effective_context):
                        continue
                    location = self._location(root, path, kind, scoped, format)
                    location["memoryLocationId"] = _id("memory-location", [location["memoryLocationId"], sequence])
                    location["recordSelector"] = {"sequenceId": sequence}
                    yield location, path
                if sequences:
                    continue
            elif path.name in {"shapes", "objects"} and path.relative_to(root.root).parts[:3] == ("knowledge", "artifacts", "memory"):
                kind, format = ("shape" if path.name == "shapes" else "object"), "memory_json"
                parts = path.relative_to(root.root).parts
                context = {"gameId": None, "levelId": None, "runId": None}
                for key, segment in (("gameId", "games"), ("levelId", "levels"), ("runId", "runs")):
                    if segment in parts:
                        index = parts.index(segment)
                        if index + 1 < len(parts):
                            context[key] = unquote(parts[index + 1])
            if kind:
                if effective_context is not None and not self._effective({
                    "providerRef": root.provider_ref, "workspaceId": root.workspace_id,
                    "scopeKind": _scope(context), "context": context,
                }, effective_context):
                    continue
                # Ordinary directories contain no memory to read. Resolve only
                # recognized locations (and each source again before reading).
                yield self._location(root, path, kind, context, format), path

    def _raw_records(self, root: AuthorizedMemoryRoot, location: Mapping[str, Any], path: Path) -> list[dict[str, Any]]:
        kind = location["memoryKinds"][0]
        if location["format"].startswith("legacy"):
            source = path / ("shapes.pl" if kind == "shape" else "identities.db.pl")
            self._safe(root, source)
            return _legacy_records(source, kind)
        output = []
        for source in sorted(path.glob("*.json")):
            self._safe(root, source)
            payload = json.loads(source.read_text(encoding="utf-8"))
            if not isinstance(payload, dict):
                raise ValueError("memory records must be typed objects")
            if location["format"] == "checkpoint":
                payload = payload.get("checkpoint", payload)
            if location.get("recordSelector") and payload.get("sequenceId") != location["recordSelector"]["sequenceId"]:
                continue
            if location["format"] == "memory_json":
                if (payload.get("schemaVersion") != 1 or payload.get("memoryKind") != kind
                        or not isinstance(payload.get("payload"), dict) or not isinstance(payload.get("recordType"), str)):
                    raise ValueError("invalid persisted memory record")
                if source.name != f"{content_hash(payload)}.memory.json":
                    raise ValueError("persisted memory revision integrity mismatch")
                output.append({"kind": kind, "type": payload["recordType"], "payload": payload["payload"],
                               "persisted": payload})
            elif kind == "shape":
                for key, type in (("anchors", "shape_anchor"), ("prototypes", "observed_prototype")):
                    output.extend({"kind": kind, "type": type, "payload": record}
                                  for record in payload.get(key, []))
            else:
                output.extend({"kind": kind, "type": "persistent_object", "payload": record}
                              for record in payload.get("objects", []))
        return output

    def _records(self, root: AuthorizedMemoryRoot, location: Mapping[str, Any], path: Path) -> list[dict[str, Any]]:
        records = {}
        for raw in self._raw_records(root, location, path):
            payload = raw["payload"]
            if not isinstance(payload, dict) or not payload.get("uid"):
                raise ValueError("memory record lacks a stable identity")
            _validate_payload(raw["kind"], payload)
            revision = content_hash(payload)
            scope_key = [root.workspace_id, location["context"].get("runId") or location["memoryLocationId"]]
            concept = raw.get("persisted", {}).get("conceptUid") or _id("memory-concept", [
                root.provider_ref, raw["kind"], raw["type"],
                payload.get("shapeKey", payload["uid"]),
                scope_key if raw["kind"] == "object" else None,
            ])
            record = {
                "recordUid": _id("memory-record", [location["memoryLocationId"], concept, revision]),
                "conceptUid": concept, "revision": revision, "memoryKind": raw["kind"],
                "recordType": raw["type"], "payload": payload,
                "source": {"memoryLocationId": location["memoryLocationId"], "providerRef": root.provider_ref,
                           "workspaceId": root.workspace_id, "context": location["context"], "scopeKind": location["scopeKind"]},
            }
            if raw.get("persisted", {}).get("origin") is not None:
                record["origin"] = raw["persisted"]["origin"]
            record["observedRevision"] = max(
                (item.get("revision", 0) for item in payload.get("revisions", []) if isinstance(item, dict)),
                default=len(payload.get("compositionHistory", [])),
            )
            records[record["recordUid"]] = record
        return list(records.values())

    def catalog(self, context: MemoryContext, *, volatile: VolatileMemory | None = None) -> dict[str, Any]:
        locations, destinations, errors = {}, {}, []
        for root in self.roots:
            if not root.readable:
                errors.append({"providerRef": root.provider_ref, "workspaceId": root.workspace_id,
                               "message": "Provider does not authorize memory reads"})
                continue
            if not root.root.is_dir():
                errors.append({"providerRef": root.provider_ref, "workspaceId": root.workspace_id,
                               "message": "Authorized memory root is unavailable"})
                continue
            try:
                if (root.provider_ref, root.workspace_id) == (context.provider_ref, context.workspace_id):
                    for location, _ in self._destinations(root, context):
                        destinations[location["memoryLocationId"]] = location
                for location, path in self._discovered(root):
                    if location["scopeKind"] == "run" and not self._effective(location, context):
                        location["label"] = "Run Memory"
                    if location["format"] == "memory_json":
                        destinations[location["memoryLocationId"]] = location
                    try:
                        records = self._records(root, location, path)
                    except (OSError, ValueError) as error:
                        errors.append({"memoryLocationId": location["memoryLocationId"],
                                       "message": f"Memory records could not be read: {str(error) if isinstance(error, ValueError) else type(error).__name__}"})
                        continue
                    if not records:
                        continue
                    kind = location["memoryKinds"][0]
                    location["counts"][kind] = len({record["conceptUid"] for record in records})
                    location["versionCount"] = len(records)
                    location["revision"] = content_hash(sorted(record["revision"] for record in records))
                    locations[location["memoryLocationId"]] = location
            except (OSError, ValueError) as error:
                errors.append({"providerRef": root.provider_ref, "workspaceId": root.workspace_id,
                               "message": f"Memory catalog incomplete: {type(error).__name__}"})
        nowhere = {
            "memoryLocationId": NOWHERE, "providerRef": "session", "workspaceId": context.workspace_id,
            "providerLabel": "Current session", "label": "Nowhere", "scopeKind": "volatile",
            "context": {"gameId": context.game_id, "levelId": context.level_id, "runId": context.run_id},
            "memoryKinds": list(KINDS), "pathLabel": "", "format": "volatile",
            "capabilities": {"read": True, "write": True, "reason": None},
            "counts": {kind: len(volatile.records(kind)) if volatile else 0 for kind in KINDS},
            "revision": None, "lifetime": "Lost on reload or session reset; never cached",
        }
        locations[NOWHERE] = nowhere
        destinations[NOWHERE] = nowhere
        ordered = sorted(locations.values(), key=lambda item: (
            SCOPE_ORDER[item["scopeKind"]], item["providerRef"], item["workspaceId"], item["memoryLocationId"]))
        effective = {kind: [
            item["memoryLocationId"] for item in ordered if kind in item["memoryKinds"]
            and self._effective(item, context)
        ] for kind in KINDS}
        return {"schemaVersion": 1, "locations": ordered, "destinations": list(destinations.values()),
                "context": {"providerRef": context.provider_ref, "workspaceId": context.workspace_id,
                            "gameId": context.game_id, "levelId": context.level_id, "runId": context.run_id},
                "effective": effective, "errors": errors,
                "cachePolicy": "no-store",
                "revision": content_hash({
                    "locations": [item for item in ordered if item["memoryLocationId"] != NOWHERE],
                    "destinations": [item for item in destinations.values() if item["memoryLocationId"] != NOWHERE],
                    "effective": effective, "errors": errors,
                })}

    @staticmethod
    def _effective(location: Mapping[str, Any], context: MemoryContext) -> bool:
        if (location["providerRef"], location["workspaceId"]) != (context.provider_ref, context.workspace_id):
            return False
        return location["scopeKind"] != "volatile" and all(
            value is None or value == expected for value, expected in zip(
                (location["context"].get(key) for key in ("gameId", "levelId", "runId")),
                (context.game_id, context.level_id, context.run_id),
            )
        )

    def _find(self, context: MemoryContext, location_id: str) -> tuple[AuthorizedMemoryRoot, dict[str, Any], Path]:
        # Current scoped destinations are derivable without provider discovery.
        # Reads/writes below still validate the path and record integrity.
        for root in self.roots:
            if not root.readable or not root.root.is_dir():
                continue
            if (root.provider_ref, root.workspace_id) == (context.provider_ref, context.workspace_id):
                for location, path in self._destinations(root, context):
                    if location["memoryLocationId"] == location_id:
                        return root, location, self._safe(root, path)
        for root in self.roots:
            if not root.readable or not root.root.is_dir():
                continue
            for location, path in self._discovered(root):
                if location["memoryLocationId"] == location_id:
                    return root, location, self._safe(root, path)
        raise PermissionError("memory location is unavailable or not authorized")

    def read_selected(self, kind: str, location_ids: Iterable[str], context: MemoryContext, *,
                      volatile: VolatileMemory | None = None) -> dict[str, Any]:
        if kind not in KINDS:
            raise ValueError("unknown memory kind")
        if isinstance(location_ids, str):
            raise ValueError("lookup locations must be a collection of stable IDs")
        location_ids = list(location_ids)
        if not all(isinstance(value, str) and value for value in location_ids):
            raise ValueError("lookup locations must be stable string IDs")
        grouped, errors = {}, []
        for location_id in dict.fromkeys(location_ids):
            try:
                if location_id == NOWHERE:
                    records = volatile.records(kind) if volatile else []
                else:
                    root, location, path = self._find(context, location_id)
                    if kind not in location["memoryKinds"]:
                        raise ValueError("location does not hold this memory kind")
                    records = self._records(root, location, path)
                for record in records:
                    grouped.setdefault(record["conceptUid"], []).append(record)
            except (OSError, ValueError) as error:
                errors.append({"memoryLocationId": location_id, "message": str(error) if isinstance(error, PermissionError) else type(error).__name__})
        output = []
        for concept, versions in sorted(grouped.items()):
            versions.sort(key=lambda item: (SCOPE_ORDER.get(item["source"].get("scopeKind", "volatile"), 4),
                                            item["source"]["memoryLocationId"], -item.get("observedRevision", 0), item["revision"]))
            output.append({"conceptUid": concept, "preferred": versions[0], "versions": versions,
                           "sources": sorted({item["source"]["memoryLocationId"] for item in versions}),
                           "conflict": len({item["revision"] for item in versions}) > 1})
        return {"records": output, "errors": errors, "cachePolicy": "no-store"}

    def save_record(self, kind: str, destination_id: str, payload: Mapping[str, Any], context: MemoryContext, *,
                    volatile: VolatileMemory | None = None, origin: Mapping[str, Any] | None = None,
                    concept_uid: str | None = None) -> dict[str, Any]:
        _validate_payload(kind, payload)
        if destination_id == NOWHERE:
            if volatile is None:
                raise ValueError("Nowhere requires the caller's live session store")
            concept = concept_uid
            if concept is None and (kind == "shape" or context.run_id is not None):
                concept = _id("memory-concept", [
                    context.provider_ref, kind, _record_type(kind, payload), payload.get("shapeKey", payload["uid"]),
                    [context.workspace_id, context.run_id] if kind == "object" else None,
                ])
            return volatile.put(kind, payload, concept_uid=concept, origin=origin, source={
                "providerRef": context.provider_ref, "workspaceId": context.workspace_id,
                "context": {"gameId": context.game_id, "levelId": context.level_id, "runId": context.run_id},
            })
        root, location, path = self._find(context, destination_id)
        if kind not in location["memoryKinds"] or not location["capabilities"]["write"]:
            raise PermissionError("memory destination is not writable for this kind")
        record = {
            "schemaVersion": 1, "memoryKind": kind, "recordType": _record_type(kind, payload),
            "payload": _copy(payload), "origin": _copy(origin) if origin else None,
            "conceptUid": concept_uid or _id("memory-concept", [
                root.provider_ref, kind, _record_type(kind, payload), payload.get("shapeKey", payload["uid"]),
                [root.workspace_id, context.run_id or destination_id] if kind == "object" else None,
            ]),
        }
        revision = content_hash(record)
        with writer_lock(path):
            self._safe(root, path)
            target = path / f"{revision}.memory.json"
            if target.exists() and json.loads(target.read_text(encoding="utf-8")) != record:
                raise ValueError("immutable memory revision collision")
            if not target.exists():
                atomic_json(target, record)
        payload_revision = content_hash(record["payload"])
        result = {
            "recordUid": _id("memory-record", [destination_id, record["conceptUid"], payload_revision]),
            "conceptUid": record["conceptUid"], "revision": payload_revision, "storageRevision": revision,
            "memoryKind": kind, "recordType": record["recordType"], "payload": record["payload"],
            "source": {"memoryLocationId": destination_id, "providerRef": root.provider_ref,
                       "workspaceId": root.workspace_id, "context": location["context"], "scopeKind": location["scopeKind"]},
        }
        if origin:
            result["origin"] = record["origin"]
        return result

    def save_copy(self, record: Mapping[str, Any], destination_id: str, context: MemoryContext, *,
                  volatile: VolatileMemory | None = None) -> dict[str, Any]:
        return self.save_record(
            record["memoryKind"], destination_id, record["payload"], context, volatile=volatile,
            concept_uid=record["conceptUid"],
            origin={"recordUid": record["recordUid"], "revision": record["revision"], "source": record["source"],
                    "previousOrigin": record.get("origin")},
        )

    def _preference_path(self, context: MemoryContext) -> tuple[AuthorizedMemoryRoot, Path]:
        roots = [root for root in self.roots if root.readable and (
            root.provider_ref, root.workspace_id) == (context.provider_ref, context.workspace_id)
            and all(bound is None or bound == actual for bound, actual in (
                (root.game_id, context.game_id), (root.level_id, context.level_id), (root.run_id, context.run_id),
            ))]
        if not roots:
            raise PermissionError("no authorized workspace preference root")
        root = roots[0]
        if not root.root.is_dir():
            raise PermissionError("authorized workspace preference root is unavailable")
        path = root.root / "runtime" / "memory-settings" / f"{_id('context', asdict(context))}.json"
        return root, self._safe(root, path)

    def load_preferences(self, context: MemoryContext) -> dict[str, Any]:
        root, path = self._preference_path(context)
        if path.is_file():
            value = json.loads(path.read_text(encoding="utf-8"))
            self._validate_preferences(value)
            if value.get("revision") != content_hash({key: item for key, item in value.items() if key != "revision"}):
                raise ValueError("memory preference revision mismatch")
            return value
        cached = _DEFAULT_PREFERENCE_READS.get()
        key = (self.roots, context)
        if cached is not None and key in cached:
            return _copy(cached[key])
        destinations, effective = {}, {}
        for mount in self.roots:
            if not mount.readable or not mount.root.is_dir() or (
                mount.provider_ref, mount.workspace_id
            ) != (context.provider_ref, context.workspace_id) or any(
                bound is not None and bound != actual for bound, actual in (
                    (mount.game_id, context.game_id), (mount.level_id, context.level_id), (mount.run_id, context.run_id),
                )
            ):
                continue
            try:
                for location, _ in self._destinations(mount, context):
                    destinations[location["memoryLocationId"]] = location
                for location, directory in self._discovered(mount, effective_context=context):
                    try:
                        if self._records(mount, location, directory):
                            effective[location["memoryLocationId"]] = location
                    except (OSError, ValueError):
                        # Catalog/explicit reads surface these same errors.
                        continue
            except (OSError, ValueError):
                continue
        ordered = sorted(effective.values(), key=lambda item: (
            SCOPE_ORDER[item["scopeKind"]], item["providerRef"], item["workspaceId"], item["memoryLocationId"]))
        value = {"schemaVersion": 1, "expanded": False}
        for kind in KINDS:
            choices = sorted((item for item in destinations.values() if kind in item["memoryKinds"]),
                             key=lambda item: (SCOPE_ORDER[item["scopeKind"]], item["memoryLocationId"]))
            value[kind] = {"saveTo": choices[0]["memoryLocationId"] if choices else NOWHERE,
                           "lookIn": [item["memoryLocationId"] for item in ordered if kind in item["memoryKinds"]],
                           "recentLookIn": []}
        result = {**value, "revision": content_hash(value)}
        if cached is not None:
            cached[key] = _copy(result)
        return result

    @staticmethod
    def _validate_preferences(preferences: Mapping[str, Any]) -> None:
        if not isinstance(preferences, dict) or set(preferences) - {"schemaVersion", "expanded", "shape", "object", "revision"} or preferences.get("schemaVersion") != 1:
            raise ValueError("invalid memory preference schema")
        if not isinstance(preferences.get("expanded"), bool):
            raise ValueError("memory disclosure state must be boolean")
        for kind in KINDS:
            section = preferences.get(kind)
            if not isinstance(section, dict) or set(section) != {"saveTo", "lookIn", "recentLookIn"} or not isinstance(section["saveTo"], str):
                raise ValueError("shape and object require independent saveTo/lookIn preferences")
            for key in ("lookIn", "recentLookIn"):
                if not isinstance(section[key], list) or not all(isinstance(item, str) and item for item in section[key]):
                    raise ValueError("lookup selections must contain stable location IDs")
            if any(item != NOWHERE and not re.fullmatch(r"memory-location-[0-9a-f]{64}", item)
                   for item in [section["saveTo"], *section["lookIn"], *section["recentLookIn"]]):
                raise ValueError("preferences must use catalog location IDs, never raw paths")

    def save_preferences(self, context: MemoryContext, preferences: Mapping[str, Any], *,
                         expected_revision: str) -> dict[str, Any]:
        root, path = self._preference_path(context)
        if not root.writable:
            raise PermissionError("workspace memory preferences are read-only")
        self._validate_preferences(preferences)
        with writer_lock(path.parent):
            previous = self.load_preferences(context)
            if expected_revision != previous["revision"]:
                raise ValueError("memory preferences changed; reload before saving")
            value = {"schemaVersion": 1, "expanded": preferences["expanded"]}
            for kind in KINDS:
                section = preferences[kind]
                if section["saveTo"] != NOWHERE and section["saveTo"] != previous[kind]["saveTo"]:
                    _, destination, _ = self._find(context, section["saveTo"])
                    if kind not in destination["memoryKinds"] or not destination["capabilities"]["write"]:
                        raise PermissionError("selected memory destination is not writable")
                value[kind] = {"saveTo": section["saveTo"], "lookIn": list(dict.fromkeys(section["lookIn"])),
                               "recentLookIn": list(dict.fromkeys(section["recentLookIn"]))[:20]}
            result = {**value, "revision": content_hash(value)}
            atomic_json(path, result)
            return result
