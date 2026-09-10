import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import { stripTypeScriptTypes } from "node:module";
import test from "node:test";

const read = path => readFileSync(new URL(path, import.meta.url), "utf8");
const page = read("./VideoImportPage.tsx");
const canvas = read("./RecognitionTemporalCanvas.tsx");

test("combined import page exposes the original intake, player and rich frame/filter sections once", () => {
  const css = read("../styles/video_import.css");
  for (const section of ["intake", "player", "userpick", "inputs", "prepass", "gallery", "output", "trail"]) {
    assert.ok(css.includes(`.video-import-page[data-subview="sources"] > [data-section="${section}"]`), section);
    assert.ok(page.includes(`section("${section}"`), section);
  }
  assert.doesNotMatch(page, /\{\s*id:\s*"frames",\s*label:/);
  assert.equal((page.match(/\{preprocessingSection\}/g) || []).length, 1);
  assert.match(page, /renderImageSetSelector[\s\S]*?\{preprocessingSection\}/);
});

test("one existing rich events panel opens in the current Recognition context without navigation or execution", () => {
  assert.equal((page.match(/<SemanticEventsPanel\b/g) || []).length, 1);
  assert.match(page, /<RecognitionTemporalCanvas[^>]*active=\{activeSubview === "recognition"\}/);
  assert.match(page, /selectedFrameId=\{expandedReduceId \|\| ""\}/);
  assert.match(canvas, /anchor\.after\(host\)/);
  assert.match(canvas, /rememberedBounds\.bottom > top/);
  assert.match(canvas, /document\.elementFromPoint/);
  assert.match(canvas, /Close canvas/);
  assert.match(canvas, /Collapse canvas/);
  assert.match(canvas, /MenuVisibilityBoundary visible=\{open && active && enabled\}/);
  assert.doesNotMatch(canvas, /fetch\(|localStorage|sessionStorage|indexedDB|setSubview|history\.|scrollIntoView/);
  assert.match(canvas, /Select or focus a Recognition frame/);
});

test("visibility suspension cannot flush preprocessing or persist the page snapshot", () => {
  const boundary = read("../../../../apps/workbench/src/components/MenuVisibilityBoundary.tsx");
  assert.match(boundary, /useLayoutEffect\(\(\) => \{\s*if \(wasVisible\.current && !visible\) suspensionEpoch\.current \+= 1;/);
  assert.match(boundary, /get suspensionEpoch\(\) \{ return suspensionEpoch\.current \+ parent\.suspensionEpoch; \}/);
  assert.match(page, /preprocCleanupEpoch, JSON\.stringify\(\[preprocContext, preprocLoadRetry\]\), pageLifecycle/);
  assert.match(page, /const suspendCleanup[\s\S]*?clearTimeout\(preprocSaveTimer\.current\);[\s\S]*?visibleCleanup\(\)/);
  assert.match(page, /await Promise\.resolve\(\);\s*await preprocSaveQueue\.current;\s*if \(cancelled\) return;/);
  assert.match(page, /snapshotCleanupEpoch, snapshotKey, pageLifecycle/);
  assert.match(page, /if \(!restoredRef\.current\) return;\s*const slim = buildSlimSnapshotRef\.current\(\)/);
  assert.match(page, /if \(savedSnapshotContent\.current === content\) return/);
});

test("actual disposal helper suppresses hide/reveal replay but preserves real exits and original context", async () => {
  const helper = page.slice(page.indexOf("type VisibleCleanupEpoch ="), page.indexOf("export function VideoImportPage("));
  assert.ok(helper.includes("function prepareVisibleContextCleanup("));
  const url = `data:text/javascript;base64,${Buffer.from(stripTypeScriptTypes(`${helper}\nexport { prepareVisibleContextCleanup };`)).toString("base64")}`;
  const { prepareVisibleContextCleanup } = await import(url);
  const latest = { current: null };
  const writes = [];
  const lifecycle = { paused: false, suspensionEpoch: 0 };
  let draft = "unsaved rich state";
  const connect = context => prepareVisibleContextCleanup(latest, context, lifecycle, () => {
    const captured = draft;
    return () => writes.push({ context, draft: captured });
  });
  let cleanup = connect("workspace-a|sequence-a");
  cleanup(); // StrictMode's initial cleanup/reconnect.
  cleanup = connect("workspace-a|sequence-a");
  await Promise.resolve();
  assert.deepEqual(writes, []);
  lifecycle.paused = true;
  lifecycle.suspensionEpoch += 1;
  lifecycle.paused = false;
  cleanup(); // A hide's passive disconnect may arrive only after reveal.
  await Promise.resolve(); // The reconnect can occur in a later turn.
  assert.deepEqual(writes, []);
  cleanup = connect("workspace-a|sequence-a");
  lifecycle.paused = true;
  lifecycle.suspensionEpoch += 1;
  cleanup();
  await Promise.resolve();
  assert.deepEqual(writes, []);
  lifecycle.paused = false;
  cleanup = connect("workspace-a|sequence-a");
  cleanup(); // StrictMode replay on Activity reveal.
  cleanup = connect("workspace-a|sequence-a");
  await Promise.resolve();
  assert.deepEqual(writes, []);
  assert.equal(draft, "unsaved rich state");
  cleanup(); // A real context change must flush the old captured document.
  draft = "new context";
  cleanup = connect("workspace-b|sequence-b");
  await Promise.resolve();
  assert.deepEqual(writes, [{ context: "workspace-a|sequence-a", draft: "unsaved rich state" }]);
  cleanup(); // An actual visible unmount must still flush.
  await Promise.resolve();
  assert.deepEqual(writes.at(-1), { context: "workspace-b|sequence-b", draft: "new context" });
  assert.equal(writes.length, 2);
});

test("model selector initialization is separate from resumable read-only catalog observation", () => {
  assert.match(page, /useContextReset\(workspaceId, \(\) => \{\s*inheritedModelRef\.current = "";[\s\S]*?allCallsModelTouchedRef\.current = false;[\s\S]*?setModelPreferenceSource\(""\);\s*\}\);\s*useEffect\(\(\) => \{\s*let cancelled = false;\s*const mergeModels/);
  assert.match(page, /if \(!allCallsModelTouchedRef\.current\) setAllCallsModel\(automatic\)/);
});
