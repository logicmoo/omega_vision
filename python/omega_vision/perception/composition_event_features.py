"""Experimental composition measurements and conservative group transitions.

This leaf consumes the existing authored object-composition proof. It neither
creates a parent pipeline nor persists data, promotes rules or changes O IDs.
It is not registered in the runtime. Criterion acceptance, completeness and
reference authority must come from trusted upstream producers that are not
implemented here; public content hashes alone do not establish that authority.
"""
from __future__ import annotations

from dataclasses import asdict, dataclass
from itertools import combinations
import json
import math
from pathlib import Path
from typing import Any, Mapping

from .event_deduction import ATTACHMENT_FACT_FAMILIES, attachment_facts_hash
from .event_records import probability, text, validate_term
from .object_evidence import validate_object_result
from .object_tracking import deduce_compositions, measure_composition_input
from .observation_identity import content_hash
from .temporal_correspondence import (
    TemporalFrame, canonical_json, frame_to_dict, initial_temporal_state,
    measure_frame_relations, stable_id, validate_temporal_result,
)

VERSION = "composition-event-features-v1"
CRITERION_ID = "authored-attached-co-moving-v1"
DETECTOR_ID = "authored_composition_transition"


def implementation_revision() -> dict[str, Any]:
    directory = Path(__file__).resolve().parent
    return {
        "version": VERSION,
        "sources": {name: content_hash((directory / name).read_bytes()) for name in (
            "composition_event_features.py", "object_tracking.py", "object_evidence.py",
            "event_records.py", "event_deduction.py", "temporal_correspondence.py",
        )},
    }


@dataclass(frozen=True)
class CompositionCriterion:
    """Accepted criterion plus the producer's complete dependency provenance.

    Dependencies include final-G acceptance, not just this leaf's rule file.
    ``independent=True`` must be attested by that producer, never inferred from
    the existence of a content hash or supplied by evaluator annotations.
    This leaf checks the supplied binding but does not resolve/authenticate
    ``source_ref`` or implement an acceptance producer.
    """

    criterion_id: str
    rule_hashes: Mapping[str, str]
    source_ref: str
    independent: bool = False
    used_candidate_ids: tuple[str, ...] = ()
    used_prototype_ids: tuple[str, ...] = ()
    minimum_confidence: float = 0.7
    motion_tolerance: float = 0.5

    def __post_init__(self) -> None:
        if self.criterion_id != CRITERION_ID:
            raise ValueError("only the existing authored attached/co-moving criterion is supported")
        text(self.source_ref, "criterion source reference")
        if not isinstance(self.rule_hashes, Mapping) or not self.rule_hashes:
            raise ValueError("criterion requires its independently accepted rule hashes")
        for name, digest in self.rule_hashes.items():
            text(name, "criterion rule")
            text(digest, "criterion rule hash")
        if type(self.independent) is not bool:
            raise ValueError("criterion independence must be an explicit boolean")
        for values in (self.used_candidate_ids, self.used_prototype_ids):
            if not isinstance(values, (tuple, list)):
                raise ValueError("criterion dependencies must be identifier collections")
            for value in values:
                text(value, "criterion dependency")
        probability(self.minimum_confidence, "composition minimum confidence")
        if type(self.motion_tolerance) not in (int, float) or not math.isfinite(self.motion_tolerance) or self.motion_tolerance < 0:
            raise ValueError("composition motion tolerance must be finite and nonnegative")

    @property
    def policy_hash(self) -> str:
        return content_hash({
            "criterion": self.criterion_id, "rules": dict(self.rule_hashes),
            "minimum_confidence": self.minimum_confidence, "motion_tolerance": self.motion_tolerance,
        })


@dataclass(frozen=True)
class SourceCheckpointBinding:
    """Expected IDs supplied from the caller's trusted artifact references."""

    temporal_checkpoint_uid: str
    object_checkpoint_uid: str
    source_temporal_checkpoint_uid: str | None
    source_object_checkpoint_uid: str | None
    previous_snapshot_uid: str | None

    def __post_init__(self) -> None:
        for name, value in asdict(self).items():
            if value is not None:
                text(value, name)
        if not self.temporal_checkpoint_uid or not self.object_checkpoint_uid:
            raise ValueError("current temporal/object checkpoint bindings are required")


def _term(name: str, *args: Any) -> dict[str, Any]:
    return {"predicate": name, "args": list(args)}


def _seal(kind: str, payload: dict[str, Any]) -> dict[str, Any]:
    payload = json.loads(canonical_json(payload))
    return {**payload, "snapshotUid": stable_id(kind, payload)}


def validate_composition_snapshot(value: Mapping[str, Any], *, expected_uid: str | None = None) -> None:
    if not isinstance(value, Mapping):
        raise ValueError("composition snapshot must be a sealed mapping")
    payload = {key: item for key, item in value.items() if key != "snapshotUid"}
    if value.get("snapshotUid") != stable_id("composition-snapshot", payload):
        raise ValueError("composition snapshot content hash mismatch")
    if expected_uid is not None and value["snapshotUid"] != expected_uid:
        raise ValueError("composition snapshot disagrees with its trusted reference")
    if value.get("schemaVersion") != 1 or value.get("version") != VERSION:
        raise ValueError("composition snapshot version changed; replay the suffix")
    if type(value.get("eligible")) is not bool:
        raise ValueError("composition eligibility must be boolean")
    for record in value["compositions"]:
        if record["truth"] is not None and type(record["truth"]) is not bool:
            raise ValueError("composition truth must be true, false or unknown")


def _connected(members: list[str], edges: list[list[str]]) -> bool:
    if not members:
        return False
    allowed, seen, pending = set(members), set(), [members[0]]
    while pending:
        member = pending.pop()
        if member in seen:
            continue
        seen.add(member)
        for left, right in edges:
            if left == member and right in allowed:
                pending.append(right)
            if right == member and left in allowed:
                pending.append(left)
    return seen == allowed


def _comparable(members: list[str], pairs: list[list[str]]) -> bool:
    available = {tuple(pair) for pair in pairs}
    return all(tuple(sorted(pair)) in available for pair in combinations(members, 2))


def _context(
    frame: TemporalFrame, objects: Mapping[str, Any], context: Mapping[str, Any],
) -> tuple[bool, list[str], str]:
    fields = {
        "frame_uid", "provider_id", "sequence_id", "facts_hash", "object_evidence_uid",
        "extraction_policy_hash", "complete", "background_roles_trusted",
    }
    if not isinstance(context, Mapping) or set(context) != fields:
        raise ValueError("composition requires the explicit attachment completeness context")
    for key in fields - {"complete", "background_roles_trusted"}:
        text(context[key], key)
    if (
        context["frame_uid"] != frame.uid or context["provider_id"] != frame.provider_id
        or context["sequence_id"] != frame.sequence_id
        or context["facts_hash"] != attachment_facts_hash(frame)
        or context["object_evidence_uid"] != objects["evidenceUid"]
    ):
        raise ValueError("composition context does not bind the current frame/facts/object evidence")
    complete = context["complete"]
    if (
        not isinstance(complete, Mapping) or set(complete) != set(ATTACHMENT_FACT_FAMILIES)
        or any(type(value) is not bool for value in complete.values())
        or type(context["background_roles_trusted"]) is not bool
    ):
        raise ValueError("composition completeness and background trust require explicit booleans")
    size = [frame.region_evidence.get(name) for name in ("width", "height")]
    if any(type(value) is not int or value <= 0 for value in size):
        raise ValueError("composition requires actual extractor-pixel dimensions")
    limitations = []
    if not all(complete.values()):
        limitations.append("incomplete_attachment_measurements")
    if not context["background_roles_trusted"]:
        limitations.append("untrusted_background_roles")
    return not limitations, limitations, content_hash({
        "policy": context["extraction_policy_hash"], "extractorSize": size,
    })


def build_composition_snapshot(
    frame: TemporalFrame,
    objects: Mapping[str, Any],
    *,
    attachment_context: Mapping[str, Any],
    criterion: CompositionCriterion,
    source_checkpoint_binding: SourceCheckpointBinding,
    temporal: Mapping[str, Any] | None = None,
    previous_snapshot: Mapping[str, Any] | None = None,
    swipl_executable: str | None = None,
) -> dict[str, Any]:
    """Validate and measure only this prefix; no files are written.

    ``attachment_context`` has the existing event-deduction context fields.
    Binding IDs must come from trusted source references, not be manufactured by
    re-sealing editable evidence. Dependency-tainted criterion support is unknown.
    """
    if not isinstance(criterion, CompositionCriterion) or not isinstance(source_checkpoint_binding, SourceCheckpointBinding):
        raise ValueError("typed criterion and source checkpoint binding are required")
    if not isinstance(attachment_context, Mapping):
        raise ValueError("composition requires its explicit attachment context")
    implementation_hash = content_hash(implementation_revision())
    if temporal is not None:
        validate_temporal_result(temporal)
        current_temporal = temporal["checkpoint"]
    else:
        current_temporal = initial_temporal_state(frame)
    measure_frame_relations(frame, temporal_state=current_temporal)
    validate_object_result(
        objects, expected_evidence_uid=attachment_context.get("object_evidence_uid"),
        expected_frame_uid=frame.uid, expected_temporal_checkpoint_uid=current_temporal["checkpointUid"],
        group_uids=[group.uid for group in frame.groups],
    )
    object_checkpoint = objects["checkpoint"]
    if (object_checkpoint["providerId"], object_checkpoint["sequenceId"], object_checkpoint["frameOrder"]) != (
        frame.provider_id, frame.sequence_id, frame.order,
    ):
        raise ValueError("composition object checkpoint belongs to another provider/sequence/order")
    binding = asdict(source_checkpoint_binding)
    actual_binding = {
        "temporal_checkpoint_uid": current_temporal["checkpointUid"],
        "object_checkpoint_uid": object_checkpoint["checkpointUid"],
        "source_temporal_checkpoint_uid": current_temporal["previousCheckpointUid"],
        "source_object_checkpoint_uid": object_checkpoint["previousCheckpointUid"],
        "previous_snapshot_uid": previous_snapshot["snapshotUid"] if previous_snapshot is not None else None,
    }
    if binding != actual_binding:
        raise ValueError("composition source checkpoint binding mismatch")
    if previous_snapshot is None:
        if temporal is not None or any(actual_binding[key] is not None for key in (
            "source_temporal_checkpoint_uid", "source_object_checkpoint_uid",
        )):
            raise ValueError("composition advance requires its sealed predecessor snapshot")
    else:
        validate_composition_snapshot(previous_snapshot, expected_uid=source_checkpoint_binding.previous_snapshot_uid)
        if previous_snapshot["implementationHash"] != implementation_hash:
            raise ValueError("composition implementation changed; replay the affected suffix")
        if (
            temporal is None or previous_snapshot["frameOrder"] + 1 != frame.order
            or previous_snapshot["frameUid"] != temporal["sourceFrameUid"]
            or previous_snapshot["frameOrder"] != temporal["sourceOrder"]
            or previous_snapshot["providerId"] != frame.provider_id or previous_snapshot["sequenceId"] != frame.sequence_id
            or previous_snapshot["temporalCheckpointUid"] != binding["source_temporal_checkpoint_uid"]
            or previous_snapshot["objectCheckpointUid"] != binding["source_object_checkpoint_uid"]
            or previous_snapshot["sourceHashes"] != temporal["sourceHashes"]
        ):
            raise ValueError("composition predecessor is stale, nonadjacent or forked")
    if dict(criterion.rule_hashes) != objects["ruleHashes"]:
        raise ValueError("composition criterion rule hashes differ from the actual object proof")
    eligible, limitations, extraction_hash = _context(frame, objects, attachment_context)
    if not criterion.independent or criterion.used_candidate_ids or criterion.used_prototype_ids:
        eligible = False
        limitations.append("criterion_support_not_independent")
    policy_hash = content_hash([criterion.policy_hash, extraction_hash, object_checkpoint["implementationHash"]])
    if previous_snapshot is not None and previous_snapshot["policyHash"] != policy_hash:
        raise ValueError("composition criterion/extraction policy changed; replay the affected suffix")

    prepared = measure_composition_input(frame, temporal, motion_tolerance=criterion.motion_tolerance)
    # The existing object envelope does not seal the caller's tolerance option.
    # Re-run the fixed authored rule over the actual bound measurements rather
    # than trusting an object-shaped dict or duplicating its Prolog criterion.
    measured = deduce_compositions(prepared, swipl_executable=swipl_executable)
    if canonical_json(measured) != canonical_json(objects["compositionEvidence"]):
        raise ValueError("object composition does not match the actual measurements/criterion")
    groups = {group.uid: group for group in frame.groups}
    tracks = {
        track["observationUid"]: track["trackUid"] for track in current_temporal["tracks"]
        if track["lastObservedOrder"] == frame.order
    }
    matches = {match["trackUid"]: match for match in temporal["matches"]} if temporal is not None else {}
    visible = {
        uid for uid in tracks.values() if temporal is None
        or uid in matches and not matches[uid]["reappeared"] and matches[uid]["confidence"] >= criterion.minimum_confidence
    }
    comparable_pairs = []
    for left, right in combinations(frame.groups, 2):
        if (
            tracks[left.uid] in visible and tracks[right.uid] in visible
            and left.member_uids and right.member_uids and left.member_aliases and right.member_aliases
            and not set(left.member_uids) & set(right.member_uids)
            and not set(left.member_aliases) & set(right.member_aliases)
        ):
            comparable_pairs.append(sorted([tracks[left.uid], tracks[right.uid]]))
    comparable_pairs.sort()
    edges = []
    for edge in measured["attachments"]:
        left, right = (groups[uid] for uid in edge["groups"])
        pair = sorted([tracks[left.uid], tracks[right.uid]])
        first, second = edge["witness"]["regions"]
        if not (
            first in left.member_aliases and second in right.member_aliases
            or first in right.member_aliases and second in left.member_aliases
        ):
            raise ValueError("composition attachment witness is outside its source groups")
        if pair in comparable_pairs:
            edges.append(pair)
    edges = [list(pair) for pair in sorted({tuple(pair) for pair in edges})]
    evidence = sorted(set([
        frame.uid, frame.bundle_uid, objects["evidenceUid"], object_checkpoint["checkpointUid"],
        current_temporal["checkpointUid"], attachment_context["facts_hash"],
        criterion.source_ref, *frame.source_hashes.values(),
    ]))
    components = {tuple(sorted(tracks[uid] for uid in members)): members for members in measured["components"]}
    compositions, object_ids = [], set()
    for obj in objects["objects"]:
        members = obj.get("memberTrackUids")
        if (
            not isinstance(members, list) or len(members) < 2 or members != sorted(set(members))
            or obj.get("uid") != stable_id("object", [frame.provider_id, frame.sequence_id, members])
            or obj["uid"] in object_ids
        ):
            raise ValueError("composition object identity/member tracks are invalid")
        object_ids.add(obj["uid"])
        truth, reason = None, "current_composition_not_confirmed"
        component = components.get(tuple(members))
        if component is not None:
            expected_motion = [row for row in prepared["motion"] if row["uid"] in component]
            expected_attachments = [row for row in measured["attachments"] if set(row["groups"]) <= set(component)]
            proofs = [proof for proof in obj.get("compositionHistory", []) if proof.get("frameUid") == frame.uid]
            if len(proofs) != 1:
                raise ValueError("current composition requires exactly one source-bound object proof")
            proof = proofs[0]
            if (
                proof.get("pairUid") != (temporal["pairUid"] if temporal is not None else None)
                or proof.get("ruleHashes") != objects["ruleHashes"]
                or sorted(proof.get("memberObservations", [])) != sorted(component)
                or canonical_json(proof.get("motion")) != canonical_json(expected_motion)
                or canonical_json(proof.get("attachments")) != canonical_json(expected_attachments)
            ):
                raise ValueError("object composition proof does not match current members/motion/attachments")
            if eligible and set(members) <= visible and _comparable(members, comparable_pairs):
                truth, reason = True, "authored_attachment_and_co_motion"
        elif eligible and set(members) <= visible and _comparable(members, comparable_pairs) and not _connected(members, edges):
            truth, reason = False, "visible_members_with_complete_contrary_attachment_evidence"
        if not eligible:
            reason = "ineligible_measurement_context"
        elif not set(members) <= visible:
            reason = "members_missing_or_correspondence_ungraded"
        if truth is None:
            limitations.append(f"{reason}:{obj['uid']}")
        compositions.append({
            "objectUid": obj["uid"], "memberTrackUids": members, "truth": truth,
            "reason": reason, "evidence": evidence,
            "confidence": min(matches[member]["confidence"] for member in members) if truth is not None else 0.0,
        })
    if set(components) - {tuple(row["memberTrackUids"]) for row in compositions}:
        raise ValueError("authored components lack their corresponding object identities")
    history = list(previous_snapshot["separationHistory"]) if previous_snapshot is not None else []
    if eligible:
        observation = {
            "frameUid": frame.uid, "frameOrder": frame.order, "visibleTrackUids": sorted(visible),
            "comparablePairs": comparable_pairs, "attachedPairs": edges, "evidence": evidence,
            "confidenceByTrackUid": {uid: matches[uid]["confidence"] if temporal is not None else 1.0 for uid in visible},
        }
        history.append({**observation, "evidenceUid": stable_id("composition-separation-evidence", observation)})
    established = dict(previous_snapshot["establishedObjects"]) if previous_snapshot is not None else {}
    for row in compositions:
        if row["truth"] is True or row["truth"] is False and row["objectUid"] in established:
            established[row["objectUid"]] = {
                "memberTrackUids": row["memberTrackUids"], "active": row["truth"],
                "frameUid": frame.uid, "frameOrder": frame.order, "evidence": evidence,
                "confidence": row["confidence"],
            }
    payload = {
        "schemaVersion": 1, "version": VERSION,
        "implementationHash": implementation_hash,
        "frameUid": frame.uid, "frameOrder": frame.order, "providerId": frame.provider_id,
        "sequenceId": frame.sequence_id, "frameHash": content_hash(frame_to_dict(frame)),
        "sourceHashes": dict(frame.source_hashes),
        "objectEvidenceUid": objects["evidenceUid"], "objectCheckpointUid": object_checkpoint["checkpointUid"],
        "temporalCheckpointUid": current_temporal["checkpointUid"], "sourceCheckpointBinding": binding,
        "previousSnapshotUid": actual_binding["previous_snapshot_uid"], "policyHash": policy_hash,
        "criterion": asdict(criterion), "attachmentContext": dict(attachment_context),
        "eligible": eligible, "limitations": sorted(set(limitations)), "evidence": evidence,
        "visibleTrackUids": sorted(visible), "comparablePairs": comparable_pairs, "attachedPairs": edges,
        "compositions": compositions, "establishedObjects": established, "separationHistory": history,
    }
    return _seal("composition-snapshot", payload)


def deduce_composition_transitions(
    previous_snapshot: Mapping[str, Any] | None, snapshot: Mapping[str, Any],
) -> dict[str, Any]:
    """Deduce only independently grounded formation/dissolution, at decision time."""
    validate_composition_snapshot(snapshot)
    if previous_snapshot is None:
        if snapshot["previousSnapshotUid"] is not None:
            raise ValueError("composition transition is missing its predecessor")
    else:
        validate_composition_snapshot(previous_snapshot, expected_uid=snapshot["previousSnapshotUid"])
        if (
            previous_snapshot["frameOrder"] + 1 != snapshot["frameOrder"]
            or previous_snapshot["providerId"] != snapshot["providerId"]
            or previous_snapshot["sequenceId"] != snapshot["sequenceId"]
            or previous_snapshot["policyHash"] != snapshot["policyHash"]
            or previous_snapshot["implementationHash"] != snapshot["implementationHash"]
            or snapshot["sourceCheckpointBinding"]["source_object_checkpoint_uid"] != previous_snapshot["objectCheckpointUid"]
            or snapshot["sourceCheckpointBinding"]["source_temporal_checkpoint_uid"] != previous_snapshot["temporalCheckpointUid"]
        ):
            raise ValueError("composition transition has a stale predecessor or changed policy; replay")
    known = sorted({
        *snapshot["visibleTrackUids"],
        *(row["objectUid"] for row in snapshot["compositions"]),
        *(member for row in snapshot["compositions"] for member in row["memberTrackUids"]),
    })
    facts, deductions, limitations = [], [], list(snapshot["limitations"])
    prior = previous_snapshot["establishedObjects"] if previous_snapshot is not None else {}
    for row in snapshot["compositions"]:
        members, uid = row["memberTrackUids"], row["objectUid"]
        if row["truth"] is True:
            facts.extend(_term("group_member", member, uid) for member in members)
        if previous_snapshot is None or row["truth"] is None:
            continue
        old = prior.get(uid)
        predicate, supporting = None, []
        confidence = row["confidence"]
        if row["truth"] is False and old is not None and old["active"]:
            predicate, supporting = "group_dissolved", old["evidence"]
            confidence = min(confidence, old["confidence"])
        elif row["truth"] is True and not (old is not None and old["active"]):
            overlapping = [record for other, record in prior.items()
                           if other != uid and record["active"] and set(members) & set(record["memberTrackUids"])]
            independent = [
                record for record in previous_snapshot["separationHistory"]
                if set(members) <= set(record["visibleTrackUids"])
                and _comparable(members, record["comparablePairs"])
                and not _connected(members, record["attachedPairs"])
            ]
            if overlapping:
                limitations.append(f"membership_continuity_unresolved:{uid}")
            elif independent:
                predicate, supporting = "group_formed", independent[-1]["evidence"]
                confidence = min(confidence, *(independent[-1]["confidenceByTrackUid"][member] for member in members))
            else:
                limitations.append(f"formation_baseline_unavailable:{uid}")
        if predicate is not None:
            term = validate_term(_term(predicate, uid), entity_ids=known, categories={"event"}).to_dict()
            deductions.append({
                "term": term, "confidence": confidence,
                "decisionFrameUid": snapshot["frameUid"], "decisionFrameOrder": snapshot["frameOrder"],
                "evidence": sorted(set([*row["evidence"], *supporting])),
                "provenance": {
                    "source": "authored_composition_proof", "detectorId": DETECTOR_ID,
                    "detectorVersion": content_hash([VERSION, snapshot["implementationHash"], snapshot["policyHash"]]),
                    "objectEvidenceUid": snapshot["objectEvidenceUid"],
                    "snapshotUid": snapshot["snapshotUid"], "criterionId": CRITERION_ID,
                },
            })
            facts.append(term)
    facts = [validate_term(term, entity_ids=known).to_dict() for term in facts]
    payload = {
        "version": VERSION, "fromFrameUid": previous_snapshot["frameUid"] if previous_snapshot is not None else None,
        "toFrameUid": snapshot["frameUid"], "entityIds": known, "facts": facts, "deductions": deductions,
        "assessment": "initial_observation" if previous_snapshot is None else (
            "changed" if deductions else "unknown" if limitations else "no_material_change"
        ),
        "reason": "no_predecessor" if previous_snapshot is None else None,
        "limitations": sorted(set(limitations)), "snapshotUid": snapshot["snapshotUid"],
        "previousSnapshotUid": snapshot["previousSnapshotUid"],
    }
    return {**payload, "evidenceUid": stable_id("composition-transition", payload)}
