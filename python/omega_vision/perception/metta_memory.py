"""Append-only typed MeTTa documents in explicitly registered Omega memory areas."""
from __future__ import annotations

from contextlib import contextmanager, nullcontext
import os
from pathlib import Path
from threading import local
from typing import Any, Mapping
from uuid import uuid4

from omega_vision.inherited_source_overlay import storage_path
from omega_vision.perception._event_journal import writer_lock, json_copy
from omega_vision.perception.memory_catalog_cache import memory_catalog_mutation
from omega_vision.perception.observation_identity import content_hash
from omega_vision.services.metta_resource_codec import (
    json_value_to_metta, metta_document_to_json, split_metta_document_spans,
)

DATABASE_FILES = {
    "shape": "shapes_db.metta", "object": "objects_db.metta",
    "deduction": "deduction_rules.metta", "induction": "induction_rules.metta",
    "induced": "induced_rules.metta",
}
PLANNED_DATABASE_FILES = {
    "shape_group": "shape_groups_db.metta", "object_group": "object_groups_db.metta",
    "shape_group_class": "shape_group_classes_db.metta",
    "object_group_class": "object_group_classes_db.metta", "object_class": "obj_classes_db.metta",
}
_TREE_LOCK_STATE = local()


def is_memory_directory(name: str) -> bool:
    name = name.casefold()
    return (name in {"memory", "memory_inherited", "memory_recordings", "memory_game_all",
                     "object_memory", "shape_dir", "identity_dir"}
            or name.startswith(("memory_level_", "object_memory_")))


@contextmanager
def memory_tree_lock(root: Path):
    directory = storage_path(root, "runtime", "memory-tree-locks")
    if directory != storage_path(root) / "runtime" / "memory-tree-locks":
        raise PermissionError("Memory tree lock directory was redirected")
    if storage_path(root, "runtime", "memory-tree-locks", ".writer.lock") != directory / ".writer.lock":
        raise PermissionError("Memory tree lock file was redirected")
    held = getattr(_TREE_LOCK_STATE, "held", None)
    if held is None:
        held = _TREE_LOCK_STATE.held = set()
    if directory in held:
        yield
        return
    with writer_lock(directory):
        held.add(directory)
        try:
            yield
        finally:
            held.remove(directory)


def _metta(value: Any) -> str:
    # The resource codec supports pretty embedded JSON strings; memory instead
    # quotes every string so identifiers cannot turn into numbers or booleans.
    if isinstance(value, Mapping):
        return "(" + "\n".join(
            f"({json_value_to_metta(key, force_quote_string=True)} {_metta(item)})"
            for key, item in value.items()
        ) + ")"
    if isinstance(value, list):
        return "([] " + " ".join(_metta(item) for item in value) + ")"
    return json_value_to_metta(value, force_quote_string=True)


class MeTTaMemoryDatabase:
    def __init__(self, root: Path, area: Path, role: str):
        if role in PLANNED_DATABASE_FILES:
            raise ValueError(f"Memory record schema for {role} is not implemented")
        if role not in DATABASE_FILES:
            raise ValueError("Unknown memory database role")
        self.root = storage_path(root)
        relative = area.relative_to(self.root)
        self.area = storage_path(root, *relative.parts)
        parts = relative.parts
        valid = parts == ("memory_inherited",) or parts == ("recordings", "memory_recordings")
        if len(parts) == 3 and parts[0] == "recordings":
            valid |= parts[2] == "memory_game_all" or (
                parts[2].startswith("memory_level_") and parts[2].endswith("_ltm"))
        if len(parts) == 4 and parts[0] == "recordings":
            valid |= parts[3].startswith("memory_level_") and parts[3].endswith("_stm")
        if len(parts) == 5 and parts[0] == "recordings":
            valid |= parts[4] == "memory" and not is_memory_directory(parts[3])
        if not valid or self.area != area:
            raise PermissionError("Not a registered physical Omega memory area")
        self.role = role
        self.path = self._safe(self.area / DATABASE_FILES[role])

    def _safe(self, path: Path) -> Path:
        area = storage_path(self.root, *self.area.relative_to(self.root).parts)
        target = storage_path(self.root, *path.relative_to(self.root).parts)
        if area != self.area or target != path or target.parent != self.area:
            raise PermissionError("Memory database target was redirected")
        return target

    def _read(self) -> tuple[str, list[dict[str, Any]]]:
        path = self._safe(self.path)
        if not path.exists():
            return "", []
        text = path.read_text(encoding="utf-8")
        try:
            spans = split_metta_document_spans(text)
        except ValueError as error:
            raise ValueError("Memory DB contains non-MeTTa or malformed data; explicit migration is required") from error
        cursor, documents = 0, []
        for start, end, source in spans:
            if any(line.split(";", 1)[0].strip() for line in text[cursor:start].splitlines()):
                raise ValueError("Memory DB contains non-MeTTa data; explicit migration is required")
            document = metta_document_to_json(source)
            if document.get("schemaVersion") != 1 or document.get("databaseRole") != self.role:
                raise ValueError("Unsupported memory DB schema; no conversion is performed")
            if document.get("entryUid") != content_hash({
                key: value for key, value in document.items() if key != "entryUid"
            }):
                raise ValueError("MeTTa memory version integrity mismatch")
            documents.append(document)
            cursor = end
        if any(line.split(";", 1)[0].strip() for line in text[cursor:].splitlines()):
            raise ValueError("Memory DB contains non-MeTTa data; explicit migration is required")
        if len({document["entryUid"] for document in documents}) != len(documents):
            raise ValueError("Duplicate immutable MeTTa memory versions")
        return text, documents

    def read(self) -> list[dict[str, Any]]:
        return self._read()[1]

    def read_with_sources(self) -> list[tuple[dict[str, Any], str]]:
        text, documents = self._read()
        return [(document, source) for document, (_, _, source)
                in zip(documents, split_metta_document_spans(text), strict=True)]

    @contextmanager
    def transaction(self):
        with memory_tree_lock(self.root):
            self._safe(self.path)
            self._safe(self.area / ".writer.lock")
            if len(self.area.relative_to(self.root).parts) >= 3 and not self.area.parent.is_dir():
                raise PermissionError("Memory source context no longer exists; no directory is recreated")
            with writer_lock(self.area):
                self._safe(self.path)
                self._safe(self.area / ".writer.lock")
                yield

    def append(self, value: Mapping[str, Any], *, _locked: bool = False) -> dict[str, Any]:
        document = json_copy({**value, "schemaVersion": 1, "databaseRole": self.role})
        document.pop("entryUid", None)
        document["entryUid"] = content_hash(document)
        serialized = _metta(document) + "\n"
        if metta_document_to_json(serialized) != document:
            raise ValueError("Memory value is not losslessly representable by the MeTTa codec")
        with (nullcontext() if _locked else self.transaction()):
            text, records = self._read()
            existing = next((item for item in records if item["entryUid"] == document["entryUid"]), None)
            if existing is not None:
                return existing
            if document.get("entryType") == "memory_version":
                record_uid = document["record"]["recordUid"]
                existing = next((item for item in records
                                 if item.get("record", {}).get("recordUid") == record_uid), None)
                if existing is not None:
                    return existing
            temporary = self._safe(self.path.with_name(f".{self.path.name}.{uuid4().hex}.tmp"))
            try:
                with temporary.open("x", encoding="utf-8", newline="\n") as stream:
                    stream.write(text)
                    if text and not text.endswith("\n"):
                        stream.write("\n")
                    stream.write(serialized)
                    stream.flush()
                    os.fsync(stream.fileno())
                self._safe(self.path)
                self._safe(temporary)
                with memory_catalog_mutation(self.root):
                    os.replace(temporary, self.path)
            finally:
                temporary.unlink(missing_ok=True)
        return document
