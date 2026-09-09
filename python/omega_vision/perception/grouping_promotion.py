"""Cross-sequence template evaluation through the shared CandidateRuleStore.

Only independently supplied labels grade predictions. Observing a final G or
matching one's own prototype never supplies a positive label. This adapter
evaluates measured grouping-template candidates, not final G acceptance.
CV supplies measured facts; the shared Prolog inert-AST engine predicts heads.
Route all grouping recipe writes, replay, and promotions through these wrappers:
they serialize workers and revoke contaminated held-out credit before publishing
new training provenance. The shared CandidateRuleStore remains the only registry.
"""
from __future__ import annotations

from dataclasses import dataclass
from functools import wraps
from io import BytesIO
import json
import math
from typing import Any, Mapping, Sequence

from PIL import Image

from omega_vision.perception.candidate_rules import CandidateRuleStore, PromotionGates
from omega_vision.perception._event_journal import writer_lock
from omega_vision.perception.grouping_learning import grouping_candidate_evaluations, match_prototypes
from omega_vision.perception.event_records import normalize_rule
from omega_vision.perception.event_induction import engine_version, evaluate_rule
from omega_vision.perception.observation_identity import content_hash
from omega_vision.perception.temporal_correspondence import TemporalFrame


VERSION = "grouping-promotion-v2"
DEPLOYMENT_VERSION = "measured-grouping-deployment-v1"


def _serialized_grouping(function):
    @wraps(function)
    def serialized(store: CandidateRuleStore, *args, **kwargs):
        # A lock only, not another candidate registry. Keep recipe expansion,
        # evidence reclassification and explicit activation ordered across workers.
        with writer_lock(store.workspace_root / "runtime" / "grouping-promotion-locks"):
            return function(store, *args, **kwargs)
    return serialized


def _training_provenance(candidate: Mapping[str, Any]) -> list[dict[str, Any]]:
    training = [proposal["provenance"]["groupingTraining"] for proposal in candidate["proposals"]
                if proposal.get("provenance", {}).get("groupingTraining")]
    for evidence in candidate["evidence"]:
        if evidence["partition"] == "train":
            provenance = evidence.get("provenance", {})
            training.append({
                "providerId": provenance.get("providerId"), "sequenceId": provenance.get("sourceSequenceId"),
                "sequenceFingerprint": evidence["sequence_fingerprint"],
                "sourceImageHashes": [provenance.get("sourceImageHash")],
            })
    return training


def _training_overlap(training: Sequence[Mapping[str, Any]], provider: str, sequence: str,
                      fingerprint: str, image_hashes: Sequence[str]) -> bool:
    return any((item["providerId"], item["sequenceId"]) == (provider, sequence)
               or item["sequenceFingerprint"] == fingerprint
               or set(item["sourceImageHashes"]).intersection(image_hashes) for item in training)


def _refresh_training_partitions(store: CandidateRuleStore, candidate_id: str, *,
                                 additional_training: Sequence[Mapping[str, Any]] = ()) -> None:
    candidate = store.get(candidate_id)
    training = [*_training_provenance(candidate), *additional_training]
    already_train = {item["observation_hash"] for item in candidate["evidence"] if item["partition"] == "train"}
    for evidence in candidate["evidence"]:
        provenance = evidence.get("provenance", {})
        if (evidence["partition"] != "held_out" or evidence["observation_hash"] in already_train
                or not provenance.get("sourceImageHash")):
            continue
        if _training_overlap(training, provenance.get("providerId"), provenance.get("sourceSequenceId"),
                             evidence["sequence_fingerprint"], [provenance["sourceImageHash"]]):
            revised = {key: value for key, value in evidence.items() if key not in {"evidence_id", "evidence_kind"}}
            revised["partition"] = "train"
            revised["provenance"] = {
                **provenance, "partitionRevision": "source_now_used_for_training",
                "trainingSourceProofs": sorted(content_hash(dict(item)) for item in training),
            }
            store.record_grouping_evidence(candidate_id, revised)


@dataclass(frozen=True)
class GroupingValidationLabel:
    frame_uid: str
    group_uid: str
    anchor_uid: str
    expected_template_match: bool | None
    source_ref: str
    origin: str
    independent: bool
    confidence: float = 1.0
    used_candidate_ids: tuple[str, ...] = ()
    used_prototype_ids: tuple[str, ...] = ()

    def validate(self) -> None:
        if not all((self.frame_uid, self.group_uid, self.anchor_uid, self.source_ref)):
            raise ValueError("grouping validation requires attributed frame/group/anchor/source IDs")
        if self.origin not in {"human_review", "authored_detector", "external_measurement", "prototype_prediction"}:
            raise ValueError("unsupported grouping label origin")
        if type(self.independent) is not bool or type(self.expected_template_match) not in {bool, type(None)}:
            raise ValueError("grouping validation requires explicit boolean independence and a boolean/unknown label")
        if not math.isfinite(self.confidence) or not 0 <= self.confidence <= 1:
            raise ValueError("grouping label confidence must be between zero and one")


def _checkpoint_proposal(candidate: Mapping[str, Any], checkpoint: Mapping[str, Any]) -> dict[str, Any]:
    for proposal in grouping_candidate_evaluations(checkpoint):
        spec = proposal["storeProposal"]
        normalized = normalize_rule(spec["rule"], kind="grouping", entity_ids=spec["entity_ids"])
        if normalized == candidate["rule"] and spec["scope"] == candidate["scope"]:
            return proposal
    raise ValueError("candidate is not a measured template from this checkpoint and provider scope")


def _deployment_rule(proposal: Mapping[str, Any]) -> dict[str, Any]:
    """An explicitly authored deployment program, distinct from the guarded proposal."""
    anchor = proposal["storeProposal"]["rule"]["head"]["args"][1]
    return normalize_rule({
        "body": [
            {"predicate": "observed_mask_similarity", "args": [{"var": "Group"}, anchor, {"var": "Score"}]},
            {"predicate": "greater_equal", "args": [{"var": "Score"}, 0.82]},
        ],
        "head": {"predicate": "grouping_template_candidate", "args": [{"var": "Group"}, anchor]},
        "exceptions": [], "delay": {"min": 0, "max": 0}, "thresholds": {"minimum_mask_iou": 0.82},
    }, kind="grouping", entity_ids=[anchor])


@_serialized_grouping
def create_grouping_deployment(
    store: CandidateRuleStore, proposal_id: str, checkpoint: Mapping[str, Any], *,
    reviewer: str, reason: str,
) -> dict[str, Any]:
    """Create an unevaluated deployment AST; never copy evidence or promotion."""
    if not isinstance(reviewer, str) or not reviewer.strip() or not isinstance(reason, str) or not reason.strip():
        raise ValueError("deployment creation requires an explicit reviewer and rationale")
    parent = store.get(proposal_id)
    if parent["kind"] != "grouping" or parent["status"] == "rejected":
        raise ValueError("deployment requires a non-rejected measured grouping proposal")
    proposal = _checkpoint_proposal(parent, checkpoint)
    sources = [json.loads(json.dumps(item["provenance"])) for item in parent["proposals"]
               if item["source"] == "measured_grouping_induction" and item["provenance"].get("groupingTraining")]
    if not sources:
        raise ValueError("deployment requires original-image training provenance")
    # Parent training observations remain training exclusions, not deployment credit.
    for evidence in parent["evidence"]:
        if evidence["partition"] != "train":
            continue
        provenance = evidence.get("provenance", {})
        if not all(provenance.get(key) for key in ("providerId", "sourceSequenceId", "sourceImageHash", "frameUid")):
            raise ValueError("deployment requires attributed original-image parent training observations")
        sources.append({
            "prototypeUids": proposal["prototypeUids"],
            "groupingTraining": {
                "providerId": provenance["providerId"], "sequenceId": provenance["sourceSequenceId"],
                "sequenceFingerprint": evidence["sequence_fingerprint"],
                "sourceImageHashes": [provenance["sourceImageHash"]], "frameUids": [provenance["frameUid"]],
                "adapterVersion": VERSION,
            },
        })
    deployment = None
    for source in sources:
        deployment = store.create(
            _deployment_rule(proposal), kind="grouping", scope=parent["scope"],
            source="measured_grouping_induction", inducer_version=f"{DEPLOYMENT_VERSION}:{parent['version']}",
            entity_ids=parent["entity_ids"], parent_ids=[proposal_id],
            provenance={
                "groupingTraining": source["groupingTraining"],
                "prototypeUids": source.get("prototypeUids", []),
                "groupingDeployment": {
                    "proposalCandidateId": proposal_id, "proposalVersion": parent["version"],
                    "version": DEPLOYMENT_VERSION, "checkpointUid": checkpoint["checkpointUid"],
                },
                "reviewer": reviewer, "reason": reason,
            },
            assumptions=["Deployment predicts from measured pixels without per-observation support guards"],
            critiques=["Must independently replay and promote this exact AST before application"],
        )
    return deployment


@_serialized_grouping
def persist_grouping_candidates(
    store: CandidateRuleStore, grouping: Mapping[str, Any], *,
    training_frames: Sequence[TemporalFrame], source_images: Mapping[str, bytes],
) -> list[dict[str, str]]:
    """Persist every generated proposal before validation; never infer evidence."""
    fingerprint, image_hashes = sequence_source_fingerprint(training_frames, source_images)
    checkpoint = grouping.get("checkpoint", grouping)
    expected_frames = {revision["frameUid"] for prototype in checkpoint["prototypes"] for revision in prototype["revisions"]}
    if expected_frames - {frame.uid for frame in training_frames}:
        raise ValueError("supply original images for every prototype training frame")
    if (training_frames[0].provider_id, training_frames[0].sequence_id) != (checkpoint["providerId"], checkpoint["sequenceId"]):
        raise ValueError("training sources do not belong to this grouping checkpoint")
    candidates = grouping.get("candidates")
    if candidates is None:
        candidates = grouping_candidate_evaluations(grouping.get("checkpoint", grouping))
    output = []
    for candidate in sorted(candidates, key=lambda item: item["candidateUid"]):
        proposal = json.loads(json.dumps(candidate["storeProposal"]))
        if proposal["kind"] != "grouping" or proposal["source"] != "measured_grouping_induction":
            raise ValueError("expected a measured grouping proposal")
        proposal["provenance"]["groupingTraining"] = {
            "providerId": training_frames[0].provider_id, "sequenceId": training_frames[0].sequence_id,
            "sequenceFingerprint": fingerprint, "sourceImageHashes": sorted(set(image_hashes.values())),
            "frameUids": sorted(image_hashes), "adapterVersion": VERSION,
        }
        normalized = normalize_rule(proposal["rule"], kind="grouping", entity_ids=proposal["entity_ids"])
        for previous in store.list(kind="grouping"):
            if (previous["rule"] == normalized and previous["scope"] == proposal["scope"]
                    and previous["inducer_version"] == proposal["inducer_version"]):
                # Revoke stale held-out credit before publishing a recipe that
                # exposes those sources, so even direct status readers stay safe.
                _refresh_training_partitions(
                    store, previous["candidate_id"], additional_training=[proposal["provenance"]["groupingTraining"]],
                )
        persisted = store.create(**proposal)
        _refresh_training_partitions(store, persisted["candidate_id"])
        output.append({"proposalUid": candidate["candidateUid"], "candidateId": persisted["candidate_id"],
                       "candidateVersion": persisted["version"]})
    return output


def sequence_source_fingerprint(
    frames: Sequence[TemporalFrame], source_images: Mapping[str, bytes],
) -> tuple[str, dict[str, str]]:
    """Hash actual original image pixels, not filenames, sequence aliases or encodings.

    Supply original full-frame image bytes even when observations were extracted
    from scaled variants. Their dimensions must match normalized TemporalFrames.
    """
    if not frames or len({(frame.provider_id, frame.sequence_id) for frame in frames}) != 1:
        raise ValueError("grouping replay requires one nonempty provider-aware sequence")
    orders = [frame.order for frame in frames]
    if orders != sorted(set(orders)) or len({frame.uid for frame in frames}) != len(frames):
        raise ValueError("grouping replay frames must be unique and ordered")
    if set(source_images) != {frame.uid for frame in frames}:
        raise ValueError("supply original image bytes for every replay frame")
    hashes = {}
    for frame in frames:
        value = source_images[frame.uid]
        if not isinstance(value, bytes) or not value:
            raise ValueError("source images must be actual nonempty image bytes")
        with Image.open(BytesIO(value)) as image:
            image.load()
            if image.size != (frame.width, frame.height):
                raise ValueError("original source image dimensions do not match normalized observations")
            digest = content_hash(image.convert("RGBA").tobytes())
        hashes[frame.uid] = content_hash([frame.width, frame.height, digest])
    return content_hash([hashes[frame.uid] for frame in frames]), hashes


@_serialized_grouping
def evaluate_grouping_sequence(
    store: CandidateRuleStore, candidate_id: str, checkpoint: Mapping[str, Any], *,
    frames: Sequence[TemporalFrame], source_images: Mapping[str, bytes],
    labels: Sequence[GroupingValidationLabel], partition: str,
    evaluator_id: str, evaluator_version: str,
    swipl_executable: str | None = None, timeout: float = 30.0,
) -> dict[str, Any]:
    """Record genuine template replay evidence, leaving promotion to explicit gates."""
    if partition not in {"train", "held_out"} or not evaluator_id or not evaluator_version:
        raise ValueError("explicit replay partition and evaluator identity/version are required")
    candidate = store.get(candidate_id)
    if candidate["kind"] != "grouping":
        raise ValueError("grouping replay cannot grade event rules")
    # Compare the normalized persisted rule, not an arbitrary expression supplied
    # by a caller. Only the exact frozen measured-template grammar is supported.
    deployment = candidate["inducer_version"].startswith(DEPLOYMENT_VERSION + ":")
    if deployment:
        if len(candidate["parent_ids"]) != 1:
            raise ValueError("deployment must reference one original guarded proposal")
        parent = store.get(candidate["parent_ids"][0])
        proposal = _checkpoint_proposal(parent, checkpoint)
        if (candidate["scope"] != parent["scope"] or candidate["rule"] != _deployment_rule(proposal)
                or candidate["inducer_version"] != f"{DEPLOYMENT_VERSION}:{parent['version']}"
                or any(item["provenance"].get("groupingDeployment", {}).get("proposalCandidateId") != parent["candidate_id"]
                       or item["provenance"].get("groupingDeployment", {}).get("proposalVersion") != parent["version"]
                       or item["provenance"].get("groupingDeployment", {}).get("version") != DEPLOYMENT_VERSION
                       for item in candidate["proposals"])):
            raise ValueError("deployment AST or original proposal lineage does not match")
    else:
        _checkpoint_proposal(candidate, checkpoint)
    anchor_id = candidate["rule"]["head"]["args"][1]
    anchor = next(item for item in checkpoint["anchors"] if item["uid"] == anchor_id)
    prototype = {
        "uid": anchor_id,
        "revisions": [{"uid": anchor_id, "points": anchor["canonicalPoints"], "colors": [], "symbols": []}],
    }
    fingerprint, hashes = sequence_source_fingerprint(frames, source_images)
    if frames[0].provider_id != checkpoint["providerId"]:
        raise ValueError("provider-scoped grouping candidates cannot silently cross providers")
    training = _training_provenance(candidate)
    if partition == "held_out":
        if not training:
            raise ValueError("held-out replay requires persisted original-image training provenance")
        if _training_overlap(training, frames[0].provider_id, frames[0].sequence_id, fingerprint, list(hashes.values())):
            raise ValueError("held-out sources overlap prototype training evidence")
    sequence_id = "grouping-source-" + content_hash([frames[0].provider_id, frames[0].sequence_id])
    frame_index = {frame.uid: frame for frame in frames}
    results = []
    for label in labels:
        label.validate()
        if label.anchor_uid != anchor_id:
            raise ValueError("gold label belongs to another immutable shape anchor")
        frame = frame_index.get(label.frame_uid)
        if frame is None:
            raise ValueError("grouping label references a frame outside the replay")
        group = next((item for item in frame.groups if item.uid == label.group_uid), None)
        if group is None:
            raise ValueError("grouping labels must reference actual final G observations")
        matching = match_prototypes(group, [prototype])
        independent = (label.independent and label.origin != "prototype_prediction"
                       and not label.used_candidate_ids and not label.used_prototype_ids)
        similarity = max((item["pixelIou"] for item in matching["candidates"]), default=0.0)
        facts = [{"predicate": "observed_mask_similarity", "args": [group.uid, anchor_id, similarity]}]
        if independent and not deployment:
            facts.append({"predicate": "independent_group_support", "args": [group.uid]})
        predictions = evaluate_rule(
            candidate["rule"], kind="grouping", facts=facts,
            entity_ids=[*candidate["entity_ids"], group.uid],
            swipl_executable=swipl_executable, timeout=timeout,
        )
        predicted = {"predicate": "grouping_template_candidate", "args": [group.uid, anchor_id]} in predictions
        complete = bool(group.points) and label.expected_template_match is not None and independent
        if not complete or not predicted and label.expected_template_match is False:
            outcome = "inconclusive"
        elif predicted == label.expected_template_match:
            outcome = "support"
        else:
            outcome = "counterexample"
        observation_hash = content_hash([hashes[frame.uid], sorted(group.points)])
        evidence = {
            "sequence_id": sequence_id, "sequence_fingerprint": fingerprint,
            "observation_id": group.uid, "observation_hash": observation_hash,
            "partition": partition, "outcome": outcome, "comparison_complete": complete,
            "confidence": label.confidence, "grouping_ids": [group.uid] if predicted else [],
            "evidence_refs": [label.source_ref, anchor_id, observation_hash],
            "source": "deterministic_replay",
            "evaluator_id": evaluator_id, "evaluator_version": evaluator_version,
            "depends_on_candidates": list(label.used_candidate_ids),
            "depends_on_prototypes": list(label.used_prototype_ids),
            "provenance": {
                "adapterVersion": VERSION, "providerId": frame.provider_id, "sourceSequenceId": frame.sequence_id,
                "frameUid": frame.uid, "groupUid": group.uid, "anchorUid": anchor_id,
                "sourceImageHash": hashes[frame.uid], "labelSourceRef": label.source_ref,
                "labelOrigin": label.origin, "independentLabel": independent,
                "expectedTemplateMatch": label.expected_template_match, "predictedTemplateMatch": predicted,
                "matching": matching, "checkpointUid": checkpoint["checkpointUid"],
                "maskSource": group.mask_source,
                "facts": facts, "predictions": predictions, "ruleEngineVersion": engine_version(),
                "evaluatedRuleVersion": candidate["version"], "deployment": deployment,
            },
        }
        stored = store.record_grouping_evidence(candidate_id, evidence)
        _refresh_training_partitions(store, candidate_id)
        normalized_lists = {"grouping_ids", "evidence_refs", "depends_on_candidates", "depends_on_prototypes"}
        result_id = next(item["evidence_id"] for item in stored["evidence"]
                         if all(item[key] == (sorted(set(value)) if key in normalized_lists else value)
                                for key, value in evidence.items()))
        results.append({"groupUid": group.uid, "outcome": outcome, "evidenceId": result_id,
                        "prediction": predicted, "independent": independent})
    return {"candidateId": candidate_id, "sequenceFingerprint": fingerprint,
            "observations": results, "authority": "advisory_template_evaluation"}


@_serialized_grouping
def evaluate_grouping_promotion(
    store: CandidateRuleStore, candidate_id: str, *, gates: PromotionGates,
    promote: bool = False,
) -> dict[str, Any]:
    """Explicit shared-store gate check; installation never occurs merely on replay."""
    if store.get(candidate_id)["kind"] != "grouping":
        raise ValueError("expected a grouping candidate")
    _refresh_training_partitions(store, candidate_id)
    evaluation = store.evaluate(candidate_id, gates=gates)
    if promote:
        return {"evaluation": evaluation, "promotion": store.promote(candidate_id, gates=gates)}
    return {"evaluation": evaluation}
