export type CompactMetadataKind = "group_acceptance_0" | "observation_identity_0";
export type CompactTransformTone = "done" | "pending" | "running" | "error" | "missing" | "stale";

export interface CompactTransformInput {
  name?: string;
  doer?: string;
  output?: string;
  status?: string;
  dependsOn?: string[];
  elapsedMs?: number;
  completedAt?: string;
  startedAt?: string;
  claimedAt?: string;
  error?: string;
  resultPath?: string;
  summary?: Record<string, unknown>;
}

export interface CompactTransformStatus {
  label: string;
  tone: CompactTransformTone;
  title: string;
  clickable: boolean;
}

function count(summary: Record<string, unknown>, key: string): number | null {
  const value = summary[key];
  return typeof value === "number" && Number.isFinite(value) ? value : null;
}

function elapsedLabel(milliseconds: unknown): string {
  if (typeof milliseconds !== "number" || !Number.isFinite(milliseconds)) return "";
  return milliseconds >= 1000
    ? `${(milliseconds / 1000).toFixed(1)}s`
    : `${Math.round(milliseconds)}ms`;
}

function doneLabel(
  kind: CompactMetadataKind,
  summary: Record<string, unknown>,
): string {
  if (kind === "group_acceptance_0") {
    const total = count(summary, "acceptedGroupCount");
    const modes = [
      ["exactConsensusCount", "exact"],
      ["symbolicShapeAnalogyCount", "shape"],
      ["pixelShapeFallbackCount", "pixel"],
      ["singletonRemainderCount", "single"],
    ]
      .map(([key, label]) => {
        const value = count(summary, key);
        return value ? `${value} ${label}` : "";
      })
      .filter(Boolean);
    return total == null
      ? "G acceptance: done · count unavailable"
      : `G acceptance: ${total} final${modes.length ? ` · ${modes.join(" · ")}` : ""}`;
  }
  const total = count(summary, "observationCount");
  return total == null
    ? "Observation IDs: done · count unavailable"
    : `Observation IDs: ${total} stable`;
}

export function compactTransformStatus(
  kind: CompactMetadataKind,
  transform: CompactTransformInput | undefined,
  selectedExtractor: string,
  doneOutputs: ReadonlySet<string>,
): CompactTransformStatus {
  const prefix = kind === "group_acceptance_0" ? "G acceptance" : "Observation IDs";
  if (!transform) {
    return {
      label: `${prefix}: not available`,
      tone: "missing",
      title: `${kind} is not stamped in this legacy frame`,
      clickable: false,
    };
  }
  const status = String(transform.status || "pending");
  const summary = transform.summary || {};
  const facts = String(summary.partsFacts || "");
  const stale = (
    status === "done"
    && selectedExtractor !== "__all__"
    && Boolean(facts)
    && !facts.startsWith(`parts_extraction_0/${selectedExtractor}/`)
  );
  const missingDependencies = (transform.dependsOn || [])
    .filter((dependency) => !doneOutputs.has(dependency))
    .map((dependency) => dependency.split("/")[0]);
  let label: string;
  let tone: CompactTransformTone;
  if (status === "done") {
    label = doneLabel(kind, summary);
    tone = stale ? "stale" : "done";
    if (stale) label = `${label} · stale`;
  } else if (status === "started" || status === "claimed" || status === "running") {
    label = `${prefix}: running`;
    tone = "running";
  } else if (status === "error") {
    label = `${prefix}: error`;
    tone = "error";
  } else if (status === "missing") {
    label = `${prefix}: not stamped`;
    tone = "missing";
  } else {
    label = missingDependencies.length
      ? `${prefix}: waiting for ${missingDependencies.join(", ")}`
      : `${prefix}: queued`;
    tone = "pending";
  }
  const detail = [
    `${kind} / ${transform.doer || "unknown doer"}`,
    `status: ${status}${stale ? " (stale extractor source)" : ""}`,
    transform.resultPath ? `source: ${transform.resultPath}` : "source: not written",
    facts ? `parts facts: ${facts}` : "",
    transform.elapsedMs != null ? `duration: ${elapsedLabel(transform.elapsedMs)}` : "",
    transform.completedAt ? `completed: ${transform.completedAt}` : "",
    transform.startedAt || transform.claimedAt
      ? `started: ${transform.startedAt || transform.claimedAt}`
      : "",
    transform.error ? `error: ${transform.error}` : "",
    Object.keys(summary).length ? `summary: ${JSON.stringify(summary)}` : "",
  ].filter(Boolean);
  return {
    label,
    tone,
    title: detail.join("\n"),
    clickable: Boolean(transform.resultPath),
  };
}
