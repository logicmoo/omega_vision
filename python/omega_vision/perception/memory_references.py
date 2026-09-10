"""Typed Omega references; relation semantics never substitute for exact identity."""
from __future__ import annotations

from collections.abc import Mapping
from typing import Any

from omega_vision.perception.metta_memory import DATABASE_FILES, PLANNED_DATABASE_FILES

TARGET_FILES = {kind: DATABASE_FILES[kind] for kind in ("shape", "object")}
TARGET_FILES.update(PLANNED_DATABASE_FILES)
RELATION_PAIRS = {
    "has_member": {"shape_group": "shape", "object_group": "object"},
    "member_of": {"shape": "shape_group", "object": "object_group"},
    "instance_of": {"shape_group": "shape_group_class", "object_group": "object_group_class",
                    "object": "object_class"},
    "has_instance": {"shape_group_class": "shape_group", "object_group_class": "object_group",
                     "object_class": "object"},
    "part_of": {"object": "object"},
    "has_part": {"object": "object"},
}
RELATION_TARGETS = {
    "references": tuple(TARGET_FILES),
    "has_shape": ("shape",),
    **{relation: tuple(dict.fromkeys(pairs.values())) for relation, pairs in RELATION_PAIRS.items()},
}


def reference_schema() -> dict[str, Any]:
    return {
        "required": ["targetKind", "relation", "providerRef", "memoryLocationId", "recordUid", "revision"],
        "optional": ["workspaceId", "registeredPath"],
        "targetKinds": dict(TARGET_FILES),
        "relations": {relation: {"targetKinds": list(kinds),
                                 **({"sourceTargetPairs": dict(RELATION_PAIRS[relation])}
                                    if relation in RELATION_PAIRS else {})}
                      for relation, kinds in RELATION_TARGETS.items()},
        "identity": ["providerRef", "memoryLocationId", "targetKind", "recordUid", "revision"],
        "workspaceIdRole": "provenance_only",
        "legacyAdapter": {"field": "shapeReferences", "targetKind": "shape", "relation": "has_shape"},
        "resolution": "same_area_sequence_frame_exact_version",
    }


def normalize_reference(value: Mapping[str, Any], *, source_kind: str | None = None,
                        legacy_shape: bool = False) -> dict[str, Any]:
    if not isinstance(value, Mapping):
        raise ValueError("A typed attributed reference object is required")
    result = dict(value)
    if legacy_shape:
        result.setdefault("targetKind", "shape")
        result.setdefault("relation", "has_shape")
        if result["targetKind"] != "shape" or result["relation"] != "has_shape":
            raise ValueError("shapeReferences is a shape-only has_shape adapter")
    for key in ("targetKind", "relation", "providerRef", "memoryLocationId", "recordUid", "revision"):
        if not isinstance(result.get(key), str) or not result[key]:
            raise ValueError(f"References require explicit {key}")
    kind, relation = result["targetKind"], result["relation"]
    if kind not in TARGET_FILES or relation not in RELATION_TARGETS:
        raise ValueError("Unknown reference targetKind or relation")
    if kind not in RELATION_TARGETS[relation]:
        raise ValueError("Reference relation and targetKind disagree")
    if source_kind is not None:
        if source_kind not in TARGET_FILES:
            raise ValueError("Unknown reference source kind")
        if relation in RELATION_PAIRS and RELATION_PAIRS[relation].get(source_kind) != kind:
            raise ValueError("Reference relation has incompatible source/target domains")
    if "workspaceId" in result and (not isinstance(result["workspaceId"], str) or not result["workspaceId"]):
        raise ValueError("Optional workspace provenance must be a nonempty string")
    if "registeredPath" in result:
        path = result["registeredPath"]
        if (not isinstance(path, str) or not path or "\\" in path or ":" in path
                or any(part in {"", ".", ".."} for part in path.split("/"))):
            raise ValueError("Unsafe registered reference path")
    return result
