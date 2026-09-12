"""Measured induction, frozen held-out replay and explicitly scoped native approval."""
from __future__ import annotations

from copy import deepcopy
import json

from fastapi import HTTPException

from omega_vision.perception._event_journal import atomic_json
from omega_vision.perception.candidate_rules import PromotionGates
from omega_vision.perception.contextual_memory import PROVIDER, recording_context
from omega_vision.perception.contextual_rules import ContextualRuleStore
from omega_vision.perception.event_induction import (
    evaluate_candidate, induce_detector_rules, induce_transition_rules,
)

from .recording_test_memory import native_execution


def _execution():
    from . import recording_test_execution
    return recording_test_execution


def _context(home, reference, frame_id):
    return recording_context(home, _execution()._path(home, *reference.split("/")), frame_id)


def _candidate_summary(store, candidate, evaluation, origin):
    return {
        "id": candidate["candidate_id"], "version": candidate["version"], "kind": candidate["kind"],
        "status": candidate["status"], "rule": candidate["rule"], "scope": candidate["scope"],
        "evaluation": evaluation, "eligible": evaluation["eligible"],
        "origin": origin, "promotedRuleRef": candidate.get("promoted_rule_ref"),
        "evidenceRefs": sorted({ref for item in candidate["evidence"] for ref in item["evidence_refs"]}),
        "automaticPromotion": False,
    }


def _split_independent_examples(examples, sources, training_sources):
    from .video_import_semantics import _overlaps
    held_out, excluded = [], []
    for example in examples:
        if example["partition"] != "held_out":
            continue
        key = (example["source_pair"]["sequence_id"], example["sequence_fingerprint"])
        if key not in sources:
            raise ValueError("Held-out example is missing its recorded source-image provenance")
        if any(_overlaps(sources[key], source) for source in training_sources):
            excluded.append(example)
        else:
            held_out.append(example)
    return held_out, excluded


def update_learning(home, state, completed_index):
    from . import video_import_semantics as semantics
    execution = _execution()
    reference = state["recordings"][completed_index]
    with native_execution(home, "data/" + reference["visualSequenceId"]):
        root, units = semantics._units(state["workspaceId"], "data/" + reference["visualSequenceId"])
        examples, training = semantics._examples(
            root, units, "train" if reference["partition"].startswith("train") else "held_out",
        )
    path = execution._path(home, *execution.ROOT, state["id"], "learning", f"{completed_index:03d}.json")
    atomic_json(path, {"examples": examples, "training": training, "fixturePartition": reference["partition"],
                       "labels": "independent_authored_deduction_without_candidate_store", "oraclesUsed": False})
    all_examples, training_sources, sources = [], [], {}
    for index, recording in enumerate(state["recordings"]):
        if recording["status"] != "completed":
            continue
        stored = execution._path(home, *execution.ROOT, state["id"], "learning", f"{index:03d}.json")
        value = json.loads(stored.read_text(encoding="utf-8"))
        all_examples.extend(value["examples"])
        descriptor = value["training"]
        sources[(descriptor["sequenceId"], descriptor["sequenceFingerprint"])] = descriptor
        if recording["partition"].startswith("train"):
            training_sources.append(descriptor)
    state["learningExamples"] = all_examples
    training_indices = [index for index, item in enumerate(state["recordings"])
                        if item["partition"].startswith("train") and item["status"] == "completed"]
    if not training_indices:
        state["learning"] = {"outcome": "inconclusive", "reason": "No independent training recording was executed.",
                             "automaticPromotion": False}
        return
    origin_index = training_indices[-1]
    origin_record = state["recordings"][origin_index]
    origin = {"visualSequenceId": origin_record["visualSequenceId"], "frameId": str(origin_record["frameCount"] - 1)}
    store = ContextualRuleStore(_context(home, origin["visualSequenceId"], origin["frameId"]))
    train = [example for example in all_examples if example["partition"] == "train"]
    held_out, excluded = _split_independent_examples(all_examples, sources, training_sources)
    if reference["partition"].startswith("train"):
        scope = {"domain": "visual-sequence", "provider_id": PROVIDER}
        generated = [
            *induce_detector_rules(store, train, scope=scope)["candidates"],
            *induce_transition_rules(store, train, scope=scope)["candidates"],
            *induce_transition_rules(store, train, scope=scope, kind="action_effect")["candidates"],
        ]
        semantics._record_training(store, generated, training_sources)
        ids = sorted({item["candidate_id"] for item in generated})
    else:
        # No inducer or threshold fitting is called on validation/final-test observations.
        ids = [item["id"] for item in state["candidates"]]
    summaries = []
    for candidate_id in ids:
        if reference["partition"].startswith("train"):
            result = evaluate_candidate(store, candidate_id, train, gates=PromotionGates(), promote=False)
            evaluation = result["evaluation"]
        else:
            current = [example for example in held_out
                       if example["source_pair"]["sequence_id"] == "data/" + reference["visualSequenceId"]]
            result = evaluate_candidate(store, candidate_id, current, gates=PromotionGates(), promote=False)
            evaluation = result["evaluation"]
        summaries.append(_candidate_summary(store, store.get(candidate_id), evaluation, origin))
    state["candidates"] = summaries
    controls = any("control" in item["partition"] and item["status"] == "completed" for item in state["recordings"])
    eligible = any(item["eligible"] for item in summaries)
    state["learning"] = {
        "outcome": "passed" if eligible and controls and held_out else "inconclusive",
        "candidateCount": len(summaries), "trainingExampleCount": len(train), "heldOutExampleCount": len(held_out),
        "excludedOverlappingHeldOutExamples": len(excluded),
        "controlsExecuted": controls, "thresholdsFrozenBeforeHeldOut": True,
        "automaticPromotion": False, "labelsFromOracles": False,
        "reason": None if eligible and controls and held_out else "Independent measured support/control/held-out gates are not yet all satisfied.",
    }
    if state["observer"] in {"color_band", "portal"}:
        state["limitations"] = sorted(set(state["limitations"] + [
            "Domain-specific color-successor/portal-link rule ASTs are not registered; their native observation hypotheses are not promoted as generic event rules."
        ]))


def approve_candidate(home, state, candidate_id, body):
    execution = _execution()
    item = next((candidate for candidate in state["candidates"] if candidate["id"] == candidate_id), None)
    if item is None:
        raise HTTPException(404, "Candidate does not belong to this run")
    if not state.get("learning", {}).get("controlsExecuted") or not state.get("learning", {}).get("heldOutExampleCount"):
        raise HTTPException(409, "Explicit approval still requires executed independent controls and held-out observations")
    origin = item["origin"]
    original_store = ContextualRuleStore(_context(home, origin["visualSequenceId"], origin["frameId"]))
    candidate = original_store.get(candidate_id)
    activation = body.get("activation", origin)
    if (not isinstance(activation, dict) or set(activation) != {"visualSequenceId", "frameId"}
            or not isinstance(activation["visualSequenceId"], str) or not isinstance(activation["frameId"], str)):
        raise HTTPException(422, "activation requires visualSequenceId and an explicit frameId")
    available = [recording for test in execution._catalog()._index(home) or [] for recording in test["recordings"]
                 if recording["visualSequenceId"] == activation["visualSequenceId"]]
    if not available:
        raise HTTPException(422, "Activation source is not a published recording-test sequence")
    target = _context(home, activation["visualSequenceId"], activation["frameId"])
    if activation != origin and any(example["source_pair"]["sequence_id"] == target.sequence_id
                                   and example["target_order"] >= target.current.order
                                   for example in state.get("learningExamples", [])):
        raise HTTPException(409, "Approval cannot backdate training/held-out knowledge into its own input frames")
    if any(execution._path(home, *moment.directory.relative_to(home).parts,
                           "event_deduction_0", "authored_prolog", "result.json").is_file()
           for moment in target.moments if moment.order > target.current.order):
        raise HTTPException(409, "Activation has already-processed later frames; choose an unprocessed source or a later moment rather than backdating knowledge")
    evaluation = original_store.evaluate(candidate_id, gates=PromotionGates(), manual_approval_by=body["approvedBy"])
    if not evaluation["eligible"]:
        raise HTTPException(409, {"message": "Native promotion gates are not satisfied", "evaluation": evaluation})
    if activation != origin:
        original_store = ContextualRuleStore(target)
        imported = original_store.create(
            candidate["rule"], kind=candidate["kind"], scope=candidate["scope"],
            source="deterministic_induction", inducer_version=candidate["inducer_version"],
            entity_ids=candidate["entity_ids"],
            provenance={"explicitScopedReuse": {"runId": state["id"], "origin": origin, "candidateId": candidate_id},
                        "semanticTraining": [source for proposal in candidate["proposals"]
                                             for source in proposal["provenance"].get("semanticTraining", [])]},
        )
        if imported["candidate_id"] != candidate_id:
            raise ValueError("Scoped candidate reuse changed its semantic identity")
        for evidence in candidate["evidence"]:
            original_store.record_evidence(candidate_id, {
                key: deepcopy(value) for key, value in evidence.items() if key not in {"evidence_id", "evidence_kind"}
            })
    promoted = original_store.promote(candidate_id, gates=PromotionGates(), manual_approval_by=body["approvedBy"])
    return {**_candidate_summary(original_store, promoted, evaluation, activation),
            "originalProposalOrigin": origin, "approvedBy": body["approvedBy"],
            "activation": {**activation, "effectiveAfterFrameOrder": target.current.order}}
