import assert from "node:assert/strict";
import test from "node:test";
import { readFileSync } from "node:fs";
import {
  createNativeMemoryPublication, publicationContextError, publicationRequest,
  validatePublicationOptions, validatePublicationPlan, validatePublicationResult,
} from "./NativeMemoryPublicationModel.ts";

const hash = char => char.repeat(64);
const context = { workspaceId: "arc3_random_player", sequenceId: "data/recordings/game/run-a", frameId: "frame-two" };
const causal = { sequenceId: context.sequenceId, gameId: "game", levelId: "1", frameId: context.frameId, frameOrder: 2 };
const preservation = { sourcePreserved: true, activation: "none", ruleAcceptance: "unchanged", independentEvidenceAdded: false };
const copy = value => JSON.parse(JSON.stringify(value));
function optionsFixture(kind = "shape") {
  const common = { providerRef: "filesystem:omega_vision", kind, capabilities: { read: true, write: true, reason: null } };
  const item = { id: hash("a"), kind, eligible: true, reason: null, revision: kind === "deduction" ? "rule-version-a" : hash("b"),
    causal: { ...causal, frameId: "frame-zero", frameOrder: 0 },
    ...(kind === "deduction" ? { candidateId: "candidate-a", evaluationId: "evaluation-a" }
      : { recordUid: "memory-record-source", conceptUid: "memory-concept-a", payloadUid: `${kind}-payload-a` }) };
  return { schemaVersion: 1, context: copy(causal), sources: [{
    ...common, id: "memory-location-stm", label: "memory_level_1_stm", scopeKind: "run",
    registeredPath: "recordings/game/run-a/memory_level_1_stm", exists: true, revision: hash("c"),
    items: [item, { id: hash("d"), kind, eligible: false, reason: "Item is not strictly earlier than the selected publication cutoff" }], eligibleCount: 1,
  }], destinations: [
    { ...common, id: "memory-location-level", label: "memory_level_1_ltm", scopeKind: "level",
      registeredPath: "recordings/game/memory_level_1_ltm", exists: false, revision: null },
    { ...common, id: "memory-location-game", label: "memory_game_all", scopeKind: "game",
      registeredPath: "recordings/game/memory_game_all", exists: true, revision: hash("e") },
  ], unsupportedKinds: { observation: "No LTM observation schema.", hypothesis: "Frame-local only.", object_group: "Typed group schema unavailable." },
  readOnly: true, automaticPublication: false };
}
function selection(kind = "shape") {
  return { kind, sourceId: "memory-location-stm", destinationId: "memory-location-level", itemIds: [hash("a")],
    approval: { reviewer: "reviewer", reason: "Retain this exact native version" } };
}
function planFixture(body, options = optionsFixture(body.kind), action = "append") {
  const source = copy(options.sources.find(entry => entry.id === body.sourceId));
  delete source.items; delete source.eligibleCount;
  const items = body.itemIds.map(id => {
    const entry = options.sources[0].items.find(entry => entry.id === id);
    return { sourceEntryUid: id,
      ...(body.kind === "deduction" ? { candidateId: entry.candidateId, candidateVersion: entry.revision, evaluationId: entry.evaluationId }
        : { sourceRecordUid: entry.recordUid, destinationRecordUid: `memory-record-destination-${id}`, conceptUid: entry.conceptUid, recordRevision: entry.revision }),
      action, existingEntryUid: action === "already_present" ? hash("9") : null, existingConceptRevisions: [],
      proof: body.kind === "deduction" ? { candidateId: entry.candidateId, candidateVersion: entry.revision, evaluationId: entry.evaluationId, confidence: .95 } : [] };
  });
  return { schemaVersion: 1, status: "planned", confirmationKey: hash("f"), source,
    destination: copy(options.destinations.find(entry => entry.id === body.destinationId)), cutoff: copy(causal), items,
    requiresConfirmation: true, readOnly: true, ...preservation,
    identityPolicy: "Semantic IDs/revisions retained; physical record addresses are destination-specific",
    reusePolicy: "No implicit LTM reads; cross-recording order is unavailable" };
}
function resultFixture(plan, status = "published") {
  return { schemaVersion: 1, status, confirmationKey: plan.confirmationKey,
    items: status === "already_present" ? copy(plan.items) : plan.items.map(item => ({ sourceEntryUid: item.sourceEntryUid,
      destinationEntryUid: item.existingEntryUid ?? hash("8") })), ...preservation };
}
const response = (value, status = 200) => ({ ok: status >= 200 && status < 300, status, json: async () => copy(value) });
function deferred() { let resolve, reject; const promise = new Promise((yes, no) => { resolve = yes; reject = no; }); return { promise, resolve, reject }; }
function harness(kind = "shape", custom) {
  const calls = [], options = optionsFixture(kind);
  let plan;
  const transport = async (url, init) => {
    calls.push({ url, init, body: init.body ? JSON.parse(init.body) : undefined });
    if (custom) {
      const value = custom(calls.at(-1), options);
      if (value !== undefined) return value;
    }
    if (url.includes("/options?")) return response(options);
    if (url.endsWith("/plan")) { plan = planFixture(JSON.parse(init.body), options); return response(plan); }
    return response(resultFixture(plan));
  };
  const model = createNativeMemoryPublication(context, transport);
  const select = () => {
    model.select({ kind });
    model.select({ sourceId: "memory-location-stm" });
    model.select({ destinationId: "memory-location-level", itemIds: [hash("a")], approval: selection(kind).approval });
  };
  return { model, calls, options, select };
}

test("closed construction, selection and confirmation never issue requests", () => {
  const { model, calls, select } = harness();
  select(); model.confirm(true); model.publish(); model.plan();
  assert.deepEqual(calls, []);
  assert.equal(model.getSnapshot().open, false);
});
test("explicit opening performs only a strict no-store GET and never creates a destination", async () => {
  const { model, calls } = harness();
  await model.open();
  assert.equal(calls.length, 1);
  const { url, init } = calls[0];
  assert.equal(new URL(url, "http://local").pathname, "/workbench/memory/publications/options");
  assert.deepEqual(Object.fromEntries(new URL(url, "http://local").searchParams), context);
  assert.equal(init.method, "GET"); assert.equal(init.cache, "no-store"); assert.equal(init.redirect, "error");
  assert.equal(init.body, undefined);
  assert.equal(model.getSnapshot().options.destinations[0].exists, false);
  await model.open();
  assert.equal(calls.length, 1);
});
test("unvalidated, curated, unsafe and missing-frame contexts cannot load publication options", async () => {
  for (const ctx of [null, { ...context, frameId: "" }, { ...context, sequenceId: "data/curated/game/run" },
    { ...context, sequenceId: "data/recordings/game/../run" }, { ...context, frameId: "../next" }, { ...context, frameId: undefined }]) {
    let calls = 0;
    const model = createNativeMemoryPublication(ctx, async () => { calls++; throw Error("must not fetch"); });
    assert.ok(publicationContextError(ctx));
    await model.open(); assert.equal(calls, 0); assert.ok(model.getSnapshot().error);
  }
});
for (const kind of ["shape", "object", "deduction"]) {
  test(`${kind} exact request uses native entry ID, options-bound areas and approval only`, () => {
    const raw = optionsFixture(kind), options = validatePublicationOptions(raw, context);
    const supplied = { ...selection(kind), memorySnapshot: { forbidden: true }, candidateRule: "not accepted" };
    const request = publicationRequest(context, options, supplied);
    assert.deepEqual(Object.keys(request).sort(), ["workspaceId", "sequenceId", "frameId", "kind", "sourceId", "destinationId", "itemIds", "approval"].sort());
    assert.deepEqual(request.itemIds, [hash("a")]);
    assert.equal(request.approval.reason, supplied.approval.reason);
    const plan = validatePublicationPlan(planFixture(request, raw), request, options);
    assert.ok(Object.isFrozen(plan.items[0]));
    assert.equal(plan.sourcePreserved, true);
    assert.equal(plan.activation, "none");
  });
}
test("item selection rejects record/payload substitutes, duplicates, future entries, mismatched kind and unavailable source", () => {
  const options = validatePublicationOptions(optionsFixture(), context);
  for (const patch of [{ itemIds: [] }, { itemIds: ["memory-record-source"] }, { itemIds: ["shape-payload-a"] },
    { itemIds: [hash("a"), hash("a")] }, { itemIds: [hash("d")] }, { kind: "object" }, { kind: "hypothesis" },
    { sourceId: "session:nowhere" }, { destinationId: "not-authorized" }]) {
    assert.throws(() => publicationRequest(context, options, { ...selection(), ...patch }));
  }
  const missing = optionsFixture(); missing.sources[0].exists = false; missing.sources[0].revision = null;
  missing.sources[0].items = []; missing.sources[0].eligibleCount = 0;
  assert.throws(() => publicationRequest(context, validatePublicationOptions(missing, context), selection()), /available native STM/);
});
test("selection boundary is 1–100 unique eligible entries", () => {
  const raw = optionsFixture(), sample = raw.sources[0].items[0];
  raw.sources[0].items = Array.from({ length: 101 }, (_, i) => ({ ...copy(sample), id: i.toString(16).padStart(64, "0") }));
  raw.sources[0].eligibleCount = 101;
  const options = validatePublicationOptions(raw, context);
  const ids = options.sources[0].items.map(item => item.id);
  assert.equal(publicationRequest(context, options, { ...selection(), itemIds: ids.slice(0, 100) }).itemIds.length, 100);
  assert.throws(() => publicationRequest(context, options, { ...selection(), itemIds: ids }), /1–100/);
});
test("explicit attribution rejects blanks, multiline/control input and overlength without accepting rule fields", () => {
  const options = validatePublicationOptions(optionsFixture(), context);
  for (const invalid of ["", "   ", "line\nbreak", "tab\t", "line\u2028separator", "a".repeat(2001)]) {
    for (const key of ["reviewer", "reason"]) assert.throws(() => publicationRequest(context, options, {
      ...selection(), approval: { ...selection().approval, [key]: invalid },
    }), /single-line/);
  }
});
for (const [name, change] of [
  ["wrong frame", value => { value.context.frameId = "another"; }],
  ["wrong sequence", value => { value.context.sequenceId = "data/recordings/game/other"; }],
  ["missing level", value => { value.context.levelId = null; }],
  ["browser source", value => { value.sources[0].id = "memory-nowhere"; }],
  ["external provider", value => { value.sources[0].providerRef = "external"; }],
  ["hidden workspace area", value => { value.destinations[0].registeredPath = "workspaces/private/ltm"; }],
  ["unsafe area", value => { value.sources[0].registeredPath += "/../outside"; }],
  ["unknown native kind", value => { value.sources[0].kind = "hypothesis"; }],
  ["false eligibility count", value => { value.sources[0].eligibleCount = 2; }],
  ["missing reason", value => { delete value.sources[0].items[1].reason; }],
  ["duplicate entry", value => { value.sources[0].items.push(copy(value.sources[0].items[0])); value.sources[0].eligibleCount++; }],
  ["future causal entry", value => { value.sources[0].items[0].causal.frameOrder = 3; }],
  ["automatic publication", value => { value.automaticPublication = true; }],
]) test(`options reject ${name}`, () => {
  const raw = copy(optionsFixture()); change(raw); assert.throws(() => validatePublicationOptions(raw, context));
});
test("shared areas/identities remain identical across workspace authority switches", () => {
  const first = validatePublicationOptions(optionsFixture(), context);
  const second = validatePublicationOptions(optionsFixture(), { ...context, workspaceId: "other-workspace" });
  assert.deepEqual(first, second);
});
for (const [name, change] of [
  ["key", value => { value.confirmationKey = "bad"; }],
  ["cutoff", value => { value.cutoff.frameOrder++; }],
  ["source revision", value => { value.source.revision = hash("0"); }],
  ["destination revision", value => { value.destination.exists = true; value.destination.revision = hash("1"); }],
  ["source entry", value => { value.items[0].sourceEntryUid = hash("7"); }],
  ["record revision", value => { value.items[0].recordRevision = hash("7"); }],
  ["concept", value => { value.items[0].conceptUid = "changed"; }],
  ["action", value => { value.items[0].action = "activate"; }],
  ["activation", value => { value.activation = "automatic"; }],
  ["evidence", value => { value.independentEvidenceAdded = true; }],
  ["source preservation", value => { value.sourcePreserved = false; }],
]) test(`plan rejects changed ${name}`, () => {
  const options = validatePublicationOptions(optionsFixture(), context), request = publicationRequest(context, options, selection());
  const value = planFixture(request); change(value);
  assert.throws(() => validatePublicationPlan(value, request, options));
});
test("read-only plan never commits until both separate confirmation and publish click", async () => {
  const { model, calls, select } = harness();
  await model.open(); select(); await model.plan();
  assert.deepEqual(calls.map(call => call.init.method), ["GET", "POST"]);
  assert.ok(calls[1].url.endsWith("/plan"));
  assert.deepEqual(calls[1].body, { ...context, ...selection() });
  await model.publish(); assert.equal(calls.length, 2);
  model.confirm(true); assert.equal(calls.length, 2);
  await model.publish();
  assert.equal(calls.length, 3); assert.ok(calls[2].url.endsWith("/commit"));
  assert.deepEqual(calls[2].body, { ...context, ...selection(), confirmed: true, confirmationKey: hash("f") });
  assert.equal(model.getSnapshot().result.status, "published");
});
test("synchronous double clicks issue at most one plan or commit", async () => {
  const gate = deferred();
  const { model, calls, select } = harness("shape", call => call.url.endsWith("/commit") ? gate.promise : undefined);
  await model.open(); select();
  const planning = model.plan(); await model.plan(); await planning;
  model.confirm(true);
  const publishing = model.publish(); await model.publish(); model.confirm(true); await model.publish();
  assert.equal(calls.filter(call => call.url.endsWith("/plan")).length, 1);
  assert.equal(calls.filter(call => call.url.endsWith("/commit")).length, 1);
  gate.resolve(response(resultFixture(model.getSnapshot().plan.response))); await publishing;
  await model.publish(); assert.equal(calls.length, 3);
});
test("selection changes invalidate a delayed plan before the response or its JSON decoding settles", async () => {
  for (const duringJson of [false, true]) {
    const gate = deferred();
    const { model, calls, select } = harness("shape", call => call.url.endsWith("/plan")
      ? duringJson ? { ok: true, status: 200, json: () => gate.promise } : gate.promise : undefined);
    await model.open(); select();
    const pending = model.plan();
    await Promise.resolve();
    const oldRequest = calls.at(-1).body;
    model.select({ approval: { reviewer: "changed", reason: "New explicit reason" } });
    gate.resolve(duringJson ? planFixture(oldRequest) : response(planFixture(oldRequest)));
    await pending;
    assert.equal(model.getSnapshot().plan, null);
    assert.equal(model.getSnapshot().confirmed, false);
    assert.equal(model.getSnapshot().selection.approval.reviewer, "changed");
    assert.equal(calls.length, 2);
  }
});
test("every material selection change clears the plan and confirmation without additional I/O", async () => {
  for (const patch of [{ kind: "object" }, { sourceId: "other" }, { destinationId: "memory-location-game" }, { itemIds: [] },
    { approval: { reviewer: "other", reason: "other" } }]) {
    const { model, calls, select } = harness();
    await model.open(); select(); await model.plan(); model.confirm(true);
    model.select(patch);
    assert.equal(model.getSnapshot().plan, null); assert.equal(model.getSnapshot().confirmed, false);
    await model.publish(); assert.equal(calls.length, 2);
  }
});
test("context changes clear old options/plans without requesting the new context", async () => {
  for (const patch of [{ workspaceId: "other" }, { sequenceId: "data/recordings/game/run-b" }, { frameId: "later" }]) {
    const gate = deferred();
    const { model, calls } = harness("shape", () => gate.promise);
    const opening = model.open(); model.setContext({ ...context, ...patch });
    gate.resolve(response(optionsFixture())); await opening;
    assert.equal(model.getSnapshot().options, null); assert.equal(model.getSnapshot().open, false);
    assert.match(model.getSnapshot().notice, /Context changed/); assert.equal(calls.length, 1);
  }
});
test("409 requires explicit refresh/replan and is never retried", async () => {
  const { model, calls, select } = harness("shape", call => call.url.endsWith("/plan") ? response({ detail: "Native source changed" }, 409) : undefined);
  await model.open(); select(); await model.plan();
  assert.match(model.getSnapshot().error, /409.*changed/);
  assert.equal(model.getSnapshot().options, null); assert.equal(model.getSnapshot().plan, null);
  assert.equal(calls.length, 2);
  await model.refresh(); assert.equal(calls.length, 3);
});
test("unknown commit outcome is retained with original context and cannot replay the same confirmation", async () => {
  const { model, calls, select } = harness("shape", call => call.url.endsWith("/commit") ? Promise.reject(new Error("connection lost")) : undefined);
  await model.open(); select(); await model.plan(); model.confirm(true); await model.publish();
  assert.match(model.getSnapshot().unknownOutcome, /outcome unknown.*run-a.*frame-two/);
  assert.equal(model.getSnapshot().plan, null);
  await model.refresh(); select(); await model.plan(); model.confirm(true); await model.publish();
  assert.match(model.getSnapshot().error, /already submitted/);
  assert.equal(calls.filter(call => call.url.endsWith("/commit")).length, 1);
  model.setContext({ ...context, frameId: "later" });
  assert.match(model.getSnapshot().unknownOutcome, /frame-two/);
  assert.equal(model.getSnapshot().result, null);
});
test("changes or suspension while committing retain an honest original-context warning and discard stale success", async () => {
  for (const change of [model => model.select({ itemIds: [] }), model => model.setContext({ ...context, frameId: "later" }), model => model.suspend()]) {
    const gate = deferred();
    const { model, calls, select } = harness("shape", call => call.url.endsWith("/commit") ? gate.promise : undefined);
    await model.open(); select(); await model.plan(); model.confirm(true);
    const plan = model.getSnapshot().plan.response, publishing = model.publish();
    change(model); gate.resolve(response(resultFixture(plan))); await publishing;
    assert.equal(model.getSnapshot().result, null);
    assert.match(model.getSnapshot().unknownOutcome, /frame-two.*outcome is unknown/);
    model.setActive(true);
    assert.match(model.getSnapshot().unknownOutcome, /frame-two/);
    assert.equal(calls.length, 3);
  }
});
test("acknowledgments require exact keys, entries and unchanged side-effect guarantees", () => {
  const options = validatePublicationOptions(optionsFixture(), context), request = publicationRequest(context, options, selection());
  const plan = { request, response: validatePublicationPlan(planFixture(request), request, options) };
  for (const change of [value => { value.confirmationKey = hash("1"); }, value => { value.items[0].sourceEntryUid = hash("2"); },
    value => { value.items[0].destinationEntryUid = "record-not-entry"; }, value => { value.ruleAcceptance = "accepted"; }]) {
    const value = resultFixture(plan.response); change(value); assert.throws(() => validatePublicationResult(value, plan));
  }
  for (const status of ["published", "already_published"]) assert.equal(validatePublicationResult(resultFixture(plan.response, status), plan).status, status);
  const present = { request, response: validatePublicationPlan(planFixture(request, optionsFixture(), "already_present"), request, options) };
  assert.equal(validatePublicationResult(resultFixture(present.response, "already_present"), present).status, "already_present");
});
test("unavailable and invalid options remain actionable errors without POST or automatic refresh", async () => {
  for (const value of [response({ detail: "No explicit level" }, 409), response({ schemaVersion: 2 }), { ok: true, status: 200, json: async () => { throw Error("Invalid JSON"); } }]) {
    const { model, calls } = harness("shape", () => value);
    await model.open(); assert.ok(model.getSnapshot().error); assert.equal(model.getSnapshot().options, null);
    assert.equal(calls.length, 1); assert.equal(calls[0].init.method, "GET");
  }
});
test("host integration uses only validated identifiers and leaves saved-area inspection independent", () => {
  const host = readFileSync(new URL("./MemorySetupHost.tsx", import.meta.url), "utf8");
  const panel = readFileSync(new URL("./NativeMemoryPublication.tsx", import.meta.url), "utf8");
  const model = readFileSync(new URL("./NativeMemoryPublicationModel.ts", import.meta.url), "utf8");
  assert.match(host, /<NativeMemoryPublication workspaceId=\{workspaceId\} sequenceId=\{recordingContext\?\.sequenceId\}\s+frameId=\{recordingContext\?\.selectedFrameId\} active=\{active\}/);
  assert.match(host, /\{active && <ShapeObjectInspectorBrowser/);
  assert.doesNotMatch(panel + model, /memoryRequest|memorySnapshot|memorySessionId|flushPending|localStorage|sessionStorage|setSharedVisualSequence|rotateMemorySession/);
  for (const effect of panel.matchAll(/use(?:Layout)?Effect\([\s\S]*?\[[^\]]+\]\);/g))
    assert.ok(!/publication\.(open|refresh|plan|publish)\(/.test(effect[0]), "Effects must not issue publication requests.");
  assert.match(panel, /onClick=\{\(\) => state\.open \? publication\.close\(\) : void publication\.open\(\)\}/);
  assert.match(panel, /onClick=\{\(\) => void publication\.publish\(\)\}/);
  assert.match(panel, /No implicit LTM reading/);
  assert.match(panel, /Cross-recording inference reuse remains unavailable/);
});
