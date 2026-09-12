"""Additive teleporter and right-arrow/gravity input fixtures; no runtime stages.

    python -m omega_vision.evaluation.action_mechanism_recordings
"""

from __future__ import annotations

from collections import Counter
from dataclasses import dataclass
import hashlib
from io import BytesIO
import json
import math
from pathlib import Path
from typing import Any

from PIL import Image, ImageDraw

from omega_vision.inherited_source_overlay import shared_storage_path, vision_data_root

from .event_recordings import FIXTURE_TIME, GAME_ID, _json, publish_recording_files

SIZE = (96, 64)
BACKGROUND = (12, 16, 24)
INTERVAL = 0.25
SUITE_ID = "action-mechanism-recordings-v1"
FAMILIES = ("teleporter", "stairs_gravity")
ACTOR_MASK = ("110000",) * 6 + ("111111",) * 2
CELL = 4
RGB = tuple[int, int, int]


def _png(image: Image.Image) -> bytes:
    stream = BytesIO()
    image.save(stream, format="PNG")
    return stream.getvalue()


@dataclass(frozen=True)
class Frame:
    png: bytes
    action: str | None
    oracle: dict[str, Any]


@dataclass(frozen=True)
class Clip:
    family: str
    suffix: str
    partition: str
    description: str
    frames: tuple[Frame, ...]
    teacher: dict[str, Any]

    @property
    def name(self) -> str:
        revision = "_lines_v2" if self.family == "teleporter" and self.teacher.get("gateStyle") == "striped_double_lines_v2" else ""
        return f"{self.family}_{self.suffix}{revision}"


@dataclass
class PortalWorld:
    actor: tuple[int, int] | None
    actor_color: RGB
    gates: dict[str, tuple[int, int, RGB]]
    links: dict[str, str]
    occluder: tuple[int, int, int, int] | None
    delay: int = 0
    remaining: int = 0
    pending: tuple[int, int] | None = None
    transit_count: int = 0
    last_event: str | None = None
    gate_style: str = "striped_double_lines_v2"

    def step(self, action: str | None) -> None:
        if action not in {None, "RIGHT", "LEFT"}:
            raise ValueError("Portal fixtures accept actual LEFT/RIGHT inputs or a sensor-only tick")
        self.last_event = None
        if self.remaining:
            self.remaining -= 1
            if self.remaining == 0:
                self.actor, self.pending = self.pending, None
                self.last_event = "arrival"
            return
        if action is None:
            return
        dx = 2 if action == "RIGHT" else -2
        x, y = self.actor
        next_x = max(0, min(SIZE[0] - 6, x + dx))
        previous_center, new_center = x + 3, next_x + 3
        self.actor = next_x, y
        for name, (gx, gy, _) in self.gates.items():
            crossed = previous_center < gx <= new_center if dx > 0 else new_center <= gx < previous_center
            if crossed and abs(y + 4 - gy) <= 4 and name in self.links:
                destination = self.links[name]
                target_x, target_y, _ = self.gates[destination]
                arrival = (target_x + (8 if dx > 0 else -8) - 3, target_y - 4)
                self.transit_count += 1
                self.last_event = f"departure:{name}:{destination}"
                if self.delay:
                    self.actor = None
                    self.pending = arrival
                    self.remaining = self.delay
                else:
                    self.actor = arrival
                break

    def render(self) -> bytes:
        image = Image.new("RGB", SIZE, BACKGROUND)
        draw = ImageDraw.Draw(image)
        for gx, gy, color in self.gates.values():
            if self.gate_style == "outline_v1":
                draw.rectangle((gx - 3, gy - 8, gx + 2, gy + 7), outline=color, width=1)
            elif self.gate_style == "striped_double_lines_v2":
                for offset in (-5, 3):
                    draw.rectangle((gx + offset, gy - 10, gx + offset + 1, gy + 9), fill=color)
                for offset in (-6, -1, 4):
                    draw.line((gx - 3, gy + offset, gx + 2, gy + offset + 3), fill=(235, 240, 245), width=1)
            else:
                raise ValueError("Unknown portal fixture gate style")
        if self.actor is not None:
            x, y = self.actor
            for dy, row in enumerate(ACTOR_MASK):
                for dx, occupied in enumerate(row):
                    if occupied == "1":
                        image.putpixel((x + dx, y + dy), self.actor_color)
        if self.occluder is not None:
            x0, y0, x1, y1 = self.occluder
            draw.rectangle((x0, y0, x1 - 1, y1 - 1), fill=(110, 115, 130))
        return _png(image)

    def frame(self, action: str | None) -> Frame:
        png = self.render()
        with Image.open(BytesIO(png)) as image:
            count = sum(image.getpixel((x, y)) == self.actor_color
                        for y in range(image.height) for x in range(image.width))
        return Frame(png, action, {
            "actorId": "teacher_same_actor", "authoredActorPosition": self.actor,
            "visibleActorPixels": count, "transitCount": self.transit_count,
            "pendingDestination": self.pending, "remainingTransitTicks": self.remaining,
            "mechanismEvent": self.last_event,
        })


def _portal_clips(revision: int = 2) -> list[Clip]:
    if revision not in {1, 2}:
        raise ValueError("Portal fixture revisions are explicitly versioned")
    definitions = (
        ("train_a", "training", 0, False, False, False),
        ("train_delayed", "training", 4, False, False, False),
        ("validation_reverse", "validation", 4, True, False, False),
        ("test_layout", "test", 0, False, False, False),
        ("control_near_miss", "training_control", 0, False, True, False),
        ("control_decorative", "test_control", 0, False, False, True),
    )
    actor_colors = ((45, 155, 240), (235, 155, 45), (70, 210, 150),
                    (230, 90, 165), (145, 125, 235), (215, 205, 65))
    clips = []
    for variant, (suffix, partition, delay, reverse, near_miss, decorative) in enumerate(definitions):
        source_x, target_x = ((48, 80) if suffix == "test_layout" else (44, 78))
        actor_y = 24 + (4 if suffix == "test_layout" else 0)
        gates = {"a": (source_x, actor_y + 4, (210, 70, 210)),
                 "b": (target_x, actor_y + 4, (55, 215, 220))}
        occluder = (18, 16, 30, 42)
        start_x = 4
        direction = "RIGHT"
        if reverse:
            gates = {key: (SIZE[0] - x, y, color) for key, (x, y, color) in gates.items()}
            occluder = (SIZE[0] - occluder[2], occluder[1], SIZE[0] - occluder[0], occluder[3])
            start_x, direction = SIZE[0] - 6 - start_x, "LEFT"
        world = PortalWorld((start_x, 48 if near_miss else actor_y), actor_colors[variant],
                            gates, {} if decorative else {"a": "b", "b": "a"}, occluder, delay,
                            gate_style="outline_v1" if revision == 1 else "striped_double_lines_v2")
        teacher = {
            "actorId": "teacher_same_actor", "actorColor": world.actor_color, "actorMask": ACTOR_MASK,
            "initialPosition": world.actor, "gates": gates, "portalLinks": dict(world.links),
            "transitHiddenFrames": delay, "occluderBounds": occluder,
            "source": "teacher_only_links_destinations_and_hidden_state",
        }
        frames = [world.frame(None)]

        def advance(action: str | None) -> None:
            world.step(action)
            frames.append(world.frame(action))

        def until_transit(action: str, target_count: int) -> None:
            for _ in range(45):
                if world.transit_count >= target_count:
                    break
                advance(action)
            else:
                raise ValueError("The authored action trace never entered its intended portal")
            while world.remaining:
                advance(None)

        if near_miss or decorative:
            for _ in range(40):
                advance("RIGHT")
            description = (
                "Move below both visible gate apertures without entering; the actor traverses intervening pixels normally."
                if near_miss else
                "Cross visually identical but unlinked decorative gates: continuous ordinary travel, not a remote jump. The earlier panel still gives normal occlusion."
            )
        else:
            until_transit(direction, 1)
            advance(direction)
            opposite = "LEFT" if direction == "RIGHT" else "RIGHT"
            until_transit(opposite, 2)
            until_transit(direction, 3)
            advance(direction)
            advance(direction)
            description = (
                "First pass behind a normal opaque panel for four fully hidden frames at the observed speed; then enter a line gate and appear remotely. "
                + ("Portal transit itself adds four missing frames before each remote arrival. " if delay else
                   "Portal transit is immediate between observations, without an extra fully missing sample. ")
                + "Return through the second gate and repeat the first pairing, allowing an earlier observed association to predict the third transit."
                + (" Travel is reversed and the actor's appearance changes." if reverse else "")
            )
        if revision == 2:
            teacher["gateStyle"] = "striped_double_lines_v2"
            teacher["fixtureRevision"] = 2
            description += " Both devices have paired colored rails and three contrasting diagonal stripe strokes; decorative controls retain those same visible cues without a working link."
        clips.append(Clip("teleporter", suffix, partition, description, tuple(frames), teacher))
    return clips


def floor_profile(treads: tuple[int, ...], drops: tuple[int, ...], start_height: int) -> tuple[int, ...]:
    if sum(treads) != SIZE[0] // CELL or any(width not in {2, 3} for width in treads):
        raise ValueError("Stair treads must span the viewport in widths of two or three cells")
    if len(drops) != len(treads) - 1 or any(drop not in {0, 1, 2} for drop in drops):
        raise ValueError("Drops are explicit zero/one/two-cell fixture geometry")
    heights = []
    height = start_height
    for index, width in enumerate(treads):
        heights.extend([height] * width)
        if index < len(drops):
            height += drops[index] * CELL
    if min(heights) < CELL or max(heights) > SIZE[1] - CELL:
        raise ValueError("All supporting surfaces must remain visibly inside the viewport")
    return tuple(heights)


@dataclass
class StairsWorld:
    floor: tuple[int, ...]
    x: int
    y: int
    color: RGB
    vertical_velocity: int = 0
    barrier_x: int = SIZE[0] - CELL

    def solid(self, x: int, y: int) -> bool:
        if not (0 <= x < SIZE[0] and 0 <= y < SIZE[1]):
            return True
        return x >= self.barrier_x or y >= self.floor[x // CELL]

    def collides(self, x: int, y: int) -> bool:
        return any(self.solid(px, py) for py in range(y, y + CELL) for px in range(x, x + CELL))

    def supported(self) -> bool:
        return self.collides(self.x, self.y + 1)

    def step(self, action: str | None) -> None:
        if action not in {None, "RIGHT"}:
            raise ValueError("Stairs accept RIGHT only; sensor-only frames carry no command")
        if action == "RIGHT":
            for _ in range(CELL):
                if self.collides(self.x + 1, self.y):
                    break
                self.x += 1
        if self.supported():
            self.vertical_velocity = 0
            return
        self.vertical_velocity = min(self.vertical_velocity + 1, CELL)
        for _ in range(self.vertical_velocity):
            if self.collides(self.x, self.y + 1):
                self.vertical_velocity = 0
                break
            self.y += 1
        if self.supported():
            self.vertical_velocity = 0

    def frame(self, action: str | None) -> Frame:
        image = Image.new("RGB", SIZE, BACKGROUND)
        draw = ImageDraw.Draw(image)
        for column, top in enumerate(self.floor):
            x = column * CELL
            draw.rectangle((x, top, x + CELL - 1, SIZE[1] - 1), fill=(115, 125, 135))
            draw.line((x, top, x + CELL - 1, top), fill=(175, 185, 195))
        draw.rectangle((self.barrier_x, 4, SIZE[0] - 1, SIZE[1] - 1), fill=(190, 120, 95))
        draw.rectangle((self.x, self.y, self.x + CELL - 1, self.y + CELL - 1), fill=self.color)
        draw.point((self.x + 1, self.y + 1), fill=(235, 240, 245))
        return Frame(_png(image), action, {
            "actorId": "teacher_same_actor", "authoredPosition": (self.x, self.y),
            "verticalVelocityPixelsPerTick": self.vertical_velocity, "supported": self.supported(),
        })


def _stairs_clips() -> list[Clip]:
    a = (3, 2, 3, 2, 3, 2, 3, 3, 3)
    b = (2, 3, 2, 3, 2, 3, 2, 3, 2, 2)
    c = (2, 2, 3, 2, 3, 2, 3, 2, 2, 3)
    d = (3, 3, 2, 2, 3, 3, 2, 3, 3)
    definitions = (
        ("train_a", "training", a, (1,) * 8, 16, False),
        ("train_b", "training", b, (1,) * 9, 12, False),
        ("validation_pattern", "validation", c, (2,) + (1,) * 8, 12, False),
        ("test_drops", "test", d, (1, 2, 1, 1, 2, 1, 1, 1), 12, False),
        ("control_flat", "training_control", a, (0,) * 8, 24, False),
        ("control_pause_fall", "test_control", c, (2,) + (1,) * 8, 12, True),
    )
    colors = ((45, 155, 240), (225, 165, 50), (65, 210, 140),
              (220, 90, 180), (150, 130, 230), (65, 195, 205))
    clips = []
    for variant, (suffix, partition, treads, drops, start, pause) in enumerate(definitions):
        floor = floor_profile(treads, drops, start)
        x = (treads[0] - 1) * CELL if pause else CELL
        world = StairsWorld(floor, x, start - CELL, colors[variant])
        frames = [world.frame(None)]

        def advance(action: str | None) -> None:
            world.step(action)
            frames.append(world.frame(action))

        if pause:
            advance("RIGHT")
            for _ in range(8):
                advance(None)
            description = "One RIGHT leaves a ledge, then no commands are issued: sensor-only frames show continued accelerating fall and landing at unchanged x."
        else:
            for _ in range(24):
                advance("RIGHT")
                while not world.supported():
                    advance(None)
            description = (
                "Only RIGHT attempts move along a flat supported floor; no vertical motion occurs. Three final RIGHT attempts meet the visible barrier."
                if suffix == "control_flat" else
                "Only RIGHT inputs traverse varied two/three-cell treads; gravity and collision determine descent during input and sensor-only frames. Three final RIGHT attempts remain blocked by the visible right-hand barrier."
            )
        clips.append(Clip("stairs_gravity", suffix, partition, description, tuple(frames), {
            "actorId": "teacher_same_actor", "actorColor": world.color, "actorSizePixels": CELL,
            "treadsInCells": treads, "dropsInCells": drops, "floorTopPixels": floor,
            "barrierX": world.barrier_x, "initialPosition": frames[0].oracle["authoredPosition"],
            "gravityPixelsPerTickSquared": 1, "terminalVelocityPixelsPerTick": CELL,
            "source": "teacher_only_floor_map_and_dynamics_not_detector_input",
        }))
    return clips


def action_mechanism_clips() -> tuple[Clip, ...]:
    return tuple(_portal_clips() + _stairs_clips())


@dataclass(frozen=True)
class ObservedGate:
    signature: RGB
    center: tuple[int, int]


@dataclass(frozen=True)
class ObservedActor:
    signature: RGB
    center: tuple[int, int]


def _portal_pixels(png: bytes) -> tuple[tuple[ObservedGate, ...], ObservedActor | None]:
    """Read striped double rails (or legacy outlines) and one full 6x8 L."""
    with Image.open(BytesIO(png)) as source:
        if source.mode != "RGB":
            raise ValueError("Portal baseline requires a fully observed RGB viewport")
        image = source.convert("RGB")
    raw = image.tobytes()
    colors = list(zip(raw[0::3], raw[1::3], raw[2::3]))
    background, count = Counter(colors).most_common(1)[0]
    if count <= len(colors) // 2:
        raise ValueError("Portal baseline needs a majority-color uniform background")
    remaining = {(index % image.width, index // image.width)
                 for index, color in enumerate(colors) if color != background}
    gates, actors, rails = [], [], []
    while remaining:
        first = min(remaining, key=lambda point: (point[1], point[0]))
        color = image.getpixel(first)
        component, pending = {first}, [first]
        remaining.remove(first)
        while pending:
            x, y = pending.pop()
            for point in ((x - 1, y), (x + 1, y), (x, y - 1), (x, y + 1)):
                if point in remaining and image.getpixel(point) == color:
                    remaining.remove(point)
                    component.add(point)
                    pending.append(point)
        xs, ys = zip(*component)
        left, top, width, height = min(xs), min(ys), max(xs) - min(xs) + 1, max(ys) - min(ys) + 1
        if (width, height, len(component)) == (6, 16, 40):
            outline = {(x, y) for y in range(top, top + 16) for x in range(left, left + 6)
                       if x in {left, left + 5} or y in {top, top + 15}}
            if component == outline:
                gates.append(ObservedGate(color, (left + 3, top + 8)))
        elif (width, height, len(component)) == (2, 20, 40):
            rails.append((color, left, top))
        elif (width, height, len(component)) == (6, 8, 24):
            actors.append(ObservedActor(color, (left + 3, top + 4)))
    for color, left, top in rails:
        if (color, left + 8, top) not in rails:
            continue
        stripe_colors = [image.getpixel(point) for offset in (4, 9, 14)
                         for point in ((left + 2, top + offset), (left + 7, top + offset + 3))]
        if len(set(stripe_colors)) == 1 and stripe_colors[0] not in {background, color}:
            gates.append(ObservedGate(color, (left + 5, top + 10)))
    if len(actors) > 1 or len({gate.signature for gate in gates}) != len(gates):
        raise ValueError("Ambiguous actor or gate observations are unsupported")
    return tuple(gates), actors[0] if actors else None


@dataclass(frozen=True)
class PortalEvidence:
    source_signature: RGB
    destination_signature: RGB
    direction: str
    arrival_offset: tuple[int, int]
    before_hash: str
    after_hash: str
    elapsed_seconds: float
    before_seconds: float
    after_seconds: float
    constant_velocity_projection: tuple[float, float] | None


@dataclass(frozen=True)
class PortalPrediction:
    source_signature: RGB
    destination_signature: RGB
    expected_arrival_center: tuple[int, int]
    evidence: frozenset[PortalEvidence]


class PortalAssociationMemory:
    """Observation-only association hypotheses, not proof of teleportation.

    Reads PNG bytes/time only; no World, Clip, gate link, oracle, file or future
    reader is accepted. Fixed-layout, uniquely colored striped line gates and one fully
    visible colored actor are explicit limits. Partial actor masks stay unknown.
    """

    def __init__(self) -> None:
        self.gates: dict[RGB, ObservedGate] = {}
        self.evidence: set[PortalEvidence] = set()
        self.last_actor: ObservedActor | None = None
        self.last_hash: str | None = None
        self.last_time: float | None = None
        self.last_observation_time: float | None = None
        self.velocity: tuple[float, float] | None = None

    def observe(self, png: bytes, at_seconds: float, *, learn: bool = True) -> PortalEvidence | None:
        if type(at_seconds) not in {int, float} or not math.isfinite(at_seconds) or at_seconds < 0:
            raise ValueError("Portal observations require a finite nonnegative acquisition time")
        gates, actor = _portal_pixels(png)
        if self.last_observation_time is not None and at_seconds <= self.last_observation_time:
            raise ValueError("Portal observations require increasing acquisition times")
        self.last_observation_time = at_seconds
        for gate in gates:
            self.gates[gate.signature] = gate
        event = None
        digest = hashlib.sha256(png).hexdigest()
        if actor is not None and self.last_actor is not None:
            previous = self.last_actor
            elapsed = at_seconds - self.last_time
            dx, dy = actor.center[0] - previous.center[0], actor.center[1] - previous.center[1]
            sources = [gate for gate in self.gates.values()
                       if abs(gate.center[0] - previous.center[0]) <= 6 and abs(gate.center[1] - previous.center[1]) <= 8]
            destinations = [gate for gate in self.gates.values()
                            if abs(gate.center[0] - actor.center[0]) <= 12 and abs(gate.center[1] - actor.center[1]) <= 8]
            if (previous.signature == actor.signature and abs(dx) > 20
                    and len(sources) == len(destinations) == 1 and sources[0].signature != destinations[0].signature
                    and self.velocity is not None and self.velocity[0] != 0):
                direction = "RIGHT" if self.velocity[0] > 0 else "LEFT"
                projection = (tuple(previous.center[axis] + self.velocity[axis] * elapsed for axis in (0, 1))
                              if self.velocity is not None else None)
                event = PortalEvidence(
                    sources[0].signature, destinations[0].signature, direction,
                    tuple(actor.center[axis] - destinations[0].center[axis] for axis in (0, 1)),
                    self.last_hash, digest, elapsed, self.last_time, at_seconds, projection,
                )
                if learn:
                    self.evidence.add(event)
            elif previous.signature == actor.signature:
                self.velocity = (dx / elapsed, dy / elapsed) if abs(dx) <= 20 else None
        if actor is not None:
            self.last_actor, self.last_hash, self.last_time = actor, digest, at_seconds
        return event

    def predict(self, before_png: bytes, incoming_action: str | None) -> PortalPrediction | None:
        if incoming_action not in {"RIGHT", "LEFT"}:
            return None
        gates, actor = _portal_pixels(before_png)
        if actor is None:
            return None
        catalog = {**self.gates, **{gate.signature: gate for gate in gates}}
        sources = [gate for gate in catalog.values()
                   if 0 < (gate.center[0] - actor.center[0]) * (1 if incoming_action == "RIGHT" else -1) <= 6
                   and abs(gate.center[1] - actor.center[1]) <= 4]
        if len(sources) != 1:
            return None
        support = frozenset(item for item in self.evidence
                            if item.source_signature == sources[0].signature and item.direction == incoming_action)
        candidates = {(item.destination_signature, item.arrival_offset) for item in support}
        if len(candidates) != 1:
            return None
        destination, offset = next(iter(candidates))
        if destination not in catalog:
            return None
        center = catalog[destination].center
        return PortalPrediction(sources[0].signature, destination,
                                (center[0] + offset[0], center[1] + offset[1]), support)


DOCS = {
    "teleporter": (
        "Observed portal association versus ordinary occlusion",
        "Learn a source/arrival association from witnessed remote reappearances, not from line colors or hidden portal wiring.",
        """## Local memory and new measured evidence

Remember the independently observed asymmetric actor, its previous full mask/color,
position, input response and acquisition-time velocity; retain visibility uncertainty
through partial/missing intervals. Record visible line-gate geometry independently.
Read only earlier validated observations/STM before processing a new frame.

Main clips first walk behind an ordinary opaque panel: exactly four fully hidden
samples plus partial entry/exit, with emergence fitting remembered speed. Later,
actual RIGHT/LEFT inputs bring the actor into a distinctive line gate. Immediate
trials show entrance/contact followed by remote appearance in the next image;
there is no sampled fully-missing portal frame in that variant. Delayed trials
have four consecutive entirely missing portal frames, followed by remote arrival.
The actor is never drawn walking through the intervening pixels during transit.
Input-free delay samples are sensor ticks, not teleport/arrival commands.

The visible contrast is deliberate: the normal occluder is a solid plain panel;
portal devices are **special-looking striped DOUBLE LINE GATES**, not blank
occluders or generic rings. Each has two colored two-pixel rails, twenty pixels
high with left edges eight pixels apart, and three contrasting diagonal stripe strokes
between the rails. The source and remote gates have independently visible colors.
The decorative-line control uses the SAME double-line/stripe cues but no working
link: the appearance is evidence for a mechanism hypothesis, never proof of wiring.

## Prediction before the next observation

`PortalAssociationMemory` in `omega_vision.evaluation.action_mechanism_recordings`
is a constrained pixel-only fixture baseline, **not a semantic teleporter detector**.
It receives observed PNG bytes and acquisition times, never generator gate links,
destinations, teacher identity or hidden state. Its explicit conventions are a
majority-color uniform background, uniquely colored striped paired 2x20 line rails,
one full 6x8 colored asymmetric actor and a fixed camera/layout. Partial actor
observations remain unavailable to this simple reader. The geometric conventions
are authored baseline limits, not general learned visual concepts.
Legacy 6x16 outline observations remain readable for historical replay, but all
current test-card recordings use the versioned striped double-line devices.

After a witnessed departure near one gate and remote reappearance near another,
the baseline retains source/destination **observation signatures**, arrival offset
and source-image evidence. It does not assume that two visible lines are linked.
The first transit has no learned destination prediction. Before later entry,
`prediction = memory.predict(previous_png, actual_input)` freezes a destination
hypothesis from earlier observed associations, not constant-velocity extrapolation.
It predicts where an eventual transit would emerge, conditional on entry; it does
not assert that the very next sample already contains the destination actor.
Only afterward does `memory.observe(current_png, at_seconds, learn=False)` inspect
the new image to grade a held-out probe without learning its result first.
Main clips include a return trip and third transit, so that prediction can be
tested against a genuinely later occurrence. Missing frames are not observations
of the predicted destination. Keep evidence/decision time and source cutoffs distinct.

## Controls, induction requirements and inference limits

Near-miss trials pass below the apertures with continuous visible travel. Identical
decorative-line controls have no functioning link: visible glyphs alone do not
prove a mechanism. Validation reverses motion and appearance; the final trial
changes layout. New or ambiguous glyphs require their own earlier observations,
not silent cross-recording rule deployment. Mapping proposals need independently
observed support/counterexamples, scoped mechanisms and frozen held-out evaluation.

A remote/too-fast reappearance conflicts with the remembered constant-speed
prediction, but unseen acceleration/fast travel, identity ambiguity and other
hidden causes remain alternatives. Teleportation is a hypothesis, **not a newly
registered or implemented semantic event predicate**. The evaluator retains one
actor identity for scoring; the student cannot copy it or call predicted hidden
positions observed facts. No tracker lifetime/access checks are weakened.

Current clips have `_lines_v2` identities. The previously published outline-v1
clips remain untouched and loadable as history; they were not renamed, migrated
or overwritten. The version change alters visible gate cues, not input schedules,
actor motion, ordinary occlusion timing or portal latency.

## One sequential two-phase recording: first reject the motion model

Load `recordings/events_tests/teleporter_train_delayed_lines_v2`. This existing
44-frame recording follows the SAME observed actor and pre-motion through both
phases; it is not a montage of different examples.

1. **Phase 1, frames 0-13:** frames 0-4 establish +8 px/s from actual PNG positions
   and acquisition times. Partial entry is visible at 5-6, exactly four completely
   hidden samples occur at 7-10, and partial exit at 11-12 precedes full reappearance
   at 13. The full-view displacement from 4 to 13 is +18 px over 2.25 s, exactly
   matching the remembered constant-speed prediction. Ordinary occlusion is
   consistent with this evidence; predicted hidden positions are not observations.
2. **Phase 2, frames 14-23:** continue observing the same appearance and +8 px/s
   motion toward the special striped double-line gate. Freeze that earlier
   velocity and the full observation at 18. Frame 19 records an actual RIGHT;
   frames 19-22 contain no visible actor, and 20-23 are sensor-only observations.
   At frame 23, the full actor reappears remotely: +43 px over 1.25 s, versus
   +10 px predicted. **The FIRST conclusion is constant-speed model mismatch.**
   Before frame 23, absence alone does not establish that mismatch or its cause.
3. **Keep competing explanations:** the object either sped up/moved rapidly
   while unseen, or teleported; **unseen acceleration/fast motion AND teleportation
   remain alternative hypotheses**, not observed causes. Identity uncertainty and
   other hidden causes are additional limits. A jump or decorative lines alone
   MUST NOT be graded as definitive teleportation. Nor is acceleration established
   merely by rejecting constant speed.
4. **Later discrimination, frames 24-43:** a return trip reappears at 33, and a
   third entry at 37 reappears at 41. Earlier witnessed gate associations can now
   support a frozen conditional destination prediction for the later trial.
   Compare no-entry and decorative-line controls and independent changed-layout
   trials; repeated position-specific effects support a portal hypothesis more
   than a generic fast-motion account. They are not permission to backdate that
   knowledge to frame 23 or copy the simulator's wiring as proof.

The separate `teleporter_train_delayed_lines_v2/observer_assessment.json` is a
saved **evaluator-only assessment contract**, not an added runtime event schema or
an executed grader. It names both phase boundaries, the earliest model-mismatch
decision, unresolved alternatives and conclusions that must not be graded as
established. Its teacher cause may be teleporter; that oracle cause, the recording
name, this document and the sidecar are never student inputs. The existing
`evaluation.json`, every PNG/state and the manifest remain unchanged. Workbench
execution status stays `not_run`; no semantic predicate or stage is registered.
""",
    ),
    "stairs_gravity": (
        "Right-arrow stair descent with gravity and blocked-right evidence",
        "Traverse two/three-cell stair treads using RIGHT only; distinguish commanded horizontal motion, falling and final obstruction.",
        """## Actual input and physics contract

Main clips issue only **RIGHT** arrows. A right attempt moves up to one four-pixel
cell horizontally, checking solid geometry at every pixel. Gravity is a separate
update: lack of support increases downward velocity by one pixel per sensor tick,
capped at four; each vertical pixel step checks collisions and landing resets
velocity. No DOWN command, diagonal command or fixed click-count y-trajectory exists.
Frames with `incoming_action: null` after baseline are sensor-only ticks: no extra
command was issued. They reveal intermediate fall/landing observations.

Visible stairs drop after treads of two or three cells. Training varies tread
patterns; held-out clips vary patterns and one/two-cell drops. Support, risers and
the final right-hand barrier are visible in the PNG, but the full floor map and
simulator velocity live only in evaluator JSON. Main traversals end at the visible
barrier, settle, and receive at least three further RIGHT attempts with no movement.
That evidence must not be confused with a no-input pause.

## Earlier local memory, new evidence and decision timing

Retain the independently tracked actor, earlier positions/times, previous observed
support/contact and recorded input direction. Compare each current image with that
frozen history. Measure horizontal displacement after RIGHT separately from
vertical displacement while unsupported. Successive acquired samples, including
sensor-only ticks, are needed to assess fall speed/acceleration. A smaller final
displacement may be a landing/collision, not a new downward input or changed gravity.
Keep predicted support/trajectory separate from actual pixels.

For blocked-right, compare earlier successful RIGHT response, current visible
barrier/clearance and repeated current RIGHT receipts with failed displacement.
An unchanged image with no command does not supply the same causal evidence.
Signed observed support/free destination matters: offscreen or unobserved regions
remain unknown, not an invented floor or proven empty space. The fixtures keep
their actual floor inside the observed viewport; they do not demonstrate reasoning
about unseen ground. Use `at_seconds`, not the fixed fixture timestamp.

## Controls and induction limits

The flat-floor control issues RIGHT but never falls. The pause/fall control first
issues one RIGHT off a ledge, then no further commands: x stays fixed while gravity
continues the fall and landing. These counterexamples distinguish horizontal
command effects from command-driven downward movement. Different tread/drop
patterns rule out an absolute click-count or prescribed-y explanation.

Potential action/support/fall/landing and blocked-right rules need measured
producer contracts, causal cutoffs, independent supporting sequences, explicit
counterexamples and frozen held-out tests. The simulator is executable; no general
gravity detector, learned force/mass model, semantic induction stage or automatic
stable-identity pass is implemented here. Do not create new registered predicates,
relax tracker/access checks or promote fixture oracles into accepted rules.
""",
    ),
}


def _files_for_clip(clip: Clip) -> tuple[dict[tuple[str, ...], bytes], dict[str, Any]]:
    prefix = ("recordings", GAME_ID, clip.name)
    identity = "/".join(prefix)
    reference = f"data/{identity}"
    files, moves, oracle = {}, [], []
    for index, frame in enumerate(clip.frames):
        digest = hashlib.sha256(frame.png).hexdigest()
        files[(*prefix, str(index), "image.png")] = frame.png
        files[(*prefix, str(index), "state.json")] = _json({
            "kind": "synthetic_action_mechanism_frame", "game_id": GAME_ID, "game_directory": GAME_ID,
            "level": "1", "state": "NOT_FINISHED", "step_count": index,
            "incoming_action": frame.action, "action_data": {},
            "action_directory": str(index) if index else None,
            "parent_node": f"../{index - 1}" if index else None,
            "action_path": [str(step) for step in range(1, index + 1)],
            "at_seconds": index * INTERVAL, "recorded_at": FIXTURE_TIME, "image_hash": digest[:16],
        })
        moves.append({"index": index, "action": frame.action, "data": {},
                      "directory": f"{reference}/{index}", "state": "NOT_FINISHED", "level": "1",
                      "at_seconds": index * INTERVAL, "recorded_at": FIXTURE_TIME})
        oracle.append({"frameId": str(index), "atSeconds": index * INTERVAL,
                       "sha256": digest, **frame.oracle})
    files[(*prefix, "evaluation.json")] = _json({
        "schemaVersion": 1, "suiteId": SUITE_ID, "testId": clip.family, "partition": clip.partition,
        "description": clip.description, "recognizerStatus": "not_run", "groundTruthIsRecognizerInput": False,
        "teacher": clip.teacher, "frames": oracle,
    })
    files[(*prefix, "recording.json")] = _json({
        "kind": "arc3_play_recording", "source": "synthetic_action_mechanism_tests",
        "session_id": None, "game_id": GAME_ID, "game_directory": GAME_ID, "level": "1",
        "level_directory": reference, "started_at": FIXTURE_TIME, "updated_at": FIXTURE_TIME,
        "last_event": "fixture_created", "fixture_suite": SUITE_ID,
        "description": "Action-bearing observation sequence; recognition has not run and evaluator information is separate.",
        "moves": moves,
    })
    return files, {"visualSequenceId": identity, "label": clip.suffix.replace("_", " "),
                   "partition": clip.partition, "frameCount": len(clip.frames)}


def _portal_motion_documentation(clips: tuple[Clip, ...]) -> str:
    lines = [
        "## Matched motion-envelope evidence from rendered pixels", "",
        "The values below use the observed actor mask in the actual PNGs and the",
        "recorded 0.25-second sampling interval, not teacher positions or hidden wiring.",
        "Velocity is established before occlusion. The full-view endpoints include",
        "the elapsed time spent in partial views as well as the four fully hidden",
        "samples. A normal reappearance fits that earlier velocity; the portal",
        "reappearance lies outside its constant-speed displacement envelope.", "",
        "| Recording | Pre-occlusion horizontal velocity | Normal full-view interval: measured / expected displacement | First portal full-view interval: displacement versus envelope |",
        "|---|---|---|---|",
    ]
    for clip in clips:
        if clip.family != "teleporter" or clip.suffix.startswith("control"):
            continue
        _, initial = _portal_pixels(clip.frames[0].png)
        samples = []
        for frame in clip.frames:
            with Image.open(BytesIO(frame.png)) as image:
                points = [(x, y) for y in range(image.height) for x in range(image.width)
                          if image.getpixel((x, y)) == initial.signature]
            samples.append((len(points), min((x for x, _ in points), default=None)))
        velocity = (samples[1][1] - samples[0][1]) / INTERVAL
        first_hidden = next(index for index, sample in enumerate(samples) if sample[0] == 0)
        normal_before = max(index for index in range(first_hidden) if samples[index][0] == 24)
        normal_after = next(index for index in range(first_hidden, len(samples)) if samples[index][0] == 24)
        dt = (normal_after - normal_before) * INTERVAL
        displacement = samples[normal_after][1] - samples[normal_before][1]
        last_full = normal_after
        for index in range(normal_after + 1, len(samples)):
            if samples[index][0] != 24:
                continue
            portal_dt = (index - last_full) * INTERVAL
            portal_dx = abs(samples[index][1] - samples[last_full][1])
            envelope = abs(velocity) * portal_dt
            if portal_dx > envelope + 1e-9:
                lines.append(
                    f"| `{clip.name}` | {velocity:+.0f} px/s | {normal_before} -> {normal_after}: "
                    f"{displacement:+.0f} px / {dt:.2f} s = {velocity * dt:+.0f} px expected | "
                    f"{last_full} -> {index}: {portal_dx:.0f} px / {portal_dt:.2f} s > {envelope:.0f} px envelope |"
                )
                break
            last_full = index
        else:
            raise ValueError("A positive portal contrast needs an observed out-of-envelope reappearance")
    lines.extend([
        "", "Normal fully hidden frames are 7, 8, 9 and 10 in each main contrast.",
        "The delayed portal trials separately have four fully missing portal samples;",
        "the direct trials have no extra entirely missing portal sample. Line-gate",
        "cues are measured independently from the remembered movement envelope.",
        "Retain ordinary occlusion, unusually fast/unseen accelerated travel, identity",
        "ambiguity and teleportation as distinct explanations. Earlier witnessed",
        "gate-to-gate associations support a conditional destination hypothesis;",
        "one unexplained fast jump or decorative lines alone cannot prove teleportation.", "",
    ])
    return "\n".join(lines)


def _two_phase_observer_assessment(clip: Clip) -> dict[str, Any]:
    """Evaluator-only expectations for the existing sequential delayed contrast."""
    if clip.name != "teleporter_train_delayed_lines_v2":
        raise ValueError("The two-phase assessment names one explicit existing recording")
    actors = {index: _portal_pixels(clip.frames[index].png)[1] for index in (0, 4, 13, 18, 23)}
    if any(actor is None for actor in actors.values()):
        raise ValueError("Assessment boundaries require fully observed actor pixels")
    velocity = (actors[4].center[0] - actors[0].center[0]) / (4 * INTERVAL)

    def measurement(before: int, after: int) -> dict[str, Any]:
        elapsed = (after - before) * INTERVAL
        return {
            "beforeFrame": before, "afterFrame": after, "elapsedSeconds": elapsed,
            "measuredHorizontalDisplacementPixels": actors[after].center[0] - actors[before].center[0],
            "priorConstantSpeedPredictionPixels": velocity * elapsed,
        }

    return {
        "schemaVersion": 1, "testId": "teleporter",
        "visualSequenceId": f"recordings/{GAME_ID}/{clip.name}",
        "role": "evaluator_only_observer_assessment_contract",
        "expectationFormat": "fixture assessment prose, not registered runtime predicates",
        "executionStatus": "not_run", "groundTruthIsRecognizerInput": False,
        "measurementSource": "rendered PNG actor components and recorded acquisition intervals",
        "priorVelocityPixelsPerSecond": velocity,
        "phase1": {
            "frames": [0, 13], "partialEntryFrames": [5, 6], "fullyHiddenFrames": [7, 8, 9, 10],
            "partialExitFrames": [11, 12], "measurement": measurement(4, 13),
            "requiredAssessment": "ordinary occlusion is consistent with remembered constant-speed motion",
            "hiddenPositionsAreObserved": False,
        },
        "phase2": {
            "frames": [14, 23], "fullyMissingFrames": [19, 20, 21, 22],
            "predictionObservationCutoffFrame": 18, "earliestMismatchDecisionFrame": 23,
            "measurement": measurement(18, 23),
            "firstRequiredConclusion": "constant-speed model mismatch",
            "requiredUnresolvedAlternatives": ["unseen acceleration or fast motion", "teleportation"],
            "claimsNotEstablishedAtDecision": ["definitive teleportation", "definitive acceleration"],
            "additionalInferenceLimits": ["identity uncertainty", "other unobserved causes"],
            "gradingRule": "A jump or decorative lines alone MUST NOT be graded as definitive teleportation.",
            "absenceAloneEstablishesCause": False,
        },
        "laterDiscrimination": {
            "frames": [24, 43], "returnArrivalFrame": 33, "repeatEntryFrame": 37, "repeatArrivalFrame": 41,
            "requirements": [
                "Freeze the later destination hypothesis from earlier witnessed gate associations.",
                "Compare independent changed-layout trials and no-entry/decorative-line controls.",
                "Keep untested causes unresolved; a conditional association prediction is not proof of teleportation.",
            ],
            "mayBackdateKnowledgeToFirstJump": False,
        },
        "teacherCause": {"cause": "teleporter", "source": "evaluation.json", "usableAsStudentEvidence": False},
        "runtimeIntegration": "No new detector, registered predicate, semantic stage or automatic grading is implemented.",
    }


def _terminal_frame_documentation(clips: tuple[Clip, ...]) -> str:
    lines = [
        "## Exact terminal blocked-right evidence", "",
        "The table names actual numbered frames, not oracle event labels. The stop/support",
        "baseline and all three later failed-attempt PNGs are byte-identical; each of the",
        "three later states nevertheless records a real RIGHT receipt. Actor displacement",
        "is zero in BOTH x and y. These are not missing-input samples.", "",
        "| Recording | Last successful RIGHT interval | Visible stop/support baseline | Further RIGHT attempts, zero displacement | Three-attempt decision boundary |",
        "|---|---|---|---|---|",
    ]
    for clip in clips:
        if clip.family != "stairs_gravity" or clip.suffix == "control_pause_fall":
            continue
        stop = len(clip.frames) - 4
        success = max(index for index in range(1, stop + 1)
                      if clip.frames[index].action == "RIGHT"
                      and clip.frames[index].oracle["authoredPosition"][0]
                      > clip.frames[index - 1].oracle["authoredPosition"][0])
        failed = list(range(stop + 1, len(clip.frames)))
        lines.append(
            f"| `{clip.name}` | {success - 1} -> {success} | {stop} | {', '.join(map(str, failed))} | "
            f"{failed[-1]} ({failed[-1] * INTERVAL:.2f} s) |"
        )
    lines.extend([
        "", "### Frame-by-frame local-memory reasoning", "",
        "1. Before the first failed-attempt frame, freeze the validated history through",
        "   the stop/support baseline. Retain independently observed actor identity/pose,",
        "   the latest earlier successful RIGHT response, and its measured",
        "   horizontal displacement. Do not initialize a movement affordance from a label.",
        "   In train_b, RIGHT succeeds at frame 37; frames 38 and 39 are sensor-only",
        "   settling observations before failed RIGHT attempts 40, 41 and 42.",
        "2. At each listed attempt, read the actual RIGHT receipt and independently",
        "   measure zero displacement against the remembered actor observation. Verify",
        "   signed visible barrier pixels immediately to the actor's right and ground",
        "   support directly below its footprint. Missing/offscreen evidence is unknown;",
        "   neither a hidden floor map nor an evaluator support flag is detector input.",
        "3. The first failed attempt supplies a blocked-right candidate, not evidence",
        "   that the command was absent. Keep the same actor, direction and obstruction",
        "   context through the second and third failed attempts. Under this test's",
        "   three-attempt criterion, the final listed frame is the earliest fully",
        "   supported decision boundary. Cite the earlier attempt frames; do not backdate",
        "   knowledge or manufacture a runtime-confirmed predicate from this plan.",
        "4. The obstruction remains at clip end. No release or end-of-blocking episode",
        "   is observed; the end of a recording is not an episode-end event.", "",
        "### Stationary no-input control is different evidence", "",
        "`stairs_gravity_control_pause_fall`: frame 0 -> 1 contains the only RIGHT.",
        "Sensor-only frames 2, 3 and 4 continue the fall and land; frames 5, 6, 7, 8",
        "and 9 are stationary with null incoming actions. Their identical pixels do",
        "**not** support blocked-right: there are no repeated RIGHT attempts and no",
        "observed adjacent right-hand barrier at that actor location. Stationary alone",
        "is not blocked, and a pause must not be relabeled as a failed command.", "",
        "These are exact fixture/evidence requirements, not an integrated general",
        "Workbench blocked detector. Execution status stays `not_run`; states/actions",
        "contain no `blocked=true` answer.", "",
    ])
    return "\n".join(lines)


def action_mechanism_files() -> tuple[dict[tuple[str, ...], bytes], dict[str, Any]]:
    clips = action_mechanism_clips()
    files = {}
    recordings = {family: [] for family in FAMILIES}
    for clip in clips:
        outputs, metadata = _files_for_clip(clip)
        if files.keys() & outputs.keys():
            raise ValueError("Duplicate action-mechanism fixture output")
        files.update(outputs)
        if clip.name == "teleporter_train_delayed_lines_v2":
            files[("recordings", GAME_ID, clip.name, "observer_assessment.json")] = _json(
                _two_phase_observer_assessment(clip)
            )
        recordings[clip.family].append(metadata)
    tests = []
    for family in FAMILIES:
        title, summary, body = DOCS[family]
        if family == "stairs_gravity":
            body += "\n\n" + _terminal_frame_documentation(clips)
        elif family == "teleporter":
            body += "\n\n" + _portal_motion_documentation(clips)
        description = (
            f"# {title}\n\n{summary}\n\n**Execution status: not run.**\n\n{body}\n\n"
            "## Recording-local memory and oracle boundary\n\n"
            "Earlier Shape/Object observations, temporal/event prefixes and eligible level-1\n"
            "STM must be frozen before reading this frame. Unknown is not false; current\n"
            "writes and future frames cannot confirm themselves. Predictions/abductions\n"
            "remain hypotheses until independent evidence arrives, and later confirmation\n"
            "cannot backdate knowledge. No memory files, learned rules or approvals are\n"
            "created by publication. Nowhere remains current-browser RAM only.\n\n"
            "Names, catalog entries, this document and `evaluation.json` are evaluator\n"
            "information, never student facts. The PNG and actual input/acquisition metadata\n"
            "are the student's observations. Fixture-unit checks are not Workbench detector\n"
            "or learner passes; UI status remains `not_run`.\n\n"
            "## Individual trials and controls\n\n"
            + "\n".join(f"- **{clip.suffix}**: {clip.description}" for clip in clips if clip.family == family)
            + "\n\n## Loadable recordings\n\n"
            "All recordings use ordinary numbered frames starting at `0`, with no root\n"
            "preview duplicate. Workspace changes expose the same shared assets/identities.\n\n"
            "| Logical Visual Sequence ID | Partition | Frames |\n|---|---|---|\n"
            + "\n".join(f"| `{item['visualSequenceId']}` | {item['partition']} | {item['frameCount']} |"
                        for item in recordings[family])
            + "\n\n## Reproduction and preservation\n\n"
            "`python -m omega_vision.evaluation.action_mechanism_recordings` publishes\n"
            "create-only inputs and this separate `action_mechanism_tests.json` supplement.\n"
            "It never edits `tests.json`, `visual_memory_tests.json`, earlier documentation\n"
            "or existing recordings. Differing files are preserved as conflicts. No GET\n"
            "generates data or changes Save To, Look In, preferences or execution status.\n"
        )
        files[("recordings", GAME_ID, "documentation", f"{family}.md")] = description.encode("utf-8")
        tests.append({"id": family, "group": "Events", "title": title, "summary": summary,
                      "executionStatus": "not_run", "recordings": recordings[family],
                      "documentationFile": f"documentation/{family}.md"})
    files[("recordings", GAME_ID, "action_mechanism_tests.json")] = _json({
        "schemaVersion": 1, "suiteId": SUITE_ID, "count": len(tests), "tests": tests,
    })
    return files, {"testCount": len(tests), "recordingCount": len(clips),
                   "frameCount": sum(len(clip.frames) for clip in clips),
                   "families": {family: {"recordings": len(recordings[family]),
                                         "frames": sum(item["frameCount"] for item in recordings[family])}
                                for family in FAMILIES}}


def create_action_mechanism_recordings(root: Path) -> dict[str, Any]:
    vision_data_root(root)
    files, counts = action_mechanism_files()
    return {**counts, **publish_recording_files(root, files)}


def main() -> None:
    print(json.dumps({"directory": str(shared_storage_path("recordings", GAME_ID)),
                      **create_action_mechanism_recordings(shared_storage_path())}, indent=2))


if __name__ == "__main__":
    main()
