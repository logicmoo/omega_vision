"""Canonical sequence assessments/actions/events and a separate LLM audit channel."""

from __future__ import annotations

from pathlib import Path
import math
from typing import Any, Iterable, Mapping

from ._event_journal import (
    ConflictError, IntegrityError, Journal, ValidationError, content_id, json_copy,
)
from .event_records import (
    PHASES, PREDICATES, SCHEMA_VERSION, HypothesisValidationError, identifiers,
    normalize_assessment, normalize_pair, object_fields, pair_id, parse_hypotheses,
    probability, render_term, string_list, text, validate_term,
)


def _frame(raw: Any, index: int) -> dict[str, Any]:
    raw = object_fields(
        raw, {"id", "index", "input_hash", "entity_ids", "evidence", "states", "provenance"},
        set(), "frame",
    )
    if type(raw["index"]) is not int or raw["index"] != index:
        raise ValidationError("frames must have contiguous zero-based indices in chronological order")
    known = sorted(identifiers(raw["entity_ids"]))
    if not isinstance(raw["states"], list):
        raise ValidationError("frame states must be a list")
    states = [
        validate_term(term, entity_ids=known, categories={"state", "relation", "grouping"}).to_dict()
        for term in raw["states"]
    ]
    if not isinstance(raw["provenance"], dict) or not raw["provenance"]:
        raise ValidationError("frame provenance must be a nonempty object")
    return {
        "id": text(raw["id"], "frame.id"), "index": index,
        "input_hash": text(raw["input_hash"], "frame.input_hash"),
        "entity_ids": known, "evidence": string_list(raw["evidence"], "frame evidence"),
        "states": states, "provenance": json_copy(raw["provenance"]),
    }


def _pair(sequence_id: str, before: dict[str, Any], after: dict[str, Any]) -> dict[str, str]:
    return {
        "sequence_id": sequence_id, "from_frame": before["id"], "to_frame": after["id"],
        "before_hash": before["input_hash"], "after_hash": after["input_hash"],
    }


def normalize_actions(
    actions: list[dict[str, Any]], *, frames: list[dict[str, Any]], sequence_id: str,
    actor_ids: Iterable[str] = (),
) -> list[dict[str, Any]]:
    """Direction belongs to recording metadata, never to a visual/LLM inference."""
    if not isinstance(actions, list):
        raise ValidationError("actions must be a list")
    indices = {frame["id"]: index for index, frame in enumerate(frames)}
    known = identifiers(actor_ids) | identifiers(
        entity for frame in frames for entity in frame["entity_ids"]
    )
    results: dict[tuple[int, str, int], dict[str, Any]] = {}
    for action in actions:
        action = object_fields(
            action, {"frame_id", "direction", "normalized", "raw_payload", "order", "timestamp", "provenance"},
            {"provider_direction", "from_frame", "to_frame"}, "recorded action",
        )
        if action["direction"] not in {"incoming", "outgoing"}:
            raise ValidationError("action direction must explicitly be incoming or outgoing")
        if "provider_direction" in action and action["provider_direction"] != action["direction"]:
            raise ValidationError("action direction contradicts the recording/provider contract")
        if action["frame_id"] not in indices:
            raise ValidationError("action references a frame outside this sequence")
        if type(action["order"]) is not int or action["order"] < 0:
            raise ValidationError("action order must be a nonnegative integer")
        timestamp = action["timestamp"]
        if timestamp is not None:
            if isinstance(timestamp, str):
                text(timestamp, "action timestamp")
            elif isinstance(timestamp, bool) or not isinstance(timestamp, (int, float)) or not math.isfinite(timestamp):
                raise ValidationError("action timestamp must be a string, finite number, or explicit null")
        if not isinstance(action["provenance"], dict):
            raise ValidationError("action provenance must be an object")
        text(action["provenance"].get("recording_source"), "action provenance.recording_source")
        text(action["provenance"].get("provider"), "action provenance.provider")
        if not isinstance(action["normalized"], list) or not action["normalized"]:
            raise ValidationError("an action needs at least one normalized user_input term")
        normalized = [
            validate_term(term, entity_ids=known, categories={"action"}).to_dict()
            for term in action["normalized"]
        ]
        index = indices[action["frame_id"]]
        before_index = index - 1 if action["direction"] == "incoming" else index
        after_index = before_index + 1
        before = frames[before_index]["id"] if before_index >= 0 else None
        after = frames[after_index]["id"] if after_index < len(frames) else None
        for key, expected in (("from_frame", before), ("to_frame", after)):
            if key in action and action[key] != expected:
                raise ValidationError(f"action {key} contradicts its explicit direction")
        payload = {
            "sequence_id": sequence_id, "frame_id": action["frame_id"], "direction": action["direction"],
            "recorded_order": action["order"], "timestamp": action["timestamp"],
            "raw_payload": json_copy(action["raw_payload"]), "normalized": normalized,
            "provenance": json_copy(action["provenance"]),
        }
        payload["content_hash"] = content_id("action-content", payload)
        action_id = content_id("action", payload)
        result = {
            **payload, "action_id": action_id, "from_frame": before, "to_frame": after,
            "boundary": before is None or after is None,
            "canonical_terms": [render_term(term, entity_ids=known) for term in normalized],
        }
        slot = (index, action["direction"], action["order"])
        if slot in results and results[slot] != result:
            raise ValidationError("contradictory action payloads occupy the same recorded order")
        results[slot] = result
    return [results[key] for key in sorted(results)]


def _deduced_event(
    raw: Any, pair: dict[str, str], known: frozenset[str], detectors: Mapping[str, str],
) -> dict[str, Any]:
    raw = object_fields(
        raw, {"term", "confidence", "evidence", "uncertainty", "provenance"},
        {"episode_id"}, "deduced event",
    )
    term = validate_term(raw["term"], entity_ids=known, categories={"event"})
    provenance = raw["provenance"]
    if not isinstance(provenance, dict) or provenance.get("source") != "prolog":
        raise ValidationError("canonical visual events require Prolog deduction provenance")
    detector_id = text(provenance.get("detector_id"), "detector_id")
    detector_version = text(provenance.get("detector_version"), "detector_version")
    text(provenance.get("artifact_hash"), "detector artifact_hash")
    if detectors.get(detector_id) != detector_version:
        raise ValidationError("event detector/version is not in the supplied accepted detector registry")
    payload = {
        "source_pair": pair, "pair_id": pair_id(pair),
        "term": term.to_dict(), "canonical_term": render_term(term, entity_ids=known),
        "confidence": probability(raw["confidence"]),
        "evidence": string_list(raw["evidence"], "event evidence", nonempty=True),
        "uncertainty": string_list(raw["uncertainty"], "event uncertainty"),
        "provenance": json_copy(provenance),
    }
    if "episode_id" in raw:
        payload["requested_episode_id"] = text(raw["episode_id"], "episode_id")
    # Episode links are derived from the active relation and do not create circular IDs.
    identity = {key: value for key, value in payload.items() if key != "requested_episode_id"}
    return {**payload, "event_id": content_id("event", identity)}


def _build(
    sequence_id: str, frames: list[dict[str, Any]], assessments: list[dict[str, Any]],
    actions: list[dict[str, Any]], detectors: Mapping[str, str],
) -> list[dict[str, Any]]:
    entries: list[dict[str, Any]] = []
    active: dict[str, str] = {}

    def append(kind: str, payload: dict[str, Any]) -> dict[str, Any]:
        body = {
            "kind": kind, "order": len(entries),
            "previous_id": entries[-1]["id"] if entries else None, **payload,
        }
        entry = {**body, "id": content_id("entry", body)}
        entries.append(entry)
        return entry

    first = frames[0]
    boundary = {
        "frame_id": first["id"], "assessment": "initial_observation", "reason": "no_predecessor",
        "evidence": first["evidence"], "states": first["states"], "entity_ids": first["entity_ids"],
        "input_hash": first["input_hash"], "provenance": first["provenance"],
    }
    boundary["assessment_id"] = content_id("boundary-assessment", [sequence_id, boundary])
    baseline_episodes = {}
    for state in first["states"]:
        if PREDICATES[state["predicate"]].category == "relation":
            relation = render_term(state, entity_ids=first["entity_ids"])
            if relation in active:
                raise ValidationError("duplicate initial relation observation")
            active[relation] = content_id("episode", [relation, boundary["assessment_id"]])
            baseline_episodes[relation] = active[relation]
    append("frame_assessment", {**boundary, "baseline_episodes": baseline_episodes})
    for action in actions:
        if action["from_frame"] is None:
            append("user_action", action)
    for index, raw in enumerate(assessments):
        before, after = frames[index], frames[index + 1]
        raw = object_fields(
            raw,
            {
                "from_frame", "to_frame", "assessment", "comparison_complete", "confidence",
                "evidence", "uncertainty", "events", "provenance",
            },
            set(), "transition",
        )
        if raw["from_frame"] != before["id"] or raw["to_frame"] != after["id"]:
            raise ValidationError("transition gap, out-of-order pair, or mismatched predecessor")
        if not isinstance(raw["events"], list):
            raise ValidationError("transition events must be a list")
        if not isinstance(raw["provenance"], dict) or not raw["provenance"]:
            raise ValidationError("transition provenance must be a nonempty object")
        pair = _pair(sequence_id, before, after)
        known = identifiers([*before["entity_ids"], *after["entity_ids"]])
        events = [_deduced_event(event, pair, known, detectors) for event in raw["events"]]
        if len({event["canonical_term"] for event in events}) != len(events):
            raise ValidationError("duplicate deduced event term in one transition")
        related_actions = [
            action for action in actions
            if action["from_frame"] == before["id"] and action["to_frame"] == after["id"]
        ]
        for action in related_actions:
            append("user_action", action)
        assessment = {
            "source_pair": pair, "pair_id": pair_id(pair),
            **normalize_assessment(raw, event_count=len(events)),
            "event_count": len(events),
            "event_ids": [event["event_id"] for event in events],
            "action_ids": [action["action_id"] for action in related_actions],
            "provenance": json_copy(raw["provenance"]),
        }
        assessment["assessment_id"] = content_id("transition-assessment", assessment)
        append("transition_assessment", assessment)
        phases: set[str] = set()
        for event in events:
            term = event["term"]
            requested = event.pop("requested_episode_id", None)
            episode = None
            if term["predicate"] in PHASES:
                relation = render_term(term["args"][0], entity_ids=known)
                if relation in phases:
                    raise ValidationError("multiple contradictory phases for a relation in one transition")
                phases.add(relation)
                if term["predicate"] == "start":
                    if relation in active:
                        raise ValidationError("duplicate start for an active episode")
                    episode = content_id("episode", [relation, event["event_id"]])
                    active[relation] = episode
                else:
                    if relation not in active:
                        raise ValidationError("continue/end has no active start or baseline episode")
                    episode = active[relation]
                    if term["predicate"] == "end":
                        del active[relation]
                if requested is not None and requested != episode:
                    raise ValidationError("episode ID does not match the active relation")
            elif requested is not None:
                raise ValidationError("instantaneous events cannot reference an episode")
            append("frame_event", {
                **event, "assessment_id": assessment["assessment_id"],
                "action_ids": assessment["action_ids"], "episode_id": episode,
            })
    for action in actions:
        if action["to_frame"] is None:
            append("user_action", action)
    return entries


def _verify_entries(entries: list[dict[str, Any]]) -> None:
    previous = None
    for index, entry in enumerate(entries):
        body = {key: value for key, value in entry.items() if key != "id"}
        if (
            entry.get("order") != index or entry.get("previous_id") != previous
            or entry.get("id") != content_id("entry", body)
        ):
            raise IntegrityError("broken canonical event entry chain")
        previous = entry["id"]


class VisualSequenceEventLog:
    """Immutable generation snapshots supersede suffixes, never historical files.

    `replay` takes the complete ordered prefix. Extending it is safe by default;
    changing/removing earlier inputs requires supersede=True plus expected_generation.
    """

    def __init__(
        self, workspace_root: str | Path, sequence_id: str, *,
        accepted_detectors: Mapping[str, str] | None = None, actor_ids: Iterable[str] = (),
        lock_timeout: float = 30.0,
    ):
        self.workspace_root = Path(workspace_root)
        self.sequence_id = text(sequence_id, "sequence_id")
        self.detectors = dict(accepted_detectors or {})
        self.actor_ids = identifiers(actor_ids)
        sequence_key = content_id("sequence", sequence_id)
        self.path = self.workspace_root / "runtime" / "events" / "visual-sequences" / sequence_key
        self.journal = Journal(self.path, lock_timeout=lock_timeout)
        self.hypothesis_journal = Journal(
            self.workspace_root / "runtime" / "event-hypotheses" / "visual-sequences" / sequence_key,
            lock_timeout=lock_timeout,
        )

    def replay(
        self, frames: list[dict[str, Any]], assessments: list[dict[str, Any]], *,
        actions: list[dict[str, Any]] | None = None,
        expected_generation: int | None = None, supersede: bool = False,
    ) -> dict[str, Any]:
        if not isinstance(frames, list) or not frames:
            raise ValidationError("a sequence needs at least one observed frame")
        normalized_frames = [_frame(frame, index) for index, frame in enumerate(frames)]
        if len({frame["id"] for frame in normalized_frames}) != len(frames):
            raise ValidationError("frame identifiers must be unique in a sequence")
        if not isinstance(assessments, list) or len(assessments) != len(frames) - 1:
            raise ValidationError("exactly one assessment is required for every valid adjacent pair")
        normalized_actions = normalize_actions(
            actions if actions is not None else [], frames=normalized_frames,
            sequence_id=self.sequence_id, actor_ids=self.actor_ids,
        )
        entries = _build(self.sequence_id, normalized_frames, assessments, normalized_actions, self.detectors)
        # Input snapshots retain caller metadata needed to distinguish extension from rewrites.
        inputs = {
            "frames": normalized_frames, "assessments": json_copy(assessments),
            "actions": json_copy(actions if actions is not None else []),
        }
        with self.journal.transaction() as records:
            current = records[-1]["payload"] if records else None
            generation = current["generation"] if current else 0
            if expected_generation is not None and expected_generation != generation:
                raise ConflictError(f"expected generation {expected_generation}, current generation is {generation}")
            if current and current["inputs"] == inputs and current["entries"] == entries:
                return self._public(current)
            common = 0
            if current:
                _verify_entries(current["entries"])
                old = current["inputs"]
                extension = (
                    len(inputs["frames"]) >= len(old["frames"])
                    and inputs["frames"][:len(old["frames"])] == old["frames"]
                    and inputs["assessments"][:len(old["assessments"])] == old["assessments"]
                    and inputs["actions"][:len(old["actions"])] == old["actions"]
                )
                while common < min(len(current["entries"]), len(entries)) and current["entries"][common]["id"] == entries[common]["id"]:
                    common += 1
                tail_boundary = next((
                    index for index, entry in enumerate(current["entries"])
                    if entry["kind"] == "user_action" and entry["to_frame"] is None
                ), len(current["entries"]))
                extension = extension and (
                    common == len(current["entries"])
                    or (len(inputs["frames"]) > len(old["frames"]) and common >= tail_boundary)
                )
                if not extension and (not supersede or expected_generation is None):
                    raise ConflictError("earlier input changed; explicit suffix supersession and expected_generation required")
            payload = {
                "schema_version": SCHEMA_VERSION, "sequence_id": self.sequence_id,
                "channel": "canonical", "authoritative": True,
                "generation": generation + 1, "previous_generation": generation or None,
                "superseded_from": common if current else None,
                "inputs": inputs, "entries": entries, "head_id": entries[-1]["id"],
            }
            self.journal.append(records, payload)
            return self._public(payload)

    @staticmethod
    def _public(payload: dict[str, Any]) -> dict[str, Any]:
        return json_copy(payload)

    def read(self, *, generation: int | None = None) -> dict[str, Any]:
        records = self.journal.read()
        if not records:
            raise KeyError(f"sequence log has not been initialized: {self.sequence_id}")
        if generation is None:
            payload = records[-1]["payload"]
        else:
            if type(generation) is not int or generation < 1 or generation > len(records):
                raise KeyError(f"unknown event-log generation: {generation}")
            payload = records[generation - 1]["payload"]
        if payload["sequence_id"] != self.sequence_id:
            raise IntegrityError("sequence ID does not match its log")
        _verify_entries(payload["entries"])
        return self._public(payload)

    def history(self) -> list[dict[str, Any]]:
        return [
            {
                key: record["payload"][key]
                for key in ("generation", "previous_generation", "superseded_from", "head_id")
            }
            for record in self.journal.read()
        ]

    def episodes(
        self, *, frame_id: str | None = None, generation: int | None = None,
    ) -> list[dict[str, Any]]:
        payload = self.read(generation=generation)
        frames = payload["inputs"]["frames"]
        indices = {frame["id"]: frame["index"] for frame in frames}
        if frame_id is not None and frame_id not in indices:
            raise ValidationError("active-at-frame query references an unknown frame")
        episodes: dict[str, dict[str, Any]] = {}
        for entry in payload["entries"]:
            if entry["kind"] == "frame_assessment":
                for relation, episode_id in entry["baseline_episodes"].items():
                    episodes[episode_id] = {
                        "episode_id": episode_id, "relation": relation,
                        "start_frame": entry["frame_id"], "start_index": 0,
                        "start_event_id": None, "anchor_entry_id": entry["id"],
                        "baseline_at_sequence_start": True, "continuations": [],
                        "end_frame": None, "end_index": None, "end_event_id": None,
                    }
            elif entry["kind"] == "frame_event" and entry["episode_id"]:
                episode_id = entry["episode_id"]
                phase = entry["term"]["predicate"]
                target = entry["source_pair"]["to_frame"]
                if phase == "start":
                    known = {entity for frame in frames for entity in frame["entity_ids"]}
                    episodes[episode_id] = {
                        "episode_id": episode_id,
                        "relation": render_term(entry["term"]["args"][0], entity_ids=known),
                        "start_frame": target, "start_index": indices[target],
                        "start_event_id": entry["event_id"], "anchor_entry_id": entry["id"],
                        "baseline_at_sequence_start": False, "continuations": [],
                        "end_frame": None, "end_index": None, "end_event_id": None,
                    }
                elif phase == "continue":
                    episodes[episode_id]["continuations"].append({
                        "frame_id": target, "event_id": entry["event_id"], "entry_id": entry["id"],
                    })
                elif phase == "end":
                    episodes[episode_id].update({
                        "end_frame": target, "end_index": indices[target], "end_event_id": entry["event_id"],
                    })
        result = []
        at = indices[frame_id] if frame_id is not None else len(frames) - 1
        for episode in episodes.values():
            end = episode["end_index"]
            active = episode["start_index"] <= at and (end is None or at < end)
            if frame_id is not None and not active:
                continue
            result.append({
                **episode, "active_at_frame": active,
                "currently_open": end is None, "open_at_sequence_end": end is None,
                "duration_frames": (end if end is not None else len(frames) - 1) - episode["start_index"],
                "duration_is_lower_bound": end is None or episode["baseline_at_sequence_start"],
            })
        return result

    def record_hypotheses(
        self, raw_response: str, *, source_pair: dict[str, str], provenance: dict[str, Any],
        entity_ids: Iterable[str], active_episodes: Mapping[str, str] | None = None,
    ) -> dict[str, Any]:
        """Persist raw first, including invalid JSON; never alter the canonical log."""
        pair = normalize_pair(source_pair)
        if pair["sequence_id"] != self.sequence_id:
            raise ValidationError("hypothesis sequence does not match this log")
        canonical = self.read()
        matching = [
            entry for entry in canonical["entries"]
            if entry["kind"] == "transition_assessment" and entry["pair_id"] == pair_id(pair)
        ]
        if len(matching) != 1:
            raise ValidationError("hypotheses require an existing, current adjacent-pair assessment")
        known = sorted(identifiers(entity_ids))
        canonical_entities = {
            entity for frame in canonical["inputs"]["frames"]
            if frame["id"] in {pair["from_frame"], pair["to_frame"]} for entity in frame["entity_ids"]
        }
        if not set(known) <= canonical_entities:
            raise ValidationError("hypothesis entities are not present in the supplied pair entity table")
        if not isinstance(raw_response, str):
            raise ValidationError("raw_response must be exact model output text")
        payload = {
            "raw_response": raw_response, "source_pair": pair, "provenance": json_copy(provenance),
            "entity_ids": known, "active_episodes": json_copy(dict(active_episodes or {})),
            "assessment_id": matching[0]["assessment_id"], "generation": canonical["generation"],
        }
        response_id = content_id("llm-response", {key: value for key, value in payload.items() if key != "generation"})
        with self.hypothesis_journal.transaction() as records:
            existing = [
                record["payload"] for record in records if record["payload"]["response_id"] == response_id
            ]
            if not existing:
                self.hypothesis_journal.append(records, {
                    "operation": "raw_response", "response_id": response_id, **payload,
                })
            else:
                validation = next((item for item in existing if item["operation"] == "validation"), None)
                if validation:
                    if validation["status"] == "invalid":
                        raise HypothesisValidationError(raw_response, validation["errors"])
                    return json_copy(validation)
            try:
                parsed = parse_hypotheses(
                    raw_response, entity_ids=known, source_pair=pair, provenance=provenance,
                    active_episodes=active_episodes,
                )
            except HypothesisValidationError as error:
                self.hypothesis_journal.append(records, {
                    "operation": "validation", "response_id": response_id,
                    "status": "invalid", "errors": error.errors,
                })
                raise
            result = {
                "operation": "validation", "response_id": response_id, "status": "valid",
                "parsed": parsed, "assessment_id": matching[0]["assessment_id"],
            }
            self.hypothesis_journal.append(records, result)
            return json_copy(result)

    def hypotheses(self) -> list[dict[str, Any]]:
        """Return exact raw responses and linked success/error records, including old generations."""
        return [record["payload"] for record in self.hypothesis_journal.read()]
