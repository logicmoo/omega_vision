"""Two action scripts over exactly the same fog-of-war observations."""

from dataclasses import replace
import hashlib
import json
from pathlib import Path

from omega_vision.inherited_source_overlay import shared_storage_path

from .event_recordings import GAME_ID, _json, publish_recording_files
from .visual_memory_recordings import Clip, _clip_files, visual_memory_clips

TEST_ID = "spotlight_action_modes"


def fog_action_clips() -> tuple[Clip, Clip]:
    source = next(clip for clip in visual_memory_clips()
                  if clip.family == "spotlight_scene" and clip.suffix == "train_a")
    movement, clicking = [], []
    previous = None
    for frame in source.frames:
        x, y = frame.oracle["apertureCenter"]
        if previous is None:
            move_action = click_action = None
            click_data = {}
        else:
            dx, dy = x - previous[0], y - previous[1]
            if bool(dx) == bool(dy):
                raise ValueError("The fog movement script requires exactly one changed axis per observation")
            move_action = "RIGHT" if dx > 0 else "LEFT" if dx < 0 else "DOWN" if dy > 0 else "UP"
            click_action, click_data = "CLICK", {"x": x, "y": y}
        movement.append(replace(frame, action=move_action, action_data={}))
        clicking.append(replace(frame, action=click_action, action_data=click_data))
        previous = (x, y)
    fingerprint = hashlib.sha256(b"".join(frame.png for frame in source.frames)).hexdigest()
    teacher = {
        **source.teacher, "visualFingerprint": fingerprint,
        "sharedVisualSource": "recordings/events_tests/spotlight_scene_train_a",
        "independentVisualTrial": False,
        "movementConvention": "one_waypoint_grid_step_in_named_direction; edge_spacing_is_clipped_to_viewport",
        "clickConvention": "place_aperture_at_clicked_pixel",
    }
    return (
        replace(source, family=TEST_ID, suffix="move", partition="action_contrast",
                description="Replay the serpentine RIGHT/DOWN/LEFT arrow script; each recorded push moves the fog aperture one waypoint.",
                frames=tuple(movement), teacher={**teacher, "inputMode": "directional_movement"}),
        replace(source, family=TEST_ID, suffix="click", partition="action_contrast",
                description="Replay clicks at the aperture's next position; observations are byte-identical to the movement variant.",
                frames=tuple(clicking), teacher={**teacher, "inputMode": "position_click"}),
    )


def fog_action_files() -> dict[tuple[str, ...], bytes]:
    files, recordings = {}, []
    clips = fog_action_clips()
    for clip in clips:
        generated, metadata = _clip_files(clip)
        files.update(generated)
        recordings.append({**metadata, "label": "Arrow movement" if clip.suffix == "move" else "Position clicking"})
    schedule = []
    for index, (move, click) in enumerate(zip(clips[0].frames, clips[1].frames, strict=True)):
        click_label = "baseline" if click.action is None else f"CLICK ({click.action_data['x']}, {click.action_data['y']})"
        schedule.append(f"| {index} | {move.action or 'baseline'} | {click_label} |")
    rows = "\n".join(schedule)
    document = f"""# Fog of war: movement and clicking over the same frames

These two 35-frame recordings contain **byte-identical PNG observations in the
same order**. Their input receipts differ: one replays a directional movement
script; the other clicks the next aperture position. No existing recording is changed.

## Scripted controls, not free play

Frame 0 is an observation with no input. Each subsequent movement frame records
one actual RIGHT, DOWN or LEFT push along the serpentine waypoint grid. Interior
waypoints are eight pixels apart; the last viewport-edge spacing is clipped to
seven pixels. The click variant records CLICK with explicit image x/y coordinates
for the same resulting aperture position. These are declared fixture control
conventions, not hidden answers exposed to the recognizer.

Step advances one recorded input and then reveals its resulting observation.
An explicitly requested full run follows that same script. Opening the view or
adding controls does not start either. Previous/next-frame inspection must be
distinguished from issuing a free directional action: going backward in recorded
history is not a simulated LEFT press. Show the actual recorded input beside the frame.

## Local memory and the current observation

Read the prior recording-local native checkpoint before processing each current
RGBA image. Alpha 255 is observed, including genuinely observed black; alpha 0
is unknown. Retain earlier revealed pixels when the fog moves away. Never fill
unobserved pixels from the evaluator's full scene or future frames. Causal source
hashes, frame order and native frame/STM references accompany the result.

The same pixels cannot establish whether movement or a click caused them.
That distinction comes from the explicit recorded input, not image-only deduction.
Image-only reconstruction should agree between variants at every prefix; an
action-aware learner may distinguish the input interfaces but cannot claim two
independent visual confirmations from these duplicate image traces. Both evaluator
files retain the same visual fingerprint and mark `independentVisualTrial: false`.

## Scoring and limits

Compare reconstructed known pixels with evaluator truth only after inference has
been frozen. Knowledge must never exceed the union of visibility observed so far.
Completion requires all 48x32 pixels known; missing visibility is not no-change.
This contrast is not held-out evidence of generalization, a learned game, or a
new environment control API. Native Run/Step remains a separate explicit action;
fixture publication itself has execution status **not run**.

No data is copied into workspace-owned stores. STM-to-LTM promotion requires a
separate explicit call. Nowhere remains browser RAM only.

## Recorded input schedule

| Result frame | Movement variant input | Clicking variant input |
|---|---|---|
{rows}

## Loadable recordings

- `recordings/events_tests/{TEST_ID}_move`: arrow movement, 35 frames.
- `recordings/events_tests/{TEST_ID}_click`: position clicking, 35 frames.

Both derive their visible frames from `spotlight_scene_train_a`. The original
movement-pointer recording and its history remain untouched. Recreate additively
with `python -m omega_vision.evaluation.fog_action_recordings`.
"""
    files[("recordings", GAME_ID, "documentation", f"{TEST_ID}.md")] = document.encode("utf-8")
    files[("recordings", GAME_ID, "fog_action_tests.json")] = _json({
        "schemaVersion": 1, "count": 1, "tests": [{
            "id": TEST_ID, "group": "Events", "title": "Fog of war: movement vs clicking",
            "summary": "One visible frame sequence, two explicit input scripts; reconstruct only observed pixels.",
            "executionStatus": "not_run", "documentationFile": f"documentation/{TEST_ID}.md",
            "recordings": recordings,
        }],
    })
    return files


def create_fog_action_recordings(root: Path) -> dict[str, int]:
    return {"testCount": 1, "recordingCount": 2, "frameCount": 70,
            **publish_recording_files(root, fog_action_files())}


if __name__ == "__main__":
    print(json.dumps(create_fog_action_recordings(shared_storage_path()), indent=2))
