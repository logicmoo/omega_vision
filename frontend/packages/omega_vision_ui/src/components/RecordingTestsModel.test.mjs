import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import { stripTypeScriptTypes } from "node:module";
import test from "node:test";
import { runInNewContext } from "node:vm";
import {
  filterRecordingTests, loadRecordingTestDetail, loadRecordingTestFrames, loadRecordingTests,
  parseRecordingTestDetail, parseRecordingTests,
} from "./RecordingTestsModel.ts";

const recording = { visualSequenceId: "recordings/events_tests/moved", label: "Moved", partition: "example", frameCount: 2 };
const entry = { id: "moved", group: "Events", title: "Moved", summary: "Compare prior local memory.",
  executionStatus: "not_run", recordings: [recording] };

test("catalog requires real recording refs, explicit not-run state, unique IDs and counts", () => {
  assert.deepEqual(parseRecordingTests({ tests: [entry], count: 1 }), [entry]);
  for (const value of [
    { tests: [entry], count: 0 }, { tests: [entry, entry], count: 2 },
    { tests: [{ ...entry, executionStatus: "passed" }], count: 1 },
    { tests: [{ ...entry, recordings: [] }], count: 1 },
    { tests: [{ ...entry, recordings: [recording, recording] }], count: 1 },
    { tests: [{ ...entry, recordings: [{ ...recording, visualSequenceId: "recordings/../private" }] }], count: 1 },
    { tests: [{ ...entry, recordings: [{ ...recording, frameCount: 0 }] }], count: 1 },
  ]) assert.throws(() => parseRecordingTests(value), /invalid/);
});

test("documentation must belong to the requested test and cannot be empty", () => {
  const detail = { ...entry, documentation: "# Memory\nRemember the previous position." };
  assert.deepEqual(parseRecordingTestDetail(detail, "moved"), detail);
  assert.throws(() => parseRecordingTestDetail(detail, "rotated"), /does not match/);
  assert.throws(() => parseRecordingTestDetail({ ...detail, documentation: "" }, "moved"), /does not match/);
});

test("loading metadata and docs uses read-only no-store requests and propagates cancellation", async () => {
  const calls = [];
  const controller = new AbortController();
  const transport = async (url, init) => {
    calls.push({ url, init });
    return Response.json(url.includes("/moved?") ? { ...entry, documentation: "Memory" } : { tests: [entry], count: 1 });
  };
  await loadRecordingTests("arc3_random_player", controller.signal, transport);
  await loadRecordingTestDetail("arc3_random_player", "moved", controller.signal, transport);
  assert.equal(calls.length, 2);
  assert.ok(calls.every(({ init }) => !init.method && init.cache === "no-store" && init.signal === controller.signal));
  await assert.rejects(loadRecordingTestDetail("arc3_random_player", "../other", undefined, transport), /Invalid/);
  await assert.rejects(loadRecordingTests("arc3_random_player", undefined, async () => new Response("", { status: 503 })), /503/);
});

test("frame preview pages exact numbered images without changing selection or running stages", async () => {
  const calls = [];
  const transport = async (url, init) => {
    calls.push({ url, init });
    const offset = Number(new URL(url, "http://local").searchParams.get("offset"));
    return Response.json({ sequenceId: `data/${recording.visualSequenceId}`, total: 2, offset,
      frames: [{ path: `data/${recording.visualSequenceId}/${offset}/image.png`, label: `${offset}/image.png` }] });
  };
  const frames = await loadRecordingTestFrames("arc3_random_player", recording, undefined, transport);
  assert.deepEqual(frames.map(frame => frame.label), ["0/image.png", "1/image.png"]);
  assert.equal(calls.length, 2);
  assert.ok(calls.every(call => call.url.includes("preprocessing-frames?") && !call.init.method));
});

test("frame preview rejects stale counts, sources, gaps and out-of-root image paths", async () => {
  const good = { sequenceId: `data/${recording.visualSequenceId}`, total: 2, offset: 0,
    frames: [{ path: `data/${recording.visualSequenceId}/0/image.png`, label: "0" }] };
  for (const bad of [
    { ...good, total: 1 }, { ...good, sequenceId: "data/recordings/another" },
    { ...good, offset: 1 }, { ...good, frames: [] },
    { ...good, frames: [{ path: "data/preferences/private.json", label: "wrong" }] },
    { ...good, frames: [{ path: `data/${recording.visualSequenceId}/1/image.png`, label: "gap" }] },
  ]) await assert.rejects(loadRecordingTestFrames("arc3_random_player", recording, undefined, async () => Response.json(bad)));
});

test("filtering works across test titles, names, descriptions and families", () => {
  const plate = { ...entry, id: "plate_momentary", group: "Pressure plates", title: "Momentary plate" };
  assert.deepEqual(filterRecordingTests([entry, plate], "Pressure plates", "local memory"), [plate]);
  assert.deepEqual(filterRecordingTests([entry, plate], "All", "moved"), [entry]);
  assert.deepEqual(filterRecordingTests([entry], "All", "absent"), []);
});

test("active Sanity Tests retains old demos and adds per-test docs, frames and explicit shared loading", () => {
  const source = name => readFileSync(new URL(name, import.meta.url), "utf8");
  const ui = source("./RecordingTests.tsx");
  const demos = source("./RecognitionDemosPage.tsx");
  assert.match(demos, /<RecordingTests workspaceId=\{workspaceId\}/);
  assert.match(demos, /<DemoCard/);
  assert.match(demos, /<CoverageSection/);
  assert.match(ui, /<MarkdownDocument content=\{detail.documentation\}/);
  assert.match(ui, /loadRecordingTestDetail/);
  assert.match(ui, /loadRecordingTestFrames/);
  assert.match(ui, /selection.select\(entry.id\)/);
  assert.match(ui, /loadVisualSequenceCatalog\(workspaceId\)/);
  assert.doesNotMatch(ui, /loadVisualSequenceCatalog\(workspaceId,\s*true\)/);
  assert.match(ui, /requiresVisualSequenceConfirmation/);
  assert.match(ui, /if \(!active.current \|\| !saved\) return/);
  assert.match(ui, /new PopStateEvent/);
  assert.match(ui, /Previous frame/);
  assert.match(ui, /Next frame/);
  assert.doesNotMatch(ui, /localStorage|sessionStorage|cmd: ["']run|direct-calls|method: ["']POST/);
});

test("sequence-scoped Demo/Test controls are opt-in while standalone controls remain available", () => {
  const ui = readFileSync(new URL("./RecordingTests.tsx", import.meta.url), "utf8");
  assert.match(ui, /useState\(!visualSequenceId\)/);
  assert.match(ui, /setControlsVisible\(value => !value\)/);
  assert.match(ui, /"Hide controls" : "Add controls"/);
  assert.match(ui, /controlsVisible && frame && <div className="recording-test-frame-controls"/);
  assert.match(ui, /controlsVisible && <div className="recording-test-open"/);
  assert.match(ui, /controlsVisible && <div className="recording-tests-toolbar"/);
  assert.match(ui, /<MarkdownDocument content=\{detail.documentation\}/);
});

test("the combined demo leads with one player and compact runtime output, leaving documentation on the right", () => {
  const read = path => readFileSync(new URL(path, import.meta.url), "utf8");
  const demo = read("./VisualSequenceDemoView.tsx");
  const ui = read("./RecordingTests.tsx");
  assert.match(demo, /useState\(false\)/);
  assert.match(demo, /aria-expanded=\{controlsVisible\} aria-controls=\{playerId\}/);
  assert.match(demo, /<Arc3VisualSequencePlayer[\s\S]*?controlsVisible=\{controlsVisible\}/);
  assert.match(demo, /renderTestResults && <RecordingTests[\s\S]*?showRecordingPreview=\{false\}[\s\S]*?presentation="runtime"/);
  assert.equal((demo.match(/<Arc3VisualSequencePlayer /g) || []).length, 1);
  assert.doesNotMatch(demo, /MarkdownDocument|fetch\(|setInterval|\.select\(|localStorage|\/arc3\/|method:\s*["']POST/);
  assert.doesNotMatch(demo, /presentation="summary"/);
  assert.ok(demo.indexOf("<SpotlightResults") < demo.indexOf('className="visual-sequence-demo-player"'));
  const runtime = ui.slice(ui.indexOf('if (presentation === "runtime")'), ui.indexOf('if (presentation === "summary")'));
  assert.match(runtime, /renderResults\?\.\(test\)/);
  assert.doesNotMatch(runtime, /test.summary|test.title|No registered|TestDocumentation|RecordingPreview|MarkdownDocument|Tests &amp;/);
  const compact = read("./SpotlightDemo.tsx").split("export function SpotlightResults")[1];
  assert.match(compact, /spotlight-runtime-strip/);
  assert.match(compact, /Native proof \/ report/);
  assert.doesNotMatch(compact, /<h[1-6]|No fog execution|These are test inputs|className="arc3-visual-sequence-note"/);
  const summary = ui.slice(ui.indexOf('if (presentation === "summary")'), ui.indexOf("const documentationOnly"));
  assert.match(summary, /No registered test definition/);
  assert.match(summary, /Not run/);
  assert.match(summary, /renderResults\?\.\(test\)/);
  assert.match(summary, /right-hand Documentation panel/);
  assert.doesNotMatch(summary, /TestDocumentation|RecordingPreview|MarkdownDocument|Find a test/);
  assert.match(ui, /showRecordingPreview=\{showRecordingPreview && !documentationOnly\}/);
});

test("right documentation follows shared selection without catalog enumeration or overriding manual tabs", () => {
  const read = path => readFileSync(new URL(path, import.meta.url), "utf8");
  const help = read("../../../../apps/workbench/src/components/HelpDocumentTabs.tsx");
  const shell = read("../../../../apps/workbench/src/pages/FilesystemWorkbenchPage.tsx");
  const selectionHook = read("./useSharedVisualSequenceSelection.ts").split("export function useVisualSequenceCatalog")[0];
  assert.match(shell, /sequenceWorkspaceId=\{pageVisible && \(view === "visualSequences" \|\| \(view === "videoImport" && activeNavSubview === "recognition"\)\) \? workspace.id : undefined\}/);
  assert.match(help, /id:"selectedSequence",label:"Selected Sequence"/);
  assert.match(help, /id:"recognition",label:"Recognition & Memory"/);
  assert.match(help, /sequenceDemoActive=Boolean\(sequenceWorkspaceId\)&&sequenceTab==="test-demo"/);
  assert.match(help, /const next=sequenceDemoActive\?"selectedSequence":effectivePreferred/);
  assert.match(help, /\[effectivePreferred,pluginDocId,sequenceDemoActive\]/);
  assert.match(help, /onClick=\{\(\)=>\{setActive\(item.id\);setOpened\(null\);setHistory\(\[\]\)/);
  assert.match(help, /active==="selectedSequence"&&sequenceWorkspaceId/);
  assert.match(help, /visualSequenceId=\{sequenceSelection.visualSequenceId\} presentation="documentation"/);
  assert.match(help, /key=\{`\$\{sequenceWorkspaceId\}:\$\{sequenceSelection.visualSequenceId\}`\}/);
  assert.match(help, /SEQUENCE_VIEW_CHANGED_EVENT,update/);
  assert.match(help, /removeEventListener\("popstate",update\)/);
  assert.match(help, /Retry selection/);
  assert.doesNotMatch(help, /loadVisualSequenceCatalog|useVisualSequenceCatalog|\.select\(|method:\s*["'](?:POST|PUT|PATCH|DELETE)/);
  assert.doesNotMatch(selectionHook, /loadVisualSequenceCatalog\(/);
  assert.match(help, /<MarkdownDocument content=\{document.content\} onOpenDocs=\{onOpenDocs\} onNavigateMarkdown=/);
});

function componentLoadEffect(name, context) {
  const ui = readFileSync(new URL("./RecordingTests.tsx", import.meta.url), "utf8");
  const start = ui.indexOf("useEffect(() => {", ui.indexOf(`function ${name}(`)) + "useEffect(".length;
  const end = ui.indexOf("}, [workspaceId,", start) + 1;
  assert.ok(start > 0 && end > start);
  return runInNewContext(stripTypeScriptTypes(`(${ui.slice(start, end)})()`), { AbortController, ...context });
}

const settle = () => new Promise(resolve => setImmediate(resolve));
function indexState(visualSequenceId, transport, workspaceId = "arc3_random_player") {
  const state = { tests: [], expanded: null, error: "", loading: true };
  const dispose = componentLoadEffect("RecordingTestsSession", {
    workspaceId, visualSequenceId, presentation: "documentation",
    setTests: value => { state.tests = value; }, setExpanded: value => { state.expanded = value; },
    setError: value => { state.error = value; }, setLoading: value => { state.loading = value; },
    loadRecordingTests: (workspace, signal) => loadRecordingTests(workspace, signal, transport),
  });
  return { state, dispose };
}

test("the actual documentation-index effect scopes exact sequence membership and handles unregistered sources", async () => {
  const calls = [];
  const other = { ...entry, id: "other", recordings: [{ ...recording, visualSequenceId: `${recording.visualSequenceId}_other` }] };
  const transport = async (url, init) => { calls.push({ url, init }); return Response.json({ tests: [entry, other], count: 2 }); };
  const selected = indexState(recording.visualSequenceId, transport);
  await settle();
  assert.deepEqual(selected.state.tests.map(test => test.id), ["moved"]);
  assert.equal(selected.state.expanded, "moved");
  assert.equal(selected.state.loading, false);
  selected.dispose();
  const unregistered = indexState("curated/spotlight", transport);
  await settle();
  assert.equal(unregistered.state.tests.length, 0);
  assert.equal(unregistered.state.error, "");
  assert.equal(unregistered.state.loading, false);
  unregistered.dispose();
  const missing = indexState("", transport);
  assert.equal(missing.state.loading, false);
  assert.equal(calls.length, 2);
  assert.ok(calls.every(({ url, init }) => url.includes("/recording-tests?") && !init.method));
});

test("actual index effects reject stale workspace/sequence responses even after slow JSON ignores abort", async () => {
  for (const changed of ["workspace", "sequence"]) {
    let finish;
    let signal;
    const pending = new Promise(resolve => { finish = resolve; });
    const old = indexState(recording.visualSequenceId, async (_url, init) => {
      signal = init.signal;
      return { ok: true, json: () => pending };
    });
    await settle();
    old.dispose();
    assert.equal(signal.aborted, true);
    const current = indexState(changed === "sequence" ? "curated/spotlight" : recording.visualSequenceId,
      async () => Response.json({ tests: [entry], count: 1 }), changed === "workspace" ? "another_workspace" : "arc3_random_player");
    await settle();
    finish({ tests: [entry], count: 1 });
    await settle();
    assert.equal(old.state.tests.length, 0);
    assert.equal(current.state.tests.length, changed === "sequence" ? 0 : 1);
    current.dispose();
  }
});

test("actual detail effects reject changed membership, handle failure and ignore late documentation", async () => {
  for (const mode of ["membership", "error", "stale"]) {
    const state = { detail: null, error: "", recordingId: "" };
    let finish;
    const pending = new Promise(resolve => { finish = resolve; });
    const dispose = componentLoadEffect("TestDocumentation", {
      workspaceId: "arc3_random_player", visualSequenceId: recording.visualSequenceId, test: entry,
      setDetail: value => { state.detail = value; }, setError: value => { state.error = value; },
      setRecordingId: value => { state.recordingId = value; },
      loadRecordingTestDetail: (workspace, id, signal) => loadRecordingTestDetail(workspace, id, signal,
        async () => mode === "error" ? new Response("", { status: 503 }) : { ok: true, json: () => pending }),
    });
    await settle();
    if (mode === "stale") dispose();
    finish({ ...entry, documentation: "# Real stored documentation",
      recordings: mode === "membership" ? [{ ...recording, visualSequenceId: "recordings/events_tests/other" }] : [recording] });
    await settle();
    assert.equal(state.detail, null);
    assert.match(state.error, mode === "membership" ? /no longer refers/ : mode === "error" ? /503/ : /^$/);
    dispose();
  }
});
