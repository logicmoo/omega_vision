import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import { stripTypeScriptTypes } from "node:module";
import test from "node:test";
import { record, semanticJson, semanticUrl } from "./SemanticEventsModel.ts";

const source = readFileSync(new URL("./SemanticExecutionApi.ts", import.meta.url), "utf8");
const compiled = stripTypeScriptTypes(source.replace(/^import .*;\r?\n/gm, ""));
const host = readFileSync(new URL("../../../../apps/workbench/src/components/MemorySetupHost.tsx", import.meta.url), "utf8");
const session = readFileSync(new URL("../../../../apps/workbench/src/components/MemorySession.ts", import.meta.url), "utf8");
globalThis.semanticTransportTest = { record, semanticJson, semanticUrl,
  memoryRequest: (url, body, signal) => semanticJson(url, {
    method: "POST", signal, headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ ...body, memorySessionId: "page-session-only", memorySnapshot: null }),
  }) };
const { createSemanticExecutionApi, postSemanticMemoryAction } = await import(`data:text/javascript,${encodeURIComponent(
  `const {record, semanticJson, semanticUrl, memoryRequest} = globalThis.semanticTransportTest;\n${compiled}`,
)}`);
delete globalThis.semanticTransportTest;

test("memory refresh forces metadata rebuild while ordinary effects revalidate normally", () => {
  assert.match(host, /async function refresh\(force = false\)/);
  assert.match(host, /refresh: force/);
  assert.match(host, /onRefresh=\{\(\) => refresh\(true\)\}/);
  assert.match(host, /void refresh\(\)/);
});

test("inspector workspace reads do not await a sequence but save controls do", () => {
  assert.match(host, /sequenceId=\{sequenceReady \? props.sequenceId : ""\}/);
  assert.match(host, /\{sequenceReady && <MemorySetup /);
  assert.match(host, /disabled=\{!sequenceReady \|\| reading/);
  assert.match(host, /if \(sequenceReady && preferences\) await copy/);
  assert.match(host, /\{active && <ShapeObjectInspectorBrowser/);
  const page = readFileSync(new URL("./VideoImportPage.tsx", import.meta.url), "utf8");
  assert.match(page, /sequenceReady=\{visualSequenceReady && Boolean\(preprocSequenceId\)\}/);
  assert.match(page, /active=\{activeSubview === "sprite-view"\} \/>/);
});

test("semantic transport does not execute during construction and binds scope/session to confirmed calls", async () => {
  const original = globalThis.fetch;
  const requests = [];
  let flushes = 0;
  globalThis.fetch = async (url, init) => {
    requests.push({ url, ...init, body: init.body ? JSON.parse(init.body) : undefined });
    return new Response(JSON.stringify({ stageId: "events/prolog", confirmationKey: "server-plan" }));
  };
  try {
    const api = createSemanticExecutionApi(async () => { flushes += 1; });
    assert.equal(requests.length, 0);
    const context = { workspaceId: "workspace", sequenceId: "data/a", firstN: 2, modelId: "configured" };
    const signal = new AbortController().signal;
    const plan = await api.plan(context, "events/prolog", signal);
    await api.commit(context, plan, false, signal);
    assert.equal(flushes, 2);
    assert.equal(requests[0].cache, "no-store");
    assert.deepEqual(requests[1].body, { ...context, stageId: "events/prolog", run: false,
      confirmed: true, confirmationKey: "server-plan", memorySessionId: "page-session-only", memorySnapshot: null });
    assert.equal(requests[1].signal, signal);
  } finally { globalThis.fetch = original; }
});

test("partial or malformed execution data is not converted into empty success", async () => {
  const original = globalThis.fetch;
  globalThis.fetch = async () => new Response(JSON.stringify({ frames: [] }));
  try {
    await assert.rejects(createSemanticExecutionApi(async () => {}).read(
      { workspaceId: "w", sequenceId: "s", firstN: 1, modelId: "" }, new AbortController().signal,
    ), /missing stages/);
  } finally { globalThis.fetch = original; }
});

test("explicit replay, evaluation and deployment use the browser memory transport", async () => {
  const original = globalThis.fetch;
  const requests = [];
  globalThis.fetch = async (url, init) => {
    requests.push({ url, ...init, body: JSON.parse(init.body) });
    return new Response(JSON.stringify({ status: "accepted" }));
  };
  try {
    const signal = new AbortController().signal;
    const body = { workspaceId: "workspace", sequenceId: "held", trainingSequenceId: "train" };
    for (const path of ["/events/replay", "/candidates/a/evaluate", "/candidates/a/deployment"]) {
      assert.deepEqual(await postSemanticMemoryAction(path, body, signal), { status: "accepted" });
      const request = requests.at(-1);
      assert.equal(request.url, `/workbench/video-import/semantic${path}`);
      assert.equal(request.method, "POST");
      assert.equal(request.cache, "no-store");
      assert.equal(request.signal, signal);
      assert.deepEqual(request.body, { ...body, memorySessionId: "page-session-only", memorySnapshot: null });
    }
    const panel = readFileSync(new URL("./SemanticEventsPanel.tsx", import.meta.url), "utf8");
    assert.match(panel, /action === "evaluate" \|\| action === "deployment"\) return postSemanticMemoryAction/);
    assert.match(panel, /postSemanticMemoryAction\("\/events\/replay"/);
    assert.match(panel, /onCreateDeployment=\{\(body\) => void postCandidate\("deployment"/);
    assert.doesNotMatch(panel, /semanticJson\(semanticUrl\("\/events\/replay"/);
  } finally { globalThis.fetch = original; }
});

test("memory uses page-lifetime state, independent saved preferences and attributed revision inspection", () => {
  assert.doesNotMatch(session, /localStorage|sessionStorage|indexedDB|caches\./);
  assert.match(session, /crypto\.randomUUID/);
  assert.match(host, /cache: "no-store"/);
  assert.match(host, /expectedRevision/);
  assert.match(host, /preferences\[selected\.memoryKind\]\.saveTo/);
  assert.match(host, /item\.source\.providerRef === ref\.providerRef/);
  assert.match(host, /item\.source\.memoryLocationId === ref\.memoryLocationId/);
  assert.match(host, /item\.memoryKind === "shape"/);
  assert.doesNotMatch(host, /item\.source\.workspaceId === ref\.workspaceId/);
  assert.match(host, /item\.revision === ref\.revision/);
  assert.match(host, /signal\.aborted \|\| current !== readGeneration\.current/);
});

test("existing viewer is retained and one semantic panel opens in the Recognition canvas", () => {
  const page = readFileSync(new URL("./VideoImportPage.tsx", import.meta.url), "utf8");
  assert.match(page, /<SpriteViewerPage memorySetup={<MemorySetupHost/);
  assert.match(page, /<RecognitionTemporalCanvas[^>]*active=\{activeSubview === "recognition"\}/);
  assert.equal((page.match(/<SemanticEventsPanel\b/g) || []).length, 1);
  assert.match(page, /firstN={todoPreviewCount}/);
  assert.match(page, /onSelectFrame=\{\(frameId\) =>/);
  assert.match(page, /selectExtractionNavigationRow\(frameId, true\)/);
  assert.match(page, /data-frame-id=\{it\.id\}/);
});
