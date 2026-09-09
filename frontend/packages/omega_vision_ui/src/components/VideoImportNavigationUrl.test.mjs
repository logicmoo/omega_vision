import assert from "node:assert/strict";
import test from "node:test";
import {
  canonicalVideoImportShellUrl,
  inspectorNavigationSlug,
  navigationPathFromUrl,
  navigationSlug,
  resolveRecognitionNavigation,
  resolveVideoImportShellDestination,
  urlWithNavigation,
} from "./VideoImportNavigationUrl.ts";

const items = [{
  id: "frame_000007",
  transforms: [{
    name: "parts_extraction_0",
    doer: "python_opencv",
    status: "done",
    resultPath: "data/recordings/ls20/run/7/parts_extraction_0/python_opencv/result.pl",
  }],
}];

test("Recognition nav reads tab names case-insensitively", () => {
  const path = navigationPathFromUrl("http://localhost:5173/?nav=Extractions");
  assert.deepEqual(path, ["extractions"]);
  assert.deepEqual(resolveRecognitionNavigation(path, items).target, { tab: "extractions" });
});

test("nested extraction and Prolog paths resolve without encoding source paths", () => {
  const sourceSlug = inspectorNavigationSlug(items[0].transforms[0]);
  const path = ["extractions", navigationSlug(items[0].id), "prolog", sourceSlug];
  const resolved = resolveRecognitionNavigation(path, items);

  assert.equal(resolved.target.rowId, "frame_000007");
  assert.equal(resolved.target.inspector.path, items[0].transforms[0].resultPath);
  assert.deepEqual(resolved.canonicalPath, path);
  assert.equal(path.some((segment) => segment.includes("/")), false);
});

test("stale prefixes and suffixes stop at the deepest valid destination", () => {
  const prefixed = resolveRecognitionNavigation(["dunno", "Extractions"], items);
  assert.deepEqual(prefixed.canonicalPath, ["extractions"]);
  assert.match(prefixed.warning, /stale navigation prefix/i);

  const staleRow = resolveRecognitionNavigation(
    ["extractions", "frame_000007", "missing-child"],
    items,
  );
  assert.deepEqual(staleRow.canonicalPath, ["extractions", "frame_000007"]);
  assert.match(staleRow.warning, /unknown extraction destination/i);
});

test("nav updates preserve Visual Sequence and every unrelated parameter", () => {
  const updated = new URL(urlWithNavigation(
    "http://localhost:5173/?workspace=arc3_random_player&game=ls20&recording=20260718-154544&gen=1&filter=a&filter=b",
    ["extractions"],
  ));
  assert.equal(updated.searchParams.get("nav"), "extractions");
  assert.equal(updated.searchParams.get("game"), "ls20");
  assert.equal(updated.searchParams.get("recording"), "20260718-154544");
  assert.equal(updated.searchParams.get("workspace"), "arc3_random_player");
  assert.equal(updated.searchParams.get("gen"), "1");
  assert.deepEqual(updated.searchParams.getAll("filter"), ["a", "b"]);
});

test("saved back and forward URLs independently restore their destinations", () => {
  const base = "http://localhost:5173/?workspace=arc3_random_player&game=ls20&recording=20260718-154544";
  const backUrl = urlWithNavigation(base, ["inputs"]);
  const forwardUrl = urlWithNavigation(base, ["extractions", "frame_000007"]);

  assert.deepEqual(navigationPathFromUrl(backUrl), ["inputs"]);
  assert.deepEqual(navigationPathFromUrl(forwardUrl), ["extractions", "frame_000007"]);
  assert.equal(resolveRecognitionNavigation(navigationPathFromUrl(backUrl), items).target.tab, "inputs");
  assert.equal(resolveRecognitionNavigation(navigationPathFromUrl(forwardUrl), items).target.rowId, "frame_000007");
});

test("legacy Sprite Viewer routes migrate to Video Import step 5", () => {
  const original = "http://localhost:5173/?workspace=demo&view=spriteViewer&game=ls20&recording=run";
  const destination = resolveVideoImportShellDestination(original);
  const migrated = new URL(canonicalVideoImportShellUrl(original, destination));

  assert.deepEqual(destination, { subview: "sprite-view", focus: null });
  assert.equal(migrated.searchParams.get("view"), "videoImport");
  assert.equal(migrated.searchParams.get("subview"), "sprite-view");
  assert.equal(migrated.searchParams.get("nav"), "sprite-view");
  assert.equal(migrated.searchParams.get("game"), "ls20");
  assert.equal(migrated.searchParams.get("recording"), "run");
});

test("legacy Finish falls back to Sources while Advanced retains its section", () => {
  assert.deepEqual(
    resolveVideoImportShellDestination("http://localhost:5173/?view=videoImport&subview=finish"),
    { subview: "sources", focus: null },
  );
  assert.deepEqual(
    resolveVideoImportShellDestination("http://localhost:5173/?view=videoImport&nav=Advanced"),
    { subview: "sources", focus: "advanced" },
  );
  assert.deepEqual(
    resolveVideoImportShellDestination("http://localhost:5173/?view=finish"),
    { subview: "sources", focus: null },
  );
  const href = "http://localhost:5173/?view=videoImport&subview=finish&nav=finish&game=ls20&recording=run";
  const migrated = new URL(canonicalVideoImportShellUrl(href, resolveVideoImportShellDestination(href)));
  assert.equal(migrated.searchParams.get("subview"), "sources");
  assert.equal(migrated.searchParams.has("nav"), false);
  assert.equal(migrated.searchParams.get("recording"), "run");
});
