import assert from "node:assert/strict";
import test from "node:test";
import { interleaveVisualGroupClaims } from "./VisualGroupTreeModel.ts";

test("overlapping V and G claims are adjacent peers with deterministic alternation", () => {
  const claims = [
    { kind: "v", id: "v1", members: ["r1", "r2"], sourceOrder: 0 },
    { kind: "v", id: "v2", members: ["r9"], sourceOrder: 1 },
    { kind: "g", id: "g1", members: ["r2", "r3"], sourceOrder: 2 },
    { kind: "g", id: "g2", members: ["r1", "r2"], sourceOrder: 3 },
  ];
  const ordered = interleaveVisualGroupClaims(claims);

  assert.deepEqual(ordered.map((claim) => claim.id), ["v1", "g2", "g1", "v2"]);
  assert.deepEqual(ordered.map((claim) => claim.kind), ["v", "g", "g", "v"]);
});

test("ties prefer the other claim kind then preserve source order", () => {
  const claims = [
    { kind: "v", id: "v1", members: ["r1"], sourceOrder: 0 },
    { kind: "v", id: "v2", members: ["r1"], sourceOrder: 1 },
    { kind: "g", id: "g1", members: ["r1"], sourceOrder: 2 },
  ];

  assert.deepEqual(
    interleaveVisualGroupClaims(claims).map((claim) => claim.id),
    ["v1", "g1", "v2"],
  );
});

test("claims remain independent data with no inferred connector fields", () => {
  const claims = [
    { kind: "v", id: "v1", members: ["r1", "r2"], sourceOrder: 0 },
    { kind: "g", id: "g1", members: ["r2"], sourceOrder: 1 },
  ];
  const ordered = interleaveVisualGroupClaims(claims);

  assert.deepEqual(ordered, claims);
  assert.equal(ordered.some((claim) => "mapsTo" in claim || "parent" in claim), false);
});
