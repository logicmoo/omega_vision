"""Pixel measurements, not semantic roles or event labels.

All masks are observed original-image pixels. In particular, contact probes do
not establish support, force, mass, pressure-plate roles or hidden wiring.
"""
from __future__ import annotations

import math
import re
from typing import Any, Mapping, Sequence

import numpy as np
from scipy import ndimage

from .observation_identity import content_hash

VERSION = "measured-event-features-v1"


def is_exact_mask_source(source: str) -> bool:
    return bool(source) and set(source.split("+")) <= {"exact_pixel_runs", "exact_image_components"}


def mask_geometry(points: Sequence[Sequence[int]]) -> dict[str, Any]:
    pixels = {tuple(point) for point in points}
    if not pixels or any(
        len(point) != 2 or any(type(value) is not int for value in point)
        for point in pixels
    ):
        raise ValueError("geometry requires nonempty integer pixel coordinates")
    xs, ys = zip(*pixels)
    xmin, ymin, xmax, ymax = min(xs), min(ys), max(xs), max(ys)
    mask = np.zeros((ymax - ymin + 3, xmax - xmin + 3), dtype=bool)
    for x, y in pixels:
        mask[y - ymin + 1, x - xmin + 1] = True
    filled = ndimage.binary_fill_holes(mask)
    holes, count = ndimage.label(filled & ~mask)
    return {
        "area": len(pixels), "bounds": [xmin, ymin, xmax, ymax],
        "size": [xmax - xmin + 1, ymax - ymin + 1],
        "holeCount": int(count),
        "holeAreas": sorted(int(np.count_nonzero(holes == i)) for i in range(1, count + 1)),
        "filledShapeHash": content_hash(np.argwhere(filled).tolist()),
        "maskHash": content_hash(sorted(pixels)),
    }


def exact_region_masks(image_rgb: np.ndarray, regions: Sequence[Mapping[str, Any]]) -> dict[str, np.ndarray]:
    """Recover only uniform-color components verified against extracted facts.

    This does not substitute a color for an object identity. A unique component
    must independently agree with the region's measured area and centroid.
    Natural-image gradients or quantization discrepancies remain unmeasured.
    """
    result, colors = {}, {}
    for region in regions:
        color = region.get("color")
        if not isinstance(color, str) or not re.fullmatch(r"#[0-9a-fA-F]{6}", color):
            continue
        if color not in colors:
            rgb = np.array([int(color[index:index + 2], 16) for index in (1, 3, 5)])
            labels, count = ndimage.label(np.all(image_rgb == rgb, axis=2))
            areas = np.bincount(labels.ravel())
            centers = ndimage.center_of_mass(np.ones(labels.shape), labels, range(1, count + 1))
            colors[color] = labels, areas, centers
        labels, areas, centers = colors[color]
        # The extractor publishes rounded pixel centroids, not subpixel means.
        matches = [index for index, (cy, cx) in enumerate(centers, 1)
                   if areas[index] == region["area"] and all(
                       abs(a - b) <= 0.500000001 for a, b in zip((cx, cy), region["centroid"])
                   )]
        if len(matches) == 1:
            result[region["alias"]] = labels == matches[0]
    return result


def affine_mask_comparison(left: Sequence[Sequence[int]], right: Sequence[Sequence[int]]) -> dict[str, Any]:
    """Exact cell-area IoU after axis-aligned normalization (no resampling loss)."""
    a, b = {tuple(p) for p in left}, {tuple(p) for p in right}
    ax, ay = min(x for x, _ in a), min(y for _, y in a)
    bx, by = min(x for x, _ in b), min(y for _, y in b)
    aw, ah = max(x for x, _ in a) - ax + 1, max(y for _, y in a) - ay + 1
    bw, bh = max(x for x, _ in b) - bx + 1, max(y for _, y in b) - by + 1
    target = {(x - bx, y - by) for x, y in b}
    intersection = 0
    # Integer common-denominator coordinates avoid approximating two-pixel changes.
    for x, y in a:
        x0, x1, y0, y1 = (x - ax) * bw, (x - ax + 1) * bw, (y - ay) * bh, (y - ay + 1) * bh
        for xx in range(x0 // aw, (x1 - 1) // aw + 1):
            for yy in range(y0 // ah, (y1 - 1) // ah + 1):
                if (xx, yy) in target:
                    intersection += (min(x1, (xx + 1) * aw) - max(x0, xx * aw)) * (
                        min(y1, (yy + 1) * ah) - max(y0, yy * ah))
    union = len(a) * bw * bh + len(b) * aw * ah - intersection
    return {"iou": intersection / union, "scale": [bw / aw, bh / ah]}


def measured_geometry_change(before: Any, after: Any, width: int, height: int) -> dict[str, Any]:
    first, second = mask_geometry(before.points), mask_geometry(after.points)
    exact = is_exact_mask_source(before.mask_source) and is_exact_mask_source(after.mask_source)
    clipped = any(x in (0, width - 1) or y in (0, height - 1) for x, y in (*before.points, *after.points))
    fit = affine_mask_comparison(before.points, after.points)
    sx, sy = fit["scale"]
    return {
        "before": first, "after": second, "exact": exact, "borderClipped": clipped,
        "areaDelta": second["area"] - first["area"],
        "holeDelta": second["holeCount"] - first["holeCount"],
        "outerShapeUnchanged": first["filledShapeHash"] == second["filledShapeHash"],
        "colorChanged": before.colors != after.colors,
        "beforeColors": list(before.colors), "afterColors": list(after.colors),
        "affineIou": fit["iou"], "scale": fit["scale"],
        "uniformScale": abs(sx - sy) < 1e-9 and abs(sx - 1) > 1e-9,
        "nonuniformScale": abs(sx - sy) > 1e-9,
    }


def observed_interval(before: Any, after: Any) -> dict[str, Any]:
    first, second = before.observation_metadata, after.observation_metadata
    references = [before.uid, after.uid, *before.source_hashes.values(), *after.source_hashes.values()]
    result: dict[str, Any] = {
        "fromFrame": before.uid, "toFrame": after.uid, "fromOrder": before.order,
        "toOrder": after.order, "evidence": sorted(set(references)),
        "seconds": None, "clockId": None, "coordinateFrameId": None,
        "unsupported": "acquisition_time_unavailable",
    }
    if not first or not second or "at_seconds" not in first or "at_seconds" not in second:
        return result
    if first["clock_id"] != second["clock_id"]:
        return {**result, "unsupported": "acquisition_clock_changed"}
    elapsed = second["at_seconds"] - first["at_seconds"]
    if elapsed <= 0:
        raise ValueError("acquisition times must increase within a clock")
    if not first.get("coordinate_frame_id") or first.get("coordinate_frame_id") != second.get("coordinate_frame_id"):
        return {**result, "unsupported": "fixed_coordinate_reference_unavailable"}
    return {
        **result, "seconds": elapsed, "clockId": first["clock_id"],
        "coordinateFrameId": first["coordinate_frame_id"], "unsupported": None,
    }


def directional_contact(points: Sequence[Sequence[int]], other: Sequence[Sequence[int]], direction: Sequence[float]) -> int:
    """One-pixel directional boundary probe; zero is measured clearance."""
    magnitude = math.hypot(*direction)
    if not magnitude:
        raise ValueError("contact probe direction must be nonzero")
    dx, dy = (int(round(value / magnitude)) for value in direction)
    mask, target = {tuple(p) for p in points}, {tuple(p) for p in other}
    return sum((x + dx, y + dy) not in mask and (x + dx, y + dy) in target for x, y in mask)


def heading_delta(first: Sequence[float], second: Sequence[float]) -> float:
    delta = math.degrees(math.atan2(second[1], second[0]) - math.atan2(first[1], first[0]))
    return (delta + 180) % 360 - 180


def validate_observation_metadata(value: Mapping[str, Any] | None) -> None:
    if value is None:
        return
    required = {"source_ref", "source_hash"}
    optional = {"at_seconds", "clock_id", "coordinate_frame_id", "viewport_complete"}
    if not isinstance(value, Mapping) or required - value.keys() or value.keys() - required - optional:
        raise ValueError("observation metadata has missing or unsupported fields")
    for name in (required | {"clock_id", "coordinate_frame_id"}) & value.keys():
        if not isinstance(value[name], str) or not value[name].strip() or any(ord(c) < 32 for c in value[name]):
            raise ValueError(f"observation metadata {name} requires a source identifier")
    if ("at_seconds" in value) != ("clock_id" in value):
        raise ValueError("acquisition time and clock identity must be supplied together")
    if "at_seconds" in value and (
        type(value["at_seconds"]) not in (int, float) or not math.isfinite(value["at_seconds"]) or value["at_seconds"] < 0
    ):
        raise ValueError("acquisition time must be finite and nonnegative")
    if "viewport_complete" in value and type(value["viewport_complete"]) is not bool:
        raise ValueError("viewport completeness must be an explicit boolean")
