"""Publish documented event/induction input tests, create-only and idempotently.

    python -m omega_vision.evaluation.induction_recordings

Existing miniature inputs are compared, never updated. No detector, learner,
memory writer, promotion, preference change or service activation is performed.
"""

from __future__ import annotations

import hashlib
import json
from pathlib import Path
import re
from typing import Any

from omega_vision.inherited_source_overlay import shared_storage_path, vision_data_root

from .event_recording_cases import event_cases
from .event_recordings import (
    FIXTURE_TIME, GAME_ID, _json, event_recording_files, publish_recording_files,
)
from .induction_recording_cases import CELL, SIZE, STEMS, Clip, induction_clips

SUITE_ID = "documented-recording-tests-v1"
PLAN_PATH = Path(__file__).resolve().parents[3] / "docs" / "design" / "EVENT_TEST_RECORDINGS_LOCAL_MEMORY_PLAN.md"

MEMORY_PROTOCOL = """## Historical read and decision protocol

Local memory means this recording's earlier frame history and level-1 STM in the
one shared Omega store, never a workspace partition or an automatic union with
other recordings. At frame `0`, establish measured baselines only; a still image
does not establish zero velocity or a false prior episode.

For each later frame, freeze the exact predecessor's `shapes_db.metta` and
`objects_db.metta`, validated temporal/event checkpoints and canonical log prefix,
and eligible `memory_level_1_stm` entries published strictly before this frame.
Keep actual G-track and O identity types distinct. Apply sequence, level, source
hash, order and publication cutoffs; reject stale prefixes, gaps and forks.
Only then extract this image and compare independently matched observations.
Current writes, future frames and future approvals cannot confirm themselves.
Missing evidence is **unknown**, not false. Current-frame observations/proposals
are written only after the historical read context is frozen.

Record evidence time separately from decision time. If later motion supplies
confirmation, decide at that later frame and cite the earlier evidence; do not
backdate knowledge. Relation episodes use true/false/unknown: `start` requires
established false-to-true evidence; `continue`/`end` require the same active episode
or an explicitly supported initial-boundary anchor. Unknown cannot end an episode.
Retain ordered directional roles and canonically ordered symmetric subjects.
Use `state.json.at_seconds` / manifest sampling times, not the fixed synthetic
`recorded_at`, for velocity, delay and horizon measurements.

## Oracle separation and inference limits

These are **input tests, not automatically passed tests**. No recognizer or
learner was run to publish them. Case/recording names, `tests.json`, `suite.json`,
this documentation, `expected_events.json`, `evaluation.json`, authored masks,
entity IDs, hidden roles/wiring and expected results are evaluator information,
never recognizer facts. Runtime identities are independently produced and aligned
only for scoring. Predictions and abductive assumptions are not observations.
No empty memory files, detector implementations, rules or approvals are created.

Evidence references must retain source frames and versions. Do not treat shape
similarity as proof of identity, missing detections as signed negative evidence,
or a predicted response as an observed intermediate fact. Do not infer general
force, mass, hidden-state, arbitrary Boolean or recursive-chain reasoning from
these demonstrations. Unsupported representations/detectors remain unavailable.
"""

LEARNING_PROTOCOL = """## Training, counterexamples and held-out evaluation

`train_a` and `train_b` vary physical orientation/location, appearance, dwell and
input timing. `control_a` is an independent training control, not an adjacent
frame counted as another experiment. Only training clips may influence candidate
generation or thresholds. Freeze candidates before `validation_a`; reserve
`test_a` and `test_control_a` as final held-out inputs, never tuning examples.
Control names describe evaluator intent, not a universal empty-events outcome.
For example a no-press timer control still contains an observed door change.

Retain each candidate's source sequences/pairs, positive support, explicit
counterexamples, measured delay window, uncertainty and mechanism scope. A failed
release prediction must not erase support for an earlier press prediction.
Incomplete response horizons are pending/inconclusive, not negatives. Candidate
gates (two independent positive pairs in two sequences, a held-out pair,
confidence >= 0.8 and zero permitted counterexamples) are minimum requirements,
not demonstrated results of fixture generation or substitutes for controls.

Record actual input attempts independently of their observed outcomes.
Action-effect induction may use zero delay; the current event-transition inducer
starts at one transition. Same-pair plate/door changes need an explicit justified
event-rule contract, not shifted timestamps. Freeze predictions before observing
their effects and score complete observed positive and negative horizons exactly.

The existing-vocabulary baseline is generic measured movement/contact/appearance
or shape change. Typed plate occupancy, open/closed door state, pushing affordance,
signed clearance and mechanism-specific predicates are **planned domain-semantic
tests**, not new registered runtime predicates. This fixture's cell occupancy,
`doorOpen`, named roles and momentum are evaluator conventions only.

Induction proposes, never auto-approves. Explicitly authorized cross-recording
experiments do not merge STM. Unapproved proposals belong to their originating
frame's authorized `memory/induced_rules.metta`; explicit later approval may publish
to that recording's real `memory_level_1_stm`, never automatically to shared LTM.
Publication at order p cannot affect p or earlier frames. Held-out evaluation does
not silently install candidates into another recording. Later local reuse needs
an explicit probe. Abduction, hidden-cause probes and cold-memory replay are still
separate work, not claims made by this dataset. Nowhere remains browser RAM only;
no server payload, persistent abduction or cache is authorized for it.
"""

SIMULATION_NOTES = {
    "plate_momentary": "The fixture's door follows current occupancy immediately; each main trial contains two complete press/hold/release cycles. Detect observed transitions, not a causal law from one coincidence.",
    "plate_crate_hold": "A crate is pushed onto the plate, the actor retreats along another lane, and then returns behind the crate to push it off. Door opening persists while the actor is away and ends after the crate leaves. Controls push through an adjacent lane.",
    "plate_unlinked_control": "A controls the farther door; B controls the nearer door. Main trials intervene independently on A and B. The nearby door's failure to respond to A is a counterexample to nearest-door association, not an absent observation.",
    "plate_latched": "After the first occupancy the door stays open through fully observed releases and another press. This contradicts a momentary closure candidate without deleting its earlier press support. No-press controls remain closed.",
    "plate_toggle": "Three distinct rising edges alternate open/closed/open. Holding cannot retrigger a toggle. Condition each prediction on remembered prior door state and occupancy, not on absolute frame number.",
    "plate_delayed": "Every occupancy edge is delivered after 1.5 seconds: transport delay, not debounce. Sampling may reveal the effect only at the next acquired frame. The control_horizon clip ends 0.5 seconds after occupancy and is explicitly inconclusive.",
    "plate_two_inputs": "The fixture requires A AND B. A crate supplies A while the actor independently supplies B. Main trials observe neither, A only, both, release B, neither, B only, then neither. The A-only control completes its horizon without opening.",
    "plate_timer_confound": "The door opens at 4 seconds regardless of any plate press. Independently varied waits supply early presses without an effect, and controls supply opening without a press. A press-causality rule should be rejected, not learned from the coincident trial.",
    "push_free": "Repeated contact-direction inputs displace a crate only into clear cells. Pause, retreat and no-contact controls separate actor commands from crate outcomes. Infer signed observed clearance, not clearance from a missing obstacle detection.",
    "push_directions": "Training includes right, left and up pushes; validation and final positive clips push down. All four physical contact orientations are represented with changed appearances and waits. No-contact controls still issue directional inputs without moving the crate.",
    "push_wall_blocked": "A visible wall stops the crate after an initial push. Repeated further attempts fail. A coordinate CLICK on that barrier removes it, and subsequent attempts succeed. Clicking elsewhere in controls does not remove the wall.",
    "push_immovable": "Main trials repeatedly fail to displace an object with visibly clear space beyond it; the actor can approach and retreat. Controls use a visually similar movable object. Failed observed displacement is evidence; a hidden mass or immovable label is not a recognizer fact.",
    "push_chain": "Two crates move together while the far destination is clear, then both stop at a wall. Clicking the wall allows a subsequent chain displacement. Controls begin with a blocked far end, even though the actor contacts the near crate normally.",
    "push_release": "The actor pushes, pauses, pushes again, then retreats and leaves the lane. The crate stops when not pushed. Temporary contact does not fuse identities or prove attachment, carry or an autonomous co-motion episode.",
    "push_inertial": "After the last impulse the crate has three further cell steps due at 0.5, 1.5 and 3.0 seconds, unless an occupied destination stops it sooner. Intervals lengthen before stopping. Sampling can defer observation of a due step to the next actual frame. This is a bounded synthetic dynamics convention, not a force/mass model. No-impulse controls never drift.",
    "push_onto_plate": "The actor pushes a crate onto a plate, leaves it occupied while retreating, then returns to push it off. Controls push along an adjacent lane. Preserve the independently measured input -> contact/displacement -> occupancy/plate appearance -> predicted response -> observed door appearance chain. A prediction cannot confirm its own intermediate link.",
}


def _plan_rows(plan: str) -> dict[str, tuple[str, str, str]]:
    rows = {}
    for line in plan.splitlines():
        match = re.match(r"^\| `([a-z_]+)` \| (.*?) \| (.*?) \| (.*?) \|$", line)
        if match:
            rows[match[1]] = (match[2], match[3], match[4])
    names = {case.name for case in event_cases()} | set(STEMS)
    if set(rows) != names:
        raise ValueError(f"Per-test plan coverage changed: missing={sorted(names - set(rows))}, extra={sorted(set(rows) - names)}")
    return rows


def _section(plan: str, heading: str, end: str) -> str:
    return plan.split(heading, 1)[1].split(end, 1)[0].strip()


def _clip_files(clip: Clip) -> tuple[dict[tuple[str, ...], bytes], dict[str, Any]]:
    prefix = ("recordings", GAME_ID, clip.name)
    logical = "/".join(prefix)
    reference = f"data/{logical}"
    files = {}
    frames = []
    moves = []
    for index, (receipt, png, oracle) in enumerate(clip.replay()):
        action = receipt.action if receipt else None
        data = receipt.data() if receipt else {}
        at = oracle["atSeconds"]
        digest = hashlib.sha256(png).hexdigest()
        files[(*prefix, str(index), "image.png")] = png
        files[(*prefix, str(index), "state.json")] = _json({
            "kind": "synthetic_action_test_frame", "game_id": GAME_ID, "game_directory": GAME_ID,
            "level": "1", "state": "NOT_FINISHED", "step_count": index,
            "incoming_action": action, "action_data": data,
            "action_directory": str(index) if index else None,
            "parent_node": f"../{index - 1}" if index else None,
            "action_path": [str(step) for step in range(1, index + 1)],
            "at_seconds": at, "recorded_at": FIXTURE_TIME, "image_hash": digest[:16],
        })
        moves.append({
            "index": index, "action": action, "data": data,
            "directory": f"{reference}/{index}", "state": "NOT_FINISHED", "level": "1",
            "recorded_at": FIXTURE_TIME, "at_seconds": at,
        })
        frames.append({"frameId": str(index), "sha256": digest, **oracle})
    world = clip.initial
    files[(*prefix, "evaluation.json")] = _json({
        "schemaVersion": 1, "suiteId": SUITE_ID, "testId": clip.stem,
        "partition": clip.partition, "recognizerStatus": "not_run",
        "origin": "synthetic_world_step_evaluator", "groundTruthIsRecognizerInput": False,
        "controlInterpretation": clip.description,
        "expectedAssessment": "inconclusive" if clip.partition == "inconclusive_control" else "requires_evaluation",
        "authoredWorld": {
            "mechanism": world.mechanism, "inertia": world.inertia,
            "immovable": sorted(world.immovable), "removableWalls": sorted(world.removable),
            "plateCells": world.plates, "doorCells": world.doors, "responseDelaySeconds": world.delay,
            "timerSeconds": world.timer,
            "wiring": ({"a": "far", "b": "near"} if world.mechanism == "unlinked"
                       else {key: "door" for key in world.plates}),
        },
        "fixtureConventions": {
            "status": "evaluator_only_not_a_runtime_predicate_schema",
            "occupancy": "actor_or_crate_cell_equals_plate_cell",
            "doors": "filled_red_closed_or_green_hollow_open",
            "motion": "one_grid_cell_per_directional_attempt_when_clear",
            "delayedResponse": "transport_delay_for_each_occupancy_edge",
            "inertia": "three_post_impulse_steps_at_0.5_1.5_3.0_seconds_unless_blocked",
            "canvas": {"width": SIZE[0], "height": SIZE[1], "cellPixels": CELL},
        },
        "frames": frames,
    })
    # Discovery marker follows the complete numbered frames and evaluator file.
    files[(*prefix, "recording.json")] = _json({
        "kind": "arc3_play_recording", "source": "synthetic_action_tests",
        "session_id": None, "game_id": GAME_ID, "game_directory": GAME_ID,
        "level": "1", "level_directory": reference,
        "started_at": FIXTURE_TIME, "updated_at": FIXTURE_TIME, "last_event": "fixture_created",
        "description": "Synthetic action-bearing visual sequence; evaluation is separate and has not run.",
        "fixture_suite": SUITE_ID, "moves": moves,
    })
    return files, {
        "visualSequenceId": logical, "label": clip.suffix.replace("_", " "),
        "partition": clip.partition, "frameCount": len(frames),
    }


def _recording_table(recordings: list[dict[str, Any]]) -> str:
    lines = [
        "## Loadable recordings", "",
        "Select **events_tests** in the ordinary Visual Sequence/recording selector.",
        "Frame `0` is the real baseline; all frames are ordinary numbered image/state contexts.",
        "Workspace switches expose the same stable recording identities.", "",
        "| Recording (logical Visual Sequence ID) | Partition | Frames |",
        "|---|---|---|",
    ]
    lines.extend(f"| `{item['visualSequenceId']}` | {item['partition']} | {item['frameCount']} |"
                 for item in recordings)
    return "\n".join(lines)


def _checkpoints(clips: list[Clip]) -> str:
    lines = [
        "## Per-clip evidence checkpoints", "",
        "These are evaluator checkpoints to compare against independently measured images,",
        "not accepted events or input facts. Read the predecessor before each listed frame;",
        "confirm a causal candidate only after its full response/hold/release horizon.",
        "Numbers are actual numbered source frames; `none` is not a runtime negative label.", "",
        "| Clip | Visible occupancy changes | Visible door changes | Crate displacement |",
        "|---|---|---|---|",
    ]
    for clip in clips:
        trace = [frame[2] for frame in clip.replay()]
        columns = []
        for field in ("plateOccupancy", "doorOpen", "crates"):
            changes = [str(index) for index in range(1, len(trace)) if trace[index][field] != trace[index - 1][field]]
            columns.append(", ".join(changes) or "none")
        lines.append(f"| {clip.suffix} | {' | '.join(columns)} |")
    return "\n".join(lines)


def recording_test_files() -> tuple[dict[tuple[str, ...], bytes], dict[str, Any]]:
    """Build a full publication before acquiring its shared write lock."""
    plan = PLAN_PATH.read_text(encoding="utf-8")
    rows = _plan_rows(plan)
    files, original = event_recording_files()
    clips = induction_clips()
    by_stem: dict[str, list[dict[str, Any]]] = {stem: [] for stem in STEMS}
    for clip in clips:
        outputs, recording = _clip_files(clip)
        if files.keys() & outputs.keys():
            raise ValueError("Duplicate recording output")
        files.update(outputs)
        by_stem[clip.stem].append(recording)
    tests = []

    def document(test_id: str, group: str, summary: str, recordings: list[dict[str, Any]], body: str) -> None:
        title = test_id.replace("_", " ").capitalize()
        documentation_file = f"documentation/{test_id}.md"
        text = (
            f"# {title}\n\n{summary}\n\n**Execution status: not run.**\n\n"
            f"{body}\n\n{MEMORY_PROTOCOL}\n\n{_recording_table(recordings)}\n\n"
            "## Source and preservation\n\n"
            "This test's saved documentation incorporates its exact row from the approved\n"
            "`EVENT_TEST_RECORDINGS_LOCAL_MEMORY_PLAN.md` (2026-09-12). Serving this page\n"
            "reads this file, not that standalone plan. The original 38 recordings,\n"
            "their images/states/manifests/oracles and `suite.json` are unchanged.\n"
            "Changed fixtures or documentation require an explicit versioned publication;\n"
            "the create-only generator refuses to overwrite differing files.\n"
        )
        files[("recordings", GAME_ID, "documentation", f"{test_id}.md")] = text.encode("utf-8")
        tests.append({
            "id": test_id, "group": group, "title": title, "summary": summary,
            "executionStatus": "not_run", "recordings": recordings,
            "documentationFile": documentation_file,
        })

    for case in event_cases():
        memory, evidence, caution = rows[case.name]
        recordings = [{
            "visualSequenceId": f"recordings/{GAME_ID}/{case.name}", "label": "Original event example",
            "partition": "event_baseline", "frameCount": len(case.frames),
        }]
        body = (
            f"## Local memory required for this test\n\n{memory}\n\n"
            f"## Measured new evidence and decision / episode timing\n\n{evidence}\n\n"
            f"## Required caution and fixture insufficiency\n\n{caution}\n\n"
            "These original frames contain only generic `FRAME` advances, not gameplay\n"
            "commands or measured force. Oracle `user_input` annotations cannot prove an\n"
            "attempt. Warm-up, causal-input and timing limitations above are intentionally\n"
            "preserved rather than repaired by rewriting the fixture. Group membership,\n"
            "lineage and appearance/state producer contracts are not supplied by names.\n\n"
            "## Induction support and counterexamples\n\n"
            "This is one original evaluation example, not an independent train/validation\n"
            "split or proof of a learned rule. Do not count adjacent frames as independent\n"
            "trials, auto-promote a detector, or claim held-out accuracy. Preserve unknown\n"
            "and insufficient-evidence outcomes. Additional versioned warm-ups, controls\n"
            "and held-out examples are required before making those claims.\n"
        )
        document(case.name, "Events", case.description, recordings, body)
    for stem in STEMS:
        trial, hypothesis, caution = rows[stem]
        plate = stem.startswith("plate_")
        memory = _section(plan, "### 5.1 What the student remembers", "### 5.2") if plate else _section(
            plan, "### 6.1 What the student remembers", "### 6.2")
        body = (
            f"## Controlled trial\n\n{trial}\n\n"
            f"## Earlier local memory for this family\n\n{memory}\n\n"
            f"## Measured evidence and candidate to test\n\n{hypothesis}\n\n"
            "This is the evaluator's learning target, not an initial accepted rule.\n\n"
            f"## Family controls, counterexamples and held-out variation\n\n{caution}\n\n"
            + "\n".join(f"- **{clip.suffix}**: {clip.description}" for clip in clips if clip.stem == stem)
            + "\n\n## Decision / episode timing and actual simulation\n\n"
            "Each world starts with a baseline and WAIT interval. Directional inputs attempt\n"
            "one 8-pixel cell step; blocked attempts remain in the trace without movement.\n"
            "CLICK receipts contain screen coordinates; only clicking an existing removable\n"
            "barrier removes it. No `PUSH_SUCCESS` or inferred outcome is recorded as input.\n"
            "Plates visibly retain an exposed occupancy border beneath an occupant; door\n"
            "filled/hollow appearance is observable. Cell-equality occupancy and these\n"
            "appearances are fixture conventions, not recognizer-supplied semantic facts.\n"
            "Pause, release and post-release windows remain separate observations.\n\n"
            + SIMULATION_NOTES[stem] + "\n\n"
            + _checkpoints([clip for clip in clips if clip.stem == stem]) + "\n\n" + LEARNING_PROTOCOL
        )
        document(stem, "Pressure plates" if plate else "Pushing", trial, by_stem[stem], body)
    index = {
        "schemaVersion": 1, "suiteId": SUITE_ID, "sourcePlanSha256": hashlib.sha256(plan.encode("utf-8")).hexdigest(),
        "tests": tests, "count": len(tests),
    }
    # Publishing the index last prevents discovery of a not-yet-written document.
    files[("recordings", GAME_ID, "tests.json")] = _json(index)
    return files, {
        "testCount": len(tests), "eventRecordingCount": len(original["cases"]),
        "inductionRecordingCount": len(clips),
        "eventFrameCount": original["frameCount"],
        "inductionFrameCount": sum(item["frameCount"] for values in by_stem.values() for item in values),
    }


def create_recording_tests(root: Path) -> dict[str, Any]:
    vision_data_root(root)
    files, counts = recording_test_files()
    return {**counts, **publish_recording_files(root, files)}


def main() -> None:
    result = create_recording_tests(shared_storage_path())
    print(json.dumps({"directory": str(shared_storage_path("recordings", GAME_ID)), **result}, indent=2))


if __name__ == "__main__":
    main()
