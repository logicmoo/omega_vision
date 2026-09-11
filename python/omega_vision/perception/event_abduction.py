"""Bounded, data-only reverse inference, not a universal abductive solver.

Unify an accepted transition's HEAD with an observed effect, then ground its
antecedents at an earlier frame. Extra variables can only bind to observed
positive facts, never an invented entity, action label, or measurement. Missing
ground antecedents and unobserved exception absence remain explicit assumptions.
No closed-world negation, recursive chaining, induction, or promotion occurs.

Ranking is lexicographic: fewer assumptions, more satisfied evidence terms,
shorter delay, then stable rule/effect/binding identifiers. These are search
preferences, not probabilities. Truncation is always reported.
"""
from __future__ import annotations

from dataclasses import asdict, dataclass
from typing import Any, Mapping, Sequence

from ._event_journal import ValidationError, canonical_json, content_id, json_copy
from .event_induction import _scope_matches
from .event_records import (
    COMPARISONS, PHASES, PREDICATES, Term, Variable, identifiers, normalize_rule,
    string_list, text, validate_term,
)

VERSION = "grounded-event-abduction-v1"
KINDS = frozenset({"event_transition", "action_effect"})


@dataclass(frozen=True)
class AbductionBudgets:
    max_rules: int = 128
    max_events: int = 128
    max_evidence: int = 4096
    max_frames: int = 512
    max_terms: int = 32
    max_delay: int = 64
    max_groundings: int = 2048
    max_hypotheses: int = 128
    max_diagnostics: int = 256

    def __post_init__(self):
        for name, value in asdict(self).items():
            if type(value) is not int or not 1 <= value <= 100_000:
                raise ValidationError(f"{name} must be an integer between 1 and 100000")


def _variables(value: Any) -> set[str]:
    if isinstance(value, Variable):
        return {value.name}
    if isinstance(value, Term):
        return set().union(*(_variables(arg) for arg in value.args))
    return set()


def _ground(value: Any, bindings: Mapping[str, Any]) -> Any:
    if isinstance(value, Variable):
        return bindings.get(value.name, value)
    if isinstance(value, Term):
        return Term(value.predicate, tuple(_ground(arg, bindings) for arg in value.args))
    return value


def _unify(pattern: Any, value: Any, bindings: dict[str, Any]) -> list[dict[str, Any]]:
    if isinstance(pattern, Variable):
        if pattern.name in bindings:
            return [bindings] if bindings[pattern.name] == value else []
        return [{**bindings, pattern.name: value}]
    if not isinstance(pattern, Term):
        return [bindings] if pattern == value else []
    if not isinstance(value, Term) or pattern.predicate != value.predicate:
        return []
    permutations = [value.args]
    if PREDICATES[pattern.predicate].symmetric:
        permutations.append((value.args[1], value.args[0], *value.args[2:]))
    output = {}
    for args in permutations:
        states = [bindings]
        for left, right in zip(pattern.args, args, strict=True):
            states = [new for state in states for new in _unify(left, right, state)]
        output.update((canonical_json(state), state) for state in states)
    return [output[key] for key in sorted(output)]


def _comparison(term: Term) -> bool:
    left, right = term.args
    return {
        "greater_than": lambda: left > right, "greater_equal": lambda: left >= right,
        "less_than": lambda: left < right, "less_equal": lambda: left <= right,
        "equal": lambda: left == right,
    }[term.predicate]()


def _incompatible(left: Term, right: Term) -> bool:
    if left.args != right.args or left.predicate == right.predicate:
        return False
    if left.predicate in PHASES and right.predicate in PHASES:
        return True
    return frozenset((left.predicate, right.predicate)) in {
        frozenset(("visible", "absent")), frozenset(("present", "absent")),
        frozenset(("move", "stationary")),
    }


def _observed(row: Mapping[str, Any], known, *, event: bool) -> dict[str, Any]:
    if row.get("authoritative") is not True or row.get("channel") != "observed":
        raise ValidationError("Abduction accepts observed evidence only, never predictions or hypotheses")
    order = row.get("frame_order")
    if type(order) is not int or not 0 <= order < len(known):
        raise ValidationError("Observed evidence has an invalid frame order")
    term = validate_term(row.get("term"), entity_ids=known[order],
                         categories={"event"} if event else None)
    if PREDICATES[term.predicate].category == "grouping":
        raise ValidationError("Group/class evidence is not implemented by event abduction")
    if not isinstance(row.get("provenance"), dict) or not row["provenance"]:
        raise ValidationError("Observed evidence requires explicit provenance")
    if not event and type(row.get("polarity")) is not bool:
        raise ValidationError("Evidence requires explicit positive/negative polarity")
    return {
        **json_copy(row), "term": term.to_dict(),
        ("event_id" if event else "evidence_id"): text(
            row.get("event_id" if event else "evidence_id"), "observed identity"),
        **({"evidence": string_list(row.get("evidence"), "event evidence", nonempty=True)} if event else {}),
    }


def abduce_events(
    observed_events: Sequence[Mapping[str, Any]], *,
    evidence: Sequence[Mapping[str, Any]], candidates: Sequence[Mapping[str, Any]],
    frame_ids: Sequence[str], entity_ids_by_order: Sequence[Sequence[str]],
    scope_context: Mapping[str, Any], cutoff_order: int,
    budgets: AbductionBudgets | None = None,
) -> dict[str, Any]:
    """Explain current observed events using a validated, causally scoped registry.

    ``candidates`` are promoted CandidateRuleStore records augmented with
    ``published_order`` by the adapter from verified STM references. Evidence has
    id, typed term, frame_order, polarity, observed channel and provenance.
    Observed events additionally retain canonical event_id and evidence IDs.
    The caller must authenticate these records against its journal/registry;
    this pure function revalidates ASTs, scope, authority, bounds and ordering.
    """
    budgets = budgets or AbductionBudgets()
    if (type(cutoff_order) is not int or cutoff_order < 0
            or len(frame_ids) != cutoff_order + 1 or len(entity_ids_by_order) != len(frame_ids)):
        raise ValidationError("Supply exactly the ordered frame prefix ending at the current cutoff")
    if len(frame_ids) > budgets.max_frames:
        raise ValidationError("Frame input exceeds max_frames budget")
    if len(evidence) > budgets.max_evidence:
        raise ValidationError("Evidence input exceeds max_evidence budget")
    frames = [text(value, "frame ID") for value in frame_ids]
    if len(set(frames)) != len(frames):
        raise ValidationError("Frame identities must be unique")
    known = [identifiers(values) for values in entity_ids_by_order]
    facts = [_observed(row, known, event=False) for row in evidence]
    events = [_observed(row, known, event=True) for row in observed_events]
    if any(event["frame_order"] != cutoff_order for event in events):
        raise ValidationError("Only current observed effects may be explained")
    if len({event["event_id"] for event in events}) != len(events):
        raise ValidationError("Duplicate observed event identity")
    fact_ids = {}
    indexed: dict[int, list[tuple[Term, dict[str, Any]]]] = {}
    polarities = {}
    for fact in facts:
        identity = fact["evidence_id"]
        if identity in fact_ids and fact_ids[identity] != fact:
            raise ValidationError("One evidence identity has inconsistent contents")
        fact_ids[identity] = fact
        key = (fact["frame_order"], canonical_json(fact["term"]))
        if key in polarities and polarities[key] != fact["polarity"]:
            raise ValidationError("Contradictory positive and negative observed evidence")
        polarities[key] = fact["polarity"]
    for fact in sorted(fact_ids.values(), key=lambda row: row["evidence_id"]):
        indexed.setdefault(fact["frame_order"], []).append((
            validate_term(fact["term"], entity_ids=known[fact["frame_order"]]), fact,
        ))

    diagnostics, hypotheses = [], {}
    truncated = set()
    stats = {"rules_considered": 0, "effects_considered": 0, "groundings": 0,
             "diagnostics_total": 0}

    def diagnose(reason, **details):
        stats["diagnostics_total"] += 1
        if len(diagnostics) < budgets.max_diagnostics:
            diagnostics.append({"reason": reason, **details})
        else:
            truncated.add("max_diagnostics")

    def tick():
        if stats["groundings"] >= budgets.max_groundings:
            truncated.add("max_groundings")
            return False
        stats["groundings"] += 1
        return True

    selected = []
    all_known = set().union(*known)
    ordered_candidates = sorted(candidates, key=lambda row: str(row.get("candidate_id", "")))
    if len(ordered_candidates) > budgets.max_rules:
        truncated.add("max_rules")
    for candidate in ordered_candidates[:budgets.max_rules]:
        stats["rules_considered"] += 1
        cid = text(candidate.get("candidate_id"), "candidate_id")
        kind = candidate.get("kind")
        published = candidate.get("published_order")
        reason = None
        if candidate.get("status") != "promoted" or not candidate.get("promoted_rule_ref"):
            reason = "rule_not_accepted"
        elif type(published) is not int or published < 0 or published >= cutoff_order:
            reason = "rule_not_published_strictly_before_effect"
        elif kind not in KINDS:
            reason = "unsupported_rule_kind"
        elif not isinstance(candidate.get("scope"), dict) or not candidate["scope"]:
            raise ValidationError("Accepted candidate must have explicit scope")
        elif not _scope_matches(candidate["scope"], scope_context):
            reason = "scope_mismatch"
        if reason:
            diagnose(reason, candidate_id=cid)
            continue
        text(candidate.get("version"), "candidate version")
        rule_known = all_known | identifiers(candidate.get("entity_ids", []))
        rule = normalize_rule(candidate.get("rule"), kind=kind, entity_ids=rule_known)
        terms = [validate_term(item, entity_ids=rule_known, allow_variables=True)
                 for item in [rule["head"], *rule["body"], *rule["exceptions"]]]
        if len(terms) > budgets.max_terms:
            truncated.add("max_terms")
            diagnose("rule_term_budget", candidate_id=cid)
            continue
        if rule["thresholds"]:
            diagnose("unsupported_threshold_metadata", candidate_id=cid)
            continue
        if any(PREDICATES[term.predicate].category == "grouping" for term in terms):
            diagnose("unsupported_grouping_schema", candidate_id=cid)
            continue
        selected.append((candidate, rule, terms[0], terms[1:1 + len(rule["body"])],
                         terms[1 + len(rule["body"]):]))

    if len(events) > budgets.max_events:
        truncated.add("max_events")
    for event in sorted(events, key=lambda row: row["event_id"])[:budgets.max_events]:
        stats["effects_considered"] += 1
        effect = validate_term(event["term"], entity_ids=known[cutoff_order])
        for candidate, rule, head, body, exceptions in selected:
            details = {"candidate_id": candidate["candidate_id"], "observed_event_id": event["event_id"]}
            seeds = _unify(head, effect, {})
            if not seeds:
                continue
            low, high = rule["delay"]["min"], min(rule["delay"]["max"], cutoff_order)
            if high > budgets.max_delay:
                high = budgets.max_delay
                truncated.add("max_delay")
            for delay in range(low, high + 1):
                source = cutoff_order - delay
                location = {**details, "antecedent_order": source}
                if delay == 0 and (candidate["kind"] != "action_effect" or any(
                    PREDICATES[term.predicate].category != "action" and term.predicate not in COMPARISONS
                    for term in [*body, *exceptions]
                )):
                    diagnose("unsupported_same_pair_temporal_order", **location)
                    continue
                source_facts = indexed.get(source, [])
                queue = list(seeds)
                seen = set()
                while queue:
                    if not tick():
                        break
                    bindings = queue.pop(0)
                    key = canonical_json(bindings)
                    if key in seen:
                        continue
                    seen.add(key)
                    missing = set().union(*(_variables(_ground(term, bindings)) for term in [*body, *exceptions]))
                    if missing:
                        extensions = {}
                        for pattern in body:
                            if pattern.predicate in COMPARISONS or not _variables(_ground(pattern, bindings)):
                                continue
                            for fact, record in source_facts:
                                if not record["polarity"]:
                                    continue
                                for match in _unify(pattern, fact, bindings):
                                    extensions[canonical_json(match)] = match
                            if extensions:
                                break
                        if not extensions:
                            diagnose("ungrounded_variables", variables=sorted(missing), **location)
                        remaining = budgets.max_groundings - stats["groundings"] - len(queue)
                        additions = [extensions[key] for key in sorted(extensions) if key not in seen]
                        if len(additions) > max(remaining, 0):
                            truncated.add("max_groundings")
                        queue.extend(additions[:max(remaining, 0)])
                        continue
                    try:
                        ground_body = [validate_term(_ground(term, bindings), entity_ids=known[source]) for term in body]
                        ground_exceptions = [validate_term(_ground(term, bindings), entity_ids=known[source])
                                             for term in exceptions]
                    except ValidationError:
                        diagnose("entity_not_observed_by_antecedent_frame", **location)
                        continue
                    assumptions, satisfied, causes, contradictions = [], [], [], []
                    positive_keys = {canonical_json(term.to_dict()) for term in ground_body}
                    for positive, terms_to_check in ((True, ground_body), (False, ground_exceptions)):
                        for term in terms_to_check:
                            item = {"term": term.to_dict(), "frame_order": source, "polarity": positive}
                            if term.predicate in COMPARISONS:
                                if _comparison(term) != positive:
                                    contradictions.append({**item, "reason": "false_comparison"})
                                else:
                                    satisfied.append({**item, "evidence_ids": [], "basis": "arithmetic"})
                                continue
                            exact = [record for fact, record in source_facts if fact == term]
                            supporting = [row["evidence_id"] for row in exact if row["polarity"] == positive]
                            opposing = [row["evidence_id"] for row in exact if row["polarity"] != positive]
                            internally_incompatible = False
                            if positive:
                                opposing.extend(row["evidence_id"] for fact, row in source_facts
                                                if row["polarity"] and _incompatible(term, fact))
                                internally_incompatible = any(_incompatible(term, other) for other in ground_body)
                            if (opposing or internally_incompatible
                                    or (not positive and canonical_json(term.to_dict()) in positive_keys)):
                                contradictions.append({**item, "reason": "contradicted_antecedent_or_exception",
                                                       "evidence_ids": opposing})
                            elif supporting:
                                satisfied.append({**item, "evidence_ids": supporting, "basis": "observation"})
                            else:
                                assumptions.append({**item, "reason": (
                                    "missing_antecedent" if positive else "exception_absence_not_observed")})
                            if positive and PREDICATES[term.predicate].category in {"event", "action"}:
                                causes.append({**item, "status": "observed" if supporting else "hypothesized",
                                               "evidence_ids": supporting})
                    if contradictions:
                        diagnose("contradiction", contradictions=contradictions, **location)
                        continue
                    evidence_ids = {uid for item in satisfied for uid in item["evidence_ids"]}
                    record = {
                        "schema_version": VERSION, "channel": "abduced_events", "authoritative": False,
                        "status": "possible_cause" if assumptions else "supported_explanation",
                        "observed_event_id": event["event_id"], "observed_effect": event,
                        "causes": causes, "assumptions": assumptions, "satisfied": satisfied,
                        "evidence": [fact_ids[uid] for uid in sorted(evidence_ids)],
                        "bindings": bindings,
                        "temporal": {"antecedent_frame_id": frames[source], "antecedent_order": source,
                                     "effect_frame_id": frames[cutoff_order], "effect_order": cutoff_order,
                                     "delay": delay, "ordering": (
                                         "recorded_action_before_pair_effect" if delay == 0 else "earlier_frame")},
                        "rule": {"candidate_id": candidate["candidate_id"], "version": candidate["version"],
                                 "kind": candidate["kind"], "scope": candidate["scope"], "ast": rule,
                                 "published_order": candidate["published_order"],
                                 "promoted_rule_ref": candidate["promoted_rule_ref"]},
                    }
                    uid = content_id("abduced-event", record)
                    hypotheses[uid] = {**record, "hypothesis_id": uid}

    ordered = sorted(hypotheses.values(), key=lambda row: (
        len(row["assumptions"]), -sum(item["basis"] == "observation" for item in row["satisfied"]),
        row["temporal"]["delay"], row["rule"]["candidate_id"], row["observed_event_id"],
        canonical_json(row["bindings"]), row["hypothesis_id"],
    ))
    if len(ordered) > budgets.max_hypotheses:
        truncated.add("max_hypotheses")
    retained = ordered[:budgets.max_hypotheses]
    return {
        "schema_version": VERSION, "channel": "abduced_events", "authoritative": False,
        "hypotheses": retained, "diagnostics": diagnostics,
        "outcome": {"status": "budget_exhausted" if truncated else "complete",
                    "truncated_by": sorted(truncated), "budgets": asdict(budgets), **stats,
                    "hypotheses_found": len(ordered), "hypotheses_returned": len(retained),
                    "unexplained_event_ids": sorted({event["event_id"] for event in events}
                                                  - {row["observed_event_id"] for row in retained})},
        "ranking": ["fewest_assumptions", "most_satisfied_observed_terms", "shortest_delay",
                    "candidate_id", "observed_event_id", "bindings", "hypothesis_id"],
    }
