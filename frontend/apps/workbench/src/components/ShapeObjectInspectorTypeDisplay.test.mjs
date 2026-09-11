import assert from "node:assert/strict";
import test from "node:test";
import { formatInspectorType, isInspectorKind, isInspectorRelation } from "./ShapeObjectInspectorTypeDisplay.ts";

test("type-compatible stored aliases keep their numbering and receive uppercase markers plus names", () => {
  for (const [kind, alias, expected] of [
    ["shape", "s01", "S01 \u2014 Shape"], ["object", "o7", "O7 \u2014 Object"],
    ["shape_group", "g2", "G2 \u2014 Group (Shapes)"],
    ["object_group", "c8", "C8 \u2014 Group (Objects)"],
  ]) assert.equal(formatInspectorType(kind, alias), expected);
});

test("missing, mismatched and hypothesis aliases never fabricate persistent entities or new markers", () => {
  for (const alias of [undefined, "r1", "g1", "v1", "w1", "a1", "shape-uid", "frame:s1", "1"]) {
    assert.equal(formatInspectorType("object", alias), "Object");
  }
  assert.equal(formatInspectorType("shape_group", "v1"), "Group (Shapes)");
  for (const value of ["part", "shape_class", "articulated", "A", "constructor", "__proto__"]) {
    assert.equal(isInspectorKind(value), false);
  }
  assert.equal(isInspectorRelation("has_part"), true);
  assert.equal(isInspectorRelation("attached_to"), false);
});
