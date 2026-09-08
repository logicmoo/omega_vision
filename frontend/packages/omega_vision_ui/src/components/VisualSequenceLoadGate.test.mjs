import assert from "node:assert/strict";
import test from "node:test";
import {
  requiresVisualSequenceConfirmation,
  visualSequenceConfirmationMessage,
  VISUAL_SEQUENCE_CONFIRMATION_THRESHOLD,
} from "./VisualSequenceLoadGate.ts";

const entry = (imageCount) => ({
  id: `curated/${imageCount}`,
  label: imageCount === 4782 ? "ls20" : `Sequence ${imageCount}`,
  imageCount,
});

test("the confirmation threshold allows 800 and gates 801", () => {
  assert.equal(VISUAL_SEQUENCE_CONFIRMATION_THRESHOLD, 800);
  assert.equal(requiresVisualSequenceConfirmation(entry(800), false), false);
  assert.equal(requiresVisualSequenceConfirmation(entry(801), false), true);
  assert.equal(requiresVisualSequenceConfirmation(entry(801), true), false);
});

test("large sequence confirmation reports the exact formatted count", () => {
  assert.equal(
    visualSequenceConfirmationMessage(entry(4782)),
    "ls20 contains 4,782 images and may be slow to load. Load this Visual Sequence?",
  );
});
