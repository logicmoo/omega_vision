import assert from "node:assert/strict";
import test from "node:test";
import { readFileSync } from "node:fs";
import { PacedSequencePlayback, SequencePlaybackCoordinator } from "./VisualSequencePlayback.ts";

const settle = () => new Promise(resolve => setImmediate(resolve));
function clock() {
  let sequence = 0;
  const jobs = new Map();
  return {
    jobs,
    setTimeout(callback, delay) { const id = ++sequence; jobs.set(id, { callback, delay }); return id; },
    clearTimeout(id) { jobs.delete(id); },
    take() { const [id, job] = jobs.entries().next().value; jobs.delete(id); return job.callback; },
  };
}
function harness(extra = {}) {
  const timer = clock();
  const state = { allowed: true, ready: true, index: 0, total: 3, pace: 1000, epoch: 0, advances: 0, changes: [], errors: [] };
  const coordinator = extra.coordinator || new SequencePlaybackCoordinator();
  const playback = new PacedSequencePlayback({
    coordinator, channel: "frames", allowed: () => state.allowed, ready: () => state.ready,
    atEnd: () => state.index >= state.total - 1, paceMs: () => state.pace, suspensionEpoch: () => state.epoch,
    advance: () => { state.advances++; state.index++; state.ready = false; return true; },
    onPlayingChange: playing => state.changes.push(playing), onError: error => state.errors.push(error),
    ...extra,
  }, timer);
  return { timer, state, playback, coordinator };
}

test("preview playback is explicit and waits for each page/image before a full display interval", async () => {
  const { playback, state, timer } = harness();
  assert.equal(timer.jobs.size, 0);
  assert.equal(state.advances, 0);
  state.ready = false;
  assert.equal(playback.play(), true);
  playback.notify();
  assert.equal(timer.jobs.size, 0, "loading never creates a polling loop");
  state.ready = true;
  playback.notify();
  assert.equal([...timer.jobs.values()][0].delay, 1000);
  timer.take()();
  await settle();
  assert.equal(state.index, 1);
  assert.equal(timer.jobs.size, 0, "the next image has not loaded");
  state.ready = true;
  playback.notify();
  timer.take()();
  await settle();
  assert.equal(state.index, 2);
  assert.equal(playback.playing, false);
  state.ready = true;
  playback.notify();
  assert.equal(timer.jobs.size, 0, "end never restarts automatically");
  state.index = 0;
  assert.equal(playback.play(), true, "replay requires another explicit play");
});

test("a dequeued preview timer cannot advance after pause, including after a later explicit play", async () => {
  const { playback, state, timer } = harness();
  playback.play();
  const stale = timer.take();
  playback.pause();
  stale();
  await settle();
  assert.equal(state.advances, 0);
  playback.play();
  stale();
  await settle();
  assert.equal(state.advances, 0);
  timer.take()();
  await settle();
  assert.equal(state.advances, 1);
});

test("hidden controls, document visibility, source changes and Activity epochs prevent pending actions", async () => {
  for (const reason of ["controls", "document", "workspace", "source", "Activity round trip", "error"]) {
    const { playback, state, timer } = harness();
    playback.play();
    const pending = timer.take();
    if (reason === "Activity round trip") state.epoch++;
    else state.allowed = false;
    pending();
    await settle();
    assert.equal(state.advances, 0, reason);
    assert.equal(playback.playing, false, reason);
    state.allowed = true;
    playback.notify();
    assert.equal(timer.jobs.size, 0, `${reason} must not resume automatically`);
  }
});

test("speed changes replace the pending UI delay without executing the cancelled timer", async () => {
  const { playback, state, timer } = harness();
  playback.play();
  const old = timer.take();
  state.pace = 250;
  playback.notify(true);
  assert.equal([...timer.jobs.values()][0].delay, 250);
  old();
  await settle();
  assert.equal(state.advances, 0);
  timer.take()();
  await settle();
  assert.equal(state.advances, 1);
  for (const pace of [0, 99, 10001, NaN, Infinity]) {
    const invalid = harness();
    invalid.state.pace = pace;
    assert.equal(invalid.playback.play(), false);
    assert.equal(invalid.timer.jobs.size, 0);
  }
});

test("native autoplay awaits a step before scheduling again and pause lets only the issued step finish", async () => {
  let finish;
  const pending = new Promise(resolve => { finish = resolve; });
  let issued = 0;
  let completed = 0;
  const { playback, timer } = harness({ channel: "test", advance: async () => {
    issued++;
    await pending;
    completed++;
    return true;
  } });
  playback.play();
  timer.take()();
  await settle();
  playback.notify();
  assert.equal(issued, 1);
  assert.equal(timer.jobs.size, 0, "no overlapping native step");
  playback.pause();
  finish();
  await settle();
  assert.equal(completed, 1, "the already-issued step may complete");
  assert.equal(timer.jobs.size, 0);
  assert.equal(playback.playing, false);
});

test("native steps remain sequential and errors or terminal results never retry or restart", async () => {
  const success = harness({ channel: "test", advance: async () => true });
  success.playback.play();
  success.timer.take()();
  await settle();
  assert.equal(success.timer.jobs.size, 1);
  success.playback.pause();
  for (const advance of [async () => { throw new Error("stale revision"); }, async () => false]) {
    const current = harness({ channel: "test", advance });
    current.playback.play();
    current.timer.take()();
    await settle();
    assert.equal(current.playback.playing, false);
    assert.equal(current.timer.jobs.size, 0);
    current.playback.notify();
    assert.equal(current.timer.jobs.size, 0);
  }
});

test("preview and native playback cannot fight, and an issued native step keeps preview blocked after pause", async () => {
  const coordinator = new SequencePlaybackCoordinator();
  const preview = harness({ coordinator });
  const native = harness({ coordinator, channel: "test" });
  preview.playback.play();
  const oldPreview = preview.timer.take();
  native.playback.play();
  assert.equal(preview.playback.playing, false);
  oldPreview();
  await settle();
  assert.equal(preview.state.advances, 0);
  const firstHold = coordinator.hold("test");
  native.playback.pause();
  assert.equal(preview.playback.play(), false);
  const nextHold = coordinator.hold("test");
  coordinator.unhold("test", firstHold);
  assert.equal(preview.playback.play(), false, "a late request cannot release a newer step's hold");
  coordinator.unhold("test", nextHold);
  assert.equal(preview.playback.play(), true);
  coordinator.pauseAll();
  assert.equal(preview.playback.playing, false);
});

test("active UI gates both modes, waits for actual source/native readiness and preserves intrinsic raster bounds", () => {
  const read = path => readFileSync(new URL(path, import.meta.url), "utf8");
  const player = read("./Arc3VisualSequencePlayer.tsx");
  const native = read("./SpotlightDemo.tsx");
  const demo = read("./VisualSequenceDemoView.tsx");
  assert.match(player, /imageStatus.path === frame\?\.path && imageStatus.status === "ready"/);
  assert.match(player, /controlsVisible && !navigationDisabled/);
  assert.match(player, /document.visibilityState !== "hidden"/);
  assert.match(player, /document.removeEventListener\("visibilitychange", update\); playback.pause\(\)/);
  assert.match(player, /"Pause frames"/);
  assert.match(player, /"Replay frames"/);
  assert.match(player, /Frame speed/);
  assert.match(player, /<FullRasterViewport width=\{dimensions\?\.width \?\? null\}/);
  assert.match(player, /Full viewport: \{sourceSize.width\} × \{sourceSize.height\} px/);
  assert.match(native, /controlsVisible && registered && confirmed && Boolean\(run\)/);
  assert.match(native, /frame\?\.nativeCheckpointUid === run.evidence\[run.progress.processedFrames - 1\]\?\.nativeCheckpointUid/);
  assert.match(native, /await perform\("step", true\)/);
  assert.match(native, /if \(!automatic\) \{ playback.pause\(\); coordinator.pauseAll\(\); \}/);
  assert.match(native, /coordinator.hold\("test"\)/);
  assert.match(native, /coordinator.unhold\("test", hold\)/);
  assert.match(native, /"Pause test" : "Play test"/);
  assert.match(native, /<FullRasterViewport width=\{frame.width\} height=\{frame.height\}/);
  assert.match(native, /Full viewport: \{demo.frame.width\} × \{demo.frame.height\} px/);
  assert.match(demo, /navigationDisabled=\{spotlight.testPlaying \|\| Boolean\(spotlight.busy\)\}/);
  assert.match(demo, /if \(controlsVisible\) playbackCoordinator.pauseAll\(\)/);
  assert.doesNotMatch(player, /\/recording-tests|method:\s*["'](?:POST|PUT|PATCH|DELETE)/);
  assert.doesNotMatch(player + native, /setInterval|requestAnimationFrame|addEventListener\(["']keydown/);
});
