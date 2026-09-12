"""Filesystem adapters for the semantic Visual Sequence stages.

Mount ``router`` on video_import_api.router and call
``register_transforms(_SEQUENCE_TRANSFORMS, _TRANSFORM_METADATA)`` there.
Registration does not modify default templates, stamp work, or call a model.
Only server-resolved workspaces/sequences and typed peer-core inputs are used.
"""
from __future__ import annotations

from contextlib import contextmanager
from dataclasses import asdict, replace
from functools import wraps
import json
from pathlib import Path
import re
from typing import Any, Mapping
from uuid import uuid4

from fastapi import APIRouter, Body, HTTPException, Response

from omega_vision.perception._event_journal import (
    ConflictError, IntegrityError, Journal, ValidationError, atomic_json, content_id, writer_lock,
)
from omega_vision.perception.candidate_rules import CandidateRuleStore, PromotionGates, effective_promoted_semantics
from omega_vision.perception.observation_identity import _prolog_atom, content_hash
from omega_vision.inherited_source_overlay import OMEGA_PROVIDER_ID, OMEGA_STORAGE_ID


router = APIRouter(prefix="/semantic", tags=["video-import-semantics"])
VERSION = "video-import-semantics-v1"
IDENTITY = "observation_identity_0/content_hash"
PARTS = "parts_extraction_0/python_opencv"
GROUPS = "parts_grouping_0/group_regions_prolog"
ACCEPTANCE = "group_acceptance_0/group_acceptance_prolog"
TURTLE = "turtle_programs/turtle_programs_prolog"
TEMPORAL = "temporal_correspondence_0/python_cv"
OBJECTS = "object_tracking_0/object_tracking_prolog"
GROUPING = "adaptive_grouping_0/measured_templates"
EVENTS = "event_deduction_0/authored_prolog"
LOG = "event_log_0/canonical"
INDUCTION = "event_induction_0/deterministic"
LLM_EVENTS = "llm_event_deduction_0/configured_vision"
LLM_RULES = "llm_event_induction_0/configured_vision"
PROMPTS = Path(__file__).resolve().parent / "prompts"
EVENT_RULE_KINDS = {"event_detector", "event_transition", "action_effect"}


def _api():
    from omega_vision.services import video_import_api
    return video_import_api


def _json(path: Path) -> dict[str, Any]:
    if not path.is_file():
        raise FileNotFoundError(f"Required semantic input is missing: {path.name}")
    result = json.loads(path.read_text(encoding="utf-8"))
    if not isinstance(result, dict):
        raise ValidationError(f"{path.name} must contain an object")
    return result


def _safe(root: Path, path: Path) -> Path:
    resolved = path.resolve()
    if not resolved.is_relative_to(root.resolve()):
        raise PermissionError("Resource escapes its server-authorized root")
    return resolved


def _authorized_path(root: Path, path: Path) -> Path:
    resolved = path.resolve()
    if any(resolved.is_relative_to(Path(home).resolve()) for home in _api()._data_homes(root)):
        return resolved
    raise PermissionError("Resource is outside the workspace and its server-authorized data providers")


def _workspace(workspace_id: str) -> Path:
    if not isinstance(workspace_id, str) or not workspace_id.strip():
        raise ValidationError("workspaceId is required")
    root = Path(_api()._workspace_root(workspace_id)).resolve()
    for family in ("runtime", "design", "knowledge"):
        _safe(root, root / family)
    return root


def _store(root: Path, unit=None, *, require_context=True) -> CandidateRuleStore:
    from omega_vision.perception.contextual_rules import ContextualRuleStore, ReadOnlyLegacyRuleStore
    from omega_vision.perception.contextual_memory import ContextUnavailable
    unavailable = None
    if unit is not None:
        try:
            context = _inspection_context(root, unit["sequenceId"], unit["id"])
        except ContextUnavailable as error:
            if require_context:
                raise
            unavailable = error.code
        else:
            if unit.get("frameOrder") != context.current.order:
                raise ValidationError("Pipeline frame order disagrees with the explicit recording manifest")
            return ContextualRuleStore(context)
    root = _api()._vision_data_root(root)
    for family in ("rule-candidates", "rule-proposals", "semantic-learning", "grouping-promotion-locks"):
        _safe(root, root / "runtime" / family)
    for family in ("event-rules", "grouping-rules"):
        _safe(root, root / "design" / family)
    legacy = ReadOnlyLegacyRuleStore(root)
    legacy.context_unavailable = unavailable
    return legacy


def _registry_revision(store: CandidateRuleStore, records=None, *, kinds=None) -> dict[str, Any]:
    from omega_vision.perception.event_induction import engine_version
    context = getattr(store, "context", None)
    return {
        "storePath": str((context.stm_area() if context else store.path).resolve()),
        "kinds": sorted(kinds) if kinds is not None else None,
        "semantics": store.effective_semantics(records=records, kinds=kinds),
        "ruleEngineVersion": engine_version(),
        "contextUnavailable": getattr(store, "context_unavailable", None),
    }


@contextmanager
def _registry_publication(store: CandidateRuleStore, revision: Mapping[str, Any]):
    from omega_vision.perception.contextual_rules import ContextualRuleStore
    if isinstance(store, ContextualRuleStore):
        with store.journal.publication():
            if _registry_revision(store, kinds=revision.get("kinds")) != revision:
                raise ConflictError("Candidate registry changed during deduction; replan and replay the sequence")
            yield
        return
    with store.journal.transaction() as records:
        if _registry_revision(store, records, kinds=revision.get("kinds")) != revision:
            raise ConflictError("Candidate registry changed during deduction; replan and replay the sequence")
        yield


def _units(workspace_id: str, sequence_id: str) -> tuple[Path, list[dict[str, Any]]]:
    root = _workspace(workspace_id)
    directory, units, _ = _api()._sequence_execution_context(root, sequence_id, workspace_id)
    _authorized_path(root, directory)
    for unit in units:
        unit.update(workspaceId=workspace_id, workspaceRoot=root, providerId=OMEGA_PROVIDER_ID)
        _safe(directory, Path(unit["dir"]))
        _safe(directory, Path(unit["image"]))
    return root, units


def _consumer_units(workspace_id: str, sequence_id: str, state):
    """Attach the same request-local snapshot to each selected sequence."""
    root, units = _units(workspace_id, sequence_id)
    if state is not None:
        for unit in units:
            unit.update(memorySessionId=state.session_id, _browserMemory=state)
    return root, units


def _context(unit: Mapping[str, Any]) -> tuple[Path, list[dict[str, Any]], int]:
    root, units = _units(str(unit.get("workspaceId") or ""), str(unit.get("sequenceId") or ""))
    selected = [index for index, item in enumerate(units) if item["id"] == unit["id"]]
    if len(selected) != 1:
        raise ValidationError("Frame is not a member of the selected sequence")
    index = selected[0]
    current = units[index]
    if Path(unit["dir"]).resolve() != Path(current["dir"]).resolve():
        raise ValidationError("Frame output directory does not match the actual sequence unit")
    if unit.get("frameOrder") != index or unit.get("sequenceOrdered") is not current["sequenceOrdered"]:
        raise ValidationError("Frame order/ordering declaration changed; reload the sequence")
    if not current["sequenceOrdered"]:
        raise ValidationError("Unordered images have no adjacent temporal evidence")
    for item in units:
        item["memorySessionId"] = unit.get("memorySessionId")
        item["_browserMemory"] = unit.get("_browserMemory")
    if unit.get("workspaceRoot") and Path(unit["workspaceRoot"]).resolve() != root:
        raise PermissionError("Workspace context does not match server authorization")
    return root, units, index


def _prepare(unit: dict[str, Any]) -> dict[str, Any]:
    api = _api()
    root = Path(unit["workspaceRoot"])
    chain = api._load_preprocessing_chain_at(Path(unit["sequenceRoot"]))
    catalog = api._filter_catalog_index(root) if chain else {}
    prepared = dict(unit)
    prepared["image"] = api._materialize_preprocessed_image(root, prepared, chain, catalog)
    _safe(Path(unit["sequenceRoot"]), prepared["image"])
    return prepared


def _artifact(unit: Mapping[str, Any], step: str, filename: str = "result.json") -> Path:
    directory = Path(unit["dir"])
    target = directory.joinpath(*step.split("/"), filename)
    return _safe(directory, target)


def _result(unit: Mapping[str, Any], step: str) -> dict[str, Any]:
    directory = _artifact(unit, step).parent
    if _api()._read_claim(directory / "claim.json") is not None:
        raise ConflictError(f"{step} is being rewritten; retry after its current run completes")
    if (directory / ".transform-failed.json").exists():
        raise ValidationError(f"{step} has a failed latest attempt; replay it before consuming old output")
    result = _json(directory / "result.json")
    if result.get("storage") == "browser_session":
        state = unit.get("_browserMemory")
        key = state.output_key(unit["sequenceId"], unit["id"], step) if state else None
        output = state.outputs.get(key) if state else None
        if not output or output["resultHash"] != result.get("resultHash"):
            raise ConflictError(f"{step} requires its current browser snapshot; rerun dependencies in this page")
        result = output["result"]
    elif step in {OBJECTS, GROUPING} and _transient_output(unit, step):
        raise ConflictError(f"{step} has an older disk checkpoint; replay from the first frame in this browser")
    if step == OBJECTS:
        from omega_vision.perception.object_evidence import validate_object_result
        validate_object_result(result)
    return result


def _frame(unit: dict[str, Any], *, single_observation: bool = False):
    from omega_vision.perception.temporal_correspondence import temporal_frame_from_bundle

    prepared = _prepare(unit)
    for step in (IDENTITY, PARTS, GROUPS, ACCEPTANCE):
        directory = _artifact(unit, step).parent
        if _api()._read_claim(directory / "claim.json") is not None:
            raise ConflictError(f"{step} is being rewritten; cannot read a mixed observation snapshot")
        if (directory / ".transform-failed.json").exists():
            raise ValidationError(f"{step} has a failed latest attempt; replay observation dependencies")
    bundle = _json(_artifact(unit, IDENTITY, "observations.json"))
    expected = bundle["frame"]
    unordered_singleton = single_observation and not unit["sequenceOrdered"]
    if (expected["sequenceId"], expected["frameOrder"], expected["sourceKey"]) != (
        unit["sequenceId"], None if unordered_singleton else unit["frameOrder"], unit["frameSourceKey"],
    ):
        raise ValidationError("Observation identity belongs to a different frame/order/sequence")
    artifacts = {
        "image": prepared["image"],
        "partsFacts": _artifact(unit, PARTS, "result.pl"),
        "geometry": _artifact(unit, PARTS, "geometry.json"),
        "groupingFacts": _artifact(unit, GROUPS, "result.pl"),
        "acceptanceFacts": _artifact(unit, ACCEPTANCE, "result.pl"),
        "acceptanceMetadata": _artifact(unit, ACCEPTANCE, "meta.json"),
        "extractionMetadata": _artifact(unit, PARTS, "meta.json"),
    }
    for role, path in artifacts.items():
        if not path.is_file():
            raise FileNotFoundError(f"Missing {role}; run observation dependencies first")
        digest = content_hash(path.read_bytes())
        if role in bundle["artifactHashes"] and digest != bundle["artifactHashes"][role]:
            raise ValidationError(f"Stale observation {role}; replay observation_identity_0")
    image_bytes = prepared["image"].read_bytes()
    if expected["imageHash"] != content_hash(image_bytes):
        raise ValidationError("Observation pixels differ from the effective preprocessed image")
    lineage = _api()._read_image_provenance(prepared["image"])
    if prepared["image"] != prepared["sourceImage"] and not lineage:
        raise ValidationError("Preprocessed temporal input is missing coordinate lineage")
    observation_metadata, input_hashes = _observation_metadata(unit)
    if unordered_singleton:
        # A singleton computation has a local ordinal, not a claimed sequence
        # order. Preserve the verified source/G identities and bind the projection.
        input_hashes["singleObservationProjection"] = content_hash({
            "sourceBundleUid": bundle["bundleUid"], "sourceOrder": None, "localOrder": 0,
        })
        bundle = {**bundle, "frame": {**bundle["frame"], "frameOrder": 0}}
    frame = temporal_frame_from_bundle(
        bundle, provider_id=unit["providerId"],
        geometry=_json(artifacts["geometry"]),
        extraction_text=artifacts["partsFacts"].read_text(encoding="utf-8"),
        lineage=lineage,
        observation_metadata=observation_metadata,
        image_bytes=image_bytes,
    )
    return replace(frame, source_hashes={**frame.source_hashes, **input_hashes})


def _attachment_context(unit: Mapping[str, Any], frame, objects: Mapping[str, Any]):
    from omega_vision.perception.event_deduction import attachment_facts_hash
    raw = _artifact(unit, PARTS, "meta.json").read_bytes()
    metadata = json.loads(raw)
    evidence = metadata.get("attachmentEvidence")
    if evidence is None:
        return None
    if content_hash(raw) != frame.source_hashes.get("extractionMetadata"):
        raise ValidationError("Attachment producer attestation is not anchored to this observation bundle")
    _fields(evidence, {"schemaVersion", "complete", "backgroundRolesTrusted", "extractionPolicyHash"})
    if type(evidence["schemaVersion"]) is not int or evidence["schemaVersion"] != 1:
        raise ValidationError("Unsupported attachment producer attestation schema")
    return {
        "frame_uid": frame.uid, "provider_id": frame.provider_id, "sequence_id": frame.sequence_id,
        "facts_hash": attachment_facts_hash(frame), "object_evidence_uid": objects["evidenceUid"],
        "extraction_policy_hash": evidence["extractionPolicyHash"],
        "complete": evidence["complete"], "background_roles_trusted": evidence["backgroundRolesTrusted"],
    }


def _emit(unit: Mapping[str, Any], out_dir: Path, result: dict[str, Any], *,
          schema: str, summary: Mapping[str, Any], facts: list[str] | None = None,
          checkpoint_family: str | None = None, transient_step: str | None = None) -> dict[str, Any]:
    workspace = _workspace(str(unit["workspaceId"]))
    root = _api()._vision_data_root(workspace)
    _api()._require_sequence_write(workspace, out_dir)
    _safe(Path(unit["dir"]), out_dir)
    out_dir.mkdir(parents=True, exist_ok=True)
    # Peer results are sealed: do not insert envelope fields into their hashes.
    document = result
    if transient_step is not None:
        state = unit.get("_browserMemory")
        if state is None:
            raise ValidationError("Nowhere output requires an explicit browser memory snapshot")
        digest = state.put_output(unit["sequenceId"], unit["id"], transient_step, result)
        document = {"schemaVersion": 1, "storage": "browser_session", "resultHash": digest,
                    "checkpointHash": content_hash(result["checkpoint"]) if result.get("checkpoint") else None}
        facts = []
    atomic_json(out_dir / "result.json", document)
    checkpoint_ref = None
    if result.get("checkpoint") and transient_step is None:
        checkpoint = result["checkpoint"]
        atomic_json(out_dir / "checkpoint.json", checkpoint)
        if checkpoint_family:
            from omega_vision.perception.temporal_correspondence import persist_checkpoint
            _safe(root, root / "runtime" / checkpoint_family)
            if checkpoint_family in {"object-checkpoints", "grouping-checkpoints"}:
                from omega_vision.perception.memory_catalog_cache import memory_catalog_mutation
                _safe(root, root / ".cache" / "memory-catalog")
                with memory_catalog_mutation(root):
                    path = persist_checkpoint(root / "runtime", checkpoint, family=checkpoint_family)
            else:
                path = persist_checkpoint(root / "runtime", checkpoint, family=checkpoint_family)
            checkpoint_ref = _api()._workspace_relative(workspace, path)
    lines = [
        "% Typed semantic output; LLM hypotheses and predictions are not authoritative events.",
        f"semantic_result({_prolog_atom(schema)},{_prolog_atom(content_hash(document))}).",
        *(facts or []),
    ]
    (out_dir / "result.pl").write_text("\n".join(lines) + "\n", encoding="utf-8")
    stats = {
        "schema": schema, "module": __name__, **dict(summary),
        "resultArtifact": (out_dir / "result.json").relative_to(unit["dir"]).as_posix(),
        **({"checkpointArtifact": checkpoint_ref} if checkpoint_ref else {}),
    }
    atomic_json(out_dir / "summary.json", stats)
    return stats


def run_temporal(unit: dict[str, Any], out_dir: Path, options: dict[str, Any]) -> dict[str, Any]:
    from omega_vision.perception.temporal_correspondence import (
        compare_frames, frame_to_dict, initial_temporal_state,
    )
    _, units, index = _context(unit)
    frame = _frame(units[index])
    input_status = None
    if index == 0:
        result = {"assessment": "initial_observation", "reason": "no_predecessor",
                  "checkpoint": initial_temporal_state(frame)}
    else:
        before = _frame(units[index - 1])
        result = compare_frames(
            before, frame,
            previous_state=_result(units[index - 1], TEMPORAL)["checkpoint"],
            input_receipts=(),
        )
        paths = _recording_input_paths(units[index])
        state = _json(paths["state"]) if "state" in paths else {}
        if state.get("incoming_action") is not None and not _sample_advance(state, state["incoming_action"]):
            input_status = {
                "status": "unbound_actual_input",
                "reason": "Recorded input channel has no independently established source final-G actor binding",
                "sourceRef": _api()._workspace_relative(Path(unit["workspaceRoot"]), paths["state"]),
            }
    out_dir.mkdir(parents=True, exist_ok=True)
    atomic_json(out_dir / "frame.json", frame_to_dict(frame))
    facts = [
        f"temporal_correspondence({_prolog_atom(match['fromUid'])},{_prolog_atom(match['toUid'])},"
        f"{_prolog_atom(match['trackUid'])},{float(match['confidence'])})."
        for match in result.get("matches", [])
    ]
    return _emit(unit, out_dir, result, schema="temporal_measurements", facts=facts,
                 checkpoint_family="temporal-checkpoints", summary={
                     "assessment": result["assessment"], "matchCount": len(result.get("matches", [])),
                     "ambiguityCount": len(result.get("ambiguities", [])),
                     "authority": "advisory_measurements",
                     "inputReceiptStatus": input_status,
                 })


def run_objects(unit: dict[str, Any], out_dir: Path, options: dict[str, Any]) -> dict[str, Any]:
    from omega_vision.perception.grouping_learning import shape_anchor
    from omega_vision.perception.object_evidence import infer_objects_with_evidence as infer_objects
    _, units, index = _context(unit)
    with _memory_access(unit["workspaceId"], unit["sequenceId"], unit.get("_browserMemory"), frame_id=unit["id"]) as access:
        locations, context, volatile = access
        preferences = locations.load_preferences(context)
        _require_generated_session(unit, preferences, ("shape", "object"), locations=locations, context=context)
        frame = _frame(units[index])
        result = infer_objects(
            frame, temporal=_result(units[index], TEMPORAL) if index else None,
            previous_state=_result(units[index - 1], OBJECTS)["checkpoint"] if index else None,
        )
        selected = locations.read_selected("shape", preferences["shape"]["lookIn"], context, volatile=volatile)
        if selected["errors"]:
            raise ValidationError("Selected Shape memory is unavailable: " + json.dumps(selected["errors"]))
        anchors = {group.uid: shape_anchor(group, provider_id=frame.provider_id)
                   for group in frame.groups if group.points}
        shape_records = _save_generated_records(
            access, preferences, "shape", list({anchor["uid"]: anchor for anchor in anchors.values()}.values()),
            frame.uid, OBJECTS,
        )
        shape_versions = [version for item in selected["records"] for version in item["versions"]]
        shape_versions.extend(shape_records)
        payloads = []
        for obj in result["objects"]:
            references = []
            for member in obj["members"]:
                anchor = anchors.get(member["observationUid"])
                if anchor is None:
                    continue
                for record in shape_versions:
                    payload = record["payload"]
                    if payload.get("kind") != "shape_point_anchor" or payload.get("shapeKey") != anchor["shapeKey"]:
                        continue
                    reference = {**_memory_reference(record, relation="has_shape"), "memberTrackUid": member["trackUid"],
                                 "observationUid": member["observationUid"]}
                    if reference not in references:
                        references.append(reference)
            payloads.append({**obj, "shapeReferences": references})
        object_records = _save_generated_records(access, preferences, "object", payloads, frame.uid, OBJECTS)
        memory = {"shape": _memory_write_summary(preferences, "shape", shape_records),
                  "object": _memory_write_summary(preferences, "object", object_records)}
    facts = [
        f"persistent_object({_prolog_atom(obj['uid'])},[{','.join(_prolog_atom(member) for member in obj['memberTrackUids'])}])."
        for obj in result["objects"]
    ]
    return _emit(unit, out_dir, result, schema="persistent_objects", facts=facts,
                 transient_step=OBJECTS if _transient_output(unit, OBJECTS, preferences) else None,
                 summary={"objectCount": len(result["objects"]), "assessment": result["assessment"],
                          "memory": memory})


def _source_images(units: list[dict[str, Any]], frames: list[Any]) -> dict[str, bytes]:
    return {frame.uid: Path(unit.get("sourceImage") or unit["image"]).read_bytes()
            for unit, frame in zip(units, frames)}


def _grouping_learning_proposals(result: Mapping[str, Any], existing, frame):
    from omega_vision.perception.event_records import normalize_rule
    proposals, deferred = [], []
    for proposal in result["candidates"]:
        spec = proposal["storeProposal"]
        rule = normalize_rule(spec["rule"], kind="grouping", entity_ids=spec["entity_ids"])
        previous = next((item for item in existing if item["rule"] == rule and item["scope"] == spec["scope"]
                        and item["inducer_version"] == spec["inducer_version"]), None)
        training = ([item["provenance"]["groupingTraining"] for item in previous["proposals"]
                     if item.get("provenance", {}).get("groupingTraining")] if previous else [])
        if previous and (previous["status"] == "promoted" or training and not any(
            (item["providerId"], item["sequenceId"]) == (frame.provider_id, frame.sequence_id) for item in training
        )):
            deferred.append({"proposalUid": proposal["candidateUid"], "candidateId": previous["candidate_id"],
                            "reason": "existing_template_requires_explicit_retraining"})
        else:
            proposals.append(proposal)
    return proposals, deferred


def _selected_template_revision(candidates, records):
    anchor_ids = {candidate["rule"]["head"]["args"][1] for candidate in candidates
                  if isinstance(candidate["rule"]["head"]["args"][1], str)}
    training = {}
    for candidate in candidates:
        frames = {uid for proposal in candidate["proposals"]
                  for uid in proposal.get("provenance", {}).get("groupingTraining", {}).get("frameUids", [])}
        for proposal in candidate["proposals"]:
            for uid in proposal.get("provenance", {}).get("prototypeUids", []):
                training.setdefault(uid, []).append(frames)
    bindings = {}
    for item in records:
        for record in item["versions"]:
            payload = record["payload"]
            if not isinstance(payload.get("uid"), str):
                continue
            anchor = payload.get("kind") == "shape_point_anchor" and payload.get("uid") in anchor_ids
            prototype = (payload.get("uid") in training and payload.get("anchorUid") in anchor_ids
                         and payload.get("revisions") and any(
                             {revision.get("frameUid") for revision in payload["revisions"]} <= known
                             for known in training[payload["uid"]]))
            if anchor or prototype:
                binding = {"payloadHash": content_hash(payload), **{
                    key: record["source"][key] for key in ("providerRef", "workspaceId", "memoryLocationId")
                }}
                # Repeated attribution of the same immutable template is not new training.
                bindings[content_hash(binding)] = binding
    return [bindings[key] for key in sorted(bindings)]


def _apply_grouping_templates(unit, frame, candidates, selected_records, *, memory_context=None):
    from omega_vision.perception.event_induction import _scope_matches, engine_version, evaluate_rule
    from omega_vision.perception.grouping_learning import match_prototypes
    from omega_vision.perception.grouping_promotion import sequence_source_fingerprint
    from omega_vision.perception.temporal_correspondence import stable_id
    context = {"providerId": frame.provider_id, "provider_id": frame.provider_id,
               "sequenceId": frame.sequence_id, "sequence_id": frame.sequence_id,
               "workspaceId": unit["workspaceId"], "workspace_id": unit["workspaceId"], "domain": "visual-sequence"}
    if memory_context is not None:
        context.update({key: value for key, value in asdict(memory_context).items() if key != "workspace_id"})
        context.update({"gameId": memory_context.game_id, "levelId": memory_context.level_id,
                        "runId": memory_context.run_id})
    source_hash = sequence_source_fingerprint([frame], _source_images([unit], [frame]))[1][frame.uid]
    versions = [record for item in selected_records for record in item["versions"]]
    applications, unavailable = [], []
    for candidate in candidates:
        if candidate["status"] != "promoted" or not _scope_matches(candidate["scope"], context):
            continue
        head = candidate["rule"]["head"]
        if head["predicate"] != "grouping_template_candidate" or not isinstance(head["args"][1], str):
            unavailable.append({"candidateId": candidate["candidate_id"], "reason": "unsupported_template_head"})
            continue
        anchor_id = head["args"][1]
        anchors = [record for record in versions if record["payload"].get("kind") == "shape_point_anchor"
                   and record["payload"].get("uid") == anchor_id]
        for record in anchors:
            anchor = record["payload"]
            if (anchor.get("providerId") != frame.provider_id
                    or stable_id("shape-anchor", {key: value for key, value in anchor.items() if key != "uid"}) != anchor_id):
                raise ValidationError("Selected Shape anchor does not match its immutable provider-aware identity")
        prototype_ids = {uid for item in candidate["proposals"]
                        for uid in item.get("provenance", {}).get("prototypeUids", [])}
        training_frames = {uid for item in candidate["proposals"]
                          for uid in item.get("provenance", {}).get("groupingTraining", {}).get("frameUids", [])}
        prototypes = []
        for record in versions:
            payload = record["payload"]
            if (not isinstance(payload.get("uid"), str) or payload.get("uid") not in prototype_ids
                    or payload.get("anchorUid") != anchor_id
                    or payload.get("providerId") != frame.provider_id or not payload.get("revisions")):
                continue
            if any(revision.get("frameUid") not in training_frames for revision in payload["revisions"]):
                continue
            previous = None
            for revision in payload["revisions"]:
                if (revision.get("prototypeUid") != payload["uid"] or revision.get("previousRevisionUid") != previous
                        or stable_id("prototype-revision", {key: value for key, value in revision.items() if key != "uid"})
                        != revision.get("uid")):
                    raise ValidationError("Selected Shape prototype has invalid immutable revision lineage")
                previous = revision["uid"]
            prototypes.append(record)
        if not anchors or not prototypes:
            unavailable.append({"candidateId": candidate["candidate_id"],
                               "reason": "select_saved_training_anchor_and_prototype_in_shape_look_in"})
            continue
        anchor = anchors[0]["payload"]
        template = {"uid": anchor_id, "revisions": [
            {"uid": anchor_id, "points": anchor["canonicalPoints"], "colors": [], "symbols": []},
        ]}
        for group in frame.groups:
            if not group.points:
                continue
            matching = match_prototypes(group, [template])
            score = max((item["pixelIou"] for item in matching["candidates"]), default=0.0)
            facts = [{"predicate": "observed_mask_similarity", "args": [group.uid, anchor_id, score]}]
            support = []
            for evidence in candidate["evidence"]:
                provenance = evidence.get("provenance", {})
                if (evidence["outcome"] == "support" and evidence["comparison_complete"] is True
                        and evidence["observation_id"] == group.uid and not evidence["depends_on_candidates"]
                        and not evidence["depends_on_prototypes"]
                        and provenance.get("independentLabel") is True
                        and provenance.get("expectedTemplateMatch") is True
                        and provenance.get("labelOrigin") in {"human_review", "authored_detector", "external_measurement"}
                        and (provenance.get("providerId"), provenance.get("sourceSequenceId"), provenance.get("frameUid"),
                            provenance.get("groupUid"), provenance.get("anchorUid"), provenance.get("sourceImageHash"))
                        == (frame.provider_id, frame.sequence_id, frame.uid, group.uid, anchor_id, source_hash)):
                    support.append(evidence["evidence_id"])
            if support:
                facts.append({"predicate": "independent_group_support", "args": [group.uid]})
            predictions = evaluate_rule(candidate["rule"], kind="grouping", facts=facts,
                                       entity_ids=[*candidate["entity_ids"], group.uid])
            requires_support = any(term.get("predicate") == "independent_group_support"
                                  for term in candidate["rule"]["body"])
            status = ("applied" if predictions else
                      "independent_evidence_required"
                      if requires_support and not support and matching["status"] == "matched" else "no_match")
            applications.append({
                "candidateId": candidate["candidate_id"], "candidateVersion": candidate["version"],
                "ruleRef": candidate["promoted_rule_ref"], "groupUid": group.uid, "anchorUid": anchor_id,
                "status": status, "facts": facts, "predictions": predictions, "matching": matching,
                "evidenceIds": sorted(support), "ruleEngineVersion": engine_version(),
                "anchorReferences": [_memory_reference(record) for record in anchors],
                "prototypeReferences": [_memory_reference(record) for record in prototypes],
                "dependsOnCandidates": [candidate["candidate_id"]],
                "dependsOnPrototypes": sorted({record["payload"]["uid"] for record in prototypes}),
                "authority": "advisory_template_prediction",
            })
    return {"applications": applications, "unavailable": unavailable}


def run_grouping(unit: dict[str, Any], out_dir: Path, options: dict[str, Any]) -> dict[str, Any]:
    from omega_vision.perception.event_records import render_term
    from omega_vision.perception.grouping_learning import observe_grouping
    from omega_vision.perception.grouping_promotion import persist_grouping_candidates
    root, units, index = _context(unit)
    with _memory_access(unit["workspaceId"], unit["sequenceId"], unit.get("_browserMemory"), frame_id=unit["id"]) as access:
        locations, context, volatile = access
        preferences = locations.load_preferences(context)
        _require_generated_session(unit, preferences, ("shape",), locations=locations, context=context)
        frames = [_frame(item) for item in units[:index + 1]]
        result = observe_grouping(
            frames[-1], previous_state=_result(units[index - 1], GROUPING)["checkpoint"] if index else None,
        )
        from omega_vision.perception.memory_locations import NOWHERE
        transient = preferences["shape"]["saveTo"] == NOWHERE
        store = _store(root, unit, require_context=not transient)
        proposals, deferred = _grouping_learning_proposals(result, store.list(kind="grouping"), frames[-1])
        # Final G acceptance and template self-matches are never positive training labels.
        result["persistedCandidates"] = [] if transient else persist_grouping_candidates(
            store, {**result, "candidates": proposals}, training_frames=frames, source_images=_source_images(units, frames),
        )
        if transient:
            result["volatileProposals"] = proposals
        revision = _registry_revision(store, kinds={"grouping"})
        selected = locations.read_selected("shape", preferences["shape"]["lookIn"], context, volatile=volatile)
        if selected["errors"]:
            raise ValidationError("Selected Shape memory is unavailable: " + json.dumps(selected["errors"]))
        result["templateInference"] = _apply_grouping_templates(
            unit, frames[-1], store.list(kind="grouping", status="promoted"), selected["records"],
            memory_context=context,
        )
        result["deferredCandidates"] = deferred
        result["registryRevision"] = revision
        predictions = [term for row in result["templateInference"]["applications"] for term in row["predictions"]]
        entities = [group.uid for group in frames[-1].groups] + [
            row["anchorUid"] for row in result["templateInference"]["applications"]
        ]
        for observation in result["observations"]:
            observation["appliedTemplates"] = [
                {"candidateId": row["candidateId"], "anchorUid": row["anchorUid"],
                 "dependsOnPrototypes": row["dependsOnPrototypes"]}
                for row in result["templateInference"]["applications"]
                if row["groupUid"] == observation["groupUid"] and row["status"] == "applied"
            ]
        with _registry_publication(store, revision):
            records = _save_generated_records(
                access, preferences, "shape", [*result["checkpoint"]["anchors"], *result["checkpoint"]["prototypes"]],
                frames[-1].uid, GROUPING,
            )
            return _emit(unit, out_dir, result, schema="adaptive_grouping",
                        transient_step=GROUPING if _transient_output(unit, GROUPING, preferences) else None,
                        facts=sorted({render_term(term, entity_ids=entities) + "." for term in predictions}),
                        summary={"authority": "advisory", "prototypeCount": len(result["checkpoint"]["prototypes"]),
                                 "candidateCount": len(result["persistedCandidates"]),
                                 "appliedTemplateCount": len(predictions), "registryRevision": revision,
                                 "unavailableTemplateCount": len(result["templateInference"]["unavailable"]),
                                 "memory": {"shape": _memory_write_summary(preferences, "shape", records)}})


def run_events(unit: dict[str, Any], out_dir: Path, options: dict[str, Any]) -> dict[str, Any]:
    from omega_vision.perception.event_deduction import (
        accepted_detectors, deduce_pair_events, deduce_sequence, initial_event_state, log_frame,
    )
    from omega_vision.perception.event_records import render_term
    root, units, index = _context(unit)
    store = _store(root, unit, require_context=False)
    registry_revision = _registry_revision(store, kinds=EVENT_RULE_KINDS)
    frame = _frame(units[index])
    objects = _result(units[index], OBJECTS)
    attachment_context = _attachment_context(units[index], frame, objects)
    if index == 0:
        state = initial_event_state(frame, temporal_state=_result(units[index], TEMPORAL)["checkpoint"],
                                    objects=objects, attachment_context=attachment_context)
        result = {"assessment": "initial_observation", "reason": "no_predecessor",
                  "checkpoint": state, "frame": log_frame(frame, state),
                  "accepted_detectors": accepted_detectors(), "entity_ids": state["entity_ids"]}
    else:
        previous = _result(units[index - 1], EVENTS)
        if previous.get("registryRevision") != registry_revision:
            prefix = units[:index + 1]
            prefix_frames = [_frame(item) for item in prefix]
            prefix_objects = [_result(item, OBJECTS) for item in prefix]
            replay = deduce_sequence(
                prefix_frames, [_result(item, TEMPORAL) for item in prefix[1:]],
                object_results=prefix_objects, candidate_store=store,
                attachment_contexts=[_attachment_context(item, current, obj)
                                     for item, current, obj in zip(prefix, prefix_frames, prefix_objects)],
            )
            result = replay["pair_results"][-1]
            before_frame = replay["frames"][-2]
        else:
            result = deduce_pair_events(
                _frame(units[index - 1]), frame, _result(units[index], TEMPORAL),
                previous_state=previous["checkpoint"],
                objects=objects, candidate_store=store, attachment_context=attachment_context,
            )
            before_frame = previous["frame"]
        from omega_vision.perception.event_induction import replay_promoted_transitions
        from omega_vision.perception.visual_event_log import normalize_actions
        pair_frames = [before_frame, result["frame"]]
        actions, actors = _recorded_actions(units[index - 1:index + 1], pair_frames)
        aligned = normalize_actions(actions, frames=pair_frames, sequence_id=unit["sequenceId"], actor_ids=actors)
        pair_actions = [
            term for action in aligned if not action["boundary"] for term in action["normalized"]
        ]
        result["predictions"] = replay_promoted_transitions(
            store, [*result["facts"], *(event["term"] for event in result["assessment"]["events"]), *pair_actions],
            entity_ids=sorted(set(result["entity_ids"]) | set(actors)),
            scope_context={"domain": "visual-sequence", "provider_id": frame.provider_id, "sequence_id": frame.sequence_id},
            source_order=frame.order,
        )
        result["assessment"]["provenance"]["candidate_registry"] = registry_revision
    result["registryRevision"] = registry_revision
    events = result["assessment"].get("events", []) if isinstance(result["assessment"], dict) else []
    facts = [
        f"frame_event({_prolog_atom(result['frame']['id'])},"
        f"{render_term(event['term'], entity_ids=result['entity_ids'])},{float(event['confidence'])})."
        for event in events
    ]
    with _registry_publication(store, registry_revision):
        return _emit(unit, out_dir, result, schema="prolog_event_deductions", facts=facts,
                     summary={"authority": "authored_and_accepted_prolog", "eventCount": len(events),
                              "registryRevision": registry_revision})


def _recording_input_paths(unit: Mapping[str, Any]) -> dict[str, Path]:
    source = Path(unit.get("sourceImage") or unit["image"])
    directory = Path(unit["sequenceRoot"])
    paths = {"provenance": _safe(directory, _api()._image_provenance_path(source))}
    # A flat image pool's shared state.json does not identify any individual frame.
    if source.name == "image.png":
        paths["state"] = _safe(directory, source.parent / "state.json")
        metadata_path = source.parent / "observation_metadata.json"
        resolved = _safe(directory, metadata_path)
        if resolved != metadata_path:
            raise PermissionError("Observation metadata path was redirected")
        paths["observationMetadata"] = resolved
    return {kind: path for kind, path in paths.items() if path.is_file()}


def _observation_metadata(unit: Mapping[str, Any]) -> tuple[dict[str, Any] | None, dict[str, str]]:
    """Only explicit acquisition attestations, never fixture roles or world state."""
    from omega_vision.perception.measured_event_features import validate_observation_metadata

    paths = _recording_input_paths(unit)
    if not paths:
        return None, {}
    values, hashes, references = {}, {}, {}
    state = {}
    allowed = {"at_seconds", "clock_id", "coordinate_frame_id", "viewport_complete"}
    for kind, path in paths.items():
        raw = path.read_bytes()
        document = json.loads(raw)
        if not isinstance(document, dict):
            raise ValidationError("Recorded observation metadata must contain an object")
        hashes["recordingInput:" + kind] = content_hash(raw)
        reference = _api()._workspace_relative(Path(unit["workspaceRoot"]), path)
        references[kind] = reference
        if kind == "state":
            state = document
        attestation = document if kind == "observationMetadata" else document.get("observation_metadata")
        if attestation is None:
            continue
        if not isinstance(attestation, dict) or set(attestation) - allowed:
            raise ValidationError("Only acquisition timing, coordinate-frame and viewport attestations are accepted")
        for key, value in attestation.items():
            if key in values and values[key] != value:
                raise ValidationError("Conflicting recorded acquisition attestations")
            values[key] = value
    if "clock_id" in values and "at_seconds" not in values and "at_seconds" in state:
        values["at_seconds"] = state["at_seconds"]
    if "at_seconds" in values and "at_seconds" in state and values["at_seconds"] != state["at_seconds"]:
        raise ValidationError("Acquisition attestation disagrees with the recorded frame time")
    primary = "observationMetadata" if "observationMetadata" in paths else "state" if "state" in paths else "provenance"
    metadata = {**values, "source_ref": references[primary], "source_hash": hashes["recordingInput:" + primary]}
    validate_observation_metadata(metadata)
    return metadata, hashes


def _imported_source(unit: Mapping[str, Any]) -> dict[str, Any] | None:
    provenance = unit.get("sourceProvenance") or {}
    if provenance.get("operation") != "import_arc_playback_frame":
        return None
    source = provenance.get("source")
    if (not isinstance(source, dict) or not isinstance(source.get("arcRecording"), str)
            or not source["arcRecording"] or type(source.get("frameIndex")) is not int):
        raise ValidationError("Imported ARC provenance requires its recording identity and original frame index")
    return source


def _sample_advance(state: Mapping[str, Any], action: Any) -> bool:
    return state.get("kind") == "synthetic_event_test_frame" and action == "FRAME"


def _recorded_actions(units: list[dict[str, Any]], frames: list[dict[str, Any]]) -> tuple[list[dict[str, Any]], list[str]]:
    """Preserve explicit provider direction; missing original frames are not adjacent actions."""
    actions, actor_ids = [], set()
    for index, (unit, frame) in enumerate(zip(units, frames)):
        paths = _recording_input_paths(unit)
        state = _json(paths["state"]) if "state" in paths else {}
        imported = _imported_source(unit)
        records = []
        if imported is not None and imported.get("incomingAction") is not None:
            path = paths.get("provenance")
            if path is None or _json(path) != unit["sourceProvenance"]:
                raise ConflictError("Imported action provenance changed; reload the sequence")
            if index:
                previous = _imported_source(units[index - 1])
                if (previous is None or previous["arcRecording"] != imported["arcRecording"]
                        or previous["frameIndex"] + 1 != imported["frameIndex"]):
                    raise ValidationError("Recorded incoming action crosses missing or different original ARC frames")
            action, data = imported["incomingAction"], imported.get("actionData")
            timestamp = imported.get("recorded_at")
            moves = imported.get("moveList")
            if (isinstance(moves, list) and moves and imported.get("moveCount") == len(moves)
                    and imported["frameIndex"] == len(moves)):
                last = moves[-1]
                if (not isinstance(last, dict) or last.get("action") != action
                        or last.get("data") is not None and data is not None and last["data"] != data):
                    raise ValidationError("Imported incoming action contradicts its recorded move")
                recorded_at = last.get("recorded_at")
                if timestamp is not None and recorded_at is not None and timestamp != recorded_at:
                    raise ValidationError("Imported action has contradictory recorded timestamps")
                timestamp = timestamp if timestamp is not None else recorded_at
            if state.get("incoming_action") is not None and (
                state["incoming_action"] != action or state.get("action_data") != data
            ):
                raise ValidationError("Node state and imported provenance disagree on the incoming action")
            records.append(("incoming", action, imported, timestamp, path,
                            "import_arc_playback_frame.source.incomingAction"))
        for direction in ("incoming", "outgoing"):
            field = f"{direction}_action"
            raw = state.get(field)
            if raw is None or _sample_advance(state, raw) or state.get("kind") in {"video_import_frame", "image_set_frame"}:
                continue
            if direction == "incoming" and imported is not None and imported.get("incomingAction") is not None:
                continue
            records.append((direction, raw, state, state.get("recorded_at"), paths["state"], field))
        for direction, raw, payload, timestamp, path, contract in records:
            if not isinstance(raw, str) or not raw.strip():
                raise ValidationError("Recorded action must be a nonempty name")
            actor = "recorded-input-" + content_hash([
                unit["providerId"], imported["arcRecording"] if imported else unit["sequenceId"],
            ])
            actor_ids.add(actor)
            actions.append({
                "frame_id": frame["id"], "direction": direction, "provider_direction": direction,
                "normalized": [{"predicate": "user_input", "args": [actor, raw]}],
                "raw_payload": payload, "order": 0, "timestamp": timestamp,
                "provenance": {
                    "recording_source": _api()._workspace_relative(Path(unit["workspaceRoot"]), path),
                    "provider": unit["providerId"], "source_hash": content_hash(path.read_bytes()),
                    "direction_contract": contract, "actor_role": "recorded_input_channel_not_visual_entity",
                },
            })
    return actions, sorted(actor_ids)


def _event_log(root: Path, sequence_id: str, **kwargs):
    from omega_vision.perception.visual_event_log import VisualSequenceEventLog
    root = _api()._vision_data_root(root)
    log = VisualSequenceEventLog(root, sequence_id, **kwargs)
    _safe(root, log.path)
    _safe(root, log.hypothesis_journal.path)
    return log


def _verified_existing_tail(log, existing, replay, actions, actors, registry_revision):
    """Verify an internal prefix, returning the unmodified full signed snapshot."""
    from omega_vision.perception.visual_event_log import _build, _frame as normalize_log_frame, normalize_actions
    count = len(replay["frames"])
    stored = existing["inputs"]
    if count >= len(stored["frames"]):
        return None
    frames = [normalize_log_frame(frame, index) for index, frame in enumerate(replay["frames"])]
    frame_ids = {frame["id"] for frame in frames}
    stored_actions = [action for action in stored["actions"] if action["frame_id"] in frame_ids]
    if (frames != stored["frames"][:count]
            or replay["assessments"] != stored["assessments"][:count - 1]
            or actions != stored_actions):
        return None
    # A first-frame prefix has no pair on which to observe a detector change.
    # Check the recorded detector semantics, without re-deducing the future tail.
    if any(
        assessment["provenance"].get("detector_version") != replay["checkpoint"]["detector_version"]
        or assessment["provenance"].get("candidate_registry") != registry_revision
        for assessment in stored["assessments"]
    ):
        return None
    normalized_actions = normalize_actions(
        actions, frames=frames, sequence_id=log.sequence_id, actor_ids=actors,
    )
    entries = _build(log.sequence_id, frames, replay["assessments"], normalized_actions, replay["accepted_detectors"])
    # Outgoing actions at this prefix boundary are already linked to the next
    # stored frame. Their raw payloads were checked above; do not sign a new tail.
    settled = [entry for entry in entries if not (
        entry["kind"] == "user_action" and entry["to_frame"] is None
    )]
    if settled != existing["entries"][:len(settled)]:
        return None
    with log.journal.transaction() as records:
        if not records or records[-1]["payload"] != existing:
            raise ConflictError("Canonical head changed during prefix verification; retry")
        return {**existing, "executionScope": {
            "requestedFrameIds": [frame["id"] for frame in frames],
            "requestedFrameCount": count, "canonicalFrameCount": len(stored["frames"]),
            "reusedExistingTail": True,
        }}


def _replay(root: Path, units: list[dict[str, Any]], *,
            expected_generation: int | None = None, supersede: bool = False,
            registry_revision: Mapping[str, Any] | None = None,
            reuse_existing_tail: bool = False) -> dict[str, Any]:
    from omega_vision.perception.event_deduction import deduce_sequence
    if not units or not units[0]["sequenceOrdered"]:
        raise ValidationError("Canonical replay requires an ordered sequence")
    store = _store(root, units[-1], require_context=False)
    if hasattr(store, "context") and any(item["id"] != store.context.moments[index].frame_id for index, item in enumerate(units)):
        raise ValidationError("Replay frame order disagrees with the explicit recording manifest")
    registry_revision = (dict(registry_revision) if registry_revision is not None
                         else _registry_revision(store, kinds=EVENT_RULE_KINDS))
    frames = [_frame(item) for item in units]
    objects = [_result(item, OBJECTS) for item in units]
    replay = deduce_sequence(
        frames, [_result(item, TEMPORAL) for item in units[1:]],
        object_results=objects, candidate_store=store,
        attachment_contexts=[_attachment_context(item, frame, obj) for item, frame, obj in zip(units, frames, objects)],
    )
    actions, actors = _recorded_actions(units, replay["frames"])
    log = _event_log(root, units[0]["sequenceId"], accepted_detectors=replay["accepted_detectors"], actor_ids=actors)
    with _registry_publication(store, registry_revision):
        try:
            existing = log.read()
        except KeyError:
            existing = None
        prior = {(item["from_frame"], item["to_frame"]): item
                 for item in (existing or {}).get("inputs", {}).get("assessments", [])}
        for assessment in replay["assessments"]:
            previous = prior.get((assessment["from_frame"], assessment["to_frame"]))
            without_capture = lambda item: {
                **item, "provenance": {key: value for key, value in item["provenance"].items()
                                      if key != "candidate_registry"},
            }
            if previous is not None and without_capture(previous) == without_capture(assessment):
                # Preserve the original audit receipt for an unchanged historical proof.
                if "candidate_registry" in previous["provenance"]:
                    assessment["provenance"]["candidate_registry"] = previous["provenance"]["candidate_registry"]
            else:
                assessment["provenance"]["candidate_registry"] = registry_revision
        if reuse_existing_tail and existing is not None and not supersede and expected_generation is None:
            receipt = _verified_existing_tail(log, existing, replay, actions, actors, registry_revision)
            if receipt is not None:
                return receipt
        return log.replay(
            replay["frames"], replay["assessments"],
            actions=actions, expected_generation=expected_generation, supersede=supersede,
        )


def run_log(unit: dict[str, Any], out_dir: Path, options: dict[str, Any]) -> dict[str, Any]:
    root, units, index = _context(unit)
    store = _store(root, unit, require_context=False)
    registry_revision = _registry_revision(store, kinds=EVENT_RULE_KINDS)
    result = _replay(root, units[:index + 1], registry_revision=registry_revision, reuse_existing_tail=True)
    with _registry_publication(store, registry_revision):
        return _emit(unit, out_dir, result, schema="canonical_visual_event_log",
                     summary={"authority": "canonical", "generation": result["generation"],
                              "registryRevision": registry_revision,
                              **({"executionScope": result["executionScope"]} if "executionScope" in result else {}),
                              "eventCount": sum(entry["kind"] == "frame_event" for entry in result["entries"])})


def _examples(root: Path, units: list[dict[str, Any]], partition: str) -> tuple[list[dict[str, Any]], dict[str, Any]]:
    from omega_vision.perception.event_deduction import deduce_sequence
    from omega_vision.perception.event_induction import example_from_deduction
    from omega_vision.perception.grouping_promotion import sequence_source_fingerprint
    from omega_vision.perception.visual_event_log import normalize_actions

    if not units or not units[0]["sequenceOrdered"]:
        raise ValidationError("Learning requires an ordered sequence")
    frames = [_frame(unit) for unit in units]
    fingerprint, hashes = sequence_source_fingerprint(frames, _source_images(units, frames))
    # Recompute authored labels WITHOUT the learned candidate store: predictions
    # under evaluation cannot grade themselves through the canonical event log.
    objects = [_result(unit, OBJECTS) for unit in units]
    replay = deduce_sequence(
        frames, [_result(unit, TEMPORAL) for unit in units[1:]],
        object_results=objects,
        attachment_contexts=[_attachment_context(unit, frame, obj) for unit, frame, obj in zip(units, frames, objects)],
    )
    actions, actors = _recorded_actions(units, replay["frames"])
    aligned = normalize_actions(actions, frames=replay["frames"], sequence_id=units[0]["sequenceId"], actor_ids=actors)
    examples = []
    for deduction in replay["pair_results"]:
        matching = [action for action in aligned if
                    (action["from_frame"], action["to_frame"]) ==
                    (deduction["source_pair"]["from_frame"], deduction["source_pair"]["to_frame"])]
        deduction = dict(deduction)
        deduction["entity_ids"] = sorted(set(deduction["entity_ids"]) | set(actors))
        example = example_from_deduction(
            deduction, sequence_fingerprint=fingerprint, partition=partition,
            actions=[term for action in matching for term in action["normalized"]],
        )
        examples.append(example)
    training = {"sequenceId": units[0]["sequenceId"], "sequenceFingerprint": fingerprint,
                "sourceImageHashes": sorted(set(hashes.values())), "providerId": units[0]["providerId"]}
    return examples, training


def _training(candidate: Mapping[str, Any]) -> list[dict[str, Any]]:
    return [source for proposal in candidate["proposals"]
            for source in proposal["provenance"].get("semanticTraining", [])]


def _overlaps(left: Mapping[str, Any], right: Mapping[str, Any]) -> bool:
    return (left["sequenceId"] == right["sequenceId"] or
            left["sequenceFingerprint"] == right["sequenceFingerprint"] or
            bool(set(left["sourceImageHashes"]) & set(right["sourceImageHashes"])))


def _record_training(store: CandidateRuleStore, candidates: list[dict[str, Any]], sources: list[dict[str, Any]]) -> None:
    if not sources:
        return
    for candidate in candidates:
        # Reclassify earlier held-out credit before a proposal acquires its sources.
        current = store.get(candidate["candidate_id"])
        for evidence in current["evidence"]:
            if evidence["partition"] == "held_out" and any(
                evidence["sequence_id"] == source["sequenceId"]
                or evidence["sequence_fingerprint"] == source["sequenceFingerprint"] for source in sources
            ):
                revised = {key: value for key, value in evidence.items() if key not in {"evidence_id", "evidence_kind"}}
                revised["partition"] = "train"
                store.record_evidence(candidate["candidate_id"], revised)
        store.create(
            candidate["rule"], kind=candidate["kind"], scope=candidate["scope"],
            source="deterministic_induction", provenance={"semanticTraining": sources, "adapterVersion": VERSION},
            inducer_version=candidate["inducer_version"], entity_ids=candidate["entity_ids"],
        )


def run_induction(unit: dict[str, Any], out_dir: Path, options: dict[str, Any]) -> dict[str, Any]:
    from omega_vision.perception.event_induction import induce_detector_rules, induce_transition_rules
    root, units, index = _context(unit)
    examples, training = _examples(root, units[:index + 1], "train")
    store = _store(root, unit)
    scope = {"domain": "visual-sequence", "provider_id": units[index]["providerId"]}
    with writer_lock(_api()._storage_path(root, "runtime", "semantic-learning")):
        detectors = induce_detector_rules(store, examples, scope=scope)
        transitions = induce_transition_rules(store, examples, scope=scope)
        effects = induce_transition_rules(store, examples, scope=scope, kind="action_effect")
        candidates = detectors["candidates"] + transitions["candidates"] + effects["candidates"]
        _record_training(store, candidates, [training])
    result = {"candidateIds": sorted({candidate["candidate_id"] for candidate in candidates}),
              "exampleIds": [example["example_id"] for example in examples],
              "training": training, "authority": "proposals_only", "automaticPromotion": False}
    return _emit(unit, out_dir, result, schema="deterministic_event_rule_proposals",
                 summary={"candidateCount": len(result["candidateIds"]), "authority": "proposals_only"})


def _declares_vision(capabilities: Any) -> bool:
    if isinstance(capabilities, dict):
        return capabilities.get("vision") is True if "vision" in capabilities else capabilities.get("llm.vision") is True
    return isinstance(capabilities, list) and any(item in capabilities for item in ("vision", "llm.vision"))


def _model(root: Path, workspace_id: str, options: Mapping[str, Any]) -> tuple[Any, str, dict[str, Any]]:
    if options.get("confirmModel") is not True:
        raise ValidationError("Explicit model confirmation is required (options.confirmModel=true)")
    from omega_vision.services import video_import_pipeline as pipeline
    state = pipeline.load_state(workspace_id)
    model_id = pipeline._effective_stage_model(state, "semanticEventModel", options.get("modelId"))
    if not model_id:
        raise ValidationError("Select an enabled vision model for semantic events")
    records = pipeline._resolved_model_records(root)
    record = next((item for item in records if (item.get("document") or {}).get("id") == model_id), None)
    resolved = (record or {}).get("resolved") or {}
    if not resolved.get("enabled") or record.get("error"):
        raise ValidationError("Selected semantic vision model is unavailable or disabled")
    inheritance = resolved.get("propertyInheritanceResolution") or {}
    effective = inheritance.get("document")
    capabilities = (effective.get("capabilities") if isinstance(effective, dict)
                    else resolved.get("capabilities", record["document"].get("capabilities")))
    if not _declares_vision(capabilities):
        raise ValidationError("Selected model does not declare enabled vision capability")
    backend_record = resolved.get("backend") or {}
    if not isinstance(backend_record, dict) or backend_record.get("enabled") is False:
        raise ValidationError("Selected model backend is unavailable or disabled")
    if "capabilities" in backend_record and not _declares_vision(backend_record["capabilities"]):
        raise ValidationError("Selected backend does not declare vision capability")
    model_revision = content_hash(resolved)
    if "modelRevision" in options and options["modelRevision"] != model_revision:
        raise ValidationError("Model configuration changed after authorization; review and confirm a new plan")
    parameters = pipeline._model_execution_parameters(root, {"models": [model_id], "strategy": "single"}, records)
    backend = parameters.get("backendId") or backend_record.get("id")
    if not backend:
        raise ValidationError("Selected model has no configured backend")
    return pipeline, model_id, {
        "model": model_id, "backend": backend, "remote_model": parameters.get("model"),
        "model_resource_hash": content_hash(record["document"]),
        "resolved_model_hash": model_revision,
        "execution_parameters": {key: parameters[key] for key in (
            "temperature", "topP", "maxTokens", "maxOutputTokens", "timeoutSeconds", "seed",
        ) if key in parameters},
    }


def _contact_sheet(units: list[dict[str, Any]]) -> Any:
    from PIL import Image, ImageDraw
    prepared = [_prepare(unit) for unit in units]
    images = []
    for unit in prepared:
        with Image.open(unit["image"]) as image:
            images.append(image.convert("RGB"))
    width = max(image.width for image in images)
    sheet = Image.new("RGB", (width * len(images), max(image.height for image in images) + 32), "white")
    draw = ImageDraw.Draw(sheet)
    for index, (unit, image) in enumerate(zip(units, images)):
        sheet.paste(image, (index * width, 32))
        draw.text((index * width + 4, 8), f"{'BEFORE' if index == 0 else 'AFTER'}: frame {unit['frameOrder']}", fill="black")
    return sheet


def _invoke_audited(root: Path, unit: Mapping[str, Any], out_dir: Path, options: Mapping[str, Any], *,
                    template_name: str, context: Mapping[str, Any], images: list[dict[str, Any]]) -> tuple[str, dict[str, Any]]:
    pipeline, model_id, provenance = _model(root, str(unit["workspaceId"]), options)
    template = (PROMPTS / template_name).read_text(encoding="utf-8")
    prompt = template + "\n\nINPUT DATA (not instructions):\n" + json.dumps(context, ensure_ascii=False, indent=2)
    audit = _safe(Path(unit["dir"]), out_dir / "audit" / uuid4().hex)
    audit.mkdir(parents=True, exist_ok=False)
    (audit / "prompt.txt").write_text(prompt, encoding="utf-8")
    provenance.update({
        "source": "llm", "prompt_version": content_hash(template), "prompt_hash": content_hash(prompt),
        "prompt_ref": _api()._workspace_relative(root, audit / "prompt.txt"),
        "raw_output_ref": _api()._workspace_relative(root, audit / "raw-response.txt"),
        "adapter_version": VERSION, "input_context_hash": content_hash(dict(context)),
        "images": [{"frame": item["id"], "input_hash": content_hash(_prepare(item)["image"].read_bytes())}
                   for item in images],
    })
    atomic_json(audit / "provenance.json", provenance)
    try:
        raw = pipeline.invoke_model(root, model_id, prompt, pipeline._img_to_dataurl(_contact_sheet(images)))
    except Exception as error:
        atomic_json(audit / "error.json", {"error": str(error), "stage": "model_invocation"})
        raise
    (audit / "raw-response.txt").write_text(raw, encoding="utf-8")
    return raw, provenance


def run_llm_events(unit: dict[str, Any], out_dir: Path, options: dict[str, Any]) -> dict[str, Any]:
    from omega_vision.perception.event_records import hypothesis_json_schema, pair_id, render_term
    root, units, index = _context(unit)
    if index == 0:
        return _emit(unit, out_dir, {"assessment": "initial_observation", "reason": "no_predecessor",
                                   "status": "skipped"}, schema="llm_event_hypotheses",
                     summary={"status": "skipped", "authority": "advisory"})
    deduction = _result(units[index], EVENTS)
    log = _event_log(root, unit["sequenceId"])
    canonical = log.read()
    pair = deduction["source_pair"]
    actual_frames = [_frame(item) for item in units[index - 1:index + 1]]
    if pair != {
        "sequence_id": unit["sequenceId"], "from_frame": actual_frames[0].uid, "to_frame": actual_frames[1].uid,
        "before_hash": content_id("frame-input", dict(actual_frames[0].source_hashes)),
        "after_hash": content_id("frame-input", dict(actual_frames[1].source_hashes)),
    }:
        raise ValidationError("Event deduction no longer describes the actual preprocessed frame pair")
    if not any(entry["kind"] == "transition_assessment" and entry["pair_id"] == pair_id(pair)
               for entry in canonical["entries"]):
        raise ValidationError("Replay the canonical log for this pair before requesting hypotheses")
    active = {}
    known = sorted({entity for frame in canonical["inputs"]["frames"] for entity in frame["entity_ids"]})
    for entry in canonical["entries"]:
        if entry["kind"] == "transition_assessment" and entry["pair_id"] == pair_id(pair):
            break
        if entry["kind"] == "frame_assessment":
            active.update(entry["baseline_episodes"])
        elif entry["kind"] == "frame_event" and entry["term"]["predicate"] in {"start", "continue", "end"}:
            relation = render_term(entry["term"]["args"][0], entity_ids=known)
            if entry["term"]["predicate"] == "end":
                active.pop(relation, None)
            else:
                active[relation] = entry["episode_id"]
    actions = [entry for entry in canonical["entries"] if entry["kind"] == "user_action" and
               (entry["from_frame"], entry["to_frame"]) == (pair["from_frame"], pair["to_frame"])]
    context = {
        "source_pair": pair, "entity_ids": deduction["entity_ids"],
        "entity_alignment": deduction["checkpoint"]["observation_tracks"],
        "active_episodes_before_pair": active,
        "schema": hypothesis_json_schema(deduction["entity_ids"]),
        "frames": [
            {"id": _frame(item).uid, "order": item["frameOrder"],
             "observation_bundle": _json(_artifact(item, IDENTITY, "observations.json")),
             "turtle_facts": _artifact(item, TURTLE, "result.pl").read_text(encoding="utf-8")}
            for item in units[index - 1:index + 1]
        ],
        "aligned_recorded_actions": actions,
        "action_note": "No action direction or visual actor is inferred from image changes.",
    }
    raw, provenance = _invoke_audited(
        root, unit, out_dir, options, template_name="semantic_event_deduction.txt",
        context=context, images=units[index - 1:index + 1],
    )
    result = log.record_hypotheses(raw, source_pair=pair, provenance=provenance,
                                   entity_ids=deduction["entity_ids"], active_episodes=active)
    return _emit(unit, out_dir, result, schema="llm_event_hypotheses",
                 summary={"authority": "advisory", "hypothesisCount": len(result["parsed"]["events"]),
                          "model": provenance["model"], "rawResponseArtifact": provenance["raw_output_ref"]})


def run_llm_induction(unit: dict[str, Any], out_dir: Path, options: dict[str, Any]) -> dict[str, Any]:
    from omega_vision.perception.event_induction import ingest_llm_rule_proposals
    from omega_vision.perception.event_records import PREDICATES
    root, units, index = _context(unit)
    store = _store(root, unit)
    if index == 0:
        return _emit(unit, out_dir, {"status": "skipped", "reason": "no_predecessor"},
                     schema="llm_event_rule_proposals", summary={"status": "skipped"})
    examples, training = _examples(root, units[:index + 1], "train")
    known = sorted({entity for example in examples for entity in example["entity_ids"]})
    context = {
        "examples": examples, "scope": {"domain": "visual-sequence", "provider_id": units[index]["providerId"]},
        "entity_ids": known, "predicate_signatures": {key: asdict(value) for key, value in PREDICATES.items()},
        "hypotheses": _event_log(root, unit["sequenceId"]).hypotheses(),
    }
    raw, provenance = _invoke_audited(root, unit, out_dir, options, template_name="semantic_event_induction.txt",
                                    context=context, images=units[index - 1:index + 1])
    provenance["semanticTraining"] = [training]
    with writer_lock(_api()._storage_path(root, "runtime", "semantic-learning")):
        candidates = ingest_llm_rule_proposals(store, raw, provenance=provenance, entity_ids=known, inducer_version=VERSION)
        _record_training(store, candidates, [training])
    return _emit(unit, out_dir, {"candidateIds": [candidate["candidate_id"] for candidate in candidates],
                                "provenance": provenance, "authority": "proposals_only"},
                 schema="llm_event_rule_proposals", summary={"candidateCount": len(candidates), "authority": "proposals_only"})


def register_transforms(registry: dict, metadata: dict) -> None:
    current = [IDENTITY, PARTS, GROUPS, ACCEPTANCE]
    definitions = [
        (TEMPORAL, run_temporal, current + [f"frame[-1]@{TEMPORAL}", f"frame[-1]@{IDENTITY}"], current, "py_pl", 50, False),
        (OBJECTS, run_objects, [TEMPORAL, f"frame[-1]@{OBJECTS}"], [TEMPORAL], "py_pl", 60, False),
        (GROUPING, run_grouping, [TEMPORAL, f"frame[-1]@{GROUPING}"], [TEMPORAL], "py_pl", 65, False),
        (EVENTS, run_events, [TEMPORAL, OBJECTS, f"frame[-1]@{EVENTS}"], [TEMPORAL, OBJECTS], "py_pl", 70, False),
        (LOG, run_log, [EVENTS, f"frame[-1]@{LOG}"], [EVENTS], "py_pl", 80, False),
        (INDUCTION, run_induction, [LOG], [LOG], "py_pl", 90, False),
        (LLM_EVENTS, run_llm_events, [LOG, TURTLE, f"frame[-1]@{TURTLE}"], [], "llm", 100, True),
        (LLM_RULES, run_llm_induction, [LOG], [], "llm", 110, True),
    ]
    for step, runner, dependencies, bootstrap, kind, priority, skip in definitions:
        key = tuple(step.split("/"))
        registry[key] = runner
        metadata[key] = {
            "dependsOn": dependencies, "firstFrameDependsOn": bootstrap, "skipFirstFrame": skip,
            "orderedOnly": True, "type": kind, "priority": priority, "options": {},
        }
    from .recording_test_observers import register_transforms as register_observers
    register_observers(registry, metadata)
    from .two_frame_x_duction import register_transforms as register_parent
    register_parent(registry, metadata)
    from .recognition_object_resolution import register_transforms as register_resolvers
    register_resolvers(registry, metadata)


def _implementation_revision(step: str) -> dict[str, Any]:
    """Pure producer versions, using the same inputs as their checkpoint seals."""
    if step == PARTS:
        import inspect
        from omega_vision.perception import pixels_to_regions, pixels_to_regions_cv
        return {
            "sources": {module.__name__: content_hash(Path(module.__file__).read_bytes())
                        for module in (pixels_to_regions, pixels_to_regions_cv)},
            "adapter": content_hash(inspect.getsource(_api()._transform_parts_extraction_cv)),
        }
    if step == TEMPORAL:
        from omega_vision.perception import temporal_correspondence
        return {"version": temporal_correspondence.VERSION,
                "sources": temporal_correspondence.implementation_hashes(),
                "frameAdapter": content_hash(Path(__file__).read_bytes())}
    if step == OBJECTS:
        from omega_vision.perception import object_evidence, object_tracking
        return {
            "version": object_tracking.VERSION, "evidenceVersion": object_evidence.VERSION,
            "sources": {module.__name__: content_hash(Path(module.__file__).read_bytes())
                        for module in (object_tracking, object_evidence)},
            "rules": object_tracking._rule_hashes(),
            "frameAdapter": content_hash(Path(__file__).read_bytes()),
        }
    if step == EVENTS:
        from omega_vision.perception import event_deduction
        return {"authoredDetectors": event_deduction.implementation_version(),
                "frameAdapter": content_hash(Path(__file__).read_bytes())}
    return {}


def runtime_revision(unit: Mapping[str, Any], step: str | tuple[str, str]) -> str | None:
    """Read the mutable rule/selection inputs before task staleness and confirmation checks."""
    composite = "/".join(step) if isinstance(step, tuple) else step
    from omega_vision.services import recognition_object_resolution
    if recognition_object_resolution.is_resolver(composite):
        return recognition_object_resolution.runtime_revision(unit, composite)
    from omega_vision.services import two_frame_x_duction
    if two_frame_x_duction.is_parent(composite):
        return two_frame_x_duction.runtime_revision(unit, composite)
    from omega_vision.services import video_import_abduction
    if composite == video_import_abduction.STEP:
        return video_import_abduction.runtime_revision(unit)
    if composite == INDUCTION:
        from omega_vision.perception.event_induction import engine_version
        return content_hash({"stage": composite, "engine": engine_version(),
                             "adapter": content_hash(Path(__file__).read_bytes())})
    if composite in {PARTS, TEMPORAL}:
        revision = {"stage": composite, "implementation": _implementation_revision(composite)}
        if composite == TEMPORAL:
            revision["recordedInputs"] = {
                kind: content_hash(path.read_bytes()) for kind, path in _recording_input_paths(unit).items()
            }
        return content_hash(revision)
    if composite not in {EVENTS, GROUPING, OBJECTS}:
        return None
    root = _workspace(str(unit.get("workspaceId") or ""))
    revision: dict[str, Any] = {"adapter": VERSION, "stage": composite}
    if composite in {OBJECTS, EVENTS}:
        revision["implementation"] = _implementation_revision(composite)
    if composite == GROUPING:
        from omega_vision.perception import event_induction, grouping_learning, grouping_promotion
        revision["groupingImplementation"] = {
            module.__name__: content_hash(Path(module.__file__).read_bytes())
            for module in (grouping_learning, grouping_promotion, event_induction)
        }
        revision["groupingApplication"] = content_hash(Path(__file__).read_bytes())
    kinds = ({"event_detector", "event_transition", "action_effect"} if composite == EVENTS
             else {"grouping"} if composite == GROUPING else set())
    if kinds:
        from omega_vision.perception.event_induction import engine_version
        store = _store(root, unit, require_context=False)
        revision["registryStore"] = str(store.path.resolve())
        revision["ruleContextUnavailable"] = getattr(store, "context_unavailable", None)
        revision["ruleEngineVersion"] = engine_version()
        promoted = [candidate for candidate in store.list(status="promoted")
                    if candidate["kind"] in kinds]
        revision["promotedRules"] = effective_promoted_semantics(promoted)
    if composite == EVENTS:
        revision["recordedInputs"] = {
            kind: content_hash(path.read_bytes()) for kind, path in _recording_input_paths(unit).items()
        }
    if composite in {OBJECTS, GROUPING}:
        from omega_vision.perception.memory_locations import NOWHERE
        locations, context = _memory(unit["workspaceId"], unit.get("sequenceId"), frame_id=unit.get("id"))
        preferences = locations.load_preferences(context)
        memory_kinds = ("shape", "object") if composite == OBJECTS else ("shape",)
        selections = {kind: {key: preferences[kind][key] for key in ("saveTo", "lookIn")}
                      for kind in memory_kinds}
        revision["memorySelections"] = selections
        if any(selection["saveTo"] == NOWHERE or NOWHERE in selection["lookIn"]
               for selection in selections.values()):
            token = unit.get("memorySessionId")
            revision["volatileSession"] = {"id": token}
        if composite == GROUPING and promoted:
            state = unit.get("_browserMemory")
            selected = locations.read_selected("shape", preferences["shape"]["lookIn"], context,
                                               volatile=state.memory if state else None)
            revision["selectedTemplates"] = _selected_template_revision(promoted, selected["records"])
            revision["selectionErrors"] = selected["errors"]
    return content_hash(revision)


def _http(function):
    @wraps(function)
    def guarded(*args, **kwargs):
        headers = {"Cache-Control": "no-store"}
        try:
            return function(*args, **kwargs)
        except HTTPException as error:
            error.headers = {**(error.headers or {}), **headers}
            raise
        except PermissionError as error:
            raise HTTPException(403, str(error), headers=headers) from error
        except (FileNotFoundError, KeyError) as error:
            raise HTTPException(404, str(error), headers=headers) from error
        except ConflictError as error:
            raise HTTPException(409, str(error), headers=headers) from error
        except IntegrityError as error:
            raise HTTPException(409, f"Stored semantic data failed integrity checks: {error}", headers=headers) from error
        except (ValueError, TypeError) as error:
            raise HTTPException(422, str(error), headers=headers) from error
        except (OSError, RuntimeError) as error:
            raise HTTPException(503, str(error), headers=headers) from error
    return guarded


def _fields(body: dict[str, Any], required: set[str], optional: set[str] | None = None) -> None:
    if not isinstance(body, dict):
        raise ValidationError("Request must be an object")
    if required - body.keys():
        raise ValidationError("Missing required request fields: " + ", ".join(sorted(required - body.keys())))
    extra = body.keys() - required - (optional or set())
    if extra:
        raise ValidationError("Unsupported request fields: " + ", ".join(sorted(extra)))


def _gates(body: Mapping[str, Any]) -> PromotionGates:
    allow = body.get("allowLlmPromotion", False)
    if type(allow) is not bool:
        raise ValidationError("allowLlmPromotion must be an explicit boolean")
    return PromotionGates(allow_llm=allow)


@router.get("/candidates")
@_http
def candidates(workspaceId: str, response: Response, kind: str | None = None, status: str | None = None,
               sequenceId: str | None = None, frameId: str | None = None, proposalFrameId: str | None = None):
    response.headers["Cache-Control"] = "no-store"
    root = _workspace(workspaceId)
    store = _candidate_read_store(workspaceId, sequenceId, frameId, proposalFrameId)
    return {"candidates": store.list(kind=kind, status=status),
            "storageStatus": "contextual" if sequenceId else "legacy_read_only_migration_required",
            "unavailableStorage": _api().unavailable_legacy_storage(root)}


@router.get("/candidates/{candidate_id}")
@_http
def candidate_detail(candidate_id: str, workspaceId: str, response: Response,
                     sequenceId: str | None = None, frameId: str | None = None, proposalFrameId: str | None = None):
    response.headers["Cache-Control"] = "no-store"
    return _candidate_read_store(workspaceId, sequenceId, frameId, proposalFrameId).get(candidate_id)


@router.get("/candidates/{candidate_id}/evidence")
@_http
def candidate_evidence(candidate_id: str, workspaceId: str, response: Response,
                       sequenceId: str | None = None, frameId: str | None = None, proposalFrameId: str | None = None):
    response.headers["Cache-Control"] = "no-store"
    candidate = _candidate_read_store(workspaceId, sequenceId, frameId, proposalFrameId).get(candidate_id)
    return {"candidateId": candidate_id, "evidence": candidate["evidence"], "evaluations": candidate["evaluations"]}


def _causal_evaluation_units(store, units):
    context = getattr(store, "context", None)
    if context is None or Path(units[0]["sequenceRoot"]).resolve() != context.directory:
        return units
    orders = {moment.frame_id: moment.order for moment in context.moments}
    if any(orders.get(unit["id"]) != unit.get("frameOrder") for unit in units):
        raise ValidationError("Evaluation frames disagree with the explicit recording manifest")
    return [unit for unit in units if orders[unit["id"]] <= context.current.order]


def _evaluate_grouping(store: CandidateRuleStore, candidate_id: str, body: dict[str, Any]) -> dict[str, Any]:
    from omega_vision.perception.grouping_promotion import (
        GroupingValidationLabel, evaluate_grouping_promotion, evaluate_grouping_sequence,
    )
    _fields(body, {"workspaceId", "trainingSequenceId", "sequenceId", "partition", "labels"},
            {"trainingFrameId", "allowLlmPromotion", "memorySessionId", "memorySnapshot"})
    state = browser_memory(body)
    _, training_units = _consumer_units(body["workspaceId"], body["trainingSequenceId"], state)
    training_unit = next((item for item in training_units if item["id"] == body.get("trainingFrameId")), None)
    if "trainingFrameId" in body and training_unit is None:
        raise ValidationError("Unknown training frame")
    checkpoint = _result(training_unit or training_units[-1], GROUPING)["checkpoint"]
    root, units = _consumer_units(body["workspaceId"], body["sequenceId"], state)
    units = _causal_evaluation_units(store, units)
    if not units[0]["sequenceOrdered"]:
        raise ValidationError("Grouping replay requires an ordered sequence")
    frames = [_frame(item) for item in units]
    if not isinstance(body["labels"], list) or not body["labels"]:
        raise ValidationError("Grouping evaluation requires independent human-review labels")
    labels = []
    review = Journal(_api()._storage_path(root, "runtime", "grouping-reviews"))
    for raw in body["labels"]:
        _fields(raw, {"frameUid", "groupUid", "anchorUid", "expectedTemplateMatch", "reviewer", "reason"})
        if not raw["reviewer"] or not raw["reason"]:
            raise ValidationError("Human review requires reviewer and rationale")
        if type(raw["expectedTemplateMatch"]) not in {bool, type(None)}:
            raise ValidationError("Expected template match must be boolean or null (unknown)")
        if not any(frame.uid == raw["frameUid"] and any(group.uid == raw["groupUid"] for group in frame.groups)
                   for frame in frames):
            raise ValidationError("Review must identify an actual final group in this replay")
        payload = {"candidateId": candidate_id, "sequenceId": body["sequenceId"],
                   "workspaceId": body["workspaceId"], "providerId": OMEGA_PROVIDER_ID, **raw}
        source_ref = "human-grouping-review-" + content_hash(payload)
        with review.transaction() as records:
            if not any(record["payload"].get("sourceRef") == source_ref for record in records):
                review.append(records, {**payload, "sourceRef": source_ref})
        labels.append(GroupingValidationLabel(
            frame_uid=raw["frameUid"], group_uid=raw["groupUid"], anchor_uid=raw["anchorUid"],
            expected_template_match=raw["expectedTemplateMatch"], source_ref=source_ref,
            origin="human_review", independent=True,
        ))
    replay = evaluate_grouping_sequence(
        store, candidate_id, checkpoint, frames=frames, source_images=_source_images(units, frames),
        labels=labels, partition=body["partition"], evaluator_id=__name__, evaluator_version=VERSION,
    )
    return {**replay, **evaluate_grouping_promotion(store, candidate_id, gates=_gates(body))}


@router.post("/candidates/{candidate_id}/evaluate")
@router.post("/memory/rules/{candidate_id}/evaluate")
@_http
def candidate_evaluate(candidate_id: str, response: Response, body: dict[str, Any] = Body(...)):
    from omega_vision.perception.event_induction import evaluate_candidate
    response.headers["Cache-Control"] = "no-store"
    root = _workspace(body.get("workspaceId", ""))
    _fields(body, {"workspaceId", "sequenceId", "frameId", "proposalFrameId"},
            {"sequences", "evaluationSequenceId", "partition", "labels",
             "allowLlmPromotion", "memorySessionId", "memorySnapshot"})
    store = _scoped_rule_request(body)
    candidate = store.get(candidate_id)
    if candidate["kind"] == "grouping":
        _fields(body, {"workspaceId", "sequenceId", "frameId", "proposalFrameId",
                       "evaluationSequenceId", "partition", "labels"},
                {"allowLlmPromotion", "memorySessionId", "memorySnapshot"})
        evaluation = {key: value for key, value in body.items()
                      if key not in {"frameId", "proposalFrameId", "evaluationSequenceId"}}
        evaluation.update(trainingSequenceId=body["sequenceId"], trainingFrameId=body["proposalFrameId"],
                          sequenceId=body["evaluationSequenceId"])
        return _evaluate_grouping(store, candidate_id, evaluation)
    _fields(body, {"workspaceId", "sequenceId", "frameId", "proposalFrameId", "sequences"},
            {"allowLlmPromotion", "memorySessionId", "memorySnapshot"})
    state = browser_memory(body)
    if not isinstance(body.get("sequences"), list) or not body["sequences"]:
        raise ValidationError("Supply actual sequence IDs and explicit train/held_out partitions")
    examples, sources = [], []
    for selection in body["sequences"]:
        _fields(selection, {"sequenceId", "partition"})
        if selection["partition"] not in {"train", "held_out"}:
            raise ValidationError("Partition must be train or held_out")
        _, units = _consumer_units(body["workspaceId"], selection["sequenceId"], state)
        units = _causal_evaluation_units(store, units)
        batch, source = _examples(root, units, selection["partition"])
        if not batch:
            raise ValidationError("Initial observations do not provide evaluation pairs")
        examples.extend(batch)
        sources.append((selection["partition"], source))
    with writer_lock(_api()._storage_path(root, "runtime", "semantic-learning")):
        candidate = store.get(candidate_id)
        trained = _training(candidate) + [source for partition, source in sources if partition == "train"]
        if not trained:
            raise ValidationError("Candidate lacks attributed training sources; cannot establish held-out independence")
        for partition, source in sources:
            if partition == "held_out" and any(_overlaps(source, prior) for prior in trained):
                raise ValidationError("Held-out sequence overlaps candidate training sources or original pixels")
        # Current request cannot reuse a sequence in different partitions.
        _record_training(store, [candidate], [source for partition, source in sources if partition == "train"])
        return evaluate_candidate(store, candidate_id, examples, gates=_gates(body), promote=False)


@router.post("/candidates/{candidate_id}/deployment")
@_http
def candidate_deployment(candidate_id: str, response: Response, body: dict[str, Any] = Body(...)):
    from omega_vision.perception.grouping_promotion import create_grouping_deployment
    response.headers["Cache-Control"] = "no-store"
    _fields(body, {"workspaceId", "sequenceId", "frameId", "proposalFrameId", "reviewer", "reason"},
            {"memorySessionId", "memorySnapshot"})
    if body["frameId"] != body["proposalFrameId"]:
        raise ValidationError("Cross-frame grouping deployment requires an explicit immutable parent-reference adapter")
    state = browser_memory(body)
    _, units = _consumer_units(body["workspaceId"], body["sequenceId"], state)
    unit = next((item for item in units if item["id"] == body["frameId"]), None)
    if unit is None:
        raise ValidationError("Unknown training frame")
    checkpoint = _result(unit, GROUPING)["checkpoint"]
    candidate = create_grouping_deployment(
        _scoped_rule_request(body), candidate_id, checkpoint, reviewer=body["reviewer"], reason=body["reason"],
    )
    return {"candidate": candidate, "requiresIndependentEvaluation": True,
            "activation": "Only separate explicit promotion activates this exact deployment AST"}


@router.post("/candidates/{candidate_id}/promote")
@_http
def candidate_promote(candidate_id: str, body: dict[str, Any] = Body(...)):
    from omega_vision.perception.grouping_promotion import evaluate_grouping_promotion
    _fields(body, {"workspaceId", "sequenceId", "frameId", "proposalFrameId"}, {"allowLlmPromotion"})
    root = _workspace(body["workspaceId"])
    store = _scoped_rule_request(body)
    if store.get(candidate_id)["kind"] == "grouping":
        from omega_vision.perception.memory_catalog_cache import memory_catalog_mutation
        _api()._storage_path(root, ".cache", "memory-catalog")
        with memory_catalog_mutation(_api()._vision_data_root(root)):
            return evaluate_grouping_promotion(store, candidate_id, gates=_gates(body), promote=True)
    with writer_lock(_api()._storage_path(root, "runtime", "semantic-learning")):
        result = store.promote(candidate_id, gates=_gates(body))
    return {"candidate": result, "activation": "Next authored_prolog deduction includes promoted typed detectors",
            "requiresReplay": True}


@router.post("/candidates/{candidate_id}/reject")
@_http
def candidate_reject(candidate_id: str, body: dict[str, Any] = Body(...)):
    _fields(body, {"workspaceId", "sequenceId", "frameId", "proposalFrameId", "reason", "reviewer"})
    if not isinstance(body["reviewer"], str) or not body["reviewer"].strip():
        raise ValidationError("An attributed reviewer is required")
    return _scoped_rule_request(body).reject(
        candidate_id, reason=body["reason"],
        provenance={"source": "human_review", "reviewer": body["reviewer"], "adapterVersion": VERSION},
    )


@router.get("/events")
@_http
def events_read(workspaceId: str, sequenceId: str, response: Response, generation: int | None = None):
    root, _ = _units(workspaceId, sequenceId)
    response.headers["Cache-Control"] = "no-store"
    return _event_log(root, sequenceId).read(generation=generation)


@router.get("/events/episodes")
@_http
def episodes_read(workspaceId: str, sequenceId: str, response: Response, generation: int | None = None):
    root, _ = _units(workspaceId, sequenceId)
    response.headers["Cache-Control"] = "no-store"
    return {"episodes": _event_log(root, sequenceId).episodes(generation=generation)}


@router.get("/events/hypotheses")
@_http
def hypotheses_read(workspaceId: str, sequenceId: str, response: Response):
    root, _ = _units(workspaceId, sequenceId)
    response.headers["Cache-Control"] = "no-store"
    return {"hypotheses": _event_log(root, sequenceId).hypotheses(), "authoritative": False}


@router.post("/events/replay")
@_http
def events_replay(response: Response, body: dict[str, Any] = Body(...)):
    response.headers["Cache-Control"] = "no-store"
    _fields(body, {"workspaceId", "sequenceId"},
            {"firstN", "expectedGeneration", "supersede", "memorySessionId", "memorySnapshot"})
    state = browser_memory(body)
    root, units = _consumer_units(body["workspaceId"], body["sequenceId"], state)
    first_n = body.get("firstN", 0)
    if type(first_n) is not int or first_n < 0:
        raise ValidationError("firstN must be a nonnegative integer")
    if type(body.get("supersede", False)) is not bool:
        raise ValidationError("supersede must be boolean")
    generation = body.get("expectedGeneration")
    if generation is not None and (type(generation) is not int or generation < 0):
        raise ValidationError("expectedGeneration must be a nonnegative integer")
    return _replay(root, units[:first_n] if first_n else units,
                   expected_generation=generation, supersede=body.get("supersede", False))


def authorized_memory_roots(workspace_id: str):
    """One authorized shared mount; editor workspace is provenance, not ownership."""
    from omega_vision.perception.memory_locations import AuthorizedMemoryRoot
    root = _workspace(workspace_id)
    home = _api()._storage_path(root)
    home.mkdir(parents=True, exist_ok=True)
    mounts = [AuthorizedMemoryRoot(
        provider_ref=OMEGA_PROVIDER_ID, workspace_id=OMEGA_STORAGE_ID, root=home,
        label="Omega Vision Shared", readable=True, writable=True,
    )]
    return mounts


def _memory(workspace_id: str, sequence_id: str | None, frame_id: str | None = None):
    from omega_vision.perception.memory_locations import MemoryContext, MemoryLocations
    root = _workspace(workspace_id)
    game = level = run = None
    run_aliases: set[str | None] = {None}

    def canonical_run(reference: str) -> str:
        try:
            return _api()._data_rel_of(root, _api()._safe_workspace_child(root, reference))
        except ValueError as error:
            raise PermissionError("Run identity requires an authorized canonical source path") from error

    if sequence_id:
        _, units = _units(workspace_id, sequence_id)
        directory = Path(units[0]["sequenceRoot"])
        manifest_path = _safe(directory, directory / "recording.json")
        manifest = _json(manifest_path) if manifest_path.is_file() else {}
        sources = [_imported_source(unit) for unit in units]
        source_recording = None
        if all(sources):
            recordings = {canonical_run(source["arcRecording"]) for source in sources}
            if len(recordings) == 1 and all(unit["sequenceOrdered"] for unit in units):
                source_recording = next(iter(recordings))
        if not manifest and source_recording is not None:
            try:
                source_directory = _authorized_path(root, _api()._sequence_root_for(root, source_recording))
            except HTTPException as error:
                if error.status_code != 404:
                    raise
                source_directory = None
            if source_directory is not None:
                source_manifest = _safe(source_directory, source_directory / "recording.json")
                manifest = _json(source_manifest) if source_manifest.is_file() else {}
        game = manifest.get("game_id")
        if game is None and source_recording is not None:
            games = [source["gameId"] for source in sources if source.get("gameId") is not None]
            if any(not isinstance(value, str) or not value.strip() for value in games) or len(set(games)) > 1:
                raise ValidationError("Imported frames disagree on their explicit game identity")
            if games:
                game = games[0]
        level = manifest.get("level") if game else None
        if game and all(sources):
            levels = {str(source["level"]) for source in sources if source.get("level") is not None}
            if levels:
                level = next(iter(levels)) if len(levels) == 1 else None
        run = source_recording or _api()._data_rel_of(root, directory)
        run_aliases = ({source["arcRecording"] for source in sources}
                       if source_recording else {sequence_id})
        run_aliases.update({run, "data/omega_vision/" + run.removeprefix("data/"),
                            "data/omega_vision/omega_vision/" + run.removeprefix("data/")})
        direct_parts = directory.relative_to(_api()._vision_data_root(root)).parts
        if (frame_id and len(direct_parts) == 3 and direct_parts[0] == "recordings"
                and isinstance(manifest.get("moves"), list) and manifest.get("game_id") is not None):
            selected = _inspection_context(root, sequence_id, frame_id)
            game, level, run = selected.game_id, selected.current.level_id, selected.sequence_id
    context = MemoryContext(
        provider_ref=OMEGA_PROVIDER_ID, workspace_id=OMEGA_STORAGE_ID,
        game_id=str(game) if game is not None else None,
        level_id=str(level) if level is not None else None, run_id=run,
    )
    class OmegaMemoryLocations(MemoryLocations):
        supports_metta_memory = True

        def _native(self):
            from omega_vision.perception.contextual_memory import ContextualMemory, ContextUnavailable
            context = None
            self.context_unavailable = None
            if frame_id:
                try:
                    context = _inspection_context(root, sequence_id, frame_id)
                except ContextUnavailable as error:
                    self.context_unavailable = {"reasonCode": error.code, "message": str(error)}
            return ContextualMemory(root, workspace_id, mount=self.roots[0]), context

        def _location(self, mount, path, kind, context, format):
            result = super()._location(mount, path, kind, context, format)
            if format == "memory_json":
                result["capabilities"].update(write=False, reason="Historical JSON memory is read-only; select a MeTTa area explicitly")
            elif format == "memory_metta":
                result["capabilities"].update(write=mount.writable, reason=None if mount.writable else "Read-only grant")
            return result

        def _destinations(self, mount, context):
            old = super()._destinations(mount, context)
            native, current = self._native()
            areas = native.native_areas(current)
            if getattr(self, "_native_defaults_only", False):
                # Preferences are shared by recording/level. A physical frame
                # destination must be selected explicitly, never frozen as its default.
                areas = [area for area in areas if area.name != "memory"]
            destinations = [(native.descriptor(area, kind, current), area / filename)
                            for area in areas
                            for kind, filename in (("shape", "shapes_db.metta"), ("object", "objects_db.metta"))]
            return destinations if getattr(self, "_native_defaults_only", False) else old + destinations

        def _records(self, mount, location, path):
            if location["format"] == "memory_metta":
                if getattr(self, "_building_native_catalog", False):
                    from omega_vision.perception.contextual_memory import ContextualMemory
                    native, current = ContextualMemory(root, workspace_id, mount=mount), None
                else:
                    native, current = self._native()
                filters = {}
                if not getattr(self, "_building_native_catalog", False) and (
                    path.parent.name == "memory" or path.parent.name.endswith("_stm")
                ):
                    if current is None:
                        raise PermissionError("Frame and STM memory reads require an explicit recording and frame")
                    if path.parent.name.endswith("_stm"):
                        if current.current.level_id is None or path.parent != current.stm_area():
                            raise PermissionError("STM memory does not belong to the selected recording and level")
                        filters["before"] = current.current.order
                    else:
                        moment = next((item for item in current.moments if item.directory == path.parent.parent), None)
                        if moment is None or moment.order > current.current.order:
                            raise PermissionError("Frame memory is outside the selected recording or is from a future frame")
                        filters["exact"] = moment.order
                return native.read(path.parent, location["memoryKinds"][0], current, **filters)[0]
            return super()._records(mount, location, path)

        def _catalog_metadata(self, *args, **kwargs):
            previous = getattr(self, "_building_native_catalog", False)
            self._building_native_catalog = True
            try:
                result = super()._catalog_metadata(*args, **kwargs)
            finally:
                self._building_native_catalog = previous
            if getattr(self, "_native_defaults_only", False):
                native, current = self._native()
                shared_areas = {area for area in native.native_areas(current) if area.name != "memory"}
                result = {**result, "locations": [
                    location for location in result["locations"]
                    if location["format"] != "memory_metta"
                    or Path(location["pathLabel"]).parent in shared_areas
                ]}
            return result

        def save_record(self, kind, destination_id, payload, context, **kwargs):
            from omega_vision.perception.memory_locations import NOWHERE
            if destination_id == NOWHERE:
                return super().save_record(kind, destination_id, payload, context,
                                           **kwargs, provenance_workspace_id=workspace_id)
            native, current = self._native()
            for area in native.native_areas(current):
                if native.descriptor(area, kind, current)["memoryLocationId"] == destination_id:
                    return native.save(area, kind, payload, context=current,
                                       origin=kwargs.get("origin"), concept_uid=kwargs.get("concept_uid"))
            raise PermissionError("Historical or unregistered memory destination is read-only; select an explicit MeTTa area")

        def _legacy_preferences(self, context):
            from omega_vision.perception.memory_locations import AuthorizedMemoryRoot
            seen = set()
            for alias in sorted(run_aliases, key=lambda value: value or ""):
                contexts = [(MemoryContext(
                    f"filesystem:{workspace_id}", workspace_id, context.game_id, context.level_id, alias,
                ), tuple(dict.fromkeys((root, self.roots[0].root))))]
                if alias != context.run_id:
                    contexts.append((MemoryContext(
                        context.provider_ref, context.workspace_id, context.game_id, context.level_id, alias,
                    ), (self.roots[0].root,)))
                for legacy_context, roots in contexts:
                    for legacy_root in roots:
                        legacy = MemoryLocations([AuthorizedMemoryRoot(
                            legacy_context.provider_ref, legacy_context.workspace_id, legacy_root,
                            "Unavailable historical workspace or sequence alias",
                        )])
                        _, old = legacy._preference_path(legacy_context)
                        if old.is_file() and old not in seen:
                            seen.add(old)
                            yield legacy, legacy_context, old

        def _historical_alias_location(self, location):
            identifier = location.get("context", {}).get("runId")
            if not isinstance(identifier, str) or not identifier.startswith("data/"):
                return False
            try:
                return canonical_run(identifier) != identifier
            except (ValueError, PermissionError, HTTPException):
                return True

        def _find(self, context, location_id):
            found = super()._find(context, location_id)
            if self._historical_alias_location(found[1]):
                raise ValueError("Historical sequence-alias memory location is unavailable; explicit migration is required")
            return found

        def catalog(self, context, **kwargs):
            result = super().catalog(context, **kwargs)
            if getattr(self, "context_unavailable", None):
                result["contextUnavailable"] = self.context_unavailable
            historical = {item["memoryLocationId"]: item
                          for item in (*result["locations"], *result["destinations"])
                          if self._historical_alias_location(item)}
            for key in ("locations", "destinations"):
                result[key] = [item for item in result[key] if item["memoryLocationId"] not in historical]
            result["effective"] = {kind: [identifier for identifier in identifiers if identifier not in historical]
                                   for kind, identifiers in result["effective"].items()}
            result["unavailableStorage"] = _api().unavailable_legacy_storage(root)
            result["unavailableStorage"].extend({
                "path": str(path), "workspaceId": workspace_id, "status": "unavailable", "migrationRequired": "true",
                "message": "Historical workspace/sequence-alias memory preferences require explicit selection",
            } for _, _, path in self._legacy_preferences(context) if path.is_relative_to(self.roots[0].root))
            result["unavailableStorage"].extend({
                "path": item["pathLabel"], "memoryLocationId": identifier, "status": "unavailable",
                "migrationRequired": "true", "message": "Historical sequence-alias memory requires explicit migration",
            } for identifier, item in historical.items())
            if historical:
                result["revision"] = content_hash({"catalog": result["revision"], "unavailableAliases": sorted(historical)})
            result["errors"].extend({
                "providerRef": context.provider_ref, "workspaceId": context.workspace_id,
                "message": f"{item['message']}: {item['path']}",
            } for item in result["unavailableStorage"])
            return result

        def load_preferences(self, context):
            from .recording_test_memory import execution_preferences
            explicit = execution_preferences(self, context)
            if explicit is not None:
                return explicit
            # Preserve old selection IDs as unavailable rather than silently
            # replacing a historical Save To with a new canonical destination.
            _, current = self._preference_path(context)
            if not current.exists():
                historical = [legacy.load_preferences(legacy_context)
                              for legacy, legacy_context, _ in self._legacy_preferences(context)]
                if len({value["revision"] for value in historical}) > 1:
                    raise ValueError("Conflicting historical sequence/workspace preferences require explicit selection or migration")
                if historical:
                    return historical[0]
            self._native_defaults_only = True
            try:
                return super().load_preferences(context)
            finally:
                self._native_defaults_only = False

    return OmegaMemoryLocations(authorized_memory_roots(workspace_id)), context


def browser_memory(body: Mapping[str, Any]):
    from omega_vision.perception.memory_locations import BrowserMemory
    token = body.get("memorySessionId")
    if token is not None and (not isinstance(token, str) or not re.fullmatch(r"[A-Za-z0-9_-]{16,128}", token)):
        raise ValidationError("memorySessionId must be an opaque page-session identifier")
    if "memorySnapshot" not in body:
        return None
    if token is None:
        raise ValidationError("An explicit browser memory snapshot requires memorySessionId")
    root = _api()._storage_path(_workspace(body["workspaceId"]))
    return BrowserMemory(body["workspaceId"], token, body["memorySnapshot"],
                         provider_ref=OMEGA_PROVIDER_ID, storage_root=root)


@contextmanager
def _memory_access(workspace_id: str, sequence_id: str | None, state=None, *, frame_id=None):
    locations, context = _memory(workspace_id, sequence_id, frame_id)
    yield locations, context, state.memory if state else None


def _transient_output(unit: Mapping[str, Any], step: str, preferences=None) -> bool:
    from omega_vision.perception.memory_locations import NOWHERE
    if preferences is None:
        locations, context = _memory(unit["workspaceId"], unit["sequenceId"], frame_id=unit.get("id"))
        preferences = locations.load_preferences(context)
    kinds = ("shape", "object") if step == OBJECTS else ("shape",)
    return any(preferences[kind]["saveTo"] == NOWHERE for kind in kinds)


def transient_output_available(unit: Mapping[str, Any], step: str) -> bool:
    """A durable receipt alone cannot satisfy a transient dependency."""
    if step not in {OBJECTS, GROUPING}:
        return True
    path = _artifact(unit, step)
    if not path.is_file():
        return False
    receipt = _json(path)
    if receipt.get("storage") != "browser_session":
        return not _transient_output(unit, step)
    state = unit.get("_browserMemory")
    output = state.outputs.get(state.output_key(unit["sequenceId"], unit["id"], step)) if state else None
    return bool(output and output["resultHash"] == receipt.get("resultHash"))


def _require_generated_session(unit: Mapping[str, Any], preferences: Mapping[str, Any], kinds, *,
                               locations=None, context=None):
    from omega_vision.perception.memory_locations import NOWHERE
    uses_nowhere = any(preferences[kind]["saveTo"] == NOWHERE or NOWHERE in preferences[kind]["lookIn"]
                       for kind in kinds)
    if uses_nowhere and unit.get("executionMode") == "pooler":
        raise ConflictError(
            "A pooler cannot use browser-local Nowhere Save To or Look In. "
            "Use Run now/direct in the page, or choose persistent Shape/Object memory locations."
        )
    if uses_nowhere and unit.get("_browserMemory") is None:
        raise ValidationError(
            "Nowhere Save To/Look In requires an explicit browser memory snapshot and memorySessionId; "
            "use Run now/direct in the page "
            "or choose persistent memory locations."
        )
    if locations is not None:
        for kind in kinds:
            if preferences[kind]["saveTo"] != NOWHERE:
                _, destination, _ = locations._find(context, preferences[kind]["saveTo"])
                if kind not in destination["memoryKinds"] or not destination["capabilities"]["write"]:
                    raise PermissionError("Selected historical memory is read-only; choose an explicit MeTTa destination")


def _memory_reference(record: Mapping[str, Any], *, relation: str = "references") -> dict[str, Any]:
    from omega_vision.perception.memory_references import normalize_reference
    return normalize_reference({
            **{key: record["source"][key] for key in ("providerRef", "workspaceId", "memoryLocationId")
               if key in record["source"]},
            "recordUid": record["recordUid"], "revision": record["revision"],
            "targetKind": record["memoryKind"], "relation": relation,
            **({"registeredPath": record["source"]["registeredPath"]}
               if record["source"].get("registeredPath") else {})})


def _save_generated_records(access, preferences: Mapping[str, Any], kind: str,
                            payloads: list[dict[str, Any]], frame_uid: str, stage: str):
    locations, context, volatile = access
    return [
        locations.save_record(
            kind, preferences[kind]["saveTo"], payload, context, volatile=volatile,
            origin={"source": "explicit_semantic_stage", "stage": stage, "frameUid": frame_uid,
                    "preferenceRevision": preferences["revision"]},
        )
        for payload in payloads
    ]


def _memory_write_summary(preferences: Mapping[str, Any], kind: str, records) -> dict[str, Any]:
    from omega_vision.perception.memory_locations import NOWHERE
    return {"destinationId": preferences[kind]["saveTo"], "recordCount": len(records),
            "volatile": preferences[kind]["saveTo"] == NOWHERE,
            "preferenceRevision": preferences["revision"],
            "records": [_memory_reference(record) for record in records]}


@router.get("/visual-sequence-selection")
@_http
def visual_sequence_selection(workspaceId: str, response: Response):
    from omega_vision.perception.visual_sequence_selection import load_selection
    response.headers["Cache-Control"] = "no-store"
    return load_selection(_workspace(workspaceId))


@router.put("/visual-sequence-selection")
@_http
def update_visual_sequence_selection(response: Response, body: dict[str, Any] = Body(...)):
    from omega_vision.perception.visual_sequence_selection import save_selection
    _fields(body, {"workspaceId", "visualSequenceId", "expectedRevision"})
    root = _workspace(body["workspaceId"])

    def validate(identifier):
        entries = _api()._cached_visual_catalog(body["workspaceId"], None, None, False)
        matches = [entry for entry in entries if entry["id"] == identifier]
        if len(matches) != 1:
            raise ValidationError("Visual Sequence is unavailable or ambiguous in the shared catalog")
        expected = _api()._safe_workspace_child(root, "data/" + identifier)
        actual = _api()._sequence_root_for(root, matches[0].get("providerRef") or "data/" + identifier)
        if actual != expected:
            raise PermissionError("Visual Sequence catalog identity and provider path disagree")

    response.headers["Cache-Control"] = "no-store"
    return save_selection(root, body["visualSequenceId"], body["expectedRevision"], validate=validate)


@router.get("/memory/recording-context")
@_http
def memory_recording_context(workspaceId: str, sequenceId: str, response: Response,
                            frameId: str | None = None):
    from omega_vision.perception.contextual_memory import ContextUnavailable, recording_context
    root = _workspace(workspaceId)
    response.headers["Cache-Control"] = "no-store"
    try:
        directory = _api()._sequence_root_for(root, sequenceId)
        context = recording_context(root, directory, frameId, select_first=frameId is None)
    except ContextUnavailable as error:
        raise HTTPException(422, {"reasonCode": error.code, "message": str(error)}) from error
    return {
        "schemaVersion": 1, "sequenceId": context.sequence_id, "gameId": context.game_id,
        "frames": [{"frameId": moment.frame_id, "levelId": moment.level_id, "frameOrder": moment.order}
                  for moment in context.moments],
        "selectedFrameId": context.current.frame_id,
    }


@router.get("/memory")
@_http
def memory_setup(workspaceId: str, response: Response, sequenceId: str | None = None,
                 memorySessionId: str | None = None, refresh: bool = False, frameId: str | None = None):
    response.headers["Cache-Control"] = "no-store"
    browser_memory({"workspaceId": workspaceId, "memorySessionId": memorySessionId})
    with _memory_access(workspaceId, sequenceId, frame_id=frameId) as (locations, context, volatile):
        return {"catalog": locations.catalog(context, volatile=volatile, refresh=refresh),
                "preferences": locations.load_preferences(context), "context": asdict(context),
                "volatileLifetime": "browser_page", "memorySessionId": memorySessionId}


@router.post("/memory/setup")
@_http
def memory_setup_snapshot(response: Response, body: dict[str, Any] = Body(...)):
    _fields(body, {"workspaceId"}, {"sequenceId", "frameId", "memorySessionId", "memorySnapshot", "refresh"})
    if type(body.get("refresh", False)) is not bool:
        raise ValidationError("refresh must be boolean")
    state = browser_memory(body)
    response.headers["Cache-Control"] = "no-store"
    with _memory_access(body["workspaceId"], body.get("sequenceId"), state, frame_id=body.get("frameId")) as (locations, context, volatile):
        return {"catalog": locations.catalog(context, volatile=volatile, refresh=body.get("refresh", False)),
                "preferences": locations.load_preferences(context), "context": asdict(context),
                "volatileLifetime": "browser_page"}


@router.put("/memory/preferences")
@_http
def memory_preferences(response: Response, body: dict[str, Any] = Body(...)):
    _fields(body, {"workspaceId", "preferences", "expectedRevision"}, {"sequenceId", "frameId", "memorySessionId"})
    locations, context = _memory(body["workspaceId"], body.get("sequenceId"), body.get("frameId"))
    response.headers["Cache-Control"] = "no-store"
    try:
        return locations.save_preferences(context, body["preferences"], expected_revision=body["expectedRevision"])
    except ValueError as error:
        if "changed; reload" in str(error):
            raise ConflictError(str(error)) from error
        raise


@router.post("/memory/read")
@_http
def memory_read(response: Response, body: dict[str, Any] = Body(...)):
    _fields(body, {"workspaceId", "kind", "locationIds"}, {"sequenceId", "frameId", "memorySnapshot", "memorySessionId"})
    response.headers["Cache-Control"] = "no-store"
    with _memory_access(body["workspaceId"], body.get("sequenceId"), browser_memory(body),
                        frame_id=body.get("frameId")) as (locations, context, volatile):
        result = locations.read_selected(body["kind"], body["locationIds"], context, volatile=volatile)
    if result["errors"]:
        raise HTTPException(422, {"message": "One or more memory locations could not be read", **result})
    return result


@router.post("/memory/copy")
@_http
def memory_copy(response: Response, body: dict[str, Any] = Body(...)):
    from omega_vision.perception.memory_locations import NOWHERE
    _fields(body, {"workspaceId", "kind", "sourceLocationId", "recordUid", "destinationId"},
            {"sequenceId", "frameId", "memorySessionId", "memorySnapshot"})
    state = browser_memory(body)
    if NOWHERE in (body["sourceLocationId"], body["destinationId"]) and state is None:
        raise ValidationError("Nowhere copies require an explicit browser memory snapshot")
    with _memory_access(body["workspaceId"], body.get("sequenceId"), state, frame_id=body.get("frameId")) as access:
        locations, context, volatile = access
        if body["sourceLocationId"] != NOWHERE:
            _, source_location, source_path = locations._find(context, body["sourceLocationId"])
            if source_location["format"] == "memory_metta":
                native, current = locations._native()
                if source_path.parent not in native.native_areas(current):
                    raise PermissionError("Source memory requires its explicit authorized frame/level context")
        source = locations.read_selected(body["kind"], [body["sourceLocationId"]], context, volatile=volatile)
        if source["errors"]:
            raise ValidationError("Source memory location is unavailable")
        record = next((version for item in source["records"] for version in item["versions"]
                       if version["recordUid"] == body["recordUid"]), None)
        if record is None:
            raise KeyError("Memory record not found at its attributed source location")
        result = locations.save_copy(record, body["destinationId"], context, volatile=volatile)
    response.headers["Cache-Control"] = "no-store"
    return {"record": result, "volatile": body["destinationId"] == NOWHERE,
            **({"memorySnapshot": state.to_wire()} if state else {})}


@router.post("/memory/save")
@_http
def memory_save(response: Response, body: dict[str, Any] = Body(...)):
    from omega_vision.perception.memory_locations import NOWHERE
    _fields(body, {"workspaceId", "kind", "destinationId", "payload"}, {"sequenceId", "frameId", "memorySessionId", "memorySnapshot"})
    state = browser_memory(body)
    with _memory_access(body["workspaceId"], body.get("sequenceId"), state, frame_id=body.get("frameId")) as access:
        locations, context, volatile = access
        result = locations.save_record(body["kind"], body["destinationId"], body["payload"], context,
                                       volatile=volatile, origin={"source": "explicit_browser_save"})
    response.headers["Cache-Control"] = "no-store"
    return {"record": result, "volatile": body["destinationId"] == NOWHERE,
            **({"memorySnapshot": state.to_wire()} if state else {})}


@router.post("/memory/reset")
@_http
def memory_reset(response: Response, body: dict[str, Any] = Body(...)):
    _fields(body, {"workspaceId", "memorySessionId"}, {"sequenceId"})
    _memory(body["workspaceId"], body.get("sequenceId"))
    browser_memory(body)
    response.headers["Cache-Control"] = "no-store"
    return {"memorySessionId": body["memorySessionId"], "requiresNewSession": True,
            "message": "No memory is retained by the server. Clear the browser snapshot and rotate its page token."}


def _inspection_context(root, sequence_id, frame_id):
    from omega_vision.perception.contextual_memory import ContextUnavailable, recording_context
    if not sequence_id:
        raise ContextUnavailable("missing_sequence", "Select an actual recording and frame")
    directory = _api()._sequence_root_for(root, sequence_id)
    return recording_context(root, directory, frame_id)


@router.get("/memory/inspectable-areas")
@_http
def memory_inspectable_areas(workspaceId: str, response: Response):
    from omega_vision.perception.contextual_memory import inspectable_areas
    _workspace(workspaceId)
    response.headers["Cache-Control"] = "no-store"
    return inspectable_areas()


@router.post("/memory/inspect-area")
@_http
def memory_inspect_area(response: Response, body: dict[str, Any] = Body(...)):
    from omega_vision.perception.contextual_memory import ContextualMemory
    _fields(body, {"workspaceId", "areaId", "kind"},
            {"sequenceId", "frameId", "memorySnapshot", "memorySessionId"})
    root = _workspace(body["workspaceId"])
    state = browser_memory(body)
    response.headers["Cache-Control"] = "no-store"
    return ContextualMemory(root, body["workspaceId"], mount=authorized_memory_roots(body["workspaceId"])[0]).inspect(
        body["areaId"], body["kind"],
        context_loader=lambda: _inspection_context(root, body.get("sequenceId"), body.get("frameId")),
        volatile=state.memory if state else None,
    )


@router.post("/memory/save-area")
@_http
def memory_save_area(response: Response, body: dict[str, Any] = Body(...)):
    from omega_vision.perception.contextual_memory import ContextualMemory
    _fields(body, {"workspaceId", "kind", "scope", "payload", "sequenceId", "frameId"})
    root = _workspace(body["workspaceId"])
    context = _inspection_context(root, body["sequenceId"], body["frameId"])
    if body["scope"] == "frame":
        area = context.frame_area()
    elif body["scope"] == "recording-level-stm":
        area = context.stm_area()
    elif body["scope"] == "game-all":
        area = context.game_area()
    elif body["scope"] == "game-level-ltm":
        area = context.ltm_area()
    else:
        raise ValidationError("Explicit frame, recording-level-stm, game-all or game-level-ltm save scope is required")
    response.headers["Cache-Control"] = "no-store"
    record = ContextualMemory(root, body["workspaceId"], mount=authorized_memory_roots(body["workspaceId"])[0]).save(
        area, body["kind"], body["payload"], context=context,
        origin={"source": "explicit_browser_save"},
    )
    return {"record": record, "volatile": False}


def _candidate_read_store(workspace_id, sequence_id, frame_id, proposal_frame_id):
    if sequence_id is None and frame_id is None and proposal_frame_id is None:
        return _store(_workspace(workspace_id))
    if not sequence_id or not frame_id:
        raise ValidationError("Scoped candidate reads require sequenceId and frameId")
    body = {"workspaceId": workspace_id, "sequenceId": sequence_id, "frameId": frame_id}
    if proposal_frame_id is not None:
        body["proposalFrameId"] = proposal_frame_id
    return _scoped_rule_request(body, writable=False)


def _scoped_rule_request(body, *, writable=True):
    from omega_vision.perception.contextual_rules import ContextualRuleStore
    root = _workspace(body["workspaceId"])
    grant = authorized_memory_roots(body["workspaceId"])[0]
    if not grant.readable or (writable and not grant.writable) or grant.root != _api()._vision_data_root(root):
        raise PermissionError("The shared provider does not authorize the selected rule operation")
    context = _inspection_context(root, body["sequenceId"], body["frameId"])
    origin = (_inspection_context(root, body["sequenceId"], body["proposalFrameId"])
              if "proposalFrameId" in body else context)
    return ContextualRuleStore(context, origin=origin)


@router.post("/memory/rules/propose")
@_http
def memory_rule_propose(response: Response, body: dict[str, Any] = Body(...)):
    _fields(body, {"workspaceId", "sequenceId", "frameId", "kind", "rule", "source", "provenance", "inducerVersion"},
            {"entityIds"})
    store = _scoped_rule_request(body)
    candidate = store.create(body["rule"], kind=body["kind"], source=body["source"],
                             provenance=body["provenance"], inducer_version=body["inducerVersion"],
                             entity_ids=body.get("entityIds", []),
                             scope={"domain": "visual-sequence", "provider_id": OMEGA_PROVIDER_ID})
    response.headers["Cache-Control"] = "no-store"
    return {"candidate": candidate, "authority": "proposals_only",
            "source": "data/" + store.journal.database.path.relative_to(store.context.root).as_posix()}


@router.post("/memory/rules/{candidate_id}/promote")
@_http
def memory_rule_promote(candidate_id: str, response: Response, body: dict[str, Any] = Body(...)):
    _fields(body, {"workspaceId", "sequenceId", "frameId", "proposalFrameId"},
            {"role", "allowLlmPromotion"})
    store = _scoped_rule_request(body)
    role = body.get("role", "deduction")
    if store.get(candidate_id)["kind"] == "grouping" and role == "deduction":
        from omega_vision.perception.grouping_promotion import evaluate_grouping_promotion
        candidate = evaluate_grouping_promotion(store, candidate_id, gates=_gates(body), promote=True)["promotion"]
    else:
        candidate = store.promote(candidate_id, gates=_gates(body), role=role)
    response.headers["Cache-Control"] = "no-store"
    return {"candidate": candidate, "destination": "data/" + store.context.stm_area().relative_to(store.context.root).as_posix(),
            "requiresCausalCutoff": True, "automaticOnwardPromotion": False}


@router.post("/memory/inspect-reference")
@_http
def memory_inspect_reference(response: Response, body: dict[str, Any] = Body(...)):
    from omega_vision.perception.contextual_memory import ContextualMemory, ContextUnavailable
    _fields(body, {"workspaceId", "areaId", "reference"},
            {"sequenceId", "frameId", "memorySessionId", "memorySnapshot"})
    if not isinstance(body["reference"], dict):
        raise ValidationError("An attributed reference object is required")
    root = _workspace(body["workspaceId"])
    state = browser_memory(body)
    response.headers["Cache-Control"] = "no-store"
    try:
        return ContextualMemory(root, body["workspaceId"], mount=authorized_memory_roots(body["workspaceId"])[0]).inspect_reference(
            body["reference"], area_id=body["areaId"],
            context_loader=lambda: _inspection_context(root, body.get("sequenceId"), body.get("frameId")),
            volatile=state.memory if state else None,
        )
    except ContextUnavailable as error:
        return {"status": "unavailable", "reasonCode": error.code, "message": str(error),
                "areaId": body["areaId"], "kind": body["reference"].get("targetKind"),
                "records": [], "sources": [], "authorizedSources": [],
                "errors": [{"code": error.code, "message": str(error)}], "cachePolicy": "no-store"}


from .two_frame_x_duction import router as two_frame_router

router.include_router(two_frame_router)
