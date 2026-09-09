"""Deterministic candidate induction and safe, data-only SWI rule replay.

Training labels may be LLM hypotheses. Promotion evidence may not confirm itself:
all replay grades retain the independent ground-truth source and dependencies.
"""

from __future__ import annotations

from collections import defaultdict
from pathlib import Path
from typing import Any, Iterable, Mapping, Sequence

from ._event_journal import Journal, ValidationError, canonical_json, content_id, json_copy, strict_json
from .candidate_rules import CandidateRuleStore, PromotionGates
from .event_deduction import RULES, run_prolog
from .event_records import (
    COMPARISONS, PREDICATES, identifiers, normalize_assessment, normalize_pair, normalize_rule,
    object_fields, pair_id, probability, render_term, string_list, text, validate_term,
)
from .observation_identity import content_hash

VERSION = "typed-event-induction-v1"
INDUCER_HASH = content_hash(Path(__file__).read_bytes())
FEATURES = frozenset({
    "displacement_magnitude", "shape_iou", "projected_exit_fraction", "overlap_ratio",
    "area_delta", "heading_delta", "rotation_delta", "present", "missing_match",
    "contact_delta", "overlap_delta", "contain_delta", "occlusion_overlap",
})


def engine_version() -> str:
    return content_id("typed-rule-engine", {
        "version": VERSION, "prolog": content_hash(RULES.read_bytes()),
        "python": INDUCER_HASH,
    })


def evaluate_rule(
    rule: dict[str, Any], *, kind: str, facts: Sequence[dict[str, Any]],
    entity_ids: Iterable[str], known_absent: Sequence[dict[str, Any]] = (),
    complete_predicates: Iterable[str] = (), swipl_executable: str | None = None,
    timeout: float = 30.0,
) -> list[dict[str, Any]]:
    """Evaluate a validated AST as inert node data, never as Prolog program text."""
    known = identifiers(entity_ids)
    normalized = normalize_rule(rule, kind=kind, entity_ids=known)
    ground = [validate_term(term, entity_ids=known).to_dict() for term in facts]
    absent = [validate_term(term, entity_ids=known).to_dict() for term in known_absent]
    complete = sorted(set(complete_predicates))
    if any(predicate not in PREDICATES for predicate in complete):
        raise ValidationError("completeness declarations require allowlisted predicates")
    output = run_prolog({
        "mode": "rules", "facts": ground, "absentFacts": absent, "completePredicates": complete,
        "rules": [{"candidate_id": "evaluation", "rule": normalized}],
    }, swipl_executable=swipl_executable, timeout=timeout)
    predictions = output.get("predictions")
    if not isinstance(predictions, list) or len(predictions) != 1 or predictions[0].get("candidate_id") != "evaluation":
        raise RuntimeError("typed rule replay returned an invalid prediction envelope")
    if not isinstance(predictions[0].get("terms"), list):
        raise RuntimeError("typed rule replay did not return a term list")
    categories = {"grouping"} if kind == "grouping" else {"event"}
    terms = [
        validate_term(term, entity_ids=known, categories=categories).to_dict()
        for term in predictions[0]["terms"]
    ]
    return list({canonical_json(term): term for term in sorted(terms, key=canonical_json)}.values())


def _scope_matches(scope: Mapping[str, Any], context: Mapping[str, Any]) -> bool:
    for key, value in scope.items():
        if key == "sequence_ids":
            if not isinstance(value, list) or not all(isinstance(item, str) for item in value):
                raise ValidationError("sequence_ids scope must be a list of stable sequence IDs")
            if context.get("sequence_id") not in value:
                return False
        elif context.get(key) != value:
            return False
    return True


def replay_promoted_detectors(
    store: CandidateRuleStore, facts: Sequence[dict[str, Any]], *,
    entity_ids: Iterable[str], scope_context: Mapping[str, Any],
    known_absent: Sequence[dict[str, Any]] = (), complete_predicates: Iterable[str] = (),
    swipl_executable: str | None = None, timeout: float = 30.0,
) -> dict[str, Any]:
    """Only promoted FrameEvidence->Event rules may produce canonical deductions."""
    known = identifiers(entity_ids)
    events, registry, skipped = [], {}, []
    engine = engine_version()
    for candidate in store.list(kind="event_detector", status="promoted"):
        if not _scope_matches(candidate["scope"], scope_context):
            skipped.append({"candidate_id": candidate["candidate_id"], "reason": "scope_mismatch"})
            continue
        if candidate["rule"]["delay"] != {"min": 0, "max": 0}:
            raise ValidationError("a pair detector cannot silently execute a delayed transition rule")
        predictions = evaluate_rule(
            candidate["rule"], kind="event_detector", facts=facts,
            entity_ids=known | identifiers(candidate["entity_ids"]),
            known_absent=known_absent, complete_predicates=complete_predicates,
            swipl_executable=swipl_executable, timeout=timeout,
        )
        detector = candidate["candidate_id"]
        version = content_id("learned-detector", [candidate["version"], engine])
        registry[detector] = version
        for term in predictions:
            validate_term(term, entity_ids=known, categories={"event"})
            events.append({
                "term": term,
                "confidence": candidate["evaluations"][-1]["metrics"]["minimum_support_confidence"],
                "evidence": [content_id("measured-fact", fact) for fact in facts],
                "uncertainty": [],
                "provenance": {
                    "source": "prolog", "detector_id": detector, "detector_version": version,
                    "artifact_hash": content_id("learned-deduction", [engine, candidate["version"], facts, term]),
                    "candidate_id": detector, "engine_version": engine,
                    "ground_truth_dependency": detector,
                },
            })
    grouped: dict[str, dict[str, Any]] = {}
    for event in events:
        key = canonical_json(event["term"])
        proof = {
            field: event["provenance"][field] for field in ("detector_id", "detector_version", "artifact_hash")
        }
        if key not in grouped:
            grouped[key] = event
            event["provenance"]["supporting_detectors"] = [proof]
            event["provenance"]["ground_truth_dependencies"] = [proof["detector_id"]]
        else:
            retained = grouped[key]
            retained["provenance"]["supporting_detectors"].append(proof)
            retained["provenance"]["ground_truth_dependencies"].append(proof["detector_id"])
            retained["provenance"]["artifact_hash"] = content_id(
                "combined-learned-deduction", retained["provenance"]["supporting_detectors"],
            )
            retained["confidence"] = min(retained["confidence"], event["confidence"])
    return {"events": [grouped[key] for key in sorted(grouped)], "accepted_detectors": registry, "skipped": skipped}


def replay_promoted_transitions(
    store: CandidateRuleStore, facts: Sequence[dict[str, Any]], *,
    entity_ids: Iterable[str], scope_context: Mapping[str, Any], source_order: int,
    swipl_executable: str | None = None, timeout: float = 30.0,
) -> list[dict[str, Any]]:
    """Predictions remain separate from canonical confirmed events."""
    output = []
    for kind in ("event_transition", "action_effect"):
        for candidate in store.list(kind=kind, status="promoted"):
            if not _scope_matches(candidate["scope"], scope_context):
                continue
            for term in evaluate_rule(
                candidate["rule"], kind=kind, facts=facts, entity_ids=entity_ids,
                swipl_executable=swipl_executable, timeout=timeout,
            ):
                prediction = {
                    "candidate_id": candidate["candidate_id"], "candidate_version": candidate["version"],
                    "term": term, "authoritative": False, "status": "prediction",
                    "source_order": source_order,
                    "due_order": {
                        key: source_order + value for key, value in candidate["rule"]["delay"].items()
                    },
                }
                output.append({**prediction, "prediction_id": content_id("event-prediction", prediction)})
    return output


def normalize_example(raw: dict[str, Any]) -> dict[str, Any]:
    raw = object_fields(
        raw,
        {
            "source_pair", "source_order", "target_order", "sequence_fingerprint", "entity_ids",
            "facts", "context", "actions", "events", "assessment", "comparison_complete",
            "confidence", "evidence", "uncertainty", "partition", "label_source",
            "label_coverage", "depends_on_candidates", "provenance",
        },
        {"known_absent", "complete_predicates", "scope_context"}, "learning example",
    )
    pair = normalize_pair(raw["source_pair"])
    if type(raw["source_order"]) is not int or type(raw["target_order"]) is not int or raw["target_order"] != raw["source_order"] + 1:
        raise ValidationError("learning examples must reference real adjacent source/target orders")
    known = identifiers(raw["entity_ids"])
    if raw["partition"] not in {"train", "held_out"}:
        raise ValidationError("learning partition must be train or held_out")
    if raw["label_source"] not in {"deterministic_replay", "human_review", "llm_hypothesis"}:
        raise ValidationError("unsupported independent label source")
    for key in ("facts", "context", "actions", "events"):
        if not isinstance(raw[key], list):
            raise ValidationError(f"example {key} must be a list")
    assessment = normalize_assessment(raw, event_count=len(raw["events"]))
    dependencies = set(string_list(raw["depends_on_candidates"], "depends_on_candidates"))
    events = []
    for item in raw["events"]:
        item = object_fields(item, {"term", "event_id", "confidence", "provenance"}, set(), "learning event")
        provenance = item["provenance"]
        if not isinstance(provenance, dict):
            raise ValidationError("learning event provenance must be an object")
        if raw["label_source"] != "llm_hypothesis" and (
            str(provenance.get("source", "")).startswith("llm")
            or ("model" in provenance and "backend" in provenance)
        ):
            raise ValidationError("LLM provenance cannot be relabeled as independent ground truth")
        for key in ("candidate_id", "ground_truth_dependency"):
            if provenance.get(key):
                dependencies.add(text(provenance[key], key))
        dependencies.update(string_list(provenance.get("ground_truth_dependencies", []), "ground_truth_dependencies"))
        if str(provenance.get("detector_id", "")).startswith("candidate-"):
            dependencies.add(provenance["detector_id"])
        events.append({
            **item, "term": validate_term(item["term"], entity_ids=known, categories={"event"}).to_dict(),
            "event_id": text(item["event_id"], "event_id"), "confidence": probability(item["confidence"]),
        })
    result = {
        **json_copy(raw), **assessment, "source_pair": pair, "entity_ids": sorted(known),
        "sequence_fingerprint": text(raw["sequence_fingerprint"], "sequence_fingerprint"),
        "events": events, "depends_on_candidates": sorted(dependencies),
    }
    for key, categories in (
        ("facts", {"evidence", "state", "relation", "grouping"}),
        ("context", {"state", "relation", "evidence", "grouping"}),
        ("actions", {"action"}),
    ):
        result[key] = [validate_term(term, entity_ids=known, categories=categories).to_dict() for term in raw[key]]
    result["known_absent"] = [validate_term(term, entity_ids=known).to_dict() for term in raw.get("known_absent", [])]
    scope_context = raw.get("scope_context", {})
    if not isinstance(scope_context, dict):
        raise ValidationError("scope_context must be an object")
    result["scope_context"] = {**json_copy(scope_context), "sequence_id": pair["sequence_id"]}
    for key in ("label_coverage", "complete_predicates"):
        values = string_list(raw.get(key, []), key)
        if any(value not in PREDICATES for value in values):
            raise ValidationError(f"{key} contains an unallowlisted predicate")
        result[key] = sorted(set(values))
    return {**result, "example_id": content_id("learning-example", result)}


def example_from_deduction(
    deduction: Mapping[str, Any], *, sequence_fingerprint: str, partition: str,
    hypotheses: Mapping[str, Any] | None = None, actions: Sequence[dict[str, Any]] = (),
    context: Sequence[dict[str, Any]] = (),
) -> dict[str, Any]:
    """Use exact deduced event identities, or explicitly non-independent LLM labels."""
    from .visual_event_log import _deduced_event
    assessment = deduction["assessment"]
    known = deduction["entity_ids"]
    labels = assessment
    events = []
    source = "deterministic_replay"
    if hypotheses is not None:
        if hypotheses.get("authoritative") is not False or hypotheses["source_pair"] != deduction["source_pair"]:
            raise ValidationError("hypotheses must be validated, advisory labels for this exact source pair")
        labels, source = hypotheses, "llm_hypothesis"
        for event in hypotheses["events"]:
            events.append({
                "term": event["term"], "event_id": event["hypothesis_id"],
                "confidence": event["confidence"], "provenance": hypotheses["provenance"],
            })
    else:
        for event in assessment["events"]:
            normalized = _deduced_event(event, deduction["source_pair"], identifiers(known), deduction["accepted_detectors"])
            events.append({
                "term": normalized["term"], "event_id": normalized["event_id"],
                "confidence": normalized["confidence"], "provenance": normalized["provenance"],
            })
    return normalize_example({
        "source_pair": deduction["source_pair"],
        "source_order": deduction["source_order"], "target_order": deduction["target_order"],
        "sequence_fingerprint": sequence_fingerprint, "entity_ids": known,
        "facts": deduction["facts"],
        "context": [
            *[fact for fact in deduction["facts"] if PREDICATES[fact["predicate"]].category in {"state", "relation"}],
            *list(context),
        ],
        "actions": list(actions),
        "events": events,
        **{key: labels[key] for key in ("assessment", "comparison_complete", "confidence", "evidence", "uncertainty")},
        "partition": partition, "label_source": source,
        "label_coverage": ["moved", "rotated", "shape_changed", "missing", "exited", "reappeared"],
        "depends_on_candidates": [], "provenance": labels["provenance"],
        "complete_predicates": deduction.get("complete_predicates", []),
        "known_absent": deduction.get("known_absent", []),
        "scope_context": {
            "domain": "visual-sequence", "provider_id": deduction["checkpoint"]["provider_id"],
        },
    })


def _examples(values: Sequence[dict[str, Any]]) -> list[dict[str, Any]]:
    normalized = []
    for value in values:
        raw = {key: item for key, item in value.items() if key != "example_id"}
        normalized.append(normalize_example(raw))
    by_id = {item["example_id"]: item for item in normalized}
    result = sorted(by_id.values(), key=lambda item: (
        item["source_pair"]["sequence_id"], item["target_order"], item["example_id"],
    ))
    positions: dict[tuple[str, int], dict[str, Any]] = {}
    for item in result:
        key = item["source_pair"]["sequence_id"], item["target_order"]
        if key in positions and positions[key] != item:
            raise ValidationError("learning inputs contain a fork or conflicting labels/partitions at one sequence order")
        positions[key] = item
    return result


def _entities(term: dict[str, Any]) -> set[str]:
    result = set()
    for arg, kind in zip(term["args"], PREDICATES[term["predicate"]].arguments):
        if kind == "entity" and isinstance(arg, str):
            result.add(arg)
        elif kind == "relation":
            result.update(_entities(arg))
    return result


def _generalize(head: dict[str, Any], body: list[dict[str, Any]], *, numbers: bool) -> tuple[dict[str, Any], list[tuple[str, float]], dict[str, str]]:
    entities: dict[str, str] = {}
    measurements = []

    def rewrite(term: dict[str, Any], numeric: bool) -> dict[str, Any]:
        args = []
        for arg, kind in zip(term["args"], PREDICATES[term["predicate"]].arguments):
            if kind == "entity":
                args.append({"var": entities.setdefault(arg, f"Entity{len(entities)}")})
            elif kind == "relation":
                args.append(rewrite(arg, numeric))
            elif kind == "number" and numeric:
                name = f"Measure{len(measurements)}"
                measurements.append((name, float(arg)))
                args.append({"var": name})
            else:
                args.append(arg)
        return {"predicate": term["predicate"], "args": args}

    normalized_head = rewrite(head, False)
    normalized_body = [rewrite(term, numbers) for term in body]
    return {"head": normalized_head, "body": normalized_body}, measurements, entities


def _bind(pattern: Any, value: Any, bindings: dict[str, Any]) -> bool:
    if isinstance(pattern, dict) and set(pattern) == {"var"}:
        name = pattern["var"]
        if name in bindings:
            return bindings[name] == value
        bindings[name] = value
        return True
    if isinstance(pattern, dict):
        return (
            isinstance(value, dict) and pattern.get("predicate") == value.get("predicate")
            and len(pattern.get("args", [])) == len(value.get("args", []))
            and all(_bind(left, right, bindings) for left, right in zip(pattern["args"], value["args"]))
        )
    return pattern == value


def _substitute(value: Any, bindings: dict[str, Any]) -> Any:
    if isinstance(value, dict) and set(value) == {"var"}:
        return bindings[value["var"]]
    if isinstance(value, dict):
        return {"predicate": value["predicate"], "args": [_substitute(arg, bindings) for arg in value["args"]]}
    return value


def _positive_key(example: dict[str, Any]) -> tuple[str, str]:
    pair = example["source_pair"]
    return pair["before_hash"], pair["after_hash"]


def _rewrite_entities(term: dict[str, Any], mapping: Mapping[str, str]) -> dict[str, Any]:
    args = []
    for arg, kind in zip(term["args"], PREDICATES[term["predicate"]].arguments):
        if kind == "entity":
            args.append({"var": mapping[arg]})
        elif kind == "relation":
            args.append(_rewrite_entities(arg, mapping))
        else:
            args.append(arg)
    return {"predicate": term["predicate"], "args": args}


def _common_context(samples: list[dict[str, Any]], rule: dict[str, Any]) -> list[dict[str, Any]]:
    common: dict[str, dict[str, Any]] | None = None
    for sample in samples:
        mapping = sample["entities"]
        terms = {}
        for term in sample["example"]["context"]:
            if not _entities(term) <= mapping.keys():
                continue
            generalized = _rewrite_entities(term, mapping)
            terms[canonical_json(generalized)] = generalized
        common = terms if common is None else {key: value for key, value in common.items() if key in terms}
    existing = {canonical_json(term) for term in rule["body"]}
    return [value for key, value in sorted((common or {}).items()) if key not in existing]


def _learn_exceptions(
    rule: dict[str, Any], samples: list[dict[str, Any]], examples: list[dict[str, Any]],
) -> list[dict[str, Any]]:
    """Find repeated negative-only observed contexts; absence still needs replay coverage."""
    positive_contexts = {
        canonical_json(_rewrite_entities(term, sample["entities"]))
        for sample in samples for term in sample["example"]["context"]
        if _entities(term) <= sample["entities"].keys()
    }
    negative_contexts: dict[str, tuple[dict[str, Any], set[tuple[str, str]]]] = {}
    for example in examples:
        if example["partition"] != "train" or not example["comparison_complete"] or example["assessment"] == "unknown":
            continue
        for fact in example["facts"]:
            bindings: dict[str, Any] = {}
            if not _bind(rule["body"][0], fact, bindings):
                continue
            head = _substitute(rule["head"], bindings)
            if any(label["term"] == head for label in example["events"]):
                continue
            if example["assessment"] != "no_material_change" and head["predicate"] not in example["label_coverage"]:
                continue
            entities = {value: name for name, value in bindings.items() if isinstance(value, str)}
            for term in example["context"]:
                if not _entities(term) <= entities.keys():
                    continue
                generalized = _rewrite_entities(term, entities)
                key = canonical_json(generalized)
                if key not in positive_contexts:
                    negative_contexts.setdefault(key, (generalized, set()))[1].add(_positive_key(example))
    return [
        term for _, (term, examples) in sorted(negative_contexts.items()) if len(examples) >= 2
    ]


def _persist(
    store: CandidateRuleStore, proposals: list[dict[str, Any]], *, kind: str,
    scope: dict[str, Any], examples: list[dict[str, Any]],
    gates: PromotionGates | None, promote: bool, swipl_executable: str | None, timeout: float,
) -> dict[str, Any]:
    if promote and gates is None:
        raise ValidationError("automatic promotion requires explicit configured gates")
    candidates = {}
    # Every proposal is durable before any candidate is evaluated.
    for proposal in proposals:
        candidate = store.create(
            proposal["rule"], kind=kind, scope=scope, source="deterministic_induction",
            provenance={
                "inducer": VERSION, "engine_version": engine_version(),
                "supporting_example_ids": sorted({sample["example"]["example_id"] for sample in proposal["samples"]}),
                "label_sources": sorted({sample["example"]["label_source"] for sample in proposal["samples"]}),
                "algorithm": proposal["algorithm"],
            },
            inducer_version=VERSION,
            confidence=min(sample["confidence"] for sample in proposal["samples"]),
            confidence_source="training_label_minimum_advisory",
        )
        candidates[candidate["candidate_id"]] = candidate
    evaluations = []
    if gates is not None:
        for candidate_id in candidates:
            evaluations.append(evaluate_candidate(
                store, candidate_id, examples, gates=gates, promote=promote,
                swipl_executable=swipl_executable, timeout=timeout,
            ))
    return {
        "version": VERSION, "kind": kind,
        "candidates": [store.get(candidate_id) for candidate_id in candidates],
        "evaluations": evaluations,
    }


def induce_detector_rules(
    store: CandidateRuleStore, examples: Sequence[dict[str, Any]], *, scope: dict[str, Any],
    feature_predicates: Iterable[str] = FEATURES, gates: PromotionGates | None = None,
    learn_exceptions: bool = True,
    promote: bool = False, swipl_executable: str | None = None, timeout: float = 30.0,
) -> dict[str, Any]:
    """Learn range-restricted measurement rules and separating numeric thresholds."""
    examples = [example for example in _examples(examples) if _scope_matches(scope, example["scope_context"])]
    features = set(feature_predicates)
    if any(predicate not in PREDICATES or PREDICATES[predicate].category != "evidence" for predicate in features):
        raise ValidationError("detector induction features must be allowlisted measurements")
    groups: dict[str, list[dict[str, Any]]] = defaultdict(list)
    for example in examples:
        if example["partition"] != "train" or example["assessment"] != "changed":
            continue
        for label in example["events"]:
            for fact in example["facts"]:
                if fact["predicate"] not in features or not _entities(label["term"]) <= _entities(fact):
                    continue
                rule, measurements, entities = _generalize(label["term"], [fact], numbers=True)
                groups[canonical_json(rule)].append({
                    "rule": rule, "example": example, "measurements": measurements,
                    "entities": entities, "confidence": label["confidence"],
                })
    proposals = []
    for samples in groups.values():
        if len({_positive_key(sample["example"]) for sample in samples}) < 2:
            continue
        rule = json_copy(samples[0]["rule"])
        measure_names = [name for name, _ in samples[0]["measurements"]]
        negatives: dict[str, list[float]] = defaultdict(list)
        for example in examples:
            if example["partition"] != "train" or not example["comparison_complete"] or example["assessment"] == "unknown":
                continue
            for fact in example["facts"]:
                bindings: dict[str, Any] = {}
                if not _bind(rule["body"][0], fact, bindings):
                    continue
                head = _substitute(rule["head"], bindings)
                if any(label["term"] == head for label in example["events"]):
                    continue
                if example["assessment"] != "no_material_change" and head["predicate"] not in example["label_coverage"]:
                    continue
                for name in measure_names:
                    negatives[name].append(float(bindings[name]))
        for index, name in enumerate(measure_names):
            values = [sample["measurements"][index][1] for sample in samples]
            lower, upper = min(values), max(values)
            below = [value for value in negatives[name] if value < lower]
            above = [value for value in negatives[name] if value > upper]
            if below or not above:
                threshold = (max(below) + lower) / 2 if below else lower
                rule["body"].append({"predicate": "greater_equal", "args": [{"var": name}, threshold]})
            if above:
                rule["body"].append({"predicate": "less_equal", "args": [{"var": name}, (upper + min(above)) / 2]})
        rule["body"].extend(_common_context(samples, rule))
        rule["exceptions"] = _learn_exceptions(rule, samples, examples) if learn_exceptions else []
        rule["delay"] = {"min": 0, "max": 0}
        rule["thresholds"] = {}
        proposals.append({"rule": rule, "samples": samples, "algorithm": "measurement_anti_unification_with_training_thresholds"})
    return _persist(
        store, proposals, kind="event_detector", scope=scope, examples=examples,
        gates=gates, promote=promote, swipl_executable=swipl_executable, timeout=timeout,
    )


def induce_transition_rules(
    store: CandidateRuleStore, examples: Sequence[dict[str, Any]], *, scope: dict[str, Any],
    kind: str = "event_transition", max_delay: int = 1,
    gates: PromotionGates | None = None, promote: bool = False,
    swipl_executable: str | None = None, timeout: float = 30.0,
) -> dict[str, Any]:
    if kind not in {"event_transition", "action_effect"}:
        raise ValidationError("transition induction kind must be event_transition or action_effect")
    if type(max_delay) is not int or max_delay < (1 if kind == "event_transition" else 0):
        raise ValidationError("invalid transition delay window")
    examples = _examples(examples)
    positions = {(example["source_pair"]["sequence_id"], example["target_order"]): example for example in examples}
    groups: dict[str, list[dict[str, Any]]] = defaultdict(list)
    for source in examples:
        if not _scope_matches(scope, source["scope_context"]):
            continue
        if source["partition"] != "train":
            continue
        antecedents = [event["term"] for event in source["events"]] if kind == "event_transition" else source["actions"]
        for delay in range(1 if kind == "event_transition" else 0, max_delay + 1):
            window = [positions.get((source["source_pair"]["sequence_id"], order)) for order in range(source["target_order"], source["target_order"] + delay + 1)]
            if any(item is None or item["partition"] != "train" for item in window):
                continue
            if any(left["source_pair"]["to_frame"] != right["source_pair"]["from_frame"] for left, right in zip(window, window[1:])):
                raise ValidationError("transition learning encountered an adjacency gap")
            target = window[-1]
            for body in antecedents:
                for label in target["events"]:
                    context = []
                    missing = _entities(label["term"]) - _entities(body)
                    for fact in source["context"]:
                        if missing & _entities(fact):
                            context.append(fact)
                            missing -= _entities(fact)
                    if missing:
                        continue
                    rule, _, entities = _generalize(label["term"], [body, *context], numbers=False)
                    rule["delay"] = {"min": delay, "max": delay}
                    groups[canonical_json(rule)].append({
                        "rule": rule, "example": source, "entities": entities,
                        "confidence": label["confidence"],
                    })
    proposals = []
    for samples in groups.values():
        if len({_positive_key(sample["example"]) for sample in samples}) < 2:
            continue
        rule = json_copy(samples[0]["rule"])
        rule["body"].extend(_common_context(samples, rule))
        rule.update(exceptions=[], thresholds={})
        proposals.append({"rule": rule, "samples": samples, "algorithm": "ordered_event_action_anti_unification"})
    return _persist(
        store, proposals, kind=kind, scope=scope, examples=examples,
        gates=gates, promote=promote, swipl_executable=swipl_executable, timeout=timeout,
    )


def evaluate_candidate(
    store: CandidateRuleStore, candidate_id: str, examples: Sequence[dict[str, Any]], *,
    gates: PromotionGates, promote: bool = False,
    swipl_executable: str | None = None, timeout: float = 30.0,
) -> dict[str, Any]:
    """Replay against independent labels; unknown horizons are pending, not negatives."""
    candidate = store.get(candidate_id)
    if candidate["kind"] not in {"event_detector", "event_transition", "action_effect"}:
        raise ValidationError("event replay cannot grade grouping observations as events")
    examples = _examples(examples)
    positions = {(example["source_pair"]["sequence_id"], example["target_order"]): example for example in examples}
    traces, pending = [], 0
    for source in examples:
        if not _scope_matches(candidate["scope"], source["scope_context"]):
            traces.append({"source_example_id": source["example_id"], "outcome": "out_of_scope", "predictions": []})
            continue
        body_facts = [*source["facts"], *source["context"]]
        if candidate["kind"] == "event_transition":
            body_facts.extend(event["term"] for event in source["events"])
        elif candidate["kind"] == "action_effect":
            body_facts.extend(source["actions"])
            body_facts.extend(event["term"] for event in source["events"])
        predictions = evaluate_rule(
            candidate["rule"], kind=candidate["kind"], facts=body_facts,
            entity_ids=source["entity_ids"], known_absent=source["known_absent"],
            complete_predicates=source["complete_predicates"],
            swipl_executable=swipl_executable, timeout=timeout,
        )
        delay = candidate["rule"]["delay"]
        full_window = [positions.get((source["source_pair"]["sequence_id"], source["target_order"] + step)) for step in range(delay["max"] + 1)]
        if any(item is None for item in full_window):
            missing_index = next(index for index, item in enumerate(full_window) if item is None)
            if any(item is not None for item in full_window[missing_index:]):
                raise ValidationError("transition replay encountered an adjacency gap")
            full_window = full_window[:missing_index]
        horizon = full_window[delay["min"]:]
        observed_terms = [event["term"] for item in horizon for event in item["events"]]
        early_confirmation = bool(predictions) and all(term in observed_terms for term in predictions)
        if not horizon or (len(full_window) < delay["max"] + 1 and not early_confirmation):
            pending += int(bool(predictions))
            continue
        if any(
            left["source_pair"]["to_frame"] != right["source_pair"]["from_frame"]
            for left, right in zip(full_window, full_window[1:])
        ):
            raise ValidationError("transition replay encountered an adjacency gap")
        if any(target["partition"] != source["partition"] for target in horizon):
            raise ValidationError("training and held-out partitions cannot share a transition evaluation window")
        target = horizon[-1]
        matches = [
            event for item in horizon for event in item["events"]
            if event["term"] in predictions
        ]
        complete = all(item["comparison_complete"] and item["assessment"] != "unknown" for item in horizon)
        uncovered = [
            prediction for prediction in predictions
            if not any(event["term"] == prediction for event in matches)
        ]
        negative_proven = bool(uncovered) and all(
            item["assessment"] == "no_material_change"
            or all(prediction["predicate"] in item["label_coverage"] for prediction in uncovered)
            for item in horizon
        )
        if complete and negative_proven:
            outcome = "counterexample"
        elif complete and matches and not uncovered:
            outcome = "support"
        else:
            outcome = "inconclusive"
        if outcome == "support":
            # Anchor recurrence to the actual observed effect pair, not an unrelated
            # later frame at the end of a delay window.
            target = next(item for item in horizon if any(event["term"] in predictions for event in item["events"]))
        graded_matches = [
            event for event in target["events"] if event["term"] in predictions
        ] if outcome != "counterexample" else []
        label_source = "llm_hypothesis" if any(item["label_source"] == "llm_hypothesis" for item in [source, *horizon]) else "deterministic_replay"
        dependencies = sorted({dependency for item in [source, *horizon] for dependency in item["depends_on_candidates"]})
        pair = target["source_pair"]
        evidence = {
            "sequence_id": pair["sequence_id"], "sequence_fingerprint": target["sequence_fingerprint"],
            "pair_id": pair_id(pair), "before_hash": pair["before_hash"], "after_hash": pair["after_hash"],
            "partition": target["partition"], "outcome": outcome,
            "assessment": target["assessment"],
            "comparison_complete": complete, "confidence": min(
                source["confidence"], min((event["confidence"] for event in matches), default=target["confidence"]),
            ),
            "event_ids": sorted({event["event_id"] for event in graded_matches}),
            "evidence_refs": sorted({ref for item in [source, *horizon] for ref in item["evidence"]}),
            "source": label_source, "evaluator_id": "authored-prolog-typed-ast-replay",
            "evaluator_version": engine_version(), "depends_on_candidates": dependencies,
            "provenance": {
                "source_example_id": source["example_id"], "target_example_ids": [item["example_id"] for item in horizon],
                "predictions": predictions, "label_sources": [item["label_source"] for item in [source, *horizon]],
                "matched_label_ids": sorted({event["event_id"] for event in matches}),
            },
        }
        store.record_evidence(candidate_id, evidence)
        traces.append({"source_example_id": source["example_id"], "outcome": outcome, "predictions": predictions})
    result = store.evaluate(candidate_id, gates=gates)
    if promote and result["eligible"]:
        store.promote(candidate_id, gates=gates)
    return {
        "candidate_id": candidate_id, "evaluation": result, "traces": traces,
        "pending_horizons": pending, "status": store.get(candidate_id)["status"],
    }


def evaluate_grouping_candidate(
    store: CandidateRuleStore, candidate_id: str, observations: Sequence[dict[str, Any]], *,
    gates: PromotionGates, promote: bool = False,
    swipl_executable: str | None = None, timeout: float = 30.0,
) -> dict[str, Any]:
    """Grade independent grouping observations, not invented temporal events."""
    candidate = store.get(candidate_id)
    if candidate["kind"] != "grouping":
        raise ValidationError("grouping replay only grades grouping candidates")
    traces = []
    for raw in observations:
        raw = object_fields(
            raw,
            {
                "sequence_id", "sequence_fingerprint", "observation_id", "observation_hash",
                "entity_ids", "facts", "labels", "label_coverage", "comparison_complete",
                "confidence", "evidence_refs", "partition", "label_source",
                "depends_on_candidates", "depends_on_prototypes", "provenance", "scope_context",
            },
            {"known_absent", "complete_predicates"}, "grouping replay observation",
        )
        if not isinstance(raw["scope_context"], dict):
            raise ValidationError("grouping scope_context must be an object")
        if not _scope_matches(candidate["scope"], {**raw["scope_context"], "sequence_id": raw["sequence_id"]}):
            traces.append({"observation_id": raw["observation_id"], "outcome": "out_of_scope"})
            continue
        if raw["label_source"] not in {"deterministic_replay", "human_review", "llm_hypothesis"}:
            raise ValidationError("invalid grouping label source")
        if not isinstance(raw["provenance"], dict):
            raise ValidationError("grouping provenance must be an object")
        if raw["label_source"] != "llm_hypothesis" and (
            str(raw["provenance"].get("source", "")).startswith("llm")
            or ("model" in raw["provenance"] and "backend" in raw["provenance"])
        ):
            raise ValidationError("LLM grouping provenance cannot be relabeled as independent")
        if type(raw["comparison_complete"]) is not bool:
            raise ValidationError("grouping comparison_complete must be an explicit boolean")
        known = identifiers([*raw["entity_ids"], *candidate["entity_ids"]])
        if not isinstance(raw["labels"], list):
            raise ValidationError("grouping labels must be a list")
        labels = []
        for label in raw["labels"]:
            object_fields(label, {"term", "grouping_id"}, set(), "independent grouping label")
            labels.append({
                "term": validate_term(label["term"], entity_ids=known, categories={"grouping"}).to_dict(),
                "grouping_id": text(label["grouping_id"], "grouping_id"),
            })
        coverage = string_list(raw["label_coverage"], "grouping label_coverage")
        if any(predicate not in PREDICATES or PREDICATES[predicate].category != "grouping" for predicate in coverage):
            raise ValidationError("grouping coverage must name allowlisted grouping predicates")
        predictions = evaluate_rule(
            candidate["rule"], kind="grouping", facts=raw["facts"], entity_ids=known,
            known_absent=raw.get("known_absent", []), complete_predicates=raw.get("complete_predicates", []),
            swipl_executable=swipl_executable, timeout=timeout,
        )
        matched = [label for label in labels if label["term"] in predictions]
        absent = [term for term in predictions if term not in [label["term"] for label in matched]]
        if raw["comparison_complete"] and absent and all(term["predicate"] in coverage for term in absent):
            outcome = "counterexample"
        elif raw["comparison_complete"] and matched and not absent:
            outcome = "support"
        else:
            outcome = "inconclusive"
        evidence = {
            key: raw[key] for key in (
                "sequence_id", "sequence_fingerprint", "observation_id", "observation_hash",
                "partition", "comparison_complete", "confidence", "evidence_refs",
                "depends_on_candidates", "depends_on_prototypes",
            )
        }
        evidence.update(
            outcome=outcome, grouping_ids=[label["grouping_id"] for label in matched],
            source="llm_hypothesis" if raw["label_source"] == "llm_hypothesis" else "deterministic_replay",
            evaluator_id="authored-prolog-grouping-ast-replay", evaluator_version=engine_version(),
            provenance={
                "observation": raw["provenance"], "predictions": predictions, "label_source": raw["label_source"],
            },
        )
        store.record_grouping_evidence(candidate_id, evidence)
        traces.append({"observation_id": raw["observation_id"], "outcome": outcome, "predictions": predictions})
    result = store.evaluate(candidate_id, gates=gates)
    if promote and result["eligible"]:
        store.promote(candidate_id, gates=gates)
    return {"candidate_id": candidate_id, "evaluation": result, "traces": traces, "status": store.get(candidate_id)["status"]}


def ingest_llm_rule_proposals(
    store: CandidateRuleStore, raw_response: str, *, provenance: dict[str, Any],
    entity_ids: Iterable[str], inducer_version: str,
) -> list[dict[str, Any]]:
    """Audit exact raw output before parsing; never evaluate or promote model proposals."""
    for field in ("prompt_ref", "raw_output_ref", "model", "backend"):
        text(provenance.get(field), field)
    known = identifiers(entity_ids)
    if not isinstance(raw_response, str):
        raise ValidationError("raw rule response must be exact model output text")
    audit = Journal(store.workspace_root / "runtime" / "rule-proposals")
    response = {
        "raw_response": raw_response, "provenance": json_copy(provenance),
        "entity_ids": sorted(known), "inducer_version": inducer_version,
    }
    response_id = content_id("rule-response", response)

    def record_audit(payload: dict[str, Any]) -> None:
        payload = {**payload, "response_id": response_id}
        with audit.transaction() as records:
            if not any(record["payload"] == payload for record in records):
                audit.append(records, payload)

    record_audit({"operation": "raw_response", **response})
    try:
        raw = object_fields(strict_json(raw_response), {"candidates"}, set(), "LLM rule response")
        if not isinstance(raw["candidates"], list):
            raise ValidationError("LLM candidates must be a list")
    except ValidationError as error:
        record_audit({"operation": "validation", "status": "invalid", "errors": [str(error)], "candidate_ids": []})
        raise CandidateProposalError([str(error)], [], raw_response) from error
    candidates, errors = [], []
    for index, proposal in enumerate(raw["candidates"]):
        try:
            proposal = object_fields(
                proposal, {"kind", "scope", "rule", "confidence", "assumptions", "critiques"},
                set(), "LLM candidate",
            )
            candidates.append(store.create(
                proposal["rule"], kind=proposal["kind"], scope=proposal["scope"],
                source="llm_proposal", provenance={**provenance, "response_audit_id": response_id}, inducer_version=inducer_version,
                entity_ids=known, assumptions=proposal["assumptions"], critiques=proposal["critiques"],
                confidence=proposal["confidence"], confidence_source="llm_proposal",
            ))
        except ValidationError as error:
            errors.append(f"candidate[{index}]: {error}")
    record_audit({
        "operation": "validation", "status": "partial" if errors and candidates else "invalid" if errors else "valid",
        "errors": errors, "candidate_ids": [candidate["candidate_id"] for candidate in candidates],
    })
    if errors:
        raise CandidateProposalError(errors, [candidate["candidate_id"] for candidate in candidates], raw_response)
    return candidates


class CandidateProposalError(ValidationError):
    def __init__(self, errors: list[str], candidate_ids: list[str], raw_response: str):
        self.errors, self.candidate_ids, self.raw_response = errors, candidate_ids, raw_response
        super().__init__("; ".join(errors))
