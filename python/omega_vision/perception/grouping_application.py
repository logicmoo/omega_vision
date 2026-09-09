"""Apply promoted grouping templates to selected, versioned Shape Memory.

This is recognition/application, not promotion grading or final-G acceptance.
The forwarding observer records effective saved-prototype bindings in its actual
observation/checkpoint state. Applied predictions are explicitly dependent
evidence, never new independent support for the rule that produced them.
"""
from __future__ import annotations

from dataclasses import asdict
import json
from pathlib import Path
from typing import Any, Mapping

from ._event_journal import writer_lock
from .candidate_rules import CandidateRuleStore, effective_promoted_semantics
from .event_induction import engine_version, evaluate_rule
from .grouping_learning import (
    VERSION as OBSERVER_VERSION, GroupingEvidence, grouping_candidate_evaluations,
    match_prototypes, observe_grouping, shape_anchor,
)
from .observation_identity import content_hash
from .temporal_correspondence import GroupObservation, TemporalFrame, canonical_json, stable_id


VERSION = "grouping-application-v1"


def _copy(value):
    return json.loads(canonical_json(value))


def _implementation_hash() -> str:
    return content_hash(Path(__file__).read_bytes())


def _context(frame: TemporalFrame, supplied: Mapping[str, Any]) -> dict[str, Any]:
    if not isinstance(supplied, Mapping):
        raise ValueError("grouping application requires an explicit scope context")
    result = dict(supplied)
    for key, value in (("providerId", frame.provider_id), ("provider_id", frame.provider_id),
                       ("sequenceId", frame.sequence_id), ("sequence_id", frame.sequence_id)):
        if key in result and result[key] != value:
            raise ValueError("grouping scope context contradicts the actual frame")
        result[key] = value
    return result


def _scope_matches(scope, context) -> bool:
    for key, value in scope.items():
        if key == "sequence_ids":
            if not isinstance(value, list) or context["sequence_id"] not in value:
                return False
        elif context.get(key) != value:
            return False
    return True


def _registry(store: CandidateRuleStore):
    rules = store.list(kind="grouping", status="promoted")
    return rules, content_hash(effective_promoted_semantics(rules))


def _reference(record):
    source = record.get("source", {})
    reference = {key: source.get(key) for key in ("providerRef", "workspaceId", "memoryLocationId")}
    reference.update(recordUid=record.get("recordUid"), revision=record.get("revision"))
    if not all(isinstance(value, str) and value for value in reference.values()):
        raise ValueError("selected prototype needs an attributed provider/workspace/location/record/revision")
    return reference


def _prototype(record, frame):
    payload = record["payload"]
    if not isinstance(payload.get("revisions"), list) or not payload.get("anchorUid"):
        return None
    if record["revision"] != content_hash(payload):
        raise ValueError("selected prototype revision does not match its payload")
    expected = stable_id("observed-prototype", [
        OBSERVER_VERSION, payload["providerId"], payload["sequenceId"], payload["seedObservationUid"],
    ])
    if payload.get("uid") != expected:
        raise ValueError("selected memory is not a native observed prototype")
    revisions = payload["revisions"]
    if not revisions:
        return None
    # A copy produced solely by this recognizer must not compete with its own
    # saved source or make its output invalidate the next lookup.
    if payload.get("memoryBindingHistory") and not any(
        row.get("eligibleIndependentEvidence") for row in payload.get("evidence", [])
    ):
        return None
    previous = None
    for index, revision in enumerate(revisions, 1):
        body = {key: value for key, value in revision.items() if key != "uid"}
        if revision.get("uid") != stable_id("prototype-revision", body):
            raise ValueError("selected observed prototype has an altered revision")
        if (revision["prototypeUid"] != payload["uid"] or type(revision["revision"]) is not int
                or revision["revision"] != index
                or revision["previousRevisionUid"] != (previous["uid"] if previous else None)):
            raise ValueError("selected prototype has an inconsistent revision chain")
        if type(revision["frameOrder"]) is not int or revision["frameOrder"] < 0:
            raise ValueError("selected prototype needs an explicit ordered observation")
        if previous and (revision["frameOrder"] < previous["frameOrder"] or (
                revision["frameOrder"] == previous["frameOrder"] and revision["frameUid"] != previous["frameUid"])):
            raise ValueError("selected prototype revision chronology is inconsistent")
        points = revision["points"]
        if not isinstance(points, list) or not points or any(
            not isinstance(point, list) or len(point) != 2 or any(type(value) is not int for value in point)
            for point in points
        ):
            raise ValueError("selected prototype needs actual integer pixel points")
        previous = revision
        if revision["frameUid"] == frame.uid:
            return None
        if (payload["providerId"], payload["sequenceId"]) == (frame.provider_id, frame.sequence_id):
            if revision["frameOrder"] >= frame.order:
                return None
    seed = next((row for row in revisions if row["observationUid"] == payload["seedObservationUid"]
                 and row["previousRevisionUid"] is None), None)
    if seed is None:
        raise ValueError("selected prototype is missing its immutable seed observation")
    observation = GroupObservation(
        uid=seed["observationUid"], alias="", member_uids=tuple(seed["memberObservationUids"]),
        member_aliases=(), points=tuple(tuple(point) for point in seed["points"]),
        colors=tuple(seed["colors"]), symbols=tuple(seed["symbols"]), mask_source=seed["maskSource"],
    )
    anchor = shape_anchor(observation, provider_id=payload["providerId"])
    if anchor["uid"] != payload["anchorUid"]:
        raise ValueError("selected prototype does not match its immutable shape anchor")
    return {
        "uid": payload["uid"], "anchorUid": anchor["uid"], "anchor": anchor,
        "revisions": _copy(revisions), "source": _reference(record),
    }


def _selected_prototypes(selected_memory, frame):
    if not isinstance(selected_memory, Mapping) or not isinstance(selected_memory.get("records"), list):
        raise ValueError("selected_memory must be an actual memory lookup result")
    if selected_memory.get("errors"):
        raise ValueError("selected Shape Memory is incomplete or unavailable")
    prototypes, sources, diagnostics = {}, {}, []
    for concept in selected_memory["records"]:
        versions = concept.get("versions", [concept])
        for record in versions:
            if record.get("memoryKind") != "shape" or not isinstance(record.get("payload"), dict):
                continue
            payload = record["payload"]
            if "revisions" not in payload or "anchorUid" not in payload:
                continue
            try:
                item = _prototype(record, frame)
                if item is None:
                    continue
            except (KeyError, TypeError, ValueError) as error:
                diagnostics.append({"recordUid": record.get("recordUid"), "reason": str(error)})
                continue
            existing = prototypes.setdefault(item["uid"], {
                "uid": item["uid"], "anchorUid": item["anchorUid"], "anchor": item["anchor"], "revisions": [],
            })
            known = {revision["uid"] for revision in existing["revisions"]}
            for revision in item["revisions"]:
                if revision["uid"] not in known:
                    existing["revisions"].append(revision)
                    known.add(revision["uid"])
                key = (item["uid"], revision["uid"])
                refs = sources.setdefault(key, [])
                if item["source"] not in refs:
                    refs.append(item["source"])
    for item in prototypes.values():
        item["revisions"].sort(key=lambda row: (row["revision"], row["uid"]))
    for refs in sources.values():
        refs.sort(key=canonical_json)
    signature = content_hash({
        "prototypes": sorted(prototypes.values(), key=lambda item: item["uid"]),
        "sources": [{"prototypeUid": key[0], "revisionUid": key[1], "sources": refs}
                    for key, refs in sorted(sources.items())],
        "diagnostics": sorted(diagnostics, key=canonical_json),
    })
    return prototypes, sources, signature, diagnostics


def selected_grouping_memory_revision(frame: TemporalFrame, selected_memory: Mapping[str, Any]) -> str:
    """Fingerprint eligible selected priors, excluding this frame's own outputs."""
    return _selected_prototypes(_copy(selected_memory), frame)[2]


def apply_promoted_grouping(
    frame: TemporalFrame, store: CandidateRuleStore, selected_memory: Mapping[str, Any], *,
    scope_context: Mapping[str, Any], group_support: Mapping[str, GroupingEvidence] | None = None,
    swipl_executable: str | None = None, timeout: float = 30.0,
) -> dict[str, Any]:
    """Recognize current final Gs using promoted template rules and selected priors.

    Only grouping_template_candidate heads bind saved prototypes. Other grouping
    heads are explicitly reported unsupported, never silently accepted as G/O.
    """
    context = _context(frame, scope_context)
    groups = {group.uid: group for group in frame.groups}
    support = group_support or {}
    if set(support) - set(groups):
        raise ValueError("grouping support references a non-current final G")
    for evidence in support.values():
        evidence.validate()
        if type(evidence.independent) is not bool:
            raise ValueError("grouping support independence must be an explicit boolean")
    with writer_lock(store.workspace_root / "runtime" / "grouping-promotion-locks"):
        rules, registry_revision = _registry(store)
        engine = engine_version()
        prototypes, sources, memory_revision, diagnostics = _selected_prototypes(_copy(selected_memory), frame)
        anchors = {row["anchorUid"]: row["anchor"] for row in prototypes.values()}
        facts, predictions, skipped = [], [], []
        for group in frame.groups:
            facts.append({"predicate": "present", "args": [group.uid]})
            evidence = support.get(group.uid)
            if (evidence and evidence.independent and evidence.outcome == "support"
                    and evidence.origin != "prototype_prediction"
                    and not evidence.used_candidate_ids and not evidence.used_prototype_ids):
                facts.append({"predicate": "independent_group_support", "args": [group.uid]})
            if not group.points:
                continue
            for anchor_uid, anchor in sorted(anchors.items()):
                comparison = match_prototypes(group, [{
                    "uid": anchor_uid, "revisions": [{
                        "uid": anchor_uid, "points": anchor["canonicalPoints"], "colors": [], "symbols": [],
                    }],
                }], minimum_iou=0.0)
                score = comparison["candidates"][0]["pixelIou"]
                facts.append({"predicate": "observed_mask_similarity", "args": [group.uid, anchor_uid, score]})
        known = sorted({*groups, *anchors, *prototypes})
        for rule in rules:
            if not _scope_matches(rule["scope"], context):
                skipped.append({"candidateId": rule["candidate_id"], "reason": "out_of_scope"})
                continue
            if rule["rule"]["head"]["predicate"] != "grouping_template_candidate":
                skipped.append({"candidateId": rule["candidate_id"], "reason": "unsupported_grouping_head"})
                continue
            for term in evaluate_rule(
                rule["rule"], kind="grouping", facts=facts,
                entity_ids=sorted(set(known) | set(rule["entity_ids"])),
                swipl_executable=swipl_executable, timeout=timeout,
            ):
                group_uid, anchor_uid = term["args"]
                if group_uid not in groups or anchor_uid not in anchors:
                    skipped.append({"candidateId": rule["candidate_id"], "reason": "unselected_or_noncurrent_subject",
                                    "term": term})
                    continue
                predictions.append({"candidateId": rule["candidate_id"], "candidateVersion": rule["version"],
                                    "term": term})
        decisions, bindings = [], []
        for group in sorted(frame.groups, key=lambda item: item.uid):
            if not group.points:
                decisions.append({"groupUid": group.uid, "status": "unmeasurable"})
                continue
            eligible = {row["term"]["args"][1] for row in predictions if row["term"]["args"][0] == group.uid}
            choices = [item for item in prototypes.values() if item["anchorUid"] in eligible]
            matching = match_prototypes(group, choices, minimum_iou=0.0)
            if matching["selected"] is None:
                decisions.append({"groupUid": group.uid, "status": matching["status"], "matching": matching})
                continue
            selected = matching["selected"]
            prototype = prototypes[selected["prototypeUid"]]
            rule_refs = [{"candidateId": row["candidateId"], "candidateVersion": row["candidateVersion"]}
                         for row in predictions if row["term"]["args"] == [group.uid, prototype["anchorUid"]]]
            payload = {
                "frameUid": frame.uid, "frameOrder": frame.order, "groupUid": group.uid,
                "anchorUid": prototype["anchorUid"], "prototypeUid": prototype["uid"],
                "prototypeRevisionUid": selected["revisionUid"], "sources": sources[(prototype["uid"], selected["revisionUid"])],
                "rules": sorted(rule_refs, key=canonical_json),
                "pixelIou": selected["pixelIou"], "symbolicTieBreak": selected["symbolicTieBreak"],
                "confidence": min(selected["pixelIou"], support[group.uid].confidence if group.uid in support else 1.0),
            }
            binding = {"bindingUid": stable_id("grouping-binding", payload), **payload}
            bindings.append(binding)
            decisions.append({"groupUid": group.uid, "status": "reused_saved_prototype",
                              "bindingUid": binding["bindingUid"], "matching": matching})
        if _registry(store)[1] != registry_revision or engine_version() != engine:
            raise ValueError("grouping rule registry/engine changed during application; retry")
        payload = {
            "schemaVersion": 1, "version": VERSION, "implementationHash": _implementation_hash(),
            "frameUid": frame.uid, "providerId": frame.provider_id, "sequenceId": frame.sequence_id,
            "registryRevision": registry_revision, "selectedMemoryRevision": memory_revision,
            "ruleEngineVersion": engine, "scopeContext": context,
            "groupSupport": {key: asdict(value) for key, value in sorted(support.items())},
            "facts": facts, "predictions": sorted(predictions, key=canonical_json),
            "bindings": bindings, "decisions": decisions, "skippedRules": skipped, "memoryDiagnostics": diagnostics,
            "authority": "promoted_prolog_template_recognition", "finalGroupAcceptanceChanged": False,
        }
        return {**payload, "applicationUid": stable_id("grouping-application", payload)}


def observe_grouping_with_memory(
    frame: TemporalFrame, *, store: CandidateRuleStore, selected_memory: Mapping[str, Any],
    scope_context: Mapping[str, Any], group_support: Mapping[str, GroupingEvidence] | None = None,
    previous_state: Mapping[str, Any] | None = None,
    evidence_by_group: Mapping[str, GroupingEvidence] | None = None,
    swipl_executable: str | None = None, timeout: float = 30.0,
) -> dict[str, Any]:
    """Observe pixels and apply saved-prototype recognition to actual state."""
    if previous_state is not None and previous_state.get("memoryApplication"):
        metadata = previous_state["memoryApplication"]
        if metadata["version"] != VERSION or metadata["implementationHash"] != _implementation_hash():
            raise ValueError("grouping application implementation changed; replay the suffix")
    application = apply_promoted_grouping(
        frame, store, selected_memory, scope_context=scope_context, group_support=group_support,
        swipl_executable=swipl_executable, timeout=timeout,
    )
    merged = dict(evidence_by_group or {})
    additional_evidence = {}
    for uid, evidence in (group_support or {}).items():
        if evidence.origin == "prototype_prediction" or evidence.used_candidate_ids or evidence.used_prototype_ids:
            prior = merged.get(uid)
            merged[uid] = GroupingEvidence(
                source_ref=evidence.source_ref, origin="prototype_prediction", independent=False,
                outcome="ungraded",
                used_candidate_ids=tuple(sorted({*evidence.used_candidate_ids, *(prior.used_candidate_ids if prior else ())})),
                used_prototype_ids=tuple(sorted({*evidence.used_prototype_ids, *(prior.used_prototype_ids if prior else ())})),
                background_role=prior.background_role if prior else evidence.background_role,
                confidence=min(evidence.confidence, prior.confidence if prior else 1.0),
            )
    for binding in application["bindings"]:
        prior = merged.get(binding["groupUid"])
        dependent = GroupingEvidence(
            source_ref=application["applicationUid"], origin="prototype_prediction", independent=False,
            outcome="ungraded", confidence=min(binding["confidence"], prior.confidence if prior else 1.0),
            used_candidate_ids=tuple(sorted({*(prior.used_candidate_ids if prior else ()),
                                            *(row["candidateId"] for row in binding["rules"])})),
            used_prototype_ids=tuple(sorted({*(prior.used_prototype_ids if prior else ()), binding["prototypeUid"]})),
            background_role=prior.background_role if prior else None,
        )
        if prior is not None:
            additional_evidence[binding["groupUid"]] = dependent
        else:
            merged[binding["groupUid"]] = dependent
    result = observe_grouping(frame, previous_state=previous_state, evidence_by_group=merged)
    checkpoint = result["checkpoint"]
    by_group = {binding["groupUid"]: binding for binding in application["bindings"]}
    for prototype in checkpoint["prototypes"]:
        if "activeMemoryBindings" in prototype:
            prototype["activeMemoryBindings"] = []
    for observation in result["observations"]:
        binding = by_group.get(observation["groupUid"])
        observation["effectivePrototypeUid"] = binding["prototypeUid"] if binding else observation.get("prototypeUid")
        observation["memoryBinding"] = binding
        if binding and observation.get("prototypeUid"):
            prototype = next(item for item in checkpoint["prototypes"] if item["uid"] == observation["prototypeUid"])
            record = {**binding, "applicationUid": application["applicationUid"]}
            history = prototype.setdefault("memoryBindingHistory", [])
            if record not in history:
                history.append(record)
            prototype.setdefault("activeMemoryBindings", []).append(record)
            dependent = additional_evidence.get(observation["groupUid"])
            if dependent:
                provenance = {
                    "frameUid": frame.uid, "frameOrder": frame.order, "sequenceId": frame.sequence_id,
                    "providerId": frame.provider_id, "observationUid": observation["groupUid"],
                    "prototypeRevisionUid": observation["revisionUid"], **asdict(dependent),
                    "eligibleIndependentEvidence": False, "exclusion": "self_confirming",
                }
                evidence = {"uid": stable_id("grouping-evidence", provenance), **provenance}
                if not any(row["uid"] == evidence["uid"] for row in prototype["evidence"]):
                    prototype["evidence"].append(evidence)
            original = (evidence_by_group or {}).get(observation["groupUid"])
            if original:
                context = {"frameUid": frame.uid, "applicationUid": application["applicationUid"],
                           "evidence": asdict(original)}
                inputs = prototype.setdefault("memoryApplicationInputs", [])
                if context not in inputs:
                    inputs.append(context)
    checkpoint["memoryApplication"] = {
        key: application[key] for key in ("version", "implementationHash", "applicationUid", "registryRevision",
                                         "selectedMemoryRevision", "ruleEngineVersion")
    }
    checkpoint["activeMemoryBindings"] = _copy(application["bindings"])
    payload = {key: value for key, value in checkpoint.items() if key != "checkpointUid"}
    checkpoint["checkpointUid"] = stable_id("checkpoint", payload)
    candidates = grouping_candidate_evaluations(checkpoint)
    applied_anchors = {binding["anchorUid"] for binding in application["bindings"]}
    result["candidates"] = [row for row in candidates if row["head"]["args"][1] not in applied_anchors]
    result["suppressedCandidates"] = [{
        "candidateUid": row["candidateUid"], "reason": "already_applied_promoted_template",
        "supportingIds": row["supportingIds"], "contradictingIds": row["contradictingIds"],
    } for row in candidates if row["head"]["args"][1] in applied_anchors]
    result["application"] = application
    if _registry(store)[1] != application["registryRevision"] or engine_version() != application["ruleEngineVersion"]:
        raise ValueError("grouping registry/engine changed before observation publication; retry")
    return result
