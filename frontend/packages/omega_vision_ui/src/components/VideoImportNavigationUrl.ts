const NAVIGATION_QUERY_PARAMETER = "nav";
const SAFE_NAVIGATION_SLUG = /^[a-z0-9][a-z0-9._-]*$/;

export type RecognitionNavigationTab = "inputs" | "extractions";
export type VideoImportShellSubview =
  | "sources"
  | "frames"
  | "games"
  | "objects"
  | "sprite-view"
  | "recognition";
export type VideoImportIntegratedFocus = "advanced" | null;

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
  if (canonical.length) url.searchParams.set(NAVIGATION_QUERY_PARAMETER, canonical.join(","));
  else url.searchParams.delete(NAVIGATION_QUERY_PARAMETER);
  return url.toString();
}

export function resolveVideoImportShellDestination(href: string): VideoImportShellDestination {
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
  const visible = new Set<VideoImportShellSubview>([
    "sources",
    "frames",
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
  url.searchParams.set("view", "videoImport");
  url.searchParams.set("subview", destination.subview);
  if (destination.focus) {
    url.searchParams.set(NAVIGATION_QUERY_PARAMETER, destination.focus);
  } else if (destination.subview === "sprite-view") {
    url.searchParams.set(NAVIGATION_QUERY_PARAMETER, "sprite-view");
  } else if (
    destination.subview === "recognition"
    && !["inputs", "extractions"].includes(navigationPathFromUrl(href)[0] || "")
  ) {
    url.searchParams.delete(NAVIGATION_QUERY_PARAMETER);
  } else if (destination.subview !== "recognition") {
    url.searchParams.delete(NAVIGATION_QUERY_PARAMETER);
  }
  return url.toString();
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
  const rootIndex = normalized.findIndex((segment) => segment === "inputs" || segment === "extractions");
  if (rootIndex < 0) {
    return {
      target: { tab: defaultTab },
      canonicalPath: [defaultTab],
      warning: normalized.length
        ? `Unknown navigation "${normalized.join(",")}". Restored ${defaultTab}.`
        : "",
    };
  }

  const tab = normalized[rootIndex] as RecognitionNavigationTab;
  let warning = rootIndex > 0
    ? `Ignored stale navigation prefix "${normalized.slice(0, rootIndex).join(",")}".`
    : "";
  if (tab === "inputs") {
    if (normalized.length > rootIndex + 1) warning ||= "Inputs has no deeper navigation target.";
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
