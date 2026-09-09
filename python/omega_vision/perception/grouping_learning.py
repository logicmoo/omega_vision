"""Immutable observed prototypes and revisable grouping/background evidence.

This is measurement/induction input, not final G acceptance or a rule registry.
Candidate/evaluation records are exported to the caller's Candidate Rule Store;
no candidate is promoted here, particularly from its own inferred memberships.
"""
from __future__ import annotations

from dataclasses import asdict, dataclass
import json
import math
from pathlib import Path
from typing import Any, Mapping, Sequence

from omega_vision.perception.observation_identity import content_hash
from omega_vision.perception.symbolic_arc import _norm, _shape_forms
from omega_vision.perception.temporal_correspondence import (
    GroupObservation, TemporalFrame, _seal, canonical_json, frame_to_dict,
    implementation_hashes, shape_comparison, stable_id, validate_checkpoint,
)


VERSION = "grouping-learning-v1"


@dataclass(frozen=True)
class GroupingEvidence:
    source_ref: str
    origin: str
    independent: bool = False
    outcome: str = "support"
    used_candidate_ids: tuple[str, ...] = ()
    used_prototype_ids: tuple[str, ...] = ()
    background_role: str | None = None
    confidence: float = 1.0

    def validate(self) -> None:
        if not self.source_ref or self.origin not in {"authored_detector", "human_review", "external_measurement", "prototype_prediction"}:
            raise ValueError("grouping evidence needs a source reference and a typed origin")
        if self.outcome not in {"support", "counterexample", "ungraded"}:
            raise ValueError("unknown grouping evidence outcome")
        if self.background_role not in {None, "background", "foreground", "unknown"}:
            raise ValueError("invalid revisable background role")
        if not math.isfinite(self.confidence) or not 0 <= self.confidence <= 1:
            raise ValueError("evidence confidence must be between zero and one")


def shape_anchor(group: GroupObservation, *, provider_id: str) -> dict[str, Any]:
    """Immutable vocabulary anchor using symbolic_arc's existing shape forms."""
    if not group.points:
        raise ValueError("a shape anchor requires an observed mask")
    forms = _shape_forms(_shape_forms(group.points)["full_rn"][1])
    payload = {
        "schemaVersion": 1, "kind": "shape_point_anchor", "version": VERSION,
        "providerId": provider_id,
        "shapeKey": forms["full_rn"][0],
        "canonicalPoints": [list(p) for p in forms["full_rn"][1]],
        "forms": {name: {"shapeKey": key, "points": [list(p) for p in points]}
                  for name, (key, points) in sorted(forms.items())},
    }
    return {"uid": stable_id("shape-anchor", payload), **payload}


def _candidate_payload(prototype: Mapping[str, Any], provider_id: str) -> dict[str, Any]:
    return {
        "ruleKind": "grouping",
        "inducerVersion": VERSION,
        "scope": {"providerId": provider_id},
        "body": [
            {"predicate": "observed_mask_similarity", "args": [{"var": "Group"}, prototype["anchorUid"], {"var": "Score"}]},
            {"predicate": "greater_equal", "args": [{"var": "Score"}, 0.82]},
            {"predicate": "independent_group_support", "args": [{"var": "Group"}]},
        ],
        "head": {"predicate": "grouping_template_candidate", "args": [{"var": "Group"}, prototype["anchorUid"]]},
        "variables": ["Group", "Score"],
    }


def _candidate_id(prototype: Mapping[str, Any], provider_id: str) -> str:
    return stable_id("grouping-candidate", _candidate_payload(prototype, provider_id))


def match_prototypes(
    group: GroupObservation, prototypes: Sequence[Mapping[str, Any]], *,
    minimum_iou: float = 0.82, unique_margin: float = 0.03,
) -> dict[str, Any]:
    """Pixel-first later matching; symbols resolve pixel ties, never outrank pixels."""
    candidates = []
    for prototype in prototypes:
        if not prototype["revisions"]:
            continue
        # All observed revisions remain available; the immutable anchor is not
        # rewritten when a later foreground/background role or appearance changes.
        options = []
        for revision in prototype["revisions"]:
            comparison = shape_comparison(group.points, revision["points"])
            symbols_equal = canonical_json(group.symbols) == canonical_json(revision["symbols"])
            color_equal = list(group.colors) == revision["colors"]
            options.append({
                "prototypeUid": prototype["uid"], "revisionUid": revision["uid"],
                "pixelIou": comparison["iou"], "transforms": comparison["transforms"],
                "symbolicTieBreak": int(symbols_equal) + int(color_equal),
            })
        candidates.append(max(options, key=lambda row: (row["pixelIou"], row["symbolicTieBreak"], row["revisionUid"])))
    candidates.sort(key=lambda row: (-row["pixelIou"], -row["symbolicTieBreak"], row["prototypeUid"]))
    if not candidates or candidates[0]["pixelIou"] < minimum_iou:
        return {"status": "unmatched", "selected": None, "candidates": candidates}
    best = candidates[0]
    if len(candidates) > 1:
        runner = candidates[1]
        pixel_gap = best["pixelIou"] - runner["pixelIou"]
        exact_tie_resolved = abs(pixel_gap) < 1e-9 and best["symbolicTieBreak"] > runner["symbolicTieBreak"]
        if pixel_gap <= unique_margin and not exact_tie_resolved:
            return {"status": "ambiguous", "selected": None, "candidates": candidates}
    return {"status": "matched", "selected": best, "candidates": candidates}


def observe_grouping(
    frame: TemporalFrame, *,
    previous_state: Mapping[str, Any] | None = None,
    evidence_by_group: Mapping[str, GroupingEvidence] | None = None,
) -> dict[str, Any]:
    """Bootstrap/advance sequence-local observed prototypes without accepting Gs.

    ``evidence_by_group`` keys are final observation UIDs, never frame aliases.
    Omitted evidence remains ungraded, so observing a prototype does not train
    itself. Checkpoints use the shared immutable runtime persistence helper.
    """
    implementation_hash = content_hash(Path(__file__).read_bytes())
    dependency_hashes = implementation_hashes()
    if previous_state is not None:
        validate_checkpoint(previous_state)
        if (previous_state["providerId"], previous_state["sequenceId"], previous_state["frameOrder"] + 1) != (
            frame.provider_id, frame.sequence_id, frame.order,
        ):
            raise ValueError("grouping checkpoint provider/sequence/order mismatch")
        if previous_state["version"] != VERSION:
            raise ValueError("grouping version changed; replay with a new checkpoint chain")
        if (previous_state["implementationHash"] != implementation_hash
                or previous_state["dependencyHashes"] != dependency_hashes):
            raise ValueError("grouping implementation changed; replay the checkpoint chain")
    evidence_by_group = evidence_by_group or {}
    if set(evidence_by_group) - {group.uid for group in frame.groups}:
        raise ValueError("grouping evidence references a non-final/unknown observation")
    for evidence in evidence_by_group.values():
        evidence.validate()
    anchors = json.loads(canonical_json(previous_state["anchors"])) if previous_state else []
    prototypes = json.loads(canonical_json(previous_state["prototypes"])) if previous_state else []
    observations = []
    # A frame never learns by comparing against a prototype it just produced
    # from a sibling group in that same frame.
    prior_prototypes = json.loads(canonical_json(prototypes))
    for group in sorted(frame.groups, key=lambda item: item.uid):
        if not group.points:
            observations.append({"groupUid": group.uid, "status": "unmeasurable", "prototypeUid": None})
            continue
        match = match_prototypes(group, prior_prototypes)
        evidence = evidence_by_group.get(group.uid)
        if match["status"] == "ambiguous":
            observations.append({"groupUid": group.uid, "status": "ambiguous", "prototypeUid": None, "matching": match})
            continue
        if match["selected"] is None:
            anchor = shape_anchor(group, provider_id=frame.provider_id)
            if not any(existing["uid"] == anchor["uid"] for existing in anchors):
                anchors.append(anchor)
            prototype_uid = stable_id("observed-prototype", [VERSION, frame.provider_id, frame.sequence_id, group.uid])
            prototype = {
                "uid": prototype_uid, "anchorUid": anchor["uid"],
                "providerId": frame.provider_id, "sequenceId": frame.sequence_id,
                "seedObservationUid": group.uid, "revisions": [], "evidence": [],
            }
            prototypes.append(prototype)
        else:
            prototype_uid = match["selected"]["prototypeUid"]
            prototype = next(item for item in prototypes if item["uid"] == prototype_uid)
        revision_payload = {
            "prototypeUid": prototype_uid,
            "previousRevisionUid": prototype["revisions"][-1]["uid"] if prototype["revisions"] else None,
            "revision": len(prototype["revisions"]) + 1,
            "frameUid": frame.uid, "bundleUid": frame.bundle_uid, "frameOrder": frame.order,
            "observationUid": group.uid, "memberObservationUids": list(group.member_uids),
            "points": [list(p) for p in sorted(_norm(group.points))],
            "colors": list(group.colors), "symbols": json.loads(canonical_json(group.symbols)),
            "sourceHashes": dict(frame.source_hashes), "maskSource": group.mask_source,
        }
        revision = {"uid": stable_id("prototype-revision", revision_payload), **revision_payload}
        prototype["revisions"].append(revision)
        if evidence is not None:
            self_confirming = (
                evidence.origin == "prototype_prediction" or
                bool(evidence.used_prototype_ids) or bool(evidence.used_candidate_ids)
            )
            provenance = {
                "frameUid": frame.uid, "frameOrder": frame.order, "sequenceId": frame.sequence_id,
                "providerId": frame.provider_id, "observationUid": group.uid,
                "prototypeRevisionUid": revision["uid"], **asdict(evidence),
                "eligibleIndependentEvidence": bool(evidence.independent and not self_confirming),
                "exclusion": "self_confirming" if self_confirming else None,
            }
            record = {"uid": stable_id("grouping-evidence", provenance), **provenance}
            if not any(item["uid"] == record["uid"] for item in prototype["evidence"]):
                prototype["evidence"].append(record)
        role_support = {"background": [], "foreground": []}
        for record in prototype["evidence"]:
            if record["background_role"] in role_support and record["eligibleIndependentEvidence"]:
                role_support[record["background_role"]].append(record["uid"])
        totals = {
            role: sum(record["confidence"] for record in prototype["evidence"] if record["uid"] in refs)
            for role, refs in role_support.items()
        }
        role = "unknown" if totals["background"] == totals["foreground"] else max(totals, key=totals.get)
        prototype["backgroundRole"] = {
            "role": role, "support": role_support["background"], "counterexamples": role_support["foreground"],
            "scores": totals, "revisable": True,
        }
        observations.append({"groupUid": group.uid, "status": match["status"], "prototypeUid": prototype_uid,
                             "revisionUid": revision["uid"], "matching": match})
    checkpoint = _seal({
        "schemaVersion": 1, "version": VERSION, "providerId": frame.provider_id, "sequenceId": frame.sequence_id,
        "implementationHash": implementation_hash,
        "dependencyHashes": dependency_hashes,
        "frameUid": frame.uid, "bundleUid": frame.bundle_uid, "frameOrder": frame.order,
        "frameHash": content_hash(frame_to_dict(frame)),
        "previousCheckpointUid": previous_state["checkpointUid"] if previous_state else None,
        "anchors": sorted(anchors, key=lambda item: item["uid"]),
        "prototypes": sorted(prototypes, key=lambda item: item["uid"]),
    })
    return {
        "schemaVersion": 1, "version": VERSION, "authority": "advisory",
        "observations": observations, "checkpoint": checkpoint,
        "candidates": grouping_candidate_evaluations(checkpoint),
    }


def grouping_candidate_evaluations(
    checkpoint: Mapping[str, Any], *,
    held_out: Sequence[Mapping[str, Any]] = (),
) -> list[dict[str, Any]]:
    """Export candidate-store input, not installed rules or executable LLM text.

    Held-out rows require candidateUid, providerId, sequenceId, sourceRef,
    agrees (bool), independent (bool), and optional usedCandidateIds.
    """
    validate_checkpoint(checkpoint)
    output = {}
    for prototype in checkpoint["prototypes"]:
        payload = _candidate_payload(prototype, checkpoint["providerId"])
        uid = _candidate_id(prototype, checkpoint["providerId"])
        candidate = output.setdefault(uid, {
            "candidateUid": uid, **payload, "source": "measured_grouping_induction",
            "status": "proposed", "prototypeUids": [], "supportingIds": [], "contradictingIds": [],
            "excludedEvidenceIds": [], "trainingSources": [], "heldOut": [],
            "promotionAllowed": False,
            "promotionBlockers": ["requires_durable_candidate_store", "requires_cross_sequence_evaluation"],
        })
        candidate["prototypeUids"].append(prototype["uid"])
        for record in prototype["evidence"]:
            if not record["eligibleIndependentEvidence"] or record["outcome"] == "ungraded":
                candidate["excludedEvidenceIds"].append(record["uid"])
            elif record["outcome"] == "support":
                candidate["supportingIds"].append(record["uid"])
                candidate["trainingSources"].append({
                    "providerId": record["providerId"], "sequenceId": record["sequenceId"],
                    "frameUid": record["frameUid"], "sourceRef": record["source_ref"],
                })
            else:
                candidate["contradictingIds"].append(record["uid"])
    for row in held_out:
        if not row.get("sourceRef") or not isinstance(row.get("agrees"), bool) or not isinstance(row.get("independent"), bool):
            raise ValueError("held-out evaluation requires signed agreement and source provenance")
        candidate = output.get(row.get("candidateUid"))
        if candidate is None:
            raise ValueError("held-out evaluation references unknown candidate")
        independent = row["independent"] and not row.get("usedCandidateIds") and not row.get("usedPrototypeIds")
        held_sequence = (row.get("providerId"), row.get("sequenceId"))
        if not all(held_sequence):
            raise ValueError("held-out evaluation must identify provider and sequence")
        train_sequences = {(source["providerId"], source["sequenceId"]) for source in candidate["trainingSources"]}
        candidate["heldOut"].append({**dict(row), "eligible": independent and held_sequence not in train_sequences})
    for candidate in output.values():
        sources = {(source["providerId"], source["sequenceId"], source["sourceRef"]) for source in candidate["trainingSources"]}
        eligible = [row for row in candidate["heldOut"] if row["eligible"]]
        candidate["evaluation"] = {
            "distinctTrainingObservations": len(sources),
            "supportCount": len(set(candidate["supportingIds"])),
            "counterexampleCount": len(set(candidate["contradictingIds"])),
            "heldOutAgreement": sum(row["agrees"] for row in eligible) / len(eligible) if eligible else None,
            "heldOutCount": len(eligible),
        }
        for key in ("prototypeUids", "supportingIds", "contradictingIds", "excludedEvidenceIds"):
            candidate[key] = sorted(set(candidate[key]))
        candidate["storeProposal"] = candidate_store_proposal(candidate, checkpoint_uid=checkpoint["checkpointUid"])
    return sorted(output.values(), key=lambda item: item["candidateUid"])


def candidate_store_proposal(candidate: Mapping[str, Any], *, checkpoint_uid: str) -> dict[str, Any]:
    """Arguments for ``CandidateRuleStore.create(**proposal)``; no registry write.

    The authored schema is instantiated with an observed anchor. The store owns
    canonical candidate identity and promotion; ``candidateUid`` is only the
    proposer record ID. Frame-only evidence stays provenance, never fake events
    or positive Event->Event recurrence.
    """
    anchor_uid = candidate["head"]["args"][1]
    return {
        "rule": {
            "body": candidate["body"], "head": candidate["head"], "exceptions": [],
            "delay": {"min": 0, "max": 0}, "thresholds": {"minimum_mask_iou": 0.82},
        },
        "kind": "grouping", "scope": candidate["scope"], "source": "measured_grouping_induction",
        "inducer_version": candidate["inducerVersion"], "entity_ids": [anchor_uid],
        "provenance": {
            "proposalUid": candidate["candidateUid"], "checkpointUid": checkpoint_uid,
            "method": "authored_template_instantiated_from_observed_prototype",
            "prototypeUids": candidate["prototypeUids"],
            "supportingEvidenceIds": candidate["supportingIds"],
            "counterexampleEvidenceIds": candidate["contradictingIds"],
            "excludedEvidenceIds": candidate["excludedEvidenceIds"],
        },
        "assumptions": ["independent_group_support requires external measurement or human review"],
        "critiques": ["frame-only prototype examples do not establish positive temporal event recurrence"],
    }
