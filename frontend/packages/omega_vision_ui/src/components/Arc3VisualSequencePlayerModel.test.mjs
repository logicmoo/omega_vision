import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import test from "node:test";
import {
  clampVisualSequenceFrameIndex,
  parseVisualSequenceFramePage,
  visualSequenceFrameAssetUrl,
  VisualSequenceFramePager,
  visualSequenceNavigationIndex,
  visualSequencePageOffset,
  visualSequenceSourceId,
} from "./Arc3VisualSequencePlayerModel.ts";

const workspace = "arc3_random_player";
const sequence = { id: "recordings/events_tests/before_after", ordered: true };
const sequenceId = `data/${sequence.id}`;
const page = (offset = 0, total = 205, source = sequenceId) => ({
  sequenceId: source, total, offset,
  frames: Array.from({ length: Math.max(0, Math.min(100, total - offset)) }, (_, index) => ({
    path: `${source}/${index + offset}/image.png`, label: `${index + offset}/image.png`,
  })),
});
const deferred = () => {
  let resolve;
  let reject;
  const promise = new Promise((yes, no) => { resolve = yes; reject = no; });
  return { promise, resolve, reject };
};
const requestOffset = url => Number(new URL(url, "http://local").searchParams.get("offset"));

test("canonical shared identities are preserved without game or workspace ownership", () => {
  for (const id of ["recordings/tests/one", "curated/example scenes", "curated", "recordings"]) {
    assert.equal(visualSequenceSourceId({ id }), `data/${id}`);
    assert.equal(visualSequenceSourceId({
      id, visualSequenceId: id, dir: `data/${id}`, providerRef: `data/${id}`, gameId: "not-loaded",
    }), `data/${id}`);
  }
  for (const invalid of [
    { id: "workspaces/private/recordings/a" }, { id: "importables/a" }, { id: "video/a" },
    { id: "../recordings/a" }, { id: "recordings/../a" }, { id: "recordings//a" },
    { id: "recordings/./a" }, { id: "recordings/a/" }, { id: "recordings/a." },
    { id: "recordings/a " }, { id: "recordings\\a" }, { id: "https://host/image" },
    { id: "recordings/%2e%2e/a" }, { id: "recordings/%252e%252e/a" },
    { id: "recordings/a", dir: "data/recordings/b" },
    { id: "recordings/a", providerRef: "data/recordings/b" },
    { id: "recordings/a", visualSequenceId: "recordings/b" },
  ]) assert.throws(() => visualSequenceSourceId(invalid));
});

test("explicitly read-only legacy catalog sources remain browsable without making them writable", () => {
  const entry = { id: "video/existing_clip", readOnly: true, migrationRequired: true };
  const id = visualSequenceSourceId(entry);
  assert.equal(id, "data/video/existing_clip");
  assert.equal(parseVisualSequenceFramePage(page(0, 2, id), id, 0).total, 2);
  assert.match(visualSequenceFrameAssetUrl(workspace, id, `${id}/0/image.png`), /asset\?path=/);
  for (const bad of [
    { id: entry.id }, { ...entry, readOnly: false }, { ...entry, migrationRequired: false },
    { ...entry, id: "arc_recordings/retired" }, { ...entry, id: "workspaces/private/sequence" },
  ]) assert.throws(() => visualSequenceSourceId(bad));
});

test("browser fetch is invoked as a standalone transport, not with the pager as its receiver", async () => {
  let called = false;
  const pager = new VisualSequenceFramePager(workspace, sequence, async function () {
    assert.equal(this, undefined);
    called = true;
    return Response.json(page(0, 2));
  });
  assert.equal((await pager.load(0)).total, 2);
  assert.equal(called, true);
});

test("named, nested and numeric sources retain the supplied order rather than guessing filenames", () => {
  const id = "data/curated/spotlight scenes";
  const frames = ["after.WEBP", "0/image.png", "nest/first #2 & 50% 空白.jpeg", "before.bmp", "preview.gif"]
    .map(label => ({ path: `${id}/${label}`, label }));
  assert.deepEqual(parseVisualSequenceFramePage({
    sequenceId: id, offset: 0, total: frames.length, frames,
  }, id, 0).frames, frames);
  const url = new URL(visualSequenceFrameAssetUrl(workspace, id, frames[2].path), "http://local");
  assert.equal(url.origin, "http://local");
  assert.equal(url.pathname, `/workbench/workspaces/${workspace}/asset`);
  assert.equal(url.searchParams.get("path"), frames[2].path);
});

test("frame and asset validation rejects traversal, unsafe URLs and near-prefix sibling sources", () => {
  const invalidPaths = [
    "https://outside/image.png", "//outside/image.png", "data/preferences/image.png",
    `${sequenceId}-other/image.png`, `${sequenceId}/../image.png`, `${sequenceId}/./image.png`,
    `${sequenceId}//image.png`, `${sequenceId}\\image.png`, `${sequenceId}/x:stream.png`,
    `${sequenceId}/%2e%2e/image.png`, `${sequenceId}/%252fimage.png`,
    `${sequenceId}/a%5cb.png`, `${sequenceId}/a\u0000.png`,
    `${sequenceId}/folder./image.png`, `${sequenceId}/folder /image.png`,
    `${sequenceId}/image.svg`, `${sequenceId}/image.json`, `${sequenceId}/image.png?outside`,
  ];
  for (const path of invalidPaths) {
    assert.throws(() => parseVisualSequenceFramePage({
      ...page(0, 1), frames: [{ path, label: "not trusted" }],
    }, sequenceId, 0), /invalid/);
    assert.throws(() => visualSequenceFrameAssetUrl(workspace, sequenceId, path));
  }
  for (const context of ["", "..", "../another", "one/two", "one\\two", "%2e%2e"]) {
    assert.throws(() => visualSequenceFrameAssetUrl(context, sequenceId, page(0, 1).frames[0].path));
    assert.throws(() => new VisualSequenceFramePager(context, sequence));
  }
});

test("pages validate identity, offsets, total, exact bounded size, labels and duplicates", () => {
  const good = page(0, 2);
  for (const invalid of [
    null, [], { ...good, sequenceId: `${sequenceId}-other` }, { ...good, offset: 1 },
    { ...good, total: -1 }, { ...good, total: "2" }, { ...good, total: 2.5 },
    { ...good, total: Number.MAX_SAFE_INTEGER + 1 }, { ...good, frames: null },
    { ...good, frames: [] }, { ...good, frames: good.frames.slice(0, 1) },
    { ...good, frames: [...good.frames, good.frames[0]] },
    { ...good, frames: [good.frames[0], good.frames[0]] },
    { ...good, frames: [{ ...good.frames[0], label: null }, good.frames[1]] },
  ]) assert.throws(() => parseVisualSequenceFramePage(invalid, sequenceId, 0));
  assert.throws(() => parseVisualSequenceFramePage(page(0, 101), sequenceId, 0, 100), /count changed/);
  assert.throws(() => parseVisualSequenceFramePage(page(100, 100), sequenceId, 100), /outside/);
  assert.throws(() => parseVisualSequenceFramePage(page(1, 100), sequenceId, 1), /offset/);
  assert.equal(parseVisualSequenceFramePage(page(100, 103), sequenceId, 100).frames.length, 3);
  assert.deepEqual(parseVisualSequenceFramePage(page(0, 0), sequenceId, 0), page(0, 0));
  assert.throws(() => parseVisualSequenceFramePage(page(100, 0), sequenceId, 100), /outside/);
});

test("paging is lazy, bounded and read-only, independent of the catalog's previous count", async () => {
  const calls = [];
  const pager = new VisualSequenceFramePager(workspace, { ...sequence, imageCount: 2 }, async (url, init) => {
    calls.push({ url, init });
    return Response.json(page(requestOffset(url), 5001));
  });
  assert.equal(calls.length, 0);
  assert.equal(pager.total, null);
  await assert.rejects(pager.load(1), /outside/);
  const first = await pager.load(0);
  assert.equal(calls.length, 1);
  assert.equal(first.frames.length, 100);
  assert.equal(pager.total, 5001);
  assert.equal(await pager.load(99), first);
  assert.equal(calls.length, 1);
  assert.equal((await pager.load(100)).offset, 100);
  assert.equal((await pager.load(5000)).frames.length, 1);
  assert.equal(calls.length, 3);
  for (const { url, init } of calls) {
    const parsed = new URL(url, "http://local");
    assert.equal(parsed.pathname, "/workbench/video-import/preprocessing-frames");
    assert.equal(parsed.searchParams.get("sequenceId"), sequenceId);
    assert.equal(parsed.searchParams.get("workspaceId"), workspace);
    assert.equal(parsed.searchParams.get("limit"), "100");
    assert.equal(init.method, "GET");
    assert.equal(init.cache, "no-store");
    assert.equal(init.redirect, "error");
    assert.ok(init.signal instanceof AbortSignal);
    assert.equal(init.body, undefined);
  }
  await assert.rejects(pager.load(5001), /outside/);
  await assert.rejects(pager.load(-1), /Invalid/);
  assert.equal(calls.length, 3);
});

test("only three pages of references are retained, with least-recently-used eviction", async () => {
  const offsets = [];
  const pager = new VisualSequenceFramePager(workspace, sequence, async url => {
    const offset = requestOffset(url);
    offsets.push(offset);
    return Response.json(page(offset, 1000));
  });
  for (const index of [0, 100, 200, 0, 300, 0, 100]) await pager.load(index);
  assert.deepEqual(offsets, [0, 100, 200, 300, 100]);
});

test("HTTP, malformed JSON and missing pages remain errors and explicit retry resets the snapshot", async () => {
  let reply = () => new Response("", { status: 503 });
  const pager = new VisualSequenceFramePager(workspace, sequence, async () => reply());
  await assert.rejects(pager.load(0), /HTTP 503/);
  assert.equal(pager.total, null);
  reply = () => new Response("not-json");
  await assert.rejects(pager.load(0), SyntaxError);
  reply = () => Response.json({ ...page(), frames: [] });
  await assert.rejects(pager.load(0), /empty or incomplete/);
  reply = () => Response.json(page());
  await pager.load(0);
  reply = () => Response.json(page(100, 204));
  await assert.rejects(pager.load(100), /count changed/);
  pager.reset();
  assert.equal(pager.total, null);
  reply = () => Response.json(page(0, 204));
  assert.equal((await pager.load(0)).total, 204);
});

test("an empty sequence is a ready empty result, not an endless fetch loop", async () => {
  let calls = 0;
  const pager = new VisualSequenceFramePager(workspace, sequence, async () => {
    calls += 1;
    return Response.json(page(0, 0));
  });
  assert.equal((await pager.load(0)).total, 0);
  assert.equal((await pager.load(0)).frames.length, 0);
  assert.equal(calls, 1);
  await assert.rejects(pager.load(1), /outside/);
});

test("cached page navigation supersedes an in-flight page, including late errors", async () => {
  for (const lateError of [false, true]) {
    const pending = deferred();
    let signal;
    const pager = new VisualSequenceFramePager(workspace, sequence, async (url, init) => {
      if (requestOffset(url) === 0) return Response.json(page());
      signal = init.signal;
      return pending.promise;
    });
    const first = await pager.load(0);
    const old = pager.load(100);
    assert.equal(await pager.load(0), first);
    assert.equal(signal.aborted, true);
    if (lateError) pending.reject(new Error("Late failed page"));
    else pending.resolve(Response.json(page(100, 999)));
    assert.equal(await old, null);
    assert.equal(pager.total, 205);
  }
});

test("reverse page completions and slow JSON parsing cannot publish stale responses", async () => {
  const pending = deferred();
  const pager = new VisualSequenceFramePager(workspace, sequence, async url => {
    const offset = requestOffset(url);
    if (offset === 100) return { ok: true, json: () => pending.promise };
    return Response.json(page(offset));
  });
  await pager.load(0);
  const old = pager.load(100);
  await Promise.resolve();
  assert.equal((await pager.load(200)).offset, 200);
  pending.resolve(page(100, 12345));
  assert.equal(await old, null);
  assert.equal(pager.total, 205);
});

test("cancellation and reset invalidate old requests, even when a transport ignores abort", async () => {
  const pending = deferred();
  let calls = 0;
  const pager = new VisualSequenceFramePager(workspace, sequence, async () => {
    calls += 1;
    return calls === 1 ? pending.promise : Response.json(page(0, 2));
  });
  const old = pager.load(0);
  pager.cancel();
  pager.reset();
  await pager.load(0);
  pending.resolve(Response.json(page(0, 99)));
  assert.equal(await old, null);
  assert.equal(pager.total, 2);
});

test("workspace switches change request context but never the shared sequence or frame identity", async () => {
  const pending = deferred();
  const calls = [];
  const transport = async url => {
    calls.push(url);
    return new URL(url, "http://local").searchParams.get("workspaceId") === workspace
      ? pending.promise : Response.json(page(0, 1));
  };
  const old = new VisualSequenceFramePager(workspace, sequence, transport);
  const fresh = new VisualSequenceFramePager("another_workspace", sequence, transport);
  const oldRequest = old.load(0);
  old.cancel();
  const visible = await fresh.load(0);
  pending.resolve(Response.json(page(0, 1)));
  assert.equal(await oldRequest, null);
  assert.equal(visible.frames[0].path, `${sequenceId}/0/image.png`);
  assert.equal(old.sequenceId, fresh.sequenceId);
  assert.ok(calls.every(url => new URL(url, "http://local").searchParams.get("sequenceId") === sequenceId));
});

test("page boundaries cannot silently repeat a source from a known earlier page", async () => {
  const pager = new VisualSequenceFramePager(workspace, sequence, async url => {
    const offset = requestOffset(url);
    const result = page(offset);
    if (offset) result.frames[0].path = `${sequenceId}/0/image.png`;
    return Response.json(result);
  });
  await pager.load(0);
  await assert.rejects(pager.load(100), /repeat an image/);
});

test("manual navigation and scrubber indices are bounded without any game action", () => {
  assert.equal(visualSequenceNavigationIndex("ArrowLeft", 0, 205), 0);
  assert.equal(visualSequenceNavigationIndex("ArrowRight", 99, 205), 100);
  assert.equal(visualSequenceNavigationIndex("ArrowRight", 204, 205), 204);
  assert.equal(visualSequenceNavigationIndex("Home", 150, 205), 0);
  assert.equal(visualSequenceNavigationIndex("End", 0, 205), 204);
  assert.equal(visualSequenceNavigationIndex("ArrowRight", 0, 0), 0);
  assert.equal(visualSequenceNavigationIndex("ArrowUp", 3, 205), null);
  assert.equal(visualSequenceNavigationIndex(" ", 3, 205), null);
  assert.equal(clampVisualSequenceFrameIndex(-100, 205), 0);
  assert.equal(clampVisualSequenceFrameIndex(9.9, 205), 9);
  assert.equal(clampVisualSequenceFrameIndex(99999, 205), 204);
  assert.equal(clampVisualSequenceFrameIndex(NaN, 205), 0);
  assert.equal(visualSequencePageOffset(99), 0);
  assert.equal(visualSequencePageOffset(100), 100);
  assert.equal(visualSequencePageOffset(204), 200);
  for (const value of [-1, 1.5, NaN, Infinity, Number.MAX_SAFE_INTEGER + 1]) {
    assert.throws(() => visualSequencePageOffset(value), /Invalid/);
  }
});

test("the player stays scoped, explicitly controlled, read-only and transparent, with return and retry affordances", () => {
  const source = path => readFileSync(new URL(path, import.meta.url), "utf8");
  const ui = source("./Arc3VisualSequencePlayer.tsx");
  const model = source("./Arc3VisualSequencePlayerModel.ts");
  const css = source("../styles/arc3_visual_sequence_player.css");
  assert.match(ui, /export function Arc3VisualSequencePlayer/);
  assert.match(ui, /key=\{identity\}/);
  assert.match(ui, /\[workspaceId, sequence.id, sequence.visualSequenceId, sequence.dir, sequence.providerRef\]/);
  assert.match(ui, /onKeyDown=\{handleKeyDown\}/);
  assert.match(ui, /controlsVisible = true/);
  assert.match(ui, /if \(!controlsVisible \|\| lifecycle.paused/);
  assert.match(ui, /controlsVisible && <div className="arc3-visual-sequence-controls"/);
  assert.match(ui, /event.preventDefault\(\)/);
  assert.match(ui, /event.stopPropagation\(\)/);
  assert.match(ui, /useMenuSurfaceLifecycle/);
  assert.match(ui, /epoch !== lifecycle.suspensionEpoch/);
  assert.match(ui, /pager.cancel\(\)/);
  assert.match(ui, /onClick=\{\(\) => \{ playback.pause\(\); onClose\(\); \}\}/);
  assert.match(ui, /type="range"/);
  assert.match(ui, /Retry image/);
  assert.match(ui, /Retry frames/);
  assert.match(ui, /Source order; causal chronology is not verified/);
  assert.match(ui, /index.*baseline/);
  assert.match(css, /conic-gradient/);
  assert.match(css, /focus-visible/);
  assert.ok(ui.indexOf('<figure className="arc3-visual-sequence-figure">') < ui.indexOf('<div className="arc3-visual-sequence-controls">'));
  assert.match(css, /\.visual-sequence-demo-player \{[\s\S]*?min-height: clamp/);
  assert.doesNotMatch(ui + model, /localStorage|sessionStorage|\.select\(|addEventListener\(["']keydown|setInterval|setTimeout|requestAnimationFrame|method:\s*["'](?:POST|PUT|DELETE|PATCH)|\/arc3\/|pooler/);
  assert.match(ui, /addEventListener\("visibilitychange", update\)/);
});
