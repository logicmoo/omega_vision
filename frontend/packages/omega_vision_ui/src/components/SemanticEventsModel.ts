export type SemanticRecord = Record<string, unknown>;

export type SemanticRuleContext = {
  workspaceId: string;
  sequenceId: string;
  frameId: string;
  proposalFrameId: string;
};

export function scopedCandidateBody(
  action: string, kind: unknown, body: SemanticRecord, context: SemanticRuleContext,
): SemanticRecord {
  if (Object.values(context).some(value => !value.trim())) {
    throw new Error("Select an actual current frame and proposal frame before acting on a rule.");
  }
  if (action === "evaluate" && kind === "grouping") {
    return { ...context, evaluationSequenceId: body.evaluationSequenceId ?? body.sequenceId,
      partition: body.partition, labels: body.labels };
  }
  if (action === "deployment") {
    return { ...context, reviewer: body.reviewer, reason: body.reason };
  }
  return { ...body, ...context };
}

export type SemanticPlan = {
  stageId: string;
  label: string;
  frameCount: number;
  pairCount: number;
  llmCallCount: number;
  modelId: string;
  backendId: string;
  cost: unknown;
  blockedReasons: string[];
  confirmationKey: string;
  raw: SemanticRecord;
};

export function planConfirmationError(
  plan: SemanticPlan, acknowledged: boolean, callCount: string, largeFrameCount: string,
): string | undefined {
  if (plan.blockedReasons.length) return plan.blockedReasons.join("; ");
  if (![plan.frameCount, plan.pairCount, plan.llmCallCount].every((value) => Number.isSafeInteger(value) && value >= 0)) {
    return "The server did not provide valid frame, pair and call counts.";
  }
  if (plan.llmCallCount > 0) {
    if (!plan.modelId || !plan.backendId) return "The effective model and backend must be resolved before a paid call.";
    if (!acknowledged) return "Confirm that images and context may leave the application.";
    if (callCount.trim() !== String(plan.llmCallCount)) return "Enter the exact planned LLM call count.";
  }
  if (plan.frameCount > 800 && largeFrameCount.trim() !== String(plan.frameCount)) {
    return "Confirm the exact frame count for this large sequence.";
  }
  return undefined;
}

export function isRecord(value: unknown): value is SemanticRecord {
  return value !== null && typeof value === "object" && !Array.isArray(value);
}

export function record(value: unknown, label = "record"): SemanticRecord {
  if (!isRecord(value)) throw new Error(`Invalid semantic API response: ${label} must be an object.`);
  return value;
}

export function records(value: unknown, label = "records"): SemanticRecord[] {
  if (!Array.isArray(value) || !value.every(isRecord)) {
    throw new Error(`Invalid semantic API response: ${label} must be an array of objects.`);
  }
  return value;
}

export function groupingDeploymentSource(candidate: SemanticRecord): string | undefined {
  if (candidate.kind !== "grouping" || candidate.status === "rejected" || !Array.isArray(candidate.proposals)) return undefined;
  const proposals = candidate.proposals.filter(isRecord);
  if (proposals.some((proposal) => isRecord(proposal.provenance) && isRecord(proposal.provenance.groupingDeployment))) return undefined;
  for (const proposal of proposals) {
    const provenance = proposal.provenance;
    if (proposal.source !== "measured_grouping_induction" || !isRecord(provenance) || !isRecord(provenance.groupingTraining)) continue;
    const sequence = provenance.groupingTraining.sequenceId;
    if (typeof sequence === "string" && sequence.trim()) return sequence;
  }
  return undefined;
}

export function groupingDeploymentRequest(
  candidate: SemanticRecord, workspaceId: string, trainingSequenceId: string,
  reviewer: string, reason: string, trainingFrameId = "",
): SemanticRecord {
  if (!groupingDeploymentSource(candidate)) throw new Error("Select an original measured grouping proposal, not a deployment or rejected rule.");
  if (![workspaceId, trainingSequenceId, reviewer, reason].every((value) => value.trim())) {
    throw new Error("Deployment creation requires a workspace, training checkpoint sequence, reviewer and rationale.");
  }
  return {
    workspaceId, trainingSequenceId: trainingSequenceId.trim(),
    reviewer: reviewer.trim(), reason: reason.trim(),
    ...(trainingFrameId.trim() ? { trainingFrameId: trainingFrameId.trim() } : {}),
  };
}

export function text(value: unknown): string {
  if (value === null || value === undefined) return "Not recorded";
  return typeof value === "string" ? value : JSON.stringify(value);
}

export function strings(value: unknown): string[] {
  return Array.isArray(value) ? value.filter((item): item is string => typeof item === "string") : [];
}

export function errorMessage(reason: unknown): string {
  return reason instanceof Error ? reason.message : text(reason);
}

export class SemanticApiError extends Error {
  readonly status: number;
  readonly detail: unknown;

  constructor(status: number, detail: unknown) {
    super(`Semantic API HTTP ${status}: ${text(detail)}`);
    this.name = "SemanticApiError";
    this.status = status;
    this.detail = detail;
  }
}

export function isUninitializedCanonicalLog(reason: unknown): boolean {
  return reason instanceof SemanticApiError && reason.status === 404
    && typeof reason.detail === "string"
    && /^['"]?sequence log has not been initialized: /.test(reason.detail);
}

export async function semanticJson(url: string, init: RequestInit = {}): Promise<unknown> {
  const response = await fetch(url, { ...init, cache: "no-store" });
  const body = await response.text();
  let payload: unknown;
  try {
    payload = JSON.parse(body);
  } catch {
    throw new Error(`Semantic API HTTP ${response.status}: ${body.slice(0, 600) || "empty response"}`);
  }
  if (!response.ok) {
    const detail = isRecord(payload) ? payload.detail ?? payload.error ?? payload : payload;
    throw new SemanticApiError(response.status, detail);
  }
  return payload;
}

export function semanticUrl(path: string, workspaceId: string, sequenceId?: string, firstN?: number): string {
  const query = new URLSearchParams({ workspaceId });
  if (sequenceId) query.set("sequenceId", sequenceId);
  if (firstN !== undefined) query.set("firstN", String(firstN));
  return `/workbench/video-import/semantic${path}?${query}`;
}

export function selectionAfterRefresh(selected: string, rows: SemanticRecord[], idField: string): string {
  return rows.some((item) => item[idField] === selected) ? selected : "";
}

export function savedSourceReferences(value: unknown): string[] {
  const found = new Set<string>();
  const fields = new Set(["prompt_ref", "raw_output_ref", "promoted_rule_ref", "rule_ref"]);
  function visit(item: unknown) {
    if (Array.isArray(item)) { item.forEach(visit); return; }
    if (!isRecord(item)) return;
    for (const [key, child] of Object.entries(item)) {
      if (fields.has(key) && typeof child === "string" && /\.(jsonl?|txt|md|pl|prolog|metta)$/i.test(child)) found.add(child);
      else if (typeof child === "object") visit(child);
    }
  }
  visit(value);
  return [...found];
}

export function assessmentLabel(value: unknown): string {
  switch (value) {
    case "initial_observation": return "Initial observation · no predecessor";
    case "no_material_change": return "Adequately compared · no material change";
    case "unknown": return "Unknown · insufficient evidence";
    case "changed": return "Changed";
    default: return text(value);
  }
}

export function episodeDuration(episode: SemanticRecord): string {
  const frames = episode.duration_frames;
  if (typeof frames !== "number" || !Number.isFinite(frames)) return "Duration not recorded";
  return `${episode.duration_is_lower_bound === true ? "At least " : ""}${frames} frame interval${frames === 1 ? "" : "s"}`;
}

export function semanticOutputDetail(output: SemanticRecord) {
  const details: Array<{ kind: string; label: string; value: string }> = [];
  for (const [kind, label] of [["staleReason", "Stale reason"], ["error", "Error"], ["summary", "Summary"]]) {
    const value = output[kind];
    if (kind === "error" && isRecord(value) && Object.keys(value).length === 0) continue;
    if (kind === "staleReason" && value === "current") continue;
    if (value !== undefined && value !== null && value !== "") details.push({ kind, label, value: text(value) });
  }
  return { status: text(output.status), details };
}

export function observeSemanticJobs(previous: ReadonlyMap<string, string>, jobs: SemanticRecord[]) {
  const states = new Map(previous);
  const completedJobIds: string[] = [];
  const active = new Set(["running", "starting", "queued"]);
  const terminal = new Set(["done", "error", "cancelled", "interrupted"]);
  for (const job of jobs) {
    if (typeof job.id !== "string" || !job.id || typeof job.state !== "string") continue;
    if (active.has(states.get(job.id) ?? "") && terminal.has(job.state)) completedJobIds.push(job.id);
    states.set(job.id, job.state);
  }
  return { states, completedJobIds };
}

export function entryFrames(entry: SemanticRecord): string[] {
  const pair = isRecord(entry.source_pair) ? entry.source_pair : entry;
  return [...new Set([entry.frame_id, pair.from_frame, pair.to_frame].filter(
    (value): value is string => typeof value === "string" && value.length > 0,
  ))];
}

export function entryChannel(entry: SemanticRecord): string {
  if (entry.kind === "user_action") return "Authoritative action";
  if (entry.kind === "frame_event") return "Prolog deduction";
  if (entry.kind === "frame_assessment") return "Boundary assessment";
  if (entry.kind === "transition_assessment") return "Pair assessment";
  return text(entry.kind);
}

export function latestEvaluation(candidate: SemanticRecord): SemanticRecord | undefined {
  if (!Array.isArray(candidate.evaluations)) return undefined;
  const latest = candidate.evaluations.at(-1);
  return isRecord(latest) ? latest : undefined;
}

export function promotionBlocker(candidate: SemanticRecord): string | undefined {
  if (candidate.status === "promoted") return "Already promoted.";
  if (candidate.status === "rejected") return "Rejected candidates cannot be promoted.";
  const evaluation = latestEvaluation(candidate);
  if (!evaluation) return "Evaluate this candidate against persisted evidence first.";
  if (evaluation.eligible !== true) return strings(evaluation.reasons).join("; ") || "Server evidence gates are not satisfied.";
  if (candidate.status !== "eligible") return "Evaluate again: lifecycle state is not eligible.";
  return undefined;
}

export type HypothesisComparison = {
  status: "not_assessed" | "invalid" | "not_deduced" | "agreement" | "disagreement";
  label: string;
};

export function compareHypotheses(
  hypothesis: SemanticRecord,
  canonical: SemanticRecord[],
): HypothesisComparison {
  if (hypothesis.status === "invalid") return { status: "invalid", label: "Invalid hypothesis · inspect validation errors" };
  if (!isRecord(hypothesis.parsed)) return { status: "not_assessed", label: "Raw response · validation not recorded" };
  const parsed = hypothesis.parsed;
  if (typeof parsed.pair_id !== "string" || !Array.isArray(parsed.events) || !parsed.events.every(isRecord)) {
    return { status: "invalid", label: "Invalid saved hypothesis shape · inspect its source record" };
  }
  const assessment = canonical.find((item) => item.kind === "transition_assessment" && item.pair_id === parsed.pair_id);
  if (!assessment) return { status: "not_deduced", label: "Prolog assessment not available" };
  if (assessment.assessment === "unknown" || parsed.assessment === "unknown") {
    return { status: "not_assessed", label: "Uncovered · comparison evidence is insufficient" };
  }
  const actual = canonical.filter((item) => item.kind === "frame_event" && item.assessment_id === assessment.assessment_id)
    .map((item) => text(item.canonical_term)).sort();
  const proposed = records(parsed.events, "hypothesis events").map((item) => text(item.canonical_term)).sort();
  const agrees = assessment.assessment === parsed.assessment && JSON.stringify(actual) === JSON.stringify(proposed);
  return { status: agrees ? "agreement" : "disagreement", label: agrees ? "Agreement · remains advisory" : "Disagreement · remains advisory" };
}

/** Aborting fetch cannot undo server work; this guard only prevents cross-context UI updates. */
export function createRequestScope() {
  let revision = 0;
  let controller = new AbortController();
  return {
    capture() {
      const captured = revision;
      const signal = controller.signal;
      return { signal, current: () => captured === revision && !signal.aborted };
    },
    invalidate() {
      controller.abort();
      controller = new AbortController();
      revision += 1;
    },
  };
}
