export const SPOTLIGHT_TEST_ID = "spotlight_scene";
export const SPOTLIGHT_TEST_IDS = [SPOTLIGHT_TEST_ID, "spotlight_action_modes"] as const;
export type SpotlightTestId = typeof SPOTLIGHT_TEST_IDS[number];
export function isSpotlightTestId(value: unknown): value is SpotlightTestId {
  return typeof value === "string" && SPOTLIGHT_TEST_IDS.some(id => id === value);
}
export const MAX_SPOTLIGHT_PIXELS = 1024 * 1024;
const ROOT = "/workbench/recognition/recording-tests";
const UUID = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/;
const HASH = /^[0-9a-f]{64}$/;
const SEQUENCE = /^recordings\/events_tests\/[a-z][a-z0-9_]*$/;
const TERMINAL = new Set(["completed", "stopped", "stale", "error"]);

type Json = Record<string, unknown>;
export type SpotlightVisibility = { knownPixels: number; unknownPixels: number; newKnownPixels: number; complete: boolean };
export type SpotlightReceipt = { action: string | null; data: Record<string, number>; atSeconds?: number };
export type SpotlightEvidence = {
  visualSequenceId: string; frameId: string; sourceHash: string; atSeconds: number;
  nativeCheckpointUid: string; memoryRefs: string[]; frameResultRef: string;
  visibility: SpotlightVisibility | null;
};
export type SpotlightScore = {
  outcome: "passed" | "failed" | "inconclusive" | "unsupported";
  passed: number; failed: number; inconclusive: number; unsupported: number; total: number;
};
export type SpotlightRun = {
  id: string; testId: SpotlightTestId; revision: number; status: string; outcome: string;
  progress: { processedFrames: number; totalFrames: number; frameIndex: number | null };
  evidence: SpotlightEvidence[]; score: SpotlightScore; recordingScore: SpotlightScore | null;
  limitations: string[]; error: string;
};
type SpotlightProducer = { producingVersion: string | null; currentImplementationMatches: boolean | null };
export type SpotlightFrame = SpotlightProducer & {
  width: number; height: number; rgba: Uint8ClampedArray; unknownMask: Uint8ClampedArray;
  receipt: SpotlightReceipt; visibility: SpotlightVisibility; nativeCheckpointUid: string;
  memoryRefs: string[]; readCutoffExclusive: number; readRefs: string[]; pixelHash: string; readReceiptsRecorded: boolean;
};
export type SpotlightValidation = SpotlightProducer & {
  outcome: "passed" | "failed";
  assessment: "complete_and_justified" | "incomplete" | "invalid_claim" | "unsupported_claim";
  knownPixels: number | null; unknownPixels: number | null; proof: Json;
};

function object(value: unknown): value is Json {
  return value !== null && typeof value === "object" && !Array.isArray(value);
}
function integer(value: unknown, min = 0, max = Number.MAX_SAFE_INTEGER): value is number {
  return typeof value === "number" && Number.isSafeInteger(value) && value >= min && value <= max;
}
function text(value: unknown, max = 2048): value is string {
  return typeof value === "string" && value.length > 0 && value.length <= max && !/[\u0000-\u001f\u007f]/.test(value);
}
function safePath(value: unknown): value is string {
  return text(value) && !/[\\:<>|"*?%#]/.test(value)
    && value.split("/").every(part => !!part && part !== "." && part !== ".." && !/[. ]$/.test(part));
}
function context(workspaceId: string, sequenceId: string) {
  if (!safePath(workspaceId) || workspaceId.includes("/") || !SEQUENCE.test(sequenceId)) {
    throw new Error("Invalid spotlight request context.");
  }
}
function refs(value: unknown): string[] {
  if (!Array.isArray(value) || value.length > 10000 || value.some(ref => !text(ref)
    || !ref.startsWith("data/") || !safePath(ref.split("#")[0]) || ref.split("#").length > 2)) {
    throw new Error("Invalid native memory evidence references.");
  }
  return value;
}
function producer(value: Json): SpotlightProducer {
  if (value.currentImplementationMatches === undefined && value.producingImplementation === undefined) {
    return { producingVersion: null, currentImplementationMatches: null };
  }
  if (typeof value.currentImplementationMatches !== "boolean" || value.inspectionMode !== "frozen_checkpoint"
    || value.executionEligibility !== "not_checked_by_read_only_inspection" || !object(value.producingImplementation)
    || !object(value.producingImplementation.versions) || !text(value.producingImplementation.versions.version)) {
    throw new Error("Frozen checkpoint producing-version information is incomplete.");
  }
  return { producingVersion: value.producingImplementation.versions.version,
    currentImplementationMatches: value.currentImplementationMatches };
}
export function canStepSpotlight(run: SpotlightRun | null, frame: SpotlightFrame | null, validation?: SpotlightValidation | null): boolean {
  return Boolean(run && ["ready", "interrupted"].includes(run.status)
    && frame?.currentImplementationMatches !== false && validation?.currentImplementationMatches !== false);
}
export function spotlightFrameResultUrl(workspaceId: string, runId: string, evidence: SpotlightEvidence): string {
  if (!safePath(workspaceId) || workspaceId.includes("/") || !UUID.test(runId)
    || !safePath(evidence.frameResultRef)
    || !evidence.frameResultRef.startsWith(`data/runtime/executions/recording-tests/${runId}/frames/`)
    || !/\/000-\d{6}\.json$/.test(evidence.frameResultRef)
    || Number(evidence.frameResultRef.slice(-11, -5)) !== Number(evidence.frameId)) {
    throw new Error("Frame result is outside this run or belongs to another frame.");
  }
  return assetUrl(workspaceId, evidence.frameResultRef);
}
export function spotlightNativeFrameUrl(workspaceId: string, run: SpotlightRun, evidence: SpotlightEvidence): string {
  context(workspaceId, evidence.visualSequenceId);
  spotlightFrameResultUrl(workspaceId, run.id, evidence);
  const saved = run.evidence[Number(evidence.frameId)];
  if (!/^(0|[1-9][0-9]{0,5})$/.test(evidence.frameId) || !saved
    || saved.visualSequenceId !== evidence.visualSequenceId || saved.sourceHash !== evidence.sourceHash
    || saved.nativeCheckpointUid !== evidence.nativeCheckpointUid) {
    throw new Error("Native frame does not belong to this run's executed prefix.");
  }
  return `${ROOT}/runs/${run.id}/frames/${evidence.frameId}?${new URLSearchParams({
    workspaceId, visualSequenceId: evidence.visualSequenceId,
  })}`;
}
function assetUrl(workspaceId: string, path: string): string {
  return `/workbench/workspaces/${encodeURIComponent(workspaceId)}/asset?path=${encodeURIComponent(path)}`;
}
function visibility(value: unknown): SpotlightVisibility {
  if (!object(value) || !integer(value.knownPixels, 0, MAX_SPOTLIGHT_PIXELS)
    || !integer(value.unknownPixels, 0, MAX_SPOTLIGHT_PIXELS)
    || value.knownPixels + value.unknownPixels < 1 || value.knownPixels + value.unknownPixels > MAX_SPOTLIGHT_PIXELS
    || !integer(value.newKnownPixels, 0, value.knownPixels)
    || value.complete !== (value.unknownPixels === 0)) throw new Error("Invalid visibility-union evidence.");
  return { knownPixels: value.knownPixels, unknownPixels: value.unknownPixels, newKnownPixels: value.newKnownPixels, complete: value.complete };
}
function score(value: unknown): SpotlightScore {
  if (!object(value) || !["passed", "failed", "inconclusive", "unsupported"].includes(String(value.outcome))
    || !["passed", "failed", "inconclusive", "unsupported", "total"].every(key => integer(value[key]))
    || Number(value.total) !== Number(value.passed) + Number(value.failed) + Number(value.inconclusive) + Number(value.unsupported)) {
    throw new Error("Invalid test score report.");
  }
  return value as SpotlightScore;
}
export function parseSpotlightRun(value: unknown, sequenceId: string, expectedId?: string, testId: SpotlightTestId = SPOTLIGHT_TEST_ID): SpotlightRun {
  if (!isSpotlightTestId(testId) || !object(value) || value.schemaVersion !== 1 || !text(value.id) || !UUID.test(value.id)
    || (expectedId && value.id !== expectedId) || value.testId !== testId || value.observer !== "spotlight"
    || value.mode !== "step" || value.learn !== false || value.scope !== "selected_recording"
    || !object(value.memory) || value.memory.mode !== "native_stm" || value.memory.confirmed !== true
    || !integer(value.revision) || !["ready", "running", "stopping", "stopped", "completed", "interrupted", "stale", "error"].includes(String(value.status))
    || !["not_scored", "passed", "failed", "inconclusive", "unsupported"].includes(String(value.outcome))
    || !Array.isArray(value.recordings) || value.recordings.length !== 1
    || !object(value.recordings[0]) || value.recordings[0].visualSequenceId !== sequenceId
    || !object(value.progress) || !integer(value.progress.totalFrames, 1, 100000)
    || value.recordings[0].frameCount !== value.progress.totalFrames
    || !integer(value.progress.processedFrames, 0, value.progress.totalFrames)
    || value.progress.recordingIndex !== 0
    || value.progress.frameIndex !== (value.progress.processedFrames ? value.progress.processedFrames - 1 : null)
    || !Array.isArray(value.evidence) || value.evidence.length !== value.progress.processedFrames
    || (value.status === "completed" && value.progress.processedFrames !== value.progress.totalFrames)) {
    throw new Error("Run does not match this selected spotlight sequence and explicit step-mode execution.");
  }
  let previousSeconds = -1;
  const runId = value.id;
  const evidence = value.evidence.map((item: unknown, index): SpotlightEvidence => {
    if (!object(item) || item.visualSequenceId !== sequenceId || item.frameId !== String(index)
      || !text(item.sourceHash) || !HASH.test(item.sourceHash) || !text(item.nativeCheckpointUid)
      || typeof item.atSeconds !== "number" || !Number.isFinite(item.atSeconds) || item.atSeconds <= previousSeconds
      || !Array.isArray(item.observed) || !text(item.frameResultRef)) throw new Error("Invalid causal frame evidence.");
    previousSeconds = item.atSeconds;
    const unions = item.observed.filter((entry: unknown) => object(entry) && entry.kind === "visibility_union");
    if (unions.length > 1) throw new Error("Ambiguous visibility-union evidence.");
    const result = { visualSequenceId: sequenceId, frameId: item.frameId, sourceHash: item.sourceHash,
      atSeconds: item.atSeconds, nativeCheckpointUid: item.nativeCheckpointUid, memoryRefs: refs(item.memoryRefs),
      frameResultRef: item.frameResultRef, visibility: unions.length ? visibility(unions[0]) : null };
    spotlightFrameResultUrl("request", runId, result);
    return result;
  });
  return {
    id: value.id, testId, revision: value.revision, status: String(value.status), outcome: String(value.outcome),
    progress: { processedFrames: value.progress.processedFrames, totalFrames: value.progress.totalFrames,
      frameIndex: value.progress.frameIndex as number | null },
    evidence, score: score(value.score), recordingScore: value.recordings[0].score ? score(value.recordings[0].score) : null,
    limitations: Array.isArray(value.limitations) ? value.limitations.filter((item): item is string => text(item)) : [],
    error: typeof value.error === "string" ? value.error : "",
  };
}
export function parseSpotlightReceipt(value: unknown): SpotlightReceipt {
  if (!object(value) || (value.action !== null && !text(value.action, 80)) || !object(value.data)
    || Object.keys(value.data).some(key => !["x", "y"].includes(key))
    || Object.values(value.data).some(number => typeof number !== "number" || !Number.isFinite(number))
    || (value.atSeconds !== undefined && (typeof value.atSeconds !== "number" || !Number.isFinite(value.atSeconds) || value.atSeconds < 0))) {
    throw new Error("Invalid recorded input receipt.");
  }
  return { action: value.action as string | null, data: value.data as Record<string, number>, atSeconds: value.atSeconds as number | undefined };
}
export function parseSpotlightScript(value: unknown, sequenceId: string): SpotlightReceipt[] {
  if (!SEQUENCE.test(sequenceId) || !object(value) || value.kind !== "arc3_play_recording"
    || !Array.isArray(value.moves) || !value.moves.length || value.moves.length > 100000) throw new Error("Recorded action script is unavailable.");
  return value.moves.map((move: unknown, index) => {
    if (!object(move) || move.index !== index || move.directory !== `data/${sequenceId}/${index}`) {
      throw new Error("Recorded input script does not match this sequence's ordered frames.");
    }
    return parseSpotlightReceipt({ action: move.action, data: move.data, atSeconds: move.at_seconds });
  });
}
export function spotlightReceiptLabel(receipt: SpotlightReceipt | null | undefined): string {
  if (!receipt) return "Receipt unavailable";
  const coordinates = Object.entries(receipt.data).map(([key, value]) => `${key}=${value}`).join(", ");
  return `${receipt.action ?? "No input (baseline)"}${coordinates ? ` (${coordinates})` : ""}`;
}
export function decodeSpotlightState(value: unknown, counts: SpotlightVisibility): Pick<SpotlightFrame, "width" | "height" | "rgba" | "unknownMask"> {
  if (!object(value) || !Array.isArray(value.size) || value.size.length !== 2
    || !integer(value.size[0], 1, 4096) || !integer(value.size[1], 1, 4096)
    || value.size[0] * value.size[1] > MAX_SPOTLIGHT_PIXELS || typeof value.rgbaHex !== "string"
    || value.rgbaHex.length !== value.size[0] * value.size[1] * 8 || !/^[0-9a-f]+$/i.test(value.rgbaHex)) {
    throw new Error("Native spotlight RGBA state is missing or invalid. No reconstruction was substituted.");
  }
  const rgba = new Uint8ClampedArray(value.rgbaHex.length / 2);
  const unknownMask = new Uint8ClampedArray(rgba.length);
  let known = 0;
  for (let index = 0; index < rgba.length; index++) rgba[index] = Number.parseInt(value.rgbaHex.slice(index * 2, index * 2 + 2), 16);
  for (let index = 0; index < rgba.length; index += 4) {
    const alpha = rgba[index + 3];
    if (alpha !== 0 && alpha !== 255 || alpha === 0 && (rgba[index] || rgba[index + 1] || rgba[index + 2])) {
      throw new Error("Native unknown pixels must be transparent and contain no hidden RGB values.");
    }
    known += alpha === 255 ? 1 : 0;
    unknownMask.fill(alpha === 0 ? 255 : 0, index, index + 3);
    unknownMask[index + 3] = 255;
  }
  if (known !== counts.knownPixels || rgba.length / 4 - known !== counts.unknownPixels) {
    throw new Error("Native image and visibility counts disagree.");
  }
  return { width: value.size[0], height: value.size[1], rgba, unknownMask };
}
export function parseSpotlightFrame(value: unknown, evidence: SpotlightEvidence, run: SpotlightRun): SpotlightFrame {
  const order = Number(evidence.frameId);
  if (!object(value) || value.schemaVersion !== 1 || value.status !== "available" || value.readOnly !== true
    || value.runId !== run.id || value.testId !== run.testId || value.observer !== "spotlight"
    || value.visualSequenceId !== evidence.visualSequenceId || value.inferenceFrozen !== true
    || value.frameId !== evidence.frameId || value.frameOrder !== order
    || !object(value.source) || value.source.visualSequenceId !== evidence.visualSequenceId
    || value.source.imageHash !== evidence.sourceHash || !object(value.memory)
    || value.memory.nativeCheckpointUid !== evidence.nativeCheckpointUid || !evidence.visibility
    || value.memory.readCutoffExclusive !== order || value.memory.readScope !== "earlier_recording_level_stm"
    || !Array.isArray(value.memory.readReceipts) || !object(value.rememberedScene)
    || value.rememberedScene.authority !== "observed_pixel_union_not_hidden_scene"
    || value.rememberedScene.nativeCheckpointUid !== evidence.nativeCheckpointUid
    || value.rememberedScene.encoding !== "rgba8_hex" || !text(value.rememberedScene.pixelHash)
    || !HASH.test(value.rememberedScene.pixelHash) || !integer(value.runRevision, run.revision)) {
    throw new Error("Bound native spotlight frame state is unavailable. No reconstruction was substituted.");
  }
  const receipt = parseSpotlightReceipt(value.source.receipt);
  if (receipt.atSeconds !== evidence.atSeconds) throw new Error("Native input receipt has a different acquisition time.");
  const memoryRefs = refs(value.memory.writeRefs);
  if (JSON.stringify(memoryRefs) !== JSON.stringify(evidence.memoryRefs)) throw new Error("Native memory references do not match the run evidence.");
  const counts = visibility(value.coverage);
  if (counts.knownPixels !== evidence.visibility.knownPixels || counts.unknownPixels !== evidence.visibility.unknownPixels
    || counts.newKnownPixels !== evidence.visibility.newKnownPixels || counts.complete !== evidence.visibility.complete) {
    throw new Error("Native frame coverage does not match the frozen run evidence.");
  }
  const reads = value.memory.readReceipts;
  const producing = producer(value);
  const legacyReads = value.memory.readReceiptStatus === "not_recorded_by_producer";
  if (legacyReads && (producing.producingVersion !== "recording-test-execution-v1"
    || value.memory.nativeReadCutoffRecorded !== false || reads.length)) {
    throw new Error("Missing native read receipts are not explained by the producing version.");
  }
  let readRefs: string[] = [];
  if (order === 0) {
    if (value.memory.previousCheckpointUid !== null || reads.length) throw new Error("Initial observation cannot read earlier memory.");
  } else {
    const previous = run.evidence[order - 1];
    const read = reads[0];
    if (!previous || value.memory.previousCheckpointUid !== previous.nativeCheckpointUid) {
      throw new Error("Native checkpoint predecessor differs from this run's earlier evidence.");
    }
    if (!legacyReads && (reads.length !== 1 || !object(read) || read.frameId !== previous.frameId
      || read.frameOrder !== order - 1 || read.entryUid !== previous.nativeCheckpointUid
      || value.memory.previousCheckpointUid !== previous.nativeCheckpointUid)) {
      throw new Error("Native memory receipt does not identify this run's exact earlier checkpoint.");
    }
    if (!legacyReads && object(read)) {
      readRefs = refs([read.memoryRef]);
      if (!previous.memoryRefs.includes(readRefs[0])) throw new Error("Native read reference is outside the earlier checkpoint.");
    }
  }
  return { ...decodeSpotlightState({
    size: [value.rememberedScene.width, value.rememberedScene.height], rgbaHex: value.rememberedScene.rgbaHex,
  }, counts), receipt, visibility: counts, nativeCheckpointUid: evidence.nativeCheckpointUid,
  memoryRefs, readCutoffExclusive: order, readRefs, pixelHash: value.rememberedScene.pixelHash,
  readReceiptsRecorded: !legacyReads, ...producing };
}
async function readJson(response: Response): Promise<unknown> {
  const raw = await response.text();
  if (raw.length > 12 * 1024 * 1024) throw new Error("Spotlight response exceeds the supported size.");
  let value: unknown;
  try { value = JSON.parse(raw); } catch { throw new Error(`Invalid spotlight response (HTTP ${response.status}).`); }
  if (!response.ok) throw new Error(object(value) && typeof value.detail === "string" ? value.detail : `Spotlight request failed: HTTP ${response.status}.`);
  return value;
}
export async function loadSpotlightScript(workspaceId: string, sequenceId: string, signal?: AbortSignal, transport: typeof fetch = fetch) {
  context(workspaceId, sequenceId);
  return parseSpotlightScript(await readJson(await transport(assetUrl(workspaceId, `data/${sequenceId}/recording.json`),
    { method: "GET", cache: "no-store", redirect: "error", signal })), sequenceId);
}
export async function loadSpotlightFrame(workspaceId: string, run: SpotlightRun, evidence: SpotlightEvidence,
  signal?: AbortSignal, transport: typeof fetch = fetch) {
  const value = await readJson(await transport(spotlightNativeFrameUrl(workspaceId, run, evidence),
    { method: "GET", cache: "no-store", redirect: "error", signal }));
  return parseSpotlightFrame(value, evidence, run);
}

export function parseSpotlightValidation(value: unknown, run: SpotlightRun, evidence: SpotlightEvidence,
  frame: SpotlightFrame | null): SpotlightValidation {
  const order = Number(evidence.frameId);
  if (!object(value) || value.action !== "VALIDATE_MUST_BE_KNOWN" || value.status !== "completed"
    || value.runId !== run.id || value.runRevision !== run.revision || value.frameId !== evidence.frameId
    || value.visualSequenceId !== evidence.visualSequenceId || value.sourceHash !== evidence.sourceHash
    || value.nativeCheckpointUid !== evidence.nativeCheckpointUid || value.nativeReadRef !== evidence.memoryRefs[0]
    || value.readOnly !== true || value.runModified !== false || value.memoryModified !== false
    || value.observerExecuted !== false || value.validationStored !== false || !object(value.readScope)
    || value.readScope.throughFrameInclusive !== order || value.readScope.sourceFrameCount !== order + 1
    || value.readScope.nativeStorage !== "frozen_frame_checkpoint" || value.readScope.recordingStmRead !== false
    || value.readScope.futureFramesRead !== false || !object(value.violations)
    || !Object.values(value.violations).every(number => integer(number))) {
    throw new Error("Knowledge assertion does not match this frozen frame or its read-only evidence boundary.");
  }
  const { outcome, assessment } = value;
  const producing = producer(value);
  if ((outcome !== "passed" && outcome !== "failed")
    || (assessment !== "complete_and_justified" && assessment !== "incomplete"
      && assessment !== "invalid_claim" && assessment !== "unsupported_claim")) {
    throw new Error("Invalid knowledge assertion outcome.");
  }
  const violated = Object.values(value.violations).some(number => Number(number) > 0);
  if (outcome === "passed" && (assessment !== "complete_and_justified" || value.complete !== true || violated)
    || outcome === "failed" && (assessment === "complete_and_justified" || !violated)) {
    throw new Error("Knowledge assertion outcome contradicts its evidence.");
  }
  if (assessment === "unsupported_claim") {
    return { outcome, assessment, knownPixels: null, unknownPixels: null, proof: value, ...producing };
  }
  if (!integer(value.knownPixels, 0, MAX_SPOTLIGHT_PIXELS) || !integer(value.unknownPixels, 0, MAX_SPOTLIGHT_PIXELS)
    || !integer(value.totalPixels, 1, MAX_SPOTLIGHT_PIXELS) || value.knownPixels + value.unknownPixels !== value.totalPixels
    || value.complete !== (value.unknownPixels === 0) || !text(value.nativeRgbaHash) || !HASH.test(value.nativeRgbaHash)
    || frame && (value.nativeRgbaHash !== frame.pixelHash || value.knownPixels !== frame.visibility.knownPixels
      || value.unknownPixels !== frame.visibility.unknownPixels || value.totalPixels !== frame.width * frame.height)) {
    throw new Error("Knowledge assertion does not match the displayed native raster.");
  }
  return { outcome, assessment, knownPixels: value.knownPixels, unknownPixels: value.unknownPixels, proof: value, ...producing };
}

export async function validateSpotlightFrame(workspaceId: string, run: SpotlightRun, evidence: SpotlightEvidence,
  frame: SpotlightFrame | null, signal?: AbortSignal, transport: typeof fetch = fetch): Promise<SpotlightValidation> {
  const url = spotlightNativeFrameUrl(workspaceId, run, evidence).split("?")[0] + "/validate";
  if (!HASH.test(evidence.nativeCheckpointUid)) throw new Error("Validation requires an exact native checkpoint hash.");
  const value = await readJson(await transport(url, {
    method: "POST", cache: "no-store", redirect: "error", signal, headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ workspaceId, visualSequenceId: evidence.visualSequenceId, action: "VALIDATE_MUST_BE_KNOWN",
      expectedRevision: run.revision, expectedSourceHash: evidence.sourceHash, expectedNativeCheckpointUid: evidence.nativeCheckpointUid }),
  }));
  return parseSpotlightValidation(value, run, evidence, frame);
}

export class SpotlightRunClient {
  readonly workspaceId: string;
  readonly sequenceId: string;
  readonly testId: SpotlightTestId;
  run: SpotlightRun | null = null;
  needsRefresh = false;
  private busy = false;
  private serial = 0;
  private controller: AbortController | null = null;
  private transport: typeof fetch;
  constructor(workspaceId: string, sequenceId: string, transport: typeof fetch = fetch, testId: SpotlightTestId = SPOTLIGHT_TEST_ID) {
    context(workspaceId, sequenceId);
    if (!isSpotlightTestId(testId)) throw new Error("Unsupported spotlight test identifier.");
    this.workspaceId = workspaceId;
    this.sequenceId = sequenceId;
    this.testId = testId;
    this.transport = (url, options) => transport(url, options);
  }
  cancel() {
    if (this.busy && this.run) this.needsRefresh = true;
    this.serial++;
    this.controller?.abort();
    this.controller = null;
    this.busy = false;
  }
  start(confirmed: boolean) {
    if (!confirmed) return Promise.reject(new Error("Explicit native STM confirmation is required."));
    if (this.run && !TERMINAL.has(this.run.status)) return Promise.reject(new Error("Stop or finish the current run before starting another."));
    return this.request(`${ROOT}/${this.testId}/runs`, {
      workspaceId: this.workspaceId, visualSequenceId: this.sequenceId, mode: "step",
      memory: { mode: "native_stm", confirmed: true }, learn: false,
    }, true);
  }
  step() {
    if (!this.run || this.needsRefresh || !["ready", "interrupted"].includes(this.run.status)) {
      return Promise.reject(new Error("Refresh or create a ready run before stepping."));
    }
    return this.request(`${ROOT}/runs/${this.run.id}/step`, { workspaceId: this.workspaceId, expectedRevision: this.run.revision }, false, true);
  }
  stop() {
    if (!this.run) return Promise.reject(new Error("No run to stop."));
    return this.request(`${ROOT}/runs/${this.run.id}/stop`, { workspaceId: this.workspaceId });
  }
  refresh() {
    if (!this.run) return Promise.reject(new Error("No run to refresh."));
    return this.request(`${ROOT}/runs/${this.run.id}?workspaceId=${encodeURIComponent(this.workspaceId)}`);
  }
  private async request(url: string, body?: Json, creating = false, advancing = false): Promise<SpotlightRun | null> {
    if (this.busy) throw new Error("A spotlight request is already pending.");
    this.busy = true;
    const serial = ++this.serial;
    const controller = new AbortController();
    this.controller = controller;
    const previous = this.run;
    try {
      const value = await readJson(await this.transport(url, { method: body ? "POST" : "GET", cache: "no-store",
        redirect: "error", signal: controller.signal, ...(body ? { headers: { "Content-Type": "application/json" }, body: JSON.stringify(body) } : {}) }));
      if (serial !== this.serial || controller.signal.aborted) return null;
      const run = parseSpotlightRun(value, this.sequenceId, creating ? undefined : previous?.id, this.testId);
      if (!creating && previous && run.revision < previous.revision) throw new Error("A stale run revision was returned.");
      if (advancing && previous && ["ready", "interrupted", "completed"].includes(run.status)
        && (run.revision <= previous.revision || run.progress.processedFrames !== previous.progress.processedFrames + 1)) {
        throw new Error("Step did not return exactly one new frame with a newer revision. Refresh the report; no automatic retry.");
      }
      this.run = run;
      this.needsRefresh = false;
      return run;
    } catch (error) {
      if (serial !== this.serial || controller.signal.aborted) return null;
      if (body && previous) this.needsRefresh = true;
      throw error;
    } finally {
      if (serial === this.serial) { this.busy = false; this.controller = null; }
    }
  }
}
