import json
from io import BytesIO
from pathlib import Path

import pytest
from PIL import Image

from omega_vision.perception.contextual_memory import ContextualMemory, recording_context
from omega_vision.perception.contextual_rules import ContextualRuleStore
from omega_vision.perception.grouping_learning import shape_anchor
from omega_vision.perception.metta_memory import MeTTaMemoryDatabase
from omega_vision.perception.object_evidence import validate_object_result
from omega_vision.perception.observation_identity import build_observation_bundle
from omega_vision.perception.temporal_correspondence import temporal_frame_from_bundle
from omega_vision.services import recognition_object_resolution as resolution
from omega_vision.services import video_import_api as api, video_import_semantics as semantics

from test_semantic_active_integration import integrated, sequence, finish
from test_recording_test_execution import fingerprints
from test_two_frame_x_duction import preferences


def request(client, sequence_id, name, frame_id, *, run=True):
    body = {"workspaceId": "w", "sequenceId": sequence_id, "frameId": frame_id,
            "stageId": f"{name}/native"}
    response = client.post("/video-import/semantic/execution/plan", json=body)
    assert response.status_code == 200, response.text
    plan = response.json()
    if not run:
        return plan
    response = client.post("/video-import/semantic/execution/commit", json={
        **body, "confirmed": True, "confirmationKey": plan["confirmationKey"], "run": True,
    })
    assert response.status_code == 200, response.text
    finish(client, response.json())
    return plan


def output(root, sequence_id, frame_id, name):
    _, units, _ = resolution.execution_context(root, sequence_id, "w")
    unit = next(item for item in units if item["id"] == frame_id)
    return json.loads((unit["dir"] / name / "native" / "result.json").read_text())


def first_pass(root, sequence_id, indices):
    _, units, catalog = resolution.execution_context(root, sequence_id, "w")
    for index in indices:
        unit = units[index]
        for stage in resolution.FIRST_PASS:
            spec = api._direct_specs(root)[stage]
            result = api.run_transform_step(
                unit, *stage.split("/"), spec.get("options", {}),
                depends_on=spec.get("dependsOn", []),
                depends_on_resolved=api._stamp_resolved_deps(unit, spec.get("dependsOn", []), catalog),
            )
            assert result["status"] in {"written", "skipped"}, result
    return units


def save_shape(root, sequence_id, frame_index):
    units = first_pass(root, sequence_id, [frame_index])
    frame = semantics._frame(units[frame_index])
    group = next(group for group in frame.groups if group.points)
    home = root / "data" / "omega_vision"
    context = recording_context(home, units[frame_index]["sequenceRoot"], units[frame_index]["id"])
    return ContextualMemory(home, "w").save(context.stm_area(), "shape",
                                            shape_anchor(group, provider_id=frame.provider_id), context=context)


def test_four_distinct_registered_input_contracts_are_discoverable_without_writes(integrated):
    root, client = integrated
    before = fingerprints(root)
    response = client.get("/video-import/transform-composites", params={"workspaceId": "w"})
    assert response.status_code == 200
    rows = {row["transformation"]: row for row in response.json()["composites"]
            if row["transformation"] in resolution.CONTRACTS}
    assert set(rows) == set(resolution.CONTRACTS)
    for name, contract in resolution.CONTRACTS.items():
        row = rows[name]
        assert row["id"] == f"{name}/native"
        assert row["inputContract"]["frameInputCount"] == contract["frameInputCount"]
        assert row["inputContract"]["usesSTM"] is contract["usesSTM"]
        assert not row["inputContract"]["readsPriorCheckpoint"] and not row["inputContract"]["readsLearnedRules"]
        assert row["firstFrameDependsOn"] == list(resolution.FIRST_PASS)
        assert len(row["dependsOn"]) == 4 * contract["frameInputCount"]
    by_id = {row["id"]: row for row in response.json()["composites"]}
    for stage in resolution.FIRST_PASS:
        assert by_id[stage]["inputContract"] == {"frameInputCount": 1, "usesSTM": False}
    for stage in (semantics.TEMPORAL, semantics.INDUCTION, "two_frame_x_duction/induction"):
        assert "inputContract" not in by_id[stage]
    assert fingerprints(root) == before


def test_first_pass_declared_single_frame_contract_never_reads_other_observations_or_stm(integrated, monkeypatch):
    root, _ = integrated
    sequence_id = sequence(root, count=3)
    _, units, _ = resolution.execution_context(root, sequence_id, "w")
    excluded = [unit["dir"] for unit in units[:2]]
    original_bytes, original_text = Path.read_bytes, Path.read_text
    def check(path):
        assert not any(path.is_relative_to(directory) for directory in excluded), "FIRST_PASS read another frame"
        if path.is_relative_to(root):
            assert not any(part.startswith("memory") or part.endswith("_stm") for part in path.parts), "FIRST_PASS read STM"
    def read_bytes(path):
        check(path)
        return original_bytes(path)
    def read_text(path, *args, **kwargs):
        check(path)
        return original_text(path, *args, **kwargs)
    def forbidden(*args, **kwargs):
        pytest.fail("FIRST_PASS cannot read contextual memory")
    monkeypatch.setattr(Path, "read_bytes", read_bytes)
    monkeypatch.setattr(Path, "read_text", read_text)
    monkeypatch.setattr(ContextualMemory, "read", forbidden)
    monkeypatch.setattr(MeTTaMemoryDatabase, "read", forbidden)
    first_pass(root, sequence_id, [2])
    for stage in resolution.FIRST_PASS:
        assert (units[2]["dir"].joinpath(*stage.split("/")) / "meta.json").is_file()


@pytest.mark.parametrize("name", list(resolution.CONTRACTS))
def test_real_row_call_uses_exact_observation_window_and_never_promotes_every_g_to_o(integrated, monkeypatch, name):
    root, client = integrated
    sequence_id = sequence(root, count=4)
    scope = resolution.CONTRACTS[name]
    expected = {"frame_000002"} if scope["frameInputCount"] == 1 else {"frame_000001", "frame_000002"}
    if scope["usesSTM"]:
        save_shape(root, sequence_id, 0)
    before = fingerprints(root)
    monkeypatch.setattr(ContextualRuleStore, "__init__", lambda *a, **k: pytest.fail("No learned rule lookup"))
    if not scope["usesSTM"]:
        monkeypatch.setattr(ContextualMemory, "read", lambda *a, **k: pytest.fail("Non-STM callable read memory"))
    original = semantics._frame
    seen = []
    def observed(unit):
        assert unit["id"] in expected, "Read an observation outside the declared input window"
        seen.append(unit["id"])
        return original(unit)
    monkeypatch.setattr(semantics, "_frame", observed)
    plan = request(client, sequence_id, name, "frame_000002")
    assert set(plan["supportFrameIds"]) == expected
    assert set(seen) == expected
    value = output(root, sequence_id, "frame_000002", name)
    assert value["inputContract"]["actualFrameInputCount"] == scope["frameInputCount"]
    assert value["inputContract"]["usesSTM"] is scope["usesSTM"]
    assert {row["frameId"] for row in value["sourceReceipts"]} == expected
    for receipt in value["sourceReceipts"]:
        assert (root / "data" / "omega_vision" / receipt["sourceRef"].removeprefix("data/")).is_file()
        assert len(receipt["firstPassRefs"]) == 4
        assert all((root / "data" / "omega_vision" / ref.removeprefix("data/")).is_file()
                   for ref in receipt["firstPassRefs"])
    validate_object_result(value["objectEvidence"])
    assert value["objectEvidence"]["objects"] == []
    assert value["shapeAnchors"]
    if scope["usesSTM"]:
        assert value["memory"]["sourceReceipts"] and value["shapeMatches"]
    else:
        assert value["memory"]["status"] == "not_read" and value["memory"]["sourceReceipts"] == []
    assert not list(root.rglob("event_log_0")) and not list(root.rglob("temporal_correspondence_0"))
    assert not list(root.rglob("objects_tracking_0")) and not list(root.rglob("todos.json"))
    assert not list((root / "data" / "omega_vision" / "recordings" / "integration" / "seq" / "frame_000003").rglob("meta.json"))
    assert not (root / "data" / "omega_vision" / "runtime" / "memory-settings").exists()
    after = fingerprints(root)
    assert all(after[path] == values for path, values in before.items())


@pytest.mark.parametrize("name", ["resolve_objects_via_one_frame", "resolve_objects_via_two_frames"])
def test_non_stm_dispatch_does_not_open_other_frame_observations_or_cumulative_outputs(integrated, monkeypatch, name):
    root, client = integrated
    sequence_id = sequence(root, count=5)
    count = resolution.CONTRACTS[name]["frameInputCount"]
    allowed = {"frame_000003"} if count == 1 else {"frame_000002", "frame_000003"}
    directory = root / "data" / "omega_vision" / "recordings" / "integration" / "seq"
    Image.new("RGB", (48, 32), "black").save(directory / "image.png")
    (directory / "state.json").write_text('{"step_count":0,"level":"1","incoming_action":null,"parent_node":null}')
    for index in range(5):
        (directory / f"frame_{index:06}" / "image.provenance.json").write_text(
            '{"originalSize":[48,32],"variantToSource":[1,0,0,0,1,0],"sentinel":"not an inference fact"}')
    read_bytes, read_text, image_open = Path.read_bytes, Path.read_text, Image.open
    def check(path):
        if path.is_relative_to(directory):
            parts = path.relative_to(directory).parts
            assert parts not in {("image.png",), ("state.json",)}, "Fetched the excluded initial observation"
            if parts and parts[0].startswith("frame_"):
                assert parts[0] in allowed, f"Fetched excluded frame data: {path}"
            assert not any(part in {"temporal_correspondence_0", "objects_tracking_0", "event_deduction_0",
                                    "event_log_0", "grouping_rule_induction_0"} for part in parts)
            assert not any(part.startswith("memory") for part in parts), "Read STM while prohibited"
    def guarded_bytes(path):
        check(path)
        return read_bytes(path)
    def guarded_text(path, *args, **kwargs):
        check(path)
        return read_text(path, *args, **kwargs)
    def guarded_image(path, *args, **kwargs):
        if isinstance(path, (str, Path)):
            check(Path(path))
        return image_open(path, *args, **kwargs)
    monkeypatch.setattr(Path, "read_bytes", guarded_bytes)
    monkeypatch.setattr(Path, "read_text", guarded_text)
    monkeypatch.setattr(Image, "open", guarded_image)
    request(client, sequence_id, name, "frame_000003")


@pytest.mark.parametrize("name", ["resolve_objects_via_one_frame", "resolve_objects_via_two_frames"])
def test_initial_image_is_its_own_actual_unit_not_a_self_pair(integrated, monkeypatch, name):
    root, client = integrated
    sequence_id = sequence(root, count=2)
    directory = root / "data" / "omega_vision" / "recordings" / "integration" / "seq"
    Image.new("RGB", (48, 32), "black").save(directory / "image.png")
    (directory / "state.json").write_text('{"step_count":0,"level":"1","incoming_action":null,"parent_node":null}')
    original = semantics._frame
    def observed(unit):
        assert unit["id"] == "image", "Initial observation must not consume a future unit"
        return original(unit)
    monkeypatch.setattr(semantics, "_frame", observed)
    monkeypatch.setattr(ContextualMemory, "read", lambda *a, **k: pytest.fail("Non-STM callable read memory"))
    request(client, sequence_id, name, "image")
    value = output(root, sequence_id, "image", name)
    assert value["frame"]["frameId"] == "image"
    assert [row["frameId"] for row in value["sourceReceipts"]] == ["image"]
    assert value["temporalEvidence"] is None
    assert value["status"] == ("no_predecessor" if resolution.CONTRACTS[name]["frameInputCount"] == 2 else "completed")


def test_unknown_pixels_are_rejected_before_resolver_payload_publication(integrated, monkeypatch):
    root, client = integrated
    sequence_id = sequence(root)
    _, units, _ = resolution.execution_context(root, sequence_id, "w")
    unit = units[1]
    image = Image.new("RGBA", (48, 32), (0, 0, 0, 0))
    image.save(unit["image"])
    name = "resolve_objects_via_one_frame"
    before = fingerprints(root)
    response = client.post("/video-import/semantic/execution/plan", json={
        "workspaceId": "w", "sequenceId": sequence_id, "frameId": unit["id"], "stageId": f"{name}/native",
    })
    assert response.status_code == 400 and "unknown/transparent" in response.text
    assert fingerprints(root) == before
    prepared_path = root / "data" / "omega_vision" / "cache" / "test_alpha" / "image.png"
    prepared_path.parent.mkdir(parents=True)
    image.save(prepared_path)
    Image.new("RGB", (48, 32), "black").save(unit["image"])
    monkeypatch.setattr(semantics, "_prepare", lambda item: {"image": prepared_path})
    destination = unit["dir"] / name / "native"
    with pytest.raises(ValueError, match="Effective preprocessing introduced unknown"):
        resolution.run_resolution(unit, destination, {}, name)
    assert not destination.exists()


@pytest.mark.parametrize("name", ["resolve_objects_via_two_frames", "resolve_objects_via_two_frames_and_stm"])
def test_first_pair_row_explicitly_has_no_predecessor_and_reads_no_stm(integrated, monkeypatch, name):
    root, client = integrated
    sequence_id = sequence(root)
    monkeypatch.setattr(ContextualMemory, "read", lambda *a, **k: pytest.fail("No prior STM at the first frame"))
    request(client, sequence_id, name, "frame_000000")
    value = output(root, sequence_id, "frame_000000", name)
    assert value["status"] == "no_predecessor" and value["temporalEvidence"] is None
    assert len(value["sourceReceipts"]) == 1 and value["inputContract"]["actualFrameInputCount"] == 1


def test_one_frame_can_use_an_unordered_actual_row_but_two_frames_cannot(integrated):
    root, client = integrated
    sequence_id = sequence(root, ordered=False)
    request(client, sequence_id, "resolve_objects_via_one_frame", "frame_000001")
    response = client.post("/video-import/semantic/execution/plan", json={
        "workspaceId": "w", "sequenceId": sequence_id, "frameId": "frame_000001",
        "stageId": "resolve_objects_via_two_frames/native",
    })
    assert response.status_code == 400 and "ordering" in response.text


def test_eligible_stm_only_binds_earlier_publication_and_future_entries_do_not_change_revision(integrated):
    root, client = integrated
    sequence_id = sequence(root, count=5)
    prior = save_shape(root, sequence_id, 0)
    save_shape(root, sequence_id, 3)
    _, units, _ = resolution.execution_context(root, sequence_id, "w")
    step = "resolve_objects_via_one_frame_and_stm/native"
    before = resolution.runtime_revision(units[2], step)
    save_shape(root, sequence_id, 4)
    assert resolution.runtime_revision(units[2], step) == before
    request(client, sequence_id, step.split("/")[0], units[2]["id"])
    value = output(root, sequence_id, units[2]["id"], step.split("/")[0])
    assert {row["recordUid"] for row in value["memory"]["sourceReceipts"]} == {prior["recordUid"]}
    assert all(row["causal"]["frameOrder"] < 2 for row in value["memory"]["sourceReceipts"])


def test_scope_is_not_a_preference_rewrite_and_nowhere_is_rejected_before_outputs(integrated):
    root, client = integrated
    sequence_id = sequence(root)
    preferences(sequence_id)
    locations, context = semantics._memory("w", sequence_id)
    _, path = locations._preference_path(context)
    saved = path.read_bytes()
    request(client, sequence_id, "resolve_objects_via_one_frame", "frame_000001")
    assert path.read_bytes() == saved
    preferences(sequence_id, nowhere=True)
    before = fingerprints(root)
    response = client.post("/video-import/semantic/execution/plan", json={
        "workspaceId": "w", "sequenceId": sequence_id, "frameId": "frame_000001",
        "stageId": "resolve_objects_via_one_frame/native",
    })
    assert response.status_code == 400 and "Nowhere" in response.text
    assert fingerprints(root) == before


def test_fixed_read_contract_ignores_look_in_changes_without_rewriting_them(integrated):
    root, client = integrated
    sequence_id = sequence(root)
    preferences(sequence_id)
    locations, context = semantics._memory("w", sequence_id)
    _, units, _ = resolution.execution_context(root, sequence_id, "w")
    step = "resolve_objects_via_one_frame/native"
    before = resolution.runtime_revision(units[1], step)
    value = locations.load_preferences(context)
    for kind in ("shape", "object"):
        value[kind].update(lookIn=["memory-nowhere"], recentLookIn=[])
    locations.save_preferences(context, value, expected_revision=value["revision"])
    _, path = locations._preference_path(context)
    saved = path.read_bytes()
    assert resolution.runtime_revision(units[1], step) == before
    request(client, sequence_id, step.split("/")[0], units[1]["id"])
    assert path.read_bytes() == saved


def test_non_stm_revisions_ignore_older_observations_and_corrupt_stm(integrated):
    root, _ = integrated
    sequence_id = sequence(root, count=4)
    _, units, _ = resolution.execution_context(root, sequence_id, "w")
    step = "resolve_objects_via_two_frames/native"
    before = resolution.runtime_revision(units[3], step)
    (units[0]["dir"] / "state.json").write_text('{"anything":"older ignored state"}')
    Image.new("RGB", (48, 32), "green").save(units[0]["image"])
    home = root / "data" / "omega_vision"
    context = recording_context(home, units[3]["sequenceRoot"], units[3]["id"])
    db = MeTTaMemoryDatabase(home, context.stm_area(), "shape")
    db.path.parent.mkdir(parents=True)
    db.path.write_text("corrupt memory must never be consulted")
    assert resolution.runtime_revision(units[3], step) == before
    with pytest.raises(ValueError):
        resolution.runtime_revision(units[3], "resolve_objects_via_two_frames_and_stm/native")


def test_single_frame_revision_binds_its_actual_frame_adapter_and_consumer_code(integrated, monkeypatch):
    root, _ = integrated
    sequence_id = sequence(root)
    _, units, _ = resolution.execution_context(root, sequence_id, "w")
    step = "resolve_objects_via_one_frame/native"
    before = resolution.runtime_revision(units[1], step)
    consumer_copy = root / "data" / "omega_vision" / "cache" / "test_consumer_revision.py"
    consumer_copy.parent.mkdir(parents=True)
    source = Path(semantics.__file__).read_bytes()
    consumer_copy.write_bytes(source)
    monkeypatch.setattr(semantics, "__file__", str(consumer_copy))
    assert resolution.runtime_revision(units[1], step) == before
    consumer_copy.write_bytes(source + b"\n# Changed consumer implementation.\n")
    assert resolution.runtime_revision(units[1], step) != before
    consumer_copy.write_bytes(source)
    original = resolution.implementation_hashes()
    monkeypatch.setattr(resolution, "implementation_hashes", lambda: {**original, "frame_adapter_test": "changed"})
    assert resolution.runtime_revision(units[1], step) != before


def attached_observation(sequence_id, order, shift, image_path=None):
    image = Image.new("RGB", (32, 24), "black")
    geometry = {"width": 32, "height": 24, "polygons": {}}
    facts = []
    for index, (color, rgb) in enumerate((("red", (255, 0, 0)), ("blue", (0, 0, 255))), 1):
        x = 2 + shift + (index - 1) * 3
        for y in range(4, 14):
            for column in range(x, x + 3):
                image.putpixel((column, y), rgb)
        geometry["polygons"][str(index)] = {
            "outer": [], "holes": [],
            "smallFeature": {"pixelRuns": [[y, x, x + 2] for y in range(4, 14)]},
        }
        facts.append(f"region(r{index},{color},30,centroid({x + 1},8.5)).")
    facts.append("shared_edge(r1,r2,10).\nadjacent(r1,r2).")
    extraction = "\n".join(facts)
    png = BytesIO()
    image.save(png, format="PNG")
    if image_path is not None:
        image_path.write_bytes(png.getvalue())
    bundle = build_observation_bundle(
        frame_alias=f"frame_{order:06}", sequence_id=sequence_id, frame_order=order,
        image_bytes=png.getvalue(), extraction_text=extraction, geometry=geometry, grouping_text="",
        acceptance_text="explicit_test_first_pass_acceptance",
        accepted_groups=[{"id": "g1", "members": ["r1"], "acceptance": "fixture_authored_rule"},
                         {"id": "g2", "members": ["r2"], "acceptance": "fixture_authored_rule"}],
    )
    return temporal_frame_from_bundle(bundle, provider_id=semantics.OMEGA_PROVIDER_ID,
                                      geometry=geometry, extraction_text=extraction, image_bytes=png.getvalue())


def native_object_fixture(root, sequence_id):
    directory, units, _ = resolution.execution_context(root, sequence_id, "w")
    frames = [attached_observation(sequence_id, index, index * 2, units[index]["image"]) for index in range(3)]
    pair = resolution.resolve_observations(frames[:2], resolution.CONTRACTS["resolve_objects_via_two_frames"], {})
    obj, = pair[4]["objects"]
    home = root / "data" / "omega_vision"
    context = recording_context(home, directory, units[1]["id"])
    memory = ContextualMemory(home, "w")
    shapes, references = [], []
    tracks = {track["observationUid"]: track["trackUid"] for track in pair[3]["checkpoint"]["tracks"]}
    for group in frames[1].groups:
        record = memory.save(context.stm_area(), "shape", shape_anchor(group, provider_id=frames[1].provider_id),
                             context=context)
        shapes.append(record)
        references.append({**semantics._memory_reference(record, relation="has_shape"),
                           "memberTrackUid": tracks[group.uid], "observationUid": group.uid})
    stored = memory.save(context.stm_area(), "object", {**obj, "shapeReferences": references}, context=context)
    return frames, stored, {"shape": shapes, "object": [stored]}, context


def test_native_stm_continues_only_anchored_member_identities_without_importing_old_checkpoint(integrated):
    root, _ = integrated
    sequence_id = sequence(root, count=3)
    frames, stored, records, _ = native_object_fixture(root, sequence_id)
    ordinary = resolution.resolve_observations(
        frames[1:], resolution.CONTRACTS["resolve_objects_via_two_frames"], {})
    continued = resolution.resolve_observations(
        frames[1:], resolution.CONTRACTS["resolve_objects_via_two_frames_and_stm"], records)
    assert ordinary[4]["objects"][0]["uid"] != stored["payload"]["uid"]
    assert continued[4]["objects"][0]["uid"] == stored["payload"]["uid"]
    assert continued[5] == [stored["recordUid"]]
    validate_object_result(continued[4])
    assert continued[3]["sourceOrder"] == 1 and continued[3]["targetOrder"] == 2
    assert continued[3]["checkpoint"]["previousCheckpointUid"] != ordinary[3]["checkpoint"]["previousCheckpointUid"]
    assert continued[4]["objects"][0]["authority"] == "authored_prolog_deduction"


def test_one_frame_memory_matches_are_candidates_not_identity_or_automatic_objects(integrated):
    root, _ = integrated
    sequence_id = sequence(root)
    frames, stored, records, _ = native_object_fixture(root, sequence_id)
    result = resolution.resolve_observations(
        [frames[2]], resolution.CONTRACTS["resolve_objects_via_one_frame_and_stm"], records)
    assert result[1] and result[2]
    assert result[4]["objects"] == [] and result[3] is None and result[5] == []
    assert all(row["objectUid"] == stored["payload"]["uid"] and row["identityConfirmed"] is False for row in result[2])
    assert any(len(member["observations"]) > 1 for candidate in result[2] for member in candidate["members"]), (
        "Indistinguishable same-shape members must remain ambiguous")
    with pytest.raises(ValueError, match="Non-STM"):
        resolution.resolve_observations([frames[2]], resolution.CONTRACTS["resolve_objects_via_one_frame"], records)


def test_future_observations_backdated_into_earlier_native_publication_are_rejected(integrated):
    root, _ = integrated
    sequence_id = sequence(root, count=4)
    _, stored, _, context = native_object_fixture(root, sequence_id)
    future = json.loads(json.dumps(stored["payload"]))
    future["members"][0]["lastObservedOrder"] = 3
    ContextualMemory(context.root, "w").save(context.stm_area(), "object", future, context=context)
    _, units, _ = resolution.execution_context(root, sequence_id, "w")
    with pytest.raises(ValueError, match="publication cutoff"):
        resolution.runtime_revision(units[2], "resolve_objects_via_one_frame_and_stm/native")


def test_dependency_override_cannot_smuggle_a_prior_checkpoint_into_no_stm_mode(integrated, monkeypatch):
    root, client = integrated
    sequence_id = sequence(root)
    definitions = dict(api._TRANSFORM_METADATA)
    key = ("resolve_objects_via_two_frames", "native")
    definitions[key] = {**definitions[key], "dependsOn": [*definitions[key]["dependsOn"], semantics.TEMPORAL]}
    monkeypatch.setattr(api, "_TRANSFORM_METADATA", definitions)
    before = fingerprints(root)
    response = client.post("/video-import/semantic/execution/plan", json={
        "workspaceId": "w", "sequenceId": sequence_id, "frameId": "frame_000002",
        "stageId": "/".join(key),
    })
    assert response.status_code == 400 and "input contract" in response.text
    assert fingerprints(root) == before and not api._direct_jobs


def test_resolver_scope_and_identity_are_shared_and_redirects_are_rejected(integrated, monkeypatch):
    root, client = integrated
    sequence_id = sequence(root)
    name = "resolve_objects_via_one_frame"
    request(client, sequence_id, name, "frame_000001")
    _, units, _ = resolution.execution_context(root, sequence_id, "another_workspace")
    value = semantics._result(units[1], f"{name}/native")
    assert value == output(root, sequence_id, units[1]["id"], name)
    old = resolution.storage_path
    home = root / "data" / "omega_vision"
    monkeypatch.setattr(resolution, "storage_path", lambda base, *parts:
                        home / "redirect" if name in parts else old(base, *parts))
    before = fingerprints(root)
    with pytest.raises(PermissionError, match="redirected"):
        resolution.run_resolution(units[1], units[1]["dir"] / name / "native", {}, name)
    assert fingerprints(root) == before
