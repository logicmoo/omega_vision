"""Integrity envelope for frozen object-tracking results.

Producer: use infer_objects_with_evidence(...) or seal_object_result on the
actual in-process infer_objects return before publishing its artifact.
Consumer: validate_object_result; never seal editable/unsealed input merely to
make it acceptable. Existing unsealed artifacts remain unverified and unchanged.

The envelope covers top-level attachment evidence, including bootstrap links
outside any composed object. It is a content-integrity seal, not authentication
or an assertion that extraction facts are complete. For an externally anchored
artifact, pass expected_evidence_uid from its trusted manifest/reference.
"""
from __future__ import annotations

import json
import math
import re
from typing import Any, Iterable, Mapping

from omega_vision.perception.object_tracking import VERSION as OBJECT_VERSION, infer_objects
from omega_vision.perception.temporal_correspondence import (
    TemporalFrame, canonical_json, stable_id, validate_checkpoint,
)


VERSION = "object-evidence-v1"


def _stable_groups(value: Any) -> list[str]:
    if not isinstance(value, list) or not all(
        isinstance(uid, str) and uid and not re.fullmatch(r"[rvwgo]\d+", uid) for uid in value
    ):
        raise ValueError("object attachment evidence requires stable final-G observation IDs")
    if len(value) != len(set(value)):
        raise ValueError("object evidence repeats a group within one relation/component")
    return value


def _validate_payload(result: Mapping[str, Any], group_uids: Iterable[str] | None = None) -> None:
    if result.get("schemaVersion") != 1 or result.get("version") != OBJECT_VERSION:
        raise ValueError("unsupported object result version")
    if not isinstance(result.get("checkpoint"), Mapping):
        raise ValueError("object result requires its sealed checkpoint")
    checkpoint = result["checkpoint"]
    validate_checkpoint(checkpoint)
    if checkpoint.get("version") != OBJECT_VERSION or checkpoint.get("schemaVersion") != 1:
        raise ValueError("object checkpoint version disagrees with result")
    for key in ("frameUid", "objects", "ruleHashes"):
        if key not in result or result[key] != checkpoint.get(key):
            raise ValueError(f"object result {key} disagrees with its checkpoint")
    if not isinstance(result["frameUid"], str) or not result["frameUid"]:
        raise ValueError("object result requires a frame UID")
    if not isinstance(result["objects"], list) or not all(isinstance(obj, dict) for obj in result["objects"]):
        raise ValueError("object results must contain typed objects")
    if not isinstance(result["ruleHashes"], dict) or not result["ruleHashes"]:
        raise ValueError("object result requires authored rule hashes")
    if result.get("assessment") not in {"initial_observation", "object_composition"}:
        raise ValueError("object result has an unknown assessment")
    evidence = result.get("compositionEvidence")
    if not isinstance(evidence, dict) or not isinstance(evidence.get("attachments"), list) or not isinstance(evidence.get("components"), list):
        raise ValueError("object result requires typed composition and attachment evidence")
    known = None if group_uids is None else set(_stable_groups(list(group_uids)))
    for component in evidence["components"]:
        members = _stable_groups(component)
        if len(members) < 2 or known is not None and set(members) - known:
            raise ValueError("object component references invalid or unknown final groups")
    for edge in evidence["attachments"]:
        if not isinstance(edge, dict):
            raise ValueError("object attachments must be typed relations")
        members = _stable_groups(edge.get("groups"))
        if len(members) != 2 or known is not None and set(members) - known:
            raise ValueError("object attachment references invalid or unknown final groups")
        witness = edge.get("witness")
        if not isinstance(witness, dict) or witness.get("kind") not in {"strong_edge", "smooth_cutout", "shared_smooth_cutout"}:
            raise ValueError("object attachment requires an authored witness kind")
        regions = witness.get("regions")
        if not isinstance(regions, list) or len(regions) != 2 or not all(isinstance(region, str) and region for region in regions):
            raise ValueError("object attachment witness requires its two source regions")
        if witness["kind"] == "strong_edge":
            pixels = witness.get("sharedPixels")
            if type(pixels) not in {int, float} or not math.isfinite(pixels) or pixels < 0:
                raise ValueError("strong-edge witness requires finite measured shared pixels")
        if witness["kind"] == "shared_smooth_cutout" and not isinstance(witness.get("background"), str):
            raise ValueError("shared-cutout witness requires its background region")
    occlusions = result.get("occlusions")
    history = checkpoint.get("occlusionHistory")
    if not isinstance(occlusions, list) or not isinstance(history, list):
        raise ValueError("object result requires typed occlusion evidence/history")
    if occlusions and history[-len(occlusions):] != occlusions:
        raise ValueError("current object occlusions disagree with checkpoint history")


def seal_object_result(result: Mapping[str, Any]) -> dict[str, Any]:
    """Seal producer output without mutating it or changing its checkpoint."""
    if not isinstance(result, Mapping):
        raise ValueError("object result must be a mapping")
    copied = json.loads(canonical_json(dict(result)))
    if "evidenceUid" in copied:
        validate_object_result(copied)
        return copied
    if copied.get("evidenceVersion", VERSION) != VERSION:
        raise ValueError("unsupported object evidence version")
    _validate_payload(copied)
    payload = {**copied, "evidenceVersion": VERSION}
    return {**payload, "evidenceUid": stable_id("object-evidence", payload)}


def validate_object_result(
    result: Mapping[str, Any], *,
    expected_evidence_uid: str | None = None,
    expected_frame_uid: str | None = None,
    expected_temporal_checkpoint_uid: str | None = None,
    group_uids: Iterable[str] | None = None,
) -> None:
    """Validate the full evidence seal and optional consumer-owned identity anchors."""
    if not isinstance(result, Mapping) or result.get("evidenceVersion") != VERSION:
        raise ValueError("object evidence is unsealed or has an unsupported version")
    payload = {key: value for key, value in result.items() if key != "evidenceUid"}
    if result.get("evidenceUid") != stable_id("object-evidence", payload):
        raise ValueError("object evidence content hash mismatch")
    if expected_evidence_uid is not None and result["evidenceUid"] != expected_evidence_uid:
        raise ValueError("object evidence does not match its trusted reference")
    _validate_payload(result, group_uids)
    if expected_frame_uid is not None and result["frameUid"] != expected_frame_uid:
        raise ValueError("object evidence belongs to another frame")
    if (expected_temporal_checkpoint_uid is not None
            and result["checkpoint"]["temporalCheckpointUid"] != expected_temporal_checkpoint_uid):
        raise ValueError("object evidence belongs to another temporal checkpoint")


def infer_objects_with_evidence(
    frame: TemporalFrame, *,
    temporal: Mapping[str, Any] | None = None,
    previous_state: Mapping[str, Any] | None = None,
    swipl_executable: str | None = None,
    motion_tolerance: float = 0.5,
) -> dict[str, Any]:
    """Drop-in producer wrapper; CV/composition remain in the existing core."""
    result = infer_objects(
        frame, temporal=temporal, previous_state=previous_state,
        swipl_executable=swipl_executable, motion_tolerance=motion_tolerance,
    )
    sealed = seal_object_result(result)
    validate_object_result(sealed, expected_frame_uid=frame.uid, group_uids=[group.uid for group in frame.groups])
    return sealed
