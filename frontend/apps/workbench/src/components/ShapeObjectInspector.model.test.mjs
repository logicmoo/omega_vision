import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import { stripTypeScriptTypes } from "node:module";
import test from "node:test";

const source = readFileSync(new URL("./ShapeObjectInspector.model.ts", import.meta.url), "utf8");
const executable = stripTypeScriptTypes(source).replace('"./ShapeObjectInspectorTypeDisplay"',
  JSON.stringify(new URL("./ShapeObjectInspectorTypeDisplay.ts", import.meta.url).href));
const model = await import(`data:text/javascript;base64,${Buffer.from(executable).toString("base64")}`);
const { inspectRecord, payloadGeometry, turtleGeometry, exactReferencedRecord,
  recordIdentity, readInspectorArea, referenceValue, inspectableAreas, areaIdentity, areaLabel, sourceMatchesArea,
  validateInspectorAreas, readConfiguredInspectorArea, typedReferenceValue, resolveConfiguredReference,
  configuredReferenceArea, readConfiguredInspectorReference, isAncestorRecord, isInspectorRecord } = model;

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

test("configured areas remain identifiable with unloaded counts and availability", () => {
  const unloaded = area({ counts: null, revision: null, availability: "not_loaded" });
  const before = JSON.stringify(unloaded);
  assert.equal(areaIdentity(unloaded), areaIdentity(area()));
  assert.equal(sourceMatchesArea(record({}).source, unloaded), true);
  assert.match(areaLabel(unloaded), /Run Memory/);
  assert.equal(JSON.stringify(unloaded), before);
  const browser = readFileSync(new URL("./ShapeObjectInspectorBrowser.tsx", import.meta.url), "utf8");
  assert.match(browser, /configuredAreas \?\? inspectableAreas/);
  assert.match(browser, /disabled=\{!metadataAvailable\}/);
  assert.doesNotMatch(browser, /disabled=\{loading \|\| !catalog\}/);
  assert.match(browser, /Existence and record counts are unknown/);
});

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
  const reference = { ...shape.source, recordUid: shape.recordUid, revision: shape.revision, targetKind: "shape", relation: "has_shape" };
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
      const reference = { ...first.source, recordUid: first.recordUid, revision: first.revision, targetKind: "shape", relation: "has_shape" };
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
  const reference = { ...volatile.source, workspaceId: "workspace-a", recordUid: volatile.recordUid, revision: volatile.revision, targetKind: "shape", relation: "has_shape" };
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

const kinds = ["shape", "shape_group", "object_group", "shape_group_class", "object_group_class", "object", "object_class"];
function configured(extra = {}) {
  return { areaId: "contextual:scene", areaType: "contextual", label: "Current Scene/Level (All Previous Frames)",
    memoryKinds: ["shape", "object"], plannedMemoryKinds: kinds.filter(kind => kind !== "shape" && kind !== "object"),
    counts: { shape: null, object: null }, revision: null, loadState: "not_loaded", readOnly: true, ...extra };
}
function typedRef(sourceRecord, extra = {}) {
  return { targetKind: sourceRecord.memoryKind, relation: "references", providerRef: sourceRecord.source.providerRef,
    memoryLocationId: sourceRecord.source.memoryLocationId, recordUid: sourceRecord.recordUid, revision: sourceRecord.revision, ...extra };
}
function areaResult(versions = [record({ uid: "shape-a" })], extra = {}) {
  return { areaId: "contextual:scene", kind: "shape", status: "ready", revision: "area-revision", cachePolicy: "no-store",
    records: versions.length ? [concept(versions)] : [], errors: [],
    authorizedSources: [{ providerRef: "provider-a", memoryLocationId: "location-a", memoryKind: "shape" }], ...extra };
}
const signal = () => new AbortController().signal;

test("configured metadata preserves declared schema plans and never invents counts, paths or records", () => {
  const response = { schemaVersion: 1, areasRevision: "config-only", areas: [configured()],
    kindSchemas: { object_class: { schemaStatus: "pending", read: false } },
    referenceSchema: { resolution: "same_area_sequence_frame_exact_version" } };
  const before = JSON.stringify(response);
  assert.deepEqual(validateInspectorAreas(response), response);
  assert.equal(JSON.stringify(response), before);
  for (const malformed of [
    { ...response, areas: [configured({ counts: { shape: 0 } })] },
    { ...response, areas: [configured(), configured()] },
    { ...response, areas: [configured({ plannedMemoryKinds: ["part"] })] },
    { ...response, referenceSchema: [] },
  ]) assert.throws(() => validateInspectorAreas(malformed), /Malformed|duplicate/);
});

test("authoritative source triples suffice; compatibility sources cannot grant extra authority", async () => {
  const response = areaResult();
  const before = JSON.stringify(response);
  const returned = await readConfiguredInspectorArea(async () => response, configured(), "shape", signal());
  assert.equal(returned, response);
  assert.deepEqual(Object.keys(returned.authorizedSources[0]).sort(), ["memoryKind", "memoryLocationId", "providerRef"]);
  assert.equal(JSON.stringify(response), before);
  for (const field of ["providerRef", "memoryLocationId", "memoryKind"]) {
    const forged = { ...response, authorizedSources: [{ ...response.authorizedSources[0], [field]: field === "memoryKind" ? "object" : "elsewhere" }],
      sources: [{ ...response.authorizedSources[0], memoryKinds: ["shape"] }] };
    await assert.rejects(readConfiguredInspectorArea(async () => forged, configured(), "shape", signal()), /out-of-area/);
  }
  await assert.rejects(readConfiguredInspectorArea(async () => ({ ...response, authorizedSources: undefined, sources: [] }),
    configured(), "shape", signal()), /Malformed/);
});

test("wrong context, malformed preferred records and false unavailable responses fail closed", async () => {
  const response = areaResult();
  for (const malformed of [
    { ...response, areaId: "contextual:current-moment" },
    { ...response, kind: "object" },
    { ...response, cachePolicy: "cache" },
    { ...response, errors: null },
    { ...response, status: "unavailable" },
    { ...response, records: [{ ...response.records[0], preferred: { ...response.records[0].preferred, payload: { fabricated: true } } }] },
    { ...response, records: [{ ...response.records[0], preferred: { ...response.records[0].preferred, originalSource: { text: "fabricated" } } }] },
  ]) await assert.rejects(readConfiguredInspectorArea(async () => malformed, configured(), "shape", signal()), /Malformed|malformed|unavailable/);
  const orderedDifferently = { ...response, records: [{ ...response.records[0],
    preferred: Object.fromEntries(Object.entries(response.records[0].preferred).reverse()) }] };
  await readConfiguredInspectorArea(async () => orderedDifferently, configured(), "shape", signal());
});

test("all five planned domains expose actual unavailable status, not empty ready Shape/Object rows", async () => {
  for (const kind of kinds.filter(kind => !["shape", "object"].includes(kind))) {
    const response = areaResult([], { kind, status: "unavailable", revision: null, authorizedSources: [],
      reasonCode: `${kind}_schema_unavailable`, message: "Payload schema not implemented",
      errors: [{ code: `${kind}_schema_unavailable`, message: "Payload schema not implemented" }] });
    let called;
    assert.equal(await readConfiguredInspectorArea(async (...args) => { called = args; return response; },
      configured(), kind, signal()), response);
    assert.deepEqual(called.slice(0, 2), ["contextual:scene", kind]);
    await assert.rejects(readConfiguredInspectorArea(async () => ({ ...response, status: "ready" }),
      configured(), kind, signal()), /schema is unsupported/);
    assert.equal(isInspectorRecord(record({}, { memoryKind: kind })), false);
  }
});

test("generic references require explicit tags; only the named shapeReferences adapter supplies missing tags", () => {
  const shape = record({});
  const generic = typedRef(shape);
  const { targetKind, relation, ...untagged } = generic;
  assert.equal(referenceValue(untagged), null);
  assert.equal(typedReferenceValue({ ...generic, relation: undefined }), null);
  const input = record({ shapeReferences: [untagged] }, { memoryKind: "object" });
  const before = JSON.stringify(input);
  const adapted = inspectRecord(input).members[0].references[0].reference;
  assert.equal(adapted.targetKind, "shape");
  assert.equal(adapted.relation, "has_shape");
  assert.equal(adapted.workspaceId, undefined);
  assert.equal(JSON.stringify(input), before);
  for (const contradictory of [{ ...generic }, { ...untagged, targetKind: "object" }, { ...untagged, relation: "has_part" }]) {
    assert.equal(inspectRecord(record({ shapeReferences: [contradictory] }, { memoryKind: "object" })).members[0].references[0].reference, null);
  }
  assert.equal(inspectRecord(record({ references: [untagged] }, { memoryKind: "object" })).members.length, 0);
  for (const alias of ["r1", "g1", "o1", "s1", "i1", "a1", "c1", "gc1", "oc1", "cc1"]) {
    assert.equal(typedReferenceValue({ ...generic, recordUid: alias }), null);
  }
});

test("relation domains match membership, classification and recursive object composition directions", () => {
  const pairs = {
    has_member: { shape_group: "shape", object_group: "object" },
    member_of: { shape: "shape_group", object: "object_group" },
    instance_of: { shape_group: "shape_group_class", object_group: "object_group_class", object: "object_class" },
    has_instance: { shape_group_class: "shape_group", object_group_class: "object_group", object_class: "object" },
    has_part: { object: "object" }, part_of: { object: "object" },
  };
  for (const [relation, directions] of Object.entries(pairs)) for (const sourceKind of kinds) for (const targetKind of kinds) {
    assert.equal(Boolean(typedReferenceValue({ ...typedRef(record({})), relation, targetKind }, sourceKind)),
      directions[sourceKind] === targetKind, `${sourceKind}/${relation}/${targetKind}`);
  }
  for (const targetKind of kinds) {
    assert.ok(typedReferenceValue({ ...typedRef(record({})), targetKind, relation: "references" }));
    assert.equal(Boolean(typedReferenceValue({ ...typedRef(record({})), targetKind, relation: "has_shape" })), targetKind === "shape");
  }
});

test("same-area causal reference reads never substitute a future revision in the same physical STM file", async () => {
  const past = record({ uid: "shape-shared" }, { revision: "past" });
  const future = { ...past, revision: "future" };
  const selected = configured();
  const calls = [];
  const capturedRead = async (areaId, kind, requestSignal) => {
    calls.push({ areaId, kind, frameId: "frame-before-future", signal: requestSignal });
    return areaResult([past]);
  };
  let directReads = 0;
  const direct = async () => { directReads++; throw new Error("Wrong context transport"); };
  const result = await resolveConfiguredReference(selected, [selected], typedRef(past),
    capturedRead, direct, signal());
  assert.equal(exactReferencedRecord(result, typedRef(past)).record, past);
  await assert.rejects(resolveConfiguredReference(selected, [selected], typedRef(future, { registeredPath: "memory_inherited" }),
    capturedRead, direct, signal()), /Unresolved reference/);
  assert.equal(directReads, 0);
  assert.equal(calls.length, 2);
  assert.ok(calls.every(call => call.areaId === selected.areaId && call.kind === "shape" && call.frameId === "frame-before-future"));
});

test("Nowhere reuses its same RAM-aware area transport and exact original provider", async () => {
  const selected = configured({ areaId: "session:nowhere", areaType: "session" });
  const volatile = record({ uid: "shape-ram" }, { source: { ...record({}).source, memoryLocationId: "memory-nowhere", scopeKind: "volatile" } });
  const read = async (areaId, kind) => areaResult([volatile], { areaId, kind,
    authorizedSources: [{ providerRef: "provider-a", memoryLocationId: "memory-nowhere", memoryKind: "shape" }] });
  const result = await resolveConfiguredReference(selected, [selected], typedRef(volatile), read, undefined, signal());
  assert.equal(exactReferencedRecord(result, typedRef(volatile)).record, volatile);
  await assert.rejects(resolveConfiguredReference(selected, [selected], typedRef(volatile, { providerRef: "session" }),
    read, undefined, signal()), /Unresolved reference/);
});

test("legacy resolution passes areaId and only switches through an exact provided registration", async () => {
  const objectArea = configured({ areaId: "legacy:object_memory/identity_dir/ls20", areaType: "legacy",
    registeredPath: "object_memory/identity_dir/ls20", memoryKinds: ["object"], plannedMemoryKinds: [] });
  const shapeArea = configured({ areaId: "legacy:object_memory/shape_dir", areaType: "legacy",
    registeredPath: "object_memory/shape_dir", memoryKinds: ["shape"], plannedMemoryKinds: [] });
  const shape = record({});
  const reference = typedRef(shape, { registeredPath: shapeArea.registeredPath });
  const areas = [objectArea, shapeArea];
  assert.equal(configuredReferenceArea(objectArea, typedRef(shape), areas), objectArea);
  assert.equal(configuredReferenceArea(objectArea, reference, areas), shapeArea);
  assert.throws(() => configuredReferenceArea(objectArea, { ...reference, registeredPath: "unregistered/path" }, areas), /unavailable/);
  assert.throws(() => configuredReferenceArea(objectArea, reference, [...areas, shapeArea]), /ambiguous/);
  let args;
  await resolveConfiguredReference(objectArea, areas, reference, undefined, async (...received) => {
    args = received;
    return areaResult([shape], { areaId: shapeArea.areaId });
  }, signal());
  assert.equal(args[0], shapeArea.areaId);
  assert.equal(args[1], reference);
  assert.ok(args[2] instanceof AbortSignal);
  for (const registeredPath of ["../elsewhere", "a\\b", "C:/elsewhere", "/absolute", "a//b"]) {
    assert.equal(typedReferenceValue({ ...reference, registeredPath }), null);
  }
  await assert.rejects(readConfiguredInspectorReference(async () => areaResult([shape]),
    shapeArea, reference, signal()), /Malformed contextual-area/);
});

test("reference cancellation rejects stale successes, errors and pre-aborted requests without fallback", async () => {
  for (const fail of [false, true]) {
    const controller = new AbortController();
    let release, reject, calls = 0;
    const pending = resolveConfiguredReference(configured(), [], typedRef(record({})), async () => {
      calls++;
      return new Promise((yes, no) => { release = yes; reject = no; });
    }, undefined, controller.signal);
    controller.abort();
    if (fail) reject(new Error("Old context failed"));
    else release(areaResult());
    await assert.rejects(pending);
    await assert.rejects(resolveConfiguredReference(configured(), [], typedRef(record({})),
      async () => { calls++; return areaResult(); }, undefined, controller.signal), { name: "AbortError" });
    assert.equal(calls, 1);
  }
});

test("ancestry checks use physical/version identity, not workspace, alias, path or geometric reuse", () => {
  const first = record({ alias: "s1", points: [[0, 0]] });
  const elsewhere = { ...first, source: { ...first.source, workspaceId: "other-workspace" } };
  assert.equal(isAncestorRecord([first], elsewhere), true);
  for (const distinct of [
    { ...first, revision: "new-version" },
    { ...first, recordUid: "other-record" },
    { ...first, source: { ...first.source, providerRef: "other-provider" } },
    { ...first, memoryKind: "object" },
  ]) assert.equal(isAncestorRecord([first], distinct), false);
  assert.equal(isAncestorRecord([], first), false, "the same target on an independent branch is not an ancestry cycle");
});

test("original MeTTa remains exact, immutable and bound to the selected physical document", async () => {
  const text = "; original spacing\r\n(memory_document (quoted \"[not JSON]\"))\r\n";
  const originalSource = Object.freeze({ format: "metta", path: "C:\\root\\shapes_db.metta", text, entryUid: "entry-a", readOnly: true });
  const original = Object.freeze(record({ uid: "shape-a" }, { originalSource }));
  const response = areaResult([original], { authorizedSources: [{
    providerRef: "provider-a", memoryLocationId: "location-a", memoryKind: "shape", path: originalSource.path,
  }] });
  const result = await readConfiguredInspectorArea(async () => response, configured(), "shape", signal());
  assert.equal(result.records[0].preferred.originalSource, originalSource);
  assert.equal(result.records[0].preferred.originalSource.text, text);
  assert.equal(inspectRecord(original).stableId, "shape-a");
  for (const bad of [{ ...originalSource, readOnly: false }, { ...originalSource, text: {} }, { ...originalSource, path: "another-file" }]) {
    await assert.rejects(readConfiguredInspectorArea(async () => areaResult([record({}, { originalSource: bad })],
      { authorizedSources: response.authorizedSources }), configured(), "shape", signal()), /malformed or out-of-area/);
  }
  const detail = readFileSync(new URL("./ShapeObjectInspector.tsx", import.meta.url), "utf8");
  assert.match(detail, /value=\{record\.originalSource\.text\}/);
  assert.match(detail, /contentReadOnly defaultFormat="text" defaultTextLang="clojure"/);
  assert.match(detail, /Normalized record projection/);
  assert.doesNotMatch(detail, /Exact immutable source \(JSON/);
});

test("the browser retains fixed area selection separately from causal content keys and delegates contextual reads", () => {
  const browser = readFileSync(new URL("./ShapeObjectInspectorBrowser.tsx", import.meta.url), "utf8");
  assert.match(browser, /JSON\.stringify\(\[contextKey, readContextKey \?\? ""\]\)/);
  assert.match(browser, /<AreaRecords key=\{JSON\.stringify\(\[areaKey, kind, selectionContext/);
  assert.match(browser, /resolveConfiguredReference\(area, areas, reference,/);
  assert.match(browser, /isAncestorRecord/);
  assert.match(browser, /area\.plannedMemoryKinds\?\.includes\(kind\)/);
});
