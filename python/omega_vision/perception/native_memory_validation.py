"""Read-only fog-memory assertions; observations, never a teacher scene, are proof."""

from dataclasses import dataclass
import hashlib
from io import BytesIO
from typing import Any, Mapping, Sequence

from PIL import Image

ACTION = "VALIDATE_MUST_BE_KNOWN"
VERSION = "native-known-memory-validation-v1"
MAX_PIXELS = 4_194_304


@dataclass(frozen=True)
class VisibilityObservation:
    sequence_id: str
    frame_order: int
    source_ref: str
    image_hash: str
    png: bytes


def _native_rgba(state: Mapping[str, Any]) -> tuple[tuple[int, int], bytes]:
    if not isinstance(state, Mapping):
        raise ValueError("Native image state must be a structured object")
    size, encoded = state.get("size"), state.get("rgbaHex")
    if (not isinstance(size, (list, tuple)) or len(size) != 2
            or any(type(value) is not int or value <= 0 for value in size)
            or size[0] * size[1] > MAX_PIXELS):
        raise ValueError("Native image dimensions are invalid or exceed the validation budget")
    if not isinstance(encoded, str) or len(encoded) != size[0] * size[1] * 8:
        raise ValueError("Native RGBA bytes do not match the declared image dimensions")
    try:
        rgba = bytes.fromhex(encoded)
    except ValueError as error:
        raise ValueError("Native RGBA data is not valid hexadecimal") from error
    if len(rgba) != size[0] * size[1] * 4:
        raise ValueError("Native RGBA data contains invalid spacing or length")
    if any(alpha not in {0, 255} for alpha in rgba[3::4]):
        raise ValueError("Native visibility must explicitly distinguish known and unknown pixels")
    return (size[0], size[1]), rgba


def validate_must_be_known(
    native_state: Mapping[str, Any],
    observations: Sequence[VisibilityObservation],
    *,
    sequence_id: str,
    frame_order: int,
) -> dict[str, Any]:
    """Assert full-scene knowledge from exactly the observed prefix.

    The caller must bind this state to the requested immutable native checkpoint.
    No source paths are opened here, and no image or memory state is modified.
    """
    if not isinstance(sequence_id, str) or not sequence_id:
        raise ValueError("Validation requires an explicit sequence identity")
    if type(frame_order) is not int or frame_order < 0 or len(observations) != frame_order + 1:
        raise ValueError("Validation requires the complete prefix through the selected frame, not future observations")
    size, rgba = _native_rgba(native_state)
    total = size[0] * size[1]
    seen: dict[int, bytes] = {}
    contradictions: set[int] = set()
    evidence = []
    for order, observation in enumerate(observations):
        if (not isinstance(observation, VisibilityObservation)
                or observation.sequence_id != sequence_id
                or type(observation.frame_order) is not int or observation.frame_order != order
                or not isinstance(observation.source_ref, str) or not observation.source_ref):
            raise ValueError("Visibility evidence has a different sequence, missing order or invalid source reference")
        if hashlib.sha256(observation.png).hexdigest() != observation.image_hash:
            raise ValueError("Visibility source image does not match its bound hash")
        with Image.open(BytesIO(observation.png)) as image:
            if image.mode != "RGBA" or image.size != size:
                raise ValueError("Visibility evidence requires same-sized RGBA observations from a fixed camera")
            observed = image.tobytes()
        for pixel in range(total):
            start = pixel * 4
            alpha = observed[start + 3]
            if alpha not in {0, 255}:
                raise ValueError("Observed visibility must be binary; uncertain pixels cannot prove knowledge")
            if alpha == 0:
                continue
            color = observed[start:start + 3]
            if pixel in seen and seen[pixel] != color:
                contradictions.add(pixel)
            else:
                seen[pixel] = color
        evidence.append({"frameOrder": order, "sourceRef": observation.source_ref, "imageHash": observation.image_hash})

    violations: dict[str, list[int]] = {
        "unknown_required_pixel": [],
        "known_without_observation": [],
        "known_value_mismatch": [],
        "forgotten_observation": [],
        "unobserved_rgb_payload": [],
        "conflicting_static_observations": sorted(contradictions),
    }
    known = 0
    for pixel in range(total):
        start = pixel * 4
        color = rgba[start:start + 3]
        if rgba[start + 3] == 255:
            known += 1
            if pixel not in seen:
                violations["known_without_observation"].append(pixel)
            elif seen[pixel] != color:
                violations["known_value_mismatch"].append(pixel)
        else:
            violations["unknown_required_pixel"].append(pixel)
            if pixel in seen:
                violations["forgotten_observation"].append(pixel)
            elif color != b"\0\0\0":
                violations["unobserved_rgb_payload"].append(pixel)

    counts = {name: len(pixels) for name, pixels in violations.items()}
    return {
        "action": ACTION, "validationVersion": VERSION,
        "sequenceId": sequence_id, "frameOrder": frame_order,
        "outcome": "failed" if any(counts.values()) else "passed",
        "complete": known == total, "totalPixels": total, "knownPixels": known,
        "observedPixels": len(seen), "unknownPixels": total - known,
        "violations": counts,
        "examples": {name: [[pixel % size[0], pixel // size[0]] for pixel in pixels[:16]]
                     for name, pixels in violations.items() if pixels},
        "nativeRgbaHash": hashlib.sha256(rgba).hexdigest(),
        "evidence": evidence, "memoryModified": False, "observerExecuted": False,
    }
