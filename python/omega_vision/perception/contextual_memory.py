"""Direct contextual memory areas; option readiness never depends on discovery."""
from __future__ import annotations

from dataclasses import dataclass, replace
import json
from pathlib import Path
import re
from typing import Any, Mapping

from omega_vision.inherited_source_overlay import storage_path
from omega_vision.perception.memory_locations import (
    AuthorizedMemoryRoot, MemoryLocations, NOWHERE, _id, _record_type, _validate_payload,
)
from omega_vision.perception.metta_memory import (
    DATABASE_FILES, PLANNED_DATABASE_FILES, MeTTaMemoryDatabase, initial_recording_state, is_memory_directory,
)
from omega_vision.perception.memory_references import normalize_reference, reference_schema
from omega_vision.perception.observation_identity import content_hash

PROVIDER = "filesystem:omega_vision"
STORAGE = "omega_vision"
PLANNED_KIND_DOMAINS = {
    "shape_group": {"memberKind": "shape", "classKind": "shape_group_class"},
    "object_group": {"memberKind": "object", "classKind": "object_group_class"},
    "shape_group_class": {"instanceKind": "shape_group"},
    "object_group_class": {"instanceKind": "object_group"},
    "object_class": {"instanceKind": "object"},
}
CONTEXTUAL_CHOICES = (
    ("inherited", "Long term/Inherited"),
    ("movie", "Current Movie/Body (All Previous Chapters)"),
    ("chapter", "Current Chapter/Game (All Previous Scenes)"),
    ("scene", "Current Scene/Level (All Previous Frames)"),
    ("previous-moment", "Previous Moment/Frame"),
    ("current-moment", "Current Moment/Frame"),
)
# Compatibility entries are registered explicitly, never discovered on option GET.
LEGACY_AREAS = tuple(
    {"areaId": "legacy:" + base + "/" + suffix, "label": base + " · " + kind.title(),
     "memoryKinds": [kind], "registeredPath": base + "/" + suffix,
     "format": format}
    for base in (
        "object_memory",
        "object_memory_demo/raw_ls20_saved_154",
        "object_memory_demo/vf_data-recordings-ls20-20260718-154544_attempt8",
        "object_memory_demo/vf_data-arc3_games-recordings-ls20-ls20-8aed7120-f7a9-45a1-837a-68bc7dc37a4f_attempt7_size_0003",
    )
    for kind, suffix, format in (
        ("shape", "shape_dir", "legacy_shape"), ("object", "identity_dir/ls20", "legacy_object"),
    )
)


class ContextUnavailable(ValueError):
    def __init__(self, code: str, message: str):
        super().__init__(message)
        self.code = code


def inspectable_areas() -> dict[str, Any]:
    areas = [
        {"areaId": f"contextual:{key}", "areaType": "contextual", "label": label,
         "memoryKinds": ["shape", "object"], "counts": {"shape": None, "object": None},
         "plannedMemoryKinds": list(PLANNED_DATABASE_FILES),
         "revision": None, "loadState": "not_loaded", "readOnly": True}
        for key, label in CONTEXTUAL_CHOICES
    ]
    areas.append({
        "areaId": "session:nowhere", "areaType": "session", "label": "Nowhere",
        "memoryKinds": ["shape", "object"], "counts": {"shape": None, "object": None},
        "revision": None, "loadState": "not_loaded", "readOnly": True,
    })
    areas.extend({**item, "counts": {"shape": None, "object": None}, "revision": None,
                  "loadState": "not_loaded", "readOnly": True, "areaType": "legacy"}
                 for item in LEGACY_AREAS)
    kinds = {
        kind: {"databaseFile": DATABASE_FILES[kind], "schemaStatus": "implemented",
               "read": True, "write": True}
        for kind in ("shape", "object")
    }
    kinds.update({
        kind: {
            "databaseFile": filename, "schemaStatus": "pending", **PLANNED_KIND_DOMAINS[kind],
            "read": False, "write": False, "reasonCode": f"{kind}_schema_unavailable",
            "message": f"The {kind} record, producer and inspector schemas are not implemented. "
                       "Typed membership, class references, provenance and V/W-versus-accepted-G remain "
                       "distinct; groups and observation IDs are not persistent Object identities.",
        }
        for kind, filename in PLANNED_DATABASE_FILES.items()
    })
    references = reference_schema()
    return {"schemaVersion": 1,
            "areasRevision": content_hash({"areas": areas, "kindSchemas": kinds, "referenceSchema": references}),
            "areas": areas, "kindSchemas": kinds, "referenceSchema": references}


def _segment(value: Any, label: str) -> str:
    if type(value) not in (str, int) or not str(value):
        raise ContextUnavailable("missing_context", f"Explicit {label} metadata is required")
    value = str(value)
    if (value in {".", ".."} or re.search(r'[\\/:*?"<>|\x00-\x1f]', value)
            or value.endswith((".", " ")) or is_memory_directory(value)):
        raise PermissionError(f"Unsafe {label} identifier")
    return value


@dataclass(frozen=True)
class Moment:
    frame_id: str
    directory: Path
    level_id: str | None
    order: int


@dataclass(frozen=True)
class RecordingContext:
    root: Path
    directory: Path
    sequence_id: str
    game_id: str
    game_directory: str
    moments: tuple[Moment, ...]
    current: Moment

    @property
    def causal(self):
        return {"sequenceId": self.sequence_id, "gameId": self.game_id,
                "levelId": self.current.level_id, "frameId": self.current.frame_id,
                "frameOrder": self.current.order}

    def frame_area(self, moment: Moment | None = None) -> Path:
        return (moment or self.current).directory / "memory"

    def game_area(self) -> Path:
        return self.root / "recordings" / self.game_directory / "memory_game_all"

    def ltm_area(self) -> Path:
        if self.current.level_id is None:
            raise ContextUnavailable("missing_level", "The selected move has no explicit level")
        return self.root / "recordings" / self.game_directory / f"memory_level_{self.current.level_id}_ltm"

    def stm_area(self) -> Path:
        if self.current.level_id is None:
            raise ContextUnavailable("missing_level", "The selected move has no explicit level")
        return self.directory / f"memory_level_{self.current.level_id}_stm"


def recording_context(root: Path, directory: Path, frame_id: str | None, *,
                      select_first: bool = False) -> RecordingContext:
    home = storage_path(root)
    relative = directory.relative_to(home)
    if len(relative.parts) != 3 or relative.parts[0] != "recordings":
        raise ContextUnavailable("unsupported_hierarchy", "A canonical game/recording context is required")
    if not frame_id and not select_first:
        raise ContextUnavailable("missing_frame", "Select an actual frame; no last-frame default is inferred")
    manifest_path = storage_path(home, *relative.parts, "recording.json")
    if not manifest_path.is_file():
        raise ContextUnavailable("missing_order", "An explicit recording move manifest is required")
    manifest = json.loads(manifest_path.read_text(encoding="utf-8"))
    if not isinstance(manifest, dict):
        raise ContextUnavailable("invalid_order", "Recording metadata must be an object")
    game = _segment(manifest.get("game_id"), "game")
    from omega_vision.services.arc3_play import _game_slug
    if _game_slug(game) != relative.parts[1]:
        raise ContextUnavailable("incompatible_game_path", "Explicit game identity disagrees with the recording path")
    moves = manifest.get("moves")
    if not isinstance(moves, list) or not moves:
        raise ContextUnavailable("missing_order", "A nonempty explicit ordered moves array is required")
    moments = []
    initial = initial_recording_state(home, directory)
    if initial is not None:
        if initial.get("game_id", game) != game:
            raise ContextUnavailable("incompatible_initial_game", "Initial observation and recording game identities disagree")
        level = _segment(initial["level"], "level") if initial.get("level") is not None else None
        unit_dir = storage_path(home, *relative.parts, "transforms", "image")
        if unit_dir != directory / "transforms" / "image":
            raise PermissionError("Initial observation transform unit was redirected")
        moments.append(Moment("image", unit_dir, level, 0))
    for move in moves:
        if not isinstance(move, dict) or not isinstance(move.get("directory"), str):
            raise ContextUnavailable("invalid_order", "Every ordered move needs its actual directory")
        reference = move["directory"]
        if reference.startswith("data/"):
            parts = reference[5:].split("/")
            while parts and parts[0] == "omega_vision":
                parts.pop(0)
            target = storage_path(home, *parts)
        else:
            target = storage_path(home, *relative.parts, _segment(reference, "frame"))
        if target.parent != directory or is_memory_directory(target.name):
            raise PermissionError("Ordered frame directory is outside the selected recording")
        if not target.is_dir():
            raise ContextUnavailable("missing_frame_directory", "An explicitly ordered frame directory is missing")
        level = _segment(move["level"], "level") if move.get("level") is not None else None
        moments.append(Moment(target.name, target, level, len(moments)))
    if len({moment.frame_id for moment in moments}) != len(moments):
        raise ContextUnavailable("invalid_order", "Duplicate frame directories do not define an unambiguous predecessor")
    current = moments[0] if frame_id is None and select_first else next(
        (moment for moment in moments if moment.frame_id == frame_id), None)
    if current is None:
        raise ContextUnavailable("frame_not_in_order", "Selected frame is not in the explicit recording order")
    return RecordingContext(home, directory, "data/" + relative.as_posix(), game,
                            relative.parts[1], tuple(moments), current)


def grouped_records(records: list[dict[str, Any]]) -> list[dict[str, Any]]:
    groups = {}
    for record in records:
        groups.setdefault(record["conceptUid"], []).append(record)
    result = []
    for concept, versions in sorted(groups.items()):
        versions.sort(key=lambda item: (item["source"]["memoryLocationId"], item["revision"]))
        result.append({"conceptUid": concept, "preferred": versions[0], "versions": versions,
                       "sources": sorted({item["source"]["memoryLocationId"] for item in versions}),
                       "conflict": len({item["revision"] for item in versions}) > 1})
    return result


def _volatile_descriptor(kind, records):
    return {
        "memoryLocationId": NOWHERE, "providerRef": PROVIDER, "catalogProviderRef": "session",
        "workspaceId": STORAGE, "providerLabel": "Current browser session",
        "memoryKinds": [kind], "scopeKind": "volatile", "context": {},
        "label": "Nowhere", "pathLabel": "Browser RAM", "format": "volatile",
        "counts": {**{"shape": None, "object": None}, kind: len({record["conceptUid"] for record in records})},
        "versionCount": len(records),
        "revision": content_hash([record["recordUid"] for record in records]),
        "capabilities": {"read": True, "write": False, "reason": "Read-only inspection"},
    }


class ContextualMemory:
    def __init__(self, root: Path, workspace_id: str, *, mount: AuthorizedMemoryRoot | None = None):
        self.root = storage_path(root)
        self.workspace_id = workspace_id
        self.mount = mount or AuthorizedMemoryRoot(PROVIDER, STORAGE, self.root, "Omega Vision", writable=True)
        if (self.mount.provider_ref != PROVIDER or self.mount.root != self.root or not self.mount.readable
                or any((self.mount.game_id, self.mount.level_id, self.mount.run_id))):
            raise PermissionError("Contextual memory requires the authorized shared Omega root")
        self.mount = replace(self.mount, workspace_id=STORAGE)

    def descriptor(self, area: Path, kind: str, context: RecordingContext | None = None):
        db = MeTTaMemoryDatabase(self.root, area, kind)
        parts = area.relative_to(self.root).parts
        scope = "global" if len(parts) < 3 else "game" if area.name == "memory_game_all" else (
            "level" if area.name.endswith("_ltm") else "run")
        metadata = {"gameId": context.game_id if context and scope != "global" else None,
                    "levelId": context.current.level_id if context and scope in {"level", "run"} else None,
                    "runId": context.sequence_id if context and scope == "run" else None}
        if context and area.name == "memory":
            moment = next((item for item in context.moments if item.directory == area.parent), None)
            if moment:
                metadata["levelId"] = moment.level_id
        return {
            "memoryLocationId": MemoryLocations._location_id(self.mount, db.path),
            "providerRef": PROVIDER, "workspaceId": STORAGE, "providerLabel": "Omega Vision",
            "memoryKinds": [kind], "scopeKind": scope, "context": metadata,
            "label": area.name, "pathLabel": str(db.path), "format": "memory_metta",
            "registeredPath": area.relative_to(self.root).as_posix(),
            "capabilities": {"read": True, "write": self.mount.writable,
                             "reason": None if self.mount.writable else "Read-only grant"},
            "counts": {"shape": None, "object": None}, "revision": None,
        }

    def native_areas(self, context: RecordingContext | None = None) -> list[Path]:
        areas = [self.root / "memory_inherited", self.root / "recordings" / "memory_recordings"]
        if context:
            areas.append(context.game_area())
            if context.current.level_id is not None:
                areas.extend([context.ltm_area(), context.stm_area()])
            areas.append(context.frame_area())
        return areas

    def save(self, area: Path, kind: str, payload: Mapping[str, Any], *,
             context: RecordingContext | None = None, origin=None, concept_uid=None):
        _validate_payload(kind, payload)
        if not self.mount.writable:
            raise PermissionError("Memory provider does not authorize writes")
        if area not in self.native_areas(context):
            raise PermissionError("Memory save area is outside the explicitly selected context")
        source = self.descriptor(area, kind, context)
        causal = context.causal if context else None
        concept = concept_uid or _id("memory-concept", [
            PROVIDER, kind, _record_type(kind, payload), payload.get("shapeKey", payload["uid"]),
            context.sequence_id if context and kind == "object" else None,
        ])
        revision = content_hash({"payload": payload, "causal": causal, "origin": origin})
        record = {
            "recordUid": _id("memory-record", [source["memoryLocationId"], concept, revision]),
            "conceptUid": concept, "revision": revision, "memoryKind": kind,
            "recordType": _record_type(kind, payload), "payload": dict(payload), "causal": causal,
            "source": {key: source[key] for key in ("memoryLocationId", "providerRef", "workspaceId", "scopeKind", "context", "registeredPath")},
        }
        record["source"]["workspaceId"] = self.workspace_id
        if origin is not None:
            record["origin"] = origin
        database = MeTTaMemoryDatabase(self.root, area, kind)
        return database.append({"entryType": "memory_version", "record": record})["record"]

    def read(self, area: Path, kind: str, context: RecordingContext | None = None, *,
             before: int | None = None, exact: int | None = None):
        source = self.descriptor(area, kind, context)
        db = MeTTaMemoryDatabase(self.root, area, kind)
        if not db.path.is_file():
            raise ContextUnavailable("missing_database", f"{db.path.name} does not exist in the selected area")
        records = []
        for entry, original in db.read_with_sources():
            record = entry.get("record")
            if (entry.get("entryType") != "memory_version" or not isinstance(record, dict)
                    or record.get("memoryKind") != kind or not isinstance(record.get("source"), dict)
                    or any(record["source"].get(key) != source[key] for key in ("providerRef", "memoryLocationId"))):
                raise ValueError("Memory record has an incompatible physical source identity")
            _validate_payload(kind, record.get("payload"))
            if record.get("revision") != content_hash({
                "payload": record["payload"], "causal": record.get("causal"), "origin": record.get("origin"),
            }):
                raise ValueError("Memory record revision mismatch")
            if record.get("recordUid") != _id("memory-record", [
                source["memoryLocationId"], record.get("conceptUid"), record["revision"],
            ]):
                raise ValueError("Memory record identity mismatch")
            if before is not None or exact is not None:
                causal = record.get("causal")
                if not isinstance(causal, dict) or context is None:
                    raise ContextUnavailable("missing_causal_metadata", "Selected memory contains unattributed causal history")
                position = causal.get("frameOrder")
                if (type(position) is not int or not 0 <= position < len(context.moments)
                        or causal.get("sequenceId") != context.sequence_id
                        or causal.get("frameId") != context.moments[position].frame_id
                        or causal.get("levelId") != context.moments[position].level_id):
                    raise ContextUnavailable("invalid_causal_metadata", "Memory causality disagrees with explicit recording order")
                if before is not None and (position >= before or causal["levelId"] != context.current.level_id):
                    continue
                if exact is not None and position != exact:
                    continue
            records.append({
                **record,
                "source": {**record["source"], "format": "memory_metta", "pathLabel": str(db.path)},
                "originalSource": {"format": "metta", "path": str(db.path), "text": original,
                                   "entryUid": entry["entryUid"], "readOnly": True},
            })
        source["counts"][kind] = len({record["conceptUid"] for record in records})
        source["revision"] = content_hash([record["recordUid"] for record in records])
        return records, source

    def read_legacy(self, area_id: str, kind: str):
        spec = next(item for item in LEGACY_AREAS if item["areaId"] == area_id)
        if kind not in spec["memoryKinds"]:
            raise ValueError("The registered legacy area does not contain this memory kind")
        reader = MemoryLocations([self.mount])
        mount = reader.roots[0]
        area = self.root.joinpath(*spec["registeredPath"].split("/"))
        reader._safe(mount, area)
        filename = "shapes.pl" if kind == "shape" else "identities.db.pl"
        source_path = reader._safe(mount, area / filename)
        if not source_path.is_file():
            raise ContextUnavailable("missing_database", "This registered historical database is unavailable")
        source = reader._location(
            mount, area, kind, {"gameId": "ls20" if kind == "object" else None,
                                    "levelId": None, "runId": None}, spec["format"],
        )
        records = reader._records(mount, source, area)
        source["registeredPath"] = spec["registeredPath"]
        source["databasePath"] = str(source_path)
        for record in records:
            record["source"]["registeredPath"] = spec["registeredPath"]
        source["counts"][kind] = len({record["conceptUid"] for record in records})
        source["revision"] = content_hash([record["recordUid"] for record in records])
        return records, source

    def inspect_reference(self, reference, *, area_id=None, context_loader=None, volatile=None):
        reference = normalize_reference(reference)
        kind = reference["targetKind"]
        if reference.get("providerRef") != PROVIDER:
            raise PermissionError("Reference provider is outside the authorized shared root")
        if area_id is None:
            raise ContextUnavailable("missing_area_context", "Reference lookup requires the selected inspector area")
        if kind in PLANNED_DATABASE_FILES:
            return self.inspect(area_id, kind, context_loader=context_loader, volatile=volatile)
        location = reference.get("memoryLocationId")
        path = reference.get("registeredPath")
        if path is not None and location != NOWHERE:
            spec = next((item for item in LEGACY_AREAS if item["registeredPath"] == path), None)
            if spec:
                if MemoryLocations._location_id(self.mount, self.root.joinpath(*path.split("/"))) != location:
                    raise PermissionError("Reference path and physical location identity disagree")
                if kind not in spec["memoryKinds"]:
                    raise ValueError("Reference target kind disagrees with the registered legacy source")
            else:
                if not isinstance(path, str) or not path or path.startswith(("/", "\\")) or "\\" in path:
                    raise PermissionError("Reference requires a registered relative memory path")
                parts = path.split("/")
                if any(part in {"", ".", ".."} or ":" in part for part in parts):
                    raise PermissionError("Unsafe registered memory reference path")
                area = self.root.joinpath(*parts)
                source = self.descriptor(area, kind)
                if source["memoryLocationId"] != location:
                    raise PermissionError("Reference path and physical location identity disagree")
        result = self.inspect(area_id, kind, context_loader=context_loader, volatile=volatile)
        if result["status"] != "ready":
            return result
        authorized = {(item["providerRef"], item["memoryLocationId"], item["memoryKind"])
                      for item in result["authorizedSources"]}
        identity = (reference["providerRef"], location, kind)
        exact = [record for group in result["records"] for record in group["versions"]
                 if identity in authorized
                 and (record["source"]["providerRef"], record["source"]["memoryLocationId"],
                      record["memoryKind"]) == identity
                 and record["recordUid"] == reference["recordUid"] and record["revision"] == reference["revision"]]
        result.update(status="ready" if exact else "unavailable",
                      reasonCode=None if exact else "reference_not_found",
                      records=grouped_records(exact),
                      revision=content_hash([record["recordUid"] for record in exact]) if exact else None)
        if not exact:
            result["errors"] = [{"code": "reference_not_found",
                                 "message": "Reference is not available in the selected area and temporal context"}]
        return result

    def inspect(self, area_id: str, kind: str, *, context_loader=None, volatile=None):
        if not isinstance(kind, str) or kind not in {"shape", "object", *PLANNED_DATABASE_FILES}:
            raise ValueError("Unknown memory kind")
        if not isinstance(area_id, str) or area_id not in {item["areaId"] for item in inspectable_areas()["areas"]}:
            raise PermissionError("Unregistered inspector area")
        area_type = next(item["areaType"] for item in inspectable_areas()["areas"] if item["areaId"] == area_id)
        result = {"areaId": area_id, "areaType": area_type, "kind": kind,
                  "records": [], "sources": [], "authorizedSources": [], "errors": [],
                  "revision": None, "cachePolicy": "no-store"}
        try:
            if kind in PLANNED_DATABASE_FILES:
                schema = inspectable_areas()["kindSchemas"][kind]
                raise ContextUnavailable(schema["reasonCode"], schema["message"])
            if area_id == "session:nowhere":
                if volatile is None:
                    raise ContextUnavailable("missing_browser_session", "Nowhere requires the current browser snapshot")
                records = volatile.records(kind)
                source = _volatile_descriptor(kind, records)
                result["sources"] = [source]
            elif area_id == "contextual:inherited":
                records, source = self.read(self.root / "memory_inherited", kind)
                result["sources"] = [source]
                result["policyNotes"] = ["Shared level-LTM participation is unspecified; no implicit LTM union"]
            elif area_id == "contextual:movie":
                raise ContextUnavailable("missing_body_hierarchy", "No explicit body/chapter ordering schema is registered")
            elif area_id == "contextual:chapter":
                raise ContextUnavailable("missing_scene_policy", "Cross-recording scene order and level-LTM participation are unspecified")
            elif area_id.startswith("legacy:"):
                records, source = self.read_legacy(area_id, kind)
                result["sources"] = [source]
            else:
                if context_loader is None:
                    raise ContextUnavailable("missing_context", "Select an actual recording and frame")
                context = context_loader()
                if area_id == "contextual:scene":
                    records, source = self.read(context.stm_area(), kind, context, before=context.current.order)
                else:
                    index = context.current.order - (area_id == "contextual:previous-moment")
                    if index < 0:
                        raise ContextUnavailable("no_predecessor", "The selected frame has no previous moment")
                    records, source = self.read(context.frame_area(context.moments[index]), kind, context, exact=index)
                result["sources"] = [source]
            result.update(status="ready", records=grouped_records(records),
                          revision=content_hash([record["recordUid"] for record in records]))
        except ContextUnavailable as error:
            result.update(status="unavailable", reasonCode=error.code, message=str(error))
            result["errors"] = [{"code": error.code, "message": str(error)}]
        result["authorizedSources"] = [{**source, "memoryKind": kind, "readOnly": True,
                                       "path": None if source["format"] == "volatile"
                                       else source.get("databasePath", source["pathLabel"])}
                                       for source in result["sources"]]
        return result
