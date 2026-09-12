import { isRecord, planConfirmationError, type SemanticPlan } from "./SemanticEventsModel";
import type { DirectComposite } from "./DirectCompositePickerModel";

export const ROW_EXECUTION_API = "/workbench/video-import";
export type RowCallContext = { workspaceId: string; sequenceId: string; frameId: string | null };
export type RowCallRequest = RowCallContext & { frameId: string; stageId: string };
export type RowTargetEligibility = { stageIds: string[]; llmStageIds: string[] };
type RecordValue = Record<string, unknown>;
type RowPost = (url: string, body: RecordValue, signal: AbortSignal, progress?: (value: RecordValue) => void, readOnly?: boolean) => Promise<unknown>;
type TargetContext = {
  currentFrameId: string; currentFrameOrder: number;
  previousFrameId: string | null; status: string;
};
export type RowCallPlan = SemanticPlan & {
  request: RowCallRequest; target: TargetContext; supportFrameIds: string[];
};
export type RowCallJob = {
  id: string; request: RowCallRequest; state: string; done: number; total: number;
  error: string; cancelling: boolean; raw: RecordValue;
};
export type RowCallState = {
  stageId: string; plan: RowCallPlan | null; job: RowCallJob | null;
  busy: "planning" | "committing" | null; reading: boolean; stopping: boolean;
  error: string; statusError: string; uncertain: boolean;
};

export function actualRowFrameId(unitId: unknown): string | null {
  const value = typeof unitId === "string" ? unitId
    : typeof unitId === "number" && Number.isSafeInteger(unitId) && unitId >= 0 ? String(unitId) : "";
  return value && value === value.trim() && value.length <= 512 && !/[\u0000-\u001f\u007f]/.test(value)
    ? value : null;
}

export function rowStageAvailable(entry: DirectComposite | undefined): boolean {
  return Boolean(entry?.available === true && ["py_pl", "native"].includes(entry.type ?? ""));
}

function rowSourceRequest(context: RowCallContext): RowCallContext & { frameId: string } {
  if (!context.frameId) throw new Error("This row has no actual unitId. Its display ID cannot be used for execution.");
  if (!context.workspaceId || !/^data\/(recordings|curated)\//.test(context.sequenceId)
      || context.sequenceId.split("/").some(part => !part || part === "." || part === "..")
      || /[\\%?#:\u0000-\u001f]/.test(context.sequenceId)) {
    throw new Error("Select a writable shared Visual Sequence in recordings or curated.");
  }
  return { workspaceId: context.workspaceId, sequenceId: context.sequenceId, frameId: context.frameId };
}

export function rowCallRequest(context: RowCallContext, stageId: string, catalog: readonly DirectComposite[]): RowCallRequest {
  const source = rowSourceRequest(context);
  if (!rowStageAvailable(catalog.find(entry => entry.id === stageId))) {
    throw new Error("Choose an available registered native / py_pl stage. LLM stages use the existing rich controls.");
  }
  return { ...source, stageId };
}

export function rowTargetEligibilityError(stageId: string, eligibility: RowTargetEligibility | null): string | undefined {
  if (!eligibility) return "Open the stage picker to check supported row targets.";
  if (!eligibility.stageIds.includes(stageId)) return "Not supported as a confirmed row target";
  if (eligibility.llmStageIds.includes(stageId)) return "LLM target: use the existing rich controls and their confirmations.";
  return undefined;
}

export function parseRowTargetEligibility(value: unknown, context: RowCallContext): RowTargetEligibility {
  if (!context.frameId || !isRecord(value) || value.targetFrameId !== context.frameId || value.frameCount !== 1
      || !Array.isArray(value.frames) || value.frames.length !== 1
      || !isRecord(value.frames[0]) || value.frames[0].id !== context.frameId
      || !Array.isArray(value.stages) || value.stages.some(stage => !isRecord(stage)
        || typeof stage.id !== "string" || actualRowFrameId(stage.id) !== stage.id || typeof stage.llm !== "boolean")) {
    throw new Error("The server did not return supported stages for this actual row.");
  }
  const stages = value.stages as { id: string; llm: boolean }[];
  if (new Set(stages.map(stage => stage.id)).size !== stages.length) throw new Error("The supported-stage response has duplicate identities.");
  return { stageIds: stages.map(stage => stage.id), llmStageIds: stages.filter(stage => stage.llm).map(stage => stage.id) };
}

export async function loadRowTargetEligibility(context: RowCallContext, post: RowPost, signal: AbortSignal): Promise<RowTargetEligibility> {
  const body = rowSourceRequest(context);
  signal.throwIfAborted();
  const value = await post(`${ROW_EXECUTION_API}/semantic/execution/read`, body, signal, undefined, true);
  signal.throwIfAborted();
  return parseRowTargetEligibility(value, body);
}

const requestKey = (request: RowCallRequest) => JSON.stringify(request);
const count = (value: unknown) => typeof value === "number" && Number.isSafeInteger(value) && value >= 0;
function frameIds(value: unknown): string[] {
  if (!Array.isArray(value) || value.some(id => typeof id !== "string" || actualRowFrameId(id) !== id)
      || new Set(value).size !== value.length) throw new Error("The response has invalid frame identities.");
  return value;
}
function targetContext(value: unknown, frameId: string): TargetContext {
  if (!isRecord(value) || value.currentFrameId !== frameId || !count(value.currentFrameOrder)
      || !["pair", "initial_observation", "unordered_input", "no_predecessor"].includes(String(value.status))
      || !(value.previousFrameId === null || typeof value.previousFrameId === "string" && actualRowFrameId(value.previousFrameId))
      || value.previousFrameId === frameId
      || value.currentFrameOrder === 0 && value.previousFrameId !== null) {
    throw new Error("The response does not identify this actual frame and its predecessor.");
  }
  return value as TargetContext;
}
function boundFrames(value: RecordValue, request: RowCallRequest) {
  const requested = frameIds(value.requestedFrameIds);
  if (value.targetFrameId !== request.frameId || requested.length !== 1 || requested[0] !== request.frameId) {
    throw new Error("The response targets another frame or a whole-sequence call.");
  }
  return { target: targetContext(value.targetContext, request.frameId), supportFrameIds: frameIds(value.supportFrameIds) };
}

export function parseRowCallPlan(value: unknown, request: RowCallRequest): RowCallPlan {
  if (!isRecord(value) || !isRecord(value.raw)) throw new Error("The server did not return an execution plan.");
  const raw = value.raw;
  if (value.stageId !== request.stageId || raw.composite !== request.stageId
      || raw.sequenceId !== request.sequenceId || raw.workspaceId !== request.workspaceId
      || typeof value.confirmationKey !== "string" || !value.confirmationKey
      || ![value.frameCount, value.pairCount, value.llmCallCount].every(count)
      || !Array.isArray(value.blockedReasons) || value.blockedReasons.some(reason => typeof reason !== "string")
      || !Array.isArray(raw.steps) || !Array.isArray(raw.pipeline)) {
    throw new Error("The plan is incomplete or belongs to another source / stage.");
  }
  const binding = boundFrames(value, request);
  if (JSON.stringify(binding) !== JSON.stringify(boundFrames(raw, request))
      || value.frameCount !== binding.supportFrameIds.length
      || raw.steps.some(step => !isRecord(step) || !binding.supportFrameIds.includes(String(step.frameId))
        || typeof step.output !== "string" || !Array.isArray(step.dependencies))) {
    throw new Error("The plan's causal support does not match its declared frame scope.");
  }
  return {
    stageId: request.stageId, label: typeof value.label === "string" ? value.label : request.stageId,
    frameCount: value.frameCount as number, pairCount: value.pairCount as number,
    llmCallCount: value.llmCallCount as number, modelId: String(value.modelId ?? ""),
    backendId: String(value.backendId ?? ""), cost: value.cost, blockedReasons: value.blockedReasons as string[],
    confirmationKey: value.confirmationKey, raw, request: { ...request }, ...binding,
  };
}

export function rowPlanConfirmationError(plan: RowCallPlan): string | undefined {
  const confirmationError = planConfirmationError(plan, false, "", "");
  if (plan.llmCallCount > 0 || Array.isArray(plan.raw.llmSteps) && plan.raw.llmSteps.length > 0
      || Array.isArray(plan.raw.pipeline) && plan.raw.pipeline.some(step => isRecord(step) && step.type === "llm")) {
    return "This plan includes LLM dependencies. Use the existing rich controls and their model / cost confirmations.";
  }
  return confirmationError;
}

export function rowJobActive(job: RowCallJob | null): boolean {
  return Boolean(job && ["starting", "running"].includes(job.state));
}

export function parseRowCallJob(value: unknown, request: RowCallRequest, expectedId?: string): RowCallJob {
  if (!isRecord(value) || typeof value.id !== "string" || !/^[a-f0-9]{32}$/.test(value.id)
      || expectedId && value.id !== expectedId || value.kind !== "direct-transform"
      || value.sequenceId !== request.sequenceId || value.composite !== request.stageId
      || !["starting", "running", "done", "error", "cancelled", "interrupted"].includes(String(value.state))
      || !count(value.done) || !count(value.total) || Number(value.done) > Number(value.total)) {
    throw new Error("The server did not return this row's direct-call job.");
  }
  boundFrames(value, request);
  return {
    id: value.id, request: { ...request }, state: String(value.state), done: Number(value.done), total: Number(value.total),
    error: typeof value.error === "string" ? value.error : "", cancelling: value.cancel === true, raw: value,
  };
}

type RowCallDependencies = {
  catalog: () => readonly DirectComposite[];
  eligibility: () => RowTargetEligibility | null;
  enabled: () => boolean;
  visible: () => boolean;
  beforeRequest: () => Promise<void>;
  post: RowPost;
  get: (url: string, signal: AbortSignal) => Promise<unknown>;
  cancel: (url: string, body: RecordValue, signal: AbortSignal) => Promise<unknown>;
  completed: (job: RowCallJob) => void | Promise<void>;
  clock?: { set: (callback: () => void, delay: number) => unknown; clear: (id: unknown) => void };
};
const message = (error: unknown) => error instanceof Error ? error.message : String(error);

/** Only explicit plan/confirm/stop methods POST. Status polling never retries an execution. */
export class RecognitionRowCallController {
  private context: RowCallContext;
  private dependencies: RowCallDependencies;
  private listeners = new Set<() => void>();
  private state: RowCallState = {
    stageId: "", plan: null, job: null, busy: null, reading: false, stopping: false,
    error: "", statusError: "", uncertain: false,
  };
  private active = true;
  private epoch = 0;
  private requestAbort?: AbortController;
  private readAbort?: AbortController;
  private stopAbort?: AbortController;
  private timer: unknown;
  private commitSent = false;
  private commitReceived = false;
  private notified = new Set<string>();
  private clock: NonNullable<RowCallDependencies["clock"]>;

  constructor(context: RowCallContext, dependencies: RowCallDependencies) {
    this.context = { ...context };
    this.dependencies = dependencies;
    this.clock = dependencies.clock ?? {
      set: (callback, delay) => setTimeout(callback, delay),
      clear: id => clearTimeout(id as ReturnType<typeof setTimeout>),
    };
  }
  getSnapshot = () => this.state;
  subscribe = (listener: () => void) => { this.listeners.add(listener); return () => { this.listeners.delete(listener); }; };
  private update(patch: Partial<RowCallState>) {
    this.state = { ...this.state, ...patch };
    this.listeners.forEach(listener => listener());
  }
  private live(epoch: number, signal: AbortSignal) {
    return this.active && this.dependencies.visible() && this.epoch === epoch && !signal.aborted;
  }
  private selectedRequest() {
    if (!this.dependencies.enabled()) throw new Error("Wait for this row's writable source and preprocessing configuration.");
    const error = rowTargetEligibilityError(this.state.stageId, this.dependencies.eligibility());
    if (error) throw new Error(error);
    return rowCallRequest(this.context, this.state.stageId, this.dependencies.catalog());
  }
  private clearTimer() {
    if (this.timer !== undefined) this.clock.clear(this.timer);
    this.timer = undefined;
  }
  private clearReads() {
    this.clearTimer();
    this.readAbort?.abort(); this.stopAbort?.abort();
    this.update({ reading: false, stopping: false });
  }
  select(stageId: string) {
    if (this.state.busy === "committing" || rowJobActive(this.state.job)) return;
    this.requestAbort?.abort();
    this.clearReads();
    this.epoch += 1;
    this.update({ stageId, plan: null, busy: null, error: this.state.uncertain ? this.state.error : "" });
  }
  dismissPlan() {
    if (this.state.busy) return;
    this.update({ plan: null });
  }
  resume() { this.active = true; }
  suspend() {
    this.active = false;
    this.epoch += 1;
    this.clearTimer();
    this.requestAbort?.abort(); this.readAbort?.abort(); this.stopAbort?.abort();
    this.update({
      plan: null, busy: null, reading: false, stopping: false,
      uncertain: this.state.uncertain || this.commitSent && !this.state.job,
      ...(this.commitSent && !this.commitReceived ? { error: "Call response interrupted. Execution was not retried; check the job / execution history." } : {}),
      ...(rowJobActive(this.state.job) ? { statusError: "Monitoring paused. Refresh this job's status to continue." } : {}),
    });
  }
  async plan() {
    if (!this.active || !this.dependencies.visible() || this.state.busy || this.state.uncertain || rowJobActive(this.state.job)) return;
    const abort = new AbortController(), epoch = ++this.epoch;
    this.clearReads();
    this.requestAbort?.abort(); this.requestAbort = abort;
    this.update({ busy: "planning", plan: null, error: "" });
    try {
      const request = this.selectedRequest();
      await this.dependencies.beforeRequest();
      if (!this.live(epoch, abort.signal)) return;
      if (requestKey(request) !== requestKey(this.selectedRequest())) throw new Error("The row selection changed. Plan again.");
      const value = await this.dependencies.post(`${ROW_EXECUTION_API}/semantic/execution/plan`, request, abort.signal, undefined, true);
      if (!this.live(epoch, abort.signal)) return;
      if (requestKey(request) !== requestKey(this.selectedRequest())) throw new Error("The row selection changed. Plan again.");
      this.update({ plan: parseRowCallPlan(value, request) });
    } catch (error) {
      if (this.live(epoch, abort.signal)) this.update({ error: message(error) });
    } finally {
      if (this.live(epoch, abort.signal)) this.update({ busy: null });
    }
  }
  async confirm() {
    if (!this.active || !this.dependencies.visible() || this.state.busy || this.state.uncertain || rowJobActive(this.state.job) || !this.state.plan) return;
    const plan = this.state.plan, abort = new AbortController(), epoch = ++this.epoch;
    this.clearReads();
    this.requestAbort?.abort(); this.requestAbort = abort;
    this.commitSent = false; this.commitReceived = false;
    this.update({ busy: "committing", error: "", statusError: "" });
    try {
      const error = rowPlanConfirmationError(plan);
      if (error) throw new Error(error);
      if (requestKey(plan.request) !== requestKey(this.selectedRequest())) throw new Error("The plan no longer matches this row / stage.");
      await this.dependencies.beforeRequest();
      if (!this.live(epoch, abort.signal)) return;
      if (this.state.plan !== plan || requestKey(plan.request) !== requestKey(this.selectedRequest())) {
        throw new Error("The selection changed while saving preprocessing. Plan again.");
      }
      this.update({ job: null });
      this.commitSent = true;
      const value = await this.dependencies.post(`${ROW_EXECUTION_API}/semantic/execution/commit`,
        { ...plan.request, confirmed: true, confirmationKey: plan.confirmationKey, run: true },
        abort.signal, progress => {
          if (this.live(epoch, abort.signal)) this.acceptJob(parseRowCallJob(progress, plan.request, this.state.job?.id));
        });
      if (!this.live(epoch, abort.signal)) return;
      this.acceptJob(parseRowCallJob(value, plan.request, this.state.job?.id));
      // NDJSON progress is not completion: memoryRequest must consume its final RAM snapshot.
      this.commitReceived = true;
      this.update({ plan: null });
    } catch (error) {
      if (this.live(epoch, abort.signal)) {
        const status = isRecord(error) ? Number(error.status) : NaN;
        const rejected = status >= 400 && status < 500 && status !== 408;
        this.update({ plan: null, error: message(error) + (this.commitSent && !rejected ? " Execution was not retried." : ""),
          uncertain: this.commitSent && !rejected && !this.state.job });
        if (rejected) this.commitSent = false;
      }
    } finally {
      if (this.live(epoch, abort.signal)) {
        this.update({ busy: null });
        this.notifyCompleted();
      }
    }
  }
  private acceptJob(job: RowCallJob) {
    const previous = this.state.job;
    if (previous?.id === job.id && (!rowJobActive(previous) && rowJobActive(job) || previous.done > job.done)) return;
    this.update({ job, statusError: "" });
    if (rowJobActive(job)) this.scheduleStatus(); else this.clearTimer();
    this.notifyCompleted();
  }
  private notifyCompleted() {
    const job = this.state.job;
    if (!this.active || !this.dependencies.visible() || !job || job.state !== "done"
        || this.state.busy === "committing" || !this.commitReceived || this.notified.has(job.id)) return;
    this.notified.add(job.id);
    const epoch = this.epoch;
    Promise.resolve().then(() => {
      if (this.active && this.dependencies.visible() && this.epoch === epoch) return this.dependencies.completed(job);
    }).catch(error => {
      if (this.active && this.epoch === epoch) this.update({ statusError: `Job completed; refreshing its outputs failed: ${message(error)}` });
    });
  }
  private scheduleStatus() {
    if (!this.active || !this.dependencies.visible() || this.timer !== undefined || this.state.reading || this.state.statusError) return;
    const epoch = this.epoch, jobId = this.state.job?.id;
    this.timer = this.clock.set(() => {
      this.timer = undefined;
      if (this.active && this.epoch === epoch && this.state.job?.id === jobId) void this.refreshStatus();
    }, 750);
  }
  async refreshStatus() {
    const job = this.state.job;
    if (!this.active || !this.dependencies.visible() || !job || this.state.reading) return;
    this.clearTimer();
    const abort = new AbortController(), epoch = this.epoch;
    this.readAbort = abort;
    this.update({ reading: true, statusError: "" });
    let success = false;
    try {
      const url = `${ROW_EXECUTION_API}/direct-calls/${encodeURIComponent(job.id)}?workspaceId=${encodeURIComponent(this.context.workspaceId)}`;
      const value = await this.dependencies.get(url, abort.signal);
      if (!this.live(epoch, abort.signal) || this.state.job?.id !== job.id) return;
      this.acceptJob(parseRowCallJob(value, job.request, job.id));
      success = true;
    } catch (error) {
      if (this.live(epoch, abort.signal)) this.update({ statusError: `Status unavailable: ${message(error)}. Refresh status to retry this read only.` });
    } finally {
      if (this.live(epoch, abort.signal)) {
        this.update({ reading: false });
        if (success && rowJobActive(this.state.job)) this.scheduleStatus();
      }
    }
  }
  async stop() {
    const job = this.state.job;
    if (!this.active || !this.dependencies.visible() || !rowJobActive(job) || !job || this.state.stopping || job.cancelling) return;
    const abort = new AbortController(), epoch = this.epoch;
    this.stopAbort = abort;
    this.update({ stopping: true });
    try {
      const value = await this.dependencies.cancel(`${ROW_EXECUTION_API}/jobs/cancel`,
        { workspaceId: this.context.workspaceId, jobId: job.id }, abort.signal);
      if (!this.live(epoch, abort.signal) || this.state.job?.id !== job.id) return;
      if (!isRecord(value) || value.jobId !== job.id || value.cancelling !== true) {
        throw new Error("Cancellation was not accepted. Refresh the job status.");
      }
      this.update({ job: { ...this.state.job, cancelling: true } });
      this.scheduleStatus();
    } catch (error) {
      if (this.live(epoch, abort.signal)) this.update({ statusError: message(error) });
    } finally {
      if (this.live(epoch, abort.signal)) this.update({ stopping: false });
    }
  }
}
