from copy import deepcopy
from io import BytesIO
import hashlib

from PIL import Image
import pytest

from omega_vision.evaluation.visual_memory_baselines import SpotlightMemory
from omega_vision.evaluation.visual_memory_recordings import visual_memory_clips
from omega_vision.perception.native_memory_validation import VisibilityObservation, validate_must_be_known

SEQUENCE = "data/recordings/events_tests/spotlight_scene_train_a"


def observation(image, order):
    stream = BytesIO()
    image.save(stream, format="PNG")
    png = stream.getvalue()
    return VisibilityObservation(SEQUENCE, order, f"{SEQUENCE}/{order}/image.png", hashlib.sha256(png).hexdigest(), png)


def state(image):
    return {"size": list(image.size), "rgbaHex": image.tobytes().hex()}


def test_known_black_is_evidence_but_unknown_black_fails_without_learning_from_validation():
    source = Image.new("RGBA", (2, 1), (0, 0, 0, 0))
    source.putpixel((0, 0), (0, 0, 0, 255))
    memory = state(source)
    original = deepcopy(memory)
    result = validate_must_be_known(memory, [observation(source, 0)], sequence_id=SEQUENCE, frame_order=0)
    assert result["action"] == "VALIDATE_MUST_BE_KNOWN"
    assert result["outcome"] == "failed" and result["unknownPixels"] == 1
    assert result["observedPixels"] == result["knownPixels"] == 1
    assert result["violations"]["known_without_observation"] == 0
    assert not result["memoryModified"] and not result["observerExecuted"]
    assert memory == original


def test_filling_unknown_pixels_cannot_pass_even_when_the_guessed_color_happens_to_be_correct():
    source = Image.new("RGBA", (2, 1), (0, 0, 0, 0))
    source.putpixel((0, 0), (255, 0, 0, 255))
    invented = Image.new("RGBA", (2, 1), (255, 0, 0, 255))
    result = validate_must_be_known(state(invented), [observation(source, 0)], sequence_id=SEQUENCE, frame_order=0)
    assert result["complete"] is True
    assert result["outcome"] == "failed"
    assert result["violations"]["known_without_observation"] == 1


def test_native_color_mismatch_and_hidden_payload_are_not_repaired():
    source = Image.new("RGBA", (2, 1), (0, 0, 0, 0))
    source.putpixel((0, 0), (255, 0, 0, 255))
    bad = Image.new("RGBA", (2, 1), (100, 0, 0, 0))
    bad.putpixel((0, 0), (0, 255, 0, 255))
    memory = state(bad)
    before = deepcopy(memory)
    result = validate_must_be_known(memory, [observation(source, 0)], sequence_id=SEQUENCE, frame_order=0)
    assert result["violations"]["known_value_mismatch"] == 1
    assert result["violations"]["unobserved_rgb_payload"] == 1
    assert memory == before


def test_future_foreign_missing_or_tampered_source_evidence_is_rejected():
    image = Image.new("RGBA", (1, 1), (10, 20, 30, 255))
    first = observation(image, 0)
    next_frame = observation(image, 1)
    with pytest.raises(ValueError, match="prefix"):
        validate_must_be_known(state(image), [first, next_frame], sequence_id=SEQUENCE, frame_order=0)
    with pytest.raises(ValueError, match="different sequence"):
        validate_must_be_known(state(image), [next_frame], sequence_id=SEQUENCE, frame_order=0)
    with pytest.raises(ValueError, match="different sequence"):
        validate_must_be_known(state(image), [first], sequence_id="foreign", frame_order=0)
    bad = VisibilityObservation(first.sequence_id, 0, first.source_ref, "wrong-hash", first.png)
    with pytest.raises(ValueError, match="bound hash"):
        validate_must_be_known(state(image), [bad], sequence_id=SEQUENCE, frame_order=0)


def test_contradictory_static_observations_cannot_be_silently_resolved_by_picking_one():
    red = Image.new("RGBA", (1, 1), (255, 0, 0, 255))
    green = Image.new("RGBA", (1, 1), (0, 255, 0, 255))
    result = validate_must_be_known(state(red), [observation(red, 0), observation(green, 1)],
                                   sequence_id=SEQUENCE, frame_order=1)
    assert result["outcome"] == "failed"
    assert result["violations"]["conflicting_static_observations"] == 1


def test_actual_fog_prefix_fails_full_knowledge_until_observation_union_is_complete():
    clip = next(clip for clip in visual_memory_clips() if clip.family == "spotlight_scene" and clip.suffix == "train_a")
    memory = SpotlightMemory()
    evidence = []
    for order, frame in enumerate(clip.frames):
        memory.observe(frame.png)
        evidence.append(VisibilityObservation(SEQUENCE, order, f"{SEQUENCE}/{order}/image.png",
                                              hashlib.sha256(frame.png).hexdigest(), frame.png))
        result = validate_must_be_known(state(memory.image()), evidence, sequence_id=SEQUENCE, frame_order=order)
        assert result["knownPixels"] == memory.known_count
        assert result["outcome"] == ("passed" if memory.unknown_count == 0 else "failed")
        assert result["violations"]["known_without_observation"] == 0
        assert result["violations"]["known_value_mismatch"] == 0
    assert result["outcome"] == "passed" and result["totalPixels"] == 48 * 32
    assert not {"teacher", "rgbaHex", "fullSceneRgb"} & result.keys()
