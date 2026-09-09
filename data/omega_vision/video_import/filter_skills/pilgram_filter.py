"""Pilgram skill: Instagram-style color filters from the MIT-licensed
pilgram library (pip install pilgram) — a downloaded image-editing skill the
workbench calls directly, no LLM in the loop.

params.style picks the filter: aden, brannan, brooklyn, clarendon, earlybird,
gingham, hudson, inkwell, kelvin, lark, lofi, maven, mayfair, moon, nashville,
perpetua, reyes, rise, slumber (see pilgram's docs).
"""

from PIL import Image

# Static list of the filters pilgram ships. Used only for the UI combo so that
# discovering/listing this skill never imports the pilgram package; apply()
# imports pilgram lazily and reports a clear error if it is not installed.
_STYLES = [
    "_1977", "aden", "brannan", "brooklyn", "clarendon", "earlybird", "gingham",
    "hudson", "inkwell", "kelvin", "lark", "lofi", "ludwig", "maven", "mayfair",
    "moon", "nashville", "perpetua", "reyes", "rise", "slumber", "stinson",
    "toaster", "valencia", "walden", "willow", "xpro2",
]

SKILL = {
    "title": "Pilgram color filter (downloaded)",
    "description": "Instagram-style filters from the MIT pilgram library; params.style picks which one.",
    "params": {"style": "lofi"},
    "paramChoices": {"style": _STYLES},
}


def apply(image: Image.Image, params: dict) -> Image.Image:
    try:
        import pilgram  # noqa: PLC0415 - optional/heavy dep stays out of discovery
    except ImportError as error:  # pragma: no cover - environment dependent
        raise ValueError("pilgram is not installed; run 'pip install pilgram' to use this filter") from error
    style = str(params.get("style") or "lofi").lower()
    transform = getattr(pilgram, style, None)
    if transform is None or style in {"css", "util"} or style.startswith("__"):
        raise ValueError(f"pilgram has no filter named '{style}'")
    return transform(image.convert("RGB"))
