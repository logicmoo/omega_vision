"""Source-only observer hooks executed as a registered transform with native STM."""
from __future__ import annotations

from dataclasses import asdict, dataclass
from io import BytesIO
import math
from typing import Any, Callable

from PIL import Image

from omega_vision.evaluation.visual_memory_baselines import (
    ColorBandMemory, SpotlightMemory, SuccessorEvidence, observe_color_band,
)
from omega_vision.evaluation.action_mechanism_recordings import (
    ObservedActor, ObservedGate, PortalAssociationMemory, PortalEvidence, _portal_pixels,
)
from omega_vision.perception.observation_identity import content_hash
from omega_vision.perception.hidden_motion_observer import (
    HiddenMotionIntegrityError, observe_hidden_motion, validate_portal_history,
)

from .recording_test_memory import ObservationMemory, _BINDING

STEP = "visual_memory_observation_0/native_stm"
VERSION = "recording-test-observers-v2"


@dataclass(frozen=True)
class ObservationInput:
    png: bytes
    previous_png: bytes | None
    action: str | None
    action_data: dict[str, Any]
    at_seconds: float
    source_ref: dict[str, Any]
    learn: bool


def _color(frame: ObservationInput, prior: dict[str, Any]) -> dict[str, Any]:
    memory = ColorBandMemory()
    memory._evidence = {SuccessorEvidence(
        item["before_hash"], item["after_hash"], tuple(item["point"]), item["step"], item["band_size"],
    ) for item in prior.get("colorEvidence", [])}
    predictions = []
    if frame.previous_png is not None and frame.action == "CLICK":
        earlier_evidence = sorted(memory.evidence, key=lambda item: (item.before_hash, item.after_hash, item.point))
        prediction = memory.predict(frame.previous_png, frame.action, frame.action_data)
        assessment = memory.observe(prediction, frame.png, learn=frame.learn)
        predictions.append({
            "kind": "conditional_color_prediction", "predictedBeforeObservation": True,
            "hitTarget": prediction.hit_target, "expectedColor": prediction.expected_color,
            "observedColor": assessment.observed_color, "assessment": assessment.status,
            "learnedStep": prediction.learned_step,
            "priorEvidence": [asdict(item) for item in earlier_evidence],
        })
    current = observe_color_band(frame.png)
    return {
        "state": {"colorEvidence": [asdict(item) for item in sorted(memory.evidence,
                   key=lambda item: (item.before_hash, item.after_hash, item.point, item.step))]},
        "observed": [{"kind": "visible_color_band", "targetColor": current.target.color,
                      "targetBounds": current.target.bounds, "orderedColors": current.colors}],
        "predictions": predictions, "hypotheses": [],
        "limitations": ["Constrained rectangular target/right-side ordered-band layout, not general semantic color induction."],
    }


def _spotlight(frame: ObservationInput, prior: dict[str, Any]) -> dict[str, Any]:
    memory = SpotlightMemory()
    if prior.get("spotlight"):
        value = prior["spotlight"]
        memory._image = Image.frombytes("RGBA", tuple(value["size"]), bytes.fromhex(value["rgbaHex"]))
    added = memory.observe(frame.png)
    image = memory.image()
    with Image.open(BytesIO(frame.png)) as current:
        visible = current.getchannel("A").tobytes().count(255)
    return {
        "state": {"spotlight": {"size": list(image.size), "rgbaHex": image.tobytes().hex()}},
        "observed": [{"kind": "visibility_union", "newKnownPixels": added, "knownPixels": memory.known_count,
                      "observedPixels": visible, "unknownPixels": memory.unknown_count,
                      "complete": memory.unknown_count == 0}],
        "predictions": [], "hypotheses": [],
        "limitations": ["Static scene/fixed camera; visibility changes are not object appearance or destruction."],
    }


def _portal_restore(prior: dict[str, Any]) -> PortalAssociationMemory:
    memory = PortalAssociationMemory()
    value = prior.get("portal", {})
    for item in value.get("gates", []):
        gate = ObservedGate(tuple(item["signature"]), tuple(item["center"]))
        memory.gates[gate.signature] = gate
    for item in value.get("evidence", []):
        memory.evidence.add(PortalEvidence(
            tuple(item["source_signature"]), tuple(item["destination_signature"]), item["direction"],
            tuple(item["arrival_offset"]), item["before_hash"], item["after_hash"],
            item["elapsed_seconds"], item["before_seconds"], item["after_seconds"],
            tuple(item["constant_velocity_projection"]) if item["constant_velocity_projection"] else None,
        ))
    actor = value.get("lastActor")
    if actor:
        memory.last_actor = ObservedActor(tuple(actor["signature"]), tuple(actor["center"]))
    memory.last_hash = value.get("lastHash")
    memory.last_time = value.get("lastTime")
    memory.last_observation_time = value.get("lastObservationTime")
    memory.velocity = tuple(value["velocity"]) if value.get("velocity") is not None else None
    return memory


def _portal(frame: ObservationInput, prior: dict[str, Any]) -> dict[str, Any]:
    memory = _portal_restore(prior)
    prediction = memory.predict(frame.previous_png, frame.action) if frame.previous_png is not None else None
    projection = None
    previous_time = memory.last_time
    previous_actor = memory.last_actor
    if memory.last_actor and memory.velocity is not None:
        elapsed = frame.at_seconds - memory.last_time
        projection = [memory.last_actor.center[axis] + memory.velocity[axis] * elapsed for axis in (0, 1)]
    prior_evidence = sorted(memory.evidence, key=lambda item: (item.after_seconds, item.after_hash))
    # Episodic associations are retained at their observation time; no threshold is tuned.
    association = memory.observe(frame.png, frame.at_seconds, learn=True)
    gates, actor = _portal_pixels(frame.png)
    predictions, hypotheses = [], []
    pending = prior.get("pendingPortalPrediction")
    if prediction:
        pending = {
            "kind": "conditional_portal_destination", "expectedCenter": list(prediction.expected_arrival_center),
            "decisionSeconds": frame.at_seconds, "predictionObservationSeconds": prior["portal"]["lastObservationTime"],
            "evidence": [asdict(item) for item in sorted(prediction.evidence, key=lambda item: item.after_seconds)],
            "status": "pending", "authoritative": False,
        }
        predictions.append(pending)
    if pending and association and pending["status"] == "pending":
        pending = {**pending, "status": "correct" if list(actor.center) == pending["expectedCenter"] else "incorrect",
                   "observedAtSeconds": frame.at_seconds, "observedCenter": list(actor.center)}
        predictions.append(pending)
    expected_distance = math.dist(previous_actor.center, projection) if projection is not None else None
    observed_distance = math.dist(previous_actor.center, actor.center) if previous_actor and actor else None
    mismatch = bool(actor and previous_actor and actor.signature == previous_actor.signature
                    and expected_distance is not None and observed_distance > expected_distance + 1e-6)
    observed = [{"kind": "line_gate_observation", "gates": [asdict(gate) for gate in gates],
                 "actor": asdict(actor) if actor else None, "partialOrMissingIsUnknown": actor is None}]
    if mismatch:
        observed.append({
            "kind": "constant_speed_model_mismatch", "projectedCenter": projection,
            "observedCenter": list(actor.center), "lastObservedSeconds": previous_time,
            "decisionSeconds": frame.at_seconds, "sourceEvidence": frame.source_ref,
            "expectedTravelDistance": expected_distance, "observedTravelDistance": observed_distance,
        })
        hypotheses = [
            {"explanation": "unseen acceleration or fast motion", "status": "unresolved", "authoritative": False},
            {"explanation": "teleportation", "status": "supported_association" if association and prior_evidence else "unresolved",
             "authoritative": False, "earlierAssociationEvidence": [asdict(item) for item in prior_evidence]},
            {"explanation": "identity mismatch or another unobserved cause", "status": "unresolved", "authoritative": False},
        ]
    elif prior.get("hypotheses"):
        hypotheses = prior["hypotheses"]
    value = {
        "gates": [asdict(memory.gates[key]) for key in sorted(memory.gates)],
        "evidence": [asdict(item) for item in sorted(memory.evidence, key=lambda item: (item.after_seconds, item.after_hash))],
        "lastActor": asdict(memory.last_actor) if memory.last_actor else None,
        "lastHash": memory.last_hash, "lastTime": memory.last_time,
        "lastObservationTime": memory.last_observation_time, "velocity": memory.velocity,
    }
    return {
        "state": {"portal": value, "pendingPortalPrediction": pending, "hypotheses": hypotheses},
        "observed": observed, "predictions": predictions, "hypotheses": hypotheses,
        "limitations": ["A jump or decorative line gates alone never prove teleportation.",
                        "Constrained single full actor/striped-line layout; partial masks remain unknown."],
    }


def _hidden_motion(frame: ObservationInput, prior: dict[str, Any]) -> dict[str, Any]:
    source = {key: frame.source_ref[key] for key in ("frameId", "order", "imageHash", "stateHash")}
    if frame.source_ref["receipt"]["atSeconds"] != frame.at_seconds:
        raise HiddenMotionIntegrityError("Acquisition time disagrees with the verified source receipt")
    result = observe_hidden_motion(
        frame.png, at_seconds=frame.at_seconds, source=source,
        previous_image_hash=content_hash(frame.previous_png) if frame.previous_png is not None else None,
        prior=prior.get("hiddenMotion"),
    )
    return {**result, "state": {"hiddenMotion": result["state"]}}


def _hidden_motion_portal(frame: ObservationInput, prior: dict[str, Any]) -> dict[str, Any]:
    result = _hidden_motion(frame, prior)
    validate_portal_history(prior)
    try:
        association = _portal(frame, prior)
    except ValueError as error:
        # The old association reader deliberately rejects ambiguous full actors.
        # Its unavailable capability must not select an identity for this model.
        result["limitations"].append("Conditional gate association unavailable: " + str(error))
        return result
    result["state"].update(association["state"])
    result["observed"].extend(row for row in association["observed"] if row["kind"] == "line_gate_observation")
    result["predictions"].extend(association["predictions"])
    return result


OBSERVERS: dict[str, Callable[[ObservationInput, dict[str, Any]], dict[str, Any]]] = {
    "color_band": _color, "spotlight": _spotlight, "portal": _portal,
    "hidden_motion": _hidden_motion, "hidden_motion_portal": _hidden_motion_portal,
    "core": lambda frame, prior: {"state": {}, "observed": [], "predictions": [], "hypotheses": [], "limitations": []},
}


def observe(identifier: str, frame: ObservationInput, prior: dict[str, Any]) -> dict[str, Any]:
    """Narrow hook: no test ID, oracle, full recording, filesystem or future-image reader."""
    if identifier not in OBSERVERS:
        raise ValueError("Unsupported observation capability")
    result = OBSERVERS[identifier](frame, prior)
    return {**result, "supported": True}


def run_observation_step(unit, out_dir, options):
    from . import video_import_semantics as semantics
    from omega_vision.inherited_source_overlay import storage_path
    context = semantics._inspection_context(unit["workspaceRoot"], unit["sequenceId"], unit["id"])
    if _BINDING.get() != (context.root, context.sequence_id):
        raise PermissionError("Native observation execution requires an explicit confirmed memory choice")
    request = unit.get("_recordingTestObservation")
    if not isinstance(request, dict):
        raise ValueError("This observer step requires a bound causal recording-test execution")
    memory = ObservationMemory(context)
    previous = memory.previous(
        observer=request["observer"], source_binding=request["sourceBinding"],
        implementation_binding=request["implementationBinding"],
        expected_prefix_hash=request["previousPrefixHash"],
    )
    prior = previous["state"] if previous else request.get("seedState", {})
    source = storage_path(context.root, *unit["sourceImage"].relative_to(context.root).parts)
    if source != unit["sourceImage"]:
        raise PermissionError("Observation source was redirected")
    png = source.read_bytes()
    if content_hash(png) != request["source"]["imageHash"]:
        raise ValueError("Current observation pixels changed after source binding")
    state_path = storage_path(context.root, *source.parent.relative_to(context.root).parts, "state.json")
    if state_path != source.parent / "state.json":
        raise PermissionError("Observation acquisition receipt was redirected")
    if content_hash(state_path.read_bytes()) != request["source"]["stateHash"]:
        raise ValueError("Current observation acquisition changed after source binding")
    previous_png = None
    if context.current.order and request["observer"] != "spotlight":
        earlier = context.moments[context.current.order - 1].directory / "image.png"
        if storage_path(context.root, *earlier.relative_to(context.root).parts) != earlier:
            raise PermissionError("Previous observation source was redirected")
        previous_png = earlier.read_bytes()
        if previous is None or content_hash(previous_png) != previous["source"]["imageHash"]:
            raise ValueError("Previous observation pixels disagree with the native checkpoint")
    receipt = request["receipt"]
    frame = ObservationInput(png, previous_png, receipt["action"], receipt["data"], receipt["atSeconds"],
                             request["source"], request["learn"])
    try:
        result = observe(request["observer"], frame, prior)
    except HiddenMotionIntegrityError:
        raise
    except ValueError as error:
        result = {"state": prior, "observed": [], "predictions": [], "hypotheses": [],
                  "supported": False, "limitations": [str(error)]}
    if request.get("coreAssessment") is not None:
        result["observed"] = [*result["observed"], {
            "kind": "measured_event_deduction", "assessment": request["coreAssessment"],
            "decisionSeconds": receipt["atSeconds"], "evidenceRefs": request.get("coreEvidenceRefs", []),
            "authority": "current_pixel_evidence_and_accepted_detectors_not_future_predictions",
        }]
    result["limitations"] = sorted(set([*result["limitations"], *request.get("coreLimitations", [])]))
    dependencies = [*request.get("seedRefs", []), *request.get("coreEvidenceRefs", [])]
    if previous:
        dependencies.append(previous["entryUid"])
    checkpoint = memory.save(
        observer=request["observer"], source_binding=request["sourceBinding"],
        implementation_binding=request["implementationBinding"], input_prefix_hash=request["inputPrefixHash"],
        source=request["source"], state=result["state"], observed=result["observed"],
        predictions=result["predictions"], hypotheses=result["hypotheses"],
        previous_uid=previous["entryUid"] if previous else None, dependencies=dependencies,
    )
    output = {key: value for key, value in result.items() if key != "state"}
    output.update(nativeCheckpointUid=checkpoint["entryUid"], nativeMemoryRefs=checkpoint["memoryRefs"],
                  source=request["source"], observer=request["observer"], version=VERSION,
                  nativeReadCutoffExclusive=context.current.order,
                  nativeReadReceipts=[{
                      "entryUid": previous["entryUid"], "frameId": previous["causal"]["frameId"],
                      "frameOrder": previous["causal"]["frameOrder"],
                      "memoryRef": "data/" + memory.stm.path.relative_to(context.root).as_posix() + "#" + previous["entryUid"],
                      "inputPrefixHash": previous["inputPrefixHash"],
                      "sourceBinding": previous["sourceBinding"],
                      "implementationBinding": previous["implementationBinding"],
                  }] if previous else [],
                  authority="observations_and_separate_non_authoritative_predictions")
    return semantics._emit(unit, out_dir, output, schema="native_visual_observation",
                           summary={"observationCount": len(result["observed"]),
                                    "nativeCheckpointUid": checkpoint["entryUid"]})


def register_transforms(registry, metadata):
    key = tuple(STEP.split("/"))
    registry[key] = run_observation_step
    metadata[key] = {
        "module": __name__, "orderedOnly": True, "skipFirstFrame": False,
        "dependsOn": [], "firstFrameDependsOn": [], "type": "py_pl", "priority": 85,
        "options": {},
    }
