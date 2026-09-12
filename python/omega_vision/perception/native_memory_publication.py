"""Typed, non-activating publication provenance for native STM records."""
from __future__ import annotations

from copy import deepcopy
from pathlib import Path
from typing import Any

from omega_vision.inherited_source_overlay import storage_path
from omega_vision.perception.memory_locations import _id
from omega_vision.perception.observation_identity import content_hash

VERSION = "native-memory-publication-v1"
KINDS = ("shape", "object", "deduction")
UNSUPPORTED = {
    "observation": "Native visual checkpoints belong only to frame/recording STM; no LTM observation schema.",
    "hypothesis": "Hypotheses are frame-local and are not accepted observations or rules.",
    "induced": "Candidate journals remain at their generating frame; publication does not accept candidates.",
    "induction": "No accepted learning-procedure AST/writer is registered.",
    "shape_group": "Typed group schema is not implemented.",
    "object_group": "Typed group schema is not implemented.",
    "shape_group_class": "Typed group-class schema is not implemented.",
    "object_group_class": "Typed group-class schema is not implemented.",
    "object_class": "Typed object-class schema is not implemented.",
}


def safe_path(home: Path, *parts: str) -> Path:
    expected = home.joinpath(*parts)
    resolved = storage_path(home, *parts)
    if resolved != expected:
        raise PermissionError("Native publication path was redirected")
    return resolved


def causal_order(value: Any, context, *, before: int | None = None) -> int:
    if not isinstance(value, dict):
        raise ValueError("Native publication requires attributed causal metadata")
    order = value.get("frameOrder")
    if (type(order) is not int or not 0 <= order < len(context.moments)
            or value.get("sequenceId") != context.sequence_id or value.get("gameId") != context.game_id
            or value.get("frameId") != context.moments[order].frame_id
            or value.get("levelId") != context.moments[order].level_id):
        raise ValueError("Native publication causality disagrees with the explicit recording")
    if before is not None and order >= before:
        raise ValueError("Item is not strictly earlier than the selected publication cutoff")
    return order


def record_order(record, context, *, before=None):
    order = causal_order(record.get("causal"), context, before=before)
    if record["memoryKind"] == "object":
        members = record["payload"].get("members", [])
        if (not isinstance(members, list) or any(
            not isinstance(member, dict) or type(member.get("lastObservedOrder")) is not int
            or not 0 <= member["lastObservedOrder"] <= order for member in members
        )):
            raise ValueError("Native Object observations exceed its original publication cutoff")
    return order


def destination_record(record, descriptor):
    """Keep semantic identity/revision; physical version addresses are area-specific."""
    value = deepcopy(record)
    value.pop("originalSource", None)
    value["source"] = {key: descriptor[key] for key in (
        "memoryLocationId", "providerRef", "workspaceId", "scopeKind", "context", "registeredPath",
    )}
    value["source"]["workspaceId"] = record["source"]["workspaceId"]
    value["recordUid"] = _id("memory-record", [
        descriptor["memoryLocationId"], record["conceptUid"], record["revision"],
    ])
    return value


def validate_publication(entry, home, area, kind, *, context=None, before=None) -> bool:
    """Validate attribution; a different recording has no implicit shared clock."""
    from omega_vision.perception.contextual_memory import (
        PROVIDER, ContextUnavailable, ContextualMemory, recording_context,
    )
    publication = entry.get("publication")
    if publication is None:
        return True
    if (not isinstance(publication, dict) or publication.get("version") != VERSION
            or publication.get("kind") != kind or publication.get("activation") != "none"
            or publication.get("sourcePreserved") is not True
            or publication.get("independentEvidenceAdded") is not False):
        raise ValueError("Unsupported native publication provenance")
    source = publication["source"]
    sequence = source["sequenceId"]
    parts = sequence.removeprefix("data/").split("/")
    if len(parts) != 3 or parts[0] != "recordings" or any(part in {"", ".", ".."} for part in parts):
        raise PermissionError("Publication source is not a canonical native recording")
    directory = safe_path(home, *parts)
    origin = recording_context(home, directory, publication["cutoff"]["frameId"])
    causal_order(publication["cutoff"], origin)
    native = ContextualMemory(home, "omega_vision")
    source_descriptor = native.descriptor(origin.stm_area(), kind, origin)
    if (source["providerRef"] != PROVIDER or source["memoryLocationId"] != source_descriptor["memoryLocationId"]
            or source["registeredPath"] != source_descriptor["registeredPath"]
            or area not in {origin.ltm_area(), origin.game_area()}):
        raise PermissionError("Publication source/destination does not belong to its recorded game/level")
    target_descriptor = native.descriptor(area, kind, origin)
    if publication["destinationId"] != target_descriptor["memoryLocationId"]:
        raise PermissionError("Publication destination identity changed")
    binding = publication["planBinding"]
    changes = [item for item in binding["items"] if item["sourceEntryUid"] == publication["sourceEntryUid"]]
    if (len(changes) != 1 or changes[0]["action"] != "append"
            or binding["kind"] != kind or binding["sequenceId"] != origin.sequence_id
            or binding["source"]["id"] != source["memoryLocationId"]
            or publication["sourceEntryUid"] not in publication["itemIds"]
            or publication["confirmationKey"] != content_hash(publication["planBinding"])
            or publication["planBinding"]["source"]["revision"] != source["revision"]
            or publication["planBinding"]["itemIds"] != publication["itemIds"]
            or publication["planBinding"]["destination"]["id"] != publication["destinationId"]
            or publication["planBinding"]["cutoff"] != publication["cutoff"]):
        raise ValueError("Native publication approval binding is corrupt")
    if kind in {"shape", "object"}:
        record_order(entry["record"], origin, before=origin.current.order)
        if (entry["record"]["recordUid"] != publication["destinationRecordUid"]
                or entry["record"]["conceptUid"] != publication["conceptUid"]
                or entry["record"]["revision"] != publication["recordRevision"]
                or publication["sourceRecordUid"] != _id("memory-record", [
                    source["memoryLocationId"], publication["conceptUid"], publication["recordRevision"],
                ])
                or any(publication[key] != changes[0][key] for key in (
                    "sourceRecordUid", "destinationRecordUid", "conceptUid", "recordRevision",
                ))):
            raise ValueError("Published semantic record identity changed")
    else:
        causal_order(entry["promotedAt"], origin, before=origin.current.order)
        if any(entry[key] != changes[0][key] for key in ("candidateId", "candidateVersion", "evaluationId")):
            raise ValueError("Published rule approval identity changed")
    if context is None:
        return True
    if context.sequence_id != origin.sequence_id:
        raise ContextUnavailable(
            "cross_recording_publication_order_unavailable",
            "No cross-recording publication order is registered; inspection is not inference eligibility.",
        )
    cutoff = min(context.current.order, before) if before is not None else context.current.order
    return origin.current.order < cutoff
