"""Authored SWI event deductions over the temporal core's sealed measurements.

No image processing, model calls, filesystem runtime writes, or generated clauses.
"""

from __future__ import annotations

from dataclasses import asdict, dataclass
import math
from pathlib import Path
import shutil
import subprocess
from typing import Any, Iterable, Mapping, Sequence

from ._event_journal import ValidationError, content_id, json_copy, strict_json
from .event_records import PHASES, PREDICATES, identifiers, normalize_assessment, probability, render_term, text, validate_term
from .observation_identity import _prolog_atom, content_hash
from .object_evidence import validate_object_result
from .object_tracking import measure_composition_input
from .measured_event_features import directional_contact, heading_delta, is_exact_mask_source
from .temporal_correspondence import (
    TemporalFrame, frame_to_dict, initial_temporal_state, measure_frame_relations,
    validate_checkpoint, validate_temporal_result,
)

VERSION = "authored-event-deduction-v2"
RULES = Path(__file__).resolve().parents[3] / "prolog" / "omega_vision" / "event_detectors.pl"
ADAPTER_HASH = content_hash(Path(__file__).read_bytes())
COMPOSITION_ADAPTER_HASH = content_hash(Path(measure_composition_input.__code__.co_filename).read_bytes())
DETECTOR_IDS = (
    "authored_motion", "authored_geometry", "authored_visibility",
    "authored_topology", "authored_occlusion", "authored_attachment",
    "authored_derivatives", "authored_response", "authored_input_response", "authored_trajectory",
)
ATTACHMENT_FACT_FAMILIES = (
    "regions", "shared_edges", "adjacency", "enclosure", "borders", "holes", "probes",
)


@dataclass(frozen=True)
class DetectorConfig:
    motion_tolerance: float = 0.5
    minimum_confidence: float = 0.7
    rotation_iou: float = 0.99
    shape_change_iou: float = 0.95
    occlusion_fraction: float = 0.2
    exit_fraction: float = 0.85
    continuations: bool = True
    heading_tolerance_degrees: float = 15.0
    speed_tolerance: float = 0.25
    blocked_attempts: int = 3
    follow_minimum_matches: int = 2

    def __post_init__(self) -> None:
        if isinstance(self.motion_tolerance, bool) or not math.isfinite(self.motion_tolerance) or self.motion_tolerance < 0:
            raise ValidationError("motion_tolerance must be finite and nonnegative")
        for field in ("minimum_confidence", "rotation_iou", "shape_change_iou", "occlusion_fraction", "exit_fraction"):
            probability(getattr(self, field), field)
        if type(self.continuations) is not bool:
            raise ValidationError("continuations must be boolean")
        if (
            type(self.heading_tolerance_degrees) not in (int, float)
            or not math.isfinite(self.heading_tolerance_degrees) or not 0 < self.heading_tolerance_degrees <= 180
            or type(self.speed_tolerance) not in (int, float) or not math.isfinite(self.speed_tolerance)
            or self.speed_tolerance < 0 or type(self.blocked_attempts) is not int or self.blocked_attempts < 3
            or type(self.follow_minimum_matches) is not int or self.follow_minimum_matches < 2
        ):
            raise ValidationError("derivative thresholds and at least three blocked attempts are required")


def implementation_version(config: DetectorConfig | None = None) -> str:
    return content_id("event-detector-version", {
        "version": VERSION, "config": asdict(config or DetectorConfig()),
        "rules": content_hash(RULES.read_bytes()), "adapter": ADAPTER_HASH,
        "composition_adapter": COMPOSITION_ADAPTER_HASH,
        "measurements": content_hash(Path(__file__).with_name("measured_event_features.py").read_bytes()),
        "term_schema": content_hash(Path(__file__).with_name("event_records.py").read_bytes()),
    })


def accepted_detectors(config: DetectorConfig | None = None) -> dict[str, str]:
    version = implementation_version(config)
    return {detector: version for detector in DETECTOR_IDS}


def run_prolog(payload: dict[str, Any], *, swipl_executable: str | None = None, timeout: float = 30.0) -> dict[str, Any]:
    """Only the fixed repository rule module is consulted; all inputs are JSON data."""
    executable = swipl_executable or shutil.which("swipl")
    if not executable:
        raise RuntimeError("SWI-Prolog is required for event deduction (swipl not on PATH)")
    from ._event_journal import canonical_json
    goal = f"consult({_prolog_atom(str(RULES))}),omega_event_detectors:main"
    try:
        result = subprocess.run(
            [executable, "-q", "-g", goal, "-t", "halt"],
            input=canonical_json(payload), capture_output=True, text=True, encoding="utf-8",
            timeout=timeout, check=False,
        )
    except (FileNotFoundError, subprocess.TimeoutExpired) as error:
        raise RuntimeError(f"event deduction SWI execution failed: {error}") from error
    if result.returncode:
        raise RuntimeError(f"event deduction rules failed (exit {result.returncode}): {result.stderr or result.stdout}")
    try:
        output = strict_json(result.stdout)
    except ValidationError as error:
        raise RuntimeError(f"event deduction returned invalid JSON: {result.stdout}") from error
    if not isinstance(output, dict):
        raise RuntimeError("event deduction must return a JSON object")
    return output


def _term(predicate: str, *args: Any) -> dict[str, Any]:
    return {"predicate": predicate, "args": list(args)}


def _sealed(state: dict[str, Any]) -> dict[str, Any]:
    return {**state, "state_id": content_id("event-state", state)}


def _check_state(state: Mapping[str, Any]) -> None:
    if state.get("state_id") != content_id("event-state", {key: value for key, value in state.items() if key != "state_id"}):
        raise ValidationError("event state content hash mismatch")


def attachment_facts_hash(frame: TemporalFrame) -> str:
    """Bind a producer's completeness attestation to these exact extraction facts."""
    return content_id("attachment-facts", dict(frame.region_evidence))


def _disjoint_pairs(frame: TemporalFrame, tracks: Mapping[str, str]) -> set[tuple[str, str]]:
    pairs = set()
    for index, left in enumerate(frame.groups):
        for right in frame.groups[index + 1:]:
            if (
                left.uid in tracks and right.uid in tracks
                and left.member_uids and right.member_uids
                and left.member_aliases and right.member_aliases
                and not set(left.member_uids) & set(right.member_uids)
                and not set(left.member_aliases) & set(right.member_aliases)
            ):
                pairs.add(tuple(sorted((tracks[left.uid], tracks[right.uid]))))
    return pairs


def _attachment_snapshot(
    objects: Mapping[str, Any] | None, *, frame: TemporalFrame,
    temporal_checkpoint_id: str, observation_tracks: Mapping[str, str],
    context: Mapping[str, Any] | None,
) -> dict[str, Any]:
    snapshot: dict[str, Any] = {
        "pairs": [], "disjoint_pairs": [], "observed": False, "proofs": [],
        "policy_hash": None, "extraction_size": None, "rule_hashes": None,
        "evidence_uid": None, "context": None,
    }
    if objects is None:
        if context is not None:
            raise ValidationError("attachment context requires its sealed object evidence")
        return snapshot
    try:
        validate_object_result(
            objects, expected_frame_uid=frame.uid,
            expected_temporal_checkpoint_uid=temporal_checkpoint_id,
            group_uids=[group.uid for group in frame.groups],
        )
    except ValueError as error:
        raise ValidationError(str(error)) from error
    checkpoint = objects["checkpoint"]
    if checkpoint["providerId"] != frame.provider_id or checkpoint["sequenceId"] != frame.sequence_id:
        raise ValidationError("object evidence targets a different provider/sequence")
    snapshot.update(rule_hashes=json_copy(objects["ruleHashes"]), evidence_uid=objects["evidenceUid"])
    disjoint = _disjoint_pairs(frame, observation_tracks)
    groups = {group.uid: group for group in frame.groups}
    snapshot["disjoint_pairs"] = [list(pair) for pair in sorted(disjoint)]
    for edge in objects["compositionEvidence"]["attachments"]:
        if not set(edge["groups"]) <= observation_tracks.keys():
            raise ValidationError("attachment proof references nonvisible G observations")
        members = tuple(sorted(observation_tracks[uid] for uid in edge["groups"]))
        if members in disjoint:
            left, right = (groups[uid] for uid in edge["groups"])
            first, second = edge["witness"]["regions"]
            if not (
                first in left.member_aliases and second in right.member_aliases
                or second in left.member_aliases and first in right.member_aliases
            ):
                raise ValidationError("attachment witness regions are not members of its groups")
            snapshot["proofs"].append({"tracks": list(members), "witness": json_copy(edge["witness"])})
    if context is None:
        return snapshot
    expected = {
        "frame_uid", "provider_id", "sequence_id", "facts_hash", "object_evidence_uid",
        "extraction_policy_hash", "complete", "background_roles_trusted",
    }
    if not isinstance(context, Mapping) or set(context) != expected:
        raise ValidationError(f"attachment context requires exactly {sorted(expected)}")
    for field in expected - {"complete", "background_roles_trusted"}:
        text(context[field], f"attachment context {field}")
    if (
        context["frame_uid"] != frame.uid or context["provider_id"] != frame.provider_id
        or context["sequence_id"] != frame.sequence_id
        or context["facts_hash"] != attachment_facts_hash(frame)
        or context["object_evidence_uid"] != objects["evidenceUid"]
    ):
        raise ValidationError("attachment context does not match frame/facts/object evidence")
    complete = context["complete"]
    if (
        not isinstance(complete, Mapping) or set(complete) != set(ATTACHMENT_FACT_FAMILIES)
        or any(type(value) is not bool for value in complete.values())
        or type(context["background_roles_trusted"]) is not bool
    ):
        raise ValidationError("attachment completeness and background trust must be explicit booleans")
    size = [frame.region_evidence.get(dimension) for dimension in ("width", "height")]
    if any(type(value) is not int or value <= 0 for value in size):
        raise ValidationError("attachment evidence requires positive extractor-pixel dimensions")
    snapshot.update(
        context=json_copy(dict(context)), policy_hash=context["extraction_policy_hash"],
        extraction_size=size,
        observed=all(complete.values()) and context["background_roles_trusted"],
    )
    if snapshot["observed"]:
        snapshot["pairs"] = sorted({tuple(proof["tracks"]) for proof in snapshot["proofs"]})
        snapshot["pairs"] = [list(pair) for pair in snapshot["pairs"]]
    return snapshot


def _attachment_checkpoint(snapshot: dict[str, Any], previous: Mapping[str, Any] | None = None) -> dict[str, Any]:
    previous = previous or {}
    current_policy = {
        "policy_hash": snapshot["policy_hash"], "extraction_size": snapshot["extraction_size"],
        "rule_hashes": snapshot["rule_hashes"],
    }
    prior_policy = previous.get("attachment_policy", {})
    changed = any(
        prior_policy.get(key) is not None and value is not None and prior_policy[key] != value
        for key, value in current_policy.items()
    )
    # A new policy cannot close an old-policy episode. Keep it historically open,
    # withhold further attachment phases, and request a consistent-policy replay.
    requires_replay = previous.get("attachment_requires_replay", False) or changed
    return {
        "attachment_requested": bool(snapshot["evidence_uid"]) or previous.get("attachment_requested", False),
        "attachment_pairs": snapshot["pairs"] if not requires_replay else [],
        "attachment_disjoint_pairs": snapshot["disjoint_pairs"],
        "attachments_observed": snapshot["observed"] and not requires_replay,
        "attachment_requires_replay": requires_replay,
        "attachment_policy": {
            key: value if value is not None else prior_policy.get(key) for key, value in current_policy.items()
        },
        "attachment_snapshot": snapshot,
    }


def initial_event_state(
    frame: TemporalFrame, *, temporal_state: Mapping[str, Any] | None = None,
    baseline_relations: Iterable[dict[str, Any]] = (), config: DetectorConfig | None = None,
    objects: Mapping[str, Any] | None = None,
    attachment_context: Mapping[str, Any] | None = None,
) -> dict[str, Any]:
    """Bootstrap state; attachment truth needs sealed objects and explicit context.

    attachment_context contains frame_uid/provider_id/sequence_id, facts_hash
    (attachment_facts_hash(frame)), object_evidence_uid, extraction_policy_hash,
    background_roles_trusted, and complete={each ATTACHMENT_FACT_FAMILIES: bool}.
    The producer must attest completeness, not infer it from field presence.
    The policy hash covers extractor/preprocessing versions and parameters,
    excluding per-frame pixels. Extractor dimensions are compared independently.
    """
    temporal = dict(temporal_state) if temporal_state is not None else initial_temporal_state(frame)
    validate_checkpoint(temporal)
    if temporal["frameUid"] != frame.uid or temporal["frameHash"] != content_hash(frame_to_dict(frame)):
        raise ValidationError("initial temporal state does not match the actual frame")
    known = set(identifiers(track["trackUid"] for track in temporal["tracks"]))
    observation_tracks = {track["observationUid"]: track["trackUid"] for track in temporal["tracks"]}
    attachment_state = _attachment_checkpoint(_attachment_snapshot(
        objects, frame=frame, temporal_checkpoint_id=temporal["checkpointUid"],
        observation_tracks=observation_tracks, context=attachment_context,
    ))
    if objects is not None:
        known.update(identifiers(obj["uid"] for obj in objects["objects"]))
    baseline = [
        validate_term(term, entity_ids=known, categories={"relation"}).to_dict()
        for term in baseline_relations
    ]
    for relation in baseline:
        if relation["predicate"] == "attached" and relation["args"] not in attachment_state["attachment_pairs"]:
            raise ValidationError("attachment baseline requires complete authored evidence")
    baseline.extend(
        _term(record["relation"], *record["subjects"])
        for record in measure_frame_relations(frame, temporal_state=temporal)["relations"]
        if record["truth"] is True and not record["prediction"]
    )
    baseline.extend(_term("attached", *pair) for pair in attachment_state["attachment_pairs"])
    baseline.extend(_term("inside", *reversed(term["args"])) for term in list(baseline) if term["predicate"] == "contain")
    baseline = list({render_term(term, entity_ids=known): term for term in baseline}.values())
    return _sealed({
        "version": VERSION, "detector_version": implementation_version(config),
        "sequence_id": frame.sequence_id, "provider_id": frame.provider_id,
        "frame_id": frame.uid, "frame_order": frame.order,
        "temporal_checkpoint_id": temporal["checkpointUid"], "previous_state_id": None,
        "active_relations": baseline, "observed_relations": baseline, "motion": {},
        "blocked_history": {}, "seen_input_receipts": [],
        "follow_history": {},
        "positions": {observation_tracks[group.uid]: list(group.centroid) for group in frame.groups if group.points},
        "observation_tracks": observation_tracks,
        **attachment_state,
        "visibility": {track["trackUid"]: track["visibility"] for track in temporal["tracks"]},
        "entity_ids": sorted(known), "assessment": "initial_observation", "reason": "no_predecessor",
    })


def log_frame(frame: TemporalFrame, state: Mapping[str, Any], *, index: int | None = None) -> dict[str, Any]:
    _check_state(state)
    if state["frame_id"] != frame.uid:
        raise ValidationError("event state and log frame disagree")
    states = list(state["observed_relations"])
    for entity, movement in state["motion"].items():
        states.append(_term("stationary" if movement["state"] == "stationary" else "move", entity))
    states = list({render_term(term, entity_ids=state["entity_ids"]): term for term in states}.values())
    return {
        "id": frame.uid, "index": frame.order if index is None else index,
        "input_hash": content_id("frame-input", dict(frame.source_hashes)),
        "entity_ids": state["entity_ids"], "states": states,
        "evidence": [frame.bundle_uid],
        "provenance": {
            "provider": frame.provider_id, "artifact_hashes": dict(frame.source_hashes),
            **({"attachment_snapshot": state["attachment_snapshot"]} if state["attachment_snapshot"]["evidence_uid"] else {}),
        },
    }


def _relation_key(term: dict[str, Any], known: Iterable[str]) -> str:
    return render_term(term, entity_ids=known)


def deduce_pair_events(
    before: TemporalFrame, after: TemporalFrame, temporal: Mapping[str, Any], *,
    previous_state: Mapping[str, Any],
    objects: Mapping[str, Any] | None = None,
    config: DetectorConfig | None = None, swipl_executable: str | None = None,
    timeout: float = 30.0, candidate_store: Any = None,
    scope_context: Mapping[str, Any] | None = None,
    attachment_context: Mapping[str, Any] | None = None,
) -> dict[str, Any]:
    """Return a log-ready assessment, target frame, features, registry, and sealed state."""
    config = config or DetectorConfig()
    validate_temporal_result(temporal)
    _check_state(previous_state)
    version = implementation_version(config)
    if previous_state["detector_version"] != version:
        raise ValidationError("event detector/config changed; replay the affected suffix")
    if (
        temporal["sourceFrameUid"] != before.uid or temporal["targetFrameUid"] != after.uid
        or temporal["sourceOrder"] != before.order or temporal["targetOrder"] != after.order
        or after.order != before.order + 1
        or temporal["providerId"] != before.provider_id or before.provider_id != after.provider_id
        or temporal["sequenceId"] != before.sequence_id or before.sequence_id != after.sequence_id
        or temporal["sourceHashes"] != dict(before.source_hashes)
        or temporal["targetHashes"] != dict(after.source_hashes)
        or temporal["checkpoint"]["frameHash"] != content_hash(frame_to_dict(after))
    ):
        raise ValidationError("temporal evidence does not describe these adjacent source frames")
    if (
        previous_state["frame_id"] != before.uid
        or previous_state["frame_order"] != before.order
        or previous_state["sequence_id"] != before.sequence_id
        or previous_state["provider_id"] != before.provider_id
        or previous_state["temporal_checkpoint_id"] != temporal["checkpoint"]["previousCheckpointUid"]
    ):
        raise ValidationError("event state has a stale predecessor, ordering gap, or fork")
    pair_ref, evidence_ref = temporal["pairUid"], temporal["evidenceUid"]
    known = set(identifiers([*previous_state["entity_ids"], *(track["trackUid"] for track in temporal["checkpoint"]["tracks"])]))
    active = {_relation_key(term, known): term for term in previous_state["active_relations"]}
    matches = {match["trackUid"]: match for match in temporal["matches"]}
    current_tracks = {track["trackUid"]: track for track in temporal["checkpoint"]["tracks"]}
    visibly_measured = {
        track["trackUid"] for track in temporal["checkpoint"]["tracks"]
        if track["lastObservedOrder"] == after.order
    }
    # Enumerate only transforms already supported by the sealed correspondence.
    # Reuse the composition core's original-coordinate rigid transform keys.
    rigid_motion: dict[str, list[dict[str, Any]]] = {}
    rigid_input = {"matches": [
        {**match, "transforms": [transform]}
        for match in temporal["matches"] for transform in match["transforms"]
    ]}
    for row in measure_composition_input(after, rigid_input, motion_tolerance=config.motion_tolerance)["motion"]:
        rigid_motion.setdefault(row["uid"], []).append(row)
    ambiguous = bool(temporal["ambiguities"])
    uncertainty = ["ambiguous_correspondence"] if ambiguous else []
    motion_rows, relations, facts, known_absent = [], [], [], []
    derivative_rows, geometry_rows, response_rows, contact_rows, follow_rows = [], [], [], [], []
    unsupported_measurements = []
    geometry_by_track = {item["trackUid"]: item for item in temporal["geometry"]}
    interval = temporal["interval"]
    if interval["seconds"] is not None:
        facts.append(_term("measured_interval", interval["seconds"], interval["clockId"]))
    current_motion: dict[str, Any] = {}

    def add_relation(term: dict[str, Any], old: bool | None, new: bool | None, detector: str, confidence: float, evidence: list[str]) -> None:
        term = validate_term(term, entity_ids=known, categories={"relation"}).to_dict()
        relations.append({
            "term": term, "before": old, "after": new,
            "active": _relation_key(term, known) in active, "detector": detector,
            "confidence": confidence, "evidence": evidence,
        })
        if old is True:
            facts.append(term)
        elif old is False:
            known_absent.append(term)

    for measured in temporal["motion"]:
        entity = measured["trackUid"]
        match = matches[entity]
        confidence = probability(match["confidence"])
        if measured["observationStatus"] != "measured":
            raise ValidationError("motion input is not measured evidence")
        displacement = measured["displacement"]
        if len(displacement) != 2 or any(isinstance(number, bool) or not isinstance(number, (int, float)) or not math.isfinite(number) for number in displacement):
            raise ValidationError("motion displacement must be two finite numbers")
        magnitude = math.hypot(*displacement)
        is_moving = magnitude > config.motion_tolerance
        row = {
            "entity": entity, "displacement": displacement, "maskIou": probability(match["maskIou"]),
            "transforms": match["transforms"], "confidence": confidence,
            "reappeared": bool(measured["reappeared"]), "evidence": [evidence_ref, pair_ref],
        }
        motion_rows.append(row)
        if row["reappeared"] or confidence < config.minimum_confidence:
            uncertainty.append(f"ungraded_motion:{entity}")
            continue
        facts.extend([
            _term("displacement", entity, *displacement),
            _term("displacement_magnitude", entity, magnitude),
            _term("shape_iou", entity, row["maskIou"]),
        ])
        old = previous_state["motion"].get(entity)
        current_motion[entity] = {
            "state": "moving" if is_moving else "stationary", "displacement": displacement,
            "rigid_motion": rigid_motion.get(match["toUid"], []), "transforms": match["transforms"],
            "interval": interval, "confidence": confidence,
            "translation_supported": row["maskIou"] >= config.rotation_iou and "identity" in match["transforms"],
            "spatial_references": [
                (before.observation_metadata or {}).get("coordinate_frame_id"),
                (after.observation_metadata or {}).get("coordinate_frame_id"),
            ],
        }
        geometry = geometry_by_track[entity]
        geometric_evidence = [evidence_ref, pair_ref, before.uid, after.uid,
                              geometry["before"]["maskHash"], geometry["after"]["maskHash"]]
        confounded = any(item["occludedTrackUid"] == entity for item in temporal["occlusions"])
        source_group = next(group for group in before.groups if group.uid == match["fromUid"])
        target_group = next(group for group in after.groups if group.uid == match["toUid"])
        lost = set(source_group.points) - set(target_group.points)
        gained = set(target_group.points) - set(source_group.points)
        confounded = confounded or any(
            lost & set(group.points) for group in after.groups if group.uid != target_group.uid
        ) or any(gained & set(group.points) for group in before.groups if group.uid != source_group.uid)
        usable_geometry = geometry["exact"] and not geometry["borderClipped"] and not confounded
        if not usable_geometry and (
            geometry["areaDelta"] or geometry["holeDelta"] or geometry["colorChanged"]
            or row["maskIou"] < config.shape_change_iou
        ):
            unsupported_measurements.append({
                "entity": entity, "measurement": "geometry_change",
                "reason": "inexact_clipped_or_occlusion_confounded_pixels",
            })
        geometry_rows.append({
            **geometry, "entity": entity, "usable": bool(usable_geometry), "confidence": confidence,
            "evidence": geometric_evidence, "maskIou": row["maskIou"],
        })
        if (
            usable_geometry and row["maskIou"] == 1
            and geometry["nonuniformScale"] and geometry["affineIou"] >= config.rotation_iou
        ):
            geometry_rows[-1]["explanationAlternatives"] = ["rigid_transform", "axis_aligned_deformation"]
            uncertainty.append(f"ambiguous_rigid_or_nonuniform_transform:{entity}")
        if usable_geometry:
            facts.extend([
                _term("area_delta", entity, geometry["areaDelta"]),
                _term("hole_count_delta", entity, geometry["holeDelta"]),
                _term("scale_axes", entity, *geometry["scale"]),
                _term("affine_iou", entity, geometry["affineIou"]),
            ])
            if geometry["colorChanged"]:
                facts.append(_term("appearance_transition", entity, str(geometry["beforeColors"]), str(geometry["afterColors"])))
            if geometry["uniformScale"] and geometry["affineIou"] >= config.rotation_iou:
                facts.append(_term("scale_ratio", entity, geometry["scale"][0]))
        if old is not None:
            facts.append(_term("move" if old["state"] == "moving" else "stationary", entity))
            known_absent.append(_term("stationary" if old["state"] == "moving" else "move", entity))
            add_relation(
                _term("move", entity), old["state"] == "moving", is_moving,
                "authored_motion", confidence, [evidence_ref, pair_ref],
            )
            derivative_supported = (
                old["translation_supported"] and current_motion[entity]["translation_supported"]
                and old["interval"]["toFrame"] == before.uid and not confounded
            )
            spatial_references = [*old["spatial_references"], *current_motion[entity]["spatial_references"]]
            declared_references = {reference for reference in spatial_references if reference is not None}
            # Missing time does not erase a spatial-reference contradiction.
            # Retain legacy per-frame image measurements only when all references
            # are unspecified, or every endpoint explicitly shares one reference.
            spatially_comparable = not declared_references or (
                len(declared_references) == 1 and all(reference is not None for reference in spatial_references)
            )
            if derivative_supported and not spatially_comparable:
                unsupported_measurements.append({
                    "entity": entity, "measurement": "motion_derivatives",
                    "reason": "incompatible_spatial_references", "coordinateFrameIds": spatial_references,
                })
                uncertainty.append(f"incompatible_spatial_references:{entity}")
            if derivative_supported and spatially_comparable:
                prior_magnitude = math.hypot(*old["displacement"])
                heading = heading_delta(old["displacement"], displacement) if (
                    prior_magnitude > config.motion_tolerance and magnitude > config.motion_tolerance
                ) else None
                delta = None
                old_interval = old["interval"]
                if (
                    interval["seconds"] is not None and old_interval["seconds"] is not None
                    and old_interval["clockId"] == interval["clockId"]
                    and old_interval["coordinateFrameId"] == interval["coordinateFrameId"]
                ):
                    delta = magnitude / interval["seconds"] - prior_magnitude / old_interval["seconds"]
                    facts.append(_term("speed_delta", entity, delta))
                elif abs(magnitude - prior_magnitude) > config.motion_tolerance:
                    unsupported_measurements.append({
                        "entity": entity, "measurement": "physical_speed_delta",
                        "reason": interval["unsupported"] or old_interval["unsupported"] or "measurement_reference_changed",
                    })
                facts.append(_term("frame_displacement_delta", entity, magnitude - prior_magnitude))
                if heading is not None:
                    facts.append(_term("heading_delta", entity, heading))
                derivative_rows.append({
                    "entity": entity, "headingDelta": heading, "speedDelta": delta,
                    "headingUnit": "degrees", "speedUnit": "pixels_per_second" if delta is not None else None,
                    "confidence": min(confidence, old["confidence"]),
                    "evidence": sorted(set([evidence_ref, pair_ref, *interval["evidence"], *old_interval["evidence"]])),
                })
    for left_index, left in enumerate(sorted(current_motion)):
        for right in sorted(current_motion)[left_index + 1:]:
            def co_moving(movement: Mapping[str, Any]) -> bool | None:
                first, second = movement[left], movement[right]
                first_rigid, second_rigid = first["rigid_motion"], second["rigid_motion"]
                if not first_rigid or not second_rigid:
                    return None
                for first_option in first_rigid:
                    for second_option in second_rigid:
                        if (
                            first_option["transform"] != second_option["transform"]
                            or math.dist(first_option["key"], second_option["key"]) > config.motion_tolerance
                        ):
                            continue
                        if first_option["transform"] == "identity":
                            if first["state"] == "moving" and second["state"] == "moving":
                                return True
                        elif (
                            first["state"] == "moving" or second["state"] == "moving"
                            or len(first["transforms"]) == 1 or len(second["transforms"]) == 1
                        ):
                            return True
                return False
            old_motion = previous_state["motion"]
            before_co_motion = co_moving(old_motion) if left in old_motion and right in old_motion else None
            after_co_motion = co_moving(current_motion)
            if before_co_motion or after_co_motion:
                if after_co_motion is None:
                    uncertainty.append(f"unresolved_co_motion:{left}:{right}")
                add_relation(
                    _term("co_move", left, right), before_co_motion, after_co_motion,
                    "authored_motion", min(matches[left]["confidence"], matches[right]["confidence"]), [evidence_ref, pair_ref],
                )
    visibility_rows = []
    for observed in temporal["visibility"]:
        entity = observed["trackUid"]
        if observed["status"] == "unmatched_visible":
            uncertainty.append(f"unresolved_visibility:{entity}")
        previous = previous_state["visibility"].get(entity, "unobserved")
        currently_visible = entity in visibly_measured
        visibility_rows.append({
            "entity": entity, "status": observed["status"], "previousStatus": previous,
            "wasVisible": previous in {"visible", "reappeared", "partial_occlusion", "partially_exited"},
            "currentlyVisible": currently_visible, "border": bool(observed.get("border", False)),
            "projectionSupported": observed.get("projectionSupported", False),
            "exitFraction": probability(observed.get("projectedExitFraction", 0)),
            "ambiguous": ambiguous,
            "occlusionConfirmed": any(
                item["occludedTrackUid"] == entity and item["confirmed"]
                and any(signed["compatible"] for signed in item["depthEvidence"])
                and not any(not signed["compatible"] for signed in item["depthEvidence"])
                for item in temporal["occlusions"]
            ),
            "confidence": probability(matches[entity]["confidence"]) if entity in matches else 1.0,
            "evidence": [evidence_ref, pair_ref],
        })
        facts.append(_term("present" if currently_visible else "missing_match", entity))
        if observed.get("projectionSupported"):
            facts.append(_term("projected_exit_fraction", entity, observed["projectedExitFraction"]))
    for measured in temporal["topology"]:
        if measured["prediction"]:
            continue
        if any(value is not None and type(value) is not bool for value in (measured["before"], measured["after"])):
            raise ValidationError("topology truth must be true, false, or unknown")
        relation = _term(measured["relation"], *measured["subjects"])
        add_relation(relation, measured["before"], measured["after"], "authored_topology", 1.0, [evidence_ref, pair_ref])
        if measured["relation"] == "contain":
            add_relation(
                _term("inside", *reversed(measured["subjects"])), measured["before"], measured["after"],
                "authored_topology", 1.0, [evidence_ref, pair_ref],
            )
        if measured["before"] is True:
            facts.append(relation)
        elif measured["before"] is False:
            known_absent.append(relation)
        if type(measured["before"]) is bool and type(measured["after"]) is bool:
            facts.append(_term(
                measured["relation"] + "_delta", *measured["subjects"],
                int(measured["after"]) - int(measured["before"]),
            ))
    # Contact at the previous frame is evidence time; the current response is
    # decision time. Neither a contact nor an approaching prediction is recoil.
    for measured in temporal["topology"]:
        if measured["relation"] != "contact" or measured["prediction"] or measured["before"] is not True:
            continue
        left, right = measured["subjects"]
        if any(entity not in current_motion or entity not in previous_state["motion"] for entity in (left, right)):
            continue
        old_left, old_right = (previous_state["motion"][entity] for entity in (left, right))
        new_left, new_right = (current_motion[entity] for entity in (left, right))
        if not all(row["translation_supported"] for row in (old_left, old_right, new_left, new_right)):
            continue
        first = next(group for group in before.groups if group.uid == matches[left]["fromUid"])
        second = next(group for group in before.groups if group.uid == matches[right]["fromUid"])
        if not all(is_exact_mask_source(group.mask_source) for group in (first, second)):
            continue
        normal = [b - a for a, b in zip(first.centroid, second.centroid)]
        norm = math.hypot(*normal)
        if not norm:
            continue
        normal = [value / norm for value in normal]
        def along(movement: Mapping[str, Any]) -> float:
            return sum(a * b for a, b in zip(movement["displacement"], normal))
        incoming = along(old_left) - along(old_right)
        outgoing = along(new_left) - along(new_right)
        evidence = sorted(set([before.uid, after.uid, evidence_ref, pair_ref,
                               *old_left["interval"]["evidence"], *old_right["interval"]["evidence"]]))
        response_rows.append({
            "subjects": [left, right], "incoming": incoming, "outgoing": outgoing,
            "leftReversed": along(old_left) > config.motion_tolerance and along(new_left) < -config.motion_tolerance,
            "rightReversed": along(old_right) < -config.motion_tolerance and along(new_right) > config.motion_tolerance,
            "leftStationary": old_left["state"] == new_left["state"] == "stationary",
            "rightStationary": old_right["state"] == new_right["state"] == "stationary",
            "confidence": min(row["confidence"] for row in (old_left, old_right, new_left, new_right)),
            "evidence": evidence,
        })

    for actor, actor_match in matches.items():
        if actor_match["reappeared"] or actor not in current_motion:
            continue
        actor_before = next(group for group in before.groups if group.uid == actor_match["fromUid"])
        actor_after = next(group for group in after.groups if group.uid == actor_match["toUid"])
        for other, other_match in matches.items():
            if actor == other or other_match["reappeared"] or other not in current_motion:
                continue
            other_before = next(group for group in before.groups if group.uid == other_match["fromUid"])
            other_after = next(group for group in after.groups if group.uid == other_match["toUid"])
            if not all(is_exact_mask_source(group.mask_source) for group in (actor_before, actor_after, other_before, other_after)):
                continue
            for direction in ((1, 0), (-1, 0), (0, 1), (0, -1)):
                old_contact = directional_contact(actor_before.points, other_before.points, direction)
                new_contact = directional_contact(actor_after.points, other_after.points, direction)
                facts.append(_term("directional_contact", actor, other, *direction, new_contact))
                if direction == (0, 1):
                    facts.append(_term("image_down_contact_delta", actor, other, new_contact - old_contact))
                if old_contact or new_contact:
                    contact_rows.append({
                        "subjects": [actor, other], "direction": list(direction),
                        "beforePixels": old_contact, "afterPixels": new_contact,
                        "evidence": [before.uid, after.uid, pair_ref, evidence_ref],
                        "interpretation": "image_boundary_occupancy_not_physical_support",
                    })

    follow_history = {}
    positions = {
        track["trackUid"]: list(next(group for group in after.groups if group.uid == track["observationUid"]).centroid)
        for track in current_tracks.values() if track["trackUid"] in visibly_measured and track["points"]
    }
    for follower in sorted(current_motion):
        for leader in sorted(current_motion.keys() - {follower}):
            if leader not in previous_state["positions"] or not all(
                current_motion[entity]["translation_supported"] for entity in (follower, leader)
            ):
                continue
            relation = _term("follow", follower, leader)
            key = _relation_key(relation, known)
            old = previous_state["follow_history"].get(key, {
                "count": 0, "truth": True if key in active else None, "evidence": [],
            })
            distance = math.dist(positions[follower], previous_state["positions"][leader])
            facts.append(_term("lagged_path_distance", follower, leader, distance))
            moving = all(current_motion[entity]["state"] == "moving" for entity in (follower, leader))
            matched = moving and distance <= config.motion_tolerance
            count = old["count"] + 1 if matched else 0
            truth = True if count >= config.follow_minimum_matches else (None if matched else False)
            evidence = sorted(set([before.uid, after.uid, pair_ref, evidence_ref, *old["evidence"]]))
            follow_history[key] = {
                "count": count, "truth": truth if truth is not None else old["truth"], "evidence": evidence,
            }
            if truth is not None:
                add_relation(relation, old["truth"], truth, "authored_trajectory",
                             min(current_motion[entity]["confidence"] for entity in (follower, leader)), evidence)
            if count:
                facts.append(_term("lagged_path_matches", follower, leader, count))
            if count or old["count"]:
                follow_rows.append({
                    "subjects": [follower, leader], "sampleLag": 1, "matchedPositions": count,
                    "distance": distance, "truth": truth, "evidence": evidence,
                    "interpretation": "observed_lagged_path_not_intent",
                })

    blocked_history = {}
    seen_receipts = set(previous_state["seen_input_receipts"])
    attempted_pairs = set()
    source_tracks = previous_state["observation_tracks"]
    receipt_actor_counts = {}
    for receipt in temporal["inputReceipts"]:
        receipt_actor_counts[receipt["actor_uid"]] = receipt_actor_counts.get(receipt["actor_uid"], 0) + 1
    for receipt in temporal["inputReceipts"]:
        if receipt["receipt_id"] in seen_receipts:
            raise ValidationError("input receipt was already consumed by an earlier transition")
        seen_receipts.add(receipt["receipt_id"])
        if receipt_actor_counts[receipt["actor_uid"]] != 1:
            unsupported_measurements.append({"measurement": "input_response", "reason": "multiple_inputs_without_individual_observations"})
            continue
        actor = source_tracks.get(receipt["actor_uid"])
        if actor not in current_motion:
            unsupported_measurements.append({"measurement": "input_response", "reason": "actor_correspondence_unknown"})
            continue
        direction = receipt["direction"]
        norm = math.hypot(*direction)
        direction = [value / norm for value in direction]
        facts.extend([_term("user_input", actor, receipt["action"]), _term("action_direction", actor, *direction)])
        actor_group = next(group for group in after.groups if group.uid == matches[actor]["toUid"])
        before_actor = next(group for group in before.groups if group.uid == receipt["actor_uid"])
        for barrier in sorted(current_motion.keys() - {actor}):
            if not current_motion[barrier]["translation_supported"] or current_motion[barrier]["state"] != "stationary":
                continue
            barrier_group = next(group for group in after.groups if group.uid == matches[barrier]["toUid"])
            before_barrier = next(group for group in before.groups if group.uid == matches[barrier]["fromUid"])
            if not all(is_exact_mask_source(group.mask_source) for group in (before_actor, actor_group, before_barrier, barrier_group)):
                unsupported_measurements.append({
                    "entity": actor, "measurement": "input_response",
                    "reason": "exact_boundary_pixels_unavailable",
                })
                continue
            contact = directional_contact(actor_group.points, barrier_group.points, direction)
            facts.append(_term("directed_contact_pixels", actor, barrier, contact))
            key = _relation_key(_term("blocked", actor, barrier), known)
            old = previous_state["blocked_history"].get(key)
            old_count = old["count"] if old is not None else 0
            old_truth = old["truth"] if old is not None else (True if key in active else None)
            if old is not None and math.dist(old["direction"], direction) > 1e-9:
                old_count = 0
                old_truth = None
            evidence = [receipt["receipt_id"], receipt["source_ref"], receipt["source_hash"],
                        receipt["actor_binding_ref"], evidence_ref, pair_ref, before.uid, after.uid]
            failed = current_motion[actor]["state"] == "stationary" and contact > 0
            if failed:
                # Multiple receipts within one image interval cannot count as
                # independently observed failed attempts.
                if key in attempted_pairs:
                    continue
                attempted_pairs.add(key)
                count = old_count + 1
                history = sorted(set([*evidence, *((old or {}).get("evidence", []) if old_truth is not None or old_count else [])]))
                current_truth = True if count >= config.blocked_attempts else None
                blocked_history[key] = {
                    "count": count, "direction": direction, "evidence": history,
                    "truth": current_truth if current_truth is not None else old_truth,
                }
                facts.append(_term("failed_attempts", actor, barrier, count))
                add_relation(_term("blocked", actor, barrier), old_truth,
                             current_truth, "authored_input_response", 1.0, history)
                if current_truth is True and old_truth is None and key not in active:
                    uncertainty.append(f"blocked_initial_boundary_unestablished:{actor}:{barrier}")
            elif sum(
                value * component for value, component in zip(current_motion[actor]["displacement"], direction)
            ) > config.motion_tolerance:
                blocked_history[key] = {
                    "count": 0, "truth": False, "direction": direction, "evidence": evidence,
                }
                add_relation(_term("blocked", actor, barrier), old_truth, False if contact == 0 or key not in active else None,
                             "authored_input_response", 1.0, evidence)
        for key, relation in active.items():
            if relation["predicate"] != "blocked" or relation["args"][0] != actor:
                continue
            barrier = relation["args"][1]
            if barrier in current_motion:
                continue
            previous_barrier = next((
                group for group in before.groups if source_tracks.get(group.uid) == barrier
            ), None)
            if (
                previous_barrier is not None
                and all(is_exact_mask_source(group.mask_source) for group in (before_actor, actor_group, previous_barrier))
                and directional_contact(before_actor.points, previous_barrier.points, direction) > 0
                and set(actor_group.points) & set(previous_barrier.points)
                and sum(value * component for value, component in zip(current_motion[actor]["displacement"], direction)) > config.motion_tolerance
            ):
                # The actor is now observed occupying the old obstruction, not
                # merely failing to find the obstacle elsewhere in the image.
                add_relation(relation, True, False, "authored_input_response", current_motion[actor]["confidence"], [
                    receipt["receipt_id"], receipt["source_ref"], receipt["source_hash"],
                    receipt["actor_binding_ref"], evidence_ref, pair_ref, before.uid, after.uid,
                ])
    # A no-input pause is unknown attempted motion; it never closes blocked.
    for key, old in previous_state["blocked_history"].items():
        if key not in blocked_history and key not in {_relation_key(row["term"], known) for row in relations}:
            blocked_history[key] = {**old, "count": 0}
    occlusions = []
    for measured in temporal["occlusions"]:
        occluder, occluded = measured["occluderTrackUid"], measured["occludedTrackUid"]
        relation = _term("occlude", occluder, occluded)
        validate_term(relation, entity_ids=known, categories={"relation"})
        if measured["pairUid"] != pair_ref:
            raise ValidationError("occlusion measurement belongs to another pair")
        signed = measured["depthEvidence"]
        if type(measured["confirmed"]) is not bool:
            raise ValidationError("occlusion confirmation must be an explicit boolean")
        if any(type(item.get("compatible")) is not bool for item in signed):
            raise ValidationError("depth evidence must carry a signed compatibility boolean")
        projected = measured["projectedDisplacement"]
        if not isinstance(projected, list) or len(projected) != 2 or any(
            isinstance(number, bool) or not isinstance(number, (int, float)) or not math.isfinite(number)
            for number in projected
        ):
            raise ValidationError("occlusion requires a finite projected displacement vector")
        supported = bool(measured["motionEvidence"])
        row = {
            "occluder": occluder, "occluded": occluded, "confirmed": measured["confirmed"],
            "motionSupported": supported, "overlapFraction": probability(measured["overlapFraction"]),
            "depthPositive": any(item["compatible"] for item in signed),
            "depthContradicted": any(not item["compatible"] for item in signed),
            "occluderVisible": occluder in visibly_measured,
            "wasVisible": previous_state["visibility"].get(occluded) in {"visible", "reappeared", "partial_occlusion"},
            "active": _relation_key(relation, known) in active,
            "confidence": probability(measured["confidence"]), "evidence": [evidence_ref, pair_ref, measured["projectionHash"]],
        }
        occlusions.append(row)
        if not row["confirmed"] or row["depthContradicted"] or not row["depthPositive"]:
            uncertainty.append(f"unconfirmed_occlusion:{occluder}:{occluded}")
        else:
            facts.append(_term("occlusion_overlap", occluder, occluded, row["overlapFraction"]))
    closed_occlusions = []
    for episode in temporal["checkpoint"]["occlusionEpisodes"]:
        if episode["endPairUid"] != pair_ref:
            continue
        occluder, occluded = episode["occluderTrackUid"], episode["occludedTrackUid"]
        relation = _term("occlude", occluder, occluded)
        closed_occlusions.append({
            "occluder": occluder, "occluded": occluded,
            "active": _relation_key(relation, known) in active,
            "reappeared": occluded in matches and matches[occluded]["reappeared"],
            "depthContradicted": episode["confirmationStatus"] != "supported_by_reappearance",
            "confidence": probability(matches[occluded]["confidence"]) if occluded in matches else 0.0,
            "evidence": [evidence_ref, pair_ref, episode["episodeUid"]],
        })
    observation_tracks = {
        track["observationUid"]: track["trackUid"] for track in current_tracks.values()
        if track["lastObservedOrder"] == after.order
    }
    snapshot = _attachment_snapshot(
        objects, frame=after, temporal_checkpoint_id=temporal["checkpoint"]["checkpointUid"],
        observation_tracks=observation_tracks, context=attachment_context,
    )
    attachment_state = _attachment_checkpoint(snapshot, previous_state)
    prior_attachment_pairs = {tuple(pair) for pair in previous_state["attachment_pairs"]}
    attachment_pairs = {tuple(pair) for pair in attachment_state["attachment_pairs"]}
    if attachment_state["attachment_requested"]:
        if attachment_state["attachment_requires_replay"]:
            uncertainty.append("attachment_policy_changed_requires_replay")
        elif not attachment_state["attachments_observed"]:
            uncertainty.append("attachment_facts_incomplete_or_untrusted")
        current_disjoint = {tuple(pair) for pair in snapshot["disjoint_pairs"]}
        prior_disjoint = {tuple(pair) for pair in previous_state["attachment_disjoint_pairs"]}
        for members in sorted(current_disjoint | prior_disjoint | prior_attachment_pairs):
            old = (
                members in prior_attachment_pairs
                if previous_state["attachments_observed"] and members in prior_disjoint
                and not attachment_state["attachment_requires_replay"] else None
            )
            current = (
                members in attachment_pairs
                if attachment_state["attachments_observed"] and members in current_disjoint else None
            )
            if current is None and members in prior_attachment_pairs:
                uncertainty.append("attachment_members_not_observed_disjoint")
            add_relation(
                _term("attached", *members), old, current, "authored_attachment", 1.0,
                [
                    content_id("attachment-comparison", [previous_state["attachment_snapshot"], snapshot]),
                    *([snapshot["evidence_uid"]] if snapshot["evidence_uid"] else []),
                ],
            )
    if objects is not None:
        for obj in objects["objects"]:
            known.add(obj["uid"])
    input_data = {
        "mode": "authored", "motion": motion_rows, "visibility": visibility_rows,
        "relations": relations, "occlusions": occlusions, "closedOcclusions": closed_occlusions,
        "motionTolerance": config.motion_tolerance, "minimumConfidence": config.minimum_confidence,
        "rotationIou": config.rotation_iou, "shapeChangeIou": config.shape_change_iou,
        "occlusionFraction": config.occlusion_fraction, "exitFraction": config.exit_fraction,
        "continuations": config.continuations and temporal["assessment"] != "no_material_change",
        "receiptContinuations": config.continuations,
        "geometry": geometry_rows, "derivatives": derivative_rows, "responses": response_rows,
        "headingTolerance": config.heading_tolerance_degrees, "speedTolerance": config.speed_tolerance,
    }
    output = run_prolog(input_data, swipl_executable=swipl_executable, timeout=timeout)
    if not isinstance(output.get("events"), list):
        raise RuntimeError("authored Prolog result lacks events")
    registry = accepted_detectors(config)
    artifact_hash = content_id("deduction-artifact", [input_data, output, version])
    events = []
    for raw in output["events"]:
        detector = raw["detector"]
        if detector not in registry:
            raise RuntimeError("Prolog returned an unregistered authored detector")
        term = validate_term(raw["term"], entity_ids=known, categories={"event"}).to_dict()
        events.append({
            "term": term, "confidence": probability(raw["confidence"]),
            "evidence": raw["evidence"], "uncertainty": [],
            "provenance": {
                "source": "prolog", "detector_id": detector, "detector_version": registry[detector],
                "artifact_hash": artifact_hash, "temporal_evidence": evidence_ref,
            },
        })
    facts = sorted({render_term(term, entity_ids=known): term for term in facts}.values(), key=lambda item: render_term(item, entity_ids=known))
    learned = {"events": [], "accepted_detectors": {}, "skipped": []}
    if candidate_store is not None:
        from .event_induction import replay_promoted_detectors
        learned = replay_promoted_detectors(
            candidate_store, facts, entity_ids=known,
            scope_context={
                "domain": "visual-sequence", "provider_id": after.provider_id, "sequence_id": after.sequence_id,
                **dict(scope_context or {}),
            },
            known_absent=known_absent,
            swipl_executable=swipl_executable, timeout=timeout,
        )
        existing = {render_term(event["term"], entity_ids=known) for event in events}
        for event in learned["events"]:
            key = render_term(event["term"], entity_ids=known)
            if key not in existing:
                events.append(event)
                existing.add(key)
        registry.update(learned["accepted_detectors"])
    observed_relations = {
        _relation_key(row["term"], known): row["term"] for row in relations if row["after"] is True
    }
    for row in occlusions:
        if (
            row["confirmed"] and row["motionSupported"] and row["depthPositive"]
            and not row["depthContradicted"] and row["occluderVisible"]
            and row["overlapFraction"] >= config.occlusion_fraction
        ):
            relation = _term("occlude", row["occluder"], row["occluded"])
            observed_relations[_relation_key(relation, known)] = relation
    phase_relations = set()
    for event in events:
        term = event["term"]
        if term["predicate"] in PHASES:
            relation = term["args"][0]
            key = _relation_key(relation, known)
            if key in phase_relations:
                raise ValidationError("deductions contain contradictory phases for one relation")
            phase_relations.add(key)
            if term["predicate"] == "start":
                if key in active:
                    raise ValidationError("deduction emitted a duplicate active relation start")
                active[key] = relation
                observed_relations[key] = relation
            elif term["predicate"] == "end":
                if key not in active:
                    raise ValidationError("deduction emitted an end without an active baseline/start")
                del active[key]
                observed_relations.pop(key, None)
            elif key not in active:
                raise ValidationError("deduction emitted a continuation without an active baseline/start")
            else:
                observed_relations[key] = relation
    label = "changed" if events or temporal["assessment"] == "material_change" else temporal["assessment"]
    # Pixel equality does not negate a multi-frame change such as moving -> stopped.
    # Continuations alone were suppressed above; a positive authored proof is required.
    complete = temporal["assessment"] != "unknown" and not uncertainty
    if label == "no_material_change" and not complete:
        label = "unknown"
    assessment = {
        "from_frame": before.uid, "to_frame": after.uid,
        "assessment": label, "comparison_complete": complete,
        "confidence": min((event["confidence"] for event in events), default=1.0 if complete else 0.0),
        "evidence": [evidence_ref, pair_ref], "uncertainty": sorted(set(uncertainty)),
        "events": events,
        "provenance": {"source": "prolog", "detector_version": version, "artifact_hash": artifact_hash},
    }
    normalize_assessment(assessment, event_count=len(events))
    state = _sealed({
        "version": VERSION, "detector_version": version,
        "sequence_id": after.sequence_id, "provider_id": after.provider_id,
        "frame_id": after.uid, "frame_order": after.order,
        "temporal_checkpoint_id": temporal["checkpoint"]["checkpointUid"],
        "previous_state_id": previous_state["state_id"],
        "active_relations": [active[key] for key in sorted(active)],
        "observed_relations": [observed_relations[key] for key in sorted(observed_relations)],
        "motion": current_motion,
        "blocked_history": blocked_history, "seen_input_receipts": sorted(seen_receipts),
        "follow_history": follow_history, "positions": positions,
        "observation_tracks": observation_tracks,
        **attachment_state,
        "visibility": {track["trackUid"]: track["visibility"] for track in current_tracks.values()},
        "entity_ids": sorted(known), "assessment": label,
    })
    return {
        "version": VERSION, "assessment": assessment, "frame": log_frame(after, state),
        "source_pair": {
            "sequence_id": after.sequence_id, "from_frame": before.uid, "to_frame": after.uid,
            "before_hash": content_id("frame-input", dict(before.source_hashes)),
            "after_hash": content_id("frame-input", dict(after.source_hashes)),
        },
        "source_order": before.order, "target_order": after.order,
        "facts": facts, "entity_ids": sorted(known), "checkpoint": state,
        "measurements": {
            "interval": interval, "geometry": geometry_rows, "derivatives": derivative_rows,
            "responses": response_rows, "directionalContacts": contact_rows, "laggedPaths": follow_rows,
            "unsupported": unsupported_measurements,
        },
        "attachment_comparison": {
            "before": previous_state["attachment_snapshot"], "after": snapshot,
            "requires_replay": attachment_state["attachment_requires_replay"],
        },
        "known_absent": known_absent, "complete_predicates": [], "learned_rule_replay": learned,
        "accepted_detectors": registry, "prolog_output": output,
    }


def deduce_sequence(
    frames: Sequence[TemporalFrame], temporal_results: Sequence[Mapping[str, Any]], *,
    config: DetectorConfig | None = None, swipl_executable: str | None = None,
    timeout: float = 30.0, candidate_store: Any = None,
    object_results: Sequence[Mapping[str, Any] | None] | None = None,
    scope_context: Mapping[str, Any] | None = None,
    attachment_contexts: Sequence[Mapping[str, Any] | None] | None = None,
) -> dict[str, Any]:
    """Replay real temporal measurements into arguments for VisualSequenceEventLog.replay."""
    if not frames or len(temporal_results) != len(frames) - 1:
        raise ValidationError("one sealed temporal result is required per adjacent pair")
    if object_results is not None and len(object_results) != len(frames):
        raise ValidationError("object evidence must include source and target results for every frame")
    if attachment_contexts is not None and len(attachment_contexts) != len(frames):
        raise ValidationError("attachment contexts must align with every source/target frame")
    temporal_initial = initial_temporal_state(frames[0])
    baseline = []
    if temporal_results:
        validate_temporal_result(temporal_results[0])
        baseline = [
            _term(record["relation"], *record["subjects"])
            for record in temporal_results[0]["topology"] if not record["prediction"] and record["before"] is True
        ]
    state = initial_event_state(
        frames[0], temporal_state=temporal_initial, baseline_relations=baseline, config=config,
        objects=object_results[0] if object_results is not None else None,
        attachment_context=attachment_contexts[0] if attachment_contexts is not None else None,
    )
    log_frames = [log_frame(frames[0], state, index=0)]
    results = []
    registry = accepted_detectors(config)
    for index, temporal in enumerate(temporal_results):
        from omega_vision.perception.contextual_rules import ContextualRuleStore
        pair_store = (candidate_store.for_temporal_frame(frames[index + 1])
                      if isinstance(candidate_store, ContextualRuleStore) else candidate_store)
        result = deduce_pair_events(
            frames[index], frames[index + 1], temporal, previous_state=state,
            config=config, swipl_executable=swipl_executable, timeout=timeout, candidate_store=pair_store,
            objects=object_results[index + 1] if object_results is not None else None,
            scope_context=scope_context,
            attachment_context=attachment_contexts[index + 1] if attachment_contexts is not None else None,
        )
        state = result["checkpoint"]
        result["frame"]["index"] = index + 1
        log_frames.append(result["frame"])
        registry.update(result["accepted_detectors"])
        results.append(result)
    return {
        "frames": log_frames, "assessments": [result["assessment"] for result in results],
        "pair_results": results, "checkpoint": state, "accepted_detectors": registry,
    }
