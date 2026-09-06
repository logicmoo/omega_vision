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
from PIL import Image, ImageFilter, ImageOps
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


def to_prolog(info, pairs, big: set, w: int, h: int, perims: dict[int, int] | None = None) -> str:
    neigh = defaultdict(set)
    for a, b in pairs:
        neigh[a].add(b)
        neigh[b].add(a)
    encl = [(o, i) for (o, i) in enclosures(info, neigh) if o in big and i in big]
    L = [
        "% bbox-FREE region facts (topology only).",
        ":- dynamic region/4.", ":- dynamic adjacent/2.", ":- dynamic shared_edge/3.",
        ":- dynamic encloses/2.", ":- dynamic border/1.", ":- dynamic img_size/2.",
        ":- dynamic perimeter/2.",
        ":- discontiguous region/4.", ":- discontiguous adjacent/2.",
        ":- discontiguous shared_edge/3.", ":- discontiguous encloses/2.",
        ":- discontiguous border/1.", ":- discontiguous perimeter/2.",
        f"img_size({w}, {h}).", "",
    ]
    for gid in sorted(big, key=lambda g: -info[g]["area"]):
        i = info[gid]
        L.append(f"region(r{gid}, '{i['color']}', {i['area']}, centroid({i['cx']},{i['cy']})).")
        if perims and gid in perims:
            L.append(f"perimeter(r{gid}, {perims[gid]}).")
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


def extract_region_facts(
    image_path: str | Path,
    *,
    tolerance: int = 24,
    filter_mode: str = "auto",
    max_dim: int = 960,
    minfrac: float = 0.0008,
) -> dict:
    """One-call pipeline for the image importer / video system: enhance ->
    gradient-tolerant color blobs -> bbox-free Prolog region facts. Returns
    the facts text plus extraction stats; callers persist/consume as needed."""
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
    perims = perimeters(labels)
    return {
        "prolog": to_prolog(info, pairs, big, w, h, perims),
        "width": w,
        "height": h,
        "regionCount": len(big),
        "adjacencyCount": sum(1 for a, b in pairs if a in big and b in big),
        "blobCount": len(info),
        "tolerance": tolerance,
        "filterAction": filter_action,
        "minArea": min_area,
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
    perims = perimeters(labels)
    print(f"{args.image}: {w}x{h}px, {mode}, "
          f"min_area={min_area}px -> {len(big)} regions, {sum(1 for a,b in pairs if a in big and b in big)} adjacencies")
    if args.prolog:
        Path(args.prolog).write_text(to_prolog(info, pairs, big, w, h, perims), encoding="utf-8")
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
