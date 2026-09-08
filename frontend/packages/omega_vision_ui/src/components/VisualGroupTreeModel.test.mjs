import assert from "node:assert/strict";
import test from "node:test";
import {
  coalesceIdenticalVisualAndSymbolicGroups,
  interleaveVisualGroupClaims,
  visualGroupDisplayRows,
} from "./VisualGroupTreeModel.ts";

test("overlapping V and W claims are adjacent peers with deterministic alternation", () => {
  const claims = [
    { kind: "v", id: "v1", members: ["r1", "r2"], sourceOrder: 0 },
    { kind: "v", id: "v2", members: ["r9"], sourceOrder: 1 },
    { kind: "w", id: "w1", members: ["r2", "r3"], sourceOrder: 2 },
    { kind: "w", id: "w2", members: ["r1", "r2"], sourceOrder: 3 },
  ];
  const ordered = interleaveVisualGroupClaims(claims);

  assert.deepEqual(ordered.map((claim) => claim.id), ["v1", "w2", "w1", "v2"]);
  assert.deepEqual(ordered.map((claim) => claim.kind), ["v", "w", "w", "v"]);
});

test("ties prefer the other claim kind then preserve source order", () => {
  const claims = [
    { kind: "v", id: "v1", members: ["r1"], sourceOrder: 0 },
    { kind: "v", id: "v2", members: ["r1"], sourceOrder: 1 },
    { kind: "w", id: "w1", members: ["r1"], sourceOrder: 2 },
  ];

  assert.deepEqual(
    interleaveVisualGroupClaims(claims).map((claim) => claim.id),
    ["v1", "w1", "v2"],
  );
});

test("claims remain independent data with no inferred connector fields", () => {
  const claims = [
    { kind: "v", id: "v1", members: ["r1", "r2"], sourceOrder: 0 },
    { kind: "w", id: "w1", members: ["r2"], sourceOrder: 1 },
  ];
  const ordered = interleaveVisualGroupClaims(claims);

  assert.deepEqual(ordered, claims);
  assert.equal(ordered.some((claim) => "mapsTo" in claim || "parent" in claim), false);
});

test("identical V and W memberships share one dual-labeled display row", () => {
  const v = { kind: "v", id: "v2", members: ["r16", "r15"], sourceOrder: 0 };
  const w = { kind: "w", id: "w6", members: ["r15", "r16"], sourceOrder: 1 };
  const other = { kind: "w", id: "w7", members: ["r17"], sourceOrder: 2 };

  const rows = coalesceIdenticalVisualAndSymbolicGroups([v, w, other]);

  assert.equal(rows.length, 2);
  assert.deepEqual(rows[0].claims.map((claim) => claim.id), ["v2", "w6"]);
  assert.deepEqual(rows[0].members, ["r16", "r15"]);
  assert.deepEqual(rows[1].claims, [other]);
  assert.deepEqual(v, { kind: "v", id: "v2", members: ["r16", "r15"], sourceOrder: 0 });
  assert.deepEqual(w, { kind: "w", id: "w6", members: ["r15", "r16"], sourceOrder: 1 });
});

test("layer filters keep only anchors while retaining exact equality aliases", () => {
  const claims = interleaveVisualGroupClaims([
    { kind: "v", id: "v1", members: ["r9"], sourceOrder: 0 },
    { kind: "v", id: "v2", members: ["r15", "r16"], sourceOrder: 1 },
    { kind: "w", id: "w6", members: ["r16", "r15"], sourceOrder: 2 },
    { kind: "w", id: "w7", members: ["r17"], sourceOrder: 3 },
    { kind: "g", id: "g1", members: ["r15", "r16"], sourceOrder: 4 },
  ]);

  const vRows = visualGroupDisplayRows(claims, "v");
  const wRows = visualGroupDisplayRows(claims, "w");
  const gRows = visualGroupDisplayRows(claims, "g");
  const allRows = visualGroupDisplayRows(claims, "all");

  assert.deepEqual(vRows.map((row) => row.claims.map((claim) => claim.id)), [
    ["v1"],
    ["v2", "w6", "g1"],
  ]);
  assert.deepEqual(wRows.map((row) => row.claims.map((claim) => claim.id)), [
    ["w6", "v2", "g1"],
    ["w7"],
  ]);
  assert.deepEqual(gRows.map((row) => row.claims.map((claim) => claim.id)), [
    ["g1", "v2", "w6"],
  ]);
  assert(allRows.some((row) =>
    row.claims.map((claim) => claim.id).join(",") === "v2,w6,g1"
  ));
  assert.deepEqual(visualGroupDisplayRows(claims.filter((claim) => claim.kind !== "g"), "g"), []);
});
