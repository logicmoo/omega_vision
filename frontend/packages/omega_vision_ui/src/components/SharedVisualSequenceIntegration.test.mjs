import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import test from "node:test";

const source = name => readFileSync(new URL(name, import.meta.url), "utf8");
const demos = source("./RecognitionDemosPage.tsx");
const video = source("./VideoImportPage.tsx");
const selector = source("./VisualSequenceSelector.tsx");
const store = source("./SharedVisualSequenceSelection.ts");
const hook = source("./useSharedVisualSequenceSelection.ts");

test("all pickers use backend selection, not localStorage restoration or first-available defaults", () => {
  assert.match(video, /const selectedImageSet = sharedSelection\.visualSequenceId/);
  assert.match(video, /void sharedSelection\.select\(entry\.id\)/);
  assert.match(demos, /useSharedVisualSequenceSelection\(workspaceId\)/);
  assert.match(selector, /useSharedVisualSequenceSelection\(workspaceId, active\)/);
  assert.doesNotMatch(video, /videoImport\.imageSet|restoredVisualSequenceIdRef|imageSetList\[0\]/);
  assert.doesNotMatch(store + hook, /localStorage|sessionStorage|BroadcastChannel/);
  assert.match(hook, /useSyncExternalStore/);
  assert.match(hook, /loadVisualSequenceCatalog/);
  assert.match(selector, /Confirmed default · LS20 Level 1 · 14 frames/);
});

test("history and shared synchronization never PUT or import", () => {
  const history = video.slice(video.indexOf("const restoreVisualSequenceFromHistory"), video.indexOf("// ---- intake"));
  assert.doesNotMatch(history, /\.select\(|importArcRecording\(/);
  const sync = video.slice(video.indexOf("// Activate the individually validated selected source"), video.indexOf("// Prefetch the per-tier"));
  assert.match(sync, /selectVisualSequence\(entry, "none"\)/);
  assert.doesNotMatch(sync, /\.select\(|importArcRecording\(|seedTodos|cmd: "run"/);
  assert.doesNotMatch(video, /void importArcRecording\(selectedRecording, "none"\)/);
  const urlWriter = video.slice(video.indexOf("const writeVisualSequenceLocation"), video.indexOf("const writeRecognitionNavigation"));
  assert.doesNotMatch(urlWriter, /if \(historyMode === "none"\) return/);
  assert.match(urlWriter, /history\.replaceState/);
  assert.match(sync, /visualSequenceLocationMatchesUrl\(window\.location\.href/);
});

test("catalog validation and all large-sequence gates remain intact", () => {
  for (const text of [video, selector, demos]) {
    assert.match(text, /visualSequenceLocationForEntry/);
    assert.match(text, /requiresVisualSequenceConfirmation/);
    assert.match(text, /visualSequenceConfirmationMessage/);
  }
  assert.match(video, /confirmedVisualSequencesRef/);
  assert.match(selector, /window\.confirm\(visualSequenceConfirmationMessage\(entry\)\)/);
  assert.match(demos, /sourceNeedsConfirmation/);
});

test("Demos exposes the shared selector, sends read-only source changes, and never auto-computes", () => {
  assert.match(demos, /<VisualSequenceSelector workspaceId=\{workspaceId\}/);
  assert.match(demos, /cmd: "select_visual_sequence", visualSequenceId: id, workspaceId/);
  assert.match(demos, /sentSource\.current === id/);
  assert.doesNotMatch(demos, /select_source|ls20Recordings|sourceSel|pendingCompute|selectTimerRef|5000/);
  const effect = demos.slice(demos.indexOf("useEffect(() => {", demos.indexOf("const send =")), demos.indexOf("const runOne"));
  assert.doesNotMatch(effect, /cmd: "run"|\.select\(/);
  assert.match(demos, /const runAll = useCallback\(\(\) => \{ if \(sourceReady\) send\(\{ cmd: "run" \}\)/);
  assert.match(demos, /const stopAll/);
  assert.match(demos, /const stepOne/);
  assert.match(demos, /<CoverageSection/);
  assert.match(demos, /<ResultChips/);
});

test("Demos hides source-mismatched results and guards actions until acknowledgement", () => {
  assert.match(demos, /m\.visualSequenceId === desiredSource\.current/);
  assert.match(demos, /acknowledgedSource === sharedSelection\.visualSequenceId/);
  assert.match(demos, /data\?\.visualSequenceId !== sharedSelection\.visualSequenceId/);
  assert.match(demos, /panels: \[\], frames: \[\], preview: null, result: \{\}/);
  assert.match(demos, /disabled=\{running \|\| !sourceReady\}/);
  assert.match(demos, /setSourceError\(String\(m\.error/);
  assert.match(demos, /m\.visualSequenceRevision === desiredRevision\.current/);
  assert.match(demos, /data\?\.visualSequenceRevision === sharedSelection\.selection\?\.revision/);
  assert.match(demos, /expectedRevision: sharedSelection\.selection\?\.revision/);
  assert.match(demos, /expectedRevision: revision/);
});

test("active-run source rejection remains visible and never silently stops, retries, or relabels the old source", () => {
  assert.match(demos, /role=\{sourceError \? "alert" : "status"\}/);
  assert.match(demos, /The existing server run has not been cancelled/);
  assert.match(demos, /Use Stop all explicitly before retrying source selection/);
  assert.match(demos, /Server source: <code>\{data\.visualSequenceId\}<\/code>/);
  const readiness = demos.slice(demos.indexOf("const sourceReady"), demos.indexOf("// Server-OWNED"));
  assert.match(readiness, /data\?\.visualSequenceId === sharedSelection\.visualSequenceId/);
  const sync = demos.slice(demos.indexOf("useEffect(() => {", demos.indexOf("const send =")), demos.indexOf("const runOne"));
  assert.doesNotMatch(sync, /cmd: "stop"|cmd: "clear"|cmd: "run"|setTimeout|running/);
});

test("shared-source Demos is observation-only with no legacy store control or store command", () => {
  assert.match(demos, /Observation-only demo/);
  assert.match(demos, /writes no legacy parts cache or demo\/canonical object-memory registry/);
  assert.match(demos, /Persistent native memory is available\s+through Recognition’s real stages/);
  assert.doesNotMatch(demos, /set_store_mode|storeSel|ls20StoreMode|onSetStoreMode|storeMode/);
  for (const handler of ["runOne", "stepOne", "stopAll", "clearOne", "togglePlay", "seek"]) {
    assert.match(demos, new RegExp(`const ${handler}`));
  }
  assert.match(demos, /<CoverageSection/);
  assert.match(demos, /<AnimatedGrid/);
});
