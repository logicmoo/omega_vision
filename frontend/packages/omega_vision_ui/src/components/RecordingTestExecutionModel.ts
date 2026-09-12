import type { RecordingTest } from "./RecordingTestsModel";

type Json = Record<string, any>;
export type RecordingExecutionContext = { workspaceId: string; test: RecordingTest; visualSequenceId: string };
export type RecordingExecutionRun = Json & {
  id: string; testId: string; revision: number; mode: "step" | "run"; status: string; outcome: string;
  observer: string; learn: boolean; recordings: Json[]; evidence: Json[]; score: Json; limitations: string[];
  progress: { processedFrames: number; totalFrames: number; recordingIndex: number; frameIndex: number | null };
};
export type RecordingExecutionState = {
  context: RecordingExecutionContext; active: boolean; confirmed: boolean; busy: string;
  run: RecordingExecutionRun | null; report: Json | null; history: RecordingExecutionRun[] | null;
  error: string; notice: string; needsRefresh: boolean; unknownCreate: boolean; polling: boolean;
};
const BASE = "/workbench/recognition/recording-tests";
const UUID = /^[0-9a-f]{8}(?:-[0-9a-f]{4}){3}-[0-9a-f]{12}$/;
const HASH = /^[0-9a-f]{64}$/;
const ID = /^[a-z][a-z0-9_]*$/;
const SEQUENCE = /^recordings\/events_tests\/[a-z][a-z0-9_]*$/;
const STATUSES = ["ready", "running", "stopping", "stopped", "completed", "interrupted", "stale", "error"];
const OUTCOMES = ["not_scored", "passed", "failed", "inconclusive", "unsupported"];
const TERMINAL = new Set(["stopped", "completed", "stale", "error"]);
const object = (v: unknown): v is Json => v !== null && typeof v === "object" && !Array.isArray(v);
const text = (v: unknown): v is string => typeof v === "string" && Boolean(v.trim()) && !/[\u0000-\u001f]/.test(v);
const integer = (v: unknown): v is number => Number.isSafeInteger(v) && Number(v) >= 0;
function requireValue(condition: unknown, message: string): asserts condition {
  if (!condition) throw new Error(message);
}
function freeze<T>(value: T): T {
  if (value && typeof value === "object" && !Object.isFrozen(value)) {
    Object.values(value).forEach(freeze); Object.freeze(value);
  }
  return value;
}
function copy<T>(value: T): T { return JSON.parse(JSON.stringify(value)); }
function canonical(value: any): string {
  return JSON.stringify(value && typeof value === "object"
    ? Array.isArray(value) ? value.map(item => JSON.parse(canonical(item)))
      : Object.fromEntries(Object.keys(value).sort().map(key => [key, JSON.parse(canonical(value[key]))]))
    : value);
}
export function recordingExecutionKey(context: RecordingExecutionContext): string {
  return JSON.stringify([context.workspaceId, context.test.id, context.visualSequenceId, context.test.recordings]);
}
export function recordingExecutionContextError(context: RecordingExecutionContext): string {
  const selected = context.test.recordings.filter(item => item.visualSequenceId === context.visualSequenceId);
  return !text(context.workspaceId) || /[\\/:?#%]/.test(context.workspaceId) || !ID.test(context.test.id)
    || !SEQUENCE.test(context.visualSequenceId) || selected.length !== 1 || !integer(selected[0]?.frameCount) || selected[0].frameCount < 1
    ? "Execution requires one exact recording from the current registered test catalog. No family or source fallback is used." : "";
}
export function recordingExecutionCreateBody(context: RecordingExecutionContext, mode: "step" | "run", confirmed: boolean) {
  requireValue(!recordingExecutionContextError(context), recordingExecutionContextError(context));
  requireValue(confirmed === true && ["step", "run"].includes(mode), "Confirm native STM before starting this selected recording.");
  return { workspaceId: context.workspaceId, visualSequenceId: context.visualSequenceId, mode,
    memory: { mode: "native_stm", confirmed: true }, learn: false };
}
function score(value: unknown) {
  requireValue(object(value) && OUTCOMES.slice(1).includes(value.outcome)
    && ["passed", "failed", "inconclusive", "unsupported", "total"].every(key => integer(value[key]))
    && value.total === value.passed + value.failed + value.inconclusive + value.unsupported, "Invalid actual grading counts.");
  requireValue(value.outcome === (value.failed ? "failed" : value.unsupported ? "unsupported"
    : value.inconclusive || !value.total ? "inconclusive" : "passed"), "Grading outcome contradicts its actual counts.");
}
function references(value: unknown) {
  requireValue(Array.isArray(value) && value.every(ref => text(ref) && ref.startsWith("data/")
    && !/[\\:%?]/.test(ref) && ref.split("#").length <= 2
    && ref.split("#")[0].split("/").every(part => part && part !== "." && part !== "..")), "Invalid frozen evidence references.");
}
export function parseRecordingExecutionRun(value: unknown, context: RecordingExecutionContext, expectedId?: string): RecordingExecutionRun {
  requireValue(!recordingExecutionContextError(context), recordingExecutionContextError(context));
  requireValue(object(value) && value.schemaVersion === 1 && typeof value.id === "string" && UUID.test(value.id)
    && (!expectedId || value.id === expectedId) && value.testId === context.test.id
    && value.scope === "selected_recording" && ["step", "run"].includes(value.mode)
    && integer(value.revision) && STATUSES.includes(value.status) && OUTCOMES.includes(value.outcome)
    && text(value.observer) && typeof value.learn === "boolean" && object(value.memory)
    && value.memory.mode === "native_stm" && value.memory.confirmed === true
    && Array.isArray(value.recordings) && value.recordings.length === 1 && object(value.recordings[0])
    && value.recordings[0].visualSequenceId === context.visualSequenceId, "Run does not match this exact registered recording/test.");
  const record = value.recordings[0], progress = value.progress;
  requireValue(integer(record.frameCount) && record.frameCount > 0 && integer(record.processedFrames)
    && record.processedFrames <= record.frameCount && STATUSES.includes(record.status) && OUTCOMES.includes(record.outcome)
    && object(progress) && progress.totalFrames === record.frameCount && progress.processedFrames === record.processedFrames
    && progress.recordingIndex === 0
    && progress.frameIndex === (progress.processedFrames ? progress.processedFrames - 1 : null),
  "Invalid selected-recording causal progress.");
  requireValue(Array.isArray(value.evidence) && value.evidence.length === progress.processedFrames
    && Array.isArray(value.limitations) && value.limitations.every(text)
    && (value.error === undefined || value.error === null || typeof value.error === "string"), "Invalid run evidence or limitations.");
  score(value.score);
  requireValue(value.status !== "completed" || (progress.processedFrames === progress.totalFrames && value.outcome === value.score.outcome),
    "Completion or outcome contradicts the frozen run progress/score.");
  if (value.storedStatus !== undefined || value.storedOutcome !== undefined) {
    requireValue(value.status === "stale" && STATUSES.includes(value.storedStatus) && OUTCOMES.includes(value.storedOutcome),
      "Historical status/outcome is not bound to a stale run.");
  }
  for (const [index, row] of value.evidence.entries()) {
    requireValue(object(row) && row.visualSequenceId === context.visualSequenceId && row.frameId === String(index)
      && HASH.test(row.sourceHash) && HASH.test(row.nativeCheckpointUid)
      && typeof row.atSeconds === "number" && Number.isFinite(row.atSeconds)
      && typeof row.decisionSeconds === "number" && Number.isFinite(row.decisionSeconds)
      && row.frameResultRef === `data/runtime/executions/recording-tests/${value.id}/frames/000-${String(index).padStart(6, "0")}.json`
      && Array.isArray(row.observed) && Array.isArray(row.predictions) && Array.isArray(row.hypotheses)
      && text(row.coreStatus), "Frozen evidence does not match its executed source frame.");
    references(row.memoryRefs); references(row.coreEvidenceRefs);
  }
  return freeze(copy(value)) as RecordingExecutionRun;
}
export function parseRecordingExecutionHistory(value: unknown, context: RecordingExecutionContext): RecordingExecutionRun[] {
  requireValue(object(value) && Array.isArray(value.runs) && value.count === value.runs.length
    && value.runs.every((run: unknown) => object(run) && typeof run.id === "string" && UUID.test(run.id)
      && run.testId === context.test.id && Array.isArray(run.recordings))
    && new Set(value.runs.map((run: Json) => run.id)).size === value.runs.length, "Invalid saved-run history.");
  return value.runs.filter((run: Json) => run.scope === "selected_recording" && run.recordings.length === 1
    && run.recordings[0]?.visualSequenceId === context.visualSequenceId)
    .map((run: unknown) => parseRecordingExecutionRun(run, context));
}
function monotonic(previous: RecordingExecutionRun | null, next: RecordingExecutionRun) {
  if (!previous || previous.id !== next.id) return;
  requireValue(next.revision >= previous.revision && next.progress.processedFrames >= previous.progress.processedFrames
    && previous.evidence.every((row, index) => canonical(row) === canonical(next.evidence[index])),
  "Run revision or frozen past-frame evidence changed. Explicitly reconcile status.");
}
export function parseRecordingExecutionReport(value: unknown, context: RecordingExecutionContext, run: RecordingExecutionRun): Json {
  requireValue(object(value) && value.schemaVersion === 1 && value.version === "recording-test-reports-v1"
    && value.readOnly === true && Array.isArray(value.grading) && value.grading.length === 1, "Invalid frozen run report.");
  const bound = parseRecordingExecutionRun(value.run, context, run.id);
  requireValue(bound.revision === run.revision && canonical(bound.evidence) === canonical(run.evidence)
    && bound.status === run.status && bound.outcome === run.outcome, "Report revision changed; refresh status explicitly.");
  const grading = value.grading[0];
  requireValue(object(grading) && grading.visualSequenceId === context.visualSequenceId
    && ["pending", "available"].includes(grading.status), "Grading belongs to another recording.");
  if (grading.status === "pending") requireValue(grading.result === null && run.recordings[0].status !== "completed", "Missing completed grading.");
  else {
    requireValue(object(grading.result) && Array.isArray(grading.result.checks)
      && grading.result.outcome === run.recordings[0].outcome && HASH.test(grading.gradingHash)
      && grading.result.inferenceFrozenBeforeOracleRead === true && grading.result.oracleGradingIsNativeObservedMemory === false
      && grading.gradingRef === `data/runtime/executions/recording-tests/${run.id}/grading/000.json`, "Invalid evaluator-only frozen grading.");
    score(grading.result);
    requireValue(grading.result.checks.every((check: unknown) => object(check) && text(check.name)
      && OUTCOMES.slice(1).includes(check.outcome)) && grading.result.total === grading.result.checks.length
      && OUTCOMES.slice(1).every(outcome => grading.result[outcome] === grading.result.checks.filter((check: Json) => check.outcome === outcome).length),
    "Invalid per-condition assessment or grading aggregation.");
  }
  return freeze(copy(value));
}
export function canCreateRecordingExecution(state: RecordingExecutionState) {
  return state.active && !state.busy && state.confirmed && !state.needsRefresh && !state.unknownCreate
    && !recordingExecutionContextError(state.context) && (!state.run || TERMINAL.has(state.run.status));
}
export function canStepRecordingExecution(state: RecordingExecutionState) {
  return state.active && !state.busy && state.confirmed && !state.needsRefresh && !state.unknownCreate
    && state.run?.learn === false && state.run.mode === "step" && ["ready", "interrupted"].includes(state.run.status)
    && !state.run.error && state.run.progress.processedFrames < state.run.progress.totalFrames;
}
export function canStopRecordingExecution(state: RecordingExecutionState) {
  return state.active && !state.busy
    && Boolean(state.run && !TERMINAL.has(state.run.status));
}

/** This client never imports browser memory or starts work from an effect/read. */
export function createRecordingTestExecution(context: RecordingExecutionContext, options: {
  transport?: typeof fetch; allowed?: () => boolean; epoch?: () => number;
  schedule?: (task: () => void) => () => void;
} = {}) {
  const transport = options.transport ?? ((url, init) => fetch(url, init));
  const allowed = options.allowed ?? (() => true);
  const schedule = options.schedule ?? (task => { const timer = setTimeout(task, 2000); return () => clearTimeout(timer); });
  let state: RecordingExecutionState = freeze({ context: copy(context), active: true, confirmed: false, busy: "",
    run: null, report: null, history: null, error: "", notice: "", needsRefresh: false, unknownCreate: false, polling: false });
  let generation = 0, controller: AbortController | null = null, cancelTimer: (() => void) | null = null, previewKey = "", pendingWrite = false;
  const listeners = new Set<() => void>();
  const update = (patch: Partial<RecordingExecutionState>) => {
    state = freeze({ ...state, ...patch }); listeners.forEach(listener => listener());
  };
  const pausePolling = () => { cancelTimer?.(); cancelTimer = null; };
  const invalidate = (notice: string) => {
    const write = pendingWrite;
    const uncertain = write ? ` Outcome unknown: ${state.busy} for ${state.context.visualSequenceId}${state.run ? `, run ${state.run.id}` : ""}. Reconcile with read-only history/status; do not replay.` : "";
    ++generation; controller?.abort(); controller = null; pendingWrite = false; pausePolling();
    update({ busy: "", polling: false, confirmed: false, report: null,
      needsRefresh: state.needsRefresh || Boolean(state.run) || write,
      unknownCreate: state.unknownCreate || (write && state.busy === "create"), notice: notice + uncertain });
  };
  async function request(path: string, body: unknown, signal: AbortSignal) {
    const response = await transport(`${BASE}${path}`, { method: body ? "POST" : "GET", cache: "no-store", redirect: "error", signal,
      ...(body ? { headers: { "Content-Type": "application/json" }, body: JSON.stringify(body) } : {}) });
    const raw = await response.text();
    let value: any;
    try { value = JSON.parse(raw); } catch {
      if (!response.ok) throw Object.assign(new Error(`HTTP ${response.status}: ${raw || "Empty API response"}`), { status: response.status });
      throw new Error(`HTTP ${response.status}: Invalid JSON response`);
    }
    if (!response.ok) throw Object.assign(new Error(`HTTP ${response.status}: ${typeof value?.detail === "string" ? value.detail : JSON.stringify(value?.detail ?? value)}`),
      { status: response.status });
    return value;
  }
  const query = () => `?workspaceId=${encodeURIComponent(state.context.workspaceId)}`;
  const armPolling = () => {
    pausePolling();
    if (state.active && allowed() && state.polling && !state.needsRefresh && state.run?.mode === "run"
      && ["ready", "running", "stopping"].includes(state.run.status)) cancelTimer = schedule(() => { void refresh(true); });
  };
  async function perform(action: string, path: string, body?: unknown, expectedId?: string) {
    if (!state.active || !allowed() || state.busy || recordingExecutionContextError(state.context)) return;
    pausePolling();
    const token = ++generation, abort = new AbortController(), bound = state.context, old = state.run, epoch = options.epoch?.();
    let acknowledged = false;
    controller = abort;
    update({ busy: action, error: "", report: action === "history" ? state.report : null });
    const current = () => token === generation && !abort.signal.aborted && state.active && allowed() && epoch === options.epoch?.();
    try {
      if (!current()) return;
      pendingWrite = Boolean(body);
      const value = await request(path, body, abort.signal);
      if (!current()) return;
      if (action === "history") update({ history: parseRecordingExecutionHistory(value, bound),
        needsRefresh: state.run || state.unknownCreate ? state.needsRefresh : false });
      else {
        const run = parseRecordingExecutionRun(value, bound, expectedId);
        monotonic(old, run);
        if (action === "create") requireValue(run.learn === false && run.mode === (body as Json).mode
          && run.recordings[0].frameCount === bound.test.recordings.find(item => item.visualSequenceId === bound.visualSequenceId)!.frameCount,
        "Created run changed the requested execution policy/source.");
        pendingWrite = false; acknowledged = true;
        update({ run, needsRefresh: false, polling: run.mode === "run" && ["ready", "running", "stopping"].includes(run.status),
          notice: state.unknownCreate ? state.notice : "Actual selected-recording run. Preview navigation does not advance execution." });
        if (run.status === "completed" && current()) {
          const report = await request(`/runs/${run.id}/report?workspaceId=${encodeURIComponent(bound.workspaceId)}`, undefined, abort.signal);
          if (current()) update({ report: parseRecordingExecutionReport(report, bound, run) });
        }
      }
    } catch (error) {
      if (!current()) return;
      const rejected = error instanceof Error && "status" in error && Number(error.status) >= 400 && Number(error.status) < 500;
      update({ error: String(error), polling: false, needsRefresh: !(action === "create" && rejected && !state.run),
        unknownCreate: state.unknownCreate || (action === "create" && !acknowledged && !rejected),
        notice: acknowledged ? "Run status was received; its frozen report is unavailable. Refresh explicitly; no execution was retried."
          : body ? `${rejected ? "Request rejected" : "Outcome requires reconciliation"}: ${action} for ${bound.visualSequenceId}${expectedId ? `, run ${expectedId}` : ""}. Refresh history/status explicitly; no POST is retried.` : state.notice });
    } finally {
      if (token === generation) {
        if (!current()) invalidate("Visibility changed; the late response was ignored.");
        else { controller = null; pendingWrite = false; update({ busy: "" }); armPolling(); }
      }
    }
  }
  async function refresh(poll = false) {
    if (!state.run || (poll && (!state.polling || state.needsRefresh))) return;
    await perform(poll ? "poll" : "refresh", `/runs/${state.run.id}${query()}`, undefined, state.run.id);
  }
  return {
    getSnapshot: () => state,
    subscribe(listener: () => void) { listeners.add(listener); return () => { listeners.delete(listener); }; },
    setContext(next: RecordingExecutionContext, nextPreviewKey = "") {
      if (recordingExecutionKey(next) !== recordingExecutionKey(state.context)) {
        const previous = state.run;
        invalidate(`Source changed. ${previous ? `Previous run ${previous.id} belongs to ${state.context.visualSequenceId}; closing does not stop it.` : "Previous results cleared."}`);
        update({ context: copy(next), run: null, history: null, error: "", needsRefresh: false, unknownCreate: false });
      } else if (previewKey !== nextPreviewKey) invalidate("Preview frame changed; frozen run evidence was not recomputed. Refresh status before further writes.");
      previewKey = nextPreviewKey;
    },
    setActive(active: boolean) {
      if (active === state.active) return;
      if (!active) invalidate(state.run || state.busy || state.unknownCreate
        ? "Monitoring paused. Already-issued server work continues; Stop is required. Refresh status after returning." : "");
      update({ active });
    },
    suspend() {
      invalidate(state.run || state.busy || state.unknownCreate ? "View closed or suspended. Already-issued server work continues; Stop is required." : "");
      update({ active: false });
    },
    confirm(confirmed: boolean) { if (!state.busy) update({ confirmed }); },
    async start(mode: "step" | "run") {
      if (!canCreateRecordingExecution(state) || !allowed()) return;
      await perform("create", `/${state.context.test.id}/runs`, recordingExecutionCreateBody(state.context, mode, state.confirmed));
    },
    async step() {
      if (!canStepRecordingExecution(state) || !allowed() || !state.run) return;
      await perform("step", `/runs/${state.run.id}/step`, { workspaceId: state.context.workspaceId, expectedRevision: state.run.revision }, state.run.id);
    },
    async stop() {
      if (!canStopRecordingExecution(state) || !allowed() || !state.run) return;
      await perform("stop", `/runs/${state.run.id}/stop`, { workspaceId: state.context.workspaceId }, state.run.id);
    },
    refresh: () => refresh(),
    refreshHistory: () => perform("history", `/${state.context.test.id}/runs${query()}`),
    async load(id: string) {
      if (!state.history?.some(run => run.id === id) || state.busy) return;
      update({ confirmed: false });
      await perform("load", `/runs/${id}${query()}`, undefined, id);
    },
    acknowledgeReconciledCreate() {
      if (state.run && state.history?.some(run => run.id === state.run?.id) && !state.needsRefresh && !state.busy)
        update({ unknownCreate: false, notice: "You identified the previously issued run from saved history. No request was replayed." });
    },
  };
}
