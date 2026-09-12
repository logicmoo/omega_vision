"""Observation-window object resolution with explicit, independently bounded STM reads."""
from __future__ import annotations

from copy import deepcopy
from pathlib import Path
from typing import Any

from PIL import Image

from omega_vision.inherited_source_overlay import storage_path
from omega_vision.perception._event_journal import ConflictError, ValidationError
from omega_vision.perception.contextual_memory import ContextualMemory, ContextUnavailable, recording_context
from omega_vision.perception.grouping_learning import shape_anchor
from omega_vision.perception.object_evidence import infer_objects_with_evidence, validate_object_result
from omega_vision.perception.observation_identity import content_hash
from omega_vision.perception.temporal_correspondence import (
    _seal, compare_frames, implementation_hashes, initial_temporal_state, stable_id,
)

VERSION = "recognition-object-resolution-v1"
DOER = "native"
CONTRACTS = {
    "resolve_objects_via_one_frame": {"frameInputCount": 1, "usesSTM": False},
    "resolve_objects_via_two_frames": {"frameInputCount": 2, "usesSTM": False},
    "resolve_objects_via_one_frame_and_stm": {"frameInputCount": 1, "usesSTM": True},
    "resolve_objects_via_two_frames_and_stm": {"frameInputCount": 2, "usesSTM": True},
}
FIRST_PASS = (
    "parts_extraction_0/python_opencv", "parts_grouping_0/group_regions_prolog",
    "group_acceptance_0/group_acceptance_prolog", "observation_identity_0/content_hash",
)


def _services():
    from . import video_import_api, video_import_semantics
    return video_import_api, video_import_semantics


def is_resolver(step: str) -> bool:
    return step in {f"{name}/{DOER}" for name in CONTRACTS}


def _exact(home, path):
    path = Path(path)
    if storage_path(home, *path.relative_to(home).parts) != path:
        raise PermissionError("Object resolver source/output was redirected")
    return path


def execution_context(root, sequence_id, workspace_id):
    """Locate units without fetching any frame pixels, provenance or prior outputs."""
    api, semantics = _services()
    directory = api._sequence_root_for(root, sequence_id)
    home = api._vision_data_root(root)
    _exact(home, directory)
    images = api._resolve_set_images(directory)
    by_directory = {image.parent: image for image in images if image.parent != directory}
    manifest_path = _exact(home, directory / "recording.json")
    ordered = manifest_path.is_file()
    if ordered:
        manifest = semantics._json(manifest_path)
        moves = manifest.get("moves")
        if not isinstance(moves, list):
            raise ValidationError("Ordered object resolution needs the actual move manifest")
        initial = [image for image in images if image.parent == directory]
        ordered_images = list(initial)
        for move in moves:
            reference = move.get("directory") if isinstance(move, dict) else None
            if not isinstance(reference, str) or not reference:
                raise ValidationError("Every move must identify an actual input unit")
            if reference.startswith("data/"):
                pieces = reference[5:].split("/")
                if pieces[:1] == ["omega_vision"]:
                    pieces = pieces[1:]
                target = storage_path(home, *pieces)
            else:
                if "/" in reference or "\\" in reference or reference in {".", ".."}:
                    raise PermissionError("Unsafe ordered input unit")
                target = _exact(home, directory / reference)
            if target.parent != directory or target not in by_directory:
                raise ValidationError("Ordered input does not belong to this sequence")
            ordered_images.append(by_directory[target])
        if len(set(ordered_images)) != len(ordered_images) or set(ordered_images) != set(images):
            raise ValidationError("Move manifest and actual input units disagree")
        images = ordered_images
    if not images:
        raise ValidationError("Visual Sequence has no actual input units")
    sequence_id = api._data_rel_of(root, directory)
    units = []
    for order, image in enumerate(images):
        _exact(home, image)
        unit = api._preprocessing_unit(directory, image)
        _exact(home, unit["dir"])
        units.append({**unit, "workspaceId": workspace_id, "workspaceRoot": root,
                      "sequenceId": sequence_id, "sequenceRoot": directory,
                      "providerId": semantics.OMEGA_PROVIDER_ID,
                      "frameOrder": order, "sequenceOrdered": ordered,
                      "frameSourceKey": image.relative_to(directory).as_posix(), "sourceProvenance": {}})
    return directory, units, {
        "frame_ids_in_order": [unit["id"] for unit in units],
        "frame_id_set": {unit["id"] for unit in units},
        "frame_dirs": {unit["id"]: unit["dir"].relative_to(directory).as_posix() for unit in units},
        "ordered": ordered, "sequenceSource": {},
    }


def _context(unit, step):
    if not is_resolver(step):
        raise ValidationError("Unknown object-resolution input contract")
    api, _ = _services()
    root = api._workspace_root(unit["workspaceId"])
    directory, units, catalog = execution_context(root, unit["sequenceId"], unit["workspaceId"])
    matches = [item for item in units if item["id"] == unit["id"]]
    if len(matches) != 1:
        raise ValidationError("Object resolver requires the row's actual unit ID")
    current = matches[0]
    if (Path(unit["dir"]) != current["dir"] or unit.get("frameOrder") != current["frameOrder"]
            or unit.get("sequenceOrdered") != current["sequenceOrdered"]):
        raise ValidationError("Object resolver unit/order changed; reload the row")
    contract = CONTRACTS[step.split("/")[0]]
    if contract["frameInputCount"] == 2 and not catalog["ordered"]:
        raise ValidationError("Two-frame object resolution requires explicit predecessor ordering")
    index = current["frameOrder"]
    inputs = units[max(0, index - contract["frameInputCount"] + 1):index + 1]
    return api._vision_data_root(root), directory, current, inputs, contract


def _saved_policy(unit):
    """Read configuration only, without resolving defaults or any learned memory."""
    from omega_vision.perception.memory_locations import AuthorizedMemoryRoot, MemoryContext, MemoryLocations
    api, semantics = _services()
    home = api._vision_data_root(Path(unit["workspaceRoot"]))
    directory = Path(unit["sequenceRoot"])
    manifest_path = _exact(home, directory / "recording.json")
    manifest = semantics._json(manifest_path) if manifest_path.is_file() else {}
    game, level = manifest.get("game_id"), manifest.get("level")
    if directory.relative_to(home).parts[:1] == ("recordings",) and isinstance(manifest.get("moves"), list):
        if unit["id"] == "image":
            state = semantics._json(_exact(home, unit["image"].parent / "state.json"))
            level = state.get("level")
        else:
            current_moves = [move for move in manifest["moves"] if isinstance(move, dict)
                             and isinstance(move.get("directory"), str)
                             and move["directory"].replace("\\", "/").rsplit("/", 1)[-1] == unit["id"]]
            if len(current_moves) != 1:
                raise ValidationError("Current row has no unambiguous memory policy level")
            level = current_moves[0].get("level")
    provenance_path = _exact(home, api._image_provenance_path(unit["image"]))
    if not manifest and provenance_path.is_file():
        provenance = semantics._json(provenance_path)
        if provenance.get("operation") == "import_arc_playback_frame":
            raise ContextUnavailable("unavailable_scoped_policy",
                                     "Imported recording aliases require explicit scoped policy metadata; this callable will not inspect other frames to infer it")
    context = MemoryContext(
        provider_ref=semantics.OMEGA_PROVIDER_ID, workspace_id=semantics.OMEGA_STORAGE_ID,
        game_id=str(game) if game is not None else None,
        level_id=str(level) if level is not None and game is not None else None,
        run_id=unit["sequenceId"],
    )
    locations = MemoryLocations([AuthorizedMemoryRoot(
        semantics.OMEGA_PROVIDER_ID, semantics.OMEGA_STORAGE_ID, home, "Omega Vision Shared",
        readable=True, writable=True,
    )])
    _, path = locations._preference_path(context)
    if not path.is_file():
        return None
    value = semantics._json(path)
    locations._validate_preferences(value)
    if value.get("revision") != content_hash({key: item for key, item in value.items() if key != "revision"}):
        raise ValidationError("Memory preference revision mismatch")
    return value


def preflight(unit, step, options=None):
    if options is not None and (not isinstance(options, dict) or set(options) - {"semanticContextRevision"}):
        raise ValidationError("Object read scope is fixed by its callable; arbitrary memory paths/options are forbidden")
    home, _, current, inputs, contract = _context(unit, step)
    policy = _saved_policy(current)
    if policy and any(policy[kind]["saveTo"] == "memory-nowhere" for kind in ("shape", "object")):
        raise ValidationError("This output-producing resolver does not support Nowhere; no object payload was saved")
    for item in inputs:
        with Image.open(_exact(home, item["image"])) as image:
            if "A" in image.getbands() and image.getchannel("A").getextrema() != (255, 255):
                raise ValidationError("Object resolution cannot turn unknown/transparent pixels into object facts")
    return contract


def validate_plan(plan, units, step):
    contract = CONTRACTS[step.split("/")[0]]
    indices = {unit["id"]: unit["frameOrder"] for unit in units}
    roots = [node for node in plan if node.output == step]
    allowed = {node.frame_id for node in roots}
    if contract["frameInputCount"] == 2:
        for node in roots:
            index = indices[node.frame_id]
            if index:
                allowed.add(units[index - 1]["id"])
    if any(node.frame_id not in allowed or node.output not in {*FIRST_PASS, step} for node in plan):
        raise ValidationError("Resolver dependencies violate the requested observation/STM input contract")


def _memory_snapshot(home, directory, current, contract):
    if not contract["usesSTM"]:
        return {"status": "not_read", "records": {}, "receipts": [], "limitations": []}
    if not current["frameOrder"]:
        return {"status": "empty_initial", "records": {}, "receipts": [], "limitations": []}
    context = recording_context(home, directory, current["id"])
    if context.current.order != current["frameOrder"]:
        raise ValidationError("STM publication order disagrees with the actual input order")
    memory = ContextualMemory(home, current["workspaceId"])
    records, receipts, missing = {}, [], []
    for kind in ("shape", "object"):
        try:
            selected, _ = memory.read(context.stm_area(), kind, context, before=current["frameOrder"])
        except ContextUnavailable as error:
            if error.code != "missing_database":
                raise
            records[kind] = []
            missing.append(f"No saved {kind} database exists in the explicit recording-level STM.")
            continue
        accepted = []
        for record in selected:
            published = record["causal"]["frameOrder"]
            payload = record["payload"]
            if kind == "object":
                orders = [member.get("lastObservedOrder") for member in payload.get("members", [])]
                if any(type(order) is not int or not 0 <= order <= published for order in orders):
                    raise ValidationError("STM object contains observations beyond its declared publication cutoff")
            accepted.append(record)
            receipts.append({
                "recordUid": record["recordUid"], "conceptUid": record["conceptUid"],
                "revision": record["revision"], "kind": kind, "causal": record["causal"],
                "entryUid": record["originalSource"]["entryUid"],
                "sourceRef": "data/" + Path(record["originalSource"]["path"]).relative_to(home).as_posix(),
            })
        records[kind] = accepted
    return {"status": "partial" if missing else "available", "records": records,
            "receipts": sorted(receipts, key=lambda item: item["recordUid"]), "limitations": missing}


def runtime_revision(unit, step):
    from omega_vision.perception import (
        contextual_memory, grouping_learning, memory_locations, metta_memory, object_evidence, object_tracking,
    )
    api, semantics = _services()
    home, directory, current, inputs, contract = _context(unit, step)
    memory = _memory_snapshot(home, directory, current, contract)
    policy = _saved_policy(current)
    return content_hash({
        "version": VERSION, "step": step, "contract": contract,
        "code": {module.__name__: content_hash(Path(module.__file__).read_bytes())
                 for module in (object_tracking, object_evidence, grouping_learning, semantics, api,
                                memory_locations, *([contextual_memory, metta_memory] if contract["usesSTM"] else []))},
        "adapter": content_hash(Path(__file__).read_bytes()), "rules": object_tracking._rule_hashes(),
        "frameAdapter": implementation_hashes(),
        "inputs": [{"frameId": item["id"], "order": item["frameOrder"],
                    "imageHash": content_hash(item["image"].read_bytes()),
                    "acquisition": {kind: content_hash(path.read_bytes())
                                    for kind, path in semantics._recording_input_paths(item).items()}}
                   for item in inputs],
        "memory": {"status": memory["status"], "receipts": memory["receipts"]},
        "savePolicy": {kind: policy[kind]["saveTo"] for kind in ("shape", "object")} if policy else None,
    })


def _shape_matches(frame, records):
    anchors = {group.uid: shape_anchor(group, provider_id=frame.provider_id)
               for group in frame.groups if group.points}
    matches = []
    for observation, anchor in anchors.items():
        for record in records:
            saved = record["payload"]
            if saved.get("kind") != "shape_point_anchor" or saved.get("providerId") != frame.provider_id:
                continue
            if stable_id("shape-anchor", {key: value for key, value in saved.items() if key != "uid"}) != saved.get("uid"):
                raise ValidationError("Stored Shape anchor does not match its immutable native identity")
            if saved.get("shapeKey") == anchor["shapeKey"]:
                matches.append({"observationUid": observation, "shapeUid": anchor["uid"],
                                "recordUid": record["recordUid"], "conceptUid": record["conceptUid"],
                                "relation": "same_normalized_shape", "identityConfirmed": False})
    return anchors, matches


def _object_candidates(shape_matches, records):
    matched = {}
    for row in shape_matches:
        matched.setdefault(row["recordUid"], set()).add(row["observationUid"])
    candidates = []
    for record in records:
        obj = record["payload"]
        member_matches = []
        for reference in obj.get("shapeReferences", []):
            observations = sorted(matched.get(reference.get("recordUid"), ()))
            if observations:
                member_matches.append({"memberTrackUid": reference.get("memberTrackUid"),
                                       "observations": observations})
        if member_matches:
            candidates.append({"objectUid": obj["uid"], "recordUid": record["recordUid"],
                               "members": member_matches, "identityConfirmed": False,
                               "status": "appearance_candidate_not_identity"})
    return candidates


def _seed_from_objects(before, initial, bootstrap, records):
    """Keep fresh observed geometry; import only independently anchored native identities."""
    from omega_vision.perception.object_tracking import _rule_hashes
    known = {group.uid for group in before.groups}
    eligible = {}
    for record in records:
        obj = record["payload"]
        members = obj.get("members", [])
        if (not members or record["causal"]["frameOrder"] != before.order
                or any(member.get("observationUid") not in known or member.get("lastObservedOrder") != before.order
                       or member.get("currentObservation") is not True for member in members)):
            continue
        if obj.get("uid") != stable_id("object", [before.provider_id, before.sequence_id, sorted(obj["memberTrackUids"])]):
            raise ValidationError("Stored Object identity disagrees with its native member tracks")
        if not obj.get("compositionHistory") or obj["compositionHistory"][-1].get("ruleHashes") != _rule_hashes():
            continue
        existing = eligible.get(obj["uid"])
        if existing and existing["payload"] != obj:
            raise ValidationError("Conflicting same-frame native Object versions cannot choose an identity")
        eligible[obj["uid"]] = record
    observations, reverse = {}, {}
    for record in eligible.values():
        for member in record["payload"]["members"]:
            group, track = member["observationUid"], member["trackUid"]
            if group in observations and observations[group] != track or track in reverse and reverse[track] != group:
                raise ValidationError("Ambiguous native member identity binding")
            observations[group], reverse[track] = track, group
    temporal = deepcopy(initial)
    temporal.pop("checkpointUid")
    for track in temporal["tracks"]:
        track["trackUid"] = observations.get(track["observationUid"], track["trackUid"])
    temporal = _seal(temporal)
    objects = deepcopy(bootstrap["checkpoint"])
    objects.pop("checkpointUid")
    objects.update(temporalCheckpointUid=temporal["checkpointUid"],
                   objects=[deepcopy(record["payload"]) for _, record in sorted(eligible.items())])
    return temporal, _seal(objects), sorted(record["recordUid"] for record in eligible.values())


def resolve_observations(frames, contract, records):
    if (not frames or len(frames) > contract["frameInputCount"]
            or len(frames) == 1 and contract["frameInputCount"] == 2 and frames[0].order != 0):
        raise ValidationError("Observed inputs do not satisfy the declared frame window")
    if not contract["usesSTM"] and any(records.values()):
        raise ValidationError("Non-STM inference cannot receive memory records")
    frame = frames[-1]
    anchors, shape_matches = _shape_matches(frame, records.get("shape", []))
    temporal, seeded = None, []
    if len(frames) == 2:
        before = frames[0]
        bootstrap = infer_objects_with_evidence(before)
        if contract["usesSTM"]:
            initial, object_state, seeded = _seed_from_objects(
                before, initial_temporal_state(before), bootstrap, records.get("object", []))
            temporal = compare_frames(before, frame, previous_state=initial)
        else:
            object_state = bootstrap["checkpoint"]
            temporal = compare_frames(before, frame)
        objects = infer_objects_with_evidence(frame, temporal=temporal, previous_state=object_state)
    else:
        objects = infer_objects_with_evidence(frame)
    validate_object_result(objects)
    return anchors, shape_matches, _object_candidates(shape_matches, records.get("object", [])), temporal, objects, seeded


def run_resolution(unit, out_dir, options, name):
    step = f"{name}/{DOER}"
    preflight(unit, step, options)
    api, semantics = _services()
    home, directory, current, inputs, contract = _context(unit, step)
    expected = current["dir"] / name / DOER
    if Path(out_dir) != expected:
        raise PermissionError("Object output must belong to its actual row and callable")
    for filename in ("result.json", "result.pl", "summary.json"):
        _exact(home, expected / filename)
    revision = runtime_revision(unit, step)
    if options.get("semanticContextRevision", revision) != revision:
        raise ConflictError("Object-resolution inputs changed; confirm a new row plan")
    memory = _memory_snapshot(home, directory, current, contract)
    for item in inputs:
        prepared = semantics._prepare(item)
        with Image.open(prepared["image"]) as image:
            if "A" in image.getbands() and image.getchannel("A").getextrema() != (255, 255):
                raise ValidationError("Effective preprocessing introduced unknown pixels; object resolution is unavailable")
    frames = [semantics._frame(item) if item["sequenceOrdered"]
              else semantics._frame(item, single_observation=True) for item in inputs]
    frame = frames[-1]
    anchors, shape_matches, candidates, temporal, objects, seeded = resolve_observations(frames, contract, memory["records"])
    limitations = [*memory["limitations"],
                  "Shape similarity alone does not establish persistent Object identity.",
                  "Static one-frame authored rules may provide attachment evidence but require observed co-motion to create composed Objects."]
    result = {
        "schemaVersion": 1, "version": VERSION, "callable": step,
        "inputContract": {**contract, "actualFrameInputCount": len(frames),
                          "readsPriorCheckpoint": False, "readsLearnedRules": False,
                          "writesNativeMemory": False, "writesPreferences": False,
                          "sourceOrdered": current["sequenceOrdered"],
                          "singletonComputationOrder": None if current["sequenceOrdered"] else 0},
        "status": "no_predecessor" if contract["frameInputCount"] == 2 and len(frames) == 1 else "completed",
        "frame": {"id": frame.uid, "frameId": current["id"],
                  "order": frame.order if current["sequenceOrdered"] else None},
        "sourceReceipts": [{"frameId": item["id"], "frameUid": observed.uid,
                            "order": observed.order if item["sequenceOrdered"] else None,
                            "computationScope": "ordered_observation" if item["sequenceOrdered"] else "unordered_singleton",
                            "sourceRef": "data/" + item["image"].relative_to(home).as_posix(),
                            "firstPassRefs": ["data/" + semantics._artifact(item, step, "meta.json").relative_to(home).as_posix()
                                              for step in FIRST_PASS],
                            "sourceHashes": dict(observed.source_hashes)}
                           for item, observed in zip(inputs, frames)],
        "memory": {"status": memory["status"], "readScope": "recording_level_stm" if contract["usesSTM"] else "none",
                   "frameCutoffExclusive": current["frameOrder"],
                   "publicationCutoffExclusive": current["frameOrder"],
                   "sourceReceipts": memory["receipts"], "seededObjectRecords": seeded},
        "shapeAnchors": list({anchor["uid"]: anchor for anchor in anchors.values()}.values()),
        "shapeMatches": shape_matches, "objectCandidates": candidates,
        "objectEvidence": objects, "temporalEvidence": temporal,
        "limitations": limitations, "automaticPromotion": False,
    }
    if runtime_revision(unit, step) != revision:
        raise ConflictError("Object inputs or eligible STM changed during resolution")
    return semantics._emit(unit, out_dir, result, schema="scoped_native_object_resolution",
                           summary={"callable": step, "status": result["status"],
                                    **result["inputContract"], "objectCount": len(objects["objects"]),
                                    "shapeCount": len(anchors), "memoryStatus": memory["status"]})


def register_transforms(registry, metadata):
    for name, contract in CONTRACTS.items():
        def run(unit, out_dir, options, name=name):
            return run_resolution(unit, out_dir, options, name)
        registry[(name, DOER)] = run
        dependencies = list(FIRST_PASS)
        if contract["frameInputCount"] == 2:
            dependencies += [f"frame[-1]@{step}" for step in FIRST_PASS]
        metadata[(name, DOER)] = {
            "dependsOn": dependencies, "firstFrameDependsOn": list(FIRST_PASS),
            "orderedOnly": contract["frameInputCount"] == 2, "skipFirstFrame": False,
            "type": "py_pl", "priority": 115, "options": {}, "family": name, "implementation": DOER,
            "label": name.replace("_", " "), "resultCategory": "object_resolution",
            "inputContract": {**contract, "readsPriorCheckpoint": False, "readsLearnedRules": False,
                              "writesNativeMemory": False, "writesPreferences": False},
            "description": "Resolve only the declared observation window and eligible recording STM; preserve unresolved identities.",
        }
