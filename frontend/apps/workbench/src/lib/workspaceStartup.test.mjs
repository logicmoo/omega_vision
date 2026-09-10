import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import { stripTypeScriptTypes } from "node:module";
import test from "node:test";
import { parse } from "@babel/parser";

const read = relative => readFileSync(new URL(relative, import.meta.url), "utf8");
const shell = read("../pages/FilesystemWorkbenchPage.tsx");
const settings = read("../components/MenuVisibilitySettings.tsx");
const ast = source => parse(source, { sourceType: "module", plugins: ["typescript", "jsx"] });
const shellTree = ast(shell);
const settingsTree = ast(settings);
const walk = (node, visit) => {
  if (!node || typeof node !== "object") return;
  visit(node);
  for (const value of Object.values(node)) {
    if (Array.isArray(value)) value.forEach(item => walk(item, visit));
    else if (value && typeof value === "object") walk(value, visit);
  }
};
function expression(node, source, bindings) {
  assert.ok(node, "the production expression exists");
  const code = stripTypeScriptTypes(`const extracted = ${source.slice(node.start, node.end)};`);
  return Function(...Object.keys(bindings), `${code}\nreturn extracted;`)(...Object.values(bindings));
}
function actual(name, bindings, tree = shellTree, source = shell) {
  let initializer;
  walk(tree, node => {
    if (node.type === "VariableDeclarator" && node.id.name === name) initializer = node.init;
  });
  return expression(initializer, source, bindings);
}
const settle = () => new Promise(resolve => setImmediate(resolve));
const deferred = () => {
  let resolve, reject;
  const promise = new Promise((yes, no) => { resolve = yes; reject = no; });
  return { promise, resolve, reject };
};

function harness(options = {}) {
  const preferences = { redirectDefaultWorkspaceToArc3: options.redirect !== false };
  let location = new URL(options.url || "http://localhost/?view=videoImport&game=ls20");
  const historyWrites = [];
  const reads = [];
  const errors = [];
  const state = { workspace: options.active ? { id: options.active, label: options.active } : null, draft: "{ unfinished", busy: false, view: "operations" };
  const window = {
    location: { get href() { return location.href; }, get search() { return location.search; } },
    history: {
      state: { preserved: "history-entry" },
      replaceState(value, title, url) {
        historyWrites.push(url);
        this.state = value;
        location = new URL(url, location);
      },
    },
    confirm: () => options.confirm !== false,
  };
  const functions = {};
  const names = [
    "workspaceIdForNavigation", "workspaceFromLocation", "canonicalizeWorkspaceLocation",
    "workspaceOpeningViewFromLocation", "workflowFromLocation", "llmsPageFromLocation",
    "perform", "loadWorkspaceById", "loadWorkspace", "loadRequestedWorkspace",
    "closeWorkspace", "closeWorkspaceChooser", "switchToWorkspace", "restoreLocation",
  ];
  const bindings = {
    window, URL, URLSearchParams,
    localStorage: { getItem() { throw new Error("Last-workspace storage must not select the workspace"); } },
    readUserUiPreferences: () => preferences,
    useRef: value => ({ current: value }),
    requestedWorkspace: { current: null },
    currentWorkspaceId: { current: options.active || null },
    loadingWorkspaceId: { current: null },
    workspaceLoadGeneration: { current: 0 },
    retainedPageUrl: { current: location.href },
    preChooserView: { current: "operations" },
    workspace: state.workspace,
    workspaces: options.workspaces || ["arc3_random_player", "default", "other", "alpha"].map(id => ({ id, label: id })),
    workspaceResourceCountingEnabled: false, busy: false, run: null,
    WORKBENCH_VIEWS: new Set(["overview", "setup", "videoImport", "operations", "changeWorkspace"]),
    viewFromLocation: () => location.searchParams.get("view"),
    resolveWorkspaceOpeningPage: () => "setup",
    resolveVideoImportShellDestination: () => ({ subview: location.searchParams.get("subview") || "sources" }),
    allowLeavingRetainedPage: () => options.allowNavigation !== false,
    rememberWorkspaceId() {}, forgetWorkspaceId() {},
    setWorkspace: value => { state.workspace = value; },
    setWorkflowSource: value => { state.draft = value; },
    setViewState: value => { state.view = value; },
    setBusy: value => { state.busy = value; },
    setError: value => { if (value) errors.push(value); },
    request: async (path, init) => {
      assert.equal(init?.method || "GET", "GET", "workspace restoration must only read");
      reads.push(path);
      const match = path.match(/^\/workbench\/workspaces\/([^/]+)\/snapshot/);
      if (match) {
        const id = decodeURIComponent(match[1]);
        await options.onSnapshot?.(id);
        return { workspace: { id: options.returnedId || id }, workflows: [] };
      }
      return {};
    },
    engine: async (path, init) => {
      assert.equal(init?.method || "GET", "GET");
      reads.push(`/engine${path}`);
      return {};
    },
  };
  for (const name of [
    "setSnapshot", "setImplementations", "setOperationLibrary", "setWorkflowRunnerModels",
    "setWorkflowPath", "setRunInputs", "setSelectedStepId", "setRun", "setSelectedArtifactId",
    "setValidation", "setCapabilities", "setWorkspaces", "setLlmsTopMenuMode", "setActiveNavSubview", "setPluginPage",
  ]) bindings[name] = () => {};
  for (const name of names) bindings[name] = (...args) => functions[name](...args);
  for (const name of names) functions[name] = actual(name, bindings);
  bindings.requestedWorkspace.current = actual("requestedWorkspace", bindings).current;
  return {
    ...functions, preferences, bindings, window, state, reads, errors, historyWrites,
    navigate(url) { location = new URL(url, location); },
    history(url) {
      location = new URL(url, location);
      functions.restoreLocation({ stopImmediatePropagation() {} });
    },
    toggle(value) {
      let handler;
      walk(settingsTree, node => {
        if (node.type !== "JSXOpeningElement") return;
        const checked = node.attributes.find(attribute => attribute.name?.name === "checked");
        if (checked?.value?.expression?.property?.name !== "redirectDefaultWorkspaceToArc3") return;
        handler = node.attributes.find(attribute => attribute.name?.name === "onChange")?.value?.expression;
      });
      expression(handler, settings, { update: patch => Object.assign(preferences, patch) })({ target: { checked: value } });
    },
  };
}

test("omitted workspace selects ARC3 independently of the alias setting or remembered workspace", () => {
  for (const redirect of [true, false]) {
    const app = harness({ redirect });
    assert.equal(app.workspaceFromLocation(), "arc3_random_player");
    assert.equal(app.bindings.requestedWorkspace.current.id, "arc3_random_player");
  }
});

test("only the literal default alias is preference-controlled; other explicit values remain explicit", () => {
  for (const redirect of [true, false]) for (const supplied of ["default", "other", "missing-workspace", "", " ", "DEFAULT"]) {
    const app = harness({ redirect, url: `http://localhost/?workspace=${encodeURIComponent(supplied)}` });
    assert.equal(app.workspaceFromLocation(), supplied.trim() === "default" && redirect ? "arc3_random_player" : supplied.trim());
  }
});

test("startup canonicalizes only the effective workspace, preserving selection, hash and history state", async () => {
  for (const query of ["", "workspace=default&"]) {
    const app = harness({ url: `http://localhost/?${query}view=videoImport&subview=sources&gen=1&game=ls20&recording=real-id&nav=frames#selected` });
    const before = new URL(app.window.location.href);
    app.loadRequestedWorkspace();
    await settle();
    const after = new URL(app.window.location.href);
    assert.equal(after.searchParams.get("workspace"), "arc3_random_player");
    before.searchParams.delete("workspace");
    after.searchParams.delete("workspace");
    assert.equal(after.href, before.href);
    assert.deepEqual(app.window.history.state, { preserved: "history-entry" });
    assert.equal(app.state.workspace.id, "arc3_random_player");
    assert.equal(app.reads.some(path => /import-recording|\/sessions|\/replay|\/execute/.test(path)), false);
    app.loadRequestedWorkspace();
    assert.equal(app.historyWrites.length, 1, "no redirect loop on catalog refresh");
  }
});

test("blank and unknown explicit IDs show errors without default substitution or URL changes", async () => {
  for (const supplied of ["", " ", "not-a-workspace"]) {
    const app = harness({ url: `http://localhost/?workspace=${encodeURIComponent(supplied)}&game=ls20#keep` });
    const before = app.window.location.href;
    app.loadRequestedWorkspace();
    await settle();
    assert.equal(app.reads.length, 0);
    assert.equal(app.errors.length, 1);
    assert.equal(app.window.location.href, before);
    assert.equal(app.state.workspace, null);
    assert.equal(app.state.draft, "{ unfinished");
  }
});

test("explicit default loads the actual default workspace when the persisted preference is off", async () => {
  const app = harness({ redirect: false, url: "http://localhost/?workspace=default&view=operations" });
  app.loadRequestedWorkspace();
  await settle();
  assert.equal(app.state.workspace.id, "default");
  assert.equal(app.historyWrites.length, 0);
});

test("the actual checkbox never reinterprets an active editor, including later catalog refreshes", async () => {
  for (const redirect of [true, false]) {
    const active = redirect ? "arc3_random_player" : "default";
    const app = harness({ redirect, active, url: `http://localhost/?workspace=${active}&view=operations#draft` });
    const before = app.window.location.href;
    app.toggle(!redirect);
    app.loadRequestedWorkspace();
    await settle();
    assert.equal(app.preferences.redirectDefaultWorkspaceToArc3, !redirect);
    assert.equal(app.state.workspace.id, active);
    assert.equal(app.state.draft, "{ unfinished");
    assert.equal(app.window.location.href, before);
    assert.equal(app.reads.length, 0);
  }
});

test("back/forward samples the current preference and canonicalizes even an already-active target", async () => {
  const app = harness({ active: "arc3_random_player", url: "http://localhost/?workspace=arc3_random_player&view=operations" });
  const destination = "http://localhost/?workspace=default&view=operations&game=ls20#retain";
  app.history(destination);
  assert.equal(new URL(app.window.location.href).searchParams.get("workspace"), "arc3_random_player");
  assert.equal(app.reads.length, 0);
  assert.equal(app.state.draft, "{ unfinished");
  app.toggle(false);
  app.history(destination);
  await settle();
  assert.equal(app.state.workspace.id, "default");
  assert.equal(app.window.location.href, destination);
  app.toggle(true);
  app.history(destination);
  await settle();
  assert.equal(app.state.workspace.id, "arc3_random_player");
  assert.equal(new URL(app.window.location.href).hash, "#retain");
});

test("rejected retained-page navigation leaves the request and dirty editor intact", () => {
  const app = harness({ active: "other", allowNavigation: false, url: "http://localhost/?workspace=other&view=operations#dirty" });
  const before = app.window.location.href;
  app.history("http://localhost/?workspace=default&view=videoImport");
  assert.equal(app.bindings.requestedWorkspace.current.id, "other");
  assert.equal(app.window.location.href, before);
  assert.equal(app.state.draft, "{ unfinished");
  assert.equal(app.reads.length, 0);
});

test("workspace chooser uses the same alias and preserves same-target drafts", async () => {
  const current = harness({ active: "arc3_random_player", url: "http://localhost/?workspace=arc3_random_player&view=changeWorkspace" });
  current.switchToWorkspace({ id: "default", label: "Default" });
  assert.equal(current.reads.length, 0);
  assert.equal(current.state.draft, "{ unfinished");
  for (const redirect of [true, false]) {
    const app = harness({ redirect });
    await app.loadWorkspace({ id: "default", label: "Default" });
    assert.equal(app.state.workspace.id, redirect ? "arc3_random_player" : "default");
  }
});

test("explicit close does not race a fresh implicit default load", async () => {
  const app = harness({ active: "other", url: "http://localhost/?workspace=other&view=operations" });
  app.closeWorkspace();
  app.loadRequestedWorkspace();
  await settle();
  assert.equal(app.state.workspace, null);
  assert.equal(app.bindings.requestedWorkspace.current, null);
  assert.equal(app.reads.length, 0);
});

test("failed requested loads report their error once, without retrying or falling back", async () => {
  const app = harness({
    url: "http://localhost/?workspace=other&view=operations",
    onSnapshot: () => { throw new Error("The selected workspace could not be read"); },
  });
  app.loadRequestedWorkspace();
  await settle();
  app.loadRequestedWorkspace();
  await settle();
  assert.deepEqual(app.errors, ["The selected workspace could not be read"]);
  assert.equal(app.reads.filter(path => path.includes("/snapshot")).length, 1);
  assert.equal(app.state.workspace, null);
  assert.equal(app.state.busy, false);
});

test("a newer history request wins over an in-flight startup load without losing its URL", async () => {
  const pending = deferred();
  const app = harness({ onSnapshot: id => id === "arc3_random_player" ? pending.promise : undefined });
  app.loadRequestedWorkspace();
  app.history("http://localhost/?workspace=other&view=operations&game=ls20#new");
  pending.resolve();
  await settle();
  assert.equal(app.state.workspace.id, "other");
  assert.equal(app.window.location.href, "http://localhost/?workspace=other&view=operations&game=ls20#new");
  assert.equal(app.reads.filter(path => path.includes("/snapshot")).length, 2);
});

test("old success or failure cannot overwrite a newer explicit load or its busy/error state", async () => {
  for (const fail of [false, true]) {
    const first = deferred();
    const second = deferred();
    const app = harness({ onSnapshot: id => id === "alpha" ? first.promise : second.promise });
    const older = app.loadWorkspace({ id: "alpha" });
    const newer = app.loadWorkspace({ id: "other" });
    if (fail) first.reject(new Error("obsolete failure"));
    else first.resolve();
    await older;
    assert.equal(app.state.busy, true);
    assert.equal(app.errors.length, 0);
    assert.equal(app.state.workspace, null);
    second.resolve();
    await newer;
    assert.equal(app.state.workspace.id, "other");
    assert.equal(app.state.busy, false);
    assert.equal(app.bindings.loadingWorkspaceId.current, null);
  }
});

test("a backend workspace identity mismatch is an error, never an alias fallback", async () => {
  const app = harness({ url: "http://localhost/?workspace=other", returnedId: "arc3_random_player" });
  app.loadRequestedWorkspace();
  await settle();
  assert.equal(app.state.workspace, null);
  assert.match(app.errors[0], /does not match/);
  assert.equal(new URL(app.window.location.href).searchParams.get("workspace"), "other");
});

test("an explicit retry may reload a failed workspace, but a blank manual request cannot call the backend", async () => {
  let fail = true;
  const app = harness({
    url: "http://localhost/?workspace=other",
    onSnapshot: () => { if (fail) throw new Error("temporarily unavailable"); },
  });
  app.loadRequestedWorkspace();
  await settle();
  fail = false;
  app.history(app.window.location.href);
  await settle();
  assert.equal(app.state.workspace.id, "other");
  const blank = harness();
  await blank.loadWorkspace({ id: "" });
  assert.equal(blank.reads.length, 0);
  assert.match(blank.errors[0], /workspace ID is required/);
});

test("the default redirect checkbox is in the common Settings component with browser-only preference persistence", () => {
  assert.match(settings, /Redirect default workspace to ARC3 Random Player/);
  assert.match(settings, /update\(\{ redirectDefaultWorkspaceToArc3: event\.target\.checked \}\)/);
  assert.match(read("../components/WorkspaceSettingsPanel.tsx"), /<MenuVisibilitySettings\s*\/>/);
  assert.match(read("../components/MenuVisibilityBoundary.tsx"), /<MenuVisibilitySettings\s*\/>/);
  assert.match(shell, /<MenuVisibilityDialog\s/);
  assert.doesNotMatch(settings, /location\.(?:assign|replace)|loadWorkspace|startSession|importRecording/);
});
