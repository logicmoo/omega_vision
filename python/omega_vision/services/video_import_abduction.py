"""Opt-in grounded event abduction adapter; no engine, model, or replay calls.

Integration: register_transforms(registry, metadata); include_router(router);
delegate the event_abduction_0/deterministic runtime version to runtime_revision.
Only canonical recording contexts are currently supported, not curated contexts
without the recording/level rule registry. Nowhere is explicitly unsupported:
reject before publication, including when only Look In selects browser memory.
"""
from __future__ import annotations

from functools import wraps
from pathlib import Path
from typing import Any, Mapping

from fastapi import APIRouter, Response

from omega_vision.inherited_source_overlay import storage_path
from omega_vision.perception._event_journal import (
    ConflictError, IntegrityError, ValidationError, content_id,
)
from omega_vision.perception import event_abduction
from omega_vision.perception.contextual_rules import ContextualRuleStore
from omega_vision.perception.event_records import PREDICATES, identifiers
from omega_vision.perception.metta_memory import MeTTaMemoryDatabase
from omega_vision.perception.observation_identity import content_hash

STEP = "event_abduction_0/deterministic"
router = APIRouter(prefix="/semantic", tags=["video-import-abduction"])


def _semantics():
    from omega_vision.services import video_import_semantics
    return video_import_semantics


def _http(function):
    @wraps(function)
    def guarded(*args, **kwargs):
        return _semantics()._http(function)(*args, **kwargs)
    return guarded


def _exact_path(root: Path, path: Path) -> Path:
    if storage_path(root, *path.relative_to(root).parts) != path:
        raise PermissionError("Abduction input or output was redirected")
    return path


def _preference_revision(unit):
    from omega_vision.perception.memory_locations import NOWHERE
    semantics = _semantics()
    locations, context = semantics._memory(unit["workspaceId"], unit["sequenceId"], frame_id=unit["id"])
    # Default discovery may populate a disk catalog. Do not perform it merely
    # to discover that Nowhere was selected, nor substitute a historical choice.
    _, path = locations._preference_path(context)
    if not path.is_file():
        return {"status": "missing_explicit_preferences"}
    preferences = semantics._json(path)
    locations._validate_preferences(preferences)
    if preferences.get("revision") != content_hash({key: value for key, value in preferences.items() if key != "revision"}):
        raise IntegrityError("Memory preference revision mismatch")
    if any(preferences[kind]["saveTo"] == NOWHERE or NOWHERE in preferences[kind]["lookIn"]
           for kind in ("shape", "object")):
        return {"status": "nowhere_unsupported", "preferences": preferences}
    return {"status": "persistent", "preferences": preferences}


def _persistent_preferences(unit):
    state = _preference_revision(unit)
    if state["status"] == "missing_explicit_preferences":
        raise ValidationError("Save explicit persistent Shape/Object memory preferences before event abduction")
    if state["status"] == "nowhere_unsupported":
        raise ValidationError(
            "Event abduction does not yet support browser-only Nowhere Save To/Look In; no hypotheses were saved")
    return state["preferences"]


def _registry(store):
    if not isinstance(store, ContextualRuleStore):
        raise PermissionError("Abduction requires the scoped recording rule registry, not legacy global rules")
    references = {
        entry["entryUid"]: entry
        for entry in MeTTaMemoryDatabase(store.context.root, store.context.stm_area(), "deduction").read()
    }
    candidates = []
    for candidate in store.published_candidates():
        if candidate["kind"] not in event_abduction.KINDS:
            continue
        reference = references[candidate["promoted_rule_ref"].rsplit("#", 1)[1]]
        candidates.append({**candidate, "published_order": reference["promotedAt"]["frameOrder"]})
    revision = _semantics()._registry_revision(store, kinds=event_abduction.KINDS)
    publication = [
        {key: candidate[key] for key in ("candidate_id", "version", "published_order", "promoted_rule_ref")}
        for candidate in sorted(candidates, key=lambda item: item["candidate_id"])
    ]
    return candidates, {"registry": revision, "publications": publication}


def _stage(unit, step):
    semantics = _semantics()
    path = semantics._artifact(unit, step)
    _exact_path(semantics._api()._vision_data_root(Path(unit["workspaceRoot"])), path)
    if path.is_file() and semantics._json(path).get("storage") == "browser_session":
        raise ValidationError("Browser-only evidence cannot be copied into persistent abduction memory")
    return semantics._result(unit, step)


def _journal_snapshot(root, unit):
    semantics = _semantics()
    log = semantics._event_log(root, unit["sequenceId"])
    home = semantics._api()._vision_data_root(root)
    _exact_path(home, log.path)
    for path in log.path.glob("*.json"):
        _exact_path(home, path)
    # Journal.read() acquires a writer lock; _read verifies the immutable chain
    # without modifying it. Publication below separately locks this same journal.
    records = log.journal._read()
    if not records:
        raise ValidationError("Run the canonical event log before event abduction")
    snapshot = records[-1]["payload"]
    receipt = _stage(unit, semantics.LOG)
    receipt = {key: value for key, value in receipt.items() if key != "executionScope"}
    if not any(record["payload"] == receipt for record in records):
        raise ConflictError("Canonical log dependency is stale; run event_log_0 before abduction")
    # Earlier LOG artifacts are immutable prefix receipts, not necessarily the
    # newest generation after later frames have been processed.
    count = unit["frameOrder"] + 1
    before, current = receipt.get("inputs", {}), snapshot.get("inputs", {})
    if (len(before.get("frames", [])) < count or len(current.get("frames", [])) < count
            or before["frames"][:count] != current["frames"][:count]
            or before.get("assessments", [])[:count - 1] != current.get("assessments", [])[:count - 1]):
        raise ConflictError("Canonical log prefix changed; run event_log_0 before abduction")
    frame_ids = {frame["id"] for frame in current["frames"][:count]}
    last = current["frames"][count - 1]["id"]
    def causal_actions(inputs):
        return [action for action in inputs.get("actions", []) if action["frame_id"] in frame_ids
                and not (action["frame_id"] == last and action["direction"] == "outgoing")]
    if causal_actions(before) != causal_actions(current):
        raise ConflictError("Canonical log action prefix changed; run event_log_0 before abduction")
    if (snapshot.get("sequence_id") != unit["sequenceId"] or snapshot.get("channel") != "canonical"
            or snapshot.get("authoritative") is not True):
        raise IntegrityError("Abduction requires the canonical observed event channel")
    from omega_vision.perception.visual_event_log import _verify_entries
    _verify_entries(snapshot["entries"])
    return log, snapshot


def _verify_observation(unit, frame):
    """Verify existing pixels/artifacts without materializing preprocessing."""
    semantics, api = _semantics(), _semantics()._api()
    home = api._vision_data_root(Path(unit["workspaceRoot"]))
    source = _exact_path(home, Path(unit.get("sourceImage") or unit["image"]))
    chain = api._load_preprocessing_chain_at(Path(unit["sequenceRoot"]))
    image = source
    if not api._pp_is_effectively_original(chain):
        catalog = api._filter_catalog_index(Path(unit["workspaceRoot"]))
        chain = api._validated_preprocessing_chain(chain, catalog)
        signature = api._pp_chain_signature(
            api._preprocessing_source_signature(source), chain,
            registry_versions=api._preprocessing_versions(Path(unit["workspaceRoot"]), chain, catalog),
        )
        image = _exact_path(home, Path(unit["dir"]) / "preprocessing" / f"{signature.replace(':', '_')}.png")
    for step in (semantics.IDENTITY, semantics.PARTS, semantics.GROUPS, semantics.ACCEPTANCE):
        directory = _exact_path(home, semantics._artifact(unit, step).parent)
        if api._read_claim(directory / "claim.json") is not None:
            raise ConflictError("Observation dependency is being rewritten; retry abduction")
        if (directory / ".transform-failed.json").exists():
            raise ValidationError("Observation dependency has a failed latest attempt; replay it")
    bundle = semantics._json(_exact_path(home, semantics._artifact(unit, semantics.IDENTITY, "observations.json")))
    expected = bundle["frame"]
    if (expected["uid"], expected["sequenceId"], expected["frameOrder"], expected["sourceKey"]) != (
        frame["id"], unit["sequenceId"], unit["frameOrder"], unit["frameSourceKey"],
    ):
        raise IntegrityError("Observation bundle does not identify the selected canonical frame")
    paths = {
        "image": image, "partsFacts": semantics._artifact(unit, semantics.PARTS, "result.pl"),
        "groupingFacts": semantics._artifact(unit, semantics.GROUPS, "result.pl"),
        "acceptanceFacts": semantics._artifact(unit, semantics.ACCEPTANCE, "result.pl"),
        "geometry": semantics._artifact(unit, semantics.PARTS, "geometry.json"),
        "acceptanceMetadata": semantics._artifact(unit, semantics.ACCEPTANCE, "meta.json"),
        "extractionMetadata": semantics._artifact(unit, semantics.PARTS, "meta.json"),
    }
    for role, path in paths.items():
        digest = content_hash(_exact_path(home, path).read_bytes())
        if role not in bundle["artifactHashes"] or bundle["artifactHashes"][role] != digest:
            raise ConflictError(f"Observation {role} changed; replay observation dependencies")
    if expected["imageHash"] != content_hash(image.read_bytes()):
        raise IntegrityError("Observation pixels do not match the bundle")
    _exact_path(home, api._image_provenance_path(image))
    lineage = api._read_image_provenance(image)
    if image != source and not lineage:
        raise ValidationError("Cached preprocessing is missing coordinate lineage")
    hashes = dict(bundle["artifactHashes"])
    hashes.update(
        geometry=content_hash(semantics._json(paths["geometry"])), lineage=content_hash(lineage or {}),
        temporalPartsFacts=content_hash(paths["partsFacts"].read_text(encoding="utf-8")),
    )
    if (frame["input_hash"] != content_id("frame-input", hashes)
            or frame["provenance"].get("artifact_hashes") != hashes
            or frame["evidence"] != [bundle["bundleUid"]]):
        raise IntegrityError("Canonical frame evidence no longer matches its observation artifacts")


def _inputs(root, units, index, store, *, budgets):
    from omega_vision.perception.visual_event_log import _build, _frame, normalize_actions
    semantics = _semantics()
    if index + 1 > budgets.max_frames:
        raise ValidationError("Frame input exceeds max_frames budget")
    unit = units[index]
    log, snapshot = _journal_snapshot(root, unit)
    raw_frames = snapshot["inputs"]["frames"][:index + 1]
    if len(raw_frames) != index + 1:
        raise ConflictError("Canonical event log does not yet cover the requested frame")
    frames = [_frame(frame, order) for order, frame in enumerate(raw_frames)]
    detectors, source_receipts = {}, []
    for order, current in enumerate(units[:index + 1]):
        if current["id"] != store.context.moments[order].frame_id:
            raise ValidationError("Semantic units disagree with the recording's explicit order")
        for step in (semantics.OBJECTS, semantics.GROUPING):
            path = _exact_path(store.context.root, semantics._artifact(current, step))
            if path.is_file() and semantics._json(path).get("storage") == "browser_session":
                raise ValidationError("Browser-only evidence cannot be copied into persistent abduction memory")
        result = _stage(current, semantics.EVENTS)
        if result.get("frame") != frames[order]:
            raise ConflictError("Observed frame differs from the canonical log; replay dependencies")
        _verify_observation(current, frames[order])
        local = semantics._store(root, current)
        if result.get("registryRevision") != semantics._registry_revision(local, kinds=semantics.EVENT_RULE_KINDS):
            raise ConflictError("Observed event stage has stale rule provenance; replay dependencies")
        if order:
            actual = result.get("assessment")
            expected = snapshot["inputs"]["assessments"][order - 1]
            without_registry = lambda row: {
                **row, "provenance": {key: value for key, value in row["provenance"].items()
                                     if key != "candidate_registry"}}
            if not isinstance(actual, dict) or without_registry(actual) != without_registry(expected):
                raise ConflictError("Observed effects differ from the canonical log")
        for detector, version in result["accepted_detectors"].items():
            if detector in detectors and detectors[detector] != version:
                raise ConflictError("Observed prefix mixes detector versions; replay dependencies")
            detectors[detector] = version
        source_receipts.append(content_hash(result))
    prefix_ids = {frame["id"] for frame in frames}
    actions = [action for action in snapshot["inputs"]["actions"] if action["frame_id"] in prefix_ids
               and not (action["frame_id"] == frames[-1]["id"] and action["direction"] == "outgoing")]
    actors = identifiers(term["args"][0] for action in actions for term in action["normalized"])
    aligned = normalize_actions(actions, frames=frames, sequence_id=unit["sequenceId"], actor_ids=actors)
    recorded_actions, recorded_actors = semantics._recorded_actions(units[:index + 1], frames)
    recorded_actions = [action for action in recorded_actions if not (
        action["frame_id"] == frames[-1]["id"] and action["direction"] == "outgoing")]
    if normalize_actions(recorded_actions, frames=frames, sequence_id=unit["sequenceId"],
                         actor_ids=recorded_actors) != aligned:
        raise ConflictError("Recorded input evidence differs from the canonical log; replay dependencies")
    entries = _build(unit["sequenceId"], frames, snapshot["inputs"]["assessments"][:index], aligned, detectors)
    snapshot_events = {entry["event_id"]: entry for entry in snapshot["entries"] if entry["kind"] == "frame_event"}
    if any(snapshot_events.get(entry["event_id"]) != entry for entry in entries if entry["kind"] == "frame_event"):
        raise IntegrityError("Canonical observed event identities do not match their normalized source inputs")

    known, cumulative, evidence, observed = [], set(), [], []
    orders = {frame["id"]: frame["index"] for frame in frames}

    def fact(term, order, uid, provenance):
        evidence.append({"evidence_id": uid, "term": term, "frame_order": order, "polarity": True,
                         "channel": "observed", "authoritative": True, "provenance": provenance})

    for order, frame in enumerate(frames):
        cumulative.update(frame["entity_ids"])
        for action in aligned:
            if not action["boundary"] and action["to_frame"] == frame["id"]:
                cumulative.update(term["args"][0] for term in action["normalized"])
                for term in action["normalized"]:
                    fact(term, order, content_id("action-term", [action["action_id"], term]),
                         {"action_id": action["action_id"], **action["provenance"]})
        known.append(sorted(cumulative))
        for term in frame["states"]:
            if PREDICATES[term["predicate"]].category == "grouping":
                continue
            fact(term, order, content_id("observed-state", [frame["id"], frame["input_hash"], term]),
                 {"frame_id": frame["id"], "input_hash": frame["input_hash"], "evidence": frame["evidence"]})
    for entry in entries:
        if entry["kind"] != "frame_event":
            continue
        order = orders[entry["source_pair"]["to_frame"]]
        fact(entry["term"], order, entry["event_id"],
             {"event_id": entry["event_id"], "evidence": entry["evidence"], **entry["provenance"]})
        if order == index:
            observed.append({
                "event_id": entry["event_id"], "term": entry["term"], "frame_order": order,
                "evidence": entry["evidence"], "provenance": entry["provenance"],
                "channel": "observed", "authoritative": True,
            })
    inputs = {"observed_events": observed, "evidence": evidence, "frame_ids": [frame["id"] for frame in frames],
              "entity_ids_by_order": known, "cutoff_order": index,
              "scope_context": {"domain": "visual-sequence", "provider_id": unit["providerId"],
                                "sequence_id": unit["sequenceId"]}}
    return log, inputs, {
        "canonical_generation": snapshot["generation"],
        "prefix_hash": content_hash({"frames": frames, "entries": entries}),
        "producer_hashes": source_receipts,
    }


def run_abduction(unit: dict[str, Any], out_dir: Path, options: dict[str, Any]) -> dict[str, Any]:
    if not isinstance(options, dict) or set(options) - {"budgets", "semanticContextRevision"}:
        raise ValidationError("Event abduction options support only explicit budgets, never paths or rule payloads")
    raw_budgets = options.get("budgets", {})
    if not isinstance(raw_budgets, dict):
        raise ValidationError("budgets must be an object")
    budgets = event_abduction.AbductionBudgets(**raw_budgets)
    semantics = _semantics()
    preferences = _persistent_preferences(unit)
    if "semanticContextRevision" in options and options["semanticContextRevision"] != runtime_revision(unit):
        raise ConflictError("Abduction dispatcher revision changed; replan before running")
    root, units, index = semantics._context(unit)
    store = semantics._store(root, unit)
    context = store.context
    expected = context.current.directory.joinpath(*STEP.split("/"))
    if Path(out_dir) != expected or Path(unit["dir"]) != context.current.directory:
        raise PermissionError("Abduction output must be the current registered frame's transform directory")
    _exact_path(context.root, expected)
    for name in ("result.json", "result.pl", "summary.json"):
        _exact_path(context.root, expected / name)
    candidates, revision = _registry(store)
    log, inputs, source_revision = _inputs(root, units, index, store, budgets=budgets)
    result = event_abduction.abduce_events(**inputs, candidates=candidates, budgets=budgets)
    result.update(causal=context.causal, registryRevision=revision, inputRevision=source_revision)
    database = MeTTaMemoryDatabase(context.root, context.frame_area(), "hypothesis")
    with semantics._registry_publication(store, revision["registry"]):
        _exact_path(context.root, log.path / ".writer.lock")
        with log.journal.transaction():
            if _registry(store)[1] != revision or _persistent_preferences(unit) != preferences:
                raise ConflictError("Abduction rule publication or memory preferences changed; retry")
            _, fresh_inputs, fresh_revision = _inputs(root, units, index, store, budgets=budgets)
            if fresh_revision != source_revision or fresh_inputs != inputs:
                raise ConflictError("Abduction observed evidence changed; retry")
            if semantics._inspection_context(root, unit["sequenceId"], unit["id"]) != context:
                raise ConflictError("Recording context changed before hypothesis publication")
            entry = database.append({
                "entryType": "event_abduction", "authoritative": False, "causal": context.causal,
                "result": result, "resultHash": content_hash(result),
            })
            for name in ("result.json", "result.pl", "summary.json"):
                _exact_path(context.root, expected / name)
            return semantics._emit(
                unit, out_dir, result, schema="grounded_event_abduction",
                summary={"authority": "non_authoritative_hypotheses", "hypothesisCount": len(result["hypotheses"]),
                         "hypothesisEntryUid": entry["entryUid"],
                         "memoryPath": "data/" + database.path.relative_to(context.root).as_posix(),
                         "outcome": result["outcome"]},
            )


def register_transforms(registry: dict, metadata: dict) -> None:
    semantics = _semantics()
    key = tuple(STEP.split("/"))
    registry[key] = run_abduction
    metadata[key] = {
        "dependsOn": [semantics.LOG, semantics.EVENTS], "firstFrameDependsOn": [semantics.LOG, semantics.EVENTS],
        "skipFirstFrame": False, "orderedOnly": True, "type": "py_pl", "priority": 85, "options": {},
        "label": "Abduce event explanations",
        "description": "Explain observed effects using earlier accepted rules; save grounded hypotheses, not facts. Requires explicit persistent memory preferences.",
    }


def runtime_revision(unit: Mapping[str, Any]) -> str:
    """Pure staleness input; does not replay events, populate caches or write locks."""
    semantics = _semantics()
    preferences = _preference_revision(unit)
    root = semantics._workspace(unit["workspaceId"])
    store = semantics._store(root, unit)
    return content_hash({
        "version": event_abduction.VERSION, "stage": STEP, "causal": store.context.causal,
        "sources": [content_hash(Path(module.__file__).read_bytes()) for module in (event_abduction,)],
        "adapter": content_hash(Path(__file__).read_bytes()), "registry": _registry(store)[1],
        "memoryPreferences": {"status": preferences["status"],
                              "revision": preferences.get("preferences", {}).get("revision")},
    })


@router.get("/abductions")
@_http
def read_abductions(workspaceId: str, sequenceId: str, frameId: str, response: Response):
    """Read historical hypotheses without enumerating sequences or creating locks."""
    semantics = _semantics()
    root = semantics._workspace(workspaceId)
    context = semantics._inspection_context(root, sequenceId, frameId)
    database = MeTTaMemoryDatabase(context.root, context.frame_area(), "hypothesis")
    entries = database.read()
    for entry in entries:
        result = entry.get("result", {})
        if (entry.get("entryType") != "event_abduction" or entry.get("authoritative") is not False
                or entry.get("causal") != context.causal or entry.get("resultHash") != content_hash(result)
                or result.get("schema_version") != event_abduction.VERSION
                or result.get("channel") != "abduced_events" or result.get("authoritative") is not False):
            raise IntegrityError("Stored abduction document is not a valid non-authoritative hypothesis snapshot")
        for hypothesis in result["hypotheses"]:
            identity = {key: value for key, value in hypothesis.items() if key != "hypothesis_id"}
            if (hypothesis.get("authoritative") is not False
                    or hypothesis.get("hypothesis_id") != content_id("abduced-event", identity)):
                raise IntegrityError("Stored hypothesis identity or authority mismatch")
    response.headers["Cache-Control"] = "no-store"
    return {"schema_version": event_abduction.VERSION, "authoritative": False, "causal": context.causal,
            "validity": "historical_snapshots_not_revalidated_against_current_rules",
            "entries": entries}
