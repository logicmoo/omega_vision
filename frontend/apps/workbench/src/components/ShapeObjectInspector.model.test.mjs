import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import { stripTypeScriptTypes } from "node:module";
import test from "node:test";

const source = readFileSync(new URL("./ShapeObjectInspector.model.ts", import.meta.url), "utf8");
const model = await import(`data:text/javascript;base64,${Buffer.from(stripTypeScriptTypes(source)).toString("base64")}`);
const { inspectRecord, payloadGeometry, turtleGeometry, exactReferencedRecord,
  recordIdentity, readInspectorArea, referenceValue, inspectableAreas, areaIdentity, areaLabel, sourceMatchesArea } = model;

function record(payload, extra = {}) {
  return {
    recordUid: "memory-record-a", revision: "hash-a", memoryKind: "shape", recordType: "shape_anchor",
    payload, source: { providerRef: "provider-a", workspaceId: "workspace-a", memoryLocationId: "location-a" }, ...extra,
  };
}
function concept(versions) {
  return { conceptUid: "concept-a", preferred: versions[0], versions, conflict: versions.length > 1 };
}
function area(extra = {}) {
  return { memoryLocationId: "location-a", providerRef: "provider-a", workspaceId: "workspace-a",
    providerLabel: "Provider", label: "Run Memory", scopeKind: "run", context: { runId: "run-a", gameId: null, levelId: null },
    memoryKinds: ["shape", "object"], capabilities: { read: true, write: false, reason: null },
    pathLabel: "knowledge/memory", format: "memory_json", counts: { shape: 1, object: 1 }, revision: "r1", ...extra };
}

test("immutable anchor and actual alternate forms retain coordinates, holes and original source", () => {
  const input = record({ uid: "shape-anchor-a", kind: "shape_point_anchor",
    canonicalPoints: [[-2, 4], [0, 4], [-2, 6]],
    forms: { full_rn: { shapeKey: "key-a", points: [[0, 0], [1, 0]] } } });
  const before = JSON.stringify(input);
  const adapted = inspectRecord(input);
  assert.equal(adapted.format, "Immutable shape anchor");
  assert.equal(adapted.views.length, 2);
  assert.equal(adapted.views[0].geometry.primitives.length, 3);
  assert.deepEqual(adapted.views[0].geometry.bounds, { x: -2, y: 4, width: 3, height: 3 });
  assert.equal(adapted.views[1].properties.shapeKey, "key-a");
  assert.equal(JSON.stringify(input), before);
});

test("prototype observed revisions remain separate from storage versions and from one another", () => {
  const input = record({ uid: "observed-prototype-a", anchorUid: "shape-anchor-a", revisions: [
    { uid: "prototype-revision-a", revision: 1, points: [[0, 0]], frameUid: "frame-a", sourceHashes: { pixels: "a" } },
    { uid: "prototype-revision-b", revision: 2, points: [[0, 0], [1, 0]], previousRevisionUid: "prototype-revision-a" },
  ], backgroundRole: { role: "unknown", revisable: true } }, { recordType: "observed_prototype" });
  const adapted = inspectRecord(input);
  assert.equal(adapted.views.length, 2);
  assert.notEqual(adapted.views[0].key, adapted.views[1].key);
  assert.match(adapted.views[1].label, /prototype-revision-b/);
  assert.equal(adapted.views[1].geometry.primitives.length, 2);
  assert.equal(adapted.properties.backgroundRole.role, "unknown");
  assert.match(adapted.notices.join(), /not resolved by alias or UID alone/);
});

test("legacy shape facts parse JSON Turtle without executing arbitrary source", () => {
  const input = record({ uid: "legacy-memory-a", legacyKey: "shape-key",
    facts: [{ predicate: "shape", args: ["shape-key", "domino", JSON.stringify({
      commands: [{ op: "move", x: 250, y: 250 },
        { op: "rectangle", box: [0, 0, 500, 500], fill: "#7c9cff", outline: "#7c9cff" },
        { op: "rectangle", box: [0, 500, 500, 1000], fill: "#7c9cff", outline: "#7c9cff" }],
    })] }] }, { recordType: "legacy_shape" });
  const adapted = inspectRecord(input);
  assert.equal(adapted.title, "domino");
  assert.equal(adapted.views[0].geometry.status, "ready");
  assert.deepEqual(adapted.views[0].geometry.bounds, { x: 0, y: 0, width: 500, height: 1000 });
  for (const malicious of ["globalThis.inspectorExecuted = true", ":- shell('bad').", "<svg onload='alert(1)'>"]) {
    assert.equal(turtleGeometry(malicious).status, "unsupported");
  }
  assert.equal(globalThis.inspectorExecuted, undefined);
  assert.equal(turtleGeometry({ commands: [{ op: "eval", source: "bad()" }] }).status, "unsupported");
});

test("Turtle alpha is retained and external paint servers or invalid partial drawings are refused", () => {
  const alpha = turtleGeometry({ commands: [{ op: "rectangle", box: [-10, -20, 1, 2], fill: "#ff000080" }] });
  assert.equal(alpha.primitives[0].fill, "#ff000080");
  assert.equal(alpha.bounds.x, -10);
  for (const fill of ["url(https://example.invalid/pixel)", "var(--unsafe)", "rgba(999,0,0,1)", "rgba(,,,1)"]) {
    assert.equal(turtleGeometry({ commands: [{ op: "rectangle", box: [0, 0, 1, 1], fill }] }).status, "unsupported");
  }
  const invalid = turtleGeometry({ commands: [
    { op: "rectangle", box: [0, 0, 1, 1], fill: "#fff" }, { op: "forward", distance: 2 },
  ] });
  assert.equal(invalid.status, "unsupported");
  assert.deepEqual(invalid.primitives, []);
});

test("inclusive pixel runs and polygon holes are never replaced by bounding boxes", () => {
  const runs = payloadGeometry({ pixelRuns: [[2, -3, -1], [4, 7, 7]], fill: "rgba(10,20,30,0.5)" });
  assert.deepEqual(runs.bounds, { x: -3, y: 2, width: 11, height: 3 });
  assert.equal(runs.primitives.length, 2);
  assert.equal(runs.primitives[0].width, 3);
  const holes = [[[1, 1], [2, 1], [2, 2], [1, 2]]];
  const polygon = payloadGeometry({ geometry: { outer: [[0, 0], [4, 0], [4, 4], [0, 4]], holes, fill: "#00ff0080" } });
  assert.deepEqual(polygon.primitives[0].holes, holes);
  assert.equal(polygon.primitives[0].fill, "#00ff0080");
  assert.equal(payloadGeometry({ outer: [[0, 0], [4, 0], [4, 4]], holes: [[[1, 1]]] }).status, "unsupported");
});

test("invalid geometry and unsupported/missing schema have honest non-rendered states", () => {
  for (const payload of [{ cells: [["0", 0]] }, { points: [[0, NaN]] },
    { pixelRuns: [[0, 4, 1]] }, { outer: [[0, 0], [1, 1], [Infinity, 0]] }]) {
    assert.equal(payloadGeometry(payload).status, "unsupported");
  }
  assert.equal(payloadGeometry({ points: [] }).status, "missing");
  assert.equal(payloadGeometry({ boundingBox: [0, 0, 5, 5] }).status, "missing");
  const missing = inspectRecord(record({ uid: "r1", turtle: "arbitrary source" }));
  assert.equal(missing.stableId, null);
  assert.match(missing.notices.join(), /Frame-local aliases/);
  assert.equal(missing.views[0].geometry.status, "unsupported");
});

test("actual multi-group objects preserve attribution, visibility and competing shape revisions", () => {
  const baseRef = { providerRef: "provider-a", workspaceId: "workspace-a", memoryLocationId: "location-a",
    recordUid: "shape-record-a", revision: "hash-a", memberTrackUid: "track-a", observationUid: "observation-a" };
  const input = record({ uid: "object-a", alias: "o1", authority: "authored_prolog_deduction", status: "retained_identity",
    memberTrackUids: ["track-a", "track-b"],
    members: [{ trackUid: "track-a", observationUid: "observation-a", visibility: "visible", currentObservation: true },
      { trackUid: "track-b", observationUid: null, visibility: "missing", currentObservation: false }],
    shapeReferences: [baseRef, { ...baseRef, revision: "hash-b" }, { recordUid: "g1" }],
    compositionHistory: [{ frameUid: "frame-a", confidence: 0.9 }],
  }, { memoryKind: "object", recordType: "persistent_object" });
  const adapted = inspectRecord(input);
  assert.equal(adapted.stableId, "object-a");
  assert.equal(adapted.views.length, 0);
  assert.equal(adapted.members.length, 3);
  assert.equal(adapted.members[0].references.length, 2);
  assert.notEqual(adapted.members[0].references[0].reference.revision, adapted.members[0].references[1].reference.revision);
  assert.equal(adapted.members[1].properties.visibility, "missing");
  assert.equal(adapted.members[1].references.length, 0);
  assert.equal(adapted.members[2].references[0].reference, null);
  assert.equal(adapted.properties.compositionHistory.length, 1);
});

test("legacy known identities and variations are inspectable without inventing multi-group membership", () => {
  const adapted = inspectRecord(record({ uid: "legacy-memory-object", legacyKey: "legacy-key", facts: [
    { predicate: "known_object", args: ["legacy-key", "first-frame", "last-frame", 4] },
    { predicate: "known_variation", args: ["legacy-key", "#ff0000", 3, 2] },
    { predicate: "known_placement", args: ["game", "legacy-key", "gobj_legacy-key", "frame", 3] },
  ] }, { memoryKind: "object", recordType: "legacy_known_object" }));
  assert.equal(adapted.members.length, 3);
  assert.match(adapted.format, /Legacy/);
  assert.match(adapted.notices.join(), /not evidence of a multi-group object/);
  assert.equal(adapted.members.flatMap(member => member.references).length, 0);
});

test("contradictory constituent track/observation attribution is not attached to either member", () => {
  const adapted = inspectRecord(record({ uid: "object-a", memberTrackUids: ["track-a", "track-b"],
    members: [{ trackUid: "track-a", observationUid: "observation-a" }, { trackUid: "track-b", observationUid: "observation-b" }],
    shapeReferences: [{ providerRef: "p", workspaceId: "w", memoryLocationId: "l", recordUid: "shape-a",
      revision: "revision-a", memberTrackUid: "track-a", observationUid: "observation-b" }],
  }, { memoryKind: "object" }));
  assert.equal(adapted.members[0].references.length, 0);
  assert.equal(adapted.members[1].references.length, 0);
  assert.equal(adapted.members[2].references.length, 1);
});

test("provider/location/kind/record/revision remain strict for identity and exact resolution", () => {
  const shape = record({ uid: "shape-a" });
  const reference = { ...shape.source, recordUid: shape.recordUid, revision: shape.revision };
  assert.equal(exactReferencedRecord([concept([shape])], reference).record, shape);
  const alternatives = [
    { ...shape, revision: "hash-b" }, { ...shape, memoryKind: "object" }, { ...shape, recordUid: "different-record" },
    ...["providerRef", "memoryLocationId"].map(field =>
      ({ ...shape, source: { ...shape.source, [field]: "different" } })),
  ];
  for (const alternative of alternatives) {
    assert.notEqual(recordIdentity(shape), recordIdentity(alternative));
    assert.throws(() => exactReferencedRecord([concept([alternative])], reference), /Unresolved reference/);
  }
  assert.throws(() => exactReferencedRecord([concept([shape, shape])], reference), /Ambiguous exact/);
  assert.equal(referenceValue({ ...reference, recordUid: "o1" }), null);
  assert.equal(referenceValue({ recordUid: "shape-a", revision: "r1" }), null);
});

test("workspace provenance never partitions shared area/record identity or exact references", async () => {
  const firstArea = area();
  const secondArea = { ...firstArea, workspaceId: "workspace-b" };
  assert.equal(areaIdentity(firstArea), areaIdentity(secondArea));
  for (const memoryKind of ["shape", "object"]) {
    const first = record({ uid: `${memoryKind}-shared`, evidence: { unchanged: true } }, { memoryKind });
    const second = { ...first, source: { ...first.source, workspaceId: "workspace-b" } };
    const before = JSON.stringify([first, second]);
    assert.equal(recordIdentity(first), recordIdentity(second));
    assert.equal(sourceMatchesArea(first.source, secondArea), true);
    assert.equal(sourceMatchesArea(second.source, firstArea), true);
    const result = await readInspectorArea(async () => ({ records: [concept([second])], errors: [] }),
      memoryKind, [firstArea.memoryLocationId], new AbortController().signal);
    assert.equal(result.records[0].preferred, second);
    if (memoryKind === "shape") {
      const reference = { ...first.source, recordUid: first.recordUid, revision: first.revision };
      assert.equal(exactReferencedRecord(result.records, reference).record, second);
      assert.equal(referenceValue(reference).workspaceId, "workspace-a");
    }
    assert.equal(JSON.stringify([first, second]), before);
  }
});

test("area guard retains provider/location checks and Nowhere exact-source provenance", () => {
  const selected = area();
  const source = record({ uid: "shape-a" }).source;
  assert.equal(sourceMatchesArea(source, { ...selected, providerRef: "different-provider" }), false);
  assert.equal(sourceMatchesArea(source, { ...selected, memoryLocationId: "different-location" }), false);
  const nowhere = area({ memoryLocationId: "memory-nowhere", scopeKind: "volatile", providerRef: "session" });
  const volatile = record({ uid: "shape-in-browser" }, {
    source: { ...source, memoryLocationId: "memory-nowhere", workspaceId: "workspace-b", scopeKind: "volatile" },
  });
  assert.equal(sourceMatchesArea(volatile.source, nowhere), true);
  assert.equal(sourceMatchesArea(source, nowhere), false);
  const reference = { ...volatile.source, workspaceId: "workspace-a", recordUid: volatile.recordUid, revision: volatile.revision };
  assert.equal(exactReferencedRecord([concept([volatile])], reference).record, volatile);
  assert.throws(() => exactReferencedRecord([concept([volatile])], { ...reference, providerRef: "different-provider" }), /Unresolved reference/);
});

test("inspectable areas come only from catalog and equal labels remain provider-aware", () => {
  const first = area(), second = area({ providerRef: "other", workspaceId: "other", memoryLocationId: "location-b" });
  const nowhere = area({ memoryLocationId: "memory-nowhere", scopeKind: "volatile", label: "Nowhere" });
  const unavailable = area({ memoryLocationId: "denied", capabilities: { read: false, write: false, reason: "No permission" } });
  const catalog = { locations: [first, second, nowhere, unavailable], destinations: [area({ memoryLocationId: "write-only" })] };
  const before = JSON.stringify(catalog);
  assert.equal(inspectableAreas(null).length, 0);
  assert.deepEqual(inspectableAreas(catalog), catalog.locations);
  assert.notEqual(areaIdentity(first), areaIdentity(second));
  assert.notEqual(areaLabel(first), areaLabel(second));
  assert.match(areaLabel(first), /run-a/);
  assert.equal(JSON.stringify(catalog), before);
});

test("read-only adapter preserves backend errors and rejects malformed or wrong-area records", async () => {
  const signal = new AbortController().signal;
  const sourceRecord = record({ uid: "shape-a" });
  const response = { records: [concept([sourceRecord])], errors: [{ message: "Another source unavailable" }] };
  let received;
  const result = await readInspectorArea(async (...args) => { received = args; return response; }, "shape", ["location-a"], signal);
  assert.equal(result, response);
  assert.deepEqual(received, ["shape", ["location-a"], signal]);
  for (const malformed of [
    { records: [], errors: "bad" },
    { records: [concept([{ ...sourceRecord, payload: null }])], errors: [] },
    { records: [concept([{ ...sourceRecord, memoryKind: "object" }])], errors: [] },
    { records: [concept([{ ...sourceRecord, source: { ...sourceRecord.source, memoryLocationId: "location-b" } }])], errors: [] },
  ]) {
    await assert.rejects(readInspectorArea(async () => malformed, "shape", ["location-a"], signal), /malformed or out-of-area/);
  }
});

test("workspace/record cancellation prevents both pre-aborted and stale async results", async () => {
  const controller = new AbortController();
  let release, calls = 0;
  const pending = readInspectorArea(async () => {
    calls++;
    return new Promise(resolve => { release = resolve; });
  }, "shape", ["location-a"], controller.signal);
  controller.abort();
  release({ records: [concept([record({ uid: "old-workspace-record" })])], errors: [] });
  await assert.rejects(pending, { name: "AbortError" });
  await assert.rejects(readInspectorArea(async () => { calls++; }, "shape", ["location-a"], controller.signal), { name: "AbortError" });
  assert.equal(calls, 1);
});

test("volatile record data stays in RAM and inspection modules expose no persistence or execution transport", async () => {
  const volatile = record({ uid: "shape-session-only", kind: "shape_point_anchor", canonicalPoints: [[0, 0]] },
    { recordType: "volatile", source: { providerRef: "provider-a", workspaceId: "workspace-a",
      memoryLocationId: "memory-nowhere", scopeKind: "volatile" } });
  assert.match(inspectRecord(volatile).notices.join(), /browser RAM only/);
  let received;
  await readInspectorArea(async (...args) => { received = args; return { records: [concept([volatile])], errors: [] }; },
    "shape", ["memory-nowhere"], new AbortController().signal);
  assert.deepEqual(received[1], ["memory-nowhere"]);
  for (const filename of ["ShapeObjectInspector.model.ts", "ShapeObjectInspector.tsx", "ShapeObjectInspectorBrowser.tsx", "ShapeObjectInspectorPreview.tsx"]) {
    const implementation = readFileSync(new URL(`./${filename}`, import.meta.url), "utf8");
    assert.doesNotMatch(implementation, /localStorage|sessionStorage|indexedDB|caches\.|console\.|fetch\(|eval\(|new Function|dangerouslySetInnerHTML|setInterval/);
  }
  const browser = readFileSync(new URL("./ShapeObjectInspectorBrowser.tsx", import.meta.url), "utf8");
  assert.match(browser, /<BrowserContext key=\{props.contextKey\}/);
  assert.match(browser, /return \(\) => controller.abort\(\)/);
  const detail = readFileSync(new URL("./ShapeObjectInspector.tsx", import.meta.url), "utf8");
  assert.match(detail, /props.contextKey, recordIdentity\(props.record\)/);
  assert.match(detail, /ResourceSourceEditor/);
  assert.match(detail, /contentReadOnly/);
  assert.doesNotMatch(detail, /<textarea/);
});
