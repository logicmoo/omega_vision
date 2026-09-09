import pytest

from omega_vision.perception.direct_transform_plan import plan_direct_call


def test_dependency_order_and_shared_nodes():
    specs = {"extract/python": {}, "group/prolog": {"dependsOn": ["extract/python"]},
             "render/python": {"dependsOn": ["group/prolog", "extract/python"]}}
    plan = plan_direct_call("render/python", specs, ["a", "b"], ["a"], ordered=True)
    assert [(node.frame_id, node.output) for node in plan] == [
        ("a", "extract/python"), ("a", "group/prolog"), ("a", "render/python"),
    ]


def test_cross_frame_scope_and_unknown_dependencies_are_explicit():
    specs = {"extract/python": {}, "pair/python": {"dependsOn": ["frame[+1]@extract/python"]}}
    plan = plan_direct_call("pair/python", specs, ["a", "b"], ["a"], ordered=True)
    assert plan[-1].blocked == ("frame[+1]@extract/python: outside First N selection",)
    with pytest.raises(ValueError, match="not registered"):
        plan_direct_call("pair/python", {"pair/python": {"dependsOn": ["missing/python"]}},
                         ["a"], ["a"], ordered=True)


def test_cycles_fail_without_executing_anything():
    with pytest.raises(ValueError, match="cycle"):
        plan_direct_call("a/python", {
            "a/python": {"dependsOn": ["b/python"]},
            "b/python": {"dependsOn": ["a/python"]},
        }, ["frame"], ["frame"], ordered=True)


def test_pair_roots_skip_boundary_but_previous_input_is_available():
    specs = {"input/python": {}, "pair/python": {
        "dependsOn": ["input/python", "frame[-1]@input/python"], "skipFirstFrame": True,
    }}
    plan = plan_direct_call("pair/python", specs, ["initial", "next"], ["initial", "next"], ordered=True)
    assert not any(node.output == "pair/python" and node.frame_id == "initial" for node in plan)
    assert any(node.output == "input/python" and node.frame_id == "initial" for node in plan)
    assert all(not node.blocked for node in plan)


def test_bootstrap_dependencies_are_explicit_not_guessed():
    specs = {"input/python": {}, "track/prolog": {
        "dependsOn": ["input/python", "frame[-1]@track/prolog"],
        "firstFrameDependsOn": ["input/python"],
    }}
    plan = plan_direct_call("track/prolog", specs, ["a", "b"], ["a", "b"], ordered=True)
    assert all(not node.blocked for node in plan)
    assert [node.output for node in plan] == ["input/python", "track/prolog"] * 2
