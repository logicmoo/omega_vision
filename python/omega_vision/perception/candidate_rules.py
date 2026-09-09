"""Filesystem-backed candidate rules, independent evidence, and explicit promotion gates."""

from __future__ import annotations

from dataclasses import asdict, dataclass
from datetime import datetime, timezone
from pathlib import Path
from typing import Any, Iterable

from ._event_journal import (
    IntegrityError, Journal, ValidationError, atomic_json, content_id, json_copy, strict_json,
)
from .event_records import (
    SCHEMA_VERSION, identifiers, normalize_rule, object_fields, probability, render_rule,
    string_list, text,
)


@dataclass(frozen=True)
class PromotionGates:
    min_independent_pairs: int = 2
    min_distinct_sequences: int = 2
    min_held_out_pairs: int = 1
    min_confidence: float = 0.8
    max_counterexamples: int = 0
    allow_llm: bool = False
    min_independent_groupings: int = 2
    min_held_out_groupings: int = 1

    def __post_init__(self) -> None:
        for name in (
            "min_independent_pairs", "min_distinct_sequences", "min_held_out_pairs",
            "max_counterexamples", "min_independent_groupings", "min_held_out_groupings",
        ):
            value = getattr(self, name)
            minimum = 0 if name == "max_counterexamples" else 1
            if type(value) is not int or value < minimum:
                raise ValidationError(f"{name} must be an integer >= {minimum}")
        if self.min_independent_pairs < 2:
            raise ValidationError("promotion always requires at least two independent positive pairs")
        if self.min_independent_groupings < 2:
            raise ValidationError("grouping promotion requires at least two independent positive groupings")
        probability(self.min_confidence, "min_confidence")
        if type(self.allow_llm) is not bool:
            raise ValidationError("allow_llm must be boolean")


def _now() -> str:
    return datetime.now(timezone.utc).isoformat()


def _provenance(value: Any) -> dict[str, Any]:
    if not isinstance(value, dict) or not value:
        raise ValidationError("nonempty provenance is required")
    return json_copy(value)


def _grouping_training(value: Any) -> dict[str, Any]:
    value = object_fields(
        value,
        {"providerId", "sequenceId", "sequenceFingerprint", "sourceImageHashes", "frameUids", "adapterVersion"},
        set(), "groupingTraining",
    )
    for key in ("providerId", "sequenceId", "sequenceFingerprint", "adapterVersion"):
        text(value[key], f"groupingTraining.{key}")
    for key in ("sourceImageHashes", "frameUids"):
        string_list(value[key], f"groupingTraining.{key}", nonempty=True)
    return {**json_copy(value), **{key: sorted(set(value[key])) for key in ("sourceImageHashes", "frameUids")}}


def _grouping_sources(evidence: dict[str, Any]) -> list[dict[str, Any]]:
    provenance = evidence.get("provenance", {})
    sources = [provenance]
    # The generic SWI grader preserves the original observation provenance nested.
    if isinstance(provenance.get("observation"), dict):
        sources.append(provenance["observation"])
    return sources


def _grouping_training_overlap(training: list[dict[str, Any]], evidence: dict[str, Any]) -> bool:
    sources = _grouping_sources(evidence)
    for sample in training:
        if evidence["sequence_id"] == sample.get("evidenceSequenceId"):
            return True
        if evidence["sequence_fingerprint"] == sample["sequenceFingerprint"]:
            return True
        for source in sources:
            if (
                sample["providerId"] and sample["sequenceId"]
                and source.get("providerId") == sample["providerId"]
                and source.get("sourceSequenceId") == sample["sequenceId"]
            ):
                return True
            if source.get("sourceImageHash") in sample["sourceImageHashes"]:
                return True
    return False


def _candidate_state(records: list[dict[str, Any]]) -> dict[str, dict[str, Any]]:
    candidates: dict[str, dict[str, Any]] = {}
    for record in records:
        event = record["payload"]
        candidate_id = event["candidate_id"]
        operation = event["operation"]
        if operation == "create":
            if candidate_id in candidates:
                raise IntegrityError("duplicate candidate creation")
            candidates[candidate_id] = {
                **event["candidate"], "evidence": [], "evaluations": [], "history": [],
                "proposals": [], "status": "proposed", "promoted_rule_ref": None,
            }
        if candidate_id not in candidates:
            raise IntegrityError("candidate history precedes creation")
        candidate = candidates[candidate_id]
        if operation in {"create", "proposal"}:
            candidate["proposals"].append(event["proposal"])
        elif operation == "evidence":
            candidate["evidence"].append(event["evidence"])
        elif operation == "evaluate":
            candidate["evaluations"].append(event["evaluation"])
        elif operation == "promote":
            candidate["promoted_rule_ref"] = event["rule_ref"]
        elif operation != "reject":
            raise IntegrityError(f"unsupported candidate operation: {operation}")
        if "status" in event:
            candidate["status"] = event["status"]
        candidate["history"].append({
            "revision": record["revision"], "transaction_id": record["id"],
            **json_copy(event),
        })
    return candidates


def effective_promoted_semantics(candidates: Iterable[dict[str, Any]], *,
                                 kinds: Iterable[str] | None = None) -> list[dict[str, Any]]:
    """Project execution inputs, not proposal receipts or evaluation history."""
    selected = set(kinds) if kinds is not None else None
    result = []
    for candidate in sorted(candidates, key=lambda row: row["candidate_id"]):
        if candidate["status"] != "promoted" or selected is not None and candidate["kind"] not in selected:
            continue
        row = {key: json_copy(candidate[key]) for key in ("candidate_id", "version", "kind", "scope", "rule")}
        if candidate["kind"] == "event_detector":
            row["runtime_confidence"] = candidate["evaluations"][-1]["metrics"]["minimum_support_confidence"]
        if candidate["kind"] == "grouping":
            row["prototype_ids"] = sorted({
                uid for proposal in candidate["proposals"]
                for uid in proposal.get("provenance", {}).get("prototypeUids", [])
            })
            row["training_frame_ids"] = sorted({
                uid for proposal in candidate["proposals"]
                for uid in proposal.get("provenance", {}).get("groupingTraining", {}).get("frameUids", [])
            })
            support = {}
            if any(term["predicate"] == "independent_group_support" for term in candidate["rule"]["body"]):
                for evidence in candidate["evidence"]:
                    provenance = evidence.get("provenance", {})
                    if (evidence["outcome"] != "support" or evidence["comparison_complete"] is not True
                            or evidence["depends_on_candidates"] or evidence.get("depends_on_prototypes")
                            or provenance.get("independentLabel") is not True
                            or provenance.get("expectedTemplateMatch") is not True
                            or provenance.get("labelOrigin") not in {
                                "human_review", "authored_detector", "external_measurement",
                            }):
                        continue
                    binding = {"observation_id": evidence["observation_id"], **{
                        key: provenance.get(key) for key in (
                            "providerId", "sourceSequenceId", "frameUid", "groupUid", "anchorUid", "sourceImageHash",
                        )
                    }}
                    support[content_id("runtime-support", binding)] = binding
            row["group_support"] = [support[key] for key in sorted(support)]
        result.append(row)
    return result


def _normalize_evidence(value: Any) -> dict[str, Any]:
    value = object_fields(
        value,
        {
            "sequence_id", "sequence_fingerprint", "pair_id", "before_hash", "after_hash",
            "partition", "outcome", "assessment", "comparison_complete", "confidence",
            "event_ids", "evidence_refs", "source", "evaluator_id", "evaluator_version",
            "depends_on_candidates",
        },
        {"provenance", "uncertainty"}, "candidate evidence",
    )
    result = json_copy(value)
    for key in ("sequence_id", "sequence_fingerprint", "pair_id", "before_hash", "after_hash", "evaluator_id", "evaluator_version"):
        text(value[key], key)
    if value["partition"] not in {"train", "held_out"}:
        raise ValidationError("partition must be train or held_out")
    if value["outcome"] not in {"support", "counterexample", "inconclusive"}:
        raise ValidationError("outcome must be support, counterexample, or inconclusive")
    if value["source"] not in {"deterministic_replay", "human_review", "llm_hypothesis"}:
        raise ValidationError("unsupported evidence source")
    if value["assessment"] not in {"changed", "no_material_change", "unknown", "initial_observation"}:
        raise ValidationError("invalid evidence assessment")
    if type(value["comparison_complete"]) is not bool:
        raise ValidationError("comparison_complete must be explicit")
    for field in ("event_ids", "evidence_refs", "depends_on_candidates"):
        result[field] = sorted(set(string_list(value[field], field)))
    result["confidence"] = probability(value["confidence"])
    if value["outcome"] != "inconclusive":
        if value["assessment"] in {"unknown", "initial_observation"} or not value["comparison_complete"]:
            raise ValidationError("uncertainty/boundary evidence cannot prove support or a counterexample")
        if not result["evidence_refs"]:
            raise ValidationError("graded evidence requires evidence_refs")
    if value["assessment"] == "no_material_change":
        if not value["comparison_complete"] or not result["evidence_refs"] or result["event_ids"]:
            raise ValidationError("no_material_change requires complete evidence and no positive event IDs")
    if value["outcome"] == "support" and (value["assessment"] != "changed" or not result["event_ids"]):
        raise ValidationError("positive recurrence requires a changed assessment with real event IDs")
    return {**result, "evidence_id": content_id("rule-evidence", result)}


def _input_key(evidence: dict[str, Any]) -> tuple[str, str]:
    # A renamed/reimported sequence and relabeled pair cannot manufacture independence.
    if evidence.get("evidence_kind") == "grouping_observation":
        return "grouping_observation", evidence["observation_hash"]
    return evidence["before_hash"], evidence["after_hash"]


def _normalize_grouping_evidence(value: Any) -> dict[str, Any]:
    value = object_fields(
        value,
        {
            "sequence_id", "sequence_fingerprint", "observation_id", "observation_hash",
            "partition", "outcome", "comparison_complete", "confidence", "grouping_ids",
            "evidence_refs", "source", "evaluator_id", "evaluator_version",
            "depends_on_candidates", "depends_on_prototypes", "provenance",
        },
        set(), "grouping evidence",
    )
    for key in ("sequence_id", "sequence_fingerprint", "observation_id", "observation_hash", "evaluator_id", "evaluator_version"):
        text(value[key], key)
    if value["partition"] not in {"train", "held_out"}:
        raise ValidationError("partition must be train or held_out")
    if value["outcome"] not in {"support", "counterexample", "inconclusive"}:
        raise ValidationError("invalid grouping outcome")
    if value["source"] not in {"deterministic_replay", "human_review", "llm_hypothesis"}:
        raise ValidationError("invalid grouping evidence source")
    if type(value["comparison_complete"]) is not bool:
        raise ValidationError("grouping comparison_complete must be boolean")
    result = json_copy(value)
    for key in ("grouping_ids", "evidence_refs", "depends_on_candidates", "depends_on_prototypes"):
        result[key] = sorted(set(string_list(value[key], key)))
    result["confidence"] = probability(value["confidence"])
    result["provenance"] = _provenance(value["provenance"])
    if value["outcome"] != "inconclusive" and (
        not value["comparison_complete"] or not result["evidence_refs"]
    ):
        raise ValidationError("graded grouping evidence requires a complete independent comparison")
    if value["outcome"] == "support" and not result["grouping_ids"]:
        raise ValidationError("grouping support requires actual independently observed grouping IDs")
    result["evidence_kind"] = "grouping_observation"
    return {**result, "evidence_id": content_id("rule-evidence", result)}


def _distinct_sequences(evidence: list[dict[str, Any]]) -> int:
    # Merge aliases of one content identity AND revisions of one source identity.
    parents: dict[tuple[str, str], tuple[str, str]] = {}

    def find(key: tuple[str, str]) -> tuple[str, str]:
        parents.setdefault(key, key)
        if parents[key] != key:
            parents[key] = find(parents[key])
        return parents[key]

    for item in evidence:
        source = ("source", item["sequence_id"])
        content = ("content", item["sequence_fingerprint"])
        parents[find(source)] = find(content)
    return len({find(key) for key in parents})


def _evaluation(
    candidate: dict[str, Any], gates: PromotionGates, manual_approval_by: str | None,
) -> dict[str, Any]:
    evidence = candidate["evidence"]
    grouping = candidate["kind"] == "grouping"
    dependencies = {candidate["candidate_id"], candidate["version"], *candidate["parent_ids"]}
    independent = [
        item for item in evidence
        if item["source"] in {"deterministic_replay", "human_review"}
        and not dependencies.intersection(item["depends_on_candidates"])
        and item["evaluator_id"] not in dependencies
        and not (grouping and (item["depends_on_candidates"] or item.get("depends_on_prototypes")))
    ]
    positives = [item for item in independent if item["outcome"] == "support"]
    negatives = [item for item in independent if item["outcome"] == "counterexample"]
    counter_keys = {_input_key(item) for item in negatives}
    all_train = {_input_key(item) for item in evidence if item["partition"] == "train"}
    training = [
        _grouping_training(proposal["provenance"]["groupingTraining"])
        for proposal in candidate["proposals"]
        if grouping and "groupingTraining" in proposal["provenance"]
    ]
    if grouping:
        for item in evidence:
            if item["partition"] != "train":
                continue
            for source in _grouping_sources(item):
                image_hash = source.get("sourceImageHash")
                training.append({
                    "evidenceSequenceId": item["sequence_id"],
                    "sequenceFingerprint": item["sequence_fingerprint"],
                    "providerId": source.get("providerId"), "sequenceId": source.get("sourceSequenceId"),
                    "sourceImageHashes": [image_hash] if isinstance(image_hash, str) and image_hash else [],
                })
    training_overlap = [item for item in evidence if grouping and _grouping_training_overlap(training, item)]
    # Reclassification is effective only: historical partitions are never rewritten.
    # Aliases of an overlapping observation cannot recover held-out credit.
    all_train.update(_input_key(item) for item in training_overlap)
    supported: dict[tuple[str, str], float] = {}
    held_out = set()
    for item in positives:
        key = _input_key(item)
        if key in counter_keys:
            continue
        supported[key] = min(supported.get(key, 1.0), item["confidence"])
        if item["partition"] == "held_out" and key not in all_train:
            held_out.add(key)
    confident = {key for key, confidence in supported.items() if confidence >= gates.min_confidence}
    # Both stable source identity AND sequence content must be distinct; aliases alone do not count.
    distinct_sequences = min(len(confident), _distinct_sequences([
        item for item in positives if _input_key(item) in confident
    ]))
    detector_replay = {
        _input_key(item) for item in positives
        if item["source"] == "deterministic_replay" and item["partition"] == "held_out"
        and _input_key(item) not in all_train and _input_key(item) in confident
    }
    contradictory_keys = counter_keys & {_input_key(item) for item in positives}
    reasons = []
    if len(confident) < (gates.min_independent_groupings if grouping else gates.min_independent_pairs):
        reasons.append("insufficient_independent_groupings" if grouping else "insufficient_independent_positive_pairs")
    if distinct_sequences < gates.min_distinct_sequences:
        reasons.append("insufficient_distinct_sequences")
    if len(held_out & confident) < (gates.min_held_out_groupings if grouping else gates.min_held_out_pairs):
        reasons.append("insufficient_independent_held_out_groupings" if grouping else "insufficient_independent_held_out_pairs")
    if len(counter_keys) > gates.max_counterexamples or contradictory_keys:
        reasons.append("unresolved_counterexamples")
    if candidate["kind"] == "event_detector" and len(detector_replay) < gates.min_held_out_pairs:
        reasons.append("detector_requires_held_out_deterministic_replay")
    if grouping and len(detector_replay) < gates.min_held_out_groupings:
        reasons.append("grouping_requires_held_out_deterministic_replay")
    llm = any(proposal["source"] == "llm_proposal" for proposal in candidate["proposals"])
    if llm and (not gates.allow_llm or not manual_approval_by):
        reasons.append("llm_candidates_require_explicit_manual_approval")
    if candidate["status"] == "rejected":
        reasons.append("candidate_is_rejected")
    metrics = {
        "evidence_count": len(evidence),
        "independent_positive_pairs": 0 if grouping else len(confident),
        "independent_positive_groupings": len(confident) if grouping else 0,
        "independent_positive_examples": len(confident),
        "distinct_sequences": distinct_sequences,
        "held_out_positive_pairs": 0 if grouping else len(held_out & confident),
        "held_out_positive_groupings": len(held_out & confident) if grouping else 0,
        "deterministic_held_out_pairs": 0 if grouping else len(detector_replay),
        "deterministic_held_out_groupings": len(detector_replay) if grouping else 0,
        "counterexample_pairs": 0 if grouping else len(counter_keys),
        "counterexample_groupings": len(counter_keys) if grouping else 0,
        "contradictory_pairs": 0 if grouping else len(contradictory_keys),
        "contradictory_groupings": len(contradictory_keys) if grouping else 0,
        "inconclusive_records": sum(item["outcome"] == "inconclusive" for item in evidence),
        "excluded_nonindependent_records": len(evidence) - len(independent),
        "minimum_support_confidence": min(supported.values()) if supported else None,
        "training_pairs": 0 if grouping else len(all_train),
        "training_groupings": len(all_train) if grouping else 0,
        "training_overlap_held_out_records": sum(item["partition"] == "held_out" for item in training_overlap),
    }
    payload = {
        "eligible": not reasons, "reasons": reasons, "metrics": metrics, "gates": asdict(gates),
        "manual_approval_by": manual_approval_by,
        "evidence_revision": content_id("evidence-set", sorted(item["evidence_id"] for item in evidence)),
        "proposal_revision": content_id("proposal-set", sorted(item["proposal_id"] for item in candidate["proposals"])),
    }
    return {**payload, "evaluation_id": content_id("evaluation", payload)}


class CandidateRuleStore:
    """One process-safe journal under workspace/runtime/rule-candidates.

    Promoted descriptors live under design/event-rules, but are effective ONLY
    while the corresponding candidate's latest lifecycle status is promoted.
    """

    def __init__(self, workspace_root: str | Path, *, lock_timeout: float = 30.0):
        self.workspace_root = Path(workspace_root)
        self.path = self.workspace_root / "runtime" / "rule-candidates"
        self.journal = Journal(self.path, lock_timeout=lock_timeout)

    def create(
        self, rule: dict[str, Any], *, kind: str, scope: dict[str, Any],
        source: str, provenance: dict[str, Any], inducer_version: str,
        entity_ids: Iterable[str] = (), parent_ids: Iterable[str] = (),
        assumptions: list[str] | None = None, critiques: list[str] | None = None,
        confidence: float | None = None, confidence_source: str | None = None,
    ) -> dict[str, Any]:
        if source not in {"prolog_induction", "llm_proposal", "authored", "measured_grouping_induction", "deterministic_induction"}:
            raise ValidationError("unsupported candidate source")
        if source == "measured_grouping_induction" and kind != "grouping":
            raise ValidationError("measured_grouping_induction is only valid for grouping candidates")
        if not isinstance(scope, dict) or not scope:
            raise ValidationError("scope must be a nonempty object")
        known = sorted(identifiers(entity_ids))
        normalized = normalize_rule(rule, kind=kind, entity_ids=known)
        provenance = _provenance(provenance)
        if kind == "grouping" and "groupingTraining" in provenance:
            provenance["groupingTraining"] = _grouping_training(provenance["groupingTraining"])
        text(inducer_version, "inducer_version")
        if source == "llm_proposal":
            for key in ("prompt_ref", "raw_output_ref", "model", "backend"):
                text(provenance.get(key), f"LLM provenance.{key}")
        identity = {
            "schema_version": SCHEMA_VERSION, "kind": kind, "scope": json_copy(scope),
            "inducer_version": inducer_version, "rule": normalized,
        }
        candidate_id = content_id("candidate", identity)
        proposal = {
            "source": source, "provenance": provenance,
            "assumptions": string_list(assumptions or [], "assumptions"),
            "critiques": string_list(critiques or [], "critiques"),
            "confidence": probability(confidence) if confidence is not None else None,
            "confidence_source": text(confidence_source, "confidence_source") if confidence is not None else None,
        }
        proposal["proposal_id"] = content_id("proposal", proposal)
        parents = sorted(set(string_list(list(parent_ids), "parent_ids")))
        with self.journal.transaction() as records:
            candidates = _candidate_state(records)
            for parent in parents:
                if parent not in candidates:
                    raise ValidationError(f"unknown parent candidate: {parent}")
            if candidate_id in candidates:
                candidate = candidates[candidate_id]
                if candidate["parent_ids"] != parents:
                    raise ValidationError("candidate lineage differs; revise the rule or inducer_version")
                if proposal["proposal_id"] not in {item["proposal_id"] for item in candidate["proposals"]}:
                    new_training = (kind == "grouping" and "groupingTraining" in provenance and not any(
                        previous["provenance"].get("groupingTraining") == provenance["groupingTraining"]
                        for previous in candidate["proposals"]
                    ))
                    invalidate = candidate["status"] in {"promoted", "eligible"} and (
                        source == "llm_proposal" or new_training
                    )
                    self.journal.append(records, {
                        "operation": "proposal", "candidate_id": candidate_id, "proposal": proposal,
                        "at": _now(),
                        **({"status": "demoted", "status_reason": "new_training_or_manual_proposal_requires_reevaluation"} if invalidate else {}),
                    })
            else:
                self.journal.append(records, {
                    "operation": "create", "candidate_id": candidate_id, "at": _now(),
                    "candidate": {
                        **identity, "candidate_id": candidate_id,
                        "version": content_id("rule-version", identity),
                        "entity_ids": known, "parent_ids": parents,
                        "canonical_rule": render_rule(normalized, kind=kind, entity_ids=known),
                    },
                    "proposal": proposal, "status": "proposed",
                })
            return json_copy(_candidate_state(records)[candidate_id])

    def get(self, candidate_id: str) -> dict[str, Any]:
        candidates = _candidate_state(self.journal.read())
        if candidate_id not in candidates:
            raise KeyError(f"unknown candidate: {candidate_id}")
        return json_copy(candidates[candidate_id])

    def list(self, *, kind: str | None = None, status: str | None = None) -> list[dict[str, Any]]:
        return [
            json_copy(candidate) for _, candidate in sorted(_candidate_state(self.journal.read()).items())
            if (kind is None or candidate["kind"] == kind) and (status is None or candidate["status"] == status)
        ]

    def effective_semantics(self, *, kinds: Iterable[str] | None = None,
                            records: list[dict[str, Any]] | None = None) -> list[dict[str, Any]]:
        if records is None:
            records = self.journal.read() if self.path.is_dir() else []
        return effective_promoted_semantics(_candidate_state(records).values(), kinds=kinds)

    def record_evidence(self, candidate_id: str, evidence: dict[str, Any]) -> dict[str, Any]:
        normalized = _normalize_evidence(evidence)
        return self._record_evidence(candidate_id, normalized, grouping=False)

    def record_grouping_evidence(self, candidate_id: str, evidence: dict[str, Any]) -> dict[str, Any]:
        """Grouping labels are observations, never fabricated changed pairs/events."""
        return self._record_evidence(candidate_id, _normalize_grouping_evidence(evidence), grouping=True)

    def _record_evidence(self, candidate_id: str, normalized: dict[str, Any], *, grouping: bool) -> dict[str, Any]:
        with self.journal.transaction() as records:
            candidate = self._get(records, candidate_id)
            if (candidate["kind"] == "grouping") != grouping:
                raise ValidationError("grouping candidates require typed grouping evidence; event candidates require pair evidence")
            if normalized["evidence_id"] not in {item["evidence_id"] for item in candidate["evidence"]}:
                # Any new evidence invalidates a previous promotion until its gates are rerun.
                self.journal.append(records, {
                    "operation": "evidence", "candidate_id": candidate_id,
                    "evidence": normalized, "at": _now(),
                    **({"status": "demoted"} if candidate["status"] in {"promoted", "eligible"} else {}),
                })
            return json_copy(_candidate_state(records)[candidate_id])

    @staticmethod
    def _get(records: list[dict[str, Any]], candidate_id: str) -> dict[str, Any]:
        candidates = _candidate_state(records)
        if candidate_id not in candidates:
            raise KeyError(f"unknown candidate: {candidate_id}")
        return candidates[candidate_id]

    def _evaluate_locked(
        self, records: list[dict[str, Any]], candidate_id: str, gates: PromotionGates,
        manual_approval_by: str | None,
    ) -> tuple[dict[str, Any], dict[str, Any]]:
        if not isinstance(gates, PromotionGates):
            raise ValidationError("explicit PromotionGates configuration is required")
        if manual_approval_by is not None:
            text(manual_approval_by, "manual_approval_by")
        candidate = self._get(records, candidate_id)
        result = _evaluation(candidate, gates, manual_approval_by)
        if candidate["status"] == "rejected":
            status = "rejected"
        elif result["eligible"]:
            status = "promoted" if candidate["status"] == "promoted" else "eligible"
        else:
            status = "demoted" if candidate["status"] in {"promoted", "demoted"} else "proposed"
        if (
            not candidate["evaluations"]
            or candidate["evaluations"][-1]["evaluation_id"] != result["evaluation_id"]
            or candidate["status"] != status
        ):
            self.journal.append(records, {
                "operation": "evaluate", "candidate_id": candidate_id, "at": _now(),
                "evaluation": result, "status": status,
            })
        return self._get(records, candidate_id), result

    def evaluate(
        self, candidate_id: str, *, gates: PromotionGates, manual_approval_by: str | None = None,
    ) -> dict[str, Any]:
        with self.journal.transaction() as records:
            candidate, result = self._evaluate_locked(records, candidate_id, gates, manual_approval_by)
            return {"candidate_id": candidate_id, "status": candidate["status"], **json_copy(result)}

    def promote(
        self, candidate_id: str, *, gates: PromotionGates, manual_approval_by: str | None = None,
    ) -> dict[str, Any]:
        with self.journal.transaction() as records:
            candidate, result = self._evaluate_locked(records, candidate_id, gates, manual_approval_by)
            if not result["eligible"]:
                raise ValidationError("promotion blocked: " + ", ".join(result["reasons"]))
            descriptor = {
                "schema_version": SCHEMA_VERSION, "candidate_id": candidate_id,
                "version": candidate["version"], "kind": candidate["kind"], "scope": candidate["scope"],
                "rule": normalize_rule(candidate["rule"], kind=candidate["kind"], entity_ids=candidate["entity_ids"]),
                "activation": "requires_current_candidate_status_promoted",
            }
            family = "grouping-rules" if candidate["kind"] == "grouping" else "event-rules"
            target = self.workspace_root / "design" / family / f"{candidate_id}.json"
            if target.exists():
                if strict_json(target.read_text(encoding="utf-8")) != descriptor:
                    raise IntegrityError(f"promoted descriptor changed: {target}")
            else:
                atomic_json(target, descriptor)
            if candidate["status"] != "promoted":
                self.journal.append(records, {
                    "operation": "promote", "candidate_id": candidate_id, "at": _now(),
                    "evaluation_id": result["evaluation_id"], "status": "promoted",
                    "rule_ref": str(target.relative_to(self.workspace_root)),
                    "manual_approval_by": manual_approval_by,
                })
            return json_copy(self._get(records, candidate_id))

    def reject(self, candidate_id: str, *, reason: str, provenance: dict[str, Any]) -> dict[str, Any]:
        reason, provenance = text(reason, "reason"), _provenance(provenance)
        with self.journal.transaction() as records:
            candidate = self._get(records, candidate_id)
            if candidate["status"] != "rejected":
                self.journal.append(records, {
                    "operation": "reject", "candidate_id": candidate_id, "status": "rejected",
                    "reason": reason, "provenance": provenance, "at": _now(),
                })
            return json_copy(self._get(records, candidate_id))
