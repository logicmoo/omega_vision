"""Create four additive, documented visual-memory input test families.

    python -m omega_vision.evaluation.visual_memory_recordings

Publishes only new recordings, documentation and visual_memory_tests.json.
No existing generator/index/document is rewritten; no recognition is executed.
"""

from __future__ import annotations

from dataclasses import dataclass
import hashlib
from io import BytesIO
import json
from pathlib import Path
from typing import Any

from PIL import Image, ImageDraw

from omega_vision.inherited_source_overlay import shared_storage_path, vision_data_root

from .event_recordings import FIXTURE_TIME, GAME_ID, _json, publish_recording_files

SUITE_ID = "visual-memory-recordings-v1"
FAMILY_IDS = ("color_band_cycle", "spotlight_scene", "occlusion_pole", "occlusion_large_object")
BACKGROUND = (12, 16, 24)
SIZE = (96, 64)


def png_bytes(image: Image.Image) -> bytes:
    stream = BytesIO()
    image.save(stream, format="PNG")
    return stream.getvalue()


@dataclass(frozen=True)
class Frame:
    png: bytes
    action: str | None
    action_data: dict[str, int]
    oracle: dict[str, Any]


@dataclass(frozen=True)
class Clip:
    family: str
    suffix: str
    partition: str
    description: str
    frames: tuple[Frame, ...]
    teacher: dict[str, Any]
    interval: float = 0.5

    @property
    def name(self) -> str:
        return f"{self.family}_{self.suffix}"


def _band_image(palette: tuple[tuple[int, int, int], ...], index: int,
                target: tuple[int, int, int, int], band_x: int) -> Image.Image:
    image = Image.new("RGB", SIZE, BACKGROUND)
    draw = ImageDraw.Draw(image)
    x0, y0, x1, y1 = target
    draw.rectangle((x0, y0, x1 - 1, y1 - 1), fill=palette[index])
    for order, color in enumerate(palette):
        y = 8 + order * 10
        draw.rectangle((band_x, y, band_x + 5, y + 5), fill=color)
    bottom = 10 + (len(palette) - 1) * 10
    draw.line((band_x + 10, 8, band_x + 10, bottom), fill=(215, 220, 228))
    draw.polygon(((band_x + 7, bottom - 3), (band_x + 13, bottom - 3), (band_x + 10, bottom + 2)),
                 fill=(215, 220, 228))
    return image


def _color_step(index: int, palette_size: int, target: tuple[int, int, int, int],
                point: tuple[int, int] | None) -> tuple[int, bool]:
    x0, y0, x1, y1 = target
    hit = point is not None and x0 <= point[0] < x1 and y0 <= point[1] < y1
    return ((index + 1) % palette_size if hit else index), hit


def _color_clips() -> list[Clip]:
    a = ((220, 60, 70), (55, 155, 235), (235, 195, 45), (90, 195, 100), (185, 85, 215))
    b = ((30, 205, 190), (240, 130, 50), (110, 120, 235), (220, 115, 170))
    c = ((125, 215, 40), (200, 105, 65), (100, 80, 200))
    definitions = (
        ("train_a", "training", a, (12, 25, 30, 39), 0, "cycle"),
        ("train_b", "training", (a[3], a[0], a[4], a[2], a[1]), (30, 18, 48, 32), 2, "cycle"),
        ("validation_a", "validation", (b[2], b[0], b[3], b[1]), (18, 33, 36, 47), 1, "cycle"),
        ("test_a", "test", (c[2], c[0], c[1]), (37, 39, 55, 53), 2, "cycle"),
        ("control_a", "training_control", a, (18, 18, 36, 32), 0, "outside"),
        ("control_boundary", "test_control", (b[1], b[3], b[0], b[2]), (36, 24, 54, 38), 3, "boundary"),
    )
    clips = []
    for variant, (suffix, partition, palette, target, initial_index, mode) in enumerate(definitions):
        band_x = 74 + variant % 2 * 2
        x0, y0, x1, y1 = target
        corners = [(x0, y0), (x1 - 1, y1 - 1), (x0, y1 - 1), (x1 - 1, y0),
                   ((x0 + x1) // 2, (y0 + y1) // 2)]
        outside = [(x0 - 1, y0), (x1, y1 - 1), (band_x + 2, 10), (0, 0)]
        if mode == "outside":
            clicks = outside + [(band_x + 3, 10 + order * 10) for order in range(len(palette))]
            description = "Only off-target and swatch clicks: the target keeps its initial color through the full clip."
        elif mode == "boundary":
            clicks = [point for inside, miss in zip(corners, outside + [(x0, y1)])
                      for point in (miss, inside)] + corners[:len(palette)]
            description = "Alternate one-pixel-outside misses with inclusive target-edge/corner hits, then complete a wrapping cycle."
        else:
            clicks = [outside[0], corners[0], outside[2]] + [
                corners[(step + 1) % len(corners)] for step in range(len(palette) + 2)
            ] + [outside[1]]
            description = "Varied target-interior/edge clicks advance the visible ordered band, including last-to-first wrap; outside/band clicks do nothing."
        frames = []
        index = initial_index
        for frame_index, point in enumerate([None, *clicks]):
            previous = index
            index, hit = _color_step(index, len(palette), target, point)
            image = _band_image(palette, index, target, band_x)
            frames.append(Frame(png_bytes(image), None if point is None else "CLICK",
                                {} if point is None else {"x": point[0], "y": point[1]},
                                {"frameId": str(frame_index), "targetIndex": index,
                                 "targetColor": palette[index], "nextColor": palette[(index + 1) % len(palette)],
                                 "hitTarget": hit, "wrapped": hit and previous == len(palette) - 1}))
        clips.append(Clip("color_band_cycle", suffix, partition, description, tuple(frames), {
            "palette": palette, "initialIndex": initial_index, "targetBounds": target,
            "bandX": band_x, "bandOrder": "top_to_bottom", "wrap": True,
            "source": "teacher_only_never_baseline_input",
        }))
    return clips


def _scene(variant: int) -> Image.Image:
    image = Image.new("RGB", (48, 32), (0, 0, 0))
    draw = ImageDraw.Draw(image)
    colors = (((230, 65, 75), (65, 165, 240), (235, 195, 50)),
              ((140, 210, 65), (205, 100, 210), (50, 200, 185)),
              ((230, 130, 50), (100, 115, 235), (200, 190, 85)),
              ((155, 90, 220), (55, 185, 115), (220, 135, 145)))[variant]
    shift = variant * 2
    draw.rectangle((4 + shift, 4, 11 + shift, 12), fill=colors[0])
    draw.rectangle((27 - shift, 8, 39 - shift, 20), outline=colors[1], width=2)
    draw.polygon(((7, 22), (22, 22), (22, 26), (12, 26), (12, 29), (7, 29)), fill=colors[2])
    draw.line((39, 25, 44, 29), fill=(180, 185, 195), width=2)
    return image


def _spotlight(scene: Image.Image, center: tuple[int, int], radius: int) -> Image.Image:
    observation = Image.new("RGBA", scene.size, (0, 0, 0, 0))
    for y in range(scene.height):
        for x in range(scene.width):
            if (x - center[0]) ** 2 + (y - center[1]) ** 2 <= radius ** 2:
                observation.putpixel((x, y), (*scene.getpixel((x, y)), 255))
    return observation


def _spotlight_clips() -> list[Clip]:
    xs, ys = (0, 8, 16, 24, 32, 40, 47), (0, 8, 16, 24, 31)
    scan = [(x, y) for row, y in enumerate(ys) for x in (xs if row % 2 == 0 else tuple(reversed(xs)))]
    definitions = (
        ("train_a", "training", 0, scan, 8),
        ("train_b", "training", 1, list(reversed(scan)), 8),
        ("validation_a", "validation", 2, scan[::2] + scan[1::2], 7),
        ("test_a", "test", 3, sorted(scan, key=lambda cell: (cell[0], cell[1])), 7),
        ("control_partial", "training_control", 0, [(0, 0), (8, 0), (8, 8), (0, 0), (8, 8), (8, 0), (0, 0)], 8),
        ("control_revisit", "test_control", 2, [(24, 16)] * 7, 7),
    )
    clips = []
    for suffix, partition, variant, centers, radius in definitions:
        scene = _scene(variant)
        frames = []
        known = set()
        for index, center in enumerate(centers):
            observed = _spotlight(scene, center, radius)
            visible = {(x, y) for y in range(scene.height) for x in range(scene.width)
                       if observed.getpixel((x, y))[3] == 255}
            known.update(visible)
            frames.append(Frame(png_bytes(observed), None if index == 0 else "MOVE_POINTER",
                                {} if index == 0 else {"x": center[0], "y": center[1]},
                                {"frameId": str(index), "apertureCenter": center, "visiblePixels": len(visible),
                                 "cumulativeKnownPixels": len(known), "completeCoverage": len(known) == scene.width * scene.height}))
        description = (
            "Complete circular-aperture scan of a static scene; accumulated observed pixels eventually cover the entire fixed camera."
            if "control" not in partition else
            "Partial scan with repeated visits: previously seen pixels persist, but unobserved scene cells must remain unknown."
        )
        clips.append(Clip("spotlight_scene", suffix, partition, description, tuple(frames), {
            "fullSceneRgb": [scene.getpixel((x, y)) for y in range(scene.height) for x in range(scene.width)],
            "width": scene.width, "height": scene.height,
            "radius": radius, "staticCamera": True, "sceneVariant": variant,
            "source": "teacher_only_full_scene_never_accumulator_input",
        }, interval=0.25))
    return clips


def _occlusion_clips(family: str) -> list[Clip]:
    large = family == "occlusion_large_object"
    mask = ("110000",) * 6 + ("111111",) * 2
    obstacle = (33, 9, 63, 39) if large else (30, 5, 42, 45)
    positions = list(range(12, 79, 6)) if large else list(range(18, 49, 2))
    step = 6 if large else 2
    hidden = [index for index, x in enumerate(positions) if obstacle[0] <= x and x + 6 <= obstacle[2]]
    assert len(hidden) == 4
    definitions = (
        ("train_a", "training", (45, 155, 240), False, False, 0),
        ("train_b", "training", (235, 150, 45), False, False, 3),
        ("validation_a", "validation", (75, 215, 150), True, False, 1),
        ("control_absence", "test_control", (225, 90, 180), False, True, 0),
    )
    clips = []
    for suffix, partition, color, reverse, absent_control, y_shift in definitions:
        body_mask = tuple(row[::-1] for row in mask) if reverse else tuple(reversed(mask)) if y_shift == 3 else mask
        bounds = ((SIZE[0] - obstacle[2], obstacle[1], SIZE[0] - obstacle[0], obstacle[3])
                  if reverse else obstacle)
        frames = []
        for index, x in enumerate(positions):
            x = SIZE[0] - 6 - x if reverse else x
            y = 20 + y_shift
            image = Image.new("RGB", SIZE, BACKGROUND)
            draw = ImageDraw.Draw(image)
            if not (absent_control and index in hidden):
                for dy, row in enumerate(body_mask):
                    for dx, occupied in enumerate(row):
                        if occupied == "1":
                            image.putpixel((x + dx, y + dy), color)
            if not absent_control:
                x0, y0, x1, y1 = bounds
                draw.rectangle((x0, y0, x1 - 1, y1 - 1), fill=(115, 95, 155) if large else (145, 150, 160))
                if large:
                    draw.line((x0 + 4, y0 + 4, x1 - 5, y0 + 4), fill=(170, 140, 200), width=2)
            visible = sum(image.getpixel((px, py)) == color
                          for py in range(image.height) for px in range(image.width))
            frames.append(Frame(png_bytes(image), None if index == 0 else "WAIT", {}, {
                "frameId": str(index), "actorId": "teacher_same_actor", "authoredPosition": (x, y),
                "visibleActorPixels": visible, "fullyHidden": visible == 0,
                "renderedActor": not (absent_control and index in hidden),
            }))
        description = (
            "The asymmetric actor vanishes for four samples without an intervening visible occluder, then returns; disappearance alone does not prove occlusion."
            if absent_control else
            "Observed approach, partial entry, exactly four consecutive fully hidden samples, partial exit and reappearance"
            + (" while traveling in the reversed direction with changed appearance." if reverse else ".")
        )
        clips.append(Clip(family, suffix, partition, description, tuple(frames), {
            "actorId": "teacher_same_actor", "actorColor": color, "actorMask": body_mask,
            "occluderBounds": None if absent_control else bounds,
            "velocityPixelsPerSecond": (-step if reverse else step) / 0.5,
            "expectedFullyHiddenFrameIds": [str(index) for index in hidden],
            "sameIdentityAcrossGap": True, "source": "teacher_only_hidden_geometry_not_observed",
        }))
    return clips


def visual_memory_clips() -> tuple[Clip, ...]:
    return tuple(_color_clips() + _spotlight_clips()
                 + _occlusion_clips("occlusion_pole") + _occlusion_clips("occlusion_large_object"))


def _clip_files(clip: Clip) -> tuple[dict[tuple[str, ...], bytes], dict[str, Any]]:
    prefix = ("recordings", GAME_ID, clip.name)
    identity = "/".join(prefix)
    reference = f"data/{identity}"
    files = {}
    moves = []
    oracles = []
    for index, frame in enumerate(clip.frames):
        digest = hashlib.sha256(frame.png).hexdigest()
        at = index * clip.interval
        files[(*prefix, str(index), "image.png")] = frame.png
        files[(*prefix, str(index), "state.json")] = _json({
            "kind": "synthetic_visual_memory_frame", "game_id": GAME_ID, "game_directory": GAME_ID,
            "level": "1", "state": "NOT_FINISHED", "step_count": index,
            "incoming_action": frame.action, "action_data": frame.action_data,
            "action_directory": str(index) if index else None,
            "parent_node": f"../{index - 1}" if index else None,
            "action_path": [str(step) for step in range(1, index + 1)],
            "at_seconds": at, "recorded_at": FIXTURE_TIME, "image_hash": digest[:16],
        })
        moves.append({
            "index": index, "action": frame.action, "data": frame.action_data,
            "directory": f"{reference}/{index}", "state": "NOT_FINISHED", "level": "1",
            "at_seconds": at, "recorded_at": FIXTURE_TIME,
        })
        oracles.append({**frame.oracle, "atSeconds": at, "sha256": digest})
    files[(*prefix, "evaluation.json")] = _json({
        "schemaVersion": 1, "suiteId": SUITE_ID, "testId": clip.family, "partition": clip.partition,
        "description": clip.description, "recognizerStatus": "not_run",
        "groundTruthIsRecognizerInput": False, "teacher": clip.teacher, "frames": oracles,
        "baselineStatus": "fixture_unit_baseline_only_not_workbench_execution",
    })
    files[(*prefix, "recording.json")] = _json({
        "kind": "arc3_play_recording", "source": "synthetic_visual_memory_tests",
        "session_id": None, "game_id": GAME_ID, "game_directory": GAME_ID,
        "level": "1", "level_directory": reference,
        "started_at": FIXTURE_TIME, "updated_at": FIXTURE_TIME, "last_event": "fixture_created",
        "description": "Synthetic visual observation sequence; expected results are separate and recognition has not run.",
        "fixture_suite": SUITE_ID, "moves": moves,
    })
    return files, {"visualSequenceId": identity, "label": clip.suffix.replace("_", " "),
                   "partition": clip.partition, "frameCount": len(clip.frames)}


COMMON_DOCS = """## Local memory and evidence boundary

Read only the eligible earlier history of this recording before processing the
current image: prior Shape/Object observations, validated temporal/event prefix
and explicitly eligible recording-level STM. Frame `0` is the actual baseline,
not proof of prior stationary motion or nonexistence. Freeze earlier evidence and
predictions before observing the next image. Preserve stable observed identities,
alternative correspondences and the distinction between observed and projected
geometry. Use `state.json.at_seconds`, not the fixed synthetic fixture timestamp.

Predictions are not current observations; a later confirmation cannot backdate
knowledge. Unknown evidence is not false and does not close a relation episode.
Any memory entry or approved rule needs source-frame/version and publication
cutoffs. The standalone baselines here use explicit in-process memory only; they
do not read or write Workbench memory, create predicates, promote rules, merge
recording STM, or relax tracker lifetime/access checks. Nowhere stays browser RAM
only. Cross-recording baseline trials are explicitly selected unit experiments,
not automatic cross-recording memory inheritance or deployment.

## Oracle separation and execution status

**Execution status: not run.** These are input fixtures, not Workbench detector or
learner passes. Executable fixture-unit baselines are specifically identified
below; their checks do not set this UI status or demonstrate full semantic-stage
integration. Names, this documentation, catalog metadata and `evaluation.json`
are evaluator information, never recognizer facts. Palette indices, next colors,
hidden full scenes, masks, roles, intended identity and hidden object positions
stay in evaluator JSON. Frame states contain only ordinary acquisition metadata
and actual input receipts. Independent observations must confirm effects.
"""

FAMILY_DOCS = {
    "color_band_cycle": (
        "Click-driven color cycle from a visible ordered band",
        "Predict target color from the visible swatch order and observed click effects, including last-to-first wrap.",
        """## Task and newly measured evidence

A single solid colored target sits to the left of a visible vertical color band.
The drawn arrow orders the band top to bottom. A CLICK anywhere on a target pixel,
including its edges/corners, advances one swatch; the last wraps to the first.
Background, band and one-pixel-outside clicks do nothing. The fixture teacher uses
a palette to render the world, but the baseline never receives it.

## Executable observation-only baseline

`omega_vision.evaluation.visual_memory_baselines.ColorBandMemory` extracts exact
RGB connected components from the PNG itself. Its declared layout conventions
are a majority-color uniform background, one large solid rectangular target,
and at least two smaller equal solid square swatches in one vertical column to
the right, with unique colors and one exact target-color match. It does not
hard-code RGB order, target coordinates, a palette length or an oracle index.
This is a constrained raster-layout baseline, not general object recognition.

Call `prediction = memory.predict(previous_png, "CLICK", {"x": x, "y": y})`
before acquiring/reading the next image, then
`assessment = memory.observe(prediction, current_png)`. The prediction is immutable.
The first on-target click is unknown until a real earlier before/click/after
transition establishes the modular step. Later predictions use that retained
observed step plus the currently visible band/current target color. Observed
successor evidence retains source image hashes and click coordinates; replaying
the same evidence does not multiply support. Conflicting observed steps remove
the single-step prediction rather than silently select a convenient answer.
No-op off-target prediction uses measured hit geometry, not an oracle hit flag.

## Controls, held-out trials and inference limits

Training changes palette order and target placement. Validation and final clips
use previously unseen colors/orderings. Boundary controls alternate true edge
hits with adjacent misses; no-target controls click swatches/background only.
Keep step evidence from training frozen for the held-out predictions: do not
learn the held-out outcome before scoring it. Use
`memory.observe(prediction, current_png, learn=False)` throughout held-out clips
to keep their outcomes out of training evidence. Last-to-first wrap is approved
fixture behavior, not an invented non-wrapping terminal state.

The baseline does not infer arbitrary UI semantics, antialiasing, multiple
targets, nonuniform backgrounds, hidden palettes or arbitrary band orientation.
Unknown first-click predictions are reported separately, not counted as passes.
No new registered event predicate or runtime induction stage is introduced.
""",
    ),
    "spotlight_scene": (
        "Reconstruct a static scene through a moving spotlight",
        "Retain previously observed pixels while a circular sensor aperture moves across a fixed camera.",
        """## Task and newly measured evidence

The underlying 48x32 scene and camera are static. A circular spotlight samples
different regions through actual MOVE_POINTER x/y receipts. Each PNG is RGBA:
alpha 255 marks observed pixels inside the aperture, **including observed black**;
alpha 0 marks unknown pixels outside it. Outside RGB channels are also zero, so
hidden scene colors are not smuggled beneath transparency. Only the evaluator
contains the full scene; there is no extra root preview or hidden-scene PNG.

## Executable observation-only memory

`omega_vision.evaluation.visual_memory_baselines.SpotlightMemory` accepts only
individual current RGBA PNG bytes. `memory.observe(current_png)` unions visible
pixels with earlier known pixels; `memory.image()` returns a copy of accumulated
RGBA memory. Black with alpha 255 is known; black with alpha 0 remains unknown.
Previously seen pixels persist after the spotlight moves, repeat observations
are idempotent, and no lookahead or hidden-scene read is possible through this API.
The accumulator checks the entire observation for contradictory known pixels
before accepting any new pixels. Different dimensions, nonbinary visibility or
conflicting static-scene evidence require an error, not a silent memory rewrite.

## Completion, controls and held-out scene

Complete scans use at most 35 frames and eventually reveal every pixel. Compare
the accumulated RGB image to evaluator ground truth only when the union-known
mask has full coverage. Earlier and partial scans must preserve unknown cells.
Partial/revisit controls never complete the scene; repeated visits cannot create
knowledge of unseen pixels. Validation changes both scene and scan ordering;
the final test changes the scene again. Start a fresh accumulator per scene.

Reconstruction is exact registered-pixel accumulation, not object completion,
SLAM, camera-motion compensation or general temporal recognition. Moving the
aperture does not mean objects appeared, disappeared, were created or destroyed.
The Workbench's stronger object/event-memory interpretation remains untested;
this fixture-unit accumulator does not claim that pipeline is implemented.
""",
    ),
    "occlusion_pole": (
        "Four fully hidden frames behind a slender pole",
        "Retain an asymmetric actor's identity and motion hypothesis across exactly four completely hidden samples.",
        """## Geometry and actual visible evidence

An asymmetric 6x8 L-shaped actor moves two pixels per sampled WAIT behind a
12-pixel-wide opaque vertical pole, all in a fixed 96x64 view. Forward actor
left edges are 18,20,...,48; the pole covers x=30 through 41. Full hiding occurs
only at left edges 30,32,34,36: frames **6,7,8,9**, four consecutive samples with
exactly zero actor-colored pixels. Frames 4,5 and 10,11 are partial entry/exit,
not part of the four fully hidden frames. Earlier fully visible observations
establish velocity from real acquisition times; later full views show emergence.

## Memory, prediction and decision timing

Freeze the previous visible mask, color/asymmetry, stable track alternatives,
measured approach velocity and pole silhouette before each new frame. During
frames 6-9 retain the last observation and a projected-position hypothesis.
Projected hidden masks/positions are **not observed facts**. Partial emergence
supplies new evidence; independently match it using appearance and the motion
window rather than creating a new identity by default or copying the teacher ID.
Occlusion is a supported explanation only with compatible visible occluder
geometry and later evidence; preserve the distinction between event evidence
time and later decision time. Do not close an episode because visibility is unknown.

## Controls, held-out variation and limits

Training changes color, vertical position and asymmetric appearance; validation
reverses travel and changes appearance. The absence control removes the actor
for the same four samples with **no visible occluder**. That control is unexplained
missing/reappearance evidence, not automatically pole occlusion or destruction.
Teacher identity remains one entity across the gap for scoring only.

No tracker or occlusion detector is implemented by this fixture. Existing tracker
lifetime and typed identity/depth capabilities may not support the full gap;
report unsupported/unknown behavior honestly. Do not weaken lifetime/access
checks, copy oracle poses into memory, or advertise an automatic identity pass.
""",
    ),
    "occlusion_large_object": (
        "Four fully hidden frames behind a large opaque object",
        "Separate observed approach/emergence from predicted hidden motion through a larger occluder's footprint.",
        """## Geometry and actual visible evidence

An asymmetric 6x8 L-shaped actor moves six pixels per WAIT behind a substantially
larger 30x30 opaque object in a fixed 96x64 scene. Forward actor left edges are
12,18,...,78; the occluder covers x=33 through 62. Frame **3** (left edge 30) is
partial entry; frames **4,5,6,7** (36,42,48,54) are exactly four completely hidden
samples; frame **8** (left edge 60) is partial exit. All fully hidden frames have
zero actor-colored pixels. Several earlier full observations establish approach
velocity; later full views provide reappearance evidence.

## Earlier memory and new observations

Remember the last independently observed asymmetric shape/color and identity
alternatives, velocity with acquisition-time references, occluder geometry and
the active visibility hypothesis. Advance only a predicted hidden position
through frames 4-7; do not present it as a measured position or learned fact.
Emerging partial/full pixels must independently confirm correspondence before
retaining a specific identity. Event evidence time can precede decision time;
later confirmation cannot rewrite the earlier state as if the future were known.

## Controls, held-out variation and limits

Training changes appearance and vertical location; validation reverses motion.
The no-occluder absence control has the same four zero-visible samples without
an object covering the predicted path: disappearance alone cannot prove occlusion.
The evaluator's stable actor identity and hidden poses are never recognizer input.

This documents intended memory behavior, not an implemented general tracker or
successful Workbench semantic recognition. Lifetime, depth, amodal shape and
reidentification support may be unavailable. Keep ambiguities/unknown outcomes;
do not relax tracker/access checks or automatically create/promote rules. Large
opaque coverage is not a reason to claim physical destruction and recreation.
""",
    ),
}


def visual_memory_files() -> tuple[dict[tuple[str, ...], bytes], dict[str, Any]]:
    clips = visual_memory_clips()
    files = {}
    recordings = {family: [] for family in FAMILY_IDS}
    for clip in clips:
        outputs, metadata = _clip_files(clip)
        if files.keys() & outputs.keys():
            raise ValueError("Duplicate visual-memory fixture output")
        files.update(outputs)
        recordings[clip.family].append(metadata)
    tests = []
    for family in FAMILY_IDS:
        title, summary, body = FAMILY_DOCS[family]
        table = "\n".join(
            f"| `{item['visualSequenceId']}` | {item['partition']} | {item['frameCount']} |"
            for item in recordings[family]
        )
        notes = "\n".join(f"- **{clip.suffix}**: {clip.description}" for clip in clips if clip.family == family)
        documentation = (
            f"# {title}\n\n{summary}\n\n{body}\n\n{COMMON_DOCS}\n\n"
            f"## Individual clip intent\n\n{notes}\n\n"
            "## Loadable recordings\n\n"
            "Choose events_tests in the ordinary recording selector. Numbered frame `0`\n"
            "is the baseline; no extra root `image` preview is part of the sequence.\n"
            "Workspace switches expose the same shared recordings and stable identities.\n\n"
            "| Logical Visual Sequence ID | Partition | Frames |\n|---|---|---|\n"
            f"{table}\n\n"
            "## Reproduction and preservation\n\n"
            "`python -m omega_vision.evaluation.visual_memory_recordings` is create-only,\n"
            "idempotent and refuses differing existing files. It publishes this independent\n"
            "four-test index as `visual_memory_tests.json`, not by editing `tests.json`.\n"
            "All prior recordings and saved documentation are preserved. No GET generates\n"
            "fixtures or changes Save To, Look In, memory, preferences or execution status.\n"
        )
        files[("recordings", GAME_ID, "documentation", f"{family}.md")] = documentation.encode("utf-8")
        tests.append({
            "id": family, "group": "Events", "title": title, "summary": summary,
            "executionStatus": "not_run", "recordings": recordings[family],
            "documentationFile": f"documentation/{family}.md",
        })
    files[("recordings", GAME_ID, "visual_memory_tests.json")] = _json({
        "schemaVersion": 1, "suiteId": SUITE_ID, "count": len(tests), "tests": tests,
    })
    return files, {
        "testCount": len(tests), "recordingCount": len(clips),
        "frameCount": sum(len(clip.frames) for clip in clips),
        "families": {family: {"recordings": len(recordings[family]),
                              "frames": sum(item["frameCount"] for item in recordings[family])}
                     for family in FAMILY_IDS},
    }


def create_visual_memory_recordings(root: Path) -> dict[str, Any]:
    vision_data_root(root)
    files, counts = visual_memory_files()
    return {**counts, **publish_recording_files(root, files)}


def main() -> None:
    print(json.dumps({
        "directory": str(shared_storage_path("recordings", GAME_ID)),
        **create_visual_memory_recordings(shared_storage_path()),
    }, indent=2))


if __name__ == "__main__":
    main()
