import assert from "node:assert/strict";
import test from "node:test";

import {
  activeHighlightMembers,
  containCoordinateTransform,
  resolveRegionHighlight,
  sanitizePinnedHighlights,
  togglePinnedMembers,
} from "./VisualRegionHighlightModel.ts";

const geometry = {
  width: 640,
  height: 320,
  polygons: {
    "13": {
      outer: [[10, 20], [30, 20], [30, 40], [10, 40]],
      holes: [[[15, 25], [20, 25], [20, 30], [15, 30]]],
    },
    r14: {
      outer: [[100, 50], [120, 50], [120, 70], [100, 70]],
      holes: [],
    },
    "15": {
      outer: [],
      holes: [],
      smallFeature: { pixelRuns: [[80, 200, 204], [81, 199, 205]] },
    },
  },
};

test("single region resolves legacy numeric polygon keys", () => {
  const result = resolveRegionHighlight(geometry, ["r13"]);
  assert.deepEqual(result.missing, []);
  assert.equal(result.shapes.length, 1);
  assert.equal(result.shapes[0].id, "r13");
  assert.deepEqual(result.shapes[0].outer[0], [10, 20]);
  assert.equal(result.shapes[0].holes.length, 1);
});

test("group union resolves every V W or G member through one region model", () => {
  const result = resolveRegionHighlight(geometry, ["r13", "r14", "r15", "r13"]);
  assert.deepEqual(result.shapes.map((shape) => shape.id), ["r13", "r14", "r15"]);
  assert.deepEqual(result.shapes[2].pixelRuns, [[80, 200, 204], [81, 199, 205]]);
  assert.deepEqual(result.missing, []);
});

test("equal aliases toggle the same underlying pinned member set", () => {
  const vMembers = ["r13", "r14"];
  const wMembers = ["r14", "r13"];
  const gMembers = ["r13", "r14"];
  const pinned = togglePinnedMembers([], vMembers, false);

  assert.deepEqual(new Set(pinned), new Set(wMembers));
  assert.deepEqual(togglePinnedMembers(pinned, gMembers, false), []);
});

test("hover is ephemeral while pinned selection survives hover leave", () => {
  const duringHover = activeHighlightMembers(["r13"], ["r14", "r15"]);
  const afterLeave = activeHighlightMembers(["r13"], null);

  assert.deepEqual(duringHover, { pinned: ["r13"], hovered: ["r14", "r15"] });
  assert.deepEqual(afterLeave, { pinned: ["r13"], hovered: [] });
});

test("frame changes remove stale region selections without cross-row leakage", () => {
  const sanitized = sanitizePinnedHighlights(
    { frameA: ["r13", "r99"], frameB: ["r1"] },
    { frameA: ["r13", "r14"] },
  );

  assert.deepEqual(sanitized, { frameA: ["r13"] });
});

test("source coordinates stay aligned under aspect-ratio-preserving resize", () => {
  const transform = containCoordinateTransform(640, 320, 150, 150);

  assert.equal(transform.scale, 150 / 640);
  assert.equal(transform.offsetX, 0);
  assert.equal(transform.offsetY, 37.5);
  assert.deepEqual(
    [
      320 * transform.scale + transform.offsetX,
      160 * transform.scale + transform.offsetY,
    ],
    [75, 75],
  );
});

test("missing legacy geometry is explicit", () => {
  const result = resolveRegionHighlight(geometry, ["r404"]);
  assert.deepEqual(result.shapes, []);
  assert.deepEqual(result.missing, ["r404"]);
});
