import assert from "node:assert/strict";
import test from "node:test";
import { readFileSync } from "node:fs";
import { loadVisualSequenceCatalog, loadVisualSequenceEntry } from "./VisualSequenceCatalog.ts";

test("catalog revalidates stored entries, deduplicates calls, and forces refresh", async (t) => {
  const storage = new Map();
  t.mock.method(globalThis, "fetch", async (_url, init) => {
    if (init.headers["If-None-Match"]) return new Response(null, { status: 304 });
    return Response.json({ visualSequences: [{ id: "large", imageCount: 801 }] }, { headers: { ETag: 'W/"one"' } });
  });
  const original = Object.getOwnPropertyDescriptor(globalThis, "sessionStorage");
  Object.defineProperty(globalThis, "sessionStorage", { configurable: true, value: {
    getItem: (key) => storage.get(key), setItem: (key, value) => storage.set(key, value),
  } });
  t.after(() => {
    if (original) Object.defineProperty(globalThis, "sessionStorage", original);
    else delete globalThis.sessionStorage;
  });
  const first = loadVisualSequenceCatalog("cache-test");
  assert.equal(loadVisualSequenceCatalog("cache-test"), first);
  assert.equal((await first)[0].imageCount, 801);
  assert.equal((await loadVisualSequenceCatalog("cache-test"))[0].imageCount, 801);
  assert.equal(fetch.mock.calls.length, 2);
  assert.equal((await loadVisualSequenceCatalog("second-workspace"))[0].imageCount, 801);
  assert.equal(fetch.mock.calls[2].arguments[1].headers["If-None-Match"], 'W/"one"');
  assert.equal(storage.size, 1);
  assert.ok([...storage.keys()].every(key => !key.includes("workspace") && !key.includes("cache-test")));
  await loadVisualSequenceCatalog("cache-test", true);
  assert.match(fetch.mock.calls[3].arguments[0], /refresh=true/);
  assert.deepEqual(fetch.mock.calls[3].arguments[1].headers, {});
  assert.ok(fetch.mock.calls.every(call => call.arguments[0].includes("/visual-sequences?")));
});

test("a late ordinary response cannot overwrite refreshed shared choices", async (t) => {
  let release;
  t.mock.method(globalThis, "fetch", async (url) => {
    if (!url.includes("refresh=true")) await new Promise(resolve => { release = resolve; });
    return Response.json({ visualSequences: [{ id: url.includes("refresh=true") ? "new" : "old", imageCount: 801 }] },
      { headers: { ETag: url.includes("refresh=true") ? '"new"' : '"old"' } });
  });
  const old = loadVisualSequenceCatalog("race");
  const fresh = await loadVisualSequenceCatalog("race", true);
  release();
  assert.deepEqual(await old, fresh);
  assert.equal(fresh[0].id, "new");
});

test("catalog errors are not cached or disguised as a stale success", async (t) => {
  t.mock.method(globalThis, "fetch", async () => new Response("unavailable", { status: 503 }));
  await assert.rejects(loadVisualSequenceCatalog("failure-test"), /503/);
  await assert.rejects(loadVisualSequenceCatalog("failure-test"), /503/);
  assert.equal(fetch.mock.calls.length, 2);
});

test("unsafe identities and missing or inexact confirmation counts are rejected", async (t) => {
  for (const entry of [
    { id: "../outside", imageCount: 1 },
    { id: "curated/one", dir: "data/../../outside", imageCount: 1 },
    { id: "curated/one" },
    { id: "curated/one", imageCount: -1 },
    { id: "curated/one", imageCount: 800.5 },
  ]) {
    t.mock.method(globalThis, "fetch", async () => Response.json({ visualSequences: [entry] }));
    await assert.rejects(loadVisualSequenceCatalog("invalid-count", true), /invalid entries/);
  }
});

test("the chosen sequence resolves independently while full-catalog loading fails", async (t) => {
  t.mock.method(globalThis, "fetch", async () => new Response("catalog busy", { status: 503 }));
  await assert.rejects(loadVisualSequenceCatalog("selected-independent"), /503/);
  const calls = [];
  const signal = new AbortController().signal;
  const id = "recordings/events_tests/rotated";
  const selected = await loadVisualSequenceEntry("arc3_random_player", id, signal, async (url, init) => {
    calls.push({ url, init });
    return Response.json({ visualSequence: { id, visualSequenceId: id, providerRef: `data/${id}`, imageCount: 2 } });
  });
  assert.equal(selected.id, id);
  assert.equal(selected.imageCount, 2);
  assert.equal(calls.length, 1);
  assert.match(calls[0].url, /visual-sequences\/resolve\?/);
  assert.equal(calls[0].init.cache, "no-store");
  assert.equal(calls[0].init.signal, signal);
  assert.equal(calls[0].init.method, undefined);
});

test("selected-source resolution rejects substitution, unsafe IDs and unavailable sources", async () => {
  const id = "recordings/events_tests/rotated";
  for (const visualSequence of [
    null, { id: "recordings/another", imageCount: 2 },
    { id, providerRef: "data/../private", imageCount: 2 }, { id, imageCount: -1 },
  ]) await assert.rejects(loadVisualSequenceEntry("w", id, undefined, async () => Response.json({ visualSequence })), /identity/);
  await assert.rejects(loadVisualSequenceEntry("w", id, undefined, async () => new Response("", { status: 404 })), /404/);
  await assert.rejects(loadVisualSequenceEntry("w", "../private", undefined, () => assert.fail("must not fetch")), /Invalid/);
});

test("the selected-source activation is no longer gated by the unrelated catalog result", () => {
  const page = readFileSync(new URL("./VideoImportPage.tsx", import.meta.url), "utf8");
  const start = page.indexOf("// Activate the individually validated selected source");
  const end = page.indexOf('window.localStorage.setItem("videoImport.objectsShowLive"', start);
  const activation = page.slice(start, end);
  assert.match(activation, /selectedSequenceEntry\?\.id !== selectedImageSet/);
  assert.match(activation, /selectVisualSequence\(entry, "none"\)/);
  assert.doesNotMatch(activation, /imageSetsLoaded|imageSetsError|loadVisualSequenceCatalog|\.select\(/);
  assert.match(page, /loadVisualSequenceEntry\(workspaceId, selectedImageSet, controller.signal\)/);
  assert.match(page, /Retry selected sequence/);
  assert.doesNotMatch(page, /Loading catalog for \{selectedImageSet\}/);
});
