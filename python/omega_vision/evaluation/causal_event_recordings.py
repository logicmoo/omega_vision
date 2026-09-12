"""Add versioned evidence-complete event examples without altering the v1 suite."""

from dataclasses import replace
import json
from pathlib import Path

from omega_vision.inherited_source_overlay import shared_storage_path
from omega_vision.perception.event_records import Term

from .event_recording_cases import Body, Case, Expected, Frame, RED, event_cases
from .event_recordings import GAME_ID, _case_files, _json, publish_recording_files


def _shift(frame: Frame, dx: int) -> Frame:
    return replace(frame, bodies=tuple(body.at(body.x + dx) for body in frame.bodies))


def causal_cases() -> tuple[Case, ...]:
    original = {case.name: case for case in event_cases()}
    cases = []
    for name in ("move", "co_move"):
        case = original[name]
        cases.append(replace(
            case, name=f"{name}_warmup_v2",
            description=f"{case.description} Includes a measured stationary warm-up interval.",
            frames=(replace(case.frames[0], caption="Baseline: velocity is not yet measured."), *case.frames),
            expected=tuple(replace(event, frame=event.frame + 1) for event in case.expected),
            requirements=case.requirements + ("Frame 0 -> 1 establishes stationary motion; do not infer it from frame 0 alone.",),
        ))
    for name, decision in (("collision", 2), ("group_formed", 2)):
        case = original[name]
        cases.append(replace(
            case, name=f"{name}_confirmed_v2",
            description=f"{case.description} Classification waits for the supporting later observation.",
            expected=tuple(replace(event, frame=decision) for event in case.expected),
            requirements=case.requirements + (
                "Decide at frame 2 using the earlier contact/join plus current motion; never backdate confirmation to frame 1.",
            ),
        ))

    for name in ("group_dissolved", "member_added", "member_removed"):
        case = original[name]
        baseline = case.frames[0]
        paired = tuple(body for body in baseline.bodies if name == "member_removed" or body.entity != "third")
        independent = Frame("Independent pieces before joining.", (
            Body("actor", 4, 20), Body("other", 38, 20, color=RED),
            *(body for body in baseline.bodies if body.entity == "third"),
        ))
        joined = replace(baseline, caption="Joined geometry is a proposal, not an oracle-approved group.",
                         bodies=tuple(body.at(body.x - 8) if body in paired else body for body in baseline.bodies))
        translated = replace(baseline, caption="Joined members move together before the tested change.",
                             bodies=tuple(body.at(body.x - 4) if body in paired else body for body in baseline.bodies))
        decision = 5 if name == "member_added" else 4
        cases.append(replace(
            case, name=f"{name}_history_v2",
            description=f"{case.description} Includes independent observations before the membership change.",
            frames=(independent, joined, translated, *case.frames),
            expected=tuple(replace(event, frame=decision) for event in case.expected),
            requirements=case.requirements + (
                "Establish typed membership independently from joined geometry and repeated rigid motion before the target change.",
                "If the available grouping criterion cannot establish that baseline, report inconclusive; fixture annotations cannot supply it.",
            ),
        ))

    follow = original["follow"]
    continued = Frame("A third lagged path match supports continuation.", (
        follow.frames[2].bodies[0].at(28, 20),
        follow.frames[2].bodies[1].at(28, 28),
    ))
    ended = Frame("Follower then diverges while the leader continues.", (
        follow.frames[2].bodies[0].at(36, 20),
        follow.frames[2].bodies[1].at(28, 36),
    ))
    carry = original["carry"]
    for case, frames in (
        (follow, (*follow.frames[:3], continued, ended)),
        (carry, (*carry.frames[:3], replace(_shift(carry.frames[2], 4), caption="Transport continues at fixed relative pose."),
                 carry.frames[3])),
    ):
        relation = case.expected[0].term.args[0]
        cases.append(replace(
            case, name=f"{case.name}_confirmed_v2", frames=frames,
            description=f"{case.description} Includes the history required before classification.",
            expected=tuple(Expected(index, Term(phase, (relation,)))
                           for index, phase in ((2, "start"), (3, "continue"), (4, "end"))),
            requirements=case.requirements + (
                "A single early contact/path point is insufficient. Start is decided at frame 2, not inferred at frame 1.",
            ),
        ))
    return tuple(cases)


def causal_recording_files() -> dict[tuple[str, ...], bytes]:
    files = {}
    entries = []
    for case in causal_cases():
        files.update(_case_files(case))
        sequence = f"recordings/{GAME_ID}/{case.name}"
        targets = "\n".join(
            f"- Frame {event.frame}: `{event.term.to_dict()}` (decision uses only frames 0 through {event.frame})."
            for event in case.expected
        )
        requirements = "\n".join(f"- {item}" for item in case.requirements)
        documentation = (
            f"# {case.name.replace('_', ' ')}\n\n{case.description}\n\n"
            "**Execution status: not run.** This is a versioned test input, not a passed detector result.\n\n"
            "## Earlier local memory and measured evidence\n\n"
            "Freeze the previous Shape/Object observations, temporal/event checkpoint and eligible "
            "recording-level STM before processing the next image. Keep source hashes and actual "
            "frame order. Initial observation is not measured stationary motion. Group identity "
            "and membership need independent evidence, not a remembered oracle label.\n\n"
            f"{requirements}\n\n## Decision-frame expectations\n\n{targets}\n\n"
            "Support at a later frame does not rewrite earlier knowledge. Current observations "
            "can support a deduction with references to prior contact/path/shape evidence. "
            "If correspondence or a required baseline is unresolved, retain unknown/inconclusive "
            "rather than manufacturing the expected event.\n\n"
            "## Controls, scoring and induction\n\n"
            "Compare the original shorter v1 recording as an insufficient-history control. "
            "Stationary comparisons do not seed positive recurrence; a confirmed event must be "
            "independently scored before it can support rule evaluation. Candidate-generated "
            "labels cannot confirm that same candidate. Held-out trials never tune thresholds; "
            "promotion remains explicit and later local reuse obeys publication cutoffs.\n\n"
            "The separate expected_events.json is evaluator-only. Descriptions, case IDs, "
            "authored masks, entity names and membership annotations are not recognizer inputs. "
            "FRAME is observation advance, not an action or force. Actual action-bearing blocked "
            "examples are available in stairs_gravity; a no-input stationary frame is not a failed RIGHT.\n\n"
            f"## Loadable recording\n\n`{sequence}` contains {len(case.frames)} numbered frames from 0.\n\n"
            "All assets are shared across workspaces. Native memory belongs to the real frame "
            "and recording-level STM under data/omega_vision; Nowhere remains browser RAM only. "
            "No memory payloads or learned rules are published merely by generating this example.\n\n"
            "## Preservation\n\nThis v2 recording does not replace, rename, reindex or overwrite "
            "the original v1 recording or its expected outcomes. Recreate additively with "
            "`python -m omega_vision.evaluation.causal_event_recordings`.\n"
        )
        doc = f"documentation/{case.name}.md"
        files[("recordings", GAME_ID, "documentation", f"{case.name}.md")] = documentation.encode("utf-8")
        entries.append({
            "id": case.name, "group": "Events", "title": case.name.replace("_", " ").capitalize(),
            "summary": case.description, "executionStatus": "not_run", "documentationFile": doc,
            "recordings": [{"visualSequenceId": sequence, "label": "Causal history v2",
                            "partition": "causal_revision", "frameCount": len(case.frames)}],
        })
    files[("recordings", GAME_ID, "causal_event_tests.json")] = _json({
        "schemaVersion": 1, "count": len(entries), "tests": entries,
    })
    return files


def create_causal_recordings(root: Path) -> dict[str, int]:
    cases = causal_cases()
    return {
        "testCount": len(cases), "recordingCount": len(cases),
        "frameCount": sum(len(case.frames) for case in cases),
        **publish_recording_files(root, causal_recording_files()),
    }


if __name__ == "__main__":
    print(json.dumps(create_causal_recordings(shared_storage_path()), indent=2))
