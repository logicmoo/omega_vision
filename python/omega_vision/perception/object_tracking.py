"""SWI-owned attached/co-moving object composition and immutable checkpoints.

Group-track identities persist final G correspondences; they are not objects.
Only the authored Prolog composition result may create an object identity here.
"""
from __future__ import annotations

import json
import math
from pathlib import Path
import shutil
import subprocess
from typing import Any, Mapping

from omega_vision.perception.observation_identity import _prolog_atom, content_hash
from omega_vision.perception.symbolic_arc import _D4
from omega_vision.perception.temporal_correspondence import (
    TemporalFrame, _seal, canonical_json, frame_to_dict, initial_temporal_state,
    stable_id, validate_checkpoint, validate_temporal_result,
)


VERSION = "object-tracking-v1"
RULES = Path(__file__).resolve().parents[3] / "prolog" / "omega_vision" / "object_tracking.pl"


def _rule_hashes() -> dict[str, str]:
    return {path.name: content_hash(path.read_bytes()) for path in (RULES, RULES.with_name("group_regions.pl"))}


def measure_composition_input(
    frame: TemporalFrame, temporal: Mapping[str, Any] | None, *, motion_tolerance: float = 0.5,
) -> dict[str, Any]:
    """Prepare typed measurements, never a Python object-acceptance decision."""
    if not math.isfinite(motion_tolerance) or motion_tolerance < 0:
        raise ValueError("motion tolerance must be finite and non-negative")
    input_data = {
        **json.loads(canonical_json(frame.region_evidence)), "tolerance": motion_tolerance,
        "groups": [{"uid": group.uid, "members": list(group.member_aliases)} for group in frame.groups],
        "motion": [],
    }
    if temporal is None:
        return input_data
    groups = {group.uid: group for group in frame.groups}
    for match in temporal["matches"]:
        if match.get("reappeared") or match["maskIou"] < 0.99:
            continue
        group = groups[match["toUid"]]
        transforms = match["transforms"]
        # Shape symmetry cannot establish rotation; translation remains measurable.
        transform = "identity" if "identity" in transforms else transforms[0] if len(transforms) == 1 else None
        if transform is None:
            continue
        dx, dy = match["displacement"]
        cx, cy = group.centroid
        old_x, old_y = cx - dx, cy - dy
        tx, ty = dict(_D4)[transform](old_x, old_y)
        input_data["motion"].append({
            "uid": group.uid, "displacement": [dx, dy], "transform": transform, "key": [cx - tx, cy - ty],
        })
    return input_data


def deduce_compositions(
    input_data: Mapping[str, Any], *, swipl_executable: str | None = None, timeout: float = 30,
) -> dict[str, Any]:
    """Execute only repository-authored rules, passing measurements via JSON stdin."""
    executable = swipl_executable or shutil.which("swipl")
    if not executable:
        raise RuntimeError("SWI-Prolog is required for object composition (swipl not on PATH)")
    goal = f"consult({_prolog_atom(str(RULES))}),omega_object_tracking:main"
    try:
        result = subprocess.run(
            [executable, "-q", "-g", goal, "-t", "halt"],
            input=canonical_json(dict(input_data)), capture_output=True, text=True,
            encoding="utf-8", timeout=timeout, check=False,
        )
    except (FileNotFoundError, subprocess.TimeoutExpired) as error:
        raise RuntimeError(f"object composition SWI execution failed: {error}") from error
    if result.returncode:
        raise RuntimeError(f"object composition rules failed: {result.stderr or result.stdout}")
    try:
        output = json.loads(result.stdout)
    except json.JSONDecodeError as error:
        raise RuntimeError(f"invalid object composition result: {result.stdout}") from error
    known = {group["uid"] for group in input_data["groups"]}
    if not isinstance(output.get("components"), list) or not isinstance(output.get("attachments"), list):
        raise RuntimeError("object composition result lacks typed components/attachments")
    for members in output["components"]:
        if not isinstance(members, list) or len(set(members)) < 2 or set(members) - known:
            raise RuntimeError("invalid Prolog composition membership")
    return output


def infer_objects(
    frame: TemporalFrame, *,
    temporal: Mapping[str, Any] | None = None,
    previous_state: Mapping[str, Any] | None = None,
    swipl_executable: str | None = None,
    motion_tolerance: float = 0.5,
) -> dict[str, Any]:
    """Bootstrap or advance persistent objects using a validated adjacent result.

    Returns ``objects``, Prolog ``compositionEvidence``, confirmed aggregate
    ``occlusions`` and a content-addressed ``checkpoint``. Persist that checkpoint
    with temporal_correspondence.persist_checkpoint(..., family="object-checkpoints").
    Missing/occluded/exited members remain distinct from visible G observations.
    """
    if temporal is None and previous_state is not None:
        raise ValueError("an existing object state requires adjacent temporal evidence")
    rules = _rule_hashes()
    implementation_hash = content_hash(Path(__file__).read_bytes())
    if temporal is not None:
        validate_temporal_result(temporal)
        temporal_state = temporal["checkpoint"]
        validate_checkpoint(temporal_state)
        if (temporal["targetFrameUid"], temporal["providerId"], temporal["sequenceId"], temporal["targetOrder"]) != (
            frame.uid, frame.provider_id, frame.sequence_id, frame.order,
        ) or temporal_state["frameHash"] != content_hash(frame_to_dict(frame)):
            raise ValueError("temporal evidence targets a different frame/provider/sequence")
        if temporal["pairUid"] != temporal_state["pairUid"]:
            raise ValueError("temporal pair and checkpoint disagree")
        if previous_state is None:
            raise ValueError("bootstrap objects at the preceding frame before advancing")
        validate_checkpoint(previous_state)
        if (previous_state.get("version") != VERSION or previous_state["ruleHashes"] != rules
                or previous_state["implementationHash"] != implementation_hash):
            raise ValueError("object rules/checkpoint version changed; replay the affected suffix")
        if (previous_state["frameUid"], previous_state["frameOrder"], previous_state["providerId"], previous_state["sequenceId"]) != (
            temporal["sourceFrameUid"], temporal["sourceOrder"], frame.provider_id, frame.sequence_id,
        ) or previous_state["temporalCheckpointUid"] != temporal_state["previousCheckpointUid"]:
            raise ValueError("stale object checkpoint, ordering gap, or temporal fork")
    else:
        temporal_state = initial_temporal_state(frame)
    prepared = measure_composition_input(frame, temporal, motion_tolerance=motion_tolerance)
    deductions = deduce_compositions(prepared, swipl_executable=swipl_executable)
    tracks = {track["trackUid"]: track for track in temporal_state["tracks"]}
    current_tracks = {track["observationUid"]: uid for uid, track in tracks.items() if track["lastObservedOrder"] == frame.order}
    objects = json.loads(canonical_json(previous_state["objects"])) if previous_state else []
    supported = set()
    for component in sorted(deductions["components"]):
        member_tracks = sorted(current_tracks[uid] for uid in component)
        object_uid = stable_id("object", [frame.provider_id, frame.sequence_id, member_tracks])
        supported.add(object_uid)
        existing = next((obj for obj in objects if obj["uid"] == object_uid), None)
        proof = {
            "frameUid": frame.uid, "pairUid": temporal["pairUid"] if temporal else None,
            "memberObservations": component, "ruleHashes": rules,
            "attachments": [edge for edge in deductions["attachments"] if set(edge["groups"]).issubset(component)],
            "motion": [motion for motion in prepared["motion"] if motion["uid"] in component],
            "confidence": min(match["confidence"] for match in temporal["matches"] if match["toUid"] in component),
            "confidenceSource": "minimum_correspondence_confidence_with_authored_attachment",
        }
        if existing is None:
            objects.append({
                "uid": object_uid, "alias": f"o{len(objects) + 1}",
                "memberTrackUids": member_tracks, "firstFrameUid": frame.uid,
                "compositionHistory": [proof], "authority": "authored_prolog_deduction",
            })
        elif proof not in existing["compositionHistory"]:
            existing["compositionHistory"].append(proof)
    attachments = {tuple(sorted(edge["groups"])) for edge in deductions["attachments"]}
    for obj in objects:
        members = []
        for uid in obj["memberTrackUids"]:
            track = tracks.get(uid)
            members.append({
                "trackUid": uid,
                "observationUid": track["observationUid"] if track else None,
                "visibility": track["visibility"] if track else "missing",
                "lastObservedOrder": track["lastObservedOrder"] if track else None,
                "currentObservation": bool(track and track["lastObservedOrder"] == frame.order),
            })
        obj["members"] = members
        obj["confidence"] = obj["compositionHistory"][-1]["confidence"]
        visible_members = [m["observationUid"] for m in members if m["currentObservation"]]
        detached = (
            all(member["visibility"] == "visible" for member in members)
            and len(visible_members) == len(members) and not _connected(visible_members, attachments)
        )
        obj["status"] = (
            "supported" if obj["uid"] in supported else
            "composition_contradicted" if detached else "retained_identity"
        )
        obj["contradictions"] = (
            [{"frameUid": frame.uid, "reason": "visible_members_no_longer_attached", "members": visible_members}]
            if detached else []
        )
    aggregates = aggregate_object_occlusions(objects, temporal["occlusions"] if temporal else [])
    checkpoint = _seal({
        "schemaVersion": 1, "version": VERSION, "providerId": frame.provider_id,
        "sequenceId": frame.sequence_id, "frameUid": frame.uid, "frameOrder": frame.order,
        "previousCheckpointUid": previous_state["checkpointUid"] if previous_state else None,
        "temporalCheckpointUid": temporal_state["checkpointUid"], "ruleHashes": rules,
        "implementationHash": implementation_hash,
        "objects": objects,
        "occlusionHistory": [
            *(previous_state["occlusionHistory"] if previous_state else []),
            *aggregates,
        ],
    })
    return {
        "schemaVersion": 1, "version": VERSION, "frameUid": frame.uid,
        "assessment": "initial_observation" if temporal is None else "object_composition",
        "objects": objects, "compositionEvidence": deductions, "ruleHashes": rules,
        "occlusions": aggregates, "checkpoint": checkpoint,
    }


def _connected(members: list[str], edges: set[tuple[str, str]]) -> bool:
    if not members:
        return False
    seen, queue = set(), [members[0]]
    while queue:
        current = queue.pop()
        if current in seen:
            continue
        seen.add(current)
        queue.extend(other for other in members if tuple(sorted((current, other))) in edges and other not in seen)
    return len(seen) == len(members)


def aggregate_object_occlusions(
    objects: list[dict[str, Any]], group_occlusions: list[dict[str, Any]],
) -> list[dict[str, Any]]:
    """Aggregate only signed-confirmed G evidence, preserving directional order.

    This measures current relations; it never fabricates episode end events.
    """
    by_track: dict[str, list[str]] = {}
    for obj in objects:
        if obj.get("status") == "composition_contradicted":
            continue
        for uid in obj["memberTrackUids"]:
            by_track.setdefault(uid, []).append(obj["uid"])
    grouped: dict[tuple[str, str, str], list[dict[str, Any]]] = {}
    for evidence in group_occlusions:
        if not evidence.get("confirmed") or any(not item["compatible"] for item in evidence.get("depthEvidence", [])):
            continue
        occluders = by_track.get(evidence["occluderTrackUid"], [])
        occluded = by_track.get(evidence["occludedTrackUid"], [])
        # Overlapping candidate object memberships are ambiguity, not permission
        # to manufacture several object-object assertions from one G claim.
        if len(occluders) != 1 or len(occluded) != 1:
            continue
        key = (occluders[0], occluded[0], evidence["pairUid"])
        grouped.setdefault(key, []).append(evidence)
    output = []
    for (occluder, occluded, pair), evidence in sorted(grouped.items()):
        payload = {
            "relation": "self_occlusion" if occluder == occluded else "object_occluded_by",
            "occluderUid": occluder, "occludedUid": occluded, "pairUid": pair,
            "memberEvidence": sorted(evidence, key=canonical_json),
            "confirmation": "confirmed_member_g_evidence",
        }
        output.append({"uid": stable_id("object-occlusion", payload), **payload})
    return output
