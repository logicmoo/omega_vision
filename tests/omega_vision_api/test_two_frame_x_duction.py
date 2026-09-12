import pytest
from PIL import Image

from omega_vision.perception._event_journal import ValidationError
from omega_vision.perception.metta_memory import MeTTaMemoryDatabase
from omega_vision.services import two_frame_x_duction as family
from omega_vision.services import video_import_semantics as semantics
from omega_vision.services import video_import_api as api

from test_semantic_active_integration import integrated, sequence, finish
from test_recording_test_execution import fingerprints


def preferences(sequence_id, *, nowhere=False):
    locations, context = semantics._memory("w", sequence_id)
    value = locations.load_preferences(context)
    if nowhere:
        for kind in ("shape", "object"):
            value[kind].update(saveTo="memory-nowhere", lookIn=["memory-nowhere"], recentLookIn=[])
    return locations.save_preferences(context, value, expected_revision=value["revision"])


def call(client, sequence_id, implementation="deduction", frame_id="frame_000001", **extra):
    return client.post("/video-import/direct-calls", json={
        "workspaceId": "w", "sequenceId": sequence_id,
        "composite": f"{family.FAMILY}/{implementation}", "frameId": frame_id, **extra,
    })


def confirmed_call(client, sequence_id, implementation="deduction", frame_id="frame_000001", *, run=True):
    body = {"workspaceId": "w", "sequenceId": sequence_id, "frameId": frame_id,
            "stageId": f"{family.FAMILY}/{implementation}"}
    preview = client.post("/video-import/semantic/execution/plan", json=body)
    assert preview.status_code == 200, preview.text
    plan = preview.json()
    assert not plan["blockedReasons"] and plan["targetFrameId"] == frame_id
    return client.post("/video-import/semantic/execution/commit", json={
        **body, "confirmed": True, "confirmationKey": plan["confirmationKey"], "run": run,
    })


def result(sequence_id, index, implementation):
    _, units = semantics._units("w", sequence_id)
    return semantics._result(units[index], f"{family.FAMILY}/{implementation}")


def test_family_metadata_is_read_only_and_keeps_the_three_leaf_identities(integrated):
    root, client = integrated
    before = fingerprints(root)
    response = client.get("/video-import/semantic/stage-families")
    assert response.status_code == 200, response.text
    assert response.headers["cache-control"] == "no-store"
    entry, = response.json()["families"]
    assert entry["id"] == family.FAMILY and entry["after"] == "first_pass"
    assert [row["category"] for row in entry["implementations"]] == ["deductions", "candidate_rules", "hypotheses"]
    assert all(row["available"] for row in entry["implementations"])
    assert [row["leafComposite"] for row in entry["implementations"]] == [
        semantics.EVENTS, semantics.INDUCTION, "event_abduction_0/deterministic",
    ]
    menu = client.get("/video-import/transform-composites", params={"workspaceId": "w"})
    assert menu.status_code == 200, menu.text
    rows = [row for row in menu.json()["composites"] if row["transformation"] == family.FAMILY]
    assert len(rows) == 3
    for row in rows:
        assert row["id"] == f"{family.FAMILY}/{row['doer']}"
        assert row["family"] == family.FAMILY and row["available"] and row["orderedOnly"]
        assert row["dependsOn"] == [family.BRANCHES[row["doer"]]["dependency"]]
        assert row["firstFrameDependsOn"] == list(family.FIRST_PASS) and row["skipFirstFrame"] is False
        assert row["resultCategory"] == family.BRANCHES[row["doer"]]["category"]
    assert fingerprints(root) == before


@pytest.mark.parametrize("frame_id", [None, 1, True, "", "foreign", "../frame_000000"])
def test_invalid_row_never_falls_back_to_whole_sequence(integrated, frame_id):
    root, client = integrated
    sequence_id = sequence(root)
    before = fingerprints(root)
    response = call(client, sequence_id, frame_id=frame_id)
    assert response.status_code == 400, response.text
    assert not api._direct_jobs and fingerprints(root) == before


def test_explicit_row_cannot_be_combined_with_first_n(integrated):
    root, client = integrated
    sequence_id = sequence(root)
    response = call(client, sequence_id, firstN=2, planOnly=True)
    assert response.status_code == 400 and not api._direct_jobs


@pytest.mark.parametrize("implementation", ["deduction", "induction", "abduction"])
def test_requested_parent_row_has_only_causal_dependencies_and_plan_writes_nothing(integrated, implementation):
    root, client = integrated
    sequence_id = sequence(root, count=4)
    preferences(sequence_id)
    before = fingerprints(root)
    response = call(client, sequence_id, implementation, "frame_000002", planOnly=True)
    assert response.status_code == 200, response.text
    value = response.json()
    assert value["requestedFrameIds"] == ["frame_000002"]
    assert value["supportFrameIds"] == ["frame_000000", "frame_000001", "frame_000002"]
    assert value["targetContext"] == {"currentFrameId": "frame_000002", "currentFrameOrder": 2,
                                      "previousFrameId": "frame_000001", "status": "pair"}
    parent_steps = [step for step in value["steps"] if step["output"].startswith(family.FAMILY + "/")]
    assert len(parent_steps) == 1 and parent_steps[0]["frameId"] == "frame_000002"
    assert "frame_000003" not in {step["frameId"] for step in value["steps"]}
    other_branches = {row["leaf"] for name, row in family.BRANCHES.items() if name != implementation}
    if implementation != "deduction":
        other_branches.discard(semantics.EVENTS)
    assert not other_branches.intersection(step["output"] for step in value["steps"])
    assert fingerprints(root) == before and not api._direct_jobs
    whole = client.post("/video-import/direct-calls", json={
        "workspaceId": "w", "sequenceId": sequence_id, "firstN": 3,
        "composite": f"{family.FAMILY}/{implementation}", "planOnly": True,
    })
    assert whole.status_code == 200, whole.text
    assert whole.json()["confirmationKey"] != value["confirmationKey"]


@pytest.mark.parametrize("implementation", ["deduction", "induction", "abduction"])
def test_first_frame_is_an_initial_observation_not_a_self_pair(integrated, implementation):
    root, client = integrated
    sequence_id = sequence(root, count=2)
    response = call(client, sequence_id, implementation, "frame_000000")
    assert response.status_code == 200, response.text
    job = finish(client, response.json())
    assert job["requestedFrameIds"] == ["frame_000000"]
    value = result(sequence_id, 0, implementation)
    assert value["status"] == "initial_observation" and value["reason"] == "no_predecessor"
    assert value["pair"] is None and value["supportCutoffOrderExclusive"] == 0
    assert value["deductions"] == value["candidateRules"] == value["hypotheses"] == []
    assert not list(root.rglob("event_log_0")) and not list(root.rglob("hypotheses.json"))
    assert not list(root.rglob("frame_000001/meta.json"))


@pytest.mark.parametrize("nowhere,frame_id", [(False, "frame_000001"), (True, "frame_000001"), (True, "frame_000000")])
def test_parent_requires_explicit_persistent_memory_without_substituting_destinations(integrated, nowhere, frame_id):
    root, client = integrated
    sequence_id = sequence(root)
    if nowhere:
        preferences(sequence_id, nowhere=True)
    before = fingerprints(root)
    response = call(client, sequence_id, frame_id=frame_id)
    assert response.status_code == 400
    assert ("Nowhere" if nowhere else "explicit persistent") in response.text
    assert fingerprints(root) == before and not api._direct_jobs


def test_unknown_alpha_visibility_is_not_converted_into_object_facts(integrated):
    root, client = integrated
    sequence_id = sequence(root)
    image = root / "data" / "omega_vision" / "recordings" / "integration" / "seq" / "frame_000000" / "image.png"
    Image.new("RGBA", (48, 32), (0, 0, 0, 0)).save(image)
    before = fingerprints(root)
    response = call(client, sequence_id, frame_id="frame_000000")
    assert response.status_code == 400 and "visibility" in response.text
    assert fingerprints(root) == before and not api._direct_jobs


def test_real_parent_branches_preserve_categories_sources_native_history_and_cutoffs(integrated):
    root, client = integrated
    sequence_id = sequence(root, count=3)
    preferences(sequence_id)
    preference_files = {path: path.read_bytes() for path in root.rglob("*preferences*.json")}
    outputs = {}
    for implementation in family.BRANCHES:
        response = confirmed_call(client, sequence_id, implementation)
        assert response.status_code == 200, response.text
        finish(client, response.json())
        outputs[implementation] = result(sequence_id, 1, implementation)
        assert outputs[implementation]["pair"]["before"]["order"] == 0
        assert outputs[implementation]["pair"]["after"]["order"] == 1
        assert outputs[implementation]["supportCutoffOrderExclusive"] == 1
        assert outputs[implementation]["automaticPromotion"] is False
    assert outputs["deduction"]["assessment"] is not None
    assert outputs["deduction"]["candidateRules"] == outputs["deduction"]["hypotheses"] == []
    assert outputs["induction"]["exampleIds"]
    assert outputs["induction"]["authority"] == "proposals_only"
    assert outputs["induction"]["deductions"] == outputs["induction"]["hypotheses"] == []
    assert outputs["abduction"]["authority"] == "non_authoritative_hypotheses"
    assert outputs["abduction"]["deductions"] == outputs["abduction"]["candidateRules"] == []
    home = root / "data" / "omega_vision"
    databases = list(home.rglob("abduced_events.metta"))
    assert len(databases) == 1
    entries = MeTTaMemoryDatabase(home, databases[0].parent, "hypothesis").read()
    assert len(entries) == 1 and entries[0]["authoritative"] is False
    _, units = semantics._units("w", sequence_id)
    assert semantics._store(root, units[1]).published_candidates() == []
    journal = semantics._event_log(root, sequence_id).read()
    response = call(client, sequence_id, "abduction")
    assert response.status_code == 200, response.text
    finish(client, response.json())
    assert semantics._event_log(root, sequence_id).read() == journal
    assert MeTTaMemoryDatabase(home, databases[0].parent, "hypothesis").read() == entries
    assert all(path.read_bytes() == value for path, value in preference_files.items())
    assert not list(units[2]["dir"].rglob("meta.json"))
    _, other = semantics._units("another_workspace", sequence_id)
    assert other[1]["dir"] == units[1]["dir"]
    assert semantics._result(other[1], f"{family.FAMILY}/deduction") == outputs["deduction"]

    preferences(sequence_id, nowhere=True)
    before = fingerprints(root)
    snapshot = client.get("/video-import/semantic/execution", params={
        "workspaceId": "w", "sequenceId": sequence_id, "frameId": units[1]["id"],
    })
    assert snapshot.status_code == 200, snapshot.text
    state = snapshot.json()
    assert state["frameCount"] == 1 and state["targetFrameId"] == units[1]["id"]
    assert {row["frameId"] for row in state["outputs"]} == {units[1]["id"]}
    parent_outputs = [row for row in state["outputs"] if row["composite"].startswith(family.FAMILY + "/")]
    assert len(parent_outputs) == 3 and all(row["status"] == "stale" for row in parent_outputs)
    assert fingerprints(root) == before


def test_parent_rejects_out_of_frame_output_paths_and_rule_payloads(integrated):
    root, _ = integrated
    sequence_id = sequence(root)
    _, units = semantics._units("w", sequence_id)
    unit = units[0]
    with pytest.raises(ValidationError, match="rule payloads"):
        family.preflight(unit, f"{family.FAMILY}/deduction", {"teacher": "moved"})
    with pytest.raises(PermissionError, match="requested frame"):
        family.run_parent(unit, root / "out", {}, "deduction")
    assert not (root / "out").exists()


@pytest.mark.parametrize("redirect", ["source", "output"])
def test_parent_rejects_resolver_redirects_even_inside_the_shared_root(integrated, monkeypatch, redirect):
    root, _ = integrated
    sequence_id = sequence(root)
    _, units = semantics._units("w", sequence_id)
    home = root / "data" / "omega_vision"
    resolve = family.storage_path
    monkeypatch.setattr(family, "storage_path", lambda base, *parts:
                        home / "redirect" if (redirect == "source" and parts[-1:] == ("image.png",))
                        or (redirect == "output" and family.FAMILY in parts) else resolve(base, *parts))
    before = fingerprints(root)
    with pytest.raises(PermissionError, match="redirected"):
        family.run_parent(units[0], units[0]["dir"] / family.FAMILY / "deduction", {}, "deduction")
    assert fingerprints(root) == before


@pytest.mark.parametrize("index", [0, 1])
def test_acquisition_changes_invalidate_parent_even_on_initial_observation(integrated, index):
    root, _ = integrated
    sequence_id = sequence(root)
    preferences(sequence_id)
    _, units = semantics._units("w", sequence_id)
    old = family.runtime_revision(units[index], f"{family.FAMILY}/deduction")
    (units[index]["dir"] / "state.json").write_text('{"at_seconds": 0.25}', encoding="utf-8")
    assert family.runtime_revision(units[index], f"{family.FAMILY}/deduction") != old


def test_recording_run_versions_bind_parent_and_dispatcher_code():
    from omega_vision.services.recording_test_execution import _versions
    assert {"two_frame_x_duction.py", "video_import_abduction.py", "video_import_api.py"} <= set(_versions()["modules"])


def test_initial_root_image_is_an_actual_row_not_a_numeric_frame_alias(integrated):
    root, client = integrated
    sequence_id = sequence(root, count=2)
    home = root / "data" / "omega_vision" / "recordings" / "integration" / "seq"
    Image.new("RGB", (48, 32), "black").save(home / "image.png")
    (home / "state.json").write_text(
        '{"step_count":0,"incoming_action":null,"parent_node":null,"level":"1"}', encoding="utf-8",
    )
    _, units = semantics._units("w", sequence_id)
    assert units[0]["id"] == "image"
    response = call(client, sequence_id, frame_id="image")
    assert response.status_code == 200, response.text
    job = finish(client, response.json())
    assert job["supportFrameIds"] == ["image"]
    assert job["targetContext"]["previousFrameId"] is None
    assert result(sequence_id, 0, "deduction")["status"] == "initial_observation"


def test_row_targeting_a_one_frame_leaf_does_not_run_or_count_the_prefix(integrated):
    root, client = integrated
    sequence_id = sequence(root, count=4)
    response = client.post("/video-import/direct-calls", json={
        "workspaceId": "w", "sequenceId": sequence_id, "composite": semantics.PARTS,
        "frameId": "frame_000002", "planOnly": True,
    })
    assert response.status_code == 200, response.text
    value = response.json()
    assert value["imageCount"] == 1 and value["supportFrameIds"] == ["frame_000002"]
    assert {step["frameId"] for step in value["steps"]} == {"frame_000002"}


@pytest.mark.parametrize("implementation", ["deduction", "induction", "abduction"])
def test_confirmed_row_plan_cannot_be_retargeted_or_start_without_confirmation(integrated, implementation):
    root, client = integrated
    sequence_id = sequence(root)
    preferences(sequence_id)
    body = {"workspaceId": "w", "sequenceId": sequence_id, "frameId": "frame_000001",
            "stageId": f"{family.FAMILY}/{implementation}"}
    before = fingerprints(root)
    response = client.post("/video-import/semantic/execution/plan", json=body)
    assert response.status_code == 200, response.text
    preview = response.json()
    assert preview["requestedFrameIds"] == ["frame_000001"] and preview["supportFrameIds"] == [
        "frame_000000", "frame_000001",
    ]
    assert not api._direct_jobs and fingerprints(root) == before
    for changed in (
        {**body, "confirmed": False},
        {**body, "frameId": "frame_000000", "confirmed": True},
        {key: value for key, value in {**body, "confirmed": True}.items() if key != "frameId"},
    ):
        response = client.post("/video-import/semantic/execution/commit", json={
            **changed, "run": True, "confirmationKey": preview["confirmationKey"],
        })
        assert response.status_code == 409, response.text
        assert not api._direct_jobs and fingerprints(root) == before


@pytest.mark.parametrize("implementation", ["deduction", "induction", "abduction"])
def test_confirmed_row_stamping_only_touches_causal_scope_without_starting_a_worker(integrated, implementation):
    root, client = integrated
    sequence_id = sequence(root, count=4)
    preferences(sequence_id)
    response = confirmed_call(client, sequence_id, implementation, "frame_000002", run=False)
    assert response.status_code == 200, response.text
    result = response.json()
    assert result["state"] == "stamped" and result["targetFrameId"] == "frame_000002"
    assert result["requestedFrameIds"] == ["frame_000002"]
    assert not api._direct_jobs
    _, units = semantics._units("w", sequence_id)
    assert not (units[3]["dir"] / "todos.json").exists()
    for index, unit in enumerate(units[:3]):
        import json
        pending = json.loads((unit["dir"] / "todos.json").read_text())["todos"]
        parent_outputs = [row["output"] for row in pending if row["output"].startswith(family.FAMILY + "/")]
        assert parent_outputs == ([f"{family.FAMILY}/{implementation}"] if index == 2 else [])
        assert not list(unit["dir"].rglob("meta.json"))


@pytest.mark.parametrize("implementation", ["deduction", "induction", "abduction"])
def test_confirmed_first_row_uses_initial_observation_and_never_an_invented_predecessor(integrated, implementation):
    root, client = integrated
    sequence_id = sequence(root)
    response = confirmed_call(client, sequence_id, implementation, "frame_000000")
    assert response.status_code == 200, response.text
    job = finish(client, response.json())
    assert job["targetContext"]["previousFrameId"] is None and job["supportFrameIds"] == ["frame_000000"]
    assert result(sequence_id, 0, implementation)["reason"] == "no_predecessor"


def test_semantic_row_read_and_plan_reject_invalid_or_unordered_context(integrated):
    root, client = integrated
    sequence_id = sequence(root, ordered=False)
    before = fingerprints(root)
    for frame_id in (None, "", 1, "not-an-actual-unit"):
        body = {"workspaceId": "w", "sequenceId": sequence_id, "frameId": frame_id}
        response = client.post("/video-import/semantic/execution/read", json=body)
        assert response.status_code == 400, response.text
    response = client.post("/video-import/semantic/execution/plan", json={
        "workspaceId": "w", "sequenceId": sequence_id, "frameId": "frame_000001",
        "stageId": f"{family.FAMILY}/deduction",
    })
    assert response.status_code == 400 and "Unordered" in response.text
    assert fingerprints(root) == before and not api._direct_jobs
