"""Darken Slight Gradients skill: flatten faint gradients without crossing real
colour edges. The workbench calls this directly - no LLM in the loop.

One deterministic pass reads from an immutable snapshot of the source image. For
every non-transparent pixel it inspects the 8 surrounding neighbours and, among
those that are (a) strictly darker in perceptual lightness, (b) only *slightly*
darker (``lightnessDelta <= maxLightnessDelta``, default 16 on 0..255), and (c)
close enough in colour (``max per-channel RGB delta <= maxChromaDelta``, default
32) that a real colour boundary is not crossed, it replaces the pixel with the
exact RGBA of the *darkest* qualifying neighbour. Otherwise the pixel is left
unchanged. Because every read is from the source snapshot, a single pass never
cascades across the image; repeat the filter as another stack step for a stronger
effect. Uses only NumPy + Pillow (no scikit-image / matplotlib).
"""

import numpy as np
from PIL import Image

SKILL = {
    "preprocessing": {"geometry": "identity"},
    "title": "Darken Slight Gradients",
    "description": (
        "For each pixel, replace it with the darkest 8-neighbour that is only "
        "slightly darker (<= maxLightnessDelta) and similar in colour (<= "
        "maxChromaDelta), flattening faint gradients without crossing real colour "
        "edges. One non-cascading pass; repeat as another stack step for more."
    ),
    "params": {"maxLightnessDelta": 16, "maxChromaDelta": 32},
}

# 8-connected neighbourhood, fixed order so ties resolve deterministically.
_NEIGHBORS = ((-1, -1), (-1, 0), (-1, 1), (0, -1), (0, 1), (1, -1), (1, 0), (1, 1))


def _luma(rgb: np.ndarray) -> np.ndarray:
    """Integer perceptual lightness (0..255) for an HxWx3 int array.

    Widen to int32 first: 255*587 overflows int16, which would corrupt the value.
    """
    rgb = rgb.astype(np.int32)
    return (rgb[..., 0] * 299 + rgb[..., 1] * 587 + rgb[..., 2] * 114) // 1000


def apply(image: Image.Image, params: dict) -> Image.Image:
    max_l = max(0, min(255, int(params.get("maxLightnessDelta", 16))))
    max_c = max(0, min(255, int(params.get("maxChromaDelta", 32))))

    original_mode = image.mode
    src = image.convert("RGBA")
    arr = np.asarray(src, dtype=np.int16)  # HxWx4, immutable snapshot
    height, width, _ = arr.shape
    if height == 0 or width == 0:
        return image.copy()

    rgb = arr[..., :3]
    alpha = arr[..., 3]
    self_light = _luma(rgb)
    nontransparent = alpha > 0

    # Pad by 1px; padded alpha = 0 so out-of-bounds neighbours never qualify and
    # edges only ever see in-bounds neighbours.
    pad_rgb = np.pad(rgb, ((1, 1), (1, 1), (0, 0)), mode="edge")
    pad_alpha = np.pad(alpha, ((1, 1), (1, 1)), mode="constant", constant_values=0)
    pad_light = _luma(pad_rgb)

    best_light = np.full((height, width), 1 << 15, dtype=np.int32)
    best_rgba = arr.copy()
    found = np.zeros((height, width), dtype=bool)

    for dy, dx in _NEIGHBORS:
        ys = slice(1 + dy, 1 + dy + height)
        xs = slice(1 + dx, 1 + dx + width)
        nb_rgb = pad_rgb[ys, xs]
        nb_alpha = pad_alpha[ys, xs]
        nb_light = pad_light[ys, xs]

        delta = self_light - nb_light  # > 0 => neighbour is darker
        chroma = np.max(np.abs(rgb - nb_rgb), axis=-1)
        qualifies = (
            nontransparent
            & (nb_alpha > 0)
            & (delta > 0)
            & (delta <= max_l)
            & (chroma <= max_c)
            & (nb_light < best_light)
        )
        if not qualifies.any():
            continue
        best_light = np.where(qualifies, nb_light.astype(np.int32), best_light)
        found |= qualifies
        nb_rgba = np.concatenate([nb_rgb, nb_alpha[..., None]], axis=-1)
        best_rgba = np.where(qualifies[..., None], nb_rgba, best_rgba)

    result = np.where(found[..., None], best_rgba, arr).astype(np.uint8)
    out = Image.fromarray(result, "RGBA")
    if original_mode == "RGBA":
        return out
    if original_mode == "LA":
        return out.convert("LA")
    return out.convert("RGB")
