"""pixels_to_regions_cv.py — OpenCV-accelerated shape finder (python_opencv doer).

Same job and same output contract as :mod:`pixels_to_regions` (the
python_scikit doer): every kept part gets its color + OUTER EDGE
(``polygon/2``) + INNER EDGES (``hole/2``) + INNER MEDIALS (``midline/2``)
+ fill peaks (``fillpoint/3``), emitted through the shared
:func:`pixels_to_regions.to_prolog` writer so downstream Prolog rules
(grouping, turtle programs) consume either doer's facts unchanged.

The speedup comes from doing the per-part geometry on BOUNDING-BOX-cropped
masks with OpenCV primitives instead of full-frame scikit passes:

- outer/inner edges: ``cv2.findContours`` (RETR_CCOMP) + ``cv2.approxPolyDP``
- inner medials:     ``cv2.ximgproc.thinning`` (contrib) when available,
                     else ``skimage.morphology.medial_axis`` on the crop;
                     both feed the same crest pruning + path walking
- fill peaks:        ``cv2.distanceTransform`` local maxima

Segmentation reuses the shared gradient-blob labeller so parts stay
comparable across doers.
"""
from __future__ import annotations

import json
from pathlib import Path

import numpy as np
from PIL import Image

from omega_vision.perception.pixels_to_regions import (
    _draw_parts_debug,
    _neighbors8,
    _prune_spurs,
    _simplify_no_cutout,
    add_enclosed_parts,
    adjacency,
    enhance,
    gradient_blobs,
    label_map,
    perimeters,
    quantize,
    to_prolog,
)


def _require_cv2():
    try:
        import cv2  # noqa: PLC0415
    except ImportError as error:  # pragma: no cover - environment-specific
        raise RuntimeError(
            "python_opencv doer needs opencv (pip install opencv-contrib-python-headless)"
        ) from error
    return cv2


def _region_boxes(labels: np.ndarray, big: set) -> dict[int, tuple[int, int, int, int]]:
    """(y0, y1, x0, x1) inclusive bounding box per kept region, one pass."""
    from scipy import ndimage  # noqa: PLC0415

    boxes: dict[int, tuple[int, int, int, int]] = {}
    for gid, sl in enumerate(ndimage.find_objects(labels), start=1):
        if sl is None or gid not in big:
            continue
        boxes[gid] = (sl[0].start, sl[0].stop - 1, sl[1].start, sl[1].stop - 1)
    return boxes


def _ring(points: list[tuple[int, int]]) -> list[tuple[int, int]]:
    """Close the ring like the scikit contours do (first point repeated last)."""
    if points and points[0] != points[-1]:
        return points + [points[0]]
    return points


def region_polygons_cv(labels: np.ndarray, big: set,
                       boxes: dict[int, tuple[int, int, int, int]],
                       tolerance: float = 1.5) -> dict[int, dict]:
    """OUTER EDGE + INNER EDGES per part via cv2.findContours on the cropped
    mask: the largest external contour is the silhouette, every hierarchy
    child is an inner edge (hole)."""
    cv2 = _require_cv2()
    polygons: dict[int, dict] = {}
    for gid in big:
        box = boxes.get(gid)
        if box is None:
            continue
        y0, y1, x0, x1 = box
        mask = (labels[y0:y1 + 1, x0:x1 + 1] == gid).astype(np.uint8)
        contours, hierarchy = cv2.findContours(mask, cv2.RETR_CCOMP, cv2.CHAIN_APPROX_SIMPLE)
        if not contours or hierarchy is None:
            continue
        hierarchy = hierarchy[0]

        def simplify(contour) -> list[tuple[int, int]]:
            approx = cv2.approxPolyDP(contour, tolerance, True)
            return [(int(p[0][0]) + x0, int(p[0][1]) + y0) for p in approx]

        externals = [i for i, h in enumerate(hierarchy) if h[3] < 0]
        if not externals:
            continue
        outer_index = max(externals, key=lambda i: cv2.contourArea(contours[i]))
        outer = _ring(simplify(contours[outer_index]))
        if len(outer) < 3:
            continue
        holes: list[list[tuple[int, int]]] = []
        for i, h in enumerate(hierarchy):
            ring = None
            if h[3] >= 0:
                ring = _ring(simplify(contours[i]))  # true inner edge
            elif i != outer_index:
                ring = _ring(simplify(contours[i]))  # disjoint island, kept like scikit
            if ring and len(ring) >= 3:
                holes.append(ring)
        polygons[gid] = {"outer": outer, "holes": holes}
    return polygons


def _skeleton_points(mask: np.ndarray) -> tuple[set, np.ndarray]:
    """Skeleton pixel set + distance-to-edge map for one padded crop mask.
    cv2.ximgproc.thinning when the contrib build is present, else the
    scikit medial axis (still fast: the mask is bbox-cropped)."""
    cv2 = _require_cv2()
    dist = cv2.distanceTransform(mask.astype(np.uint8), cv2.DIST_L2, 3)
    thinning = getattr(getattr(cv2, "ximgproc", None), "thinning", None)
    if thinning is not None:
        skeleton = thinning(mask.astype(np.uint8) * 255) > 0
    else:  # pragma: no cover - depends on the installed opencv flavor
        from skimage.morphology import medial_axis  # noqa: PLC0415
        skeleton, dist = medial_axis(mask, return_distance=True)
    ys, xs = np.nonzero(skeleton)
    return {(int(x), int(y)) for x, y in zip(xs, ys)}, dist


def _walk_paths(points: set, dist: np.ndarray) -> list[list[tuple[int, int]]]:
    """Order skeleton pixels into polylines (endpoints first, then loops)."""
    remaining = set(points)
    paths: list[list[tuple[int, int]]] = []
    while remaining:
        endpoints = [p for p in remaining if len(_neighbors8(p, remaining)) <= 1]
        current = endpoints[0] if endpoints else next(iter(remaining))
        path = [current]
        remaining.discard(current)
        while True:
            options = _neighbors8(current, remaining)
            if not options:
                break
            current = options[0]
            path.append(current)
            remaining.discard(current)
        if len(path) >= 2:
            paths.append(path)
    if not paths and points:
        best = max(points, key=lambda p: dist[p[1], p[0]])
        return [[best]]
    return paths


def region_midlines_cv(labels: np.ndarray, big: set,
                       boxes: dict[int, tuple[int, int, int, int]],
                       tolerance: float = 1.5) -> dict[int, list[list[tuple[int, int]]]]:
    """INNER MEDIALS per part: thinning skeleton -> crest pruning -> ordered
    polylines, simplified without ever crossing a cutout (same guarantees as
    the scikit doer)."""
    midlines: dict[int, list[list[tuple[int, int]]]] = {}
    for gid in big:
        box = boxes.get(gid)
        if box is None:
            continue
        y0, y1, x0, x1 = box
        sub = labels[y0:y1 + 1, x0:x1 + 1] == gid
        padded = np.pad(sub, 1)
        points, dist = _skeleton_points(padded)
        if not points:
            continue
        points = _prune_spurs(points, dist)
        if not points:
            peak = int(np.argmax(dist))
            py, px = np.unravel_index(peak, dist.shape)
            midlines[gid] = [[(int(px) - 1 + x0, int(py) - 1 + y0)]]
            continue

        def inside(x: int, y: int) -> bool:
            return 0 <= y - y0 <= y1 - y0 and 0 <= x - x0 <= x1 - x0 and bool(sub[y - y0, x - x0])

        simplified: list[list[tuple[int, int]]] = []
        raw_paths = _walk_paths(points, dist)
        for path in raw_paths:
            full = [(x - 1 + x0, y - 1 + y0) for x, y in path]
            pts = [(int(x), int(y)) for x, y in _simplify_no_cutout(full, inside, tolerance)]
            if len(pts) >= 2:
                simplified.append(pts)
        if not simplified and raw_paths:
            x, y = raw_paths[0][0]
            simplified = [[(x - 1 + x0, y - 1 + y0)]]
        if simplified:
            midlines[gid] = simplified
    return midlines


def region_fillpoints_cv(labels: np.ndarray, big: set,
                         boxes: dict[int, tuple[int, int, int, int]]) -> dict[int, list[tuple[int, int, float]]]:
    """Fill peaks per part from the cv2 distance transform (deepest first)."""
    cv2 = _require_cv2()
    from scipy import ndimage  # noqa: PLC0415

    fillpoints: dict[int, list[tuple[int, int, float]]] = {}
    for gid in big:
        box = boxes.get(gid)
        if box is None:
            continue
        y0, y1, x0, x1 = box
        mask = np.pad(labels[y0:y1 + 1, x0:x1 + 1] == gid, 1)
        dist = cv2.distanceTransform(mask.astype(np.uint8), cv2.DIST_L2, 3)
        peak = float(dist.max())
        if peak <= 0:
            continue
        local_max = (dist == ndimage.maximum_filter(dist, size=3)) & mask
        floor = max(1.0, 0.25 * peak)
        plateaus, count = ndimage.label(local_max & (dist >= floor))
        points: list[tuple[int, int, float]] = []
        for index in range(1, count + 1):
            ys, xs = np.nonzero(plateaus == index)
            mid = len(ys) // 2
            py, px = int(ys[mid]), int(xs[mid])
            points.append((px - 1 + x0, py - 1 + y0, round(float(dist[py, px]), 1)))
        points.sort(key=lambda p: -p[2])
        if points:
            fillpoints[gid] = points
    return fillpoints


def extract_region_facts_cv(
    image_path: str | Path,
    *,
    tolerance: int = 24,
    filter_mode: str = "auto",
    max_dim: int = 960,
    minfrac: float = 0.0008,
    debug_image: str | Path | None = None,
    geometry_out: str | Path | None = None,
) -> dict:
    """OpenCV twin of :func:`pixels_to_regions.extract_region_facts`: same
    segmentation, same fact schema (outer edge + inner edges + inner medials
    + fill peaks), a fraction of the runtime."""
    _require_cv2()
    img = Image.open(image_path)
    if max_dim and max(img.size) > max_dim:
        scale = max_dim / max(img.size)
        img = img.resize((max(1, round(img.size[0] * scale)), max(1, round(img.size[1] * scale))), Image.LANCZOS)
    img, filter_action = enhance(img, filter_mode)
    w, h = img.size
    if tolerance > 0:
        labels, info = gradient_blobs(np.asarray(img.convert("RGB")), tolerance)
    else:
        idx, colors = quantize(img, 14, 0)
        labels, info = label_map(idx, colors)
    min_area = max(12, int(minfrac * w * h))
    big = {gid for gid, i in info.items() if i["area"] >= min_area}
    pairs = adjacency(labels)
    big = add_enclosed_parts(info, pairs, big)
    perims = perimeters(labels)
    boxes = _region_boxes(labels, big)
    polygons = region_polygons_cv(labels, big, boxes)
    midlines = region_midlines_cv(labels, big, boxes)
    fillpoints = region_fillpoints_cv(labels, big, boxes)
    parts = [
        {
            "id": f"r{gid}",
            "color": info[gid]["color"],
            "area": info[gid]["area"],
            "outer": len(polygons.get(gid, {}).get("outer", [])),
            "holes": len(polygons.get(gid, {}).get("holes", [])),
            "midlines": len(midlines.get(gid, [])),
            "fillpoints": len(fillpoints.get(gid, [])),
        }
        for gid in sorted(big, key=lambda g: -info[g]["area"])
    ]
    if debug_image is not None:
        _draw_parts_debug(img, polygons, midlines, fillpoints).save(debug_image)
    if geometry_out is not None:
        Path(geometry_out).write_text(json.dumps({
            "width": w,
            "height": h,
            "maxDim": max_dim,
            "filterMode": filter_mode,
            "polygons": {str(g): d for g, d in polygons.items()},
            "midlines": {str(g): p for g, p in midlines.items()},
            "fillpoints": {str(g): p for g, p in fillpoints.items()},
        }, ensure_ascii=False), encoding="utf-8")
    return {
        "prolog": to_prolog(info, pairs, big, w, h, perims, polygons, midlines, fillpoints),
        "width": w,
        "height": h,
        "regionCount": len(big),
        "adjacencyCount": sum(1 for a, b in pairs if a in big and b in big),
        "blobCount": len(info),
        "tolerance": tolerance,
        "filterAction": filter_action,
        "minArea": min_area,
        "parts": parts,
    }
