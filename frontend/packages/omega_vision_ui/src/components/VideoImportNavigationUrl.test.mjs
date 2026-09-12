import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import { stripTypeScriptTypes } from "node:module";
import test from "node:test";
import { runInNewContext } from "node:vm";
import {
  canonicalVideoImportShellUrl,
  canonicalRecognitionNavigationTab,
  inspectorNavigationSlug,
  navigationPathFromUrl,
  navigationSlug,
  resolveRecognitionNavigation,
  resolveVideoImportShellDestination,
  videoImportUrlForSubview,
  visualSequenceSpriteViewUrl,
  videoImportSurfaceFromUrl,
  visualSequencesUrlForNavigation,
  RECOGNITION_SEQUENCE_TABS,
  urlWithNavigation,
} from "./VideoImportNavigationUrl.ts";
import {
  buildVisibilityMenu, DEFAULT_MENU_VISIBILITY, isMenuRouteVisible, menuItemForRoute, pageMenuId,
} from "../../../../apps/workbench/src/lib/menuVisibility.ts";

const items = [{
  id: "frame_000007",
  transforms: [{
    name: "parts_extraction_0",
    doer: "python_opencv",
    status: "done",
    resultPath: "data/recordings/ls20/run/7/parts_extraction_0/python_opencv/result.pl",
  }],
}];

test("Demo/Test is the next peer tab after Extractions, with stable URL IDs", () => {
  assert.deepEqual(RECOGNITION_SEQUENCE_TABS, ["inputs", "extractions", "test-demo", "sprites"]);
  const source = readFileSync(new URL("./VideoImportPage.tsx", import.meta.url), "utf8");
  const extract = source.indexOf('onClick={() => selectRecognitionNavigationTab("extractions")}>Extractions');
  const demo = source.indexOf('onClick={() => selectRecognitionNavigationTab("test-demo")}>Demo/Test');
  const sprites = source.indexOf('onClick={() => selectRecognitionNavigationTab("sprites")}>Sprite View');
  assert.ok(extract >= 0 && demo > extract && sprites > demo);
  assert.doesNotMatch(source, /role="tab"[^>]*selectRecognitionNavigationTab\("game-player"\)/);
});

test("old Game Player roots restore the combined demo without changing nested extraction row names", () => {
  assert.equal(canonicalRecognitionNavigationTab("game-player"), "test-demo");
  assert.equal(canonicalRecognitionNavigationTab("test-demo"), "test-demo");
  assert.equal(canonicalRecognitionNavigationTab("unknown"), null);
  assert.equal(canonicalRecognitionNavigationTab(null), null);
  const directLegacy = "http://localhost:5173/?workspace=arc3_random_player&view=videoImport&nav=game-player";
  assert.deepEqual(resolveVideoImportShellDestination(directLegacy), { subview: "recognition", focus: null });
  assert.equal(new URL(canonicalVideoImportShellUrl(directLegacy, resolveVideoImportShellDestination(directLegacy))).searchParams.get("nav"), "test-demo");
  const rows = [{ id: "game-player", transforms: [] }];
  for (const view of ["visualSequences", "videoImport"]) {
    const base = `http://localhost:5173/?view=${view}&subview=recognition&workspace=arc3_random_player&recording=curated%2Fspotlight&gen=1&filter=a&filter=b#frame`;
    for (const nav of ["game-player", "old,game-player,stale"]) {
      const href = `${base.split("#")[0]}&nav=${nav}#frame`;
      const resolved = resolveRecognitionNavigation(navigationPathFromUrl(href), rows);
      assert.deepEqual(resolved.target, { tab: "test-demo" });
      assert.deepEqual(resolved.canonicalPath, ["test-demo"]);
      const canonical = canonicalVideoImportShellUrl(href, resolveVideoImportShellDestination(href));
      const url = new URL(canonical);
      assert.deepEqual(navigationPathFromUrl(canonical), ["test-demo"]);
      assert.equal(url.searchParams.get("view"), view);
      assert.equal(url.searchParams.get("workspace"), "arc3_random_player");
      assert.equal(url.searchParams.get("recording"), "curated/spotlight");
      assert.equal(url.searchParams.get("gen"), "1");
      assert.equal(url.searchParams.has("game"), false);
      assert.deepEqual(url.searchParams.getAll("filter"), ["a", "b"]);
      assert.equal(url.hash, "#frame");
      assert.equal(canonicalVideoImportShellUrl(canonical, resolveVideoImportShellDestination(canonical)), canonical);
    }
    const rowUrl = urlWithNavigation(base, ["extractions", "game-player"]);
    const canonical = canonicalVideoImportShellUrl(rowUrl, resolveVideoImportShellDestination(rowUrl));
    assert.deepEqual(navigationPathFromUrl(canonical), ["extractions", "game-player"]);
    assert.deepEqual(resolveRecognitionNavigation(navigationPathFromUrl(canonical), rows).target,
      { tab: "extractions", rowId: "game-player" });
  }
  const page = readFileSync(new URL("./VideoImportPage.tsx", import.meta.url), "utf8");
  assert.match(page, /canonicalRecognitionNavigationTab\(stored\)/);
  assert.match(page, /new CustomEvent\(SEQUENCE_VIEW_CHANGED_EVENT, \{ detail: \{ tab: reduceTab \} \}\)/);
});

test("a sequence test's Sprite action stays on the dedicated page and retains unrelated context", () => {
  const base = "http://localhost:5173/?workspace=arc3_random_player&view=visualSequences&nav=test-demo&game=events_tests&recording=rotated&gen=1&filter=a&filter=b#context";
  const next = new URL(visualSequenceSpriteViewUrl(base));
  assert.equal(next.searchParams.get("view"), "visualSequences");
  assert.equal(next.searchParams.get("nav"), "sprites");
  assert.equal(next.searchParams.get("subview"), "recognition");
  for (const key of ["workspace", "game", "recording", "gen", "filter"]) {
    assert.deepEqual(next.searchParams.getAll(key), new URL(base).searchParams.getAll(key));
  }
  assert.equal(next.hash, "#context");
  const legacy = new URL(visualSequenceSpriteViewUrl(base.replace("visualSequences", "recognitionDemos")));
  assert.equal(legacy.searchParams.get("view"), "videoImport");
  assert.equal(legacy.searchParams.get("subview"), "sprite-view");
});

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

test("legacy Frames links open the combined import page at its real frame section without losing context", () => {
  for (const suffix of ["subview=frames", "nav=Frames", "subview=sources&nav=frames"]) {
    const href = `http://localhost:5173/?view=videoImport&workspace=demo&game=ls20&recording=run&filter=a&filter=b&${suffix}`;
    const destination = resolveVideoImportShellDestination(href);
    assert.deepEqual(destination, { subview: "sources", focus: "frames" });
    const canonical = new URL(canonicalVideoImportShellUrl(href, destination));
    assert.equal(canonical.searchParams.get("subview"), "sources");
    assert.equal(canonical.searchParams.get("nav"), "frames");
    assert.equal(canonical.searchParams.get("recording"), "run");
    assert.equal(canonical.searchParams.get("game"), "ls20");
    assert.deepEqual(canonical.searchParams.getAll("filter"), ["a", "b"]);
    assert.deepEqual(resolveVideoImportShellDestination(canonical.href), destination);
  }
});

test("explicit menu switches supersede legacy nav while preserving sequence, repeated parameters and history", () => {
  const original = "http://localhost:5173/?workspace=arc3_random_player&view=videoImport&subview=sources&gen=1&game=ls20&recording=20260718-154544_attempt8&nav=frames&filter=a&filter=b#context";
  for (const nav of ["frames", "advanced", "sprite-view", "finish"]) {
    const previous = new URL(original);
    previous.searchParams.set("nav", nav);
    for (const subview of ["sources", "games", "objects", "sprite-view", "recognition"]) {
      const next = new URL(videoImportUrlForSubview(previous.href, subview));
      assert.deepEqual(resolveVideoImportShellDestination(next.href), { subview, focus: null });
      assert.equal(next.searchParams.get("nav"), subview === "sprite-view" ? "sprite-view" : null);
      for (const key of ["workspace", "gen", "game", "recording", "filter"]) {
        assert.deepEqual(next.searchParams.getAll(key), previous.searchParams.getAll(key), key);
      }
      assert.equal(next.hash, previous.hash);
      assert.equal(previous.searchParams.get("nav"), nav);
    }
  }
  assert.deepEqual(resolveVideoImportShellDestination(original), { subview: "sources", focus: "frames" });
  const detail = urlWithNavigation(original, ["extractions", "frame_000007", "prolog", "parts_extraction_0-python_opencv"]);
  assert.deepEqual(navigationPathFromUrl(videoImportUrlForSubview(detail, "recognition")), navigationPathFromUrl(detail));
});

test("shell menus and mounted page switches use the same explicit-navigation helper", () => {
  const read = path => readFileSync(new URL(path, import.meta.url), "utf8");
  const shell = read("../../../../apps/workbench/src/pages/FilesystemWorkbenchPage.tsx");
  const page = read("./VideoImportPage.tsx");
  assert.match(shell, /videoImportUrlForSubview\(window\.location\.href, item\.subview\)/);
  assert.match(page, /const selectSubview = \(subview: string\) => \{\s*const nextUrl = videoImportUrlForSubview\(window\.location\.href, subview\)/);
  assert.match(page, /const onExternal = \(event: Event\) => \{[\s\S]*?selectSubview\(detail\)/);
  assert.match(page, /useEffect\(\(\) => \{\s*const destination = resolveVideoImportShellDestination\(window\.location\.href\);[\s\S]*?setActiveSubview\(destination\.subview\)/);
});

test("the dedicated Visual Sequences route defaults to rich Extractions, never intake or a game", () => {
  for (const view of ["visualSequences", "visual-sequences", "VISUALSEQUENCES"]) {
    const href = `http://localhost:5173/?workspace=arc3_random_player&view=${view}&gen=1`;
    assert.equal(videoImportSurfaceFromUrl(href), "sequences");
    const destination = resolveVideoImportShellDestination(href);
    assert.deepEqual(destination, { subview: "recognition", focus: null });
    const canonical = new URL(canonicalVideoImportShellUrl(href, destination));
    assert.equal(canonical.searchParams.get("view"), "visualSequences");
    assert.equal(canonical.searchParams.get("subview"), "recognition");
    assert.equal(canonical.searchParams.get("nav"), "extractions");
    assert.equal(canonical.searchParams.has("game"), false);
    assert.equal(canonical.searchParams.has("recording"), false);
    assert.equal(canonical.searchParams.get("workspace"), "arc3_random_player");
  }
  assert.equal(videoImportSurfaceFromUrl("http://localhost:5173/?view=arc3Play"), null);
});

test("every sequence peer restores on the dedicated route without stale intake navigation", () => {
  for (const tab of RECOGNITION_SEQUENCE_TABS) {
    for (const oldSubview of ["sources", "games", "sprite-view", "frames", "recognition"]) {
      const href = `http://localhost:5173/?view=visualSequences&subview=${oldSubview}&nav=advanced,${tab}`;
      const canonical = canonicalVideoImportShellUrl(href, resolveVideoImportShellDestination(href));
      const parsed = new URL(canonical);
      assert.equal(parsed.searchParams.get("view"), "visualSequences");
      assert.equal(parsed.searchParams.get("subview"), "recognition");
      assert.deepEqual(navigationPathFromUrl(canonical), [tab]);
      assert.equal(resolveRecognitionNavigation(navigationPathFromUrl(canonical), []).target.tab, tab);
      assert.equal(canonicalVideoImportShellUrl(canonical, resolveVideoImportShellDestination(canonical)), canonical);
    }
  }
  const peerWithStaleDetail = visualSequencesUrlForNavigation("http://localhost:5173/?nav=games,sprites,old-frame");
  assert.deepEqual(navigationPathFromUrl(peerWithStaleDetail), ["sprites"]);
  const detailed = visualSequencesUrlForNavigation(
    "http://localhost:5173/?view=videoImport&subview=recognition&nav=extractions,frame_000007,prolog,parts_extraction_0-python_opencv",
  );
  assert.equal(resolveRecognitionNavigation(navigationPathFromUrl(detailed), items).target.inspector.path, items[0].transforms[0].resultPath);
});

test("legacy global sprite-view remains separate from local nav=sprites", () => {
  const legacy = "http://localhost:5173/?view=videoImport&subview=sprite-view&nav=sprite-view";
  const peer = "http://localhost:5173/?view=visualSequences&subview=recognition&nav=sprites";
  assert.equal(videoImportSurfaceFromUrl(legacy), "intake");
  assert.deepEqual(resolveVideoImportShellDestination(legacy), { subview: "sprite-view", focus: null });
  assert.deepEqual(resolveVideoImportShellDestination(peer), { subview: "recognition", focus: null });
  assert.equal(new URL(canonicalVideoImportShellUrl(legacy, resolveVideoImportShellDestination(legacy))).searchParams.get("view"), "videoImport");
  assert.equal(new URL(canonicalVideoImportShellUrl(peer, { subview: "sprite-view", focus: null })).searchParams.get("view"), "visualSequences");
  assert.equal(new URL(canonicalVideoImportShellUrl(peer, { subview: "sprite-view", focus: null })).searchParams.get("nav"), "sprites");
});

test("explicit intake navigation leaves the new route, while peers and history preserve all source context", () => {
  const original = "http://localhost:5173/?workspace=arc3_random_player&view=videoImport&subview=sources&nav=frames"
    + "&recording=curated%2Fspotlight&gen=1&filter=a&filter=b&state=kept&resource=kept&frame=7#context";
  const gameContext = new URL(original);
  gameContext.searchParams.set("game", "ls20");
  for (const href of [original, gameContext.href]) {
    const opened = visualSequencesUrlForNavigation(href, ["game-player"]);
    const forward = visualSequencesUrlForNavigation(opened, ["test-demo"]);
    const back = visualSequencesUrlForNavigation(opened);
    const intake = videoImportUrlForSubview(forward, "sources");
    assert.equal(new URL(opened).searchParams.get("view"), "visualSequences");
    assert.equal(new URL(forward).searchParams.get("nav"), "test-demo");
    assert.equal(new URL(back).searchParams.get("nav"), "test-demo");
    assert.equal(new URL(intake).searchParams.get("view"), "videoImport");
    assert.deepEqual(resolveVideoImportShellDestination(intake), { subview: "sources", focus: null });
    assert.equal(new URL(intake).searchParams.has("nav"), false);
    for (const result of [opened, forward, back, intake]) {
      const url = new URL(result);
      for (const [key] of new URL(href).searchParams) {
        if (["view", "subview", "nav"].includes(key)) continue;
        assert.deepEqual(url.searchParams.getAll(key), new URL(href).searchParams.getAll(key), key);
      }
      assert.equal(url.hash, new URL(href).hash);
    }
  }
});

test("the active filesystem shell decodes the new route and still supports old aliases", () => {
  const shell = readFileSync(new URL("../../../../apps/workbench/src/pages/FilesystemWorkbenchPage.tsx", import.meta.url), "utf8");
  const decoder = stripTypeScriptTypes(shell.slice(
    shell.indexOf("const WORKBENCH_VIEWS:"), shell.indexOf("/** Last-loaded UI metadata"),
  ));
  const decode = search => runInNewContext(`${decoder}\nviewFromLocation()`, {
    window: { location: { search } }, URLSearchParams,
  });
  assert.equal(decode("?workspace=arc3_random_player&view=visualSequences&nav=test-demo"), "visualSequences");
  assert.equal(decode("?view=visual-sequences"), "visualSequences");
  assert.equal(decode("?view=videoImport&subview=recognition"), "videoImport");
  assert.equal(decode("?view=spriteViewer"), "videoImport");
  assert.equal(decode("?view=arc3Play"), "arc3Play");
});

test("Visual Sequences uses Omega and existing rich-panel visibility rather than bypassing hidden pages", () => {
  const menu = buildVisibilityMenu([{ group: "OMEGA VISION", items: [
    { label: "Visual Sequences", view: "visualSequences" },
    { label: "Video Import", view: "videoImport", subview: "sources" },
    { label: "Recognition", view: "videoImport", subview: "recognition" },
    { label: "Sprite View", view: "videoImport", subview: "sprite-view" },
  ] }], [], []);
  const route = { view: "visualSequences", subview: "recognition" };
  assert.equal(menuItemForRoute(menu, route).family, "omega");
  assert.equal(menuItemForRoute([], route).family, "omega");
  assert.equal(isMenuRouteVisible(menu, route, DEFAULT_MENU_VISIBILITY), true);
  assert.equal(isMenuRouteVisible(menu, route, { ...DEFAULT_MENU_VISIBILITY, showOmegaVision: false }), false);
  for (const id of [pageMenuId("visualSequences"), pageMenuId("videoImport", "recognition")]) {
    assert.equal(isMenuRouteVisible(menu, route, {
      ...DEFAULT_MENU_VISIBILITY, menuItemVisibility: { [id]: false },
    }), false);
  }
  const hiddenIntake = { ...DEFAULT_MENU_VISIBILITY, menuItemVisibility: { [pageMenuId("videoImport", "sources")]: false } };
  assert.equal(isMenuRouteVisible(menu, route, hiddenIntake), true);
  assert.equal(isMenuRouteVisible(menu, { view: "videoImport", subview: "sources" }, hiddenIntake), false);
  const hiddenSprites = { ...DEFAULT_MENU_VISIBILITY, menuItemVisibility: { [pageMenuId("videoImport", "sprite-view")]: false } };
  assert.equal(isMenuRouteVisible(menu, route, hiddenSprites), true);
  assert.equal(isMenuRouteVisible(menu, { view: "videoImport", subview: "sprite-view" }, hiddenSprites), false);
});

test("the shell mounts the existing rich family with Recognition help, and the new surface excludes intake UI", () => {
  const read = path => readFileSync(new URL(path, import.meta.url), "utf8");
  const shell = read("../../../../apps/workbench/src/pages/FilesystemWorkbenchPage.tsx");
  const family = read("../../../../apps/workbench/src/components/VideoImportFamily.tsx");
  const page = read("./VideoImportPage.tsx");
  assert.match(shell, /\{ label: "Visual Sequences", view: "visualSequences"/);
  assert.match(shell, /view === "visualSequences" && \(\s*<VisualSequencesPage/);
  assert.match(shell, /view === "visualSequences"\s*\? "recognition"/);
  assert.match(family, /export function VisualSequencesPage[\s\S]*?<VideoImportFamily \{\.\.\.props\} surface="sequences"/);
  assert.match(family, /component: VideoImportPage/);
  assert.match(page, /surface === "sequences"\s*\? \{ subview: "recognition"/);
  assert.match(page, /surface === "intake" && <>\s*<Section \{\.\.\.section\("intake"/);
  assert.match(page, /surface === "intake" && <label className="video-import-recognition-upload"/);
  assert.match(page, /surface === "sequences" && sequenceViewTabs/);
  assert.match(page, /\(surface === "intake" \|\| reduceTab === "extractions"\) && <>/);
  assert.match(page, /reduceTab === "extractions" && renderReduceExtractions\(\)/);
  assert.match(page, /subviewVisible\("sprite-view"\) && <button[^>]*role="tab"/);
  const demo = read("./VisualSequenceDemoView.tsx");
  assert.match(page, /<VisualSequenceDemoView/);
  assert.match(page, /selectedSequenceEntry\?\.id === selectedImageSet[\s\S]*?sequence=\{selectedSequenceEntry\}/);
  assert.match(demo, /<Arc3VisualSequencePlayer/);
  assert.match(demo, /<RecordingTests/);
  assert.match(page, /<SpriteViewerPage memorySetup=\{<MemorySetupHost/);
  assert.match(page, /renderImageSetSelector/);
  assert.match(page, /useSharedVisualSequenceSelection/);
  assert.match(page, /surface === "intake" \|\| reduceTab === "inputs" \|\| reduceTab === "extractions"/);
  assert.match(page, /Sprite View is hidden in menu settings/);
});

test("the intake link and dedicated wrapper do not import, run, select, persist preferences or launch a game", () => {
  const read = path => readFileSync(new URL(path, import.meta.url), "utf8");
  const page = read("./VideoImportPage.tsx");
  const family = read("../../../../apps/workbench/src/components/VideoImportFamily.tsx");
  const handler = page.slice(page.indexOf("const openVisualSequences"), page.indexOf("const hoveredImageRef"));
  assert.match(handler, /visualSequencesUrlForNavigation/);
  assert.match(handler, /history.pushState/);
  assert.match(handler, /new PopStateEvent\("popstate"\)/);
  assert.match(page, /imageSetList.length > 0[\s\S]*?Open Visual Sequences/);
  assert.doesNotMatch(handler + family, /fetch\(|api\(|\.select\(|importArcRecording|startServer|seedTodos|updateUserUiPreferences|localStorage|sessionStorage/);
  assert.match(page, /if \(videoImportSurfaceFromUrl\(window.location.href\) !== surface\) return/);
  assert.match(page, /if \(!visualSequenceReady \|\| items.length === 0\) \{\s*setReduceTab\(resolveRecognitionNavigation/);
  assert.match(page, /if \(surface === "sequences" \|\| restoreStartedRef.current\) return/);
  assert.match(page, /if \(!restoredRef.current\) return/);
  const shell = read("../../../../apps/workbench/src/pages/FilesystemWorkbenchPage.tsx");
  assert.match(shell, /if \(next === "visualSequences"\) \{\s*const url = visualSequencesUrlForNavigation[\s\S]*?setActiveNavSubview\("recognition"\);\s*return/);
  assert.match(shell, /if \(item.view === "videoImport"\) \{\s*setViewState\(item.view\);\s*return/);
});
