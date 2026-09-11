import assert from "node:assert/strict";
import test from "node:test";
import { loadVisualSequenceRecordingContext } from "./VisualSequenceRecordingContext.ts";

const manifest = {
  schemaVersion: 1, sequenceId: "data/recordings/ls20/run", gameId: "ls20",
  frames: [{ frameId: "explicit-z", levelId: "2", frameOrder: 4 }, { frameId: "explicit-a", levelId: null, frameOrder: 8 }],
  selectedFrameId: "explicit-z",
};
const signal = () => new AbortController().signal;

test("no frame requests first explicit manifest frame, not sorted filename order", async t => {
  t.mock.method(globalThis, "fetch", async () => Response.json(manifest));
  const result = await loadVisualSequenceRecordingContext("arc3_random_player", "recordings/ls20/run", undefined, signal());
  assert.equal(result.selectedFrameId, "explicit-z");
  const url = new URL(fetch.mock.calls[0].arguments[0], "http://unused.invalid");
  assert.equal(url.searchParams.has("frameId"), false);
  assert.equal(url.searchParams.get("sequenceId"), manifest.sequenceId);
  assert.equal(fetch.mock.calls[0].arguments[1].method, undefined);
});

test("an explicit frame is retained and invalid frames never retry with an omitted frame", async t => {
  t.mock.method(globalThis, "fetch", async () => Response.json({
    detail: { reasonCode: "frame_not_found", message: "No manifest frame matches." },
  }, { status: 422 }));
  for (const frame of ["invalid", ""]) {
    await assert.rejects(loadVisualSequenceRecordingContext("a", "recordings/ls20/run", frame, signal()), /frame_not_found/);
    assert.equal(new URL(fetch.mock.calls.at(-1).arguments[0], "http://unused.invalid").searchParams.get("frameId"), frame);
  }
  assert.equal(fetch.mock.calls.length, 2);
});

test("a server-substituted explicit frame and invalid context metadata are rejected", async t => {
  t.mock.method(globalThis, "fetch", async () => Response.json(manifest));
  await assert.rejects(loadVisualSequenceRecordingContext("a", "recordings/ls20/run", "explicit-a", signal()), /No frame was substituted/);
  for (const value of [
    { ...manifest, sequenceId: "data/recordings/other/run" },
    { ...manifest, frames: [manifest.frames[0], manifest.frames[0]] },
    { ...manifest, selectedFrameId: "missing" },
    { ...manifest, frames: [] },
  ]) {
    t.mock.method(globalThis, "fetch", async () => Response.json(value));
    await assert.rejects(loadVisualSequenceRecordingContext("a", "recordings/ls20/run", undefined, signal()), /Invalid recording/);
  }
});

test("legacy, curated, absent and unsafe sequence contexts fail without enumeration or requests", async t => {
  t.mock.method(globalThis, "fetch", async () => { throw new Error("Unexpected request"); });
  for (const id of ["arc_recordings/data-recordings-ls20-20260718-154544", "curated/example", "", "recordings/../escape"]) {
    await assert.rejects(loadVisualSequenceRecordingContext("a", id, undefined, signal()), /not a canonical recording/);
  }
  assert.equal(fetch.mock.calls.length, 0);
});
