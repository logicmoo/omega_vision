"""Explicit, confirmed STM-to-LTM publication; never inference or rule acceptance."""
from __future__ import annotations

from copy import deepcopy
from dataclasses import replace
from datetime import datetime, timezone
from functools import wraps
from pathlib import Path
import re
from typing import Any

from fastapi import APIRouter, Body, HTTPException, Response

from omega_vision.inherited_source_overlay import storage_path
from omega_vision.perception import native_memory_publication as model
from omega_vision.perception.candidate_rules import PromotionGates, _evaluation
from omega_vision.perception.contextual_memory import (
    PROVIDER, ContextualMemory, ContextUnavailable, _segment, recording_context,
)
from omega_vision.perception.contextual_rules import ContextualRuleStore, MeTTaCandidateJournal
from omega_vision.perception.metta_memory import MeTTaMemoryDatabase, memory_tree_lock
from omega_vision.perception.observation_identity import content_hash

router = APIRouter(prefix="/memory/publications", tags=["native-memory-publication"])
_FIELDS = {"workspaceId", "sequenceId", "frameId", "kind", "sourceId", "destinationId", "itemIds", "approval"}


def _http(function):
    @wraps(function)
    def run(*args, **kwargs):
        try:
            return function(*args, **kwargs)
        except HTTPException:
            raise
        except PermissionError as error:
            raise HTTPException(403, str(error)) from error
        except FileNotFoundError as error:
            raise HTTPException(404, str(error)) from error
        except (ContextUnavailable, ValueError, KeyError, OSError) as error:
            raise HTTPException(409, str(error)) from error
    return run


def _store(workspace_id):
    from omega_vision.services.video_import_semantics import _workspace
    # Unlike the writable roots helper, this does not mkdir on a read-only plan.
    return ContextualMemory(storage_path(_workspace(workspace_id)), workspace_id)


def _context(store, sequence_id, frame_id):
    if not isinstance(sequence_id, str) or not isinstance(frame_id, str):
        raise HTTPException(422, "Explicit sequenceId and frameId are required")
    parts = sequence_id.removeprefix("data/").split("/")
    if len(parts) != 3 or parts[0] != "recordings":
        raise HTTPException(422, "Publication requires a canonical game/recording, not a path or browser snapshot")
    for part in parts[1:]:
        _segment(part, "recording")
    _segment(frame_id, "frame")
    context = recording_context(store.root, model.safe_path(store.root, *parts), frame_id)
    context.stm_area()
    return context


def _digest(path):
    return content_hash(path.read_bytes()) if path.is_file() else None


def _implementation():
    from omega_vision.perception import contextual_memory, contextual_rules, metta_memory, candidate_rules
    modules = (model, contextual_memory, contextual_rules, metta_memory, candidate_rules)
    return {"version": model.VERSION, "adapter": content_hash(Path(__file__).read_bytes()),
            "modules": {module.__name__: content_hash(Path(module.__file__).read_bytes()) for module in modules}}


def _descriptor(store, area, kind, context):
    value = store.descriptor(area, kind, context)
    database = MeTTaMemoryDatabase(store.root, area, kind)
    return {"id": value["memoryLocationId"], "providerRef": PROVIDER, "kind": kind,
            "registeredPath": value["registeredPath"], "label": value["label"],
            "scopeKind": value["scopeKind"], "exists": database.path.is_file(),
            "revision": _digest(database.path), "capabilities": value["capabilities"]}


def _rule(context, entry):
    if entry.get("entryType") != "accepted_rule_reference" or entry.get("activation") != (
        "requires_current_candidate_status_promoted_and_causal_cutoff"
    ):
        raise ValueError("Only an existing gated accepted-rule reference can be published")
    model.causal_order(entry.get("promotedAt"), context, before=context.current.order)
    model.causal_order(entry.get("generatedAt"), context, before=context.current.order)
    origin = entry["origin"]
    if origin.get("providerRef") != PROVIDER or origin.get("sequenceId") != context.sequence_id:
        raise PermissionError("Approved rule origin is outside this recording")
    generating = recording_context(context.root, context.directory, origin.get("frameId"))
    store = ContextualRuleStore(context, origin=generating)
    expected = "data/" + store.journal.database.path.relative_to(context.root).as_posix()
    if origin.get("path") != expected:
        raise PermissionError("Approved rule origin does not match its native generating frame")
    candidates = {candidate["candidate_id"]: candidate for candidate in store.published_candidates()}
    candidate = candidates.get(entry["candidateId"])
    if candidate is None or candidate["version"] != entry["candidateVersion"]:
        raise ValueError("Rule is not currently approved and eligible at the selected cutoff")
    source_database = MeTTaMemoryDatabase(context.root, context.stm_area(), "deduction")
    active_reference = "data/" + source_database.path.relative_to(context.root).as_posix() + "#" + entry["entryUid"]
    if candidate["promoted_rule_ref"] != active_reference:
        raise ValueError("This is not the current accepted reference for the candidate at the selected cutoff")
    evaluation = next((item for item in candidate["evaluations"]
                       if item["evaluation_id"] == entry["evaluationId"]), None)
    if evaluation is None:
        raise ValueError("Accepted rule lacks its original approval evaluation")
    checked = _evaluation(candidate, PromotionGates(**evaluation["gates"]), evaluation["manual_approval_by"])
    if not checked["eligible"] or checked["evaluation_id"] != evaluation["evaluation_id"]:
        raise ValueError("Original independent-evidence promotion gates no longer hold")
    latest_context = replace(context, current=context.moments[-1])
    latest = ContextualRuleStore(latest_context, origin=generating).get(entry["candidateId"])
    if (latest["status"] != "promoted" or latest["version"] != candidate["version"]
            or _evaluation(latest, PromotionGates(**evaluation["gates"]),
                           evaluation["manual_approval_by"])["evaluation_id"] != checked["evaluation_id"]):
        raise ValueError("Later source history changed or invalidated this approval; no backdated republication")
    return {"candidateId": candidate["candidate_id"], "candidateVersion": candidate["version"],
            "evaluationId": checked["evaluation_id"], "confidence": checked["metrics"]["minimum_support_confidence"],
            "journalRef": expected, "journalHash": _digest(store.journal.database.path),
            "ruleHash": content_hash(candidate["rule"]), "scopeHash": content_hash(candidate["scope"])}


def _reference_dependencies(store, context, record, seen=None):
    from omega_vision.perception.memory_references import normalize_reference
    seen = set() if seen is None else seen
    if record["recordUid"] in seen:
        return []
    seen.add(record["recordUid"])
    refs = [(value, True) for value in record["payload"].get("shapeReferences", [])]
    refs += [(value, False) for value in record["payload"].get("references", [])]
    dependencies = []
    for value, legacy in refs:
        ref = normalize_reference(value, source_kind=record["memoryKind"], legacy_shape=legacy)
        kind = ref["targetKind"]
        if kind not in {"shape", "object"} or ref["providerRef"] != PROVIDER:
            raise ValueError("Referenced native kind/provider has no verified publication reader")
        areas = [*store.native_areas(context), *(context.frame_area(moment) for moment in context.moments)]
        matches = [area for area in areas if store.descriptor(area, kind, context)["memoryLocationId"] == ref["memoryLocationId"]]
        if len(matches) != 1:
            raise ValueError("Reference is outside the selected native recording context; eligibility is unavailable")
        area = matches[0]
        if ref.get("registeredPath", area.relative_to(store.root).as_posix()) != area.relative_to(store.root).as_posix():
            raise PermissionError("Reference location and registered path disagree")
        records, _ = store.read(area, kind)
        target = next((item for item in records if item["recordUid"] == ref["recordUid"]
                       and item["revision"] == ref["revision"]), None)
        if target is None:
            raise ValueError("A selected record's exact attributed dependency is unavailable")
        order = model.record_order(target, context, before=context.current.order)
        if order > record["causal"]["frameOrder"]:
            raise ValueError("Reference contains evidence from after its record's original causal cutoff")
        if target.get("publication"):
            entry = next(item for item in MeTTaMemoryDatabase(store.root, area, kind).read()
                         if item.get("record", {}).get("recordUid") == target["recordUid"])
            original_cutoff = replace(context, current=context.moments[record["causal"]["frameOrder"]])
            if not model.validate_publication(entry, store.root, area, kind, context=original_cutoff):
                raise ValueError("Referenced publication is not eligible at this cutoff")
        database = MeTTaMemoryDatabase(store.root, area, kind)
        dependencies.append({
            "reference": {key: ref[key] for key in (
                "targetKind", "relation", "providerRef", "memoryLocationId", "recordUid", "revision",
                "registeredPath", "workspaceId",
            ) if key in ref},
            "referenceHash": content_hash(ref), "databaseHash": _digest(database.path),
        })
        dependencies.extend(_reference_dependencies(store, context, target, seen))
    return dependencies


def _source(store, context, kind):
    database = MeTTaMemoryDatabase(store.root, context.stm_area(), kind)
    descriptor = _descriptor(store, context.stm_area(), kind, context)
    entries = database.read()
    if kind in {"shape", "object"} and entries:
        store.read(context.stm_area(), kind)
    items, selected = [], {}
    for entry in entries:
        item = {"id": entry["entryUid"], "kind": kind, "eligible": False}
        try:
            if kind in {"shape", "object"}:
                record = entry["record"]
                model.record_order(record, context, before=context.current.order)
                if record["causal"]["levelId"] != context.current.level_id:
                    raise ValueError("Record belongs to another level")
                proof = _reference_dependencies(store, context, record)
                item.update(recordUid=record["recordUid"], conceptUid=record["conceptUid"],
                            revision=record["revision"], payloadUid=record["payload"]["uid"],
                            causal=record["causal"])
            else:
                proof = _rule(context, entry)
                item.update(candidateId=entry["candidateId"], revision=entry["candidateVersion"],
                            evaluationId=entry["evaluationId"], causal=entry["promotedAt"])
            item.update(eligible=True, reason=None)
            selected[entry["entryUid"]] = (entry, proof)
        except (ValueError, KeyError, ContextUnavailable) as error:
            item["reason"] = str(error)
        items.append(item)
    return descriptor, items, selected


def _request(body, *, commit=False):
    allowed = _FIELDS | ({"confirmed", "confirmationKey"} if commit else set())
    if not isinstance(body, dict) or set(body) != allowed:
        raise HTTPException(422, "Supply only explicit source/destination IDs, typed item IDs, cutoff and approval fields")
    if commit and body["confirmed"] is not True:
        raise HTTPException(409, "Explicit confirmed publication is required")
    if commit and (not isinstance(body["confirmationKey"], str) or not re.fullmatch(r"[0-9a-f]{64}", body["confirmationKey"])):
        raise HTTPException(422, "An exact plan confirmationKey is required")
    if not isinstance(body["kind"], str):
        raise HTTPException(422, "A native memory kind is required")
    if body["kind"] not in model.KINDS:
        raise HTTPException(422, model.UNSUPPORTED.get(body["kind"], "Unknown native publication kind"))
    for key in ("sourceId", "destinationId"):
        if not isinstance(body[key], str) or not body[key] or len(body[key]) > 2048:
            raise HTTPException(422, f"{key} must be an authorized native area ID")
        if body[key] in {"memory-nowhere", "session:nowhere"}:
            raise HTTPException(403, "Nowhere/browser RAM cannot be published or snapshotted")
    ids = body["itemIds"]
    if (not isinstance(ids, list) or not 1 <= len(ids) <= 100
            or any(not isinstance(item, str) or not re.fullmatch(r"[0-9a-f]{64}", item) for item in ids)
            or len(set(ids)) != len(ids)):
        raise HTTPException(422, "Select 1–100 distinct immutable native entry IDs")
    approval = body["approval"]
    if (not isinstance(approval, dict) or set(approval) != {"reviewer", "reason"}
            or any(not isinstance(value, str) or not value.strip() or len(value) > 2000
                   or any(ord(char) < 32 for char in value) for value in approval.values())):
        raise HTTPException(422, "Explicit reviewer and publication reason are required; this does not accept rules")


def _selection(store, context, body):
    kind = body["kind"]
    if not store.mount.readable or not store.mount.writable:
        raise PermissionError("The authorized native memory provider does not permit publication")
    source = _descriptor(store, context.stm_area(), kind, context)
    if source["id"] != body["sourceId"]:
        raise PermissionError("Source ID is not this recording's authorized level STM")
    destinations = {store.descriptor(area, kind, context)["memoryLocationId"]: area
                    for area in (context.ltm_area(), context.game_area())}
    area = destinations.get(body["destinationId"])
    if area is None:
        raise PermissionError("Destination ID is not this game's compatible native LTM area")
    for directory in (
        store.root / "runtime" / "contextual-rule-locks",
        store.root / "runtime" / "memory-tree-locks",
        area,
    ):
        for path in (directory, directory / ".writer.lock"):
            model.safe_path(store.root, *path.relative_to(store.root).parts)
    return area


def _destination(store, context, area, kind):
    database = MeTTaMemoryDatabase(store.root, area, kind)
    entries = database.read()
    if kind in {"shape", "object"} and entries:
        store.read(area, kind)
    elif kind == "deduction":
        for entry in entries:
            if entry.get("entryType") != "accepted_rule_reference":
                raise ValueError("Destination contains an unsupported native rule schema")
            if "publication" in entry:
                model.validate_publication(entry, store.root, area, kind)
    return entries


def _plan(store, context, body):
    area = _selection(store, context, body)
    kind = body["kind"]
    source, items, selected = _source(store, context, kind)
    ids = sorted(body["itemIds"])
    unavailable = [item for item in ids if item not in selected]
    if unavailable:
        reasons = {item["id"]: item.get("reason") for item in items if item["id"] in unavailable}
        raise HTTPException(409, {"message": "Selected native items are unavailable/ineligible", "itemIds": unavailable, "reasons": reasons})
    destination = _descriptor(store, area, kind, context)
    existing = _destination(store, context, area, kind)
    target = store.descriptor(area, kind, context)
    documents, changes, planned_identities = [], [], {}
    for uid in ids:
        entry, proof = selected[uid]
        if kind in {"shape", "object"}:
            record = model.destination_record(entry["record"], target)
            same = next((item for item in existing if item["record"]["recordUid"] == record["recordUid"]), None)
            if same is not None and same["record"] != record:
                raise HTTPException(409, "Conflicting same-ID target record; no merge or overwrite")
            document = {"entryType": "memory_version", "record": record}
            identity = {"sourceRecordUid": entry["record"]["recordUid"], "destinationRecordUid": record["recordUid"],
                        "conceptUid": record["conceptUid"], "recordRevision": record["revision"]}
            target_identity = record["recordUid"]
            previous_revisions = sorted({item["record"]["revision"] for item in existing
                                         if item["record"]["conceptUid"] == record["conceptUid"]
                                         and item["record"]["revision"] != record["revision"]})
        else:
            same = next((item for item in existing if item["candidateId"] == entry["candidateId"]), None)
            base = {key: value for key, value in entry.items() if key not in {"entryUid", "schemaVersion", "databaseRole", "publication"}}
            if same is not None and {key: value for key, value in same.items()
                                    if key not in {"entryUid", "schemaVersion", "databaseRole", "publication"}} != base:
                raise HTTPException(409, "Conflicting same-ID target rule; explicit resolution is required")
            document, identity, previous_revisions = base, {"candidateId": entry["candidateId"],
                                                          "candidateVersion": entry["candidateVersion"],
                                                          "evaluationId": entry["evaluationId"]}, []
            target_identity = entry["candidateId"]
        if target_identity in planned_identities:
            raise HTTPException(409, "Multiple selected source entries map to one target identity; choose one explicitly")
        planned_identities[target_identity] = uid
        changes.append({"sourceEntryUid": uid, **identity, "action": "already_present" if same else "append",
                        "existingEntryUid": same["entryUid"] if same else None,
                        "existingConceptRevisions": previous_revisions, "proof": proof})
        documents.append(document)
    context_hash = content_hash({
        "manifest": _digest(model.safe_path(store.root, *context.directory.relative_to(store.root).parts, "recording.json")),
        "initialState": _digest(model.safe_path(store.root, *context.directory.relative_to(store.root).parts, "state.json")),
    })
    binding = {"version": model.VERSION, "source": source, "destination": destination, "kind": kind,
               "sequenceId": context.sequence_id, "cutoff": context.causal, "contextHash": context_hash,
               "itemIds": ids, "items": changes, "approval": body["approval"], "implementation": _implementation()}
    if (_descriptor(store, context.stm_area(), kind, context)["revision"] != source["revision"]
            or _descriptor(store, area, kind, context)["revision"] != destination["revision"]):
        raise HTTPException(409, "Native source or destination changed during read-only planning")
    return {
        "schemaVersion": 1, "status": "planned", "confirmationKey": content_hash(binding),
        "source": source, "destination": destination, "cutoff": context.causal, "items": changes,
        "requiresConfirmation": True, "readOnly": True, "sourcePreserved": True,
        "activation": "none", "ruleAcceptance": "unchanged", "independentEvidenceAdded": False,
        "identityPolicy": "concept/payload/candidate identities and revisions retained; physical record addresses are destination-specific",
        "reusePolicy": "No implicit LTM reads. Publication is eligible only after its source-frame cutoff; cross-recording order is unavailable.",
        "_binding": binding, "_documents": documents, "_area": area,
    }


def _public(plan):
    return {key: value for key, value in plan.items() if not key.startswith("_")}


def _already_committed(store, context, body, area):
    entries = _destination(store, context, area, body["kind"])
    matching = [entry for entry in entries if entry.get("publication", {}).get("confirmationKey") == body["confirmationKey"]]
    if not matching:
        return None
    publication = matching[0]["publication"]
    binding = publication["planBinding"]
    if (binding["source"]["id"] != body["sourceId"] or binding["destination"]["id"] != body["destinationId"]
            or binding["cutoff"] != context.causal or binding["itemIds"] != sorted(body["itemIds"])
            or binding["approval"] != body["approval"] or binding["kind"] != body["kind"]):
        raise HTTPException(409, "Confirmation key belongs to a different publication selection")
    source, _, eligible = _source(store, context, body["kind"])
    if source["revision"] != binding["source"]["revision"]:
        raise HTTPException(409, "Source changed after this publication; inspect it instead of replaying a stale commit")
    for change in binding["items"]:
        current = eligible.get(change["sourceEntryUid"])
        if current is None or current[1] != change["proof"]:
            raise HTTPException(409, "Original publication evidence or rule approval is no longer eligible")
    by_source = {entry["publication"]["sourceEntryUid"]: entry for entry in matching}
    result = []
    for change in binding["items"]:
        if change["action"] == "already_present":
            found = next((entry for entry in entries if entry["entryUid"] == change["existingEntryUid"]), None)
        else:
            found = by_source.get(change["sourceEntryUid"])
        if found is None:
            raise HTTPException(409, "Previously committed publication is incomplete or conflicting")
        result.append({"sourceEntryUid": change["sourceEntryUid"], "destinationEntryUid": found["entryUid"]})
    return {"schemaVersion": 1, "status": "already_published", "confirmationKey": body["confirmationKey"],
            "items": result, "sourcePreserved": True, "activation": "none", "ruleAcceptance": "unchanged",
            "independentEvidenceAdded": False}


@router.get("/options")
@_http
def publication_options(workspaceId: str, sequenceId: str, frameId: str, response: Response):
    response.headers["Cache-Control"] = "no-store"
    store = _store(workspaceId)
    context = _context(store, sequenceId, frameId)
    sources, destinations = [], []
    for kind in model.KINDS:
        source, items, _ = _source(store, context, kind)
        sources.append({**source, "items": items, "eligibleCount": sum(item["eligible"] for item in items)})
        destinations.extend(_descriptor(store, area, kind, context) for area in (context.ltm_area(), context.game_area()))
    return {"schemaVersion": 1, "context": context.causal, "sources": sources, "destinations": destinations,
            "unsupportedKinds": model.UNSUPPORTED, "readOnly": True, "automaticPublication": False}


@router.post("/plan")
@_http
def publication_plan(response: Response, body: dict[str, Any] = Body(...)):
    response.headers["Cache-Control"] = "no-store"
    _request(body)
    store = _store(body["workspaceId"])
    context = _context(store, body["sequenceId"], body["frameId"])
    return _public(_plan(store, context, body))


@router.post("/commit")
@_http
def publication_commit(response: Response, body: dict[str, Any] = Body(...)):
    response.headers["Cache-Control"] = "no-store"
    _request(body, commit=True)
    store = _store(body["workspaceId"])
    context = _context(store, body["sequenceId"], body["frameId"])
    area = _selection(store, context, body)
    previous = _already_committed(store, context, body, area)
    if previous:
        return previous
    try:
        plan = _plan(store, context, body)
    except HTTPException as error:
        if error.status_code == 409:
            previous = _already_committed(store, context, body, area)
            if previous:
                return previous
        raise
    if plan["confirmationKey"] != body["confirmationKey"]:
        previous = _already_committed(store, context, body, area)
        if previous:
            return previous
        raise HTTPException(409, "Publication source, destination, evidence or implementation changed; review a fresh plan")
    database = MeTTaMemoryDatabase(store.root, area, body["kind"])
    with MeTTaCandidateJournal(context, context).publication(), memory_tree_lock(store.root), database.transaction():
        previous = _already_committed(store, context, body, area)
        if previous:
            return previous
        locked = _plan(store, context, body)
        if locked["confirmationKey"] != body["confirmationKey"]:
            raise HTTPException(409, "Publication changed while waiting for its native writer locks")
        created_at = datetime.now(timezone.utc).isoformat()
        documents = []
        for document, item in zip(locked["_documents"], locked["items"], strict=True):
            if item["action"] == "already_present":
                continue
            publication = {
                "version": model.VERSION, "kind": body["kind"], "confirmationKey": locked["confirmationKey"],
                "planBinding": locked["_binding"], "itemIds": sorted(body["itemIds"]),
                "sourceEntryUid": item["sourceEntryUid"],
                "source": {**locked["source"], "memoryLocationId": locked["source"]["id"],
                           "sequenceId": context.sequence_id},
                "destinationId": body["destinationId"], "cutoff": context.causal,
                "publishedAtUtc": created_at, "sourcePreserved": True, "activation": "none",
                "independentEvidenceAdded": False,
                **{key: item[key] for key in ("sourceRecordUid", "destinationRecordUid", "conceptUid", "recordRevision")
                   if key in item},
            }
            documents.append({**deepcopy(document), "publication": publication})
        if not documents:
            return {"schemaVersion": 1, "status": "already_present", "confirmationKey": locked["confirmationKey"],
                    "items": locked["items"], "sourcePreserved": True, "activation": "none", "ruleAcceptance": "unchanged",
                    "independentEvidenceAdded": False}
        for document in documents:
            model.validate_publication(document, store.root, area, body["kind"])
        database.append_batch(documents, _locked=True)
        result = _already_committed(store, context, body, area)
        if result is None:
            raise RuntimeError("Native publication did not reload through its typed reader")
        return {**result, "status": "published"}
