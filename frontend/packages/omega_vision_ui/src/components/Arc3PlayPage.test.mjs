import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import { createRequire, stripTypeScriptTypes } from "node:module";
import { pathToFileURL } from "node:url";
import test from "node:test";
import { filterRecordingRows, parseRecordingStats, recordingCanReplay, recordingRows } from "./Arc3RecordingCatalog.ts";

const require = createRequire(new URL("../../../../apps/workbench/package.json", import.meta.url));
const { parse } = await import(pathToFileURL(require.resolve("@babel/parser")).href);
const read = path => readFileSync(new URL(path, import.meta.url), "utf8");
const source = read("./Arc3PlayPage.tsx");
const ast = parse(source, { sourceType: "module", plugins: ["typescript", "jsx"] });
const component = ast.program.body.find(node => node.declaration?.id?.name === "Arc3PlayPage").declaration;
const definitions = new Map(component.body.body.flatMap(node => node.type === "VariableDeclaration"
  ? node.declarations.filter(item => item.id.type === "Identifier").map(item => [item.id.name, item.init])
  : []));
function nodes(root, predicate) {
  const found = [];
  const walk = node => {
    if (!node || typeof node !== "object") return;
    if (Array.isArray(node)) { node.forEach(walk); return; }
    if (predicate(node)) found.push(node);
    Object.values(node).forEach(walk);
  };
  walk(root);
  return found;
}
const calls = node => nodes(node, item => item.type === "CallExpression");
const text = node => source.slice(node.start, node.end);
const evaluate = (node, scope) => new Function(...Object.keys(scope), `return (${stripTypeScriptTypes(text(node))});`)(...Object.values(scope));
const noop = () => {};

test("cold standalone/embedded URLs and restored navigation prefill selection without starting any work", () => {
  assert.doesNotMatch(source, /deepLinkHandledRef|deepLinkAttemptRef|autoResumeFromGameLink/);
  const start = source.indexOf("  const requestedGame =");
  const end = source.indexOf("\n  useEffect(", start);
  assert.ok(start >= 0 && end > start);
  const prefill = new Function("window", "workspaceId", "useContextReset", "setSelectedGameId", "setFilterGameId",
    "request", "perform", stripTypeScriptTypes(source.slice(start, end)));
  const hookSource = stripTypeScriptTypes(read("../../../../apps/workbench/src/lib/useContextReset.ts"))
    .replace(/^import[^\n]*\n/, "").replace("export function", "function");
  for (const query of [
    "?view=arc3Play&game=ls20", "?view=videoImport&subview=sources&game=ls20&recording=fixture",
    "?view=videoImport&subview=frames&game=ls20", "?view=arc3Play&game=ls20&nav=replay",
  ]) {
    const previous = { current: undefined };
    const useContextReset = new Function("useRef", "useEffect", `${hookSource}; return useContextReset;`)(
      () => previous, callback => callback(),
    );
    let selected = "", filter = "", writes = 0;
    const forbidden = () => { writes += 1; throw new Error("Restoration must not execute work"); };
    const restore = () => prefill({ location: { search: query } }, "caller-a", useContextReset,
      value => { selected = value; }, value => { filter = value; }, forbidden, forbidden);
    restore();
    assert.equal(selected, "ls20");
    assert.equal(filter, "ls20");
    selected = "user-selection";
    filter = "user-filter";
    restore(); // Same-context Activity/effect replay retains the user's edits.
    assert.equal(selected, "user-selection");
    assert.equal(filter, "user-filter");
    assert.equal(writes, 0);
  }
});

test("mount/context effects cannot invoke mutators; timed replay requires explicit retained user intent", () => {
  const isWrite = call => call.callee?.name === "request"
    && call.arguments[1]?.type === "ObjectExpression"
    && call.arguments[1].properties.some(property => property.key?.name === "method"
      && ["POST", "PUT", "PATCH", "DELETE"].includes(property.value?.value));
  const mutators = new Set([...definitions].filter(([, init]) => calls(init).some(isWrite)).map(([name]) => name));
  let previous;
  do {
    previous = mutators.size;
    for (const [name, init] of definitions) if (calls(init).some(call => mutators.has(call.callee?.name))) mutators.add(name);
  } while (previous !== mutators.size);
  assert.ok(mutators.has("startGame") && mutators.has("importRecording"));
  const effects = calls(component).filter(call => ["useEffect", "useContextReset"].includes(call.callee?.name));
  let replayEffect;
  for (const effect of effects) {
    assert.equal(calls(effect.arguments[0]).some(isWrite), false, text(effect));
    for (const call of calls(effect.arguments[0])) {
      if (mutators.has(call.callee?.name)) {
        assert.equal(call.callee.name, "stepReplay", `Unexpected effect-driven mutation: ${call.callee.name}`);
        replayEffect = effect.arguments[0];
      }
      if (call.callee?.name === "setReplayPlaying") assert.equal(call.arguments[0]?.value, false);
    }
  }
  assert.ok(replayEffect);
  assert.match(source, /\[replayPlaying, setReplayPlaying\] = useState\(false\)/);
  assert.match(source, /onClick=\{toggleReplay\}/);
  let timer, steps = 0;
  const scope = {
    replayPlaying: false, replayScript: [{ op: "step" }], busy: false, replayPos: 0,
    replaySpeedMs: 300, setReplayPlaying: noop, stepReplay: () => { steps += 1; },
    showSequencePlayer: false, storedViewActive: { current: false },
    pageLifecycle: { paused: false, suspensionEpoch: 0 }, replayIntentEpoch: { current: 0 },
    window: { setTimeout: callback => { timer = callback; return 1; }, clearTimeout: () => { timer = undefined; } },
  };
  evaluate(replayEffect, scope)();
  assert.equal(timer, undefined);
  const cleanup = evaluate(replayEffect, { ...scope, replayPlaying: true })();
  assert.equal(typeof timer, "function");
  timer();
  assert.equal(steps, 1);
  scope.pageLifecycle.suspensionEpoch += 1;
  timer(); // A delayed pre-hide timer cannot advance the game after reveal.
  assert.equal(steps, 1);
  cleanup();
  assert.equal(timer, undefined);
  let playing = true;
  evaluate(replayEffect, { ...scope, replayPlaying: true, setReplayPlaying: value => { playing = value; } })();
  assert.equal(playing, false);
  assert.equal(timer, undefined);
  evaluate(definitions.get("toggleReplay"), { ...scope, setReplayPlaying: update => { playing = update(playing); } })();
  assert.equal(playing, true);
  evaluate(replayEffect, { ...scope, replayPlaying: playing })();
  timer(); // A fresh explicit Watch action may continue at the retained position.
  assert.equal(steps, 2);
  const delayed = timer;
  let mode = false;
  evaluate(definitions.get("enterStoredFrameView"), {
    ...scope, setReplayPlaying: value => { playing = value; }, setShowSequencePlayer: value => { mode = value; },
  })();
  delayed();
  assert.equal(steps, 2, "A pending callback cannot advance the game after switching to stored frames");
  assert.equal(playing, false);
  assert.equal(mode, true);
  evaluate(replayEffect, { ...scope, showSequencePlayer: true, replayPlaying: true })();
  assert.match(source, /onClick=\{enterStoredFrameView\}>View selected recording/);
});

function actions(failure = "") {
  const requests = [], errors = [], sessions = [], scripts = [];
  const scope = {
    useCallback: callback => callback, session: null, workspaceId: "original-caller",
    sharedPerform: work => work(), setError: value => errors.push(value), setSession: value => sessions.push(value),
    request: async (path, init) => {
      requests.push({ path, init });
      if (failure) throw new Error(failure);
      if (path.includes("/savepoints/")) return { savepoint: { game_id: "ls20", replay_log: [{ op: "step", action: "ACTION1" }] } };
      if (path.endsWith("/import-recording")) return { imported: { moveCount: 1, gameDirectory: "ls20", state: "ready" } };
      return { session: { id: "manual-session", gameDirectory: "ls20", levelDir: "fixture-level" } };
    },
    setArmedAction: noop, setReplayScript: value => scripts.push(value), setReplayPlaying: noop,
    setReplayPos: noop, setImportNote: noop, loadSavepoints: async () => {},
    setLoadedSequence: noop, setShowSequencePlayer: noop,
  };
  scope.perform = evaluate(definitions.get("perform"), scope);
  return { requests, errors, sessions, scripts,
    start: evaluate(definitions.get("startGame"), scope),
    importRecording: evaluate(definitions.get("importRecording"), scope),
    load: evaluate(definitions.get("loadSavepoint"), scope) };
}

test("explicit Start alone creates the requested session with the original caller", async () => {
  const h = actions();
  assert.equal(h.requests.length, 0);
  await h.start("ls20");
  assert.equal(h.requests.length, 1);
  assert.equal(h.requests[0].path, "/workbench/arc3-play/sessions");
  assert.deepEqual(JSON.parse(h.requests[0].init.body), { workspaceId: "original-caller", gameId: "ls20" });
  assert.equal(h.sessions[0].id, "manual-session");
  assert.match(source, /onClick=\{\(\) => void startGame\(selectedGameId\)\}/);
});

test("explicit Import remains available without automatically creating a session", async () => {
  const h = actions();
  assert.equal(h.requests.length, 0);
  await h.importRecording({ path: "chosen-importable", name: "Chosen" });
  assert.equal(h.requests.length, 1);
  assert.equal(h.requests[0].path, "/workbench/arc3-play/import-recording");
  assert.deepEqual(JSON.parse(h.requests[0].init.body), { workspaceId: "original-caller", path: "chosen-importable" });
  assert.equal(h.sessions.length, 0);
  assert.match(source, /onClick=\{\(\) => void importRecording\(recording\)\}/);
});

test("explicit Load queues the real replay recipe without executing a move", async () => {
  const h = actions();
  await h.load({ id: "chosen-savepoint" });
  assert.equal(h.requests.filter(entry => entry.init?.method === "POST").length, 1);
  assert.ok(h.requests.some(entry => entry.path.endsWith("/sessions")));
  assert.equal(h.requests.some(entry => entry.path.endsWith("/action") || entry.path.endsWith("/reset")), false);
  assert.deepEqual(h.scripts, [[{ op: "step", action: "ACTION1" }]]);
});

test("explicit action errors retain the existing visible error path", async () => {
  const h = actions("import failed");
  await h.importRecording({ path: "chosen-importable", name: "Chosen" });
  assert.equal(h.requests.length, 1);
  assert.equal(h.errors.at(-1), "import failed");
  assert.equal(h.sessions.length, 0);
});

test("Recordings lists every shared sequence independently of game and savepoint loading", () => {
  const catalog = [
    { id: "recordings/events_tests/color_band_cycle_train_a", imageCount: 12, kind: "arc-recording", gameId: "events_tests", game: "events_tests" },
    { id: "curated/scene", imageCount: 3 },
    { id: "recordings/ls20/run", imageCount: 14, kind: "arc-recording", gameId: "ls20-9607627b", game: "ls20" },
    { id: "recordings/events_tests", imageCount: 3000 },
    { id: "video/legacy", imageCount: 8, readOnly: true },
  ];
  const rows = recordingRows(catalog);
  assert.equal(rows.length, catalog.length);
  assert.deepEqual(rows.map(row => row.path), catalog.map(entry => `data/${entry.id}`));
  assert.deepEqual(rows.map(row => row.canManage), [true, false, true, false, false]);
  assert.deepEqual(rows.map(row => recordingCanReplay(row, [{ game_id: "ls20-9607627b", short_id: "ls20" }])),
    [false, false, true, false, false]);
  assert.equal(filterRecordingRows(rows, "color band").length, 1);
  assert.equal(filterRecordingRows(rows, "").length, catalog.length);
  assert.match(text(definitions.get("loadRecordingDirs")), /loadVisualSequenceCatalog\(workspaceId, refresh\)/);
  assert.doesNotMatch(text(definitions.get("loadRecordingDirs")), /savepoints|recording-dirs|games|session/);
  assert.match(text(definitions.get("loadRecordingDirs")), /setRecordingCatalogError/);
  assert.doesNotMatch(text(definitions.get("filteredRecordingDirs")), /filterGameId|selectedGameId/);
  const effects = calls(component).filter(call => call.callee?.name === "useEffect");
  assert.ok(effects.some(effect => calls(effect.arguments[0]).some(call => call.callee?.name === "loadRecordingDirs")));
  assert.doesNotMatch(source, /Recording paths sometimes only appear once a game starts/);
  assert.match(source, /recordingCatalogLoading.*!recordingDirs\.length/);
});

test("disk statistics enrich rows but cannot replace sequence identity, counts or access", () => {
  const catalog = [{ id: "recordings/game/run", imageCount: 4, readOnly: true }];
  const stats = parseRecordingStats({ recordingDirs: [{
    path: "data/recordings/game/run", absolutePath: "C:\\shared\\run", hasManifest: true, sizeBytes: 2048,
    imageCount: 99, readOnly: false,
  }] });
  const row = recordingRows(catalog, stats)[0];
  assert.equal(row.sizeBytes, 2048);
  assert.equal(row.moveTotal, 4);
  assert.equal(row.readOnly, true);
  assert.equal(row.canManage, false);
  assert.throws(() => parseRecordingStats({}), /invalid/);
  assert.throws(() => parseRecordingStats({ recordingDirs: [{ path: "data/one", sizeBytes: -1 }] }), /invalid/);
});

test("explicit stored-frame Load selects the source but never creates, closes or steps a game", async () => {
  const row = recordingRows([{ id: "curated/scene", imageCount: 3 }])[0];
  const calls = [], loaded = [], modes = [];
  const scope = {
    visualSequenceLocationForEntry: () => ({ recording: "curated/scene" }),
    requiresVisualSequenceConfirmation: () => false, visualSequenceConfirmationMessage: () => "",
    window: { confirm: () => { throw new Error("Small sequence should not require confirmation"); } },
    sharedSequence: { select: async id => { calls.push(id); return true; } },
    currentWorkspace: { current: "arc3_random_player" }, workspaceId: "arc3_random_player",
    setSequenceLoading: noop, setRecordingCatalogError: noop, setArmedAction: noop,
    setReplayPlaying: noop, setLoadedSequence: value => loaded.push(value),
    setShowSequencePlayer: value => modes.push(value),
    enterStoredFrameView: () => modes.push(true),
    request: () => { throw new Error("Stored-frame loading must not call the game API"); },
    perform: () => { throw new Error("Stored-frame loading must not start a game task"); },
  };
  await evaluate(definitions.get("loadRecordingDirForStepping"), scope)(row);
  assert.deepEqual(calls, ["curated/scene"]);
  assert.deepEqual(loaded, [row.sequence]);
  assert.deepEqual(modes, [true]);
  loaded.length = 0;
  await evaluate(definitions.get("loadRecordingDirForStepping"), {
    ...scope, sharedSequence: { select: async () => false },
  })(row);
  assert.deepEqual(loaded, []);
  assert.match(source, /<Arc3VisualSequencePlayer/);
  assert.match(source, /session && !showSequencePlayer/);
});

test("deferred workflow initialization retains children on reveal but reinitializes real definition changes", () => {
  const host = read("../../../../apps/workbench/src/components/WorkflowPageHost.tsx");
  const start = host.indexOf("  useEffect(() => {");
  const end = host.indexOf("\n\n  if (definition.layout", start);
  assert.ok(start >= 0 && end > start);
  const run = new Function("useEffect", "deferComponentInitialization", "definition",
    "initializedContext", "setInitializationPassReady", "window", stripTypeScriptTypes(host.slice(start, end)));
  const initialized = { current: "" };
  const writes = [], frames = new Map();
  let next = 0;
  const window = {
    requestAnimationFrame: callback => { frames.set(++next, callback); return next; },
    cancelAnimationFrame: id => frames.delete(id),
  };
  const connect = id => {
    let effect;
    run(callback => { effect = callback; }, true, { id, renderer: "fixture" },
      initialized, value => writes.push(value), window);
    return effect();
  };
  const paint = () => { const pending = [...frames.values()]; frames.clear(); pending.forEach(callback => callback()); };
  let cleanup = connect("first");
  cleanup();
  assert.equal(frames.size, 0);
  cleanup = connect("first");
  paint();
  cleanup();
  const before = writes.length;
  connect("first");
  assert.equal(writes.length, before);
  assert.equal(frames.size, 0);
  connect("second");
  assert.equal(writes.at(-1), false);
  paint();
  assert.equal(writes.at(-1), true);
});
