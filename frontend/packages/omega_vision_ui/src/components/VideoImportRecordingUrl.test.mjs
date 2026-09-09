import assert from "node:assert/strict";
import test from "node:test";
import {
  preprocessingSequenceId,
  resolveVisualSequenceLocation,
  urlWithVisualSequence,
  visualSequenceLocationForEntry,
  visualSequenceLocationFromUrl,
  visualSequenceProviderRef,
} from "./VideoImportRecordingUrl.ts";

const gameSequence = {
  id: "recordings/ls20/20260718-154544",
  dir: "data/recordings/ls20/20260718-154544",
  kind: "arc-recording",
  gameId: "ls20-9607627b",
  game: "ls20",
  recording: "20260718-154544",
};

const stillSequence = {
  id: "curated/single-image",
  dir: "data/curated/single-image",
  kind: "curated",
};

test("preprocessing cold reload and back-forward use only the validated current URL", () => {
  const game = visualSequenceLocationFromUrl("http://localhost/?game=ls20&recording=20260718-154544").location;
  const still = { recording: stillSequence.id };
  assert.equal(preprocessingSequenceId([], game, gameSequence.id), "");
  assert.equal(preprocessingSequenceId([gameSequence, stillSequence], game, ""), `data/${gameSequence.id}`);
  assert.equal(preprocessingSequenceId([gameSequence, stillSequence], still, gameSequence.id), `data/${stillSequence.id}`);
  assert.equal(preprocessingSequenceId([gameSequence, stillSequence], game, stillSequence.id), `data/${gameSequence.id}`);
  assert.equal(preprocessingSequenceId([gameSequence], { game: "ls20", recording: "missing" }, gameSequence.id), "");
  assert.equal(preprocessingSequenceId([gameSequence], null, gameSequence.id), `data/${gameSequence.id}`);
});

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

test("preprocessing keys on data/<resolved catalog entry id> matching the extraction target", () => {
  // The Preprocessing section resolves a game=/recording= URL against the
  // catalog and keys its per-sequence chain on data/<entry.id> — exactly the
  // target the extraction posts (set=selectedImageSet) — so a cold reload
  // persists to the same sequence dir OpenCV/LLM read.
  const parsed = visualSequenceLocationFromUrl(
    "http://localhost:5173/?workspace=arc3_random_player&view=videoImport&subview=recognition&game=ls20&recording=20260718-154544",
  );
  assert.equal(parsed.error, "");
  const resolved = resolveVisualSequenceLocation([gameSequence, stillSequence], parsed.location);
  assert.equal(resolved.entry, gameSequence);
  assert.equal(`data/${resolved.entry.id}`, "data/recordings/ls20/20260718-154544");
  // The provider ref helper agrees for this catalog entry.
  assert.equal(visualSequenceProviderRef(resolved.entry), "data/recordings/ls20/20260718-154544");
});

test("provider ref falls back to data/<id> when no dir is recorded", () => {
  assert.equal(
    visualSequenceProviderRef({ id: "recognition_reduce", kind: "reduce" }),
    "data/recognition_reduce",
  );
  // An explicit provider ref / dir wins over the derived data/<id> form.
  assert.equal(
    visualSequenceProviderRef({ id: "recordings/ls20/x", dir: "data/recordings/ls20/x" }),
    "data/recordings/ls20/x",
  );
});

test("a stale bare recording ref surfaces the correct catalog reason, not a fabricated match", () => {
  // Only suffixed variants exist; the bare ref must report unavailable rather
  // than silently resolving to an attempt variant.
  const variants = [
    { ...gameSequence, id: "recordings/ls20/20260718-154544_attempt7", dir: "data/recordings/ls20/20260718-154544_attempt7", recording: "20260718-154544_attempt7" },
    { ...gameSequence, id: "recordings/ls20/20260718-154544_attempt8", dir: "data/recordings/ls20/20260718-154544_attempt8", recording: "20260718-154544_attempt8" },
  ];
  const stale = resolveVisualSequenceLocation(variants, { game: "ls20", recording: "20260718-154544" });
  assert.equal(stale.entry, null);
  assert.match(stale.error, /not available/);
  // The real variant resolves and yields its own canonical provider ref.
  const valid = resolveVisualSequenceLocation(variants, { game: "ls20", recording: "20260718-154544_attempt8" });
  assert.equal(valid.entry, variants[1]);
  assert.equal(visualSequenceProviderRef(valid.entry), "data/recordings/ls20/20260718-154544_attempt8");
});
