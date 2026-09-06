"""Example image-editing skill: grayscale + posterize.

A skill is a plain Python file the workbench calls directly (no LLM in the
loop): declare SKILL metadata and an apply(image, params) function that takes
and returns a PIL Image. Drop more .py files beside this one to publish them.
"""

from PIL import Image, ImageOps

SKILL = {
    "title": "Grayscale posterize",
    "description": "Grayscale the frame, then posterize to a few tone bands.",
    "params": {"bits": 3},
}


def apply(image: Image.Image, params: dict) -> Image.Image:
    bits = max(1, min(8, int(params.get("bits") or 3)))
    return ImageOps.posterize(image.convert("L").convert("RGB"), bits)
