import assert from "node:assert/strict";
import test from "node:test";
import { recordingFromUrl, urlWithRecording } from "./VideoImportRecordingUrl.ts";

test("recording updates preserve every unrelated query parameter and hash", () => {
  const original = "http://127.0.0.1:5173/?workspace=demo&gen=7&subview=recognition&filter=a&filter=b#opencv";
  const recording = "data/recordings/ls20/20260718-154544_attempt8";
  const updated = new URL(urlWithRecording(original, recording));

  assert.equal(updated.searchParams.get("recording"), recording);
  assert.equal(updated.searchParams.get("workspace"), "demo");
  assert.equal(updated.searchParams.get("gen"), "7");
  assert.equal(updated.searchParams.get("subview"), "recognition");
  assert.deepEqual(updated.searchParams.getAll("filter"), ["a", "b"]);
  assert.equal(updated.hash, "#opencv");
  assert.equal(recordingFromUrl(updated.toString()), recording);
});

test("recording replacement changes only the recording parameter", () => {
  const original = "http://127.0.0.1:5173/?recording=old%2Frecording&workspace=demo&gen=2";
  const updated = new URL(urlWithRecording(original, "new/recording"));

  assert.equal(updated.searchParams.get("recording"), "new/recording");
  assert.equal(updated.searchParams.get("workspace"), "demo");
  assert.equal(updated.searchParams.get("gen"), "2");
  assert.equal([...updated.searchParams.keys()].length, 3);
});

test("empty recording removes only the recording parameter", () => {
  const updated = new URL(urlWithRecording(
    "http://127.0.0.1:5173/?workspace=demo&recording=old&subview=games",
    "",
  ));

  assert.equal(updated.searchParams.has("recording"), false);
  assert.equal(updated.searchParams.get("workspace"), "demo");
  assert.equal(updated.searchParams.get("subview"), "games");
});
