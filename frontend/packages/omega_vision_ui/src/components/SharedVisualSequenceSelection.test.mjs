import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import test from "node:test";
import { createVisualSequenceSelectionStore, CONFIRMED_VISUAL_SEQUENCE_ID } from "./SharedVisualSequenceSelection.ts";

const selection = (id = CONFIRMED_VISUAL_SEQUENCE_ID, version = 0) =>
  ({ schemaVersion: 1, visualSequenceId: id, version, revision: `revision-${version}` });
const deferred = () => {
  let resolve;
  const promise = new Promise(done => { resolve = done; });
  return { promise, resolve };
};
function backend() {
  let current = selection();
  const calls = [];
  return {
    calls,
    fetch: async (url, init) => {
      calls.push({ url, init });
      if (init.method === "PUT") {
        const body = JSON.parse(init.body);
        if (body.expectedRevision !== current.revision) {
          return Response.json({ detail: { message: "Another window changed the selection." } }, { status: 409 });
        }
        current = selection(body.visualSequenceId, current.version + 1);
      }
      return Response.json(current);
    },
  };
}

test("subscribers deduplicate reads across workspaces and never PUT on mount or restoration", async t => {
  const server = backend();
  const store = createVisualSequenceSelectionStore(server.fetch);
  const leaveA = store.subscribe("arc3_random_player", () => {});
  const leaveB = store.subscribe("other", () => {});
  t.after(() => { leaveA(); leaveB(); });
  await store.refresh("other");
  assert.equal(server.calls.length, 1);
  assert.equal(store.getSnapshot().selection.visualSequenceId, CONFIRMED_VISUAL_SEQUENCE_ID);
  assert.equal(store.getSnapshot().selection.version, 0);
  leaveA();
  const leaveC = store.subscribe("third", () => {});
  t.after(leaveC);
  await store.refresh("third");
  assert.ok(server.calls.every(call => !call.init.method));
  assert.ok(server.calls.every(call => call.init.cache === "no-store"));
  assert.equal(store.getSnapshot().selection.visualSequenceId, "recordings/ls20/20260718-154544");
});

test("independent windows converge through the backend with one-second subscribed polling", async t => {
  t.mock.timers.enable({ apis: ["setInterval"] });
  const server = backend();
  const windowA = createVisualSequenceSelectionStore(server.fetch);
  const windowB = createVisualSequenceSelectionStore(server.fetch);
  const leaveA = windowA.subscribe("arc3_random_player", () => {});
  const leaveB = windowB.subscribe("other", () => {});
  t.after(() => { leaveA(); leaveB(); });
  await Promise.all([windowA.refresh("arc3_random_player"), windowB.refresh("other")]);
  assert.equal(await windowA.select("arc3_random_player", "recordings/ls20/run-a"), true);
  assert.equal(windowB.getSnapshot().selection.visualSequenceId, CONFIRMED_VISUAL_SEQUENCE_ID);
  t.mock.timers.tick(1000);
  await Promise.all([windowA.refresh("arc3_random_player"), windowB.refresh("other")]);
  assert.deepEqual(windowB.getSnapshot().selection, windowA.getSnapshot().selection);
  assert.equal(server.calls.filter(call => call.init.method === "PUT").length, 1);
  leaveA(); leaveB();
  const count = server.calls.length;
  t.mock.timers.tick(5000);
  assert.equal(server.calls.length, count);
});

test("late polling cannot overwrite a newer explicit selection response", async () => {
  const gate = deferred();
  let reads = 0;
  const store = createVisualSequenceSelectionStore(async (_url, init) => {
    if (init.method === "PUT") return Response.json(selection("curated/new", 2));
    if (++reads === 2) { await gate.promise; return Response.json(selection("curated/stale", 1)); }
    return Response.json(selection());
  });
  await store.refresh("a");
  const oldPoll = store.refresh("a");
  assert.equal(await store.select("a", "curated/new"), true);
  gate.resolve();
  await oldPoll;
  assert.equal(store.getSnapshot().selection.visualSequenceId, "curated/new");
  assert.equal(store.getSnapshot().selection.version, 2);
});

test("a poll issued during PUT does not race or overwrite the mutation", async () => {
  const gate = deferred();
  let reads = 0;
  const store = createVisualSequenceSelectionStore(async (_url, init) => {
    if (init.method === "PUT") { await gate.promise; return Response.json(selection("curated/next", 1)); }
    reads++;
    return Response.json(selection());
  });
  await store.refresh("a");
  const write = store.select("a", "curated/next");
  await store.refresh("b");
  assert.equal(reads, 1);
  assert.equal(await store.select("a", "curated/ignored"), false);
  gate.resolve();
  assert.equal(await write, true);
});

test("conflicts reload the winner, stay visible, and require an explicit retry", async () => {
  const server = backend();
  const a = createVisualSequenceSelectionStore(server.fetch);
  const b = createVisualSequenceSelectionStore(server.fetch);
  await Promise.all([a.refresh("a"), b.refresh("b")]);
  await a.select("a", "curated/a");
  assert.equal(await b.select("b", "curated/b"), false);
  assert.equal(b.getSnapshot().conflict, true);
  assert.match(b.getSnapshot().error, /another window/);
  assert.equal(b.getSnapshot().selection.visualSequenceId, "curated/a");
  await b.refresh("b");
  assert.match(b.getSnapshot().error, /choose again/);
  assert.equal(await b.select("b", "curated/b"), true);
  const writes = server.calls.filter(call => call.init.method === "PUT").map(call => JSON.parse(call.init.body));
  assert.deepEqual(writes.map(body => body.expectedRevision), ["revision-0", "revision-0", "revision-1"]);
  assert.equal(b.getSnapshot().conflict, false);
});

test("HTTP errors and invalid snapshots retain the last authoritative ID without fallback", async () => {
  let response = Response.json(selection());
  const store = createVisualSequenceSelectionStore(async () => response.clone());
  await store.refresh("a");
  response = Response.json({ detail: "Selected sequence unavailable." }, { status: 422 });
  assert.equal(await store.select("a", "curated/unavailable"), false);
  assert.match(store.getSnapshot().error, /unavailable/);
  assert.equal(store.getSnapshot().selection.visualSequenceId, CONFIRMED_VISUAL_SEQUENCE_ID);
  response = Response.json(selection("curated/../../escape", 1));
  await store.refresh("b");
  assert.match(store.getSnapshot().error, /Invalid/);
  response = Response.json({ ...selection("curated/different"), revision: "same-version-different-revision" });
  await store.refresh("b");
  assert.match(store.getSnapshot().error, /Inconsistent/);
  assert.equal(store.getSnapshot().selection.visualSequenceId, CONFIRMED_VISUAL_SEQUENCE_ID);
});

test("unsafe IDs and selection before initial GET never issue writes", async () => {
  const server = backend();
  const store = createVisualSequenceSelectionStore(server.fetch);
  assert.equal(await store.select("a", "curated/new"), false);
  assert.equal(server.calls.length, 0);
  await store.refresh("a");
  for (const id of ["", "../outside", "recordings/../outside", "C:\\outside", "curated//bad"]) {
    assert.equal(await store.select("a", id), false);
  }
  assert.ok(server.calls.every(call => !call.init.method));
});

test("a successful HTTP response cannot silently confirm a different ID or a stale PUT revision", async () => {
  for (const returned of [selection("curated/other", 1), selection("curated/requested", 0)]) {
    const store = createVisualSequenceSelectionStore(async (_url, init) =>
      Response.json(init.method === "PUT" ? returned : selection()));
    await store.refresh("a");
    assert.equal(await store.select("a", "curated/requested"), false);
    assert.match(store.getSnapshot().error, /did not confirm/);
    assert.equal(store.getSnapshot().selection.visualSequenceId, CONFIRMED_VISUAL_SEQUENCE_ID);
  }
});

test("explicitly reselecting the unchanged ID succeeds without PUT or revision inflation", async () => {
  const server = backend();
  const store = createVisualSequenceSelectionStore(server.fetch);
  await store.refresh("arc3_random_player");
  const before = store.getSnapshot().selection;
  assert.equal(await store.select("arc3_random_player", CONFIRMED_VISUAL_SEQUENCE_ID), true);
  assert.equal(store.getSnapshot().selection, before);
  assert.equal(server.calls.filter(call => call.init.method === "PUT").length, 0);
});

test("the visible picker exposes loading/unavailable state instead of offering a blank selection", () => {
  const source = readFileSync(new URL("./VisualSequenceSelector.tsx", import.meta.url), "utf8");
  assert.match(source, /allowNone=\{false\}/);
  assert.match(source, /noneLabel=\{selection\.loading \? "Loading shared selection…" : "Shared selection unavailable"\}/);
  assert.match(source, /disabled=\{!selection\.selection \|\| selection\.writing \|\| catalog\.loading\}/);
  assert.match(source, /if \(!entry \|\| !visualSequenceLocationForEntry\(entry\)\) return/);
});
