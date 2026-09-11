import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import test from "node:test";
import * as React from "react";
import { transformWithOxc } from "vite";
import * as model from "./MemorySetupModel.ts";

const source = readFileSync(new URL("./MemorySetup.tsx", import.meta.url), "utf8");
const { code: script } = await transformWithOxc(
  source.replace(/^import[\s\S]*?;\r?\n/gm, "").replace(/\bexport /g, ""),
  "MemorySetup.tsx", { jsx: { runtime: "classic" } },
);
const settle = () => new Promise(resolve => setImmediate(resolve));
const deferred = () => {
  let resolve, reject;
  const promise = new Promise((done, fail) => { resolve = done; reject = fail; });
  return { promise, resolve, reject };
};
const preferences = (revision = "r1", expanded = false) => ({
  schemaVersion: 1, revision, expanded,
  shape: { saveTo: "shape-run", lookIn: ["shape-run"], recentLookIn: [] },
  object: { saveTo: "object-run", lookIn: ["object-run"], recentLookIn: [] },
});
const location = kind => ({
  memoryLocationId: `${kind}-run`, memoryKinds: [kind], providerRef: "omega-vision",
  workspaceId: "shared", providerLabel: "Shared", label: `${kind} run`, pathLabel: `memory/${kind}`,
  context: { gameId: "ls20", levelId: "1", runId: "20260718-154544" },
  capabilities: { read: true, write: true, reason: null }, counts: { shape: 0, object: 0 },
});
const catalog = {
  schemaVersion: 1, revision: "catalog", errors: [],
  locations: [location("shape"), location("object")],
  destinations: [location("shape"), location("object")],
  effective: { shape: ["shape-run"], object: ["object-run"] },
};

// Run the real component's hooks and handlers without a DOM or extra test framework.
function mount(overrides = {}) {
  let props = {
    contextKey: "arc3_random_player|recordings/ls20/20260718-154544|frame-a",
    catalog, preferences: preferences(), onRefresh: () => {},
    onSave: async next => ({ ...next, revision: "r2" }), ...overrides,
  };
  const slots = [];
  let index = 0, changed = false, effects = [], tree;
  const hooks = {
    useId: () => "memory-test",
    useState: initial => {
      const key = index++;
      if (!(key in slots)) slots[key] = typeof initial === "function" ? initial() : initial;
      return [slots[key], update => {
        const next = typeof update === "function" ? update(slots[key]) : update;
        if (!Object.is(next, slots[key])) { slots[key] = next; changed = true; }
      }];
    },
    useRef: initial => {
      const key = index++;
      if (!(key in slots)) slots[key] = { current: initial };
      return slots[key];
    },
    useEffect: (effect, deps) => {
      const key = index++;
      const previous = slots[key];
      if (!previous || deps.some((value, i) => !Object.is(value, previous.deps[i]))) {
        slots[key] = { deps, cleanup: previous?.cleanup };
        effects.push(() => { slots[key].cleanup?.(); slots[key].cleanup = effect(); });
      }
    },
    useMemo: compute => compute(),
  };
  const bindings = { React, ...hooks, ...model };
  const MemorySetup = new Function(...Object.keys(bindings), `${script}\nreturn MemorySetup;`)(...Object.values(bindings));
  function render(patch = {}) {
    props = { ...props, ...patch };
    let rounds = 0;
    do {
      changed = false; index = 0; effects = [];
      tree = MemorySetup(props);
      effects.forEach(effect => effect());
      assert.ok(++rounds < 20, "component effects must settle");
    } while (changed);
    return tree;
  }
  function find(predicate, node = tree) {
    if (!node || typeof node !== "object") return null;
    if (predicate(node)) return node;
    for (const child of [node.props?.children].flat(Infinity)) {
      if (!child || typeof child !== "object") continue;
      const found = find(predicate, child);
      if (found) return found;
    }
    return null;
  }
  const button = label => find(node => node.type === "button" && node.props.children === label);
  const disclosure = () => find(node => node.props?.className === "memory-setup__disclosure");
  const lookup = kind => find(node => node.type?.name === "LookupTree" && node.props.kind === kind);
  const state = () => ({
    shape: lookup("shape")?.props.selection, object: lookup("object")?.props.selection,
    expanded: disclosure().props["aria-expanded"],
  });
  render();
  return { render, find, button, disclosure, lookup, state };
}

test("mount, hydration, disclosure, refresh, and rerenders never save preferences", async () => {
  const saves = [];
  const page = mount({ preferences: null, catalog: null, onSave: async next => { saves.push(next); return next; } });
  assert.equal(page.disclosure().props.disabled, true);
  page.render({ preferences: preferences(), catalog });
  const initial = page.state();
  page.disclosure().props.onClick(); page.render();
  assert.equal(page.state().expanded, true);
  assert.deepEqual(page.state().shape, initial.shape);
  assert.deepEqual(page.state().object, initial.object);
  page.button("Refresh locations").props.onClick();
  await settle(); page.render();
  page.disclosure().props.onClick(); page.render();
  page.render({ preferences: { ...preferences(), expanded: true } });
  await settle(); page.render();
  assert.deepEqual(saves, []);
  assert.doesNotMatch(source, /onToggle|disclosureOnly/);
  const persistCalls = source.match(/persist\(/g) ?? [];
  assert.equal(persistCalls.length, 1, "Save preferences must be the sole persist call");
});

test("explicit Save persists the current draft once with its base revision", async () => {
  const gate = deferred(), saves = [];
  const page = mount({ onSave: (next, expectedRevision) => { saves.push({ next, expectedRevision }); return gate.promise; } });
  page.disclosure().props.onClick(); page.render();
  const shape = page.state().shape;
  page.lookup("shape").props.onChange({ ...shape, lookIn: [] }); page.render();
  const save = page.button("Save preferences").props.onClick;
  save(); save(); page.render();
  assert.equal(saves.length, 1);
  assert.equal(saves[0].expectedRevision, "r1");
  assert.equal(saves[0].next.expanded, true);
  assert.deepEqual(saves[0].next.shape.lookIn, [], "explicit Clear remains supported");
  assert.deepEqual(saves[0].next.object.lookIn, ["object-run"]);
  assert.deepEqual(saves[0].next.object.recentLookIn, ["object-run"]);
  assert.equal(page.button("Save preferences").props.disabled, true);
  const saved = { ...saves[0].next, revision: "r2" };
  gate.resolve(saved); await settle(); page.render({ preferences: saved });
  assert.equal(page.button("Save preferences").props.disabled, true);
  assert.equal(page.button("Discard changes").props.disabled, true);
});

test("remote revisions preserve dirty drafts until explicit discard", () => {
  const page = mount();
  page.disclosure().props.onClick(); page.render();
  page.lookup("shape").props.onChange({ ...page.state().shape, lookIn: [] }); page.render();
  const remote = preferences("remote", true);
  page.render({ preferences: remote });
  assert.deepEqual(page.state().shape.lookIn, []);
  assert.ok(page.find(node => node.props?.role === "alert"));
  page.button("Discard changes").props.onClick(); page.render();
  assert.deepEqual(page.state().shape.lookIn, ["shape-run"]);
  assert.equal(page.button("Save preferences").props.disabled, true);
});

test("revision conflicts leave the draft intact and never retry automatically", async () => {
  const saves = [];
  const page = mount({ onSave: async (next, expectedRevision) => {
    saves.push({ next, expectedRevision }); throw new Error("Preferences changed elsewhere.");
  } });
  page.disclosure().props.onClick(); page.render();
  page.button("Save preferences").props.onClick(); await settle(); page.render();
  assert.equal(saves.length, 1);
  assert.equal(page.state().expanded, true);
  assert.ok(page.find(node => node.props?.role === "alert"));
  assert.equal(page.button("Discard changes").props.disabled, false);
});

test("retired saves cannot restore old drafts or clear a newer pending save after A-B-A context changes", async () => {
  const gates = [deferred(), deferred()];
  const saves = [];
  const page = mount({ onSave: next => { saves.push(next); return gates[saves.length - 1].promise; } });
  page.disclosure().props.onClick(); page.render();
  page.button("Save preferences").props.onClick(); page.render();
  const contextA = "arc3_random_player|recordings/ls20/20260718-154544|frame-a";
  page.render({ contextKey: "other-frame", preferences: null, catalog: null });
  assert.equal(page.disclosure().props.disabled, true);
  const returned = preferences("returned", true);
  page.render({ contextKey: contextA, preferences: returned, catalog });
  page.lookup("shape").props.onChange({ ...page.state().shape, lookIn: [] }); page.render();
  page.button("Save preferences").props.onClick(); page.render();
  gates[0].resolve({ ...saves[0], revision: "retired" }); await settle(); page.render();
  assert.deepEqual(page.state().shape.lookIn, []);
  assert.equal(page.button("Save preferences").props.disabled, true);
  const saved = { ...saves[1], revision: "current" };
  gates[1].resolve(saved); await settle(); page.render({ preferences: saved });
  assert.deepEqual(page.state().shape.lookIn, []);
  assert.equal(page.button("Discard changes").props.disabled, true);
});

test("blank and unavailable destinations stay visible and cannot be submitted", () => {
  for (const saveTo of ["", "retired-location"]) {
    const original = preferences("historical", true);
    original.shape.saveTo = saveTo;
    let saves = 0;
    const page = mount({ preferences: original, onSave: async next => { ++saves; return next; } });
    page.lookup("shape").props.onChange({ ...page.state().shape, lookIn: [] }); page.render();
    assert.equal(page.state().shape.saveTo, saveTo);
    assert.equal(page.button("Save preferences").props.disabled, true);
    page.button("Save preferences").props.onClick();
    assert.equal(saves, 0);
    assert.ok(page.find(node => node.type === "option" && node.props.children === "Unavailable destination"));
  }
});
