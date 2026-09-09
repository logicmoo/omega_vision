import assert from "node:assert/strict";
import test from "node:test";
import { loadVisualSequenceCatalog } from "./VisualSequenceCatalog.ts";

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
  await loadVisualSequenceCatalog("cache-test", true);
  assert.match(fetch.mock.calls[2].arguments[0], /refresh=true/);
  assert.deepEqual(fetch.mock.calls[2].arguments[1].headers, {});
});

test("catalog errors are not cached or disguised as a stale success", async (t) => {
  t.mock.method(globalThis, "fetch", async () => new Response("unavailable", { status: 503 }));
  await assert.rejects(loadVisualSequenceCatalog("failure-test"), /503/);
  await assert.rejects(loadVisualSequenceCatalog("failure-test"), /503/);
  assert.equal(fetch.mock.calls.length, 2);
});
