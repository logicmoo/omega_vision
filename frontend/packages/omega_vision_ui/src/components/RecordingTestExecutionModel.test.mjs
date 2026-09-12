import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import { createRequire } from "node:module";
import { pathToFileURL } from "node:url";
import { runInNewContext } from "node:vm";
import test from "node:test";
import {
  canCreateRecordingExecution, canStepRecordingExecution, canStopRecordingExecution,
  createRecordingTestExecution, parseRecordingExecutionHistory, parseRecordingExecutionReport,
  parseRecordingExecutionRun, recordingExecutionContextError, recordingExecutionCreateBody,
} from "./RecordingTestExecutionModel.ts";

const clone = value => structuredClone(value);
const hash = "a".repeat(64), otherHash = "b".repeat(64);
const id = "11111111-1111-4111-8111-111111111111", otherId = "22222222-2222-4222-8222-222222222222";
const clip = "recordings/events_tests/occlusion_pole_train_a";
const recording = { visualSequenceId: clip, label: "Occlusion pole train A", partition: "train", frameCount: 2 };
const definition = { id: "occlusion_pole", title: "Occlusion pole", group: "Events", summary: "Earlier motion evidence",
  executionStatus: "not_run", recordings: [recording] };
const context = { workspaceId: "arc3_random_player", test: definition, visualSequenceId: clip };
const counts = outcome => ({ passed: outcome === "passed" ? 1 : 0, failed: outcome === "failed" ? 1 : 0,
  unsupported: outcome === "unsupported" ? 1 : 0, inconclusive: outcome === "inconclusive" ? 1 : 0,
  total: outcome ? 1 : 0, outcome: outcome || "inconclusive" });
function run({ processed = 0, status = "ready", outcome = "not_scored", mode = "step", runId = id, revision = processed * 2 + 1, ...rest } = {}) {
  return {
    schemaVersion: 1, id: runId, testId: definition.id, workspaceId: context.workspaceId,
    revision, mode, status, outcome, observer: "hidden_motion", learn: false,
    memory: { mode: "native_stm", confirmed: true }, scope: "selected_recording", createdAt: "2026-09-12T10:00:00Z",
    recordings: [{ ...recording, processedFrames: processed, status, outcome }],
    progress: { processedFrames: processed, totalFrames: 2, recordingIndex: 0, frameIndex: processed ? processed - 1 : null },
    evidence: Array.from({ length: processed }, (_, index) => ({
      visualSequenceId: clip, frameId: String(index), sourceHash: hash, atSeconds: index, decisionSeconds: index,
      nativeCheckpointUid: hash, memoryRefs: [`data/${clip}/memory_level_1_stm/observations.metta#${hash}`],
      frameResultRef: `data/runtime/executions/recording-tests/${runId}/frames/000-${String(index).padStart(6, "0")}.json`,
      observed: [{ kind: "measured_component", source: { order: index, imageHash: hash } }],
      predictions: [{ kind: "conditional_continuation", authoritative: false }],
      hypotheses: [{ kind: "conditional_occlusion", physicalCause: "not_established", authoritative: false }],
      coreStatus: "not_applicable", recognizedEventAssessment: null, coreEvidenceRefs: [],
    })),
    score: counts(outcome === "not_scored" ? "" : outcome), limitations: ["Physical cause is not established."], ...rest,
  };
}
function report(value) {
  const available = value.recordings[0].status === "completed";
  return { schemaVersion: 1, version: "recording-test-reports-v1", readOnly: true, run: clone(value),
    grading: [{ visualSequenceId: clip, status: available ? "available" : "pending",
      ...(available ? { gradingRef: `data/runtime/executions/recording-tests/${value.id}/grading/000.json`, gradingHash: hash,
        result: { ...counts(value.outcome), checks: [{ name: "Conditional motion model", outcome: value.outcome, evidenceRefs: [], detail: "Not proof of a hidden physical cause" }],
          inferenceFrozenBeforeOracleRead: true, oracleGradingIsNativeObservedMemory: false,
          gradingScope: "observed_visibility_and_conditional_motion_models", physicalCause: "not_established" } } : { result: null }),
    }] };
}
function harness(responder = () => run(), options = {}) {
  const calls = [], scheduled = [];
  const transport = async (url, init) => {
    calls.push({ url, init, body: init.body ? JSON.parse(init.body) : null });
    const value = await responder(calls.at(-1), calls.length);
    return value instanceof Response || value?.text ? value : Response.json(value);
  };
  const client = createRecordingTestExecution(context, { transport,
    schedule: task => { const item = { task, cancelled: false }; scheduled.push(item); return () => { item.cancelled = true; }; }, ...options });
  return { client, calls, scheduled };
}
const settle = () => new Promise(resolve => setImmediate(resolve));
const deferred = () => { let resolve; const promise = new Promise(done => { resolve = done; }); return { resolve, promise }; };
async function start(h, mode = "step") { h.client.confirm(true); await h.client.start(mode); }

test("construct, render preparation, visibility, selection and native confirmation never request or execute", async () => {
  const h = harness();
  assert.equal(canCreateRecordingExecution(h.client.getSnapshot()), false);
  await h.client.start("step"); await h.client.step(); await h.client.stop(); await h.client.refresh();
  h.client.setContext(context); h.client.setActive(false); h.client.setActive(true); h.client.confirm(true);
  assert.equal(h.calls.length, 0);
  assert.equal(canCreateRecordingExecution(h.client.getSnapshot()), true);
});

test("creation sends only exact selected membership and confirmed persistent native policy; no frame-zero execution", async () => {
  const h = harness();
  await start(h);
  assert.equal(h.calls.length, 1);
  assert.equal(h.calls[0].url, "/workbench/recognition/recording-tests/occlusion_pole/runs");
  assert.deepEqual(h.calls[0].body, { workspaceId: "arc3_random_player", visualSequenceId: clip, mode: "step",
    memory: { mode: "native_stm", confirmed: true }, learn: false });
  assert.equal(h.client.getSnapshot().run.progress.frameIndex, null);
  assert.equal(h.client.getSnapshot().run.progress.processedFrames, 0);
  assert.equal(h.scheduled.length, 0);
});

test("Step carries the latest revision, first executes frame zero, and never follows preview cursor", async () => {
  const h = harness(call => call.url.endsWith("/step") ? run({ processed: 1 }) : run());
  await start(h);
  await h.client.step();
  assert.deepEqual(h.calls[1].body, { workspaceId: context.workspaceId, expectedRevision: 1 });
  assert.equal(h.client.getSnapshot().run.progress.frameIndex, 0);
  assert.equal(h.client.getSnapshot().run.evidence[0].frameId, "0");
  h.client.setContext(context, "data/source/preview/frame-99.png");
  h.client.confirm(true);
  await h.client.step();
  assert.equal(h.calls.length, 2);
  assert.equal(h.client.getSnapshot().needsRefresh, true);
});

for (const bad of [
  { ...context, visualSequenceId: "recordings/events_tests/foreign" },
  { ...context, visualSequenceId: `data/${clip}` },
  { ...context, visualSequenceId: "curated/clip" },
  { ...context, workspaceId: "../outside" },
  { ...context, test: { ...definition, recordings: [] } },
  { ...context, test: { ...definition, recordings: [recording, recording] } },
]) test(`reject unsafe/missing/ambiguous registered membership ${JSON.stringify(bad)}`, () => {
  assert.ok(recordingExecutionContextError(bad));
  assert.throws(() => recordingExecutionCreateBody(bad, "step", true));
});

test("registered core, hidden-motion, portal and fog observer profiles share the generic public protocol", () => {
  for (const [testId, observer] of [["moved", "core"], ["occlusion_large_object", "hidden_motion"], ["teleporter", "hidden_motion_portal"], ["spotlight_scene", "spotlight"]]) {
    const bound = { ...context, test: { ...definition, id: testId } };
    assert.equal(parseRecordingExecutionRun(run({ testId, observer }), bound).observer, observer);
    assert.equal(recordingExecutionCreateBody(bound, "step", true).learn, false);
  }
});

test("source identities are shared across workspaces; workspace provenance is not a history ownership filter", () => {
  const other = { ...context, workspaceId: "other_workspace" };
  assert.equal(parseRecordingExecutionRun(run(), other).id, id);
  assert.equal(parseRecordingExecutionHistory({ runs: [run()], count: 1 }, other)[0].id, id);
});

for (const [label, mutate] of [
  ["UUID", value => { value.id = "../id"; }],
  ["test", value => { value.testId = "foreign"; }],
  ["full family", value => { value.scope = "full_test"; }],
  ["clip", value => { value.recordings[0].visualSequenceId = `${clip}_other`; }],
  ["revision", value => { value.revision = 0.5; }],
  ["memory", value => { value.memory.mode = "nowhere"; }],
  ["progress", value => { value.progress.frameIndex = 1; }],
  ["future frame", value => { value.evidence[0].frameId = "2"; }],
  ["source", value => { value.evidence[0].visualSequenceId = `${clip}_other`; }],
  ["native UID", value => { value.evidence[0].nativeCheckpointUid = ""; }],
  ["frame ref", value => { value.evidence[0].frameResultRef = "https://outside/secret"; }],
  ["unsafe refs", value => { value.evidence[0].memoryRefs = ["data/../secrets"]; }],
  ["hypotheses", value => { value.evidence[0].hypotheses = {}; }],
  ["fake pass", value => { value.score = { ...counts("unsupported"), outcome: "passed" }; }],
  ["premature completion", value => { value.status = "completed"; value.outcome = "passed"; value.score = counts("passed"); }],
]) test(`invalid public run rejects ${label}`, () => {
  const value = run({ processed: 1 }); mutate(value);
  assert.throws(() => parseRecordingExecutionRun(value, context));
});

test("saved history excludes foreign clips/full-family runs and never auto-selects any run", async () => {
  const foreign = run({ runId: otherId, recordings: [{ ...recording, visualSequenceId: `${clip}_other` }] });
  const full = run({ runId: "33333333-3333-4333-8333-333333333333", scope: "full_test" });
  const saved = run({ processed: 2, status: "completed", outcome: "unsupported" });
  const h = harness(call => call.url.endsWith("/report?workspaceId=arc3_random_player") ? report(saved)
    : call.url.includes(`/runs/${id}?`) ? saved : { runs: [foreign, full, saved], count: 3 });
  await h.client.refreshHistory();
  assert.deepEqual(h.client.getSnapshot().history.map(value => value.id), [id]);
  assert.equal(h.client.getSnapshot().run, null);
  await h.client.load(otherId);
  assert.equal(h.calls.length, 1);
  await h.client.load(id);
  assert.equal(h.client.getSnapshot().run.outcome, "unsupported");
  assert.equal(h.client.getSnapshot().report.grading[0].result.physicalCause, "not_established");
  assert.equal(h.client.getSnapshot().confirmed, false);
  assert.ok(h.calls.every(call => call.init.method === "GET" && !call.body && call.init.cache === "no-store" && call.init.redirect === "error"));
});

test("empty history and malformed history do not fabricate a latest run", async () => {
  const h = harness(() => ({ runs: [], count: 0 }));
  await h.client.refreshHistory();
  assert.deepEqual(h.client.getSnapshot().history, []);
  for (const value of [{}, { runs: [], count: 1 }, { runs: [run(), run()], count: 2 }])
    assert.throws(() => parseRecordingExecutionHistory(value, context));
});

test("frozen report binds revision, source, evaluator separation and conditional grading", () => {
  const saved = run({ processed: 2, status: "completed", outcome: "passed" });
  const value = report(saved);
  assert.equal(parseRecordingExecutionReport(value, context, saved).grading[0].result.physicalCause, "not_established");
  for (const mutate of [
    result => { result.run.id = otherId; },
    result => { result.run.revision++; },
    result => { result.grading[0].visualSequenceId = "foreign"; },
    result => { result.grading[0].result.oracleGradingIsNativeObservedMemory = true; },
    result => { result.grading[0].result.inferenceFrozenBeforeOracleRead = false; },
    result => { result.grading[0].gradingRef = "data/runtime/other.json"; },
    result => { result.grading[0].result.checks[0].outcome = "learned"; },
  ]) {
    const bad = clone(value); mutate(bad);
    assert.throws(() => parseRecordingExecutionReport(bad, context, saved));
  }
});

test("late post responses cannot replace frozen native/source evidence or roll back a revision", async () => {
  for (const kind of ["revision", "native", "hypothesis"]) {
    const h = harness(call => {
      if (!call.url.endsWith("/step")) return run({ processed: 1 });
      const next = run({ processed: 1, revision: kind === "revision" ? 0 : 5 });
      if (kind === "native") next.evidence[0].nativeCheckpointUid = otherHash;
      if (kind === "hypothesis") next.evidence[0].hypotheses[0].authoritative = true;
      return next;
    });
    await start(h); await h.client.step();
    assert.equal(h.client.getSnapshot().run.revision, 3);
    assert.equal(h.client.getSnapshot().needsRefresh, true);
    assert.match(h.client.getSnapshot().error, /frozen past-frame/);
  }
});

test("stale current implementation retains historical results and never allows Step or resume", async () => {
  const stale = run({ processed: 2, status: "stale", outcome: "inconclusive", storedStatus: "completed", storedOutcome: "passed",
    score: counts("passed"), error: "Producing implementation changed" });
  const h = harness(call => call.url.includes(`/runs/${id}?`) ? stale : { runs: [stale], count: 1 });
  await h.client.refreshHistory(); await h.client.load(id); h.client.confirm(true);
  assert.equal(h.client.getSnapshot().run.storedOutcome, "passed");
  assert.equal(canStepRecordingExecution(h.client.getSnapshot()), false);
  await h.client.step(); await h.client.stop();
  assert.ok(h.calls.every(call => call.init.method === "GET"));
  assert.equal(h.client.getSnapshot().report, null);
});

test("explicit Stop needs no renewed memory confirmation and targets only the bound run", async () => {
  const h = harness(call => call.url.endsWith("/stop") ? run({ status: "stopped", revision: 2 }) : run());
  await start(h); h.client.confirm(false); await h.client.stop();
  assert.equal(h.calls.length, 2);
  assert.deepEqual(h.calls[1].body, { workspaceId: "arc3_random_player" });
  assert.equal(canStepRecordingExecution(h.client.getSnapshot()), false);
  assert.equal(canStopRecordingExecution(h.client.getSnapshot()), false);
});

test("a failed status refresh cannot prevent stopping a known background run", async () => {
  const h = harness(call => call.url.endsWith("/stop")
    ? run({ mode: "run", status: "stopped", revision: 2 })
    : call.init.method === "GET" ? Promise.reject(new Error("Status unavailable")) : run({ mode: "run" }));
  await start(h, "run");
  await h.client.refresh();
  h.client.confirm(false);
  assert.equal(h.client.getSnapshot().needsRefresh, true);
  assert.equal(canStopRecordingExecution(h.client.getSnapshot()), true);
  await h.client.stop();
  assert.equal(h.calls.at(-1).url, `/workbench/recognition/recording-tests/runs/${id}/stop`);
  assert.deepEqual(h.calls.at(-1).body, { workspaceId: context.workspaceId });
  assert.equal(h.client.getSnapshot().run.status, "stopped");
});

test("learn-enabled history is inspectable but can never be stepped or approved by this runner", async () => {
  const saved = run({ learn: true });
  const h = harness(call => call.url.includes(`/runs/${id}?`) ? saved : { runs: [saved], count: 1 });
  await h.client.refreshHistory(); await h.client.load(id); h.client.confirm(true); await h.client.step();
  assert.equal(h.client.getSnapshot().run.learn, true);
  assert.ok(h.calls.every(call => call.init.method === "GET"));
});

test("synchronous double-clicks never create duplicate runs or concurrent Steps", async () => {
  const gate = deferred(), second = deferred();
  const h = harness(call => call.url.endsWith("/step") ? second.promise : gate.promise);
  h.client.confirm(true);
  const first = h.client.start("step"), duplicate = h.client.start("run");
  assert.equal(h.calls.length, 1); gate.resolve(run()); await Promise.all([first, duplicate]);
  const step = h.client.step(); await h.client.step(); await h.client.stop();
  assert.equal(h.calls.length, 2); second.resolve(run({ processed: 1 })); await step;
});

for (const change of ["workspace", "sequence", "preview", "hidden", "suspend", "epoch"]) {
  test(`ignore stale create response after ${change}, including delayed body decoding; no automatic Stop`, async () => {
    const body = deferred(); let epoch = 0;
    const h = harness(() => ({ ok: true, status: 200, text: () => body.promise }), { epoch: () => epoch });
    h.client.confirm(true); const pending = h.client.start("step");
    await settle();
    if (change === "workspace") h.client.setContext({ ...context, workspaceId: "another" });
    if (change === "sequence") h.client.setContext({ ...context, visualSequenceId: "recordings/events_tests/other" });
    if (change === "preview") h.client.setContext(context, "frame1");
    if (change === "hidden") h.client.setActive(false);
    if (change === "suspend") h.client.suspend();
    if (change === "epoch") epoch++;
    body.resolve(JSON.stringify(run())); await pending;
    assert.equal(h.client.getSnapshot().run, null);
    assert.equal(h.calls.length, 1);
    assert.match(h.client.getSnapshot().notice, /unknown|late response|Source changed/i);
  });
}

test("gates recheck after synchronous UI notification before issuing any POST", async () => {
  const h = harness();
  h.client.subscribe(() => { if (h.client.getSnapshot().busy === "create") h.client.suspend(); });
  h.client.confirm(true); await h.client.start("step");
  assert.equal(h.calls.length, 0);
});

test("unknown creation requires explicit history reconciliation; no automatic replay", async () => {
  const h = harness(call => call.init.method === "POST" ? Promise.reject(new Error("Connection lost"))
    : call.url.includes(`/runs/${id}?`) ? run() : { runs: [run()], count: 1 });
  await start(h); await h.client.start("step");
  assert.equal(h.calls.length, 1);
  assert.equal(h.client.getSnapshot().unknownCreate, true);
  await h.client.refreshHistory();
  assert.equal(h.client.getSnapshot().run, null);
  await h.client.load(id);
  assert.equal(h.client.getSnapshot().unknownCreate, true);
  h.client.acknowledgeReconciledCreate(); h.client.confirm(true);
  assert.equal(h.client.getSnapshot().unknownCreate, false);
  assert.equal(canStepRecordingExecution(h.client.getSnapshot()), true);
});

test("unknown Step and actual API rejection both require explicit status reconciliation", async () => {
  for (const failure of [new Error("Network outcome unknown"), new Response(JSON.stringify({ detail: "Revision changed" }), { status: 409 })]) {
    let failed = false;
    const h = harness(call => {
      if (call.url.endsWith("/step")) { failed = true; if (failure instanceof Error) throw failure; return failure; }
      return run({ processed: failed ? 1 : 0 });
    });
    await start(h); await h.client.step();
    assert.equal(h.client.getSnapshot().needsRefresh, true);
    assert.match(h.client.getSnapshot().error, failure instanceof Error ? /Network/ : /HTTP 409: Revision changed/);
    await h.client.step(); assert.equal(h.calls.length, 2);
    await h.client.refresh();
    assert.equal(h.client.getSnapshot().run.progress.processedFrames, 1);
    assert.equal(h.calls.at(-1).init.method, "GET");
  }
});

test("rejected create exposes actual status/message without claiming an unknown accepted job", async () => {
  const h = harness(() => new Response(JSON.stringify({ detail: "Unsupported observer configuration" }), { status: 422 }));
  await start(h);
  assert.match(h.client.getSnapshot().error, /HTTP 422: Unsupported observer configuration/);
  assert.equal(h.client.getSnapshot().unknownCreate, false);
  assert.equal(h.scheduled.length, 0);
});

test("background jobs poll only GET while visible; completion loads actual grading and ceases polling", async () => {
  const completed = run({ processed: 2, mode: "run", status: "completed", outcome: "inconclusive" });
  const h = harness(call => call.init.method === "POST" ? run({ mode: "run" }) : call.url.includes("/report?") ? report(completed) : completed);
  await start(h, "run");
  assert.equal(h.calls[0].body.mode, "run");
  assert.equal(h.scheduled.length, 1);
  h.scheduled[0].task(); await settle();
  assert.equal(h.client.getSnapshot().run.status, "completed");
  assert.equal(h.client.getSnapshot().run.outcome, "inconclusive");
  assert.equal(h.client.getSnapshot().report.grading[0].result.outcome, "inconclusive");
  assert.equal(h.calls.filter(call => call.init.method === "POST").length, 1);
  assert.equal(h.scheduled.length, 1);
});

test("a failed read-only report keeps acknowledged completion, not an unknown start outcome", async () => {
  const completed = run({ processed: 2, mode: "run", status: "completed", outcome: "unsupported" });
  const h = harness(call => call.url.includes("/report?") ? new Response("Report unavailable", { status: 503 }) : completed);
  await start(h, "run");
  assert.equal(h.client.getSnapshot().run.id, id);
  assert.equal(h.client.getSnapshot().run.outcome, "unsupported");
  assert.equal(h.client.getSnapshot().unknownCreate, false);
  assert.match(h.client.getSnapshot().notice, /Run status was received/);
  assert.equal(h.client.getSnapshot().report, null);
  assert.equal(h.calls.filter(call => call.init.method === "POST").length, 1);
});

test("source changes while reading a frozen report discard it without an automatic execution or stop", async () => {
  const gate = deferred(), completed = run({ processed: 2, status: "completed", outcome: "passed" });
  const h = harness(call => call.url.includes("/report?") ? gate.promise : completed);
  const pending = start(h);
  await settle();
  h.client.setContext({ ...context, workspaceId: "changed" });
  gate.resolve(report(completed)); await pending;
  assert.equal(h.client.getSnapshot().run, null);
  assert.equal(h.client.getSnapshot().report, null);
  assert.equal(h.client.getSnapshot().unknownCreate, false);
  assert.match(h.client.getSnapshot().notice, /Previous run/);
  assert.equal(h.calls.length, 2);
});

test("poll failure stops retries and hiding stops monitoring, never the already-issued job", async () => {
  const h = harness(call => call.init.method === "POST" ? run({ mode: "run" }) : new Response("Service unavailable", { status: 503 }));
  await start(h, "run");
  h.scheduled[0].task(); await settle();
  assert.equal(h.client.getSnapshot().polling, false);
  assert.match(h.client.getSnapshot().error, /503: Service unavailable/);
  assert.equal(h.scheduled.length, 1);
  h.client.setActive(false); h.client.setActive(true);
  assert.equal(h.calls.length, 2);
  assert.equal(h.client.getSnapshot().run.id, id);
  assert.match(h.client.getSnapshot().notice, /continues; Stop/);
});

test("frame change during background GET cancels the read and cannot relabel frozen frame output", async () => {
  const gate = deferred();
  const h = harness(call => call.init.method === "POST" ? run({ mode: "run" }) : gate.promise);
  await start(h, "run"); h.scheduled[0].task(); await settle();
  h.client.setContext(context, "source-frame-1");
  gate.resolve(run({ processed: 1, mode: "run" })); await settle();
  assert.equal(h.client.getSnapshot().run.progress.processedFrames, 0);
  assert.equal(h.client.getSnapshot().polling, false);
  assert.equal(h.calls.filter(call => call.init.method === "POST").length, 1);
});

const source = name => readFileSync(new URL(name, import.meta.url), "utf8");
const require = createRequire(new URL("../../../../apps/workbench/package.json", import.meta.url));
const { transformWithOxc } = await import(pathToFileURL(require.resolve("vite")).href);
const compiled = new Map(await Promise.all(["./RecordingTests.tsx", "./RecordingTestExecution.tsx"].map(async name => [
  name, (await transformWithOxc(source(name).replace(/^import[\s\S]*?;\r?\n/gm, "").replace(/\bexport /g, ""),
    name, { jsx: { runtime: "classic" } })).code,
])));
const Runner = () => null;
function renderModule(name, states = [], mocks = {}) {
  let index = 0;
  const react = { useState: initial => [index < states.length ? states[index++] : typeof initial === "function" ? initial() : initial, () => {}],
    useEffect() {}, useLayoutEffect() {}, useId: () => "id", useRef: current => ({ current }),
    useSyncExternalStore: (_subscribe, snapshot) => snapshot() };
  react.createElement = (type, props, ...children) => ({ type, props: { ...props, children: children.length === 1 ? children[0] : children } });
  const bindings = { React: react, ...react, RecordingTestExecution: Runner,
    isSpotlightTestId: id => ["spotlight_scene", "spotlight_action_modes"].includes(id),
    ...Object.assign({}, ...Object.values(mocks)), console, document: { visibilityState: "visible" } };
  return runInNewContext(`${compiled.get(name)}\n({${name.slice(2, -4)}});`, bindings);
}
function nodes(node) {
  if (!node || typeof node !== "object") return [];
  if (Array.isArray(node)) return node.flatMap(nodes);
  return [node, ...nodes(node.props?.children)];
}
function runtimeTree(testDefinition, controlsVisible) {
  const module = renderModule("./RecordingTests.tsx", [false, [testDefinition], false, "", 0, "All", "", testDefinition.id], {
    "./RecordingTestsModel": { filterRecordingTests: values => values },
  });
  const wrapper = module.RecordingTests({ workspaceId: context.workspaceId, visualSequenceId: clip, controlsVisible, presentation: "runtime" });
  return wrapper.type(wrapper.props);
}
test("actual runtime rendering mounts generic non-fog execution from catalog with Add-controls visibility, without custom renderResults", () => {
  for (const enabled of [true, false]) {
    const rendered = nodes(runtimeTree(definition, enabled));
    const runners = rendered.filter(node => node.type === Runner);
    assert.equal(runners.length, 1);
    assert.equal(runners[0].props.test, definition);
    assert.equal(runners[0].props.visualSequenceId, clip);
    assert.equal(runners[0].props.controlsVisible, enabled);
  }
  for (const id of ["spotlight_scene", "spotlight_action_modes"])
    assert.equal(nodes(runtimeTree({ ...definition, id }, true)).filter(node => node.type === Runner).length, 0);
});

test("standalone preview/docs and native execution remain separate; right documentation cannot mount the runner", () => {
  const ui = source("./RecordingTests.tsx"), demo = source("./VisualSequenceDemoView.tsx");
  assert.match(ui, /showRecordingPreview && selected && <RecordingPreview/);
  assert.match(ui, /showRecordingPreview && selected && <RecordingTestExecution[\s\S]*?visualSequenceId=\{selected.visualSequenceId\}/);
  assert.match(ui, /<MarkdownDocument content=\{detail.documentation\}/);
  assert.match(ui, /showRecordingPreview=\{showRecordingPreview && !documentationOnly\}/);
  assert.match(ui, /Definition: \{test.executionStatus\} \(not saved-run status\)/);
  assert.match(ui, /onFrameChange=\{setPreviewFrameKey\}/);
  assert.match(demo, /<RecordingTests[\s\S]*?controlsVisible=\{controlsVisible\}[\s\S]*?previewFrameKey=\{String\(spotlight.frameIndex\)\}/);
  assert.doesNotMatch(demo, /renderTestResults && <RecordingTests|MarkdownDocument|presentation="documentation"/);
  assert.equal((demo.match(/<Arc3VisualSequencePlayer /g) ?? []).length, 1);
  assert.equal((demo.match(/<SpotlightControls /g) ?? []).length, 1);
  assert.match(demo, /comparison=\{spotlight.registered/);
  assert.match(source("./RecognitionDemosPage.tsx"), /<DemoCard/);
});

test("actual initial runner rendering disables every write and labels background/native effects separately from preview", () => {
  const h = harness();
  const module = renderModule("./RecordingTestExecution.tsx", [h.client], {
    "./RecordingTestExecutionModel": { canCreateRecordingExecution, canStepRecordingExecution, canStopRecordingExecution,
      createRecordingTestExecution, recordingExecutionContextError, recordingExecutionKey: () => "context" },
    "@app/components/MenuVisibilityBoundary": { useMenuSurfaceLifecycle: () => ({ paused: false, suspensionEpoch: 0 }) },
  });
  const tree = module.RecordingTestExecution({ ...context, controlsVisible: true });
  const buttons = nodes(tree).filter(node => node.type === "button");
  for (const label of ["Start step run", "Step", "Stop", "Run selected recording (background job)"])
    assert.equal(buttons.find(node => node.props.children === label).props.disabled, true);
  assert.equal(h.calls.length, 0);
  const ui = source("./RecordingTestExecution.tsx"), model = source("./RecordingTestExecutionModel.ts");
  for (const label of ["Predictions — not observed facts", "Conditional / competing hypotheses — not established causes", "Evaluator-only grading"])
    assert.ok(ui.includes(label));
  assert.match(ui, /useMenuSurfaceLifecycle/);
  assert.match(ui, /document.visibilityState !== "hidden"/);
  assert.match(ui, /client.suspend\(\)/);
  assert.doesNotMatch(model + ui, /memoryRequest|memorySnapshot|localStorage|sessionStorage|\/asset\?|\/approve|\/promot|firstN|hiddenPixels|teacherData|\/arc3\/|\.select\(/);
});
