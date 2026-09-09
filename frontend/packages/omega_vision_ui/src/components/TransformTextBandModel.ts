// Pure, presentation-free model for the Video Import transform *text/status band*
// (the bottom band). The transform strip is split into two independent bands: a
// top visual/group band (images + V/W/G tree + interactive overlays) and this
// bottom text/status/controls band. The two bands scroll independently and are
// intentionally NOT aligned per cell, so the textual status derives from the
// transform record alone rather than from any visual layout.

export type TransformCellState = "done" | "started" | "error" | "waiting" | "missing";
export type TransformCellTone = "done" | "running" | "error" | "pending" | "missing" | "stale";

export interface TransformTextInput {
  name?: string;
  doer?: string;
  output?: string;
  status?: string;
  dependsOn?: string[];
  elapsedMs?: number;
  claimedBy?: string;
  error?: string;
  resultPath?: string;
  groups?: Array<{ id?: unknown; members?: unknown[] }>;
  partOf?: unknown[];
  background?: unknown[];
  debugImage?: string;
  summary?: Record<string, unknown>;
}

export interface TransformCellText {
  name: string;
  doer: string;
  timing: string;
  state: TransformCellState;
  tone: TransformCellTone;
  stateText: string;
  stats: string[];
  note: string;
  clickable: boolean;
  stale: boolean;
  title: string;
}

const STAT_LABELS: Array<[string, string]> = [
  ["regionCount", "regions"],
  ["adjacencyCount", "adjacent"],
  ["blobCount", "blobs"],
  ["componentCount", "cv components"],
  ["visualGroupCount", "v groups"],
  ["smallFeatureCount", "small marks"],
  ["contourCount", "contours"],
  ["watershedSegmentCount", "watershed segments"],
  ["groupCount", "groups"],
  ["acceptedGroupCount", "g final"],
  ["observationCount", "stable observations"],
  ["objectCount", "objects"],
  ["programCount", "programs"],
];

// Static, data-independent notes that used to live inside the visual cells; they
// belong to the text band now so the visual band stays purely visual.
const STATIC_NOTES: Record<string, string> = {
  parts_debug_0: "compare beside Turtle · same source geometry",
};

function num(summary: Record<string, unknown>, key: string): number | null {
  const value = summary[key];
  return typeof value === "number" && Number.isFinite(value) ? value : null;
}

export function elapsedLabel(milliseconds: unknown): string {
  if (typeof milliseconds !== "number" || !Number.isFinite(milliseconds)) return "";
  return milliseconds >= 1000
    ? `${(milliseconds / 1000).toFixed(1)}s`
    : `${Math.round(milliseconds)}ms`;
}

function buildStats(transform: TransformTextInput): string[] {
  const summary = transform.summary || {};
  const stats: string[] = [];
  const groups = Array.isArray(transform.groups) ? transform.groups : [];
  if (groups.length > 0) {
    stats.push(`${groups.length} groups`);
    if (Array.isArray(transform.partOf) && transform.partOf.length > 0) {
      stats.push(`${transform.partOf.length} part-of`);
    }
    if (Array.isArray(transform.background) && transform.background.length > 0) {
      stats.push(`bg ${transform.background.map(String).join(",")}`);
    }
    return stats;
  }
  for (const [key, label] of STAT_LABELS) {
    const value = num(summary, key);
    if (value != null) stats.push(`${value} ${label}`);
  }
  return stats;
}

function isStale(transform: TransformTextInput, selectedExtractor: string): boolean {
  const facts = String((transform.summary || {}).partsFacts || "");
  return (
    String(transform.status) === "done"
    && selectedExtractor !== "__all__"
    && Boolean(facts)
    && !facts.startsWith(`parts_extraction_0/${selectedExtractor}/`)
  );
}

export function summarizeTransformCell(
  transform: TransformTextInput,
  doneOutputs: ReadonlySet<string>,
  selectedExtractor = "__all__",
): TransformCellText {
  const name = String(transform.name || "transform");
  const doer = String(transform.doer || "");
  const status = String(transform.status || "pending");
  const timing = elapsedLabel(transform.elapsedMs);
  const stale = isStale(transform, selectedExtractor);
  const clickable = Boolean(transform.resultPath);
  const note = STATIC_NOTES[name] || "";

  let state: TransformCellState;
  let tone: TransformCellTone;
  let stateText = "";
  let stats: string[] = [];

  if (status === "done") {
    state = "done";
    tone = stale ? "stale" : "done";
    stats = buildStats(transform);
    if (stale) stateText = "stale source";
  } else if (status === "started" || status === "claimed" || status === "running") {
    state = "started";
    tone = "running";
    stateText = `started${transform.claimedBy ? ` · ${transform.claimedBy}` : ""}`;
  } else if (status === "error") {
    state = "error";
    tone = "error";
    stateText = `error · ${String(transform.error || "transform failed")}`;
  } else if (status === "missing") {
    state = "missing";
    tone = "missing";
    stateText = "not stamped — use Add/Merge todos";
  } else {
    state = "waiting";
    tone = "pending";
    const unmet = (transform.dependsOn || [])
      .filter((dependency) => !doneOutputs.has(String(dependency)))
      .map((dependency) => String(dependency).split("/")[0]);
    stateText = unmet.length ? `waiting for ${unmet.join(", ")}…` : "queued…";
  }

  const title = [
    `${name}${doer ? ` / ${doer}` : ""}`,
    `status: ${status}${stale ? " (stale extractor source)" : ""}`,
    timing ? `duration: ${timing}` : "",
    transform.resultPath ? `source: ${transform.resultPath}` : "source: not written",
    transform.error ? `error: ${transform.error}` : "",
  ].filter(Boolean).join("\n");

  return { name, doer, timing, state, tone, stateText, stats, note, clickable, stale, title };
}
