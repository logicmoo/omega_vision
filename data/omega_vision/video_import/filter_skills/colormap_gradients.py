"""Colormap gradient-map skill: matplotlib's colormap registry applied as a
gradient map (grayscale luminance -> colormap RGB). Not a flat tint - every
pixel is remapped through the full gradient. The workbench calls this
directly - no LLM in the loop. params.cmap picks the colormap.
"""

from PIL import Image

# Static, non-reversed colormap names (a snapshot of matplotlib's registry).
# Used only for the UI combo; apply() validates the chosen name against the live
# registry. Keeping this list static means discovering/listing this skill never
# imports the heavy matplotlib package — that import is deferred to apply().
_CMAPS = [
    "Accent", "Blues", "BrBG", "BuGn", "BuPu", "CMRmap", "Dark2", "GnBu", "Grays",
    "Greens", "Greys", "OrRd", "Oranges", "PRGn", "Paired", "Pastel1", "Pastel2",
    "PiYG", "PuBu", "PuBuGn", "PuOr", "PuRd", "Purples", "RdBu", "RdGy", "RdPu",
    "RdYlBu", "RdYlGn", "Reds", "Set1", "Set2", "Set3", "Spectral", "Wistia",
    "YlGn", "YlGnBu", "YlOrBr", "YlOrRd", "afmhot", "autumn", "berlin", "binary",
    "bone", "brg", "bwr", "cividis", "cool", "coolwarm", "copper", "cubehelix",
    "flag", "gist_earth", "gist_gray", "gist_grey", "gist_heat", "gist_ncar",
    "gist_rainbow", "gist_stern", "gist_yarg", "gist_yerg", "gnuplot", "gnuplot2",
    "gray", "grey", "hot", "hsv", "inferno", "jet", "magma", "managua",
    "nipy_spectral", "ocean", "okabe_ito", "pink", "plasma", "prism", "rainbow",
    "seismic", "spring", "summer", "tab10", "tab20", "tab20b", "tab20c", "terrain",
    "turbo", "twilight", "twilight_shifted", "vanimo", "viridis", "winter",
]

SKILL = {
    "preprocessing": {"geometry": "identity"},
    "title": "Colormap gradient map",
    "description": "Applies one of matplotlib's ~85 colormaps as a gradient map over luminance (viridis, inferno, jet, ocean, terrain, twilight, ...).",
    "params": {"cmap": "viridis"},
    "paramChoices": {"cmap": _CMAPS},
}


def apply(image: Image.Image, params: dict) -> Image.Image:
    import numpy as np  # noqa: PLC0415 - heavy deps stay out of skill discovery
    import matplotlib  # noqa: PLC0415

    name = str(params.get("cmap") or "viridis")
    if name not in matplotlib.colormaps:
        raise ValueError(f"matplotlib has no colormap named '{name}'")
    colormap = matplotlib.colormaps[name]
    gray = np.asarray(image.convert("L"), dtype=np.float32) / 255.0
    mapped = colormap(gray)  # HxWx4 floats in 0..1
    return Image.fromarray((mapped[:, :, :3] * 255).astype(np.uint8), "RGB")
