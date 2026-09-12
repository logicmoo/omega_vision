"""Small observation-only fixture baselines, not Workbench semantic pipeline stages.

All inputs are PNG bytes and actual command receipts. There is no filesystem,
recording-name, evaluator, scene, palette-metadata or future-frame reader here.
"""

from __future__ import annotations

from collections import Counter
from dataclasses import dataclass
import hashlib
from io import BytesIO

from PIL import Image

RGB = tuple[int, int, int]


@dataclass(frozen=True)
class Component:
    color: RGB
    pixels: frozenset[tuple[int, int]]
    bounds: tuple[int, int, int, int]

    @property
    def filled_rectangle(self) -> bool:
        x0, y0, x1, y1 = self.bounds
        return len(self.pixels) == (x1 - x0) * (y1 - y0)


@dataclass(frozen=True)
class BandObservation:
    source_hash: str
    target: Component
    swatches: tuple[Component, ...]

    @property
    def colors(self) -> tuple[RGB, ...]:
        return tuple(swatch.color for swatch in self.swatches)


def observe_color_band(png: bytes) -> BandObservation:
    """Extract the largest solid target and a smaller right-side vertical band.

    Conventions: majority-color uniform background, one large solid rectangular
    target, >=2 equal square swatches in a single column to its right, unique
    swatch colors and one exact target-color match. Order is top to bottom.
    """
    with Image.open(BytesIO(png)) as source:
        if source.mode not in {"RGB", "RGBA"}:
            raise ValueError("Color-band baseline requires RGB or opaque RGBA pixels")
        if source.mode == "RGBA" and source.getchannel("A").getextrema() != (255, 255):
            raise ValueError("Color-band baseline cannot infer colors from unknown pixels")
        image = source.convert("RGB")
    raw = image.tobytes()
    pixels = list(zip(raw[0::3], raw[1::3], raw[2::3]))
    background, count = Counter(pixels).most_common(1)[0]
    if count <= len(pixels) // 2:
        raise ValueError("A majority-color uniform background is required")
    remaining = {(index % image.width, index // image.width)
                 for index, color in enumerate(pixels) if color != background}
    components = []
    while remaining:
        seed = min(remaining, key=lambda cell: (cell[1], cell[0]))
        color = image.getpixel(seed)
        pending = [seed]
        matched = {seed}
        remaining.remove(seed)
        while pending:
            x, y = pending.pop()
            for point in ((x - 1, y), (x + 1, y), (x, y - 1), (x, y + 1)):
                if point in remaining and image.getpixel(point) == color:
                    remaining.remove(point)
                    matched.add(point)
                    pending.append(point)
        xs, ys = zip(*matched)
        components.append(Component(color, frozenset(matched), (min(xs), min(ys), max(xs) + 1, max(ys) + 1)))
    rectangles = sorted((component for component in components if component.filled_rectangle),
                        key=lambda component: len(component.pixels), reverse=True)
    if not rectangles or len(rectangles[0].pixels) < 64:
        raise ValueError("No large solid target is observable")
    target = rectangles[0]
    squares = [
        component for component in rectangles[1:]
        if component.bounds[0] > target.bounds[2]
        and component.bounds[2] - component.bounds[0] == component.bounds[3] - component.bounds[1]
        and len(component.pixels) >= 16
        and len(component.pixels) * 3 <= len(target.pixels)
    ]
    if len(squares) < 2:
        raise ValueError("The ordered swatch band is unavailable")
    if len({(item.bounds[0], item.bounds[2], len(item.pixels)) for item in squares}) != 1:
        raise ValueError("Swatches must be equal squares in one vertical column")
    squares.sort(key=lambda component: component.bounds[1])
    colors = tuple(component.color for component in squares)
    if len(set(colors)) != len(colors) or colors.count(target.color) != 1:
        raise ValueError("Swatch colors must be unique and contain the observed target color")
    return BandObservation(hashlib.sha256(png).hexdigest(), target, tuple(squares))


@dataclass(frozen=True)
class BandPrediction:
    before: BandObservation
    point: tuple[int, int]
    hit_target: bool
    learned_step: int | None
    expected_color: RGB | None


@dataclass(frozen=True)
class SuccessorEvidence:
    before_hash: str
    after_hash: str
    point: tuple[int, int]
    step: int
    band_size: int


@dataclass(frozen=True)
class ColorAssessment:
    status: str
    predicted_color: RGB | None
    observed_color: RGB


class ColorBandMemory:
    """Retain observed modular successor-step evidence, not a hidden RGB order."""

    def __init__(self) -> None:
        self._evidence: set[SuccessorEvidence] = set()

    @property
    def evidence(self) -> frozenset[SuccessorEvidence]:
        return frozenset(self._evidence)

    @property
    def learned_step(self) -> int | None:
        steps = {item.step for item in self._evidence}
        return next(iter(steps)) if len(steps) == 1 else None

    def predict(self, before_png: bytes, action: str, action_data: dict[str, int]) -> BandPrediction:
        if action != "CLICK" or set(action_data) != {"x", "y"} or any(
            type(action_data[key]) is not int for key in ("x", "y")
        ):
            raise ValueError("Supply only the actual CLICK x/y receipt")
        before = observe_color_band(before_png)
        point = (action_data["x"], action_data["y"])
        hit = point in before.target.pixels
        step = self.learned_step
        expected = before.target.color if not hit else (
            before.colors[(before.colors.index(before.target.color) + step) % len(before.colors)]
            if step is not None else None
        )
        return BandPrediction(before, point, hit, step, expected)

    def observe(self, prediction: BandPrediction, after_png: bytes, *, learn: bool = True) -> ColorAssessment:
        after = observe_color_band(after_png)
        before = prediction.before
        if (before.target.pixels != after.target.pixels
                or tuple(item.pixels for item in before.swatches) != tuple(item.pixels for item in after.swatches)
                or before.colors != after.colors):
            raise ValueError("A learning pair requires unchanged visible layout and band")
        actual = after.target.color
        status = ("unknown" if prediction.expected_color is None else
                  "correct" if prediction.expected_color == actual else "incorrect")
        # Score the already-frozen prediction before incorporating the new evidence.
        if learn and prediction.hit_target:
            step = (before.colors.index(actual) - before.colors.index(before.target.color)) % len(before.colors)
            self._evidence.add(SuccessorEvidence(before.source_hash, after.source_hash,
                                                prediction.point, step, len(before.colors)))
        return ColorAssessment(status, prediction.expected_color, actual)


class SpotlightMemory:
    """Accumulate only alpha-255 observations of one static scene/fixed camera."""

    def __init__(self) -> None:
        self._image: Image.Image | None = None

    @property
    def known_count(self) -> int:
        return self._image.getchannel("A").tobytes().count(255) if self._image else 0

    @property
    def unknown_count(self) -> int:
        return self._image.width * self._image.height - self.known_count if self._image else 0

    def observe(self, png: bytes) -> int:
        with Image.open(BytesIO(png)) as source:
            if source.mode != "RGBA":
                raise ValueError("Spotlight observations require an explicit RGBA visibility channel")
            observation = source.copy()
        if set(observation.getchannel("A").tobytes()) - {0, 255}:
            raise ValueError("Visibility must be binary: alpha 0 unknown or alpha 255 observed")
        if self._image is not None and observation.size != self._image.size:
            raise ValueError("Fixed-camera observations must retain the same dimensions")
        previous = self._image or Image.new("RGBA", observation.size, (0, 0, 0, 0))
        additions = []
        # Preflight contradictions before changing any accepted pixels.
        for y in range(observation.height):
            for x in range(observation.width):
                value = observation.getpixel((x, y))
                if value[3] == 0:
                    continue
                known = previous.getpixel((x, y))
                if known[3] == 255 and known != value:
                    raise ValueError("Observed pixels contradict the static-scene/fixed-camera assumption")
                if known[3] == 0:
                    additions.append(((x, y), value))
        if self._image is None:
            self._image = previous
        for point, value in additions:
            self._image.putpixel(point, value)
        return len(additions)

    def image(self) -> Image.Image:
        if self._image is None:
            raise ValueError("No observation has established image dimensions")
        return self._image.copy()
