"""Additive parent dispatch over existing, separately authoritative semantic leaves."""
from __future__ import annotations

from pathlib import Path
from typing import Any, Mapping

from fastapi import APIRouter, Response

from omega_vision.inherited_source_overlay import storage_path
from omega_vision.perception._event_journal import ConflictError, ValidationError
from omega_vision.perception.observation_identity import content_hash

FAMILY = "two_frame_x_duction"
VERSION = "two-frame-x-duction-v1"
FIRST_PASS = (
    "parts_extraction_0/python_opencv", "parts_grouping_0/group_regions_prolog",
    "group_acceptance_0/group_acceptance_prolog", "observation_identity_0/content_hash",
)
BRANCHES = {
    "deduction": {
        "leaf": "event_deduction_0/authored_prolog", "dependency": "event_log_0/canonical",
        "category": "deductions", "authority": "supported_deductions",
        "description": "Supported changes from measured observations and eligible earlier memory.",
    },
    "induction": {
        "leaf": "event_induction_0/deterministic", "dependency": "event_induction_0/deterministic",
        "category": "candidate_rules", "authority": "proposals_only",
        "description": "Accumulate independently measured examples into candidate rules; never auto-promote.",
    },
    "abduction": {
        "leaf": "event_abduction_0/deterministic", "dependency": "event_abduction_0/deterministic",
        "category": "hypotheses", "authority": "non_authoritative_hypotheses",
        "description": "Possible grounded explanations from earlier accepted rules; hypotheses are not facts.",
    },
}
router = APIRouter()


def _semantics():
    from . import video_import_semantics
    return video_import_semantics


def is_parent(step: str) -> bool:
    return step in {f"{FAMILY}/{branch}" for branch in BRANCHES}


def target_plan(plan, frame_id: str, output: str):
    """Keep exactly the requested row and its transitive causal dependencies."""
    nodes = {(node.frame_id, node.output): node for node in plan}
    required, pending = set(), [(frame_id, output)]
    while pending:
        key = pending.pop()
        if key in required:
            continue
        if key not in nodes:
            raise ValidationError("Requested row has an unavailable causal dependency")
        required.add(key)
        pending.extend(tuple(value) for value in nodes[key].dependencies)
    return [node for node in plan if (node.frame_id, node.output) in required]


def preflight(unit, step, options=None):
    if not is_parent(step):
        raise ValidationError("Unknown two-frame implementation")
    if options is not None and (not isinstance(options, dict) or set(options) - {"semanticContextRevision"}):
        raise ValidationError("Parent dispatch accepts no rule payloads, paths, or model options")
    semantics = _semantics()
    root, units, index = semantics._context(unit)
    from PIL import Image
    home = semantics._api()._vision_data_root(root)
    for source_unit in units[:index + 1]:
        source = Path(source_unit.get("sourceImage") or source_unit["image"])
        if storage_path(home, *source.relative_to(home).parts) != source:
            raise PermissionError("Parent source was redirected")
        with Image.open(source) as image:
            if "A" in image.getbands() and image.getchannel("A").getextrema() != (255, 255):
                raise ValidationError("Core two-frame leaves do not support unknown/transparent visibility; use the native visibility observer")
    from .video_import_abduction import _preference_revision
    preferences = _preference_revision(unit)
    if preferences["status"] == "nowhere_unsupported":
        raise ValidationError("Two-frame parent dispatch does not support browser-only Nowhere; no parent evidence was saved")
    if index and preferences["status"] != "persistent":
        raise ValidationError("Save explicit persistent Shape/Object memory preferences before two-frame reasoning")
    return preferences.get("preferences")


def runtime_revision(unit: Mapping[str, Any], step: str) -> str:
    semantics = _semantics()
    if not is_parent(step):
        raise ValidationError("Unknown two-frame implementation")
    _, units, index = semantics._context(unit)
    from .video_import_abduction import _preference_revision
    preferences = _preference_revision(unit)
    branch = step.split("/")[1]
    return content_hash({
        "version": VERSION, "implementation": branch, "adapter": content_hash(Path(__file__).read_bytes()),
        "leafRevision": semantics.runtime_revision(unit, BRANCHES[branch]["leaf"]) if unit["frameOrder"] else None,
        "preferences": preferences, "frameId": unit["id"], "frameOrder": unit["frameOrder"],
        "recordedInputs": {
            source["id"]: {kind: content_hash(path.read_bytes())
                           for kind, path in semantics._recording_input_paths(source).items()}
            for source in units[max(0, index - 1):index + 1]
        },
    })


def _frame_reference(unit, frame):
    return {"frameId": unit["id"], "frameUid": frame.uid, "order": frame.order,
            "sourceHashes": dict(frame.source_hashes)}


def run_parent(unit, out_dir, options, implementation):
    semantics = _semantics()
    step = f"{FAMILY}/{implementation}"
    preferences = preflight(unit, step, options)
    expected_revision = runtime_revision(unit, step)
    if options.get("semanticContextRevision", expected_revision) != expected_revision:
        raise ConflictError("Parent context changed; replan the requested row")
    root, units, index = semantics._context(unit)
    home = semantics._api()._vision_data_root(root)
    expected = Path(unit["dir"]).joinpath(FAMILY, implementation)
    if Path(out_dir) != expected:
        raise PermissionError("Parent output must belong to the requested frame and implementation")
    for name in ("result.json", "result.pl", "summary.json"):
        path = expected / name
        if storage_path(home, *path.relative_to(home).parts) != path:
            raise PermissionError("Parent output was redirected")
    current = semantics._frame(units[index])
    branch = BRANCHES[implementation]
    result = {
        "schemaVersion": 1, "version": VERSION, "family": FAMILY, "implementation": implementation,
        "category": branch["category"], "authority": branch["authority"],
        "current": _frame_reference(units[index], current), "pair": None,
        "supportCutoffOrderExclusive": index, "automaticPromotion": False,
        "deductions": [], "candidateRules": [], "hypotheses": [], "evidenceRefs": [],
        "status": "initial_observation" if not index else "completed",
        "reason": "no_predecessor" if not index else None,
    }
    if index:
        previous = semantics._frame(units[index - 1])
        if previous.order + 1 != current.order or previous.sequence_id != current.sequence_id:
            raise ValidationError("Two-frame reasoning requires the validated adjacent predecessor")
        result["pair"] = {"before": _frame_reference(units[index - 1], previous), "after": result["current"]}
        leaf = branch["leaf"]
        payload = semantics._result(units[index], leaf)
        metadata = semantics._json(semantics._artifact(units[index], leaf, "meta.json"))
        leaf_revision = semantics.runtime_revision(units[index], leaf)
        if leaf_revision is not None and metadata.get("options", {}).get("semanticContextRevision") != leaf_revision:
            raise ConflictError("Leaf runtime binding changed; replay its causal dependencies")
        path = semantics._artifact(units[index], leaf)
        reference = "data/" + path.relative_to(home).as_posix()
        result.update(leaf={"composite": leaf, "resultRef": reference, "resultHash": content_hash(payload)},
                      evidenceRefs=[reference])
        if implementation == "deduction":
            if payload.get("frame", {}).get("id") != current.uid:
                raise ConflictError("Deduction belongs to a different observation")
            assessment = payload.get("assessment")
            result["deductions"] = assessment.get("events", []) if isinstance(assessment, dict) else []
            result["assessment"] = assessment
        elif implementation == "induction":
            if payload.get("authority") != "proposals_only" or payload.get("automaticPromotion") is not False:
                raise ValidationError("Induction must remain proposals, not automatic rule promotion")
            if payload.get("training", {}).get("sequenceId") != unit["sequenceId"]:
                raise ConflictError("Induction evidence belongs to another sequence")
            result["candidateRules"] = [{"candidateId": candidate, "authority": "proposal"}
                                        for candidate in payload["candidateIds"]]
            result["exampleIds"] = payload["exampleIds"]
            result["learningScope"] = "causal_prefix_through_current_pair"
            result["promotionRequirement"] = "independent training, controls, held-out evidence and explicit approval"
        else:
            if (payload.get("channel") != "abduced_events" or payload.get("authoritative") is not False
                    or any(item.get("authoritative") is not False for item in payload.get("hypotheses", []))):
                raise ValidationError("Abducted explanations must not be authoritative facts")
            if payload.get("causal", {}).get("frameOrder") != index:
                raise ConflictError("Abduction belongs to a different causal frame")
            result["hypotheses"] = payload["hypotheses"]
            result["outcome"] = payload["outcome"]
        if preflight(unit, step) != preferences or runtime_revision(unit, step) != expected_revision:
            raise ConflictError("Parent memory or rule context changed during publication")
    return semantics._emit(unit, out_dir, result, schema="two_frame_x_duction",
                           summary={"family": FAMILY, "implementation": implementation,
                                    "category": branch["category"], "authority": branch["authority"],
                                    "status": result["status"], "reason": result["reason"]})


def register_transforms(registry, metadata):
    for implementation, branch in BRANCHES.items():
        key = (FAMILY, implementation)
        def run(unit, out_dir, options, implementation=implementation):
            return run_parent(unit, out_dir, options, implementation)
        registry[key] = run
        metadata[key] = {
            "dependsOn": [branch["dependency"]], "firstFrameDependsOn": list(FIRST_PASS),
            "orderedOnly": True, "skipFirstFrame": False, "type": "py_pl", "priority": 120,
            "family": FAMILY, "implementation": implementation, "resultCategory": branch["category"],
            "leafComposite": branch["leaf"], "label": implementation.capitalize(),
            "description": branch["description"], "options": {},
        }


@router.get("/stage-families")
def stage_families(response: Response):
    response.headers["Cache-Control"] = "no-store"
    registry = _semantics()._api()._SEQUENCE_TRANSFORMS
    return {"families": [{
        "id": FAMILY, "label": "Two-frame x-duction", "after": "first_pass",
        "firstPass": list(FIRST_PASS), "pairPolicy": "current_frame_and_validated_predecessor",
        "firstFrame": {"status": "initial_observation", "reason": "no_predecessor"},
        "implementations": [
            {"id": name, "composite": f"{FAMILY}/{name}", "leafComposite": branch["leaf"],
             "category": branch["category"], "authority": branch["authority"],
             "description": branch["description"], "available": callable(registry.get((FAMILY, name)))}
            for name, branch in BRANCHES.items()
        ],
        "memoryPolicy": "explicit_persistent_preferences_or_confirmed_native_execution",
        "visibilityPolicy": "fully_observed_viewports_only",
        "automaticPromotion": False,
    }]}
