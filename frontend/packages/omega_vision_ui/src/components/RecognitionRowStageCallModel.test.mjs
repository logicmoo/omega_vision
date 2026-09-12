import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import { stripTypeScriptTypes } from "node:module";
import test from "node:test";
import { isRecord, planConfirmationError } from "./SemanticEventsModel.ts";
import { directCompositeDescription } from "./DirectCompositePickerModel.ts";

const source = readFileSync(new URL("./RecognitionRowStageCallModel.ts", import.meta.url), "utf8");
const compiled = stripTypeScriptTypes(source.replace(/^import .*;\r?\n/gm, ""));
globalThis.rowCallTestDependencies = { isRecord, planConfirmationError };
const { RecognitionRowCallController, actualRowFrameId, rowCallRequest, rowStageAvailable,
  parseRowCallPlan, parseRowCallJob, rowPlanConfirmationError, parseRowTargetEligibility, loadRowTargetEligibility,
  rowTargetEligibilityError } = await import(`data:text/javascript,${encodeURIComponent(
  `const {isRecord, planConfirmationError} = globalThis.rowCallTestDependencies;\n${compiled}`,
)}`);
delete globalThis.rowCallTestDependencies;

const catalog = [
  ...["deduction", "induction", "abduction"].map(kind => ({
    id: `two_frame_x_duction/${kind}`, type: "py_pl", available: true,
    family: "two_frame_x_duction", resultCategory: kind, inputContract: { frameInputCount: 2, usesSTM: true },
  })),
  ...[[1, false, "one_frame"], [2, false, "two_frames"], [1, true, "one_frame_and_stm"], [2, true, "two_frames_and_stm"]]
    .map(([frameInputCount, usesSTM, name]) => ({
      id: `resolve_objects_via_${name}/native`, type: "py_pl", available: true, inputContract: { frameInputCount, usesSTM },
    })),
  { id: "event_log_0/canonical", type: "py_pl", available: true },
  { id: "llm_events/model", type: "llm", available: true },
  { id: "unavailable/native", type: "py_pl", available: false },
];
const context = { workspaceId: "arc3_random_player", sequenceId: "data/recordings/events_tests/spotlight_scene_train_a", frameId: "000001" };
const stageId = catalog[0].id;
const request = { ...context, stageId };
const eligibility = { stageIds: catalog.map(entry => entry.id), llmStageIds: catalog.filter(entry => entry.type === "llm").map(entry => entry.id) };
const jobId = "a".repeat(32);
function planFixture(scope = request) {
  const supportFrameIds = scope.frameId === "image" ? ["image"] : ["image", scope.frameId];
  const targetContext = { currentFrameId: scope.frameId, currentFrameOrder: scope.frameId === "image" ? 0 : 1,
    previousFrameId: scope.frameId === "image" ? null : "image", status: scope.frameId === "image" ? "initial_observation" : "pair" };
  const binding = { targetFrameId: scope.frameId, targetContext, supportFrameIds, requestedFrameIds: [scope.frameId] };
  return { stageId: scope.stageId, label: scope.stageId, frameCount: supportFrameIds.length, pairCount: supportFrameIds.length - 1,
    llmCallCount: 0, modelId: "", backendId: "", cost: null, blockedReasons: [], confirmationKey: "fresh-confirmation", ...binding,
    raw: { ...binding, sequenceId: scope.sequenceId, workspaceId: scope.workspaceId, composite: scope.stageId,
      llmSteps: [], ordered: true, pipeline: [{ transformation: scope.stageId.split("/")[0], doer: scope.stageId.split("/")[1], options: {} }],
      steps: [{ frameId: scope.frameId, output: scope.stageId, dependencies: [] }] } };
}
function jobFixture(scope = request, state = "running") {
  const { targetFrameId, targetContext, supportFrameIds, requestedFrameIds } = planFixture(scope);
  return { id: jobId, kind: "direct-transform", composite: scope.stageId, sequenceId: scope.sequenceId,
    workspaceId: scope.workspaceId, targetFrameId, targetContext, supportFrameIds, requestedFrameIds,
    state, done: state === "done" ? 1 : 0, total: 1 };
}
function deferred() {
  let resolve, reject;
  const promise = new Promise((yes, no) => { resolve = yes; reject = no; });
  return { promise, resolve, reject };
}
async function tick() { for (let index = 0; index < 10; index++) await Promise.resolve(); }
function fixture(overrides = {}, scope = context) {
  const requests = [], completions = [], timers = new Map();
  let flushes = 0, nextTimer = 0;
  const dependencies = {
    catalog: () => catalog, enabled: () => true, visible: () => true,
    eligibility: () => eligibility,
    beforeRequest: async () => { flushes++; },
    post: async (url, body, signal, progress, readOnly) => {
      requests.push({ method: "POST", url, body, signal, readOnly });
      return url.endsWith("/plan") ? planFixture(body) : jobFixture(body);
    },
    get: async (url, signal) => { requests.push({ method: "GET", url, signal }); return jobFixture({ ...scope, stageId }, "done"); },
    cancel: async (url, body, signal) => { requests.push({ method: "POST", url, body, signal }); return { jobId: body.jobId, cancelling: true }; },
    completed: async job => { completions.push(job); },
    clock: { set: callback => { const id = ++nextTimer; timers.set(id, callback); return id; }, clear: id => timers.delete(id) },
    ...overrides,
  };
  const controller = new RecognitionRowCallController(scope, dependencies);
  return { controller, dependencies, requests, completions, timers, flushes: () => flushes,
    timer: () => { const [id, callback] = timers.entries().next().value; timers.delete(id); return callback; } };
}

test("only actual unit IDs are serialized, including numeric zero and the literal initial image", () => {
  assert.equal(actualRowFrameId("image"), "image");
  assert.equal(actualRowFrameId(0), "0");
  assert.equal(actualRowFrameId("frame_007.png"), "frame_007.png");
  for (const missing of [null, undefined, "", " ", true, {}, { id: "display-id" }]) assert.equal(actualRowFrameId(missing), null);
  assert.deepEqual(rowCallRequest({ ...context, frameId: actualRowFrameId("image") }, stageId, catalog),
    { ...context, frameId: "image", stageId });
  assert.throws(() => rowCallRequest({ ...context, frameId: null }, stageId, catalog), /actual unitId/);
  assert.deepEqual(rowCallRequest({ ...context, id: "display-id", unitId: "wrong-unit", firstN: 99, moves: ["other"] }, stageId, catalog), request);
  const page = readFileSync(new URL("./VideoImportPage.tsx", import.meta.url), "utf8");
  assert.match(page, /unitId=\{it\.unitId\} composites=\{directComposites\}/);
});

test("unsafe and noncanonical source destinations never produce a row request", () => {
  for (const sequenceId of ["data/recordings/../other", "data/curated/../../other", "data/recordings/a%2fb",
    "https://example.test/sequence", "data/recordings/a\\b", "data/omega_vision/workspaces/a/recordings/b", "data/video/legacy"]) {
    assert.throws(() => rowCallRequest({ ...context, sequenceId }, stageId, catalog), /shared Visual Sequence/);
  }
  assert.equal(rowCallRequest({ ...context, sequenceId: "data/curated/scene-a" }, stageId, catalog).sequenceId, "data/curated/scene-a");
});

test("real registry choices reuse scope colors; absent, unavailable and LLM doers cannot run", () => {
  assert.equal(catalog.filter(rowStageAvailable).length, 8);
  const groups = catalog.slice(3, 7).map(entry => directCompositeDescription(entry.id, catalog).groupKey);
  assert.deepEqual(groups, ["01-single-frame", "03-two-frames", "02-single-frame-stm", "04-two-frames-stm"]);
  for (const id of ["not_registered/native", "unavailable/native", "llm_events/model"]) {
    assert.throws(() => rowCallRequest(context, id, catalog), /registered native/);
  }
  assert.equal(rowStageAvailable({ id: "fake", available: "true", type: "py_pl" }), false);
  assert.equal(rowStageAvailable({ id: "unknown/native", available: true }), false);
});

function eligibilityFixture(frameId = context.frameId, stages = [{ id: stageId, llm: false }]) {
  return { targetFrameId: frameId, frameCount: 1, frames: [{ id: frameId }], stages };
}

test("confirmed-row eligibility is discovered through a scoped read, not inferred from callable metadata", async () => {
  const firstPass = { id: "observation_identity_0/content_hash", available: true, type: "py_pl",
    inputContract: { frameInputCount: 1, usesSTM: false } };
  const calls = [], first = { ...context, frameId: "image" };
  const supported = await loadRowTargetEligibility(first, async (url, body, signal, progress, readOnly) => {
    calls.push({ url, body, signal, progress, readOnly });
    return eligibilityFixture("image", [{ id: stageId, llm: false }, { id: "llm_events/model", llm: true }]);
  }, new AbortController().signal);
  assert.equal(calls.length, 1);
  assert.equal(calls[0].url, "/workbench/video-import/semantic/execution/read");
  assert.deepEqual(calls[0].body, first);
  assert.equal(calls[0].readOnly, true);
  assert.equal(rowStageAvailable(firstPass), true);
  assert.equal(directCompositeDescription(firstPass.id, [firstPass]).groupKey, "01-single-frame");
  assert.equal(rowTargetEligibilityError(firstPass.id, supported), "Not supported as a confirmed row target");
  assert.equal(rowTargetEligibilityError(stageId, supported), undefined);
  assert.match(rowTargetEligibilityError("llm_events/model", supported), /LLM target/);
  assert.match(rowTargetEligibilityError(stageId, null), /check supported row targets/);
});

test("eligibility rejects wrong/missing frame bindings, duplicates and incomplete capabilities", () => {
  for (const bad of [
    { stages: [] }, { ...eligibilityFixture(), targetFrameId: "display-id" },
    { ...eligibilityFixture(), frames: [{ id: "another-frame" }] },
    { ...eligibilityFixture(), frameCount: 35 }, { ...eligibilityFixture(), stages: [{ id: stageId }] },
    { ...eligibilityFixture(), stages: [{ id: stageId, llm: false }, { id: stageId, llm: false }] },
  ]) assert.throws(() => parseRowTargetEligibility(bad, context), /supported|duplicate/);
  assert.deepEqual(parseRowTargetEligibility(eligibilityFixture(context.frameId, []), context), { stageIds: [], llmStageIds: [] });
});

test("late or failed discovery never produces a fallback eligibility list", async () => {
  const pending = deferred(), abort = new AbortController();
  const result = loadRowTargetEligibility(context, () => pending.promise, abort.signal);
  abort.abort();
  pending.resolve(eligibilityFixture());
  await assert.rejects(result, error => error.name === "AbortError");
  await assert.rejects(loadRowTargetEligibility(context, async () => { throw new Error("offline"); },
    new AbortController().signal), /offline/);
});

test("a callable FIRST_PASS dependency cannot be planned as an unsupported confirmed row root", async () => {
  const firstPass = { id: "observation_identity_0/content_hash", type: "py_pl", available: true };
  for (const allowed of [null, parseRowTargetEligibility(eligibilityFixture(), context)]) {
    const f = fixture({ catalog: () => [...catalog, firstPass], eligibility: () => allowed });
    f.controller.select(firstPass.id);
    await f.controller.plan(); await f.controller.confirm();
    assert.equal(f.requests.length, 0);
    assert.equal(f.flushes(), 0);
    assert.match(f.controller.getSnapshot().error, /supported row targets|Not supported as a confirmed row target/);
  }
});

test("revoked route eligibility during confirmation flush cannot send a commit", async () => {
  const pending = deferred();
  let allowed = eligibility, flushes = 0;
  const f = fixture({ eligibility: () => allowed, beforeRequest: async () => { if (++flushes === 2) await pending.promise; } });
  f.controller.select(stageId); await f.controller.plan();
  const committing = f.controller.confirm(); await tick();
  allowed = { stageIds: [], llmStageIds: [] };
  pending.resolve(); await committing;
  assert.equal(f.requests.length, 1);
  assert.match(f.controller.getSnapshot().error, /Not supported as a confirmed row target/);
});

test("eligibility discovery is explicit picker-open work and never creates a run", () => {
  const component = readFileSync(new URL("./RecognitionRowStageCall.tsx", import.meta.url), "utf8");
  assert.match(component, /onOpen=\{\(\) => queueMicrotask\(\(\) => void checkEligibility\(\)\)\}/);
  assert.match(component, /eligibility: \(\) => eligibilityRef\.current/);
  assert.match(component, /eligibilityAbort\.current\?\.abort\(\)/);
  assert.match(component, /!mounted\.current \|\| eligibilityPending\.current/);
  assert.match(component, /Not supported|rowTargetEligibilityError/);
  assert.match(component, /Retry supported targets/);
});

test("plan binding rejects changed source, stage, frame, whole-sequence targets and invalid causal context", () => {
  for (const mutate of [
    value => { value.stageId = catalog[1].id; },
    value => { value.raw.sequenceId = "data/curated/other"; },
    value => { value.targetFrameId = "display-id"; },
    value => { value.requestedFrameIds.push("000002"); },
    value => { value.raw.supportFrameIds = ["another"]; },
    value => { value.targetContext.previousFrameId = context.frameId; },
    value => { value.llmCallCount = -1; },
    value => { value.raw.steps[0].frameId = "unreported-frame"; },
  ]) {
    const value = planFixture(); mutate(value);
    assert.throws(() => parseRowCallPlan(value, request));
  }
  const first = { ...request, frameId: "image" };
  const plan = parseRowCallPlan(planFixture(first), first);
  assert.equal(plan.target.currentFrameId, "image");
  assert.equal(plan.target.previousFrameId, null);
});

test("blocked, hidden LLM dependencies and large unconfirmed scopes cannot be waived", () => {
  const blocked = planFixture(); blocked.blockedReasons = ["No predecessor"];
  assert.match(rowPlanConfirmationError(parseRowCallPlan(blocked, request)), /No predecessor/);
  const paid = planFixture(); paid.llmCallCount = 2;
  assert.match(rowPlanConfirmationError(parseRowCallPlan(paid, request)), /LLM dependencies/);
  const hidden = planFixture(); hidden.raw.llmSteps = ["paid/dependency"];
  assert.match(rowPlanConfirmationError(parseRowCallPlan(hidden, request)), /LLM dependencies/);
  const pipeline = planFixture(); pipeline.raw.pipeline[0].type = "llm";
  assert.match(rowPlanConfirmationError(parseRowCallPlan(pipeline, request)), /LLM dependencies/);
  assert.match(rowPlanConfirmationError({ ...parseRowCallPlan(planFixture(), request), frameCount: 801 }), /exact frame count/);
});

test("construction, visibility and selecting a stage do not call APIs; plan and commit each flush first", async () => {
  const f = fixture();
  f.controller.suspend(); f.controller.resume(); f.controller.select(stageId);
  assert.equal(f.requests.length, 0);
  await f.controller.plan();
  assert.equal(f.flushes(), 1);
  assert.deepEqual(f.requests[0].body, request);
  assert.equal(f.requests[0].readOnly, true);
  assert.equal(f.controller.getSnapshot().job, null);
  await f.controller.confirm();
  assert.equal(f.flushes(), 2);
  assert.deepEqual(f.requests[1].body, { ...request, confirmed: true, confirmationKey: "fresh-confirmation", run: true });
  assert.equal(f.requests.some(entry => /sequence-sets|transform\/|pooler/.test(entry.url)), false);
  for (const entry of f.requests) {
    assert.equal("firstN" in entry.body, false);
    assert.equal("moves" in entry.body, false);
    assert.equal("unitId" in entry.body, false);
  }
  f.controller.suspend();
});

test("double clicks do not duplicate pending plans or commits", async () => {
  const pending = deferred();
  let posts = 0;
  const f = fixture({ post: async (url, body) => {
    posts++;
    if (url.endsWith("/plan")) return pending.promise;
    return jobFixture(body);
  } });
  f.controller.select(stageId);
  const planning = f.controller.plan();
  await f.controller.plan(); await tick();
  assert.equal(posts, 1);
  pending.resolve(planFixture()); await planning;
  const confirmation = f.controller.confirm();
  await f.controller.confirm(); await confirmation;
  assert.equal(posts, 2);
  f.controller.suspend();
});

test("selection changes invalidate old plans and late responses without executing", async () => {
  const pending = deferred(), f = fixture({ post: () => pending.promise });
  f.controller.select(stageId);
  const planning = f.controller.plan(); await tick();
  f.controller.select(catalog[1].id);
  pending.resolve(planFixture()); await planning;
  assert.equal(f.controller.getSnapshot().stageId, catalog[1].id);
  assert.equal(f.controller.getSnapshot().plan, null);
  await f.controller.confirm();
  assert.equal(f.controller.getSnapshot().job, null);
});

test("source suspension or disabled source during a delayed flush prevents sending any call", async () => {
  for (const suspend of [true, false]) {
    const pending = deferred();
    let enabled = true, posts = 0;
    const f = fixture({ beforeRequest: () => pending.promise, enabled: () => enabled, post: async () => { posts++; return planFixture(); } });
    f.controller.select(stageId);
    const planning = f.controller.plan(); await tick();
    if (suspend) { f.controller.suspend(); f.controller.resume(); } else enabled = false;
    pending.resolve(); await planning;
    assert.equal(posts, 0);
    assert.equal(f.controller.getSnapshot().plan, null);
  }
});

test("native execution capability revoked after planning cannot be confirmed", async () => {
  let entries = catalog;
  const f = fixture({ catalog: () => entries });
  f.controller.select(stageId); await f.controller.plan();
  entries = catalog.map(entry => ({ ...entry, available: false }));
  await f.controller.confirm();
  assert.equal(f.requests.length, 1);
  assert.match(f.controller.getSnapshot().error, /registered native/);
});

test("a pending confirmation flush cannot send after the source is hidden or replaced", async () => {
  const pending = deferred();
  let flushes = 0;
  const f = fixture({ beforeRequest: async () => { if (++flushes === 2) await pending.promise; } });
  f.controller.select(stageId); await f.controller.plan();
  const committing = f.controller.confirm(); await tick();
  f.controller.suspend(); f.controller.resume();
  pending.resolve(); await committing;
  assert.equal(f.requests.length, 1);
  assert.equal(f.controller.getSnapshot().job, null);
  assert.equal(f.controller.getSnapshot().uncertain, false);
});

test("changing stage cancels an old terminal status read without leaving the row locked", async () => {
  const pending = deferred();
  const f = fixture({
    post: async (url, body) => url.endsWith("/plan") ? planFixture(body) : jobFixture(body, "done"),
    get: () => pending.promise,
  });
  f.controller.select(stageId); await f.controller.plan(); await f.controller.confirm();
  const reading = f.controller.refreshStatus();
  f.controller.select(catalog[1].id);
  pending.resolve(jobFixture()); await reading;
  assert.equal(f.controller.getSnapshot().reading, false);
  assert.equal(f.controller.getSnapshot().job.state, "done");
  assert.equal(f.controller.getSnapshot().job.request.stageId, stageId);
  await f.controller.plan();
  assert.equal(f.controller.getSnapshot().plan.stageId, catalog[1].id);
});

test("a late job status response after a source change cannot refresh the new manifest", async () => {
  const pending = deferred(), f = fixture({ get: () => pending.promise });
  f.controller.select(stageId); await f.controller.plan(); await f.controller.confirm();
  const reading = f.controller.refreshStatus(); await tick();
  f.controller.suspend();
  pending.resolve(jobFixture(request, "done")); await reading; await tick();
  assert.equal(f.completions.length, 0);
  assert.equal(f.controller.getSnapshot().job.state, "running");
  assert.equal(f.timers.size, 0);
});

test("409 stale confirmation clears review and never automatically replans or reruns", async () => {
  let commits = 0;
  const f = fixture({ post: async (url, body) => {
    if (url.endsWith("/plan")) return planFixture(body);
    commits++; throw Object.assign(new Error("The plan changed; review it again."), { status: 409 });
  } });
  f.controller.select(stageId); await f.controller.plan(); await f.controller.confirm(); await f.controller.confirm();
  assert.equal(commits, 1);
  assert.equal(f.controller.getSnapshot().plan, null);
  assert.equal(f.controller.getSnapshot().uncertain, false);
  assert.match(f.controller.getSnapshot().error, /plan changed/);
});

test("an ambiguous commit without a job receipt locks out duplicate execution", async () => {
  let posts = 0;
  const f = fixture({ post: async (url, body) => {
    posts++;
    if (url.endsWith("/plan")) return planFixture(body);
    throw new Error("Connection lost");
  } });
  f.controller.select(stageId); await f.controller.plan(); await f.controller.confirm();
  assert.equal(f.controller.getSnapshot().uncertain, true);
  f.controller.select(catalog[1].id); await f.controller.plan(); await f.controller.confirm();
  assert.equal(posts, 2);
});

test("job polling binds exact job, source and actual frame but workspace remains provenance", async () => {
  assert.equal(parseRowCallJob({ ...jobFixture(), workspaceId: "other-workspace" }, request).id, jobId);
  for (const patch of [{ id: "../escape" }, { id: "b".repeat(32) }, { targetFrameId: "display-row" },
    { sequenceId: "data/curated/other" }, { composite: catalog[1].id }]) {
    assert.throws(() => parseRowCallJob({ ...jobFixture(), ...patch }, request, jobId));
  }
  const f = fixture();
  f.controller.select(stageId); await f.controller.plan(); await f.controller.confirm();
  assert.equal(f.timers.size, 1);
  f.timer()(); await tick();
  assert.equal(f.requests.at(-1).method, "GET");
  assert.match(f.requests.at(-1).url, new RegExp(`/direct-calls/${jobId}\\?workspaceId=arc3_random_player$`));
  assert.equal(f.completions.length, 1);
  await f.controller.refreshStatus(); await tick();
  assert.equal(f.completions.length, 1);
  assert.equal(f.timers.size, 0);
});

test("dequeued timer after hidden/source suspension performs no status read or execution", async () => {
  const f = fixture();
  f.controller.select(stageId); await f.controller.plan(); await f.controller.confirm();
  const callback = f.timer();
  f.controller.suspend(); f.controller.resume();
  callback(); await tick();
  assert.equal(f.requests.length, 2);
  assert.equal(f.timers.size, 0);
});

test("status failure stops polling; explicit refresh retries GET only", async () => {
  let reads = 0;
  const f = fixture({ get: async () => { if (++reads === 1) throw new Error("offline"); return jobFixture(request, "interrupted"); } });
  f.controller.select(stageId); await f.controller.plan(); await f.controller.confirm();
  f.timer()(); await tick();
  assert.equal(f.timers.size, 0);
  assert.match(f.controller.getSnapshot().statusError, /Refresh status/);
  await f.controller.refreshStatus();
  assert.equal(reads, 2);
  assert.equal(f.controller.getSnapshot().job.state, "interrupted");
  assert.equal(f.requests.length, 2);
  assert.equal(f.completions.length, 0);
});

test("Stop sends only the known row job ID, never pooler controls", async () => {
  const f = fixture();
  f.controller.select(stageId); await f.controller.plan(); await f.controller.confirm();
  await f.controller.stop(); await f.controller.stop();
  const stops = f.requests.filter(entry => entry.url.endsWith("/jobs/cancel"));
  assert.equal(stops.length, 1);
  assert.deepEqual(stops[0].body, { workspaceId: context.workspaceId, jobId });
  assert.equal(f.controller.getSnapshot().job.cancelling, true);
  f.controller.suspend();
});

test("NDJSON progress retains the commit lock and waits for the real memoryRequest final RAM snapshot", async () => {
  const memorySource = readFileSync(new URL("../../../../apps/workbench/src/components/MemorySession.ts", import.meta.url), "utf8");
  const { memoryRequest } = await import(`data:text/javascript,${encodeURIComponent(stripTypeScriptTypes(memorySource.replace(/^import .*;\r?\n/gm, "")))}`);
  const originalFetch = globalThis.fetch, bodies = [];
  let stream;
  globalThis.fetch = async (url, init) => {
    const body = JSON.parse(init.body); bodies.push(body);
    if (url.endsWith("/plan")) return new Response(JSON.stringify(planFixture(body)));
    return new Response(new ReadableStream({ start(controller) {
      stream = controller;
      controller.enqueue(new TextEncoder().encode(JSON.stringify({ progress: jobFixture(body) }) + "\n"));
    } }), { headers: { "Content-Type": "application/x-ndjson" } });
  };
  const f = fixture({ post: memoryRequest });
  try {
    f.controller.select(stageId); await f.controller.plan();
    const committing = f.controller.confirm();
    await tick();
    assert.equal(f.controller.getSnapshot().busy, "committing");
    assert.equal(f.controller.getSnapshot().job.id, jobId);
    await f.controller.stop();
    assert.equal(f.controller.getSnapshot().job.cancelling, true);
    assert.equal(f.controller.getSnapshot().busy, "committing");
    await f.controller.refreshStatus(); await tick();
    assert.equal(f.controller.getSnapshot().job.state, "done");
    assert.equal(f.completions.length, 0);
    await f.controller.confirm();
    assert.equal(bodies.length, 2);
    stream.enqueue(new TextEncoder().encode(JSON.stringify({ ...jobFixture(request, "done"), memorySnapshot: "browser-only-snapshot" }) + "\n"));
    stream.close();
    await committing; await tick();
    assert.equal(f.completions.length, 1);
    assert.equal(JSON.stringify(f.controller.getSnapshot()).includes("browser-only-snapshot"), false);
    await f.controller.plan();
    assert.equal(bodies.at(-1).memorySnapshot, "browser-only-snapshot");
    assert.equal(bodies[0].memorySessionId, bodies.at(-1).memorySessionId);
  } finally { f.controller.suspend(); globalThis.fetch = originalFetch; }
});

test("interrupted progress stream preserves the error and never reports a completed RAM receipt", async () => {
  const pending = deferred();
  const f = fixture({ post: async (url, body, signal, progress) => {
    if (url.endsWith("/plan")) return planFixture(body);
    progress(jobFixture(body));
    return pending.promise;
  } });
  f.controller.select(stageId); await f.controller.plan();
  const committing = f.controller.confirm(); await tick();
  await f.controller.refreshStatus();
  pending.reject(new Error("No final browser snapshot"));
  await committing; await tick();
  assert.equal(f.completions.length, 0);
  assert.match(f.controller.getSnapshot().error, /No final browser snapshot/);
});

test("the row control stays memory-aware and propagates no row toggle or game execution events", () => {
  const component = readFileSync(new URL("./RecognitionRowStageCall.tsx", import.meta.url), "utf8");
  assert.match(component, /memoryRequest\(url, body, signal, progress, readOnly\)/);
  assert.match(component, /onClick=\{event => event\.stopPropagation\(\)\}/);
  assert.match(component, /onKeyDown=\{event => event\.stopPropagation\(\)\}/);
  assert.doesNotMatch(component + source, /localStorage|sessionStorage|indexedDB|runUnitTransformSteps|callDirect\(|firstN:|moves:|\/arc3\//);
});
