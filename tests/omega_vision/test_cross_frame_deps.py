from __future__ import annotations

from pathlib import Path

import pytest

from omega_vision.perception.cross_frame_deps import (
    DependencyGrammarError,
    ExactFrame,
    ParsedDependency,
    RelativeFrame,
    SameFrame,
    detect_dependency_cycles,
    is_dependency_stale,
    output_revision,
    parse_dependency,
    plan_pair_dependencies,
    resolve_dependency,
)

FRAMES = ["0", "1", "2", "3"]


# --------------------------------------------------------------------------- #
# Grammar
# --------------------------------------------------------------------------- #
def test_same_frame_dependency_is_backward_compatible():
    parsed = parse_dependency("parts_extraction_0/python_opencv")
    assert isinstance(parsed.selector, SameFrame)
    assert parsed.output == "parts_extraction_0/python_opencv"
    assert parsed.is_cross_frame is False


def test_relative_offset_aliases():
    prev = parse_dependency("frame[-1]@turtle_programs/turtle_programs_prolog")
    nxt = parse_dependency("frame[+1]@turtle_programs/turtle_programs_prolog")
    assert prev.selector == RelativeFrame(-1)
    assert nxt.selector == RelativeFrame(1)
    assert prev.output == "turtle_programs/turtle_programs_prolog"


def test_signed_frame_offsets_are_relative():
    assert parse_dependency("frame[-2]@a/b").selector == RelativeFrame(-2)
    assert parse_dependency("frame[+3]@a/b").selector == RelativeFrame(3)


def test_unsigned_and_named_frame_keys_are_exact():
    assert parse_dependency("frame[42]@a/b").selector == ExactFrame("42")
    assert parse_dependency("frame[foo]@a/b").selector == ExactFrame("foo")


@pytest.mark.parametrize(
    "bad",
    [
        "",
        "   ",
        "@a/b",
        "previous_frame@a/b",
        "next_frame@a/b",
        "frame[]@a/b",
        "frame[+0]@a/b",
        "frame[1.5]@a/b",
        "frame[a/b]@c/d",
        "bogus_prefix@a/b",
        "frame[-1]@a/b/c",
    ],
)
def test_invalid_selectors_raise(bad):
    with pytest.raises(DependencyGrammarError):
        parse_dependency(bad)


# --------------------------------------------------------------------------- #
# Resolution
# --------------------------------------------------------------------------- #
def _resolve(dep: str, frame_id: str, *, ordered=True, frames=FRAMES, keys=None):
    parsed = parse_dependency(dep)
    order = frames.index(frame_id) if frame_id in frames else None
    return resolve_dependency(
        parsed,
        current_frame_id=frame_id,
        current_frame_order=order,
        ordered=ordered,
        frame_ids_in_order=frames,
        frame_id_set=keys,
    )


def test_same_frame_resolves_to_current():
    res = _resolve("a/b", "2")
    assert res.resolved and res.frame_id == "2" and res.reason == "same-frame"


def test_relative_previous_in_range():
    res = _resolve("frame[-1]@a/b", "2")
    assert res.resolved and res.frame_id == "1" and res.frame_order == 1


def test_relative_previous_on_first_frame_is_out_of_range():
    res = _resolve("frame[-1]@a/b", "0")
    assert res.resolved is False and res.reason == "out-of-range"


def test_relative_next_on_last_frame_is_out_of_range():
    res = _resolve("frame[+1]@a/b", "3")
    assert res.resolved is False and res.reason == "out-of-range"


def test_relative_multi_offset():
    assert _resolve("frame[+2]@a/b", "1").frame_id == "3"
    assert _resolve("frame[-2]@a/b", "3").frame_id == "1"


def test_relative_on_unordered_sequence_is_unresolvable():
    res = _resolve("frame[-1]@a/b", "1", ordered=False)
    assert res.resolved is False and res.reason == "unordered-relative"


def test_exact_key_resolves_in_ordered_sequence():
    res = _resolve("frame[0]@a/b", "3")
    assert res.resolved and res.frame_id == "0" and res.frame_order == 0


def test_exact_key_resolves_in_unordered_sequence():
    keys = {"alpha", "beta"}
    res = _resolve("frame[alpha]@a/b", "beta", ordered=False, frames=[], keys=keys)
    assert res.resolved and res.frame_id == "alpha" and res.frame_order is None


def test_exact_unknown_key_is_unresolvable():
    res = _resolve("frame[99]@a/b", "1")
    assert res.resolved is False and res.reason.startswith("unknown-frame-key")


# --------------------------------------------------------------------------- #
# Cycle detection
# --------------------------------------------------------------------------- #
def test_linear_pipeline_has_no_cycle():
    pipeline = [
        {"transformation": "parts_extraction_0", "doer": "python_opencv", "dependsOn": []},
        {"transformation": "turtle_programs", "doer": "turtle_programs_prolog",
         "dependsOn": ["parts_extraction_0/python_opencv"]},
    ]
    assert detect_dependency_cycles(pipeline, frame_ids_in_order=FRAMES, ordered=True) == []


def test_same_frame_self_dependency_is_a_cycle():
    pipeline = [
        {"transformation": "a", "doer": "b", "dependsOn": ["a/b"]},
    ]
    cycles = detect_dependency_cycles(pipeline, frame_ids_in_order=FRAMES, ordered=True)
    assert cycles


def test_cross_frame_cycle_is_detected():
    # a/b(next) -> c/d , c/d(previous) -> a/b : forms a cross-frame loop.
    pipeline = [
        {"transformation": "a", "doer": "b", "dependsOn": ["frame[+1]@c/d"]},
        {"transformation": "c", "doer": "d", "dependsOn": ["frame[-1]@a/b"]},
    ]
    cycles = detect_dependency_cycles(pipeline, frame_ids_in_order=FRAMES, ordered=True)
    assert cycles


def test_cross_frame_chain_without_cycle():
    pipeline = [
        {"transformation": "turtle_programs", "doer": "turtle_programs_prolog", "dependsOn": []},
        {"transformation": "pair", "doer": "llm",
         "dependsOn": ["turtle_programs/turtle_programs_prolog",
                       "frame[-1]@turtle_programs/turtle_programs_prolog"]},
    ]
    assert detect_dependency_cycles(pipeline, frame_ids_in_order=FRAMES, ordered=True) == []


# --------------------------------------------------------------------------- #
# Revision + staleness
# --------------------------------------------------------------------------- #
def test_output_revision_is_deterministic_and_content_sensitive(tmp_path: Path):
    p = tmp_path / "result.pl"
    p.write_text("region(r1).", encoding="utf-8")
    rev1 = output_revision(p, producer="opencv", schema="v1")
    rev2 = output_revision(p, producer="opencv", schema="v1")
    assert rev1 == rev2
    p.write_text("region(r2).", encoding="utf-8")
    assert output_revision(p, producer="opencv", schema="v1") != rev1
    # Producer change alone changes the revision even with identical content.
    p.write_text("region(r1).", encoding="utf-8")
    assert output_revision(p, producer="scikit", schema="v1") != rev1


def _resolved(frame_id="1"):
    return resolve_dependency(
        parse_dependency("frame[-1]@a/b"),
        current_frame_id="2", current_frame_order=2,
        ordered=True, frame_ids_in_order=FRAMES,
    )


def test_not_stale_when_revision_matches():
    res = _resolved()
    stale, reason = is_dependency_stale(
        {"frameId": res.frame_id}, res,
        consumed_revision="abc", current_revision="abc",
    )
    assert stale is False and reason == "current"


def test_stale_when_target_revision_changed():
    res = _resolved()
    stale, reason = is_dependency_stale(
        {"frameId": res.frame_id}, res,
        consumed_revision="abc", current_revision="def",
    )
    assert stale and reason == "revision-changed"


def test_stale_when_resolved_frame_changed_by_catalog_edit():
    res = _resolved()  # resolves to frame "1"
    stale, reason = is_dependency_stale(
        {"frameId": "0"}, res,  # previously resolved to a different frame
        consumed_revision="abc", current_revision="abc",
    )
    assert stale and reason == "resolved-frame-changed"


def test_stale_when_target_missing_or_unresolvable():
    res = _resolved()
    stale, _ = is_dependency_stale(
        {"frameId": res.frame_id}, res,
        consumed_revision="abc", current_revision=None,
    )
    assert stale
    unresolved = resolve_dependency(
        parse_dependency("frame[-1]@a/b"),
        current_frame_id="0", current_frame_order=0,
        ordered=True, frame_ids_in_order=FRAMES,
    )
    stale2, reason2 = is_dependency_stale(
        None, unresolved, consumed_revision="abc", current_revision="abc",
    )
    assert stale2 and reason2.startswith("unresolvable")


# --------------------------------------------------------------------------- #
# Pair planning (first LLM consumer boundary)
# --------------------------------------------------------------------------- #
def test_pair_plan_omits_first_frame_and_pairs_the_rest():
    plans = plan_pair_dependencies(FRAMES)
    assert [p["frameId"] for p in plans] == ["1", "2", "3"]
    first = plans[0]
    assert first["previousFrameId"] == "0"
    assert first["dependsOn"] == [
        "turtle_programs/turtle_programs_prolog",
        "frame[-1]@turtle_programs/turtle_programs_prolog",
    ]


def test_pair_plan_single_image_has_no_pairs():
    assert plan_pair_dependencies(["only"]) == []
