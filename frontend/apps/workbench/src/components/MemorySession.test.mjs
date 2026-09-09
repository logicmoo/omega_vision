import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import { stripTypeScriptTypes } from "node:module";
import test from "node:test";

const source = readFileSync(new URL("./MemorySession.ts", import.meta.url), "utf8");
let moduleId = 0;

async function pageSession(events) {
  globalThis.window = {
    addEventListener: (name, listener) => events.set(name, listener),
    removeEventListener: (name) => events.delete(name),
  };
  const script = source.replace(/^import .* from "react";\r?\n/m,
    "const useEffect = () => {}; const useSyncExternalStore = (_subscribe, snapshot) => snapshot();\n");
  return import(`data:text/javascript;base64,${Buffer.from(stripTypeScriptTypes(script) + `\n// page ${++moduleId}`).toString("base64")}`);
}

test("browser RAM shares snapshots across workspaces, isolates tabs, and resets without network access", async () => {
  const originalWindow = globalThis.window;
  const originalFetch = globalThis.fetch;
  const requests = [];
  globalThis.fetch = async (url, options) => {
    requests.push({ url, ...options, body: JSON.parse(options.body) });
    return new Response(JSON.stringify({ memorySnapshot: "opaque-full-learned-state", records: [] }), { status: 200 });
  };
  try {
    const firstEvents = new Map();
    const first = await pageSession(firstEvents);
    const firstToken = first.memorySessionId("workspace-a");
    first.memorySessionId("workspace-b");
    const second = await pageSession(new Map());
    const secondToken = second.memorySessionId("workspace-a");
    const receipt = await first.memoryRequest("/save", { workspaceId: "workspace-a" });
    assert.deepEqual(receipt, { records: [] });
    await first.memoryRequest("/read", { workspaceId: "workspace-a" });
    await first.memoryRequest("/read", { workspaceId: "workspace-b" });
    await second.memoryRequest("/read", { workspaceId: "workspace-a" });
    assert.equal(requests[0].body.memorySnapshot, null);
    assert.equal(requests[1].body.memorySnapshot, "opaque-full-learned-state");
    assert.equal(requests[2].body.memorySnapshot, "opaque-full-learned-state");
    assert.equal(requests[2].body.workspaceId, "workspace-b");
    assert.equal(requests[3].body.memorySnapshot, null);
    assert.ok(requests.every(request => request.cache === "no-store"));
    assert.equal(firstEvents.has("heartbeat"), false);
    firstEvents.get("pagehide")();
    assert.notEqual(first.memorySessionId(), firstToken);
    assert.equal(second.memorySessionId(), secondToken);
    assert.equal(requests.length, 4);
    await first.memoryRequest("/read", { workspaceId: "workspace-a" });
    assert.equal(requests.at(-1).body.memorySnapshot, null);
    assert.doesNotMatch(source, /localStorage|sessionStorage|indexedDB|caches\./);
  } finally {
    if (originalWindow === undefined) delete globalThis.window;
    else globalThis.window = originalWindow;
    globalThis.fetch = originalFetch;
  }
});

test("cross-workspace operations are serialized and retired replies cannot restore cleared memory", async () => {
  const originalWindow = globalThis.window, originalFetch = globalThis.fetch;
  let release;
  const requests = [];
  globalThis.fetch = async (_url, options) => {
    requests.push(JSON.parse(options.body));
    if (requests.length === 1) await new Promise(resolve => { release = resolve; });
    return new Response(JSON.stringify({ memorySnapshot: `snapshot-${requests.length}` }));
  };
  try {
    const page = await pageSession(new Map());
    const first = page.memoryRequest("/save", { workspaceId: "w" });
    const second = page.memoryRequest("/save", { workspaceId: "other-workspace" });
    await new Promise(resolve => setImmediate(resolve));
    assert.equal(requests.length, 1);
    release();
    await Promise.all([first, second]);
    assert.equal(requests[1].memorySnapshot, "snapshot-1");
    assert.equal(requests[1].workspaceId, "other-workspace");
    globalThis.fetch = async () => {
      await new Promise(resolve => { release = resolve; });
      return new Response(JSON.stringify({ memorySnapshot: "must-not-return" }));
    };
    const pending = page.memoryRequest("/save", { workspaceId: "w" });
    const rejected = assert.rejects(pending, /Memory session ended/);
    await new Promise(resolve => setImmediate(resolve));
    page.rotateMemorySession();
    release();
    await rejected;
  } finally {
    globalThis.fetch = originalFetch;
    if (originalWindow === undefined) delete globalThis.window; else globalThis.window = originalWindow;
  }
});

test("streamed progress stays a receipt and only the final snapshot is retained", async () => {
  const originalWindow = globalThis.window, originalFetch = globalThis.fetch;
  try {
    const page = await pageSession(new Map());
    const progress = [];
    globalThis.fetch = async () => new Response(
      '{"progress":{"id":"job","state":"running"}}\n{"id":"job","state":"done","memorySnapshot":"private-state"}\n',
      { headers: { "Content-Type": "application/x-ndjson" } },
    );
    const result = await page.memoryRequest("/run", { workspaceId: "w" }, undefined, value => progress.push(value));
    assert.deepEqual(progress, [{ id: "job", state: "running" }]);
    assert.deepEqual(result, { id: "job", state: "done" });
  } finally {
    globalThis.fetch = originalFetch;
    if (originalWindow === undefined) delete globalThis.window; else globalThis.window = originalWindow;
  }
});

test("read-only status stays responsive during an execution and cannot replace its snapshot", async () => {
  const originalWindow = globalThis.window, originalFetch = globalThis.fetch;
  let release;
  const requests = [];
  try {
    const page = await pageSession(new Map());
    globalThis.fetch = async (url, options) => {
      requests.push({ url, body: JSON.parse(options.body) });
      if (url === "/run") await new Promise(resolve => { release = resolve; });
      return new Response(JSON.stringify({ memorySnapshot: url === "/run" ? "final-state" : "stale-read-state" }));
    };
    const run = page.memoryRequest("/run", { workspaceId: "w" });
    await new Promise(resolve => setImmediate(resolve));
    await page.memoryRequest("/read", { workspaceId: "w" }, undefined, undefined, true);
    assert.equal(requests.length, 2);
    release();
    await run;
    await page.memoryRequest("/read", { workspaceId: "w" }, undefined, undefined, true);
    assert.equal(requests.at(-1).body.memorySnapshot, "final-state");
  } finally {
    release?.();
    globalThis.fetch = originalFetch;
    if (originalWindow === undefined) delete globalThis.window; else globalThis.window = originalWindow;
  }
});

test("an incomplete stream reports lost transfer without replacing the previous memory", async () => {
  const originalWindow = globalThis.window, originalFetch = globalThis.fetch;
  try {
    const page = await pageSession(new Map());
    globalThis.fetch = async () => new Response('{"memorySnapshot":"unchanged-state"}');
    await page.memoryRequest("/save", { workspaceId: "w" });
    globalThis.fetch = async () => new Response('{"progress":{"id":"job","state":"running"}}\n',
      { headers: { "Content-Type": "application/x-ndjson" } });
    await assert.rejects(page.memoryRequest("/run", { workspaceId: "w" }), /before returning/);
    assert.match(page.useMemoryError("w"), /previous snapshot is retained/);
    assert.equal(page.useMemoryError("other-workspace"), page.useMemoryError("w"));
    globalThis.fetch = async () => new Response('{"memorySnapshot":"unchanged-state"}');
    await page.memoryRequest("/save", { workspaceId: "w" });
    assert.equal(page.useMemoryError("w"), null);
    page.rotateMemorySession();
    assert.equal(page.useMemoryError("w"), null);
  } finally {
    globalThis.fetch = originalFetch;
    if (originalWindow === undefined) delete globalThis.window; else globalThis.window = originalWindow;
  }
});
