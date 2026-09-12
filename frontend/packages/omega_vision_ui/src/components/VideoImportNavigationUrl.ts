const NAVIGATION_QUERY_PARAMETER = "nav";
const SAFE_NAVIGATION_SLUG = /^[a-z0-9][a-z0-9._-]*$/;

export const RECOGNITION_SEQUENCE_TABS = ["inputs", "extractions", "test-demo", "sprites"] as const;
export type RecognitionNavigationTab = typeof RECOGNITION_SEQUENCE_TABS[number];
export function isRecognitionNavigationTab(value: unknown): value is RecognitionNavigationTab {
  return typeof value === "string" && RECOGNITION_SEQUENCE_TABS.some(tab => tab === value);
}
export function canonicalRecognitionNavigationTab(value: unknown): RecognitionNavigationTab | null {
  if (value === "game-player") return "test-demo";
  return isRecognitionNavigationTab(value) ? value : null;
}
function isRecognitionNavigationRoot(value: string): boolean {
  return canonicalRecognitionNavigationTab(value) !== null;
}
export const SEQUENCE_VIEW_CHANGED_EVENT = "workbench:sequence-view-changed";
export type VideoImportSurface = "intake" | "sequences";

export function videoImportSurfaceFromUrl(href: string): VideoImportSurface | null {
  const view = navigationSlug(new URL(href).searchParams.get("view") || "");
  if (["visualsequences", "visual-sequences"].includes(view)) return "sequences";
  if (["videoimport", "video-import", "youtube-import", "video",
    "spriteviewer", "sprite-viewer", "sprite-view", "advanced", "vi-advanced",
    "videoimportadvanced", "finish", "videoimportfinish"].includes(view)) return "intake";
  return null;
}

export type VideoImportShellSubview =
  | "sources"
  | "frames"
  | "games"
  | "objects"
  | "sprite-view"
  | "recognition";
export type VideoImportIntegratedFocus = "advanced" | "frames" | null;

export interface VideoImportShellDestination {
  subview: VideoImportShellSubview;
  focus: VideoImportIntegratedFocus;
}

export interface RecognitionNavigationTransform {
  name?: string;
  doer?: string;
  status?: string;
  resultPath?: string;
}

export interface RecognitionNavigationItem {
  id: string;
  transforms?: RecognitionNavigationTransform[];
}

export interface RecognitionNavigationTarget {
  tab: RecognitionNavigationTab;
  rowId?: string;
  inspector?: {
    path: string;
    title: string;
  };
}

export interface ResolvedRecognitionNavigation {
  target: RecognitionNavigationTarget;
  canonicalPath: string[];
  warning: string;
}

export function navigationSlug(value: string): string {
  return value
    .trim()
    .toLowerCase()
    .replace(/[^a-z0-9._-]+/g, "-")
    .replace(/^-+|-+$/g, "");
}

export function navigationPathFromUrl(href: string): string[] {
  const raw = new URL(href).searchParams.get(NAVIGATION_QUERY_PARAMETER)?.trim() || "";
  if (!raw) return [];
  return raw
    .split(",")
    .map(navigationSlug)
    .filter((segment) => SAFE_NAVIGATION_SLUG.test(segment));
}

export function urlWithNavigation(href: string, path: readonly string[]): string {
  const url = new URL(href);
  const canonical = path.map(navigationSlug).filter((segment) => SAFE_NAVIGATION_SLUG.test(segment));
  if (canonical[0] === "game-player") canonical[0] = "test-demo";
  if (canonical.length) url.searchParams.set(NAVIGATION_QUERY_PARAMETER, canonical.join(","));
  else url.searchParams.delete(NAVIGATION_QUERY_PARAMETER);
  return url.toString();
}

export function resolveVideoImportShellDestination(href: string): VideoImportShellDestination {
  if (videoImportSurfaceFromUrl(href) === "sequences") return { subview: "recognition", focus: null };
  const url = new URL(href);
  const view = navigationSlug(url.searchParams.get("view") || "");
  const subview = navigationSlug(url.searchParams.get("subview") || "");
  const navigation = navigationPathFromUrl(href);
  const root = navigation[0] || "";
  if (
    ["spriteviewer", "sprite-viewer", "sprite-view"].includes(view)
    || ["spriteviewer", "sprite-viewer", "sprite-view"].includes(subview)
    || root === "sprite-view"
  ) {
    return { subview: "sprite-view", focus: null };
  }
  if (["advanced", "vi-advanced", "videoimportadvanced"].includes(view) || subview === "advanced" || root === "advanced") {
    return { subview: "sources", focus: "advanced" };
  }
  if (["finish", "videoimportfinish"].includes(view) || subview === "finish" || root === "finish") {
    return { subview: "sources", focus: null };
  }
  if (subview === "frames" || root === "frames") {
    return { subview: "sources", focus: "frames" };
  }
  if (root === "game-player" && videoImportSurfaceFromUrl(href) === "intake") {
    return { subview: "recognition", focus: null };
  }
  const visible = new Set<VideoImportShellSubview>([
    "sources",
    "games",
    "objects",
    "sprite-view",
    "recognition",
  ]);
  return {
    subview: visible.has(subview as VideoImportShellSubview)
      ? subview as VideoImportShellSubview
      : "sources",
    focus: null,
  };
}

export function canonicalVideoImportShellUrl(
  href: string,
  destination: VideoImportShellDestination,
): string {
  const url = new URL(href);
  if (videoImportSurfaceFromUrl(href) === "sequences") {
    url.searchParams.set("view", "visualSequences");
    url.searchParams.set("subview", "recognition");
    const navigation = navigationPathFromUrl(href);
    const root = navigation.findIndex(isRecognitionNavigationRoot);
    const path = root < 0 ? ["extractions"] : navigation.slice(root);
    path[0] = canonicalRecognitionNavigationTab(path[0]) || "extractions";
    return urlWithNavigation(url.href, path[0] === "extractions" ? path : path.slice(0, 1));
  }
  url.searchParams.set("view", "videoImport");
  url.searchParams.set("subview", destination.subview);
  if (destination.focus) {
    url.searchParams.set(NAVIGATION_QUERY_PARAMETER, destination.focus);
  } else if (destination.subview === "sprite-view") {
    url.searchParams.set(NAVIGATION_QUERY_PARAMETER, "sprite-view");
  } else if (destination.subview === "recognition") {
    const navigation = navigationPathFromUrl(href);
    const root = navigation.findIndex(isRecognitionNavigationRoot);
    if (root >= 0) {
      const path = navigation.slice(root);
      path[0] = canonicalRecognitionNavigationTab(path[0])!;
      return urlWithNavigation(url.href, path[0] === "extractions" ? path : path.slice(0, 1));
    }
    url.searchParams.delete(NAVIGATION_QUERY_PARAMETER);
  } else {
    url.searchParams.delete(NAVIGATION_QUERY_PARAMETER);
  }
  return url.toString();
}

export function videoImportUrlForSubview(href: string, subview: string): string {
  const requested = new URL(href);
  requested.searchParams.set("view", "videoImport");
  requested.searchParams.set("subview", subview);
  // A new menu choice supersedes the old page's navigation, but canonicalizing
  // the original URL still preserves valid Recognition detail and other context.
  requested.searchParams.delete(NAVIGATION_QUERY_PARAMETER);
  const context = new URL(href);
  context.searchParams.set("view", "videoImport");
  return canonicalVideoImportShellUrl(context.href, resolveVideoImportShellDestination(requested.toString()));
}

export function visualSequenceSpriteViewUrl(href: string): string {
  return videoImportSurfaceFromUrl(href) === "sequences"
    ? visualSequencesUrlForNavigation(href, ["sprites"])
    : videoImportUrlForSubview(href, "sprite-view");
}

export function visualSequencesUrlForNavigation(href: string, path?: readonly string[]): string {
  const url = new URL(href);
  url.searchParams.set("view", "visualSequences");
  return canonicalVideoImportShellUrl(
    path ? urlWithNavigation(url.href, path) : url.href,
    { subview: "recognition", focus: null },
  );
}

export function inspectorNavigationSlug(transform: RecognitionNavigationTransform): string {
  return navigationSlug(`${transform.name || "prolog"}-${transform.doer || "source"}`);
}

export function resolveRecognitionNavigation(
  requestedPath: readonly string[],
  items: readonly RecognitionNavigationItem[],
  defaultTab: RecognitionNavigationTab = "extractions",
): ResolvedRecognitionNavigation {
  const normalized = requestedPath.map(navigationSlug).filter(Boolean);
  const rootIndex = normalized.findIndex(isRecognitionNavigationRoot);
  if (rootIndex < 0) {
    return {
      target: { tab: defaultTab },
      canonicalPath: [defaultTab],
      warning: normalized.length
        ? `Unknown navigation "${normalized.join(",")}". Restored ${defaultTab}.`
        : "",
    };
  }

  const tab = canonicalRecognitionNavigationTab(normalized[rootIndex])!;
  let warning = rootIndex > 0
    ? `Ignored stale navigation prefix "${normalized.slice(0, rootIndex).join(",")}".`
    : "";
  if (tab !== "extractions") {
    if (normalized.length > rootIndex + 1) warning ||= `${tab} has no deeper navigation target.`;
    return { target: { tab }, canonicalPath: [tab], warning };
  }

  const rowSlug = normalized[rootIndex + 1];
  if (!rowSlug) return { target: { tab }, canonicalPath: [tab], warning };
  const rowMatches = items.filter((item) => navigationSlug(String(item.id)) === rowSlug);
  if (rowMatches.length !== 1) {
    warning ||= rowMatches.length > 1
      ? `Extraction row "${rowSlug}" is ambiguous.`
      : `Extraction row "${rowSlug}" is unavailable.`;
    return { target: { tab }, canonicalPath: [tab], warning };
  }

  const row = rowMatches[0];
  const canonicalPath = [tab, rowSlug];
  const target: RecognitionNavigationTarget = { tab, rowId: String(row.id) };
  const inspectorMarker = normalized[rootIndex + 2];
  if (!inspectorMarker) return { target, canonicalPath, warning };
  if (inspectorMarker !== "prolog") {
    warning ||= `Unknown extraction destination "${inspectorMarker}".`;
    return { target, canonicalPath, warning };
  }

  const inspectorSlug = normalized[rootIndex + 3];
  if (!inspectorSlug) {
    warning ||= "A Prolog source identifier is required.";
    return { target, canonicalPath, warning };
  }
  const transforms = (row.transforms || []).filter((transform) =>
    transform.status === "done"
    && Boolean(transform.resultPath)
    && String(transform.resultPath).toLowerCase().endsWith(".pl")
    && inspectorNavigationSlug(transform) === inspectorSlug
  );
  if (transforms.length !== 1) {
    warning ||= transforms.length > 1
      ? `Prolog source "${inspectorSlug}" is ambiguous.`
      : `Prolog source "${inspectorSlug}" is unavailable.`;
    return { target, canonicalPath, warning };
  }

  const transform = transforms[0];
  target.inspector = {
    path: String(transform.resultPath),
    title: `${transform.name} / ${transform.doer}`,
  };
  canonicalPath.push("prolog", inspectorSlug);
  if (normalized.length > rootIndex + 4) warning ||= "Ignored stale navigation suffix.";
  return { target, canonicalPath, warning };
}
