import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import { stripTypeScriptTypes } from "node:module";
import { pathToFileURL } from "node:url";
import { createRequire } from "node:module";
import test from "node:test";
import { parse } from "@babel/parser";
import {
  buildVisibilityMenu, DEFAULT_MENU_VISIBILITY, isMenuItemVisible, isMenuRouteVisible,
  menuItemForRoute, pageMenuId, parseMenuVisibility, pluginMenuId, workflowMenuId,
} from "./menuVisibility.ts";

const require = createRequire(import.meta.url);
const moduleUrl = source => `data:text/javascript;base64,${Buffer.from(source).toString("base64")}`;
const read = relative => readFileSync(new URL(relative, import.meta.url), "utf8");
const shell = read("../pages/FilesystemWorkbenchPage.tsx");
const sourceFile = parse(shell, { sourceType: "module", plugins: ["typescript", "jsx"] });
async function constant(name) {
  let initializer;
  sourceFile.program.body.forEach(statement => {
    const node = statement.type === "ExportNamedDeclaration" ? statement.declaration : statement;
    if (node?.type === "VariableDeclaration") {
      const declaration = node.declarations.find(item => item.id.type === "Identifier" && item.id.name === name);
      if (declaration) initializer = declaration.init;
    }
  });
  assert.ok(initializer, `${name} is the actual navigation registry`);
  const source = `import {pageMenuId} from ${JSON.stringify(new URL("./menuVisibility.ts", import.meta.url).href)};\nexport default ${shell.slice(initializer.start, initializer.end)};`;
  return (await import(moduleUrl(stripTypeScriptTypes(source)))).default;
}
const sections = await constant("NAVIGATION_V2");
const modelItems = await constant("MODEL_MENU_ITEMS");
const workflowItems = await constant("WORKFLOW_TOPBAR_ITEMS");
const registeredWorkflows = [
  { id: "vision-resource", routeView: "arc3Play", renderer: "arc3_play", label: "Duplicate" },
  { id: "custom-image", routeView: "visualImageDiff", renderer: "visual_image_diff", label: "Duplicate", menuGroup: "WORKFLOWS" },
];
const plugins = [
  { pluginId: "alpha", id: "status", label: "Duplicate", group: "OMEGA VISION" },
  { pluginId: "beta", id: "status", label: "Duplicate", group: "CUSTOM GROUP" },
];
const menu = buildVisibilityMenu([...sections, { group: "CAPABILITIES", items: modelItems }, { group: "WORKFLOWS", items: workflowItems }], registeredWorkflows, plugins);
const prefs = patch => ({ ...DEFAULT_MENU_VISIBILITY, ...patch });

test("all four independent master combinations gate actual menu families and preserve common recovery", () => {
  for (const showOmegaVision of [true, false]) for (const showWorkbench of [true, false]) {
    const preferences = prefs({ showOmegaVision, showWorkbench });
    for (const item of menu) {
      assert.equal(isMenuItemVisible(item, preferences), item.family === "common" || (item.family === "omega" ? showOmegaVision : showWorkbench), item.id);
    }
    assert.equal(isMenuRouteVisible(menu, { view: "setup" }, preferences), true);
    assert.equal(isMenuRouteVisible(menu, { view: "videoImport", subview: "recognition" }, preferences), showOmegaVision);
    assert.equal(isMenuRouteVisible(menu, { view: "operations" }, preferences), showWorkbench);
  }
});

test("per-item choices survive master toggles, reordering and duplicate labels", () => {
  const choices = { [pluginMenuId("alpha", "status")]: false, [pageMenuId("videoImport", "objects")]: false };
  const before = JSON.stringify(choices);
  for (const showOmegaVision of [false, true]) {
    const preferences = prefs({ showOmegaVision, menuItemVisibility: choices });
    assert.equal(isMenuItemVisible(menu.find(item => item.id === pluginMenuId("alpha", "status")), preferences), false);
    assert.equal(isMenuItemVisible(menu.find(item => item.id === pluginMenuId("beta", "status")), preferences), true);
    assert.equal(isMenuRouteVisible([...menu].reverse(), { view: "videoImport", subview: "objects" }, preferences), false);
  }
  assert.equal(JSON.stringify(choices), before);
  assert.notEqual(pluginMenuId("a:b", "c"), pluginMenuId("a", "b:c"));
});

test("new filesystem workflows/plugins default on and use actual configured group ownership", () => {
  const added = buildVisibilityMenu(sections, [...registeredWorkflows, { id: "new", routeView: "newPage", renderer: "custom", label: "New", menuGroup: "OMEGA VISION" }], [...plugins, { pluginId: "new", id: "page", group: "CUSTOM GROUP", label: "New" }]);
  assert.equal(isMenuItemVisible(added.find(item => item.id === workflowMenuId("new")), DEFAULT_MENU_VISIBILITY), true);
  assert.equal(isMenuRouteVisible(added, { view: "newPage" }, prefs({ showOmegaVision: false })), false);
  assert.equal(isMenuRouteVisible(added, { view: "visualImageDiff" }, prefs({ showOmegaVision: false })), true);
  assert.equal(isMenuRouteVisible(added, { view: "pluginPage", pluginId: "new", pluginPageId: "page" }, DEFAULT_MENU_VISIBILITY), true);
});

test("every individual item follows only its family master and its own choice", () => {
  for (const enabled of menu) {
    const choices = Object.fromEntries(menu.map(item => [item.id, item.id === enabled.id]));
    const preferences = prefs({ menuItemVisibility: choices });
    assert.deepEqual(menu.filter(item => isMenuItemVisible(item, preferences)).map(item => item.id), [enabled.id]);
    const master = enabled.family === "omega" ? "showOmegaVision" : "showWorkbench";
    assert.equal(isMenuItemVisible(enabled, prefs({ ...preferences, [master]: false })), enabled.family === "common");
  }
});

test("all-off including the Settings item cannot disable the common recovery route", () => {
  const preferences = prefs({ showOmegaVision: false, showWorkbench: false, menuItemVisibility: Object.fromEntries(menu.map(item => [item.id, false])) });
  assert.equal(menu.filter(item => isMenuItemVisible(item, preferences)).length, 0);
  assert.equal(isMenuRouteVisible(menu, { view: "setup" }, preferences), true);
  assert.equal(isMenuRouteVisible(menu, { view: "changeWorkspace" }, preferences), true);
});

test("hidden routes, model variants, legacy frames links and plugin identities are gated independently", () => {
  const preferences = prefs({ menuItemVisibility: {
    [pageMenuId("videoImport", "sources")]: false,
    [pageMenuId("llms", "discover")]: false,
    [pluginMenuId("alpha", "status")]: false,
  } });
  for (const subview of ["sources", "frames"]) assert.equal(isMenuRouteVisible(menu, { view: "videoImport", subview }, preferences), false);
  assert.equal(isMenuRouteVisible(menu, { view: "videoImport", subview: "recognition" }, preferences), true);
  assert.equal(isMenuRouteVisible(menu, { view: "llms", subview: "discover" }, preferences), false);
  assert.equal(isMenuRouteVisible(menu, { view: "llms", subview: "browse" }, preferences), true);
  assert.equal(isMenuRouteVisible(menu, { view: "pluginPage", pluginId: "alpha", pluginPageId: "status" }, preferences), false);
  assert.equal(isMenuRouteVisible(menu, { view: "pluginPage", pluginId: "beta", pluginPageId: "status" }, preferences), true);
  assert.equal(menuItemForRoute(menu, { view: "videoImport", subview: "recognition" }).action, undefined);
  assert.equal(menu.some(item => item.subview === "frames"), false);
  assert.equal(menu.filter(item => item.action === "temporal-events").length, 1);
});

test("persisted UI choices reload through the existing preference key without erasing unrelated preferences", async () => {
  const originalWindow = globalThis.window;
  const values = new Map();
  const window = new EventTarget();
  window.localStorage = { getItem: key => values.get(key) ?? null, setItem: (key, value) => values.set(key, value) };
  globalThis.window = window;
  try {
    const source = stripTypeScriptTypes(read("./uiPreferences.ts"))
      .replace('"react"', JSON.stringify(pathToFileURL(require.resolve("react")).href))
      .replace('"./menuVisibility"', JSON.stringify(new URL("./menuVisibility.ts", import.meta.url).href));
    const api = await import(moduleUrl(source));
    assert.equal(api.readUserUiPreferences().redirectDefaultWorkspaceToArc3, true);
    api.updateUserUiPreferences({ redirectDefaultWorkspaceToArc3: false });
    api.updateUserUiPreferences({ resourceSourceFileControlsPlacement: "below", generationsView: "compact", pageUiToolsVisible: false });
    api.updateUserUiPreferences({ showOmegaVision: false, menuItemVisibility: { first: false } });
    api.updateUserUiPreferences({ showWorkbench: false, menuItemVisibility: { second: false } });
    const reloaded = await import(moduleUrl(`${source}\n// fresh module`));
    assert.deepEqual(reloaded.readUserUiPreferences(), {
      resourceSourceFileControlsPlacement: "below", generationsView: "compact", generationsVisible: true, pageUiToolsVisible: false,
      showOmegaVision: false, showWorkbench: false, menuItemVisibility: { first: false, second: false },
      redirectDefaultWorkspaceToArc3: false,
    });
    assert.deepEqual([...values.keys()], ["metta-workbench.user-ui-preferences.v1"]);
    assert.deepEqual(parseMenuVisibility({ menuItemVisibility: { valid: false, invalid: "false" } }).menuItemVisibility, { valid: false });
  } finally { globalThis.window = originalWindow; }
});

test("workspace initialization runs once across effect suspension, and again only for a different context", async () => {
  let effect, ref;
  globalThis.visibilityHookTest = {
    useRef: initial => ref ||= { current: initial },
    useEffect: callback => { effect = callback; },
  };
  const react = moduleUrl("export const {useRef,useEffect} = globalThis.visibilityHookTest;");
  const source = stripTypeScriptTypes(read("./useContextReset.ts")).replace('"react"', JSON.stringify(react));
  const { useContextReset } = await import(moduleUrl(source));
  let draft = "", resets = 0;
  const reset = () => { draft = ""; resets += 1; };
  useContextReset("workspace-a", reset); effect();
  draft = "unsaved rich source";
  effect();
  useContextReset("workspace-a", reset); effect();
  assert.equal(draft, "unsaved rich source");
  assert.equal(resets, 1);
  useContextReset("workspace-b", reset); effect();
  assert.equal(draft, "");
  assert.equal(resets, 2);
  delete globalThis.visibilityHookTest;
});

test("all rich reset seams and route exits use suspension-safe protection", () => {
  for (const file of ["OperationLibraryEditor", "PromptLibraryEditor", "GoalPlanLibraryEditor", "PolicyLibraryEditor", "DataCatalogPanel", "LlmModelsEditor", "TopicsResourceEditor", "ResourceSourceEditor", "WorkflowPageSourceEditor", "ModelPolicyPage"]) {
    assert.match(read(`../components/${file}.tsx`), /useContextReset\(/, file);
  }
  const boundary = read("../components/MenuVisibilityBoundary.tsx");
  assert.match(boundary, /return visited \?/);
  assert.match(boundary, /<Activity mode=\{visible \? "visible" : "hidden"\}/);
  assert.match(shell, /addEventListener\("popstate", restoreLocation, true\)/);
  assert.match(shell, /event\.stopImmediatePropagation\(\)/);
  assert.match(shell, /const openRuntimeResource[\s\S]*?allowLeavingRetainedPage/);
  assert.match(shell, /const returnToBreadcrumb[\s\S]*?allowLeavingRetainedPage/);
  assert.match(shell, /const showWorkspaceChooser[\s\S]*?allowLeavingRetainedPage/);
  assert.match(shell, /MenuVisibilityRecovery label/);
  assert.match(read("../components/WorkspaceSettingsPanel.tsx"), /<MenuVisibilitySettings\s*\/>/);
});
