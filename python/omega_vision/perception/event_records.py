"""Validated temporal data ASTs. Rendering is data-only; this module executes nothing."""

from __future__ import annotations

from dataclasses import dataclass
import math
import re
from typing import Any, Iterable, Mapping

from ._event_journal import ValidationError, canonical_json, content_id, json_copy, strict_json

SCHEMA_VERSION = "temporal-events-v1"
PHASES = frozenset({"start", "continue", "end"})
ASSESSMENTS = frozenset({"changed", "no_material_change", "unknown"})
RULE_KINDS = frozenset({"event_detector", "event_transition", "action_effect", "grouping"})


@dataclass(frozen=True)
class PredicateSpec:
    category: str
    arguments: tuple[str, ...]
    symmetric: bool = False


PREDICATES: dict[str, PredicateSpec] = {}


def _register(names: str, category: str, arguments: tuple[str, ...], symmetric: bool = False) -> None:
    for name in names.split():
        PREDICATES[name] = PredicateSpec(category, arguments, symmetric)


_register("occlude contain inside blocked follow carry", "relation", ("entity", "entity"))
_register("contact attached overlap co_move", "relation", ("entity", "entity"), True)
_register("move", "relation", ("entity",))
_register(
    "appeared entered missing exited reappeared moved turned accelerated decelerated "
    "rotated scaled deformed shape_changed group_formed group_dissolved color_changed "
    "area_changed hole_opened hole_closed bounce",
    "event", ("entity",),
)
_register("member_added member_removed", "event", ("entity", "entity"))
_register("collision", "event", ("entity", "entity"), True)
_register("split merged", "event", ("entity", "entity", "entity"))
_register("stationary visible absent", "state", ("entity",))
_register("user_input", "action", ("entity", "atom"))
_register("group_member grouping_template_candidate", "grouping", ("entity", "entity"))
_register("same_object", "grouping", ("entity", "entity"), True)
_register("present missing_match independent_group_support", "evidence", ("entity",))
_register(
    "area_delta heading_delta speed_delta rotation_delta scale_ratio confidence",
    "evidence", ("entity", "number"),
)
_register("displacement_magnitude shape_iou projected_exit_fraction", "evidence", ("entity", "number"))
_register("displacement", "evidence", ("entity", "number", "number"))
_register("observed_mask_similarity", "evidence", ("entity", "entity", "number"))
_register("contact_delta overlap_delta contain_delta occlusion_overlap", "evidence", ("entity", "entity", "number"))
_register("distance overlap_ratio shared_edge co_motion_score", "evidence", ("entity", "entity", "number"), True)
_register("same_color shape_matches", "evidence", ("entity", "entity"), True)
_register("border_crossed", "evidence", ("entity", "atom"))
_register("frame_displacement_delta hole_count_delta affine_iou", "evidence", ("entity", "number"))
_register("scale_axes", "evidence", ("entity", "number", "number"))
_register("appearance_transition", "evidence", ("entity", "atom", "atom"))
_register("measured_interval", "evidence", ("number", "atom"))
_register("directed_contact_pixels failed_attempts", "evidence", ("entity", "entity", "number"))
_register("action_direction", "evidence", ("entity", "number", "number"))
_register("directional_contact", "evidence", ("entity", "entity", "number", "number", "number"))
_register("image_down_contact_delta", "evidence", ("entity", "entity", "number"))
_register("lagged_path_matches lagged_path_distance", "evidence", ("entity", "entity", "number"))
_register("greater_than greater_equal less_than less_equal equal", "evidence", ("number", "number"))
COMPARISONS = frozenset({"greater_than", "greater_equal", "less_than", "less_equal", "equal"})
for _phase in PHASES:
    PREDICATES[_phase] = PredicateSpec("event", ("relation",))


@dataclass(frozen=True)
class Variable:
    name: str

    def to_dict(self) -> dict[str, str]:
        return {"var": self.name}


@dataclass(frozen=True)
class Term:
    predicate: str
    args: tuple[Any, ...]

    def to_dict(self) -> dict[str, Any]:
        return {
            "predicate": self.predicate,
            "args": [arg.to_dict() if isinstance(arg, (Term, Variable)) else arg for arg in self.args],
        }


def text(value: Any, field: str) -> str:
    if not isinstance(value, str) or not value.strip() or any(ord(char) < 32 for char in value):
        raise ValidationError(f"{field} must be a nonempty string without control characters")
    return value


def identifiers(values: Iterable[str]) -> frozenset[str]:
    if isinstance(values, (str, bytes, dict)):
        raise ValidationError("entity_ids must be a collection of stable identifiers")
    result = frozenset(text(value, "entity ID") for value in values)
    for value in result:
        if re.fullmatch(r"[rvwgo]\d+", value):
            raise ValidationError(f"frame-local alias {value!r} is not a stable entity identifier")
    return result


def probability(value: Any, field: str = "confidence") -> float:
    if not _finite_number(value) or not 0 <= value <= 1:
        raise ValidationError(f"{field} must be a finite number between zero and one")
    return float(value)


def _finite_number(value: Any) -> bool:
    return type(value) is int or (type(value) is float and math.isfinite(value))


def string_list(value: Any, field: str, *, nonempty: bool = False) -> list[str]:
    if not isinstance(value, list) or (nonempty and not value):
        raise ValidationError(f"{field} must be {'a nonempty' if nonempty else 'a'} list")
    return [text(item, field) for item in value]


def object_fields(value: Any, required: set[str], optional: set[str], field: str) -> dict[str, Any]:
    if not isinstance(value, dict):
        raise ValidationError(f"{field} must be an object")
    missing, extra = required - value.keys(), value.keys() - required - optional
    if missing or extra:
        raise ValidationError(f"{field}: missing fields {sorted(missing)}, unsupported fields {sorted(extra)}")
    return value


def validate_term(
    value: Any, *, entity_ids: Iterable[str] = (), allow_variables: bool = False,
    categories: Iterable[str] | None = None,
) -> Term:
    known = identifiers(entity_ids)
    value = value.to_dict() if isinstance(value, Term) else value

    def parse(raw: Any, depth: int = 0) -> Term:
        if depth > 8:
            raise ValidationError("term nesting exceeds eight levels")
        raw = object_fields(raw, {"predicate", "args"}, set(), "term")
        name, args = raw["predicate"], raw["args"]
        if not isinstance(name, str) or name not in PREDICATES:
            raise ValidationError(f"predicate is not allowlisted: {name!r}")
        spec = PREDICATES[name]
        if not isinstance(args, list) or len(args) != len(spec.arguments):
            raise ValidationError(f"{name} requires exactly {len(spec.arguments)} arguments")
        parsed: list[Any] = []
        for raw_arg, kind in zip(args, spec.arguments):
            if isinstance(raw_arg, dict) and set(raw_arg) == {"var"}:
                variable = raw_arg["var"]
                if not allow_variables or kind == "relation":
                    raise ValidationError("variables are permitted only in candidate rule arguments")
                if not isinstance(variable, str) or not re.fullmatch(r"[A-Z][A-Za-z0-9_]{0,63}", variable):
                    raise ValidationError("variable names must start with an uppercase letter")
                arg: Any = Variable(variable)
            elif kind == "relation":
                arg = parse(raw_arg, depth + 1)
                if PREDICATES[arg.predicate].category != "relation":
                    raise ValidationError("phase wrappers require a lasting relation, not an instantaneous event")
            elif kind == "entity":
                if not isinstance(raw_arg, str) or raw_arg not in known:
                    raise ValidationError(f"unknown entity identifier: {raw_arg!r}")
                arg = raw_arg
            elif kind == "number":
                if not _finite_number(raw_arg):
                    raise ValidationError(f"{name} requires a finite number")
                arg = int(raw_arg) if isinstance(raw_arg, float) and raw_arg.is_integer() else raw_arg
            else:
                arg = text(raw_arg, f"{name} atom")
            parsed.append(arg)
        if spec.symmetric:
            # Only the subject pair is symmetric; measurement arguments stay in place.
            parsed[:2] = sorted(parsed[:2], key=lambda arg: canonical_json(
                arg.to_dict() if isinstance(arg, Variable) else arg,
            ))
        return Term(name, tuple(parsed))

    result = parse(value)
    if categories is not None and PREDICATES[result.predicate].category not in set(categories):
        raise ValidationError(f"{result.predicate} is not valid in this context")
    return result


def _render(term: Term | Variable | str | int | float) -> str:
    if isinstance(term, Term):
        return f"{term.predicate}({', '.join(_render(arg) for arg in term.args)})"
    if isinstance(term, Variable):
        return term.name
    if isinstance(term, str):
        if re.fullmatch(r"[a-z][A-Za-z0-9_]*", term):
            return term
        return "'" + term.replace("\\", "\\\\").replace("'", "''") + "'"
    return str(term)


def render_term(value: Any, *, entity_ids: Iterable[str] = (), allow_variables: bool = False) -> str:
    """Render only a revalidated AST. Never accept a Prolog source string."""
    return _render(validate_term(value, entity_ids=entity_ids, allow_variables=allow_variables))


def hypothesis_json_schema(entity_ids: Iterable[str]) -> dict[str, Any]:
    """The strict, data-only pair-output contract for prompts/structured-output providers."""
    known = sorted(identifiers(entity_ids))
    scalar_schemas = {
        "entity": {"type": "string", "enum": known},
        "number": {"type": "number"},
        "atom": {"type": "string", "minLength": 1},
        "relation": {"$ref": "#/$defs/relation"},
    }

    def terms(category: str) -> dict[str, Any]:
        options = []
        for name, spec in sorted(PREDICATES.items()):
            if spec.category == category:
                options.append({
                    "type": "object", "additionalProperties": False,
                    "required": ["predicate", "args"],
                    "properties": {
                        "predicate": {"const": name},
                        "args": {
                            "type": "array", "minItems": len(spec.arguments), "maxItems": len(spec.arguments),
                            "prefixItems": [scalar_schemas[kind] for kind in spec.arguments],
                        },
                    },
                })
        return {"oneOf": options}

    strings = {"type": "array", "items": {"type": "string", "minLength": 1}}
    confidence = {"type": "number", "minimum": 0, "maximum": 1}
    return json_copy({
        "$schema": "https://json-schema.org/draft/2020-12/schema",
        "title": SCHEMA_VERSION, "type": "object", "additionalProperties": False,
        "$defs": {"relation": terms("relation"), "event": terms("event")},
        "required": ["assessment", "comparison_complete", "confidence", "evidence", "uncertainty", "events"],
        "properties": {
            "assessment": {"enum": sorted(ASSESSMENTS)}, "comparison_complete": {"type": "boolean"},
            "confidence": confidence, "evidence": strings, "uncertainty": strings,
            "events": {
                "type": "array", "items": {
                    "type": "object", "additionalProperties": False,
                    "required": ["term", "confidence", "evidence", "uncertainty", "rationale"],
                    "properties": {
                        "term": {"$ref": "#/$defs/event"}, "confidence": confidence,
                        "evidence": {**strings, "minItems": 1}, "uncertainty": strings,
                        "rationale": {"type": "string", "minLength": 1},
                        "episode_id": {"type": "string", "minLength": 1},
                    },
                },
            },
        },
        "allOf": [
            {
                "if": {"properties": {"assessment": {"enum": ["unknown", "no_material_change"]}}},
                "then": {"properties": {"events": {"maxItems": 0}}},
            },
            {
                "if": {"properties": {"assessment": {"const": "no_material_change"}}},
                "then": {"properties": {"comparison_complete": {"const": True}, "evidence": {"minItems": 1}}},
            },
        ],
    })


def normalize_assessment(value: Any, *, event_count: int) -> dict[str, Any]:
    if not isinstance(value, dict):
        raise ValidationError("assessment must be an object")
    label = value.get("assessment")
    if label not in ASSESSMENTS:
        raise ValidationError("assessment must be changed, no_material_change, or unknown")
    complete = value.get("comparison_complete")
    if not isinstance(complete, bool):
        raise ValidationError("comparison_complete must be an explicit boolean")
    evidence = string_list(value.get("evidence"), "evidence")
    if label == "no_material_change" and (not complete or not evidence):
        raise ValidationError("no_material_change requires sufficient completed comparison evidence")
    if label != "changed" and event_count:
        raise ValidationError(f"{label} assessments must have events=[]")
    return {
        "assessment": label, "comparison_complete": complete,
        "confidence": probability(value.get("confidence")), "evidence": evidence,
        "uncertainty": string_list(value.get("uncertainty"), "uncertainty"),
    }


def normalize_pair(value: Any) -> dict[str, str]:
    value = object_fields(
        value, {"sequence_id", "from_frame", "to_frame", "before_hash", "after_hash"}, set(), "source_pair",
    )
    result = {key: text(item, f"source_pair.{key}") for key, item in value.items()}
    if result["from_frame"] == result["to_frame"]:
        raise ValidationError("a pair requires two different frame identifiers")
    return result


def pair_id(value: Any) -> str:
    return content_id("pair", normalize_pair(value))


class HypothesisValidationError(ValidationError):
    def __init__(self, raw_response: str, errors: list[str]):
        self.raw_response = raw_response
        self.errors = errors
        super().__init__("; ".join(errors))


def parse_hypotheses(
    raw_response: str, *, entity_ids: Iterable[str], source_pair: dict[str, str],
    provenance: dict[str, Any], active_episodes: Mapping[str, str] | None = None,
) -> dict[str, Any]:
    """Parse strict model JSON; all failures retain the exact response in the exception."""
    try:
        if not isinstance(raw_response, str):
            raise ValidationError("raw_response must be exact model output text")
        pair = normalize_pair(source_pair)
        if not isinstance(provenance, dict):
            raise ValidationError("provenance must be an object")
        for key in ("model", "backend", "prompt_version", "prompt_hash"):
            text(provenance.get(key), f"provenance.{key}")
        known = identifiers(entity_ids)
        if active_episodes is not None:
            if not isinstance(active_episodes, Mapping):
                raise ValidationError("active_episodes must map canonical relations to episode IDs")
            for relation, episode in active_episodes.items():
                text(relation, "active relation")
                text(episode, "active episode ID")
        raw = object_fields(
            strict_json(raw_response),
            {"assessment", "comparison_complete", "confidence", "evidence", "uncertainty", "events"},
            set(), "LLM response",
        )
        if not isinstance(raw["events"], list):
            raise ValidationError("events must be a list")
        assessment = normalize_assessment(raw, event_count=len(raw["events"]))
        events = []
        seen = set()
        phase_relations = set()
        for item in raw["events"]:
            item = object_fields(
                item, {"term", "confidence", "evidence", "uncertainty", "rationale"},
                {"episode_id"}, "hypothesis",
            )
            term = validate_term(item["term"], entity_ids=known, categories={"event"})
            rendered = _render(term)
            if rendered in seen:
                raise ValidationError("duplicate hypothesis term")
            seen.add(rendered)
            episode = item.get("episode_id")
            if term.predicate in PHASES:
                relation = _render(term.args[0])
                if relation in phase_relations:
                    raise ValidationError("multiple phases for one relation in a pair are contradictory")
                phase_relations.add(relation)
                active = (active_episodes or {}).get(relation)
                if term.predicate == "start":
                    if active or episode is not None:
                        raise ValidationError("start must open a new episode, not reuse an existing episode")
                    episode = content_id("hypothesis-episode", [pair, provenance, relation])
                elif active is None or (episode is not None and episode != active):
                    raise ValidationError("continue/end requires the matching active episode")
                else:
                    episode = active
            elif episode is not None:
                raise ValidationError("instantaneous hypotheses cannot reference episodes")
            payload = {
                "term": term.to_dict(), "canonical_term": rendered,
                "confidence": probability(item["confidence"]),
                "evidence": string_list(item["evidence"], "hypothesis evidence", nonempty=True),
                "uncertainty": string_list(item["uncertainty"], "hypothesis uncertainty"),
                "rationale": text(item["rationale"], "rationale"), "episode_id": episode,
            }
            events.append({**payload, "hypothesis_id": content_id("hypothesis", [pair, provenance, payload])})
        return {
            "schema_version": SCHEMA_VERSION, "channel": "llm_hypotheses", "authoritative": False,
            "source_pair": pair, "pair_id": pair_id(pair), **assessment, "events": events,
            "provenance": json_copy(provenance),
        }
    except ValidationError as error:
        raise HypothesisValidationError(raw_response, [str(error)]) from error


def _variables(term: Term) -> set[str]:
    found: set[str] = set()
    for arg in term.args:
        if isinstance(arg, Variable):
            found.add(arg.name)
        elif isinstance(arg, Term):
            found.update(_variables(arg))
    return found


def normalize_rule(value: Any, *, kind: str, entity_ids: Iterable[str] = ()) -> dict[str, Any]:
    if kind not in RULE_KINDS:
        raise ValidationError(f"unsupported candidate kind: {kind}")
    value = object_fields(value, {"body", "head"}, {"exceptions", "delay", "thresholds"}, "rule")
    if not isinstance(value["body"], list) or not value["body"]:
        raise ValidationError("rule body must contain at least one typed term")
    exceptions = value.get("exceptions", [])
    if not isinstance(exceptions, list):
        raise ValidationError("rule exceptions must be a list")
    known = identifiers(entity_ids)
    body = [validate_term(term, entity_ids=known, allow_variables=True) for term in value["body"]]
    head = validate_term(
        value["head"], entity_ids=known, allow_variables=True,
        categories={"grouping"} if kind == "grouping" else {"event"},
    )
    excluded = [validate_term(term, entity_ids=known, allow_variables=True) for term in exceptions]
    body_categories = {PREDICATES[term.predicate].category for term in body}
    allowed = {"evidence", "state", "relation", "grouping"}
    if kind == "event_transition":
        allowed.add("event")
        if "event" not in body_categories:
            raise ValidationError("event_transition requires an event antecedent")
    if kind == "action_effect":
        allowed.update({"action", "event"})
        if "action" not in body_categories:
            raise ValidationError("action_effect requires a user_input antecedent")
    if not body_categories <= allowed:
        raise ValidationError(f"{kind} contains invalid antecedent categories")
    if any(PREDICATES[term.predicate].category not in allowed for term in excluded):
        raise ValidationError("exception category is invalid for this candidate kind")
    bound = set().union(*(_variables(term) for term in body if term.predicate not in COMPARISONS))
    required_variables = set().union(
        _variables(head), *(_variables(term) for term in excluded),
        *(_variables(term) for term in body if term.predicate in COMPARISONS),
    )
    if not required_variables <= bound:
        raise ValidationError("head, constraint, and exception variables must be bound in positive body facts")
    variable_types: dict[str, str] = {}

    def check_types(term: Term) -> None:
        for arg, argument_type in zip(term.args, PREDICATES[term.predicate].arguments):
            if isinstance(arg, Variable):
                previous = variable_types.setdefault(arg.name, argument_type)
                if previous != argument_type:
                    raise ValidationError(f"variable {arg.name} has incompatible argument types")
            elif isinstance(arg, Term):
                check_types(arg)

    for term in [*body, head, *excluded]:
        check_types(term)
    delay = value.get("delay", {"min": 0, "max": 0})
    object_fields(delay, {"min", "max"}, set(), "delay")
    if any(type(delay[key]) is not int or delay[key] < 0 for key in ("min", "max")) or delay["max"] < delay["min"]:
        raise ValidationError("delay must be a nonnegative inclusive min/max frame interval")
    thresholds = value.get("thresholds", {})
    if not isinstance(thresholds, dict):
        raise ValidationError("thresholds must be an object")
    for key, number in thresholds.items():
        text(key, "threshold name")
        if not _finite_number(number):
            raise ValidationError("thresholds must be finite numbers")
    # Alpha normalization is deterministic; body order remains meaningful for delayed contexts.
    names: dict[str, str] = {}

    def rename(term: Term) -> Term:
        args = []
        for arg in term.args:
            if isinstance(arg, Variable):
                args.append(Variable(names.setdefault(arg.name, f"V{len(names)}")))
            elif isinstance(arg, Term):
                args.append(rename(arg))
            else:
                args.append(arg)
        return validate_term(Term(term.predicate, tuple(args)), entity_ids=known, allow_variables=True)

    normalized_head = rename(head)
    normalized_body = [rename(term) for term in body]
    normalized_excluded = [rename(term) for term in excluded]
    return {
        "body": [term.to_dict() for term in normalized_body], "head": normalized_head.to_dict(),
        "exceptions": [term.to_dict() for term in normalized_excluded],
        "delay": json_copy(delay), "thresholds": json_copy(thresholds),
    }


def render_rule(value: Any, *, kind: str, entity_ids: Iterable[str] = ()) -> str:
    known = identifiers(entity_ids)
    rule = normalize_rule(value, kind=kind, entity_ids=known)
    render = lambda term: render_term(term, entity_ids=known, allow_variables=True)
    body = [render(term) for term in rule["body"]]
    body.extend(f"\\+ ({render(term)})" for term in rule["exceptions"])
    return f"{render(rule['head'])} :- {', '.join(body)}."
