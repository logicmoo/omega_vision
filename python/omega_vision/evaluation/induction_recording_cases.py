"""Deterministic, action-driven worlds for induction *inputs*, not a learner.

Positions, wiring, dynamics and named roles in this module belong to the
generator/evaluator. They are never serialized into a recognizer frame state.
"""

from __future__ import annotations

from copy import deepcopy
from dataclasses import dataclass, field
from io import BytesIO
from typing import Any

from PIL import Image, ImageDraw

SIZE = (96, 64)
CELL = 8
GRID = (12, 8)
DIRECTIONS = {"LEFT": (-1, 0), "RIGHT": (1, 0), "UP": (0, -1), "DOWN": (0, 1)}
STEMS = (
    "plate_momentary", "plate_crate_hold", "plate_unlinked_control", "plate_latched",
    "plate_toggle", "plate_delayed", "plate_two_inputs", "plate_timer_confound",
    "push_free", "push_directions", "push_wall_blocked", "push_immovable",
    "push_chain", "push_release", "push_inertial", "push_onto_plate",
)
PARTITIONS = {
    "train_a": "training", "train_b": "training", "control_a": "training_control",
    "validation_a": "validation", "test_a": "test", "test_control_a": "test_control",
}
PALETTES = (
    ((40, 150, 255), (235, 170, 55)),
    ((220, 90, 185), (70, 185, 220)),
    ((100, 210, 130), (220, 105, 100)),
    ((225, 180, 90), (140, 130, 230)),
    ((160, 130, 245), (85, 200, 150)),
    ((60, 195, 210), (235, 150, 180)),
    ((210, 145, 60), (100, 185, 240)),
)

TRIAL_NOTES = {
    "plate_momentary": (
        "Approach, occupy, hold and release the plate twice; observe opening during occupancy and closure after release.",
        "Move nearby without occupying the plate; observe the door remaining closed throughout the completed horizon.",
    ),
    "plate_crate_hold": (
        "Push the crate onto the plate, retreat while it holds the door open, then return and push it off to observe closure.",
        "Push the crate through the adjacent lane; displacement occurs without plate occupancy or door response.",
    ),
    "plate_unlinked_control": (
        "Occupy A and B independently, with release between interventions; compare the far and near doors' separate responses.",
        "Move near the plates without occupying either; neither door changes during the completed observation window.",
    ),
    "plate_latched": (
        "Occupy, hold and release the plate twice; after its first opening the door remains open through both releases.",
        "Pass nearby without pressing the plate; the door never receives an activation and remains closed.",
    ),
    "plate_toggle": (
        "Make three separate presses with holds and releases; the door alternates open, closed, open without retriggering during holds.",
        "Move nearby without a press; no rising occupancy edge or door toggle occurs.",
    ),
    "plate_delayed": (
        "Occupy and release the plate twice, observing the completed delayed opening and closure windows after the occupancy edges.",
        "Wait and move nearby without pressing; observe the full no-response horizon rather than an early truncated window.",
    ),
    "plate_two_inputs": (
        "Push a crate onto A and independently occupy B with the actor; cover A alone, both, B alone and neither, including releases.",
        "Push a crate onto A only; B remains empty and the door remains closed throughout the completed horizon.",
    ),
    "plate_timer_confound": (
        "Press, hold and release the plate while the independently timed door opens; compare acquisition times rather than assume press causality.",
        "Never press the plate; the door nevertheless opens on the timer, contradicting a necessary-press explanation.",
    ),
    "push_free": (
        "Approach the crate, push it into clear space, pause, push again and retreat; compare actual input attempts with displacement.",
        "Issue directional movements in the adjacent lane without contacting the crate; only the actor moves.",
    ),
    "push_directions": (
        "Approach and push from this clip's physical contact orientation, then retreat; compare input direction with crate displacement.",
        "Issue directional movements without crate contact; directional input alone does not move the crate.",
    ),
    "push_wall_blocked": (
        "Push up to the wall and repeat blocked attempts, click the actual barrier, then push through the now-clear destination.",
        "Push up to the wall, then click elsewhere; the wall stays present and further attempts remain blocked.",
    ),
    "push_immovable": (
        "Approach and repeatedly attempt to push an object with visible space beyond it; it stays fixed while the actor can retreat.",
        "Apply similar attempts to a visually similar movable object; it displaces, countering an appearance-only immovability rule.",
    ),
    "push_chain": (
        "Push both crates while the far end is clear, encounter the wall, remove it with a click and resume chain movement.",
        "Attempt the chain with its far end blocked from the outset; neither crate can displace despite near-side contact.",
    ),
    "push_release": (
        "Push the crate twice with a pause, then retreat and leave the lane; the crate remains stationary after release.",
        "Move without contacting the crate; no push or subsequent crate displacement occurs.",
    ),
    "push_inertial": (
        "Deliver a contact impulse, leave the lane and observe continued crate movement with increasing intervals before it stops.",
        "Move without an initial contact impulse, then wait; the crate does not drift.",
    ),
    "push_onto_plate": (
        "Push onto the plate, leave the crate holding it while the actor retreats, then return and push it off; retain each intermediate visible response.",
        "Push through an adjacent lane; the crate moves but misses the plate and the door remains closed.",
    ),
}


def add(a: tuple[int, int], b: tuple[int, int]) -> tuple[int, int]:
    return a[0] + b[0], a[1] + b[1]


@dataclass(frozen=True)
class Input:
    action: str
    cell: tuple[int, int] | None = None

    def data(self) -> dict[str, int]:
        if self.cell is None:
            return {}
        return {"x": self.cell[0] * CELL + CELL // 2, "y": self.cell[1] * CELL + CELL // 2}


@dataclass
class World:
    actor: tuple[int, int] = (2, 3)
    crates: dict[str, tuple[int, int]] = field(default_factory=dict)
    immovable: set[str] = field(default_factory=set)
    walls: set[tuple[int, int]] = field(default_factory=set)
    removable: set[tuple[int, int]] = field(default_factory=set)
    plates: dict[str, tuple[int, int]] = field(default_factory=dict)
    doors: dict[str, tuple[int, int]] = field(default_factory=dict)
    mechanism: str = "none"
    opened: dict[str, bool] = field(default_factory=dict)
    occupied: dict[str, bool] = field(default_factory=dict)
    delayed: list[tuple[float, bool]] = field(default_factory=list)
    momentum: dict[str, tuple[tuple[int, int], int, float]] = field(default_factory=dict)
    inertia: bool = False
    seconds: float = 0.0
    delay: float = 1.5
    timer: float = 4.0
    palette: int = 0

    def baseline(self) -> None:
        self.opened = {key: False for key in self.doors}
        self.occupied = {key: False for key in self.plates}

    def blocked(self, position: tuple[int, int]) -> bool:
        return (
            not (0 <= position[0] < GRID[0] and 0 <= position[1] < GRID[1])
            or position in self.walls
            or any(position == cell and not self.opened[key] for key, cell in self.doors.items())
        )

    def push(self, key: str, direction: tuple[int, int], moved: set[str]) -> bool:
        if key in self.immovable:
            return False
        destination = add(self.crates[key], direction)
        if self.blocked(destination) or destination == self.actor:
            return False
        other = next((name for name, cell in self.crates.items() if cell == destination), None)
        if other is not None and not self.push(other, direction, moved):
            return False
        self.crates[key] = destination
        moved.add(key)
        return True

    def step(self, receipt: Input, dt: float) -> None:
        self.seconds = round(self.seconds + dt, 6)
        moved: set[str] = set()
        if receipt.action in DIRECTIONS:
            direction = DIRECTIONS[receipt.action]
            destination = add(self.actor, direction)
            crate = next((key for key, cell in self.crates.items() if cell == destination), None)
            if not self.blocked(destination) and (crate is None or self.push(crate, direction, moved)):
                self.actor = destination
            if self.inertia:
                for key in moved:
                    self.momentum[key] = (direction, 3, self.seconds + 0.5)
        elif receipt.action == "CLICK":
            if receipt.cell in self.removable:
                self.walls.discard(receipt.cell)
        elif receipt.action != "WAIT":
            raise ValueError(f"Unsupported actual input: {receipt.action}")

        for key, (direction, remaining, due) in list(self.momentum.items()):
            if key in moved:
                continue
            while remaining and self.seconds + 1e-8 >= due:
                # Autonomous motion cannot pull the actor or silently push a chain.
                target = add(self.crates[key], direction)
                if target == self.actor or target in self.crates.values() or self.blocked(target):
                    remaining = 0
                    break
                self.crates[key] = target
                remaining -= 1
                due += (4 - remaining) * 0.5
            if remaining:
                self.momentum[key] = (direction, remaining, due)
            else:
                del self.momentum[key]

        occupied = {
            key: cell == self.actor or cell in self.crates.values()
            for key, cell in self.plates.items()
        }
        a = occupied.get("a", False)
        rising = a and not self.occupied.get("a", False)
        if self.mechanism == "momentary":
            self.opened["door"] = a
        elif self.mechanism == "latched":
            self.opened["door"] = self.opened["door"] or a
        elif self.mechanism == "toggle":
            if rising:
                self.opened["door"] = not self.opened["door"]
        elif self.mechanism == "delayed":
            if a != self.occupied["a"]:
                self.delayed.append((self.seconds + self.delay, a))
            while self.delayed and self.delayed[0][0] <= self.seconds + 1e-8:
                _, self.opened["door"] = self.delayed.pop(0)
        elif self.mechanism == "two_inputs":
            self.opened["door"] = a and occupied.get("b", False)
        elif self.mechanism == "unlinked":
            self.opened["far"] = a
            self.opened["near"] = occupied.get("b", False)
        elif self.mechanism == "timer":
            self.opened["door"] = self.seconds >= self.timer
        self.occupied = occupied

    def oracle(self) -> dict[str, Any]:
        return {
            "atSeconds": self.seconds, "actor": self.actor, "crates": dict(self.crates),
            "walls": sorted(self.walls), "plateOccupancy": dict(self.occupied),
            "doorOpen": dict(self.opened),
            "pendingEffects": [{"dueSeconds": due, "open": value} for due, value in self.delayed],
            "momentum": {key: {"direction": direction, "remainingSteps": remaining, "nextAtSeconds": due}
                         for key, (direction, remaining, due) in self.momentum.items()},
        }

    def render(self) -> bytes:
        image = Image.new("RGB", SIZE, (14, 19, 27))
        draw = ImageDraw.Draw(image)

        def box(cell: tuple[int, int], inset: int = 0) -> tuple[int, int, int, int]:
            x, y = cell
            return x * CELL + inset, y * CELL + inset, (x + 1) * CELL - inset - 1, (y + 1) * CELL - inset - 1

        for key, cell in self.plates.items():
            draw.rectangle(box(cell), fill=(225, 220, 100) if self.occupied[key] else (100, 92, 52))
            draw.rectangle(box(cell, 2), fill=(25, 29, 32))
        for cell in self.walls:
            draw.rectangle(box(cell), fill=(135, 145, 158))
            draw.line((cell[0] * CELL, cell[1] * CELL + 3, cell[0] * CELL + 7, cell[1] * CELL + 3),
                      fill=(85, 95, 108))
        for key, cell in self.doors.items():
            draw.rectangle(box(cell), fill=(80, 215, 145) if self.opened[key] else (210, 80, 80))
            if self.opened[key]:
                draw.rectangle(box(cell, 2), fill=(14, 19, 27))
        actor_color, crate_color = PALETTES[self.palette]
        for cell in self.crates.values():
            draw.rectangle(box(cell, 1), fill=crate_color)
            x, y = cell[0] * CELL, cell[1] * CELL
            draw.line((x + 2, y + 2, x + 5, y + 5), fill=(35, 37, 45))
            draw.line((x + 2, y + 5, x + 5, y + 2), fill=(35, 37, 45))
        draw.rectangle(box(self.actor, 1), fill=actor_color)
        x, y = self.actor[0] * CELL, self.actor[1] * CELL
        draw.rectangle((x + 3, y + 2, x + 4, y + 3), fill=(240, 245, 250))
        stream = BytesIO()
        image.save(stream, format="PNG")
        return stream.getvalue()


@dataclass(frozen=True)
class Clip:
    stem: str
    suffix: str
    partition: str
    initial: World
    actions: tuple[Input, ...]
    dt: float

    @property
    def name(self) -> str:
        return f"{self.stem}_{self.suffix}"

    @property
    def description(self) -> str:
        role = {
            "training": "Training example", "training_control": "Training control",
            "validation": "Held-out validation example", "test": "Frozen final example",
            "test_control": "Frozen final control", "inconclusive_control": "Inconclusive control",
        }[self.partition]
        if self.partition == "inconclusive_control":
            note = "Occupy the plate, then end 0.5 seconds later, before the 1.5-second response horizon; no negative response verdict is justified."
        else:
            note = TRIAL_NOTES[self.stem][int(self.partition.endswith("_control"))]
        observations = [frame[2] for frame in self.replay()]

        def activity(field: str, applicable: bool) -> str:
            if not applicable:
                return "not applicable"
            return "present" if any(a[field] != b[field] for a, b in zip(observations, observations[1:])) else "absent"

        occupancy = ("not applicable" if not self.initial.plates else
                     "present" if any(any(frame["plateOccupancy"].values()) for frame in observations) else "absent")
        return (
            f"{role}. {note} Trace: plate occupancy={occupancy}; "
            f"crate movement={activity('crates', bool(self.initial.crates))}; "
            f"door changes={activity('doorOpen', bool(self.initial.doors))}; "
            f"wall removal={activity('walls', bool(self.initial.walls))}."
        )

    def replay(self) -> list[tuple[Input | None, bytes, dict[str, Any]]]:
        world = deepcopy(self.initial)
        world.baseline()
        frames = [(None, world.render(), world.oracle())]
        for action in self.actions:
            world.step(action, self.dt)
            frames.append((action, world.render(), world.oracle()))
        return frames


def _script(stem: str, negative: bool, variant: int) -> tuple[World, list[Input]]:
    world = World(palette=variant)
    steps: list[Input] = []
    dwell = 3 + variant % 3

    def commands(*names: str) -> None:
        steps.extend(Input(name) for name in names)

    def wait(count: int = dwell) -> None:
        commands(*(["WAIT"] * count))

    def travel(direction: str, count: int) -> None:
        commands(*([direction] * count))

    def plate(mechanism: str = "momentary") -> None:
        world.plates = {"a": (4, 3)}
        world.doors = {"door": (10, 3)}
        world.mechanism = mechanism

    wait(1 + variant % 3)
    if stem in {"plate_crate_hold", "push_onto_plate"}:
        plate()
        world.actor = (1, 3)
        world.crates = {"crate": (3, 3)}
        world.plates["a"] = (5, 3)
        if negative:
            world.actor = (1, 4)
            world.crates["crate"] = (3, 4)
        commands("RIGHT", "RIGHT", "RIGHT")
        wait()
        commands("UP", "LEFT", "LEFT")
        wait()
        commands("RIGHT", "RIGHT", "DOWN", "RIGHT")
        wait()
        commands("LEFT")
        wait()
    elif stem == "plate_two_inputs":
        plate("two_inputs")
        world.actor = (1, 3)
        world.crates = {"crate": (3, 3)}
        world.plates["b"] = (7, 3)
        commands("RIGHT", "RIGHT")
        wait()
        if negative:
            commands("UP", "RIGHT", "RIGHT")
            wait(8)
        else:
            commands("UP")
            travel("RIGHT", 4)
            commands("DOWN")
            wait()
            commands("UP")
            wait()
            travel("LEFT", 4)
            commands("DOWN", "RIGHT")
            wait()
            commands("UP")
            travel("RIGHT", 3)
            commands("DOWN")
            wait()
            commands("UP")
            wait()
    elif stem == "plate_unlinked_control":
        plate("unlinked")
        world.plates["b"] = (7, 3)
        world.doors = {"near": (5, 2), "far": (10, 5)}
        if negative:
            commands("DOWN")
            travel("RIGHT", 6)
            wait(8)
        else:
            commands("RIGHT", "RIGHT")
            wait()
            commands("DOWN")
            wait()
            travel("RIGHT", 3)
            commands("UP")
            wait()
            commands("DOWN")
            wait()
    elif stem.startswith("plate_"):
        mechanism = {
            "plate_momentary": "momentary", "plate_latched": "latched",
            "plate_toggle": "toggle", "plate_delayed": "delayed", "plate_timer_confound": "timer",
        }[stem]
        plate(mechanism)
        if negative:
            commands("UP")
            travel("RIGHT", 4)
            wait(10)
            commands("LEFT")
            wait()
        else:
            for _ in range(3 if mechanism == "toggle" else 2):
                commands("RIGHT", "RIGHT") if not any(s.action == "LEFT" for s in steps) else commands("RIGHT")
                wait()
                commands("LEFT")
                wait()
    else:
        world.actor = (1, 3)
        world.crates = {"crate": (3, 3)}
        if stem == "push_wall_blocked":
            world.walls = {(5, 3)}
            world.removable = set(world.walls)
            commands("RIGHT", "RIGHT", "RIGHT", "RIGHT")
            wait()
            if not negative:
                steps.append(Input("CLICK", (5, 3)))
            else:
                steps.append(Input("CLICK", (5, 2)))
            commands("RIGHT", "RIGHT", "LEFT")
            wait()
        elif stem == "push_chain":
            world.crates["second"] = (4, 3)
            far = (5, 3) if negative else (7, 3)
            world.walls = {far}
            world.removable = set(world.walls)
            commands("RIGHT", "RIGHT", "RIGHT", "RIGHT", "RIGHT")
            wait()
            if not negative:
                steps.append(Input("CLICK", far))
            commands("RIGHT", "LEFT")
            wait()
        elif stem == "push_immovable":
            if not negative:
                world.immovable = {"crate"}
            commands("RIGHT", "RIGHT", "RIGHT", "WAIT", "RIGHT", "LEFT")
            wait()
        elif stem == "push_inertial":
            world.inertia = True
            if negative:
                commands("UP", "RIGHT", "RIGHT")
            else:
                commands("RIGHT", "RIGHT", "UP", "LEFT")
            wait(12)
        else:
            if negative:
                commands("UP", "RIGHT", "RIGHT", "RIGHT", "LEFT")
            else:
                commands("RIGHT", "RIGHT", "WAIT", "RIGHT", "LEFT", "UP")
            wait()
    return world, steps


def _transform(world: World, actions: list[Input], variant: int, stem: str) -> tuple[World, tuple[Input, ...]]:
    # Reflect the physical initial condition AND the actual commands, not labels.
    def point(cell: tuple[int, int]) -> tuple[int, int]:
        x, y = cell
        return (GRID[0] - 1 - x if variant % 2 else x,
                GRID[1] - 1 - y if variant in {2, 4, 6} else y)

    def direction(name: str) -> str:
        if variant % 2 and name in {"LEFT", "RIGHT"}:
            name = "LEFT" if name == "RIGHT" else "RIGHT"
        if variant in {2, 4, 6} and name in {"UP", "DOWN"}:
            name = "UP" if name == "DOWN" else "DOWN"
        return name

    if stem == "push_directions" and variant in {2, 3, 4, 6}:
        # Only this compact world is rotated; all occupied cells remain in bounds.
        def point(cell: tuple[int, int]) -> tuple[int, int]:
            x, y = cell
            return (y + 2, 7 - x if variant == 6 else x)

        def direction(name: str) -> str:
            mapping = ({"RIGHT": "DOWN", "LEFT": "UP", "UP": "LEFT", "DOWN": "RIGHT"}
                       if variant != 6 else
                       {"RIGHT": "UP", "LEFT": "DOWN", "UP": "LEFT", "DOWN": "RIGHT"})
            return mapping.get(name, name)

    world.actor = point(world.actor)
    for attr in ("crates", "plates", "doors"):
        setattr(world, attr, {key: point(cell) for key, cell in getattr(world, attr).items()})
    world.walls = {point(cell) for cell in world.walls}
    world.removable = {point(cell) for cell in world.removable}
    return world, tuple(Input(direction(item.action), point(item.cell) if item.cell else None) for item in actions)


def induction_clips() -> tuple[Clip, ...]:
    result = []
    for stem in STEMS:
        for variant, (suffix, partition) in enumerate(PARTITIONS.items()):
            negative = "control" in suffix
            world, actions = _script(stem, negative, variant)
            world, actions = _transform(world, actions, variant, stem)
            result.append(Clip(stem, suffix, partition, world, actions, 0.5 if variant % 2 == 0 else 1.0))
        if stem == "push_directions":
            world, actions = _script(stem, False, 6)
            world, actions = _transform(world, actions, 6, stem)
            result.append(Clip(stem, "train_c", "training", world, actions, 0.5))
        if stem == "plate_delayed":
            world, _ = _script(stem, False, 0)
            result.append(Clip(stem, "control_horizon", "inconclusive_control", world,
                               tuple(Input(name) for name in ("WAIT", "RIGHT", "RIGHT", "WAIT")),
                               0.5))
    return tuple(result)
