import assert from "node:assert/strict";
import test from "node:test";
import { readFileSync } from "node:fs";
import {
  decodeSpotlightState, loadSpotlightFrame, loadSpotlightScript, MAX_SPOTLIGHT_PIXELS,
  parseSpotlightFrame, parseSpotlightRun, parseSpotlightScript, spotlightFrameResultUrl, spotlightNativeFrameUrl,
  spotlightReceiptLabel, SpotlightRunClient, parseSpotlightValidation, validateSpotlightFrame, canStepSpotlight,
} from "./SpotlightDemoModel.ts";

const workspace = "arc3_random_player";
const sequence = "recordings/events_tests/spotlight_scene_train_a";
const runId = "01234567-89ab-cdef-0123-456789abcdef";
const checkpoint = "c".repeat(64);
const memoryRefs = [`data/recordings/events_tests/spotlight_scene_train_a/memory_level_0_stm/observation.metta#${checkpoint}`];
const counts = { knownPixels: 1, unknownPixels: 1, newKnownPixels: 1, complete: false };
const emptyScore = { outcome: "inconclusive", passed: 0, failed: 0, inconclusive: 0, unsupported: 0, total: 0 };
function evidence(index = 0) {
  return { visualSequenceId: sequence, frameId: String(index), sourceHash: "a".repeat(64), atSeconds: index * 0.25,
    nativeCheckpointUid: checkpoint, memoryRefs, frameResultRef: `data/runtime/executions/recording-tests/${runId}/frames/000-${String(index).padStart(6, "0")}.json`,
    observed: [{ kind: "visibility_union", ...counts }] };
}
function run(processed = 0, revision = 1) {
  return { schemaVersion: 1, id: runId, testId: "spotlight_scene", observer: "spotlight",
    mode: "step", memory: { mode: "native_stm", confirmed: true }, learn: false, scope: "selected_recording",
    status: "ready", outcome: "not_scored", revision,
    recordings: [{ visualSequenceId: sequence, frameCount: 35, score: null }],
    progress: { processedFrames: processed, totalFrames: 35, recordingIndex: 0, frameIndex: processed ? processed - 1 : null },
    evidence: Array.from({ length: processed }, (_, index) => evidence(index)), score: emptyScore, limitations: [] };
}
function frame() {
  return { schemaVersion: 1, status: "available", readOnly: true, runId, runRevision: 1, testId: "spotlight_scene",
    visualSequenceId: sequence, observer: "spotlight", inferenceFrozen: true, frameId: "0", frameOrder: 0,
    source: { visualSequenceId: sequence, imageHash: "a".repeat(64), receipt: { action: null, data: {}, atSeconds: 0 } },
    rememberedScene: { width: 2, height: 1, rgbaHex: "000000ff00000000", encoding: "rgba8_hex",
      authority: "observed_pixel_union_not_hidden_scene", nativeCheckpointUid: checkpoint, pixelHash: "d".repeat(64) },
    coverage: counts,
    memory: { nativeCheckpointUid: checkpoint, previousCheckpointUid: null, writeRefs: memoryRefs,
      readCutoffExclusive: 0, readScope: "earlier_recording_level_stm", readReceipts: [] } };
}
const state = () => ({ size: [frame().rememberedScene.width, frame().rememberedScene.height], rgbaHex: frame().rememberedScene.rgbaHex });
const receiptEvidence = () => parseSpotlightRun(run(1), sequence).evidence[0];
const deferred = () => { let resolve; const promise = new Promise(done => { resolve = done; }); return { promise, resolve }; };

test("fog execution is opt-in, single-sequence, step-mode, revision-bound and never changes preferences", async () => {
  const calls = [];
  const client = new SpotlightRunClient(workspace, sequence, async (url, init) => {
    calls.push({ url, init });
    return Response.json(url.endsWith("/step") ? run(1, 3) : url.endsWith("/stop") ? { ...run(1, 4), status: "stopped" } : run());
  });
  assert.equal(calls.length, 0);
  await assert.rejects(client.start(false), /confirmation/);
  assert.equal(calls.length, 0);
  await client.start(true);
  assert.equal(calls[0].url, "/workbench/recognition/recording-tests/spotlight_scene/runs");
  assert.deepEqual(JSON.parse(calls[0].init.body), { workspaceId: workspace, visualSequenceId: sequence,
    mode: "step", memory: { mode: "native_stm", confirmed: true }, learn: false });
  await assert.rejects(client.start(true), /Stop or finish/);
  await client.step();
  assert.equal(calls[1].url, `/workbench/recognition/recording-tests/runs/${runId}/step`);
  assert.deepEqual(JSON.parse(calls[1].init.body), { workspaceId: workspace, expectedRevision: 1 });
  await client.stop();
  assert.equal(client.run.status, "stopped");
  assert.ok(calls.every(call => call.init.redirect === "error" && call.init.cache === "no-store"));
  assert.doesNotMatch(calls.map(call => call.url).join("\n"), /preferences|selection|\/arc3\/|candidates|promote/);
});

test("run identity and progress cannot substitute another sequence, full test, mode, observer or stale revision", async () => {
  assert.equal(parseSpotlightRun(run(1), sequence).progress.processedFrames, 1);
  for (const bad of [
    { ...run(), id: "../private" }, { ...run(), mode: "run" }, { ...run(), learn: true },
    { ...run(), scope: "full_test" }, { ...run(), observer: "core" },
    { ...run(), memory: { mode: "native_stm", confirmed: false } },
    { ...run(), recordings: [{ visualSequenceId: "recordings/events_tests/other", frameCount: 35 }] },
    { ...run(1), evidence: [] }, { ...run(1), progress: { ...run(1).progress, frameIndex: 1 } },
    { ...run(1), status: "completed" }, { ...run(1), revision: 0.5 },
    { ...run(2), evidence: [evidence(), evidence()] },
  ]) assert.throws(() => parseSpotlightRun(bad, sequence));
  let response = run(0, 5);
  const client = new SpotlightRunClient(workspace, sequence, async () => Response.json(response));
  await client.start(true);
  response = run(1, 4);
  await assert.rejects(client.step(), /stale run revision/);
  assert.equal(client.needsRefresh, true);
  assert.equal(client.run.revision, 5);
});

test("only exact current-run frame receipts are fetched; sibling runs, grading/oracles and traversal are rejected", async () => {
  const parsed = parseSpotlightRun(run(1), sequence);
  const item = parsed.evidence[0];
  const safe = new URL(spotlightFrameResultUrl(workspace, runId, item), "http://local");
  assert.equal(safe.pathname, `/workbench/workspaces/${workspace}/asset`);
  assert.equal(safe.searchParams.get("path"), item.frameResultRef);
  for (const path of [
    item.frameResultRef.replace(runId, "ffffffff-ffff-ffff-ffff-ffffffffffff"),
    item.frameResultRef.replace("/frames/", "/grading/"),
    item.frameResultRef.replace("000-000000", "000-000001"),
    `data/runtime/executions/recording-tests/${runId}/frames/../oracle.json`,
    `data/runtime/executions/recording-tests/${runId}/frames/%2e%2e/000-000000.json`,
    "https://example.com/oracle.json", "data/recordings/events_tests/spotlight_scene_train_a/evaluation.json",
  ]) assert.throws(() => spotlightFrameResultUrl(workspace, runId, { ...item, frameResultRef: path }));
  const calls = [];
  const loaded = await loadSpotlightFrame(workspace, parsed, item, undefined, async (url, init) => {
    calls.push({ url, init }); return Response.json(frame());
  });
  assert.equal(loaded.width, 2);
  assert.equal(calls.length, 1);
  assert.equal(calls[0].init.method, "GET");
  const native = new URL(calls[0].url, "http://local");
  assert.equal(native.pathname, `/workbench/recognition/recording-tests/runs/${runId}/frames/0`);
  assert.equal(native.searchParams.get("workspaceId"), workspace);
  assert.equal(native.searchParams.get("visualSequenceId"), sequence);
  assert.throws(() => spotlightNativeFrameUrl(workspace, parsed, { ...item, frameId: "1" }), /frame|prefix/);
  assert.throws(() => spotlightNativeFrameUrl(workspace, parsed, { ...item, nativeCheckpointUid: "foreign" }), /prefix/);
});

test("native RGBA preserves known black versus unknown and never reveals RGB hidden behind alpha", () => {
  const output = decodeSpotlightState(state(), counts);
  assert.deepEqual([...output.rgba], [0, 0, 0, 255, 0, 0, 0, 0]);
  assert.deepEqual([...output.unknownMask], [0, 0, 0, 255, 255, 255, 255, 255]);
  for (const state of [
    { size: [2, 1], rgbaHex: "000000ff00" },
    { size: [2, 1], rgbaHex: "000000ffff000000" },
    { size: [2, 1], rgbaHex: "000000ff00000080" },
    { size: [2, 1], rgbaHex: "000000ff000000zz" },
    { size: [-1, 1], rgbaHex: "" }, { size: [0, 1], rgbaHex: "" },
    { size: [MAX_SPOTLIGHT_PIXELS, 2], rgbaHex: "" },
  ]) assert.throws(() => decodeSpotlightState(state, counts));
  assert.throws(() => decodeSpotlightState(state(), { ...counts, knownPixels: 2 }), /disagree/);
});

test("frozen native checkpoint, source, acquisition time and memory refs must match before rendering", () => {
  const item = receiptEvidence();
  const parsed = parseSpotlightRun(run(1), sequence);
  assert.equal(parseSpotlightFrame(frame(), item, parsed).nativeCheckpointUid, checkpoint);
  for (const bad of [
    { ...frame(), inferenceFrozen: false }, { ...frame(), frameId: "1" },
    { ...frame(), runId: "ffffffff-ffff-ffff-ffff-ffffffffffff" }, { ...frame(), readOnly: false },
    { ...frame(), visualSequenceId: "recordings/events_tests/other" },
    { ...frame(), source: { ...frame().source, imageHash: "b".repeat(64) } },
    { ...frame(), source: { ...frame().source, visualSequenceId: "recordings/events_tests/other" } },
    { ...frame(), source: { ...frame().source, receipt: { action: null, data: {}, atSeconds: 1 } } },
    { ...frame(), memory: { ...frame().memory, nativeCheckpointUid: "another" } },
    { ...frame(), memory: { ...frame().memory, writeRefs: [] } },
    { ...frame(), memory: { ...frame().memory, readCutoffExclusive: 1 } },
    { ...frame(), memory: { ...frame().memory, previousCheckpointUid: "future" } },
    { ...frame(), rememberedScene: undefined },
    { ...frame(), rememberedScene: { ...frame().rememberedScene, authority: "teacher" } },
    { ...frame(), coverage: { ...counts, newKnownPixels: 0 } },
  ]) assert.throws(() => parseSpotlightFrame(bad, item, parsed));
  assert.throws(() => parseSpotlightFrame(frame(), { ...item, visibility: null }, parsed), /unavailable/);
});

test("native reports read only the exact earlier checkpoint, never future or foreign STM", () => {
  const parsed = parseSpotlightRun(run(2), sequence);
  const item = parsed.evidence[1];
  const response = { ...frame(), frameId: "1", frameOrder: 1,
    source: { ...frame().source, receipt: { action: "RIGHT", data: {}, atSeconds: 0.25 } },
    memory: { ...frame().memory, previousCheckpointUid: checkpoint, readCutoffExclusive: 1,
      readReceipts: [{ entryUid: checkpoint, frameId: "0", frameOrder: 0, memoryRef: memoryRefs[0] }] } };
  assert.deepEqual(parseSpotlightFrame(response, item, parsed).readRefs, memoryRefs);
  for (const read of [
    { ...response.memory.readReceipts[0], frameId: "1" },
    { ...response.memory.readReceipts[0], frameOrder: 1 },
    { ...response.memory.readReceipts[0], entryUid: "foreign" },
    { ...response.memory.readReceipts[0], memoryRef: memoryRefs[0].replace(checkpoint, "foreign") },
  ]) assert.throws(() => parseSpotlightFrame({ ...response, memory: { ...response.memory, readReceipts: [read] } }, item, parsed));
  assert.throws(() => parseSpotlightFrame({ ...response, memory: { ...response.memory, readReceipts: [] } }, item, parsed));
});

test("historical raster inspection names its producer without inventing receipts or enabling stale steps", () => {
  const parsed = parseSpotlightRun(run(1), sequence), item = parsed.evidence[0];
  const response = { ...frame(), currentImplementationMatches: false, inspectionMode: "frozen_checkpoint",
    executionEligibility: "not_checked_by_read_only_inspection",
    producingImplementation: { versions: { version: "recording-test-execution-v1" } },
    memory: { ...frame().memory, readReceiptStatus: "not_recorded_by_producer", nativeReadCutoffRecorded: false } };
  const historical = parseSpotlightFrame(response, item, parsed);
  assert.equal(historical.producingVersion, "recording-test-execution-v1");
  assert.equal(historical.readReceiptsRecorded, false);
  assert.equal(canStepSpotlight(parsed, historical), false);
  const historicalAssertion = parseSpotlightValidation({ ...assertion(),
    currentImplementationMatches: response.currentImplementationMatches, inspectionMode: response.inspectionMode,
    executionEligibility: response.executionEligibility, producingImplementation: response.producingImplementation,
  }, parsed, item, null);
  assert.equal(canStepSpotlight(parsed, null, historicalAssertion), false);
  assert.equal(canStepSpotlight(parsed, parseSpotlightFrame(frame(), item, parsed)), true);
  assert.throws(() => parseSpotlightFrame({ ...response, producingImplementation: undefined }, item, parsed), /version/);
  assert.throws(() => parseSpotlightFrame({ ...response,
    producingImplementation: { versions: { version: "recording-test-execution-v2" } } }, item, parsed), /receipts/);
});

function assertion() {
  return { action: "VALIDATE_MUST_BE_KNOWN", status: "completed", outcome: "failed", assessment: "incomplete",
    runId, runRevision: 1, frameId: "0", visualSequenceId: sequence, sourceHash: "a".repeat(64),
    nativeCheckpointUid: checkpoint, nativeReadRef: memoryRefs[0], nativeRgbaHash: "d".repeat(64),
    readOnly: true, runModified: false, memoryModified: false, observerExecuted: false, validationStored: false,
    readScope: { throughFrameInclusive: 0, sourceFrameCount: 1, nativeStorage: "frozen_frame_checkpoint",
      recordingStmRead: false, futureFramesRead: false },
    complete: false, totalPixels: 2, knownPixels: 1, unknownPixels: 1, violations: { unknown_required_pixel: 1 } };
}

test("explicit knowledge assertion sends only immutable bindings, never pixels or a gameplay step", async () => {
  const parsed = parseSpotlightRun(run(1), sequence), item = parsed.evidence[0];
  const native = parseSpotlightFrame(frame(), item, parsed), calls = [];
  const result = await validateSpotlightFrame(workspace, parsed, item, native, undefined, async (url, init) => {
    calls.push({ url, init }); return Response.json(assertion());
  });
  assert.equal(result.outcome, "failed");
  assert.equal(result.assessment, "incomplete");
  assert.equal(calls[0].url, `/workbench/recognition/recording-tests/runs/${runId}/frames/0/validate`);
  assert.equal(calls[0].init.method, "POST");
  assert.deepEqual(JSON.parse(calls[0].init.body), { workspaceId: workspace, visualSequenceId: sequence,
    action: "VALIDATE_MUST_BE_KNOWN", expectedRevision: 1, expectedSourceHash: item.sourceHash,
    expectedNativeCheckpointUid: checkpoint });
  assert.equal(parsed.progress.processedFrames, 1);
});

test("an all-known fabricated claim is still failed; only fully justified memory passes", () => {
  const parsed = parseSpotlightRun(run(1), sequence), item = parsed.evidence[0];
  const native = parseSpotlightFrame(frame(), item, parsed);
  const fullNative = { ...native, visibility: { ...counts, knownPixels: 2, unknownPixels: 0, complete: true } };
  const complete = { ...assertion(), complete: true, knownPixels: 2, unknownPixels: 0 };
  assert.equal(parseSpotlightValidation({ ...complete, assessment: "invalid_claim",
    violations: { known_without_observation: 1 } }, parsed, item, fullNative).outcome, "failed");
  assert.equal(parseSpotlightValidation({ ...complete, outcome: "passed", assessment: "complete_and_justified",
    violations: { unknown_required_pixel: 0 } }, parsed, item, fullNative).outcome, "passed");
  assert.throws(() => parseSpotlightValidation({ ...complete, outcome: "passed", assessment: "complete_and_justified",
    violations: { unknown_required_pixel: 0 } }, parsed, item, native), /displayed native raster/);
  const unsupported = { ...assertion(), assessment: "unsupported_claim",
    violations: { unsupported_native_or_observation_schema: 1 } };
  assert.equal(parseSpotlightValidation(unsupported, parsed, item, null).knownPixels, null);
  for (const bad of [
    { ...assertion(), outcome: "passed" },
    { ...assertion(), runRevision: 2 }, { ...assertion(), frameId: "1" },
    { ...assertion(), nativeCheckpointUid: "e".repeat(64) }, { ...assertion(), nativeRgbaHash: "e".repeat(64) },
    { ...assertion(), memoryModified: true }, { ...assertion(), observerExecuted: true },
    { ...assertion(), validationStored: true }, { ...assertion(), runModified: true },
    { ...assertion(), readScope: { ...assertion().readScope, futureFramesRead: true } },
    { ...assertion(), readScope: { ...assertion().readScope, recordingStmRead: true } },
  ]) assert.throws(() => parseSpotlightValidation(bad, parsed, item, native));
});

test("recorded movement and click scripts retain identical positions without inferring an action from pixels", async () => {
  const script = action => ({ kind: "arc3_play_recording", moves: [
    { index: 0, directory: `data/${sequence}/0`, action: null, data: {}, at_seconds: 0 },
    { index: 1, directory: `data/${sequence}/1`, action, data: { x: 8, y: 0 }, at_seconds: 0.25 },
    { index: 2, directory: `data/${sequence}/2`, action, data: { x: 0, y: 8 }, at_seconds: 0.5 },
  ] });
  const move = parseSpotlightScript(script("MOVE_POINTER"), sequence);
  const click = parseSpotlightScript(script("CLICK"), sequence);
  assert.deepEqual(move.map(item => item.data), click.map(item => item.data));
  assert.equal(spotlightReceiptLabel(move[2]), "MOVE_POINTER (x=0, y=8)");
  assert.equal(spotlightReceiptLabel(click[2]), "CLICK (x=0, y=8)");
  assert.match(spotlightReceiptLabel(move[0]), /No input/);
  assert.throws(() => parseSpotlightScript({ ...script("CLICK"), moves: [{ ...script("CLICK").moves[0], directory: "data/other/0" }] }, sequence));
  const calls = [];
  await loadSpotlightScript(workspace, sequence, undefined, async (url, init) => { calls.push({ url, init }); return Response.json(script("CLICK")); });
  assert.equal(calls.length, 1);
  assert.equal(new URL(calls[0].url, "http://local").searchParams.get("path"), `data/${sequence}/recording.json`);
  assert.equal(calls[0].init.method, "GET");
});

test("published fog action variants bind their actual test ID and retain directional script entries", async () => {
  for (const name of ["spotlight_action_modes_move", "spotlight_action_modes_click"]) {
    const selected = `recordings/events_tests/${name}`;
    const calls = [];
    const response = { ...run(), testId: "spotlight_action_modes", recordings: [{ visualSequenceId: selected, frameCount: 35, score: null }] };
    const client = new SpotlightRunClient(workspace, selected, async (url, init) => {
      calls.push({ url, init }); return Response.json(response);
    }, "spotlight_action_modes");
    await client.start(true);
    assert.equal(calls[0].url, "/workbench/recognition/recording-tests/spotlight_action_modes/runs");
    assert.equal(JSON.parse(calls[0].init.body).visualSequenceId, selected);
    assert.equal(client.run.testId, "spotlight_action_modes");
    assert.throws(() => parseSpotlightRun(response, selected), /does not match/);
  }
  const directional = parseSpotlightScript({ kind: "arc3_play_recording", moves: ["RIGHT", "LEFT", "DOWN"].map((action, index) => ({
    index, action, data: {}, at_seconds: index * 0.25, directory: `data/${sequence}/${index}`,
  })) }, sequence);
  assert.deepEqual(directional.map(spotlightReceiptLabel), ["RIGHT", "LEFT", "DOWN"]);
  const ui = readFileSync(new URL("./SpotlightDemo.tsx", import.meta.url), "utf8");
  assert.match(ui, /tests.find\(test => isSpotlightTestId\(test.id\)/);
  assert.match(ui, /recording.visualSequenceId === visualSequenceId/);
  assert.match(ui, /actions are not inferred from identical pixels/);
  const demo = readFileSync(new URL("./VisualSequenceDemoView.tsx", import.meta.url), "utf8");
  assert.match(demo, /onFrameIndexChange=\{spotlight.setFrameIndex\}/);
});

test("late completions cannot publish after cancellation and duplicate actions cannot create extra runs", async () => {
  const pending = deferred();
  let calls = 0;
  const client = new SpotlightRunClient(workspace, sequence, async () => {
    calls++; return calls === 1 ? { ok: true, status: 200, text: () => pending.promise } : Response.json(run());
  });
  const first = client.start(true);
  await assert.rejects(client.start(true), /pending/);
  assert.equal(calls, 1);
  client.cancel();
  pending.resolve(JSON.stringify(run(1)));
  assert.equal(await first, null);
  assert.equal(client.run, null);
  await client.start(true);
  assert.equal(client.run.progress.processedFrames, 0);
});

test("failed writes require read-only report reconciliation before another step, without an automatic retry", async () => {
  const calls = [];
  let failure = false;
  const client = new SpotlightRunClient(workspace, sequence, async (url, init) => {
    calls.push({ url, init });
    if (failure) throw new Error("Network interrupted");
    return Response.json(run(0, 4));
  });
  await client.start(true);
  failure = true;
  await assert.rejects(client.step(), /Network interrupted/);
  assert.equal(client.needsRefresh, true);
  await assert.rejects(client.step(), /Refresh/);
  assert.equal(calls.length, 2);
  failure = false;
  await client.refresh();
  assert.equal(calls[2].init.method, "GET");
  assert.equal(client.needsRefresh, false);
});

test("a native step cannot silently reuse a revision or skip/repeat a frame during autoplay", async () => {
  for (const next of [run(1, 1), run(0, 3), run(2, 3)]) {
    let count = 0;
    const client = new SpotlightRunClient(workspace, sequence, async () => Response.json(count++ ? next : run()));
    await client.start(true);
    await assert.rejects(client.step(), /exactly one new frame/);
    assert.equal(client.run.progress.processedFrames, 0);
    assert.equal(client.needsRefresh, true);
    await assert.rejects(client.step(), /Refresh/);
    assert.equal(count, 2, "no automatic or repeated write after an invalid step response");
  }
});

test("fog UI keeps opt-in controls, authoritative receipts, middle-board-only comparison and right-hand documentation", () => {
  const read = path => readFileSync(new URL(path, import.meta.url), "utf8");
  const ui = read("./SpotlightDemo.tsx");
  const demo = read("./VisualSequenceDemoView.tsx");
  assert.match(ui, /useState\(false\)/);
  assert.match(ui, /I confirm writing this test's observations/);
  assert.match(ui, /onClick=\{\(\) => void demo.perform\("start"\)\}/);
  assert.match(ui, /onClick=\{\(\) => void demo.perform\("step"\)\}/);
  assert.match(ui, /onClick=\{\(\) => void demo.perform\("validate"\)\}/);
  assert.match(ui, /context === validationContext.current/);
  assert.match(ui, /loadSpotlightFrame\(workspaceId, run, evidence, controller.signal\)/);
  assert.match(ui, /loaded.key === frameKey/);
  assert.match(ui, /actions are not inferred from identical pixels/);
  assert.match(ui, /Current native receipt/);
  assert.match(ui, /Next Step/);
  assert.match(ui, /demo.run.status === "completed"/);
  assert.match(demo, /controlsVisible && <SpotlightControls/);
  assert.match(demo, /comparison=\{spotlight.registered \? <SpotlightMemoryBoard/);
  assert.match(demo, /frameIndex=\{spotlight.frameIndex\} onFrameIndexChange=\{spotlight.setFrameIndex\}/);
  assert.doesNotMatch(ui + demo, /setInterval|requestAnimationFrame|Arc3PlayPage|B1B2|evaluation\.json|fullSceneRgb|ArrowRight|localStorage|sessionStorage/);
});
