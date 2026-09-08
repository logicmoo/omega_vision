import assert from "node:assert/strict";
import test from "node:test";
import {
  resolveVisualSequenceLocation,
  urlWithVisualSequence,
  visualSequenceLocationForEntry,
  visualSequenceLocationFromUrl,
} from "./VideoImportRecordingUrl.ts";

const gameSequence = {
  id: "recordings/ls20/20260718-154544",
  dir: "data/recordings/ls20/20260718-154544",
  kind: "arc-recording",
  gameId: "ls20",
};

const stillSequence = {
  id: "curated/single-image",
  dir: "data/curated/single-image",
  kind: "curated",
};

test("game-backed Visual Sequence updates preserve every unrelated query parameter", () => {
  const original = "http://localhost:5173/?workspace=arc3_random_player&subview=recognition&view=videoImport&gen=1&filter=a&filter=b#opencv";
  const updated = new URL(urlWithVisualSequence(
    original,
    visualSequenceLocationForEntry(gameSequence),
  ));

  assert.equal(updated.searchParams.get("game"), "ls20");
  assert.equal(updated.searchParams.get("recording"), "20260718-154544");
  assert.equal(updated.searchParams.get("workspace"), "arc3_random_player");
  assert.equal(updated.searchParams.get("subview"), "recognition");
  assert.equal(updated.searchParams.get("view"), "videoImport");
  assert.equal(updated.searchParams.get("gen"), "1");
  assert.deepEqual(updated.searchParams.getAll("filter"), ["a", "b"]);
  assert.equal(updated.hash, "#opencv");
});

test("one-image non-game Visual Sequence uses its catalog-stable id", () => {
  const updated = new URL(urlWithVisualSequence(
    "http://localhost:5173/?workspace=arc3_random_player&game=stale&recording=old",
    visualSequenceLocationForEntry(stillSequence),
  ));

  assert.equal(updated.searchParams.has("game"), false);
  assert.equal(updated.searchParams.get("recording"), "curated/single-image");
  assert.equal(updated.searchParams.get("workspace"), "arc3_random_player");
});

test("switching back to a game sequence restores both canonical parameters", () => {
  const updated = new URL(urlWithVisualSequence(
    "http://localhost:5173/?workspace=arc3_random_player&recording=curated%2Fsingle-image",
    visualSequenceLocationForEntry(gameSequence),
  ));

  assert.equal(updated.searchParams.get("game"), "ls20");
  assert.equal(updated.searchParams.get("recording"), "20260718-154544");
});

test("legacy full-path recording links resolve then canonicalize", () => {
  const original = "http://localhost:5173/?workspace=arc3_random_player&recording=data%2Frecordings%2Fls20%2F20260718-154544&gen=1";
  const parsed = visualSequenceLocationFromUrl(original);
  assert.equal(parsed.error, "");
  assert.equal(parsed.legacy, true);
  assert.deepEqual(parsed.location, { game: "ls20", recording: "20260718-154544" });

  const resolved = resolveVisualSequenceLocation([gameSequence, stillSequence], parsed.location);
  assert.equal(resolved.entry, gameSequence);
  const canonical = new URL(urlWithVisualSequence(original, parsed.location));
  assert.equal(canonical.searchParams.get("game"), "ls20");
  assert.equal(canonical.searchParams.get("recording"), "20260718-154544");
  assert.equal(canonical.searchParams.get("workspace"), "arc3_random_player");
  assert.equal(canonical.searchParams.get("gen"), "1");
});

test("catalog resolution rejects unknown, ambiguous, and unsafe locations", () => {
  assert.match(
    resolveVisualSequenceLocation([gameSequence], { game: "ls20", recording: "missing" }).error,
    /not available/,
  );
  assert.match(
    resolveVisualSequenceLocation([gameSequence, { ...gameSequence }], {
      game: "ls20",
      recording: "20260718-154544",
    }).error,
    /ambiguous/,
  );
  const unsafe = visualSequenceLocationFromUrl(
    "http://localhost:5173/?game=ls20&recording=..%2Fsecret",
  );
  assert.equal(unsafe.location, null);
  assert.match(unsafe.error, /catalog identifiers/);
});
