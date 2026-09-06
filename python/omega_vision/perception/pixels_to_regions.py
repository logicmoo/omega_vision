"""pixels_to_regions.py — bbox-FREE perception for any image (ARC, cartoon, CGI).

No bounding boxes anywhere. The image is first ENHANCED (default: a light
PIL denoise + degradation repair), then pixels are grouped into COLOR BLOBS
that accept small color gradients (adjacent pixels join a blob while their
color step stays under --tolerance, so cel shading / JPEG banding stays one
blob), then we derive PURELY TOPOLOGICAL facts from the pixels:

  region(Id, Color, Area, centroid(CX,CY)).
  adjacent(A, B).        % some pixel of A is 4-adjacent to some pixel of B
  encloses(Outer, Inner).% Inner's only neighbour is Outer and it never touches
                         % the image edge -> Outer completely surrounds Inner
  border(Id).            % region has a pixel on the image edge
  img_size(W, H).
  polygon(Id, Points).   % OUTER edge (silhouette)
  hole(Id, Points).      % INNER edges (cutouts), stored separately
  midline(Id, Points).   % median lines: distance-transform crest polylines
  fillpoint(Id, xy(X,Y), Depth). % all points found in the fill: every local
                         % distance peak, guaranteed interior, deepest first

Prolog then reasons over adjacency + enclosure — never a box. Optionally also
emit the quantized cell/3 grid (--grid) for full pixel fidelity.

Usage:
    python pixels_to_regions.py IMG.png --prolog out.pl
    python pixels_to_regions.py IMG.png --tolerance 0 --colors 14 --smooth 3 \
        --minfrac 0.0008 --prolog out.pl   # legacy global-quantize mode
"""
from __future__ import annotations

import argparse
import sys
from collections import defaultdict
from pathlib import Path

import numpy as np
from PIL import Image, ImageDraw, ImageFilter, ImageOps
from scipy import ndimage
from scipy.sparse import coo_matrix
from scipy.sparse.csgraph import connected_components

STRUCT4 = np.array([[0, 1, 0], [1, 1, 1], [0, 1, 0]])


def looks_flat_art(rgb_array: np.ndarray) -> bool:
    """True for cartoon / gridded / cel-flat art: a large share of 4-neighbor
    pixel pairs are (near-)identical, or the palette is tiny. Photographs and
    degraded scans fail both tests."""
    h, w = rgb_array.shape[:2]
    step = max(1, max(h, w) // 256)
    px = rgb_array[::step, ::step].astype(np.int16)
    right_flat = (np.abs(px[:, :-1] - px[:, 1:]).max(axis=2) <= 2).mean()
    down_flat = (np.abs(px[:-1, :] - px[1:, :]).max(axis=2) <= 2).mean()
    flat_fraction = (float(right_flat) + float(down_flat)) / 2.0
    packed = (px[:, :, 0].astype(np.int32) << 16) | (px[:, :, 1].astype(np.int32) << 8) | px[:, :, 2].astype(np.int32)
    unique_colors = int(np.unique(packed).size)
    return flat_fraction >= 0.55 or unique_colors <= 64


def enhance(img: Image.Image, mode: str = "auto") -> tuple[Image.Image, str]:
    """Pre-filter run before Prolog ever sees the image.

    "enhance" uses the Python vision library (PIL) for a little denoising and
    degradation repair: a 3px median filter knocks out impulse/JPEG noise and
    a gentle autocontrast (1% clip) restores washed-out levels. "auto" (the
    default) applies it only to images that are NOT cartoon or gridded items
    — flat cel art and ARC grids are already clean and would only be softened.
    Returns the image plus the action actually taken.
    """
    rgb = img.convert("RGB")
    if mode == "none":
        return rgb, "none"
    if mode == "auto" and looks_flat_art(np.asarray(rgb)):
        return rgb, "skipped (flat art/grid)"
    rgb = rgb.filter(ImageFilter.MedianFilter(size=3))
    return ImageOps.autocontrast(rgb, cutoff=1), "enhanced"


def gradient_blobs(rgb_array: np.ndarray, tolerance: int):
    """Label COLOR BLOBS that accept small color gradients: 4-adjacent pixels
    belong to the same blob when every channel differs by <= tolerance, so a
    smoothly shaded surface stays one blob but hard edges still split. Each
    blob's color is the mean RGB of its members; perimeter counts boundary
    pixel-pairs (to other blobs or the image edge) for bbox-free shape cues."""
    h, w = rgb_array.shape[:2]
    px = rgb_array.astype(np.int16)
    n = h * w
    ids = np.arange(n, dtype=np.int64).reshape(h, w)

    def joins(a: np.ndarray, b: np.ndarray) -> np.ndarray:
        return np.abs(a - b).max(axis=2) <= tolerance

    right = joins(px[:, :-1], px[:, 1:])
    down = joins(px[:-1, :], px[1:, :])
    rows = np.concatenate([ids[:, :-1][right], ids[:-1, :][down]])
    cols = np.concatenate([ids[:, 1:][right], ids[1:, :][down]])
    graph = coo_matrix((np.ones(rows.size, dtype=np.int8), (rows, cols)), shape=(n, n))
    _count, flat = connected_components(graph, directed=False)
    labels = (flat + 1).astype(np.int32).reshape(h, w)  # region ids start at 1

    flat0 = labels.ravel() - 1
    areas = np.bincount(flat0)
    sums = np.zeros((areas.size, 3), dtype=np.int64)
    for channel in range(3):
        sums[:, channel] = np.bincount(flat0, weights=px[:, :, channel].ravel()).astype(np.int64)
    ys, xs = np.divmod(np.arange(n), w)
    cx = np.bincount(flat0, weights=xs) / np.maximum(areas, 1)
    cy = np.bincount(flat0, weights=ys) / np.maximum(areas, 1)
    edge = np.zeros(areas.size, dtype=bool)
    for sel in (labels[0, :], labels[-1, :], labels[:, 0], labels[:, -1]):
        edge[np.unique(sel) - 1] = True

    info: dict[int, dict] = {}
    for gid0 in range(areas.size):
        area = int(areas[gid0])
        if area == 0:
            continue
        r, g, b = (sums[gid0] / area).round().astype(int)
        info[gid0 + 1] = {
            "color": f"#{r:02x}{g:02x}{b:02x}",
            "area": area,
            "cx": int(round(cx[gid0])),
            "cy": int(round(cy[gid0])),
            "border": bool(edge[gid0]),
        }
    return labels, info


def quantize(img: Image.Image, n_colors: int, smooth: int):
    rgb = img.convert("RGB")
    if smooth > 0:
        rgb = rgb.filter(ImageFilter.MedianFilter(size=smooth))
    q = rgb.quantize(colors=n_colors, method=Image.MEDIANCUT)
    idx = np.array(q)
    pal = q.getpalette()[: n_colors * 3]
    colors = [(pal[i], pal[i + 1], pal[i + 2]) for i in range(0, len(pal), 3)]
    return idx, colors


def label_map(idx: np.ndarray, colors):
    """Assign every pixel a globally-unique region label; collect per-region
    color / area / centroid / border-touch (no bbox)."""
    h, w = idx.shape
    labels = np.zeros((h, w), dtype=np.int32)
    info: dict[int, dict] = {}
    nxt = 1
    for ci in np.unique(idx):
        lab, n = ndimage.label(idx == ci, structure=STRUCT4)
        for comp in range(1, n + 1):
            sel = lab == comp
            gid = nxt
            nxt += 1
            labels[sel] = gid
            ys, xs = np.where(sel)
            r, g, b = colors[ci]
            info[gid] = {
                "color": f"#{r:02x}{g:02x}{b:02x}",
                "area": int(xs.size),
                "cx": int(round(xs.mean())),
                "cy": int(round(ys.mean())),
                "border": bool(xs.min() == 0 or ys.min() == 0 or xs.max() == w - 1 or ys.max() == h - 1),
            }
    return labels, info


def adjacency(labels: np.ndarray):
    """Neighbor pairs with their shared-edge strength: how many pixel pairs
    the two regions share along an exact 4-neighbor boundary."""
    pairs: dict[tuple[int, int], int] = {}
    for A, B in ((labels[:, :-1], labels[:, 1:]), (labels[:-1, :], labels[1:, :])):
        d = A != B
        if not d.any():
            continue
        u = np.stack([A[d], B[d]], axis=1)
        u.sort(axis=1)
        uniq, counts = np.unique(u, axis=0, return_counts=True)
        for (a, b), n in zip(uniq, counts):
            key = (int(a), int(b))
            pairs[key] = pairs.get(key, 0) + int(n)
    return pairs


def enclosures(info, neigh):
    """Inner is enclosed by Outer iff Inner never touches the edge and its ONLY
    neighbouring region is Outer — a true surround, independent of shape."""
    out = []
    for gid, i in info.items():
        if i["border"]:
            continue
        ns = neigh.get(gid, set())
        if len(ns) == 1:
            out.append((next(iter(ns)), gid))
    return out


def add_enclosed_parts(info, pairs, big: set, floor: int = 4) -> set:
    """Enclosed fillers survive min_area: a region fully surrounded by a kept
    part is itself a part (eye dots, mouth holes), however small - it is the
    thing that fills a cutout. Iterates so nested fillers (pupil inside iris
    inside eye-white) all make it in."""
    neigh = defaultdict(set)
    for a, b in pairs:
        neigh[a].add(b)
        neigh[b].add(a)
    added = True
    while added:
        added = False
        for outer, inner in enclosures(info, neigh):
            if outer in big and inner not in big and info[inner]["area"] >= floor:
                big.add(inner)
                added = True
    return big


def perimeters(labels: np.ndarray) -> dict[int, int]:
    """Boundary length per region: pixel pairs facing a different region plus
    pixels on the image edge (bbox-free shape cue: perimeter^2/area separates
    compact tiles from organic silhouettes)."""
    out: dict[int, int] = defaultdict(int)
    for A, B in ((labels[:, :-1], labels[:, 1:]), (labels[:-1, :], labels[1:, :])):
        d = A != B
        if not d.any():
            continue
        for side in (A[d], B[d]):
            ids, counts = np.unique(side, return_counts=True)
            for gid, count in zip(ids, counts):
                out[int(gid)] += int(count)
    for sel in (labels[0, :], labels[-1, :], labels[:, 0], labels[:, -1]):
        ids, counts = np.unique(sel, return_counts=True)
        for gid, count in zip(ids, counts):
            out[int(gid)] += int(count)
    return out


def region_polygons(labels: np.ndarray, big: set, tolerance: float = 1.5) -> dict[int, dict]:
    """Trace each part's boundaries and simplify them into polygons
    (marching squares + Douglas-Peucker). Points are (x, y) image coords.
    The OUTER edge (silhouette, the longest contour) and every INNER edge
    (holes: eye sockets, gaps, enclosed cutouts) are stored separately."""
    from skimage import measure  # noqa: PLC0415

    def simplify(contour) -> list[tuple[int, int]]:
        simplified = measure.approximate_polygon(contour, tolerance=tolerance)
        return [(int(round(x)), int(round(y))) for y, x in simplified]

    polygons: dict[int, dict] = {}
    for gid in big:
        mask = labels == gid
        contours = measure.find_contours(mask.astype(np.uint8), 0.5)
        if not contours:
            continue
        contours = sorted(contours, key=len, reverse=True)
        outer = simplify(contours[0])
        if len(outer) < 3:
            continue
        holes = [pts for pts in (simplify(c) for c in contours[1:]) if len(pts) >= 3]
        polygons[gid] = {"outer": outer, "holes": holes}
    return polygons


def _neighbors8(point: tuple[int, int], pool: set) -> list[tuple[int, int]]:
    x, y = point
    return [(x + dx, y + dy)
            for dx in (-1, 0, 1) for dy in (-1, 0, 1)
            if (dx or dy) and (x + dx, y + dy) in pool]


def _prune_spurs(points: set, dist: np.ndarray) -> set:
    """Keep only the CREST of the medial axis (think of the part as a sand
    mound: height = distance to the nearest edge; the midline is the ridge
    of highest points). The exact medial axis grows spurs that CLIMB from
    every corner up to the crest — a solid rectangle would get 4 diagonals.
    From each endpoint, walk while the height keeps climbing and prune that
    climb (when its length fits the corner geometry), leaving the rectangle
    a single straight line ending as far from the short sides as it is from
    the long sides. Ridges (constant height) never climb, so they survive."""
    pts = set(points)
    for _ in range(12):
        changed = False
        for endpoint in [p for p in pts if len(_neighbors8(p, pts)) == 1]:
            if endpoint not in pts:
                continue
            branch = [endpoint]
            prev: tuple[int, int] | None = None
            cur = endpoint
            while True:
                nxt = [n for n in _neighbors8(cur, pts) if n != prev]
                if len(nxt) != 1:
                    break  # junction or chain end: the climb stops here
                if dist[nxt[0][1], nxt[0][0]] <= dist[cur[1], cur[0]] + 0.2:
                    break  # stopped climbing: we reached the crest plateau
                branch.append(nxt[0])
                prev, cur = cur, nxt[0]
            climb = branch[:-1]  # keep the top pixel: the crest starts there
            if not climb:
                continue
            top = branch[-1]
            crest_h = float(dist[top[1], top[0]])
            if len(climb) <= 1.6 * crest_h + 3:
                pts -= set(climb)
                changed = True
        if not changed:
            break
    return pts


def _skeleton_paths(mask: np.ndarray, origin: tuple[int, int]) -> list[list[tuple[int, int]]]:
    """Medial-axis CREST of one region mask, walked into ordered polylines
    (endpoints first, then leftover loops — a donut yields the ring circle).
    Returns (x, y) paths in full-image coordinates."""
    from skimage.morphology import medial_axis  # noqa: PLC0415

    padded = np.pad(mask, 1)
    skeleton, dist = medial_axis(padded, return_distance=True)
    ys, xs = np.nonzero(skeleton)
    if xs.size == 0:
        return []
    oy, ox = origin[0] - 1, origin[1] - 1
    points = {(int(x), int(y)) for x, y in zip(xs, ys)}
    points = _prune_spurs(points, dist)
    if not points:
        # everything pruned (e.g. a square: crest degenerates to the peak)
        peak = int(np.argmax(dist))
        py, px = np.unravel_index(peak, dist.shape)
        return [[(int(px) + ox, int(py) + oy)]]

    def neighbors(point: tuple[int, int], pool: set) -> list[tuple[int, int]]:
        return _neighbors8(point, pool)

    remaining = set(points)
    paths: list[list[tuple[int, int]]] = []
    while remaining:
        endpoints = [p for p in remaining if len(neighbors(p, remaining)) <= 1]
        current = endpoints[0] if endpoints else next(iter(remaining))
        path = [current]
        remaining.discard(current)
        while True:
            options = neighbors(current, remaining)
            if not options:
                break
            current = options[0]
            path.append(current)
            remaining.discard(current)
        if len(path) >= 2:
            paths.append([(x + ox, y + oy) for x, y in path])
    if not paths:
        # crest degenerated to a peak (e.g. a square): keep the highest point
        best = max(points, key=lambda p: dist[p[1], p[0]])
        return [[(best[0] + ox, best[1] + oy)]]
    return paths


def _simplify_no_cutout(path: list[tuple[int, int]], inside, tolerance: float) -> list[tuple[int, int]]:
    """Douglas-Peucker constrained to the part raster: a chord is accepted
    only when every pixel under it stays inside the part, so midlines never
    cross into cutouts. Kept vertices are original skeleton pixels - each one
    could seed a fill. Points that merely touch an edge stay; fill is simply
    never called from midline points (fillpoint/3 owns that)."""
    if len(path) <= 2:
        return list(path)

    def chord_ok(i: int, j: int) -> bool:
        x0, y0 = path[i]
        x1, y1 = path[j]
        n = int(max(abs(x1 - x0), abs(y1 - y0)))
        for t in range(1, n):
            if not inside(round(x0 + (x1 - x0) * t / n), round(y0 + (y1 - y0) * t / n)):
                return False
        return True

    keep = {0, len(path) - 1}
    stack = [(0, len(path) - 1)]
    while stack:
        i, j = stack.pop()
        if j <= i + 1:
            continue
        x0, y0 = path[i]
        x1, y1 = path[j]
        dx, dy = x1 - x0, y1 - y0
        norm = (dx * dx + dy * dy) ** 0.5 or 1.0
        kmax, dmax = -1, -1.0
        for k in range(i + 1, j):
            px, py = path[k]
            d = abs(dx * (y0 - py) - dy * (x0 - px)) / norm
            if d > dmax:
                kmax, dmax = k, d
        if dmax <= tolerance and chord_ok(i, j):
            continue
        keep.add(kmax)
        stack.append((i, kmax))
        stack.append((kmax, j))
    return [path[k] for k in sorted(keep)]


def region_midlines(labels: np.ndarray, big: set, tolerance: float = 1.5) -> dict[int, list[list[tuple[int, int]]]]:
    """Medial-axis MIDLINES for every part — solid parts get their structural
    skeleton, stroke-like parts get their stroke path — as simplified
    polylines. Stored separately from the outer/inner edge polygons. Every
    vertex is an interior skeleton pixel (a potential fill point) and no
    segment crosses into a cutout."""
    midlines: dict[int, list[list[tuple[int, int]]]] = {}
    for gid in big:
        ys, xs = np.nonzero(labels == gid)
        if xs.size == 0:
            continue
        y0, y1, x0, x1 = ys.min(), ys.max(), xs.min(), xs.max()
        sub = labels[y0:y1 + 1, x0:x1 + 1] == gid

        def inside(x: int, y: int) -> bool:
            return 0 <= y - y0 <= y1 - y0 and 0 <= x - x0 <= x1 - x0 and bool(sub[y - y0, x - x0])

        paths = _skeleton_paths(sub, (int(y0), int(x0)))
        simplified: list[list[tuple[int, int]]] = []
        for path in paths:
            pts = [(int(x), int(y)) for x, y in _simplify_no_cutout(path, inside, tolerance)]
            if len(pts) >= 2:
                simplified.append(pts)
        if not simplified and paths:
            # crest degenerated to a peak (e.g. a square) — keep the point
            simplified = [[paths[0][0]]]
        if simplified:
            midlines[gid] = simplified
    return midlines


def region_fillpoints(labels: np.ndarray, big: set) -> dict[int, list[tuple[int, int, float]]]:
    """All fill peaks per part: every local maximum plateau of the distance
    transform, one representative point each, deepest first. Each point is
    guaranteed inside the part (a centroid is not: donuts, crescents); depth
    is the local half-width. Seeds flood fills, anchors cutout tests, and
    hands redraw its brush centers."""
    fillpoints: dict[int, list[tuple[int, int, float]]] = {}
    slices = ndimage.find_objects(labels + 1)
    for gid in big:
        sl = slices[gid] if gid < len(slices) else None
        if sl is None:
            continue
        mask = np.pad(labels[sl] == gid, 1)
        dist = ndimage.distance_transform_edt(mask)
        peak = float(dist.max())
        if peak <= 0:
            continue
        local_max = (dist == ndimage.maximum_filter(dist, size=3)) & mask
        # one representative per connected peak plateau, skipping shallow noise
        floor = max(1.0, 0.25 * peak)
        plateaus, count = ndimage.label(local_max & (dist >= floor))
        points: list[tuple[int, int, float]] = []
        for index in range(1, count + 1):
            ys, xs = np.nonzero(plateaus == index)
            mid = len(ys) // 2
            py, px = int(ys[mid]), int(xs[mid])
            points.append((px - 1 + sl[1].start, py - 1 + sl[0].start,
                           round(float(dist[py, px]), 1)))
        points.sort(key=lambda p: -p[2])
        if points:
            fillpoints[gid] = points
    return fillpoints


def to_prolog(info, pairs, big: set, w: int, h: int, perims: dict[int, int] | None = None,
              polygons: dict[int, dict] | None = None,
              midlines: dict[int, list[list[tuple[int, int]]]] | None = None,
              fillpoints: dict[int, list[tuple[int, int, float]]] | None = None) -> str:
    neigh = defaultdict(set)
    for a, b in pairs:
        neigh[a].add(b)
        neigh[b].add(a)
    encl = [(o, i) for (o, i) in enclosures(info, neigh) if o in big and i in big]
    L = [
        "% bbox-FREE region facts (topology only).",
        ":- dynamic region/4.", ":- dynamic adjacent/2.", ":- dynamic shared_edge/3.",
        ":- dynamic encloses/2.", ":- dynamic border/1.", ":- dynamic img_size/2.",
        ":- dynamic perimeter/2.", ":- dynamic polygon/2.", ":- dynamic hole/2.",
        ":- dynamic midline/2.", ":- dynamic fillpoint/3.",
        ":- discontiguous region/4.", ":- discontiguous adjacent/2.",
        ":- discontiguous shared_edge/3.", ":- discontiguous encloses/2.",
        ":- discontiguous border/1.", ":- discontiguous perimeter/2.",
        ":- discontiguous polygon/2.", ":- discontiguous hole/2.",
        ":- discontiguous midline/2.", ":- discontiguous fillpoint/3.",
        f"img_size({w}, {h}).", "",
    ]
    for gid in sorted(big, key=lambda g: -info[g]["area"]):
        i = info[gid]
        L.append(f"region(r{gid}, '{i['color']}', {i['area']}, centroid({i['cx']},{i['cy']})).")
        if perims and gid in perims:
            L.append(f"perimeter(r{gid}, {perims[gid]}).")
        if polygons and gid in polygons:
            outer = ",".join(f"xy({x},{y})" for x, y in polygons[gid]["outer"])
            L.append(f"polygon(r{gid}, [{outer}]).")
            for hole_points in polygons[gid]["holes"]:
                inner = ",".join(f"xy({x},{y})" for x, y in hole_points)
                L.append(f"hole(r{gid}, [{inner}]).")
        if midlines and gid in midlines:
            for line in midlines[gid]:
                mid = ",".join(f"xy({x},{y})" for x, y in line)
                L.append(f"midline(r{gid}, [{mid}]).")
        if fillpoints and gid in fillpoints:
            for fx, fy, depth in fillpoints[gid]:
                L.append(f"fillpoint(r{gid}, xy({fx},{fy}), {depth}).")
        if i["border"]:
            L.append(f"border(r{gid}).")
    L.append("")
    for (a, b) in sorted(pairs):
        if a in big and b in big:
            L.append(f"adjacent(r{a}, r{b}).")
            L.append(f"shared_edge(r{a}, r{b}, {pairs[(a, b)]}).")
    L.append("")
    for o, i in encl:
        L.append(f"encloses(r{o}, r{i}).")
    return "\n".join(L) + "\n"


def grid_to_prolog(idx: np.ndarray, colors, cell: int) -> str:
    h, w = idx.shape
    gh, gw = h // cell, w // cell
    L = ["% quantized pixel grid: cell(X, Y, Color).", ":- dynamic cell/3.", ""]
    for gy in range(gh):
        for gx in range(gw):
            block = idx[gy*cell:(gy+1)*cell, gx*cell:(gx+1)*cell]
            ci = int(np.bincount(block.ravel()).argmax())
            r, g, b = colors[ci]
            L.append(f"cell({gx}, {gy}, '#{r:02x}{g:02x}{b:02x}').")
    return "\n".join(L) + "\n"


def _draw_parts_debug(img: Image.Image, polygons: dict[int, dict],
                      midlines: dict[int, list[list[tuple[int, int]]]],
                      fillpoints: dict[int, list[tuple[int, int, float]]]) -> Image.Image:
    """debug_image.png for the parts_map transform: faded original with green
    outer edges, red cutouts, blue median lines, orange fill peaks."""
    base = img.convert("RGB")
    out = Image.blend(base, Image.new("RGB", base.size, (255, 255, 255)), 0.55)
    draw = ImageDraw.Draw(out)
    for gid, d in polygons.items():
        outer = d["outer"]
        if outer:
            draw.line(list(outer) + [outer[0]], fill=(0, 170, 0), width=1)
        for ring in d["holes"]:
            draw.line(list(ring) + [ring[0]], fill=(230, 30, 30), width=1)
    for gid, paths in midlines.items():
        for path in paths:
            if len(path) == 1:
                x, y = path[0]
                draw.ellipse([x - 1, y - 1, x + 1, y + 1], fill=(40, 90, 255))
            else:
                draw.line(path, fill=(40, 90, 255), width=1)
    for gid, points in fillpoints.items():
        for x, y, _depth in points[:3]:
            draw.ellipse([x - 2, y - 2, x + 2, y + 2], outline=(255, 140, 0))
    return out


def extract_region_facts(
    image_path: str | Path,
    *,
    tolerance: int = 24,
    filter_mode: str = "auto",
    max_dim: int = 960,
    minfrac: float = 0.0008,
    debug_image: str | Path | None = None,
) -> dict:
    """One-call pipeline for the image importer / video system: enhance ->
    gradient-tolerant color blobs -> bbox-free Prolog region facts. Returns
    the facts text plus extraction stats and a per-part summary; callers
    persist/consume as needed. When ``debug_image`` is given, renders the
    edges + median lines + fill peaks overlay there."""
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
    polygons = region_polygons(labels, big)
    midlines = region_midlines(labels, big)
    fillpoints = region_fillpoints(labels, big)
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


def main(argv: list[str]) -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("image")
    ap.add_argument("--filter", default="auto", choices=("auto", "enhance", "none"),
                    help="pre-filter before Prolog consumes the image: auto enhances only "
                         "non-cartoon/non-grid images (default), enhance always, none never")
    ap.add_argument("--tolerance", type=int, default=24,
                    help="max per-channel step joining a gradient blob; 0 = legacy global quantize")
    ap.add_argument("--blob-colors", type=int, default=32,
                    help="palette size snapped before tolerance joining (kills antialias leak paths)")
    ap.add_argument("--max-dim", type=int, default=960,
                    help="downscale so the longest side stays within this many pixels (0 = never)")
    ap.add_argument("--colors", type=int, default=14)
    ap.add_argument("--minfrac", type=float, default=0.0008)
    ap.add_argument("--smooth", type=int, default=0)
    ap.add_argument("--prolog")
    ap.add_argument("--grid")
    ap.add_argument("--cell", type=int, default=1)
    args = ap.parse_args(argv)

    img = Image.open(args.image)
    if args.max_dim and max(img.size) > args.max_dim:
        scale = args.max_dim / max(img.size)
        img = img.resize((max(1, round(img.size[0] * scale)), max(1, round(img.size[1] * scale))), Image.LANCZOS)
    img, filter_action = enhance(img, args.filter)
    w, h = img.size
    idx = None
    colors = None
    if args.tolerance > 0:
        # Snap to a dominant palette first: antialiased ramps collapse onto the
        # outline/fill colors they bridge, so tolerance joins gradient bands
        # WITHOUT leaking across real (outlined) edges.
        idx, colors = quantize(img, args.blob_colors, 0)
        palette_rgb = np.asarray(colors, dtype=np.int16)[idx]
        labels, info = gradient_blobs(palette_rgb, args.tolerance)
        mode = f"tolerance={args.tolerance} over {args.blob_colors}-color palette (filter={filter_action})"
    else:
        idx, colors = quantize(img, args.colors, args.smooth)
        labels, info = label_map(idx, colors)
        mode = f"{args.colors} colors (smooth={args.smooth}, filter={filter_action})"
    min_area = max(12, int(args.minfrac * w * h))
    big = {gid for gid, i in info.items() if i["area"] >= min_area}
    pairs = adjacency(labels)
    big = add_enclosed_parts(info, pairs, big)
    perims = perimeters(labels)
    print(f"{args.image}: {w}x{h}px, {mode}, "
          f"min_area={min_area}px -> {len(big)} regions, {sum(1 for a,b in pairs if a in big and b in big)} adjacencies")
    if args.prolog:
        Path(args.prolog).write_text(
            to_prolog(info, pairs, big, w, h, perims, region_polygons(labels, big),
                      region_midlines(labels, big), region_fillpoints(labels, big)), encoding="utf-8")
        print("wrote", args.prolog)
    if args.grid:
        if idx is None:
            idx, colors = quantize(img, args.colors, args.smooth)
        Path(args.grid).write_text(grid_to_prolog(idx, colors, max(1, args.cell)), encoding="utf-8")
        gh, gw = h // max(1, args.cell), w // max(1, args.cell)
        print(f"wrote {args.grid}  ({gw}x{gh} = {gw*gh} cell/3 facts)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
