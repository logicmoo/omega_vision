export type PublicationKind = "shape" | "object" | "deduction";
export type PublicationContext = { workspaceId: string; sequenceId: string; frameId: string };
export type PublicationCutoff = { sequenceId: string; gameId: string; levelId: string; frameId: string; frameOrder: number };
export type PublicationArea = {
  id: string; providerRef: string; kind: PublicationKind; registeredPath: string; label: string;
  scopeKind: "run" | "level" | "game"; exists: boolean; revision: string | null;
  capabilities: { read: boolean; write: boolean; reason: string | null };
};
export type PublicationItem = {
  id: string; kind: PublicationKind; eligible: boolean; reason?: string | null;
  recordUid?: string; conceptUid?: string; revision?: string; payloadUid?: string;
  candidateId?: string; evaluationId?: string; causal?: PublicationCutoff;
};
export type PublicationSource = PublicationArea & { items: PublicationItem[]; eligibleCount: number };
export type PublicationOptions = {
  schemaVersion: 1; context: PublicationCutoff; sources: PublicationSource[];
  destinations: PublicationArea[]; unsupportedKinds: Record<string, string>;
  readOnly: true; automaticPublication: false;
};
export type PublicationSelection = {
  kind: PublicationKind | ""; sourceId: string; destinationId: string; itemIds: string[];
  approval: { reviewer: string; reason: string };
};
export type PublicationRequest = PublicationContext & Omit<PublicationSelection, "kind"> & { kind: PublicationKind };
export type PublicationPlanItem = {
  sourceEntryUid: string; action: "append" | "already_present"; existingEntryUid: string | null;
  sourceRecordUid?: string; destinationRecordUid?: string; conceptUid?: string; recordRevision?: string;
  candidateId?: string; candidateVersion?: string; evaluationId?: string;
  existingConceptRevisions: string[]; proof: unknown;
};
type Preservation = { sourcePreserved: true; activation: "none"; ruleAcceptance: "unchanged"; independentEvidenceAdded: false };
export type PublicationPlan = Preservation & {
  schemaVersion: 1; status: "planned"; confirmationKey: string; source: PublicationArea; destination: PublicationArea;
  cutoff: PublicationCutoff; items: PublicationPlanItem[]; requiresConfirmation: true; readOnly: true;
  identityPolicy: string; reusePolicy: string;
};
export type PublicationResult = Preservation & {
  schemaVersion: 1; status: "published" | "already_published" | "already_present"; confirmationKey: string;
  items: Array<{ sourceEntryUid: string; destinationEntryUid?: string }>;
};
export type BoundPublicationPlan = { request: PublicationRequest; response: PublicationPlan };
export type PublicationState = {
  context: PublicationContext | null; active: boolean; open: boolean;
  phase: "idle" | "options" | "planning" | "committing";
  options: PublicationOptions | null; selection: PublicationSelection; plan: BoundPublicationPlan | null;
  confirmed: boolean; result: PublicationResult | null; error: string; notice: string; unknownOutcome: string;
};
const BASE = "/workbench/memory/publications";
const HASH = /^[0-9a-f]{64}$/;
const SEGMENT = /^[A-Za-z0-9][A-Za-z0-9._-]*$/;
const KINDS = new Set(["shape", "object", "deduction"]);
const plain = (v: unknown): v is Record<string, any> => v !== null && typeof v === "object" && !Array.isArray(v);
const text = (v: unknown): v is string => typeof v === "string" && v.trim().length > 0 && v.length <= 2048 && !/[\u0000-\u001f]/.test(v);
const hash = (v: unknown): v is string => typeof v === "string" && HASH.test(v);
const unique = (ids: string[]) => new Set(ids).size === ids.length;
const emptySelection = (): PublicationSelection => ({ kind: "", sourceId: "", destinationId: "", itemIds: [], approval: { reviewer: "", reason: "" } });

function requireValue(condition: unknown, message: string): asserts condition {
  if (!condition) throw new Error(message);
}
function immutable<T>(value: T): T {
  if (value && typeof value === "object" && !Object.isFrozen(value)) {
    Object.values(value).forEach(immutable);
    Object.freeze(value);
  }
  return value;
}
function clone<T>(value: T): T { return JSON.parse(JSON.stringify(value)); }
export function publicationContextKey(context: PublicationContext | null): string {
  return JSON.stringify(context ? [context.workspaceId, context.sequenceId, context.frameId] : null);
}
export function publicationContextError(context: PublicationContext | null): string {
  if (!context || !text(context.workspaceId) || typeof context.sequenceId !== "string" || typeof context.frameId !== "string")
    return "Publication requires a validated recording and frame. Saved-area inspection remains available.";
  const parts = context.sequenceId.split("/");
  if (parts.length !== 4 || parts[0] !== "data" || parts[1] !== "recordings" || !parts.slice(2).every(part => SEGMENT.test(part))
    || !SEGMENT.test(context.frameId)) return "Publication requires the exact canonical recording and selected manifest frame; no fallback is used.";
  return "";
}
function cutoff(value: unknown, context: PublicationContext): PublicationCutoff {
  requireValue(plain(value) && value.sequenceId === context.sequenceId && value.frameId === context.frameId
    && typeof value.gameId === "string" && SEGMENT.test(value.gameId)
    && typeof value.levelId === "string" && SEGMENT.test(value.levelId)
    && Number.isSafeInteger(value.frameOrder) && value.frameOrder >= 0, "Publication cutoff does not match the selected recording/frame.");
  return { sequenceId: value.sequenceId, gameId: value.gameId, levelId: value.levelId, frameId: value.frameId, frameOrder: value.frameOrder };
}
function area(value: unknown, causal: PublicationCutoff, source: boolean): PublicationArea {
  requireValue(plain(value) && text(value.id) && value.providerRef === "filesystem:omega_vision"
    && KINDS.has(value.kind) && text(value.label) && typeof value.exists === "boolean"
    && (value.revision === null || hash(value.revision)) && value.exists === (value.revision !== null)
    && plain(value.capabilities) && typeof value.capabilities.read === "boolean" && typeof value.capabilities.write === "boolean"
    && (value.capabilities.reason === null || typeof value.capabilities.reason === "string"), "Invalid native publication area descriptor.");
  requireValue(source ? value.scopeKind === "run" : value.scopeKind === "level" || value.scopeKind === "game",
    "Publication supports only this recording's STM and its authorized level/game LTM.");
  const sequencePath = causal.sequenceId.slice(5), gamePath = sequencePath.split("/").slice(0, 2).join("/");
  const expectedPath = source ? `${sequencePath}/memory_level_${causal.levelId}_stm`
    : value.scopeKind === "level" ? `${gamePath}/memory_level_${causal.levelId}_ltm` : `${gamePath}/memory_game_all`;
  requireValue(value.registeredPath === expectedPath && !["memory-nowhere", "session:nowhere"].includes(value.id),
    "Publication area is not bound to the authorized recording/game. Browser memory and redirected paths are unavailable.");
  return { id: value.id, providerRef: value.providerRef, kind: value.kind, registeredPath: value.registeredPath,
    label: value.label, scopeKind: value.scopeKind, exists: value.exists, revision: value.revision,
    capabilities: { read: value.capabilities.read, write: value.capabilities.write, reason: value.capabilities.reason } };
}
export function validatePublicationOptions(value: unknown, context: PublicationContext): PublicationOptions {
  requireValue(!publicationContextError(context), publicationContextError(context));
  requireValue(plain(value) && value.schemaVersion === 1 && value.readOnly === true && value.automaticPublication === false
    && Array.isArray(value.sources) && Array.isArray(value.destinations) && plain(value.unsupportedKinds), "Invalid publication options response.");
  const causal = cutoff(value.context, context);
  const sources = value.sources.map((raw: unknown) => {
    const descriptor = area(raw, causal, true);
    requireValue(plain(raw) && Array.isArray(raw.items) && Number.isSafeInteger(raw.eligibleCount), "Invalid native STM item list.");
    const items = raw.items.map((item: unknown): PublicationItem => {
      requireValue(plain(item) && hash(item.id) && item.kind === descriptor.kind && typeof item.eligible === "boolean", "Invalid native entry identity.");
      if (item.eligible) {
        requireValue(text(item.revision) && (descriptor.kind === "deduction" ? text(item.candidateId) && text(item.evaluationId)
          : text(item.recordUid) && text(item.conceptUid) && text(item.payloadUid)), "Eligible native entry is missing its exact typed identity/revision.");
        requireValue(plain(item.causal) && typeof item.causal.frameId === "string" && SEGMENT.test(item.causal.frameId), "Missing original native causality.");
        const original = cutoff(item.causal, { ...context, frameId: item.causal.frameId });
        requireValue(original.gameId === causal.gameId && original.frameOrder < causal.frameOrder, "Native entry is not earlier than this publication cutoff.");
      } else requireValue(text(item.reason), "Ineligible native entry has no explanation.");
      return clone(item) as PublicationItem;
    });
    requireValue(unique(items.map((item: PublicationItem) => item.id)) && raw.eligibleCount === items.filter((item: PublicationItem) => item.eligible).length
      && (descriptor.exists || !items.length), "Native item counts or identities are inconsistent.");
    return { ...descriptor, items, eligibleCount: raw.eligibleCount } as PublicationSource;
  });
  const destinations = value.destinations.map((raw: unknown) => area(raw, causal, false));
  requireValue(unique(sources.map((item: PublicationSource) => item.id)) && unique(destinations.map((item: PublicationArea) => item.id)),
    "Duplicate publication area IDs.");
  for (const [kind, reason] of Object.entries(value.unsupportedKinds)) requireValue(text(kind) && text(reason), "Invalid unsupported-type explanation.");
  return immutable({ schemaVersion: 1, context: causal, sources, destinations, unsupportedKinds: clone(value.unsupportedKinds),
    readOnly: true, automaticPublication: false });
}
export function publicationRequest(context: PublicationContext, options: PublicationOptions, selection: PublicationSelection): PublicationRequest {
  requireValue(!publicationContextError(context), publicationContextError(context));
  requireValue(options.context.sequenceId === context.sequenceId && options.context.frameId === context.frameId, "Options belong to another recording/frame.");
  const source = options.sources.find(entry => entry.id === selection.sourceId && entry.kind === selection.kind);
  const destination = options.destinations.find(entry => entry.id === selection.destinationId && entry.kind === selection.kind);
  requireValue(source && destination && source.exists && source.capabilities.read && source.capabilities.write
    && destination.capabilities.read && destination.capabilities.write, "Select an available native STM source and an authorized same-kind LTM destination.");
  requireValue(selection.itemIds.length >= 1 && selection.itemIds.length <= 100 && unique(selection.itemIds)
    && selection.itemIds.every(id => hash(id) && source.items.some(item => item.id === id && item.eligible)),
    "Select 1–100 distinct eligible native entry IDs.");
  for (const value of [selection.approval.reviewer, selection.approval.reason]) {
    requireValue(typeof value === "string" && value.trim() && [...value].length <= 2000 && !/[\u0000-\u001f\u0085\u2028\u2029]/.test(value),
      "Reviewer and publication reason must be nonblank, single-line text of at most 2000 characters.");
  }
  return immutable({ workspaceId: context.workspaceId, sequenceId: context.sequenceId, frameId: context.frameId,
    kind: source.kind, sourceId: source.id, destinationId: destination.id, itemIds: [...selection.itemIds].sort(),
    approval: { reviewer: selection.approval.reviewer, reason: selection.approval.reason } });
}
function preserved(value: Record<string, any>) {
  requireValue(value.sourcePreserved === true && value.activation === "none" && value.ruleAcceptance === "unchanged"
    && value.independentEvidenceAdded === false, "Publication response claims unsupported activation, evidence or source changes.");
}
export function validatePublicationPlan(value: unknown, request: PublicationRequest, options: PublicationOptions): PublicationPlan {
  requireValue(plain(value) && value.schemaVersion === 1 && value.status === "planned" && hash(value.confirmationKey)
    && value.requiresConfirmation === true && value.readOnly === true && Array.isArray(value.items)
    && text(value.identityPolicy) && text(value.reusePolicy), "Invalid read-only publication plan.");
  preserved(value);
  const causal = cutoff(value.cutoff, request);
  requireValue(JSON.stringify(causal) === JSON.stringify(options.context), "Publication cutoff changed. Refresh options and replan.");
  const source = area(value.source, causal, true), destination = area(value.destination, causal, false);
  const original = options.sources.find(entry => entry.id === request.sourceId)!;
  requireValue(JSON.stringify(source) === JSON.stringify(area(original, causal, true))
    && JSON.stringify(destination) === JSON.stringify(options.destinations.find(entry => entry.id === request.destinationId))
    && source.kind === request.kind && destination.kind === request.kind, "Publication area identity/revision changed. Refresh options and replan.");
  requireValue(value.items.length === request.itemIds.length && unique(value.items.map((item: any) => item?.sourceEntryUid)), "Plan item count or identity mismatch.");
  for (const item of value.items) {
    const entry = original.items.find(entry => entry.id === item?.sourceEntryUid);
    requireValue(plain(item) && entry && request.itemIds.includes(entry.id)
      && ["append", "already_present"].includes(item.action)
      && (item.action === "already_present" ? hash(item.existingEntryUid) : item.existingEntryUid === null)
      && Array.isArray(item.existingConceptRevisions) && item.existingConceptRevisions.every(text), "Invalid planned native item/action.");
    if (request.kind === "deduction") {
      requireValue(item.candidateId === entry.candidateId && item.candidateVersion === entry.revision && item.evaluationId === entry.evaluationId
        && plain(item.proof) && item.proof.candidateId === entry.candidateId && item.proof.candidateVersion === entry.revision
        && item.proof.evaluationId === entry.evaluationId, "Plan changed the approved candidate/evaluation identity.");
    } else {
      requireValue(item.sourceRecordUid === entry.recordUid && item.conceptUid === entry.conceptUid && item.recordRevision === entry.revision
        && text(item.destinationRecordUid) && item.destinationRecordUid !== item.sourceRecordUid && Array.isArray(item.proof),
        "Plan changed the native concept/revision or omitted destination-specific provenance.");
    }
  }
  return immutable(clone(value)) as PublicationPlan;
}
export function validatePublicationResult(value: unknown, plan: BoundPublicationPlan): PublicationResult {
  requireValue(plain(value) && value.schemaVersion === 1 && ["published", "already_published", "already_present"].includes(value.status)
    && value.confirmationKey === plan.response.confirmationKey && Array.isArray(value.items), "Publication acknowledgment is invalid or belongs to another plan.");
  preserved(value);
  requireValue(value.items.length === plan.response.items.length && unique(value.items.map((item: any) => item?.sourceEntryUid)), "Publication acknowledgment item mismatch.");
  for (const item of value.items) {
    const expected = plan.response.items.find(entry => entry.sourceEntryUid === item?.sourceEntryUid);
    requireValue(plain(item) && expected, "Publication acknowledgment contains an unselected entry.");
    if (value.status === "already_present") {
      requireValue(expected.action === "already_present" && JSON.stringify(item) === JSON.stringify(expected), "Already-present acknowledgment changed the reviewed plan.");
    } else requireValue(hash(item.destinationEntryUid) && (expected.action !== "already_present" || item.destinationEntryUid === expected.existingEntryUid),
      "Missing or mismatched destination entry acknowledgment.");
  }
  return immutable(clone(value)) as PublicationResult;
}

class PublicationHttpError extends Error {
  status: number;
  constructor(status: number, message: string) { super(message); this.status = status; }
}

/** No constructor/effect requests: only open, refresh, plan and confirmed publish perform I/O. */
export function createNativeMemoryPublication(context: PublicationContext | null, transport: typeof fetch = fetch) {
  let state: PublicationState = { context: context && immutable(clone(context)), active: true, open: false, phase: "idle",
    options: null, selection: emptySelection(), plan: null, confirmed: false, result: null, error: "", notice: "", unknownOutcome: "" };
  let generation = 0, pending: AbortController | null = null;
  const submitted = new Set<string>(), listeners = new Set<() => void>();
  const update = (patch: Partial<PublicationState>) => { state = immutable({ ...state, ...patch }); listeners.forEach(listener => listener()); };
  const invalidate = (notice = "") => {
    const uncertain = state.phase === "committing" && state.plan
      ? ` Publication was sent for ${state.plan.request.sequenceId}, frame ${state.plan.request.frameId}, confirmation ${state.plan.response.confirmationKey}; its outcome is unknown. Inspect that destination before another publication.`
      : "";
    ++generation; pending?.abort(); pending = null;
    update({ phase: "idle", plan: null, confirmed: false, result: null, error: "", notice, unknownOutcome: uncertain || state.unknownOutcome });
  };
  async function perform(operation: "options" | "plan" | "commit", body?: PublicationRequest | (PublicationRequest & { confirmed: true; confirmationKey: string })) {
    const token = ++generation, requestController = new AbortController();
    pending = requestController;
    const boundContext = state.context!, options = state.options, boundPlan = state.plan;
    update({ phase: operation === "options" ? "options" : operation === "plan" ? "planning" : "committing", error: "" });
    const current = () => generation === token && state.active && state.open && !requestController.signal.aborted;
    try {
      const query = new URLSearchParams({ workspaceId: boundContext.workspaceId, sequenceId: boundContext.sequenceId, frameId: boundContext.frameId });
      const response = await transport(`${BASE}/${operation}${operation === "options" ? `?${query}` : ""}`, {
        method: operation === "options" ? "GET" : "POST", cache: "no-store", redirect: "error", signal: requestController.signal,
        ...(body ? { headers: { "Content-Type": "application/json" }, body: JSON.stringify(body) } : {}),
      });
      if (!current()) return;
      const payload = await response.json();
      if (!current()) return;
      if (!response.ok) throw new PublicationHttpError(response.status,
        `HTTP ${response.status}: ${typeof payload?.detail === "string" ? payload.detail : JSON.stringify(payload?.detail ?? payload)}`);
      if (operation === "options") update({ options: validatePublicationOptions(payload, boundContext), notice: "" });
      else if (operation === "plan") update({ plan: { request: body as PublicationRequest,
        response: validatePublicationPlan(payload, body as PublicationRequest, options!) }, confirmed: false, notice: "" });
      else update({ result: validatePublicationResult(payload, boundPlan!), confirmed: false, notice: "Publication acknowledged for the displayed plan only. No inference was started." });
    } catch (error) {
      if (!current()) return;
      const knownRejection = error instanceof PublicationHttpError && error.status >= 400 && error.status < 500;
      if (operation === "commit" && knownRejection && boundPlan) submitted.delete(boundPlan.response.confirmationKey);
      const unknownOutcome = operation === "commit" && !knownRejection
        ? `Publication outcome unknown for ${boundContext.sequenceId}, frame ${boundContext.frameId}, confirmation ${boundPlan?.response.confirmationKey}. Do not replay; inspect the destination before a new publication.`
        : state.unknownOutcome;
      update({ plan: null, confirmed: false, result: null,
        error: `${String(error)}. Explicitly refresh options and review a new plan; nothing is retried automatically.`,
        unknownOutcome,
        options: null });
    } finally {
      if (current()) { pending = null; update({ phase: "idle" }); }
    }
  }
  const refresh = async () => {
    if (!state.active || !state.open || state.phase === "committing") return;
    invalidate("Refreshing options clears the previous selection, plan and result.");
    update({ options: null, selection: emptySelection() });
    const error = publicationContextError(state.context);
    if (error) { update({ error }); return; }
    await perform("options");
  };
  return {
    getSnapshot: () => state,
    subscribe: (listener: () => void) => { listeners.add(listener); return () => { listeners.delete(listener); }; },
    dismissOutcomeWarning() { update({ unknownOutcome: "" }); },
    setContext(next: PublicationContext | null) {
      if (publicationContextKey(next) === publicationContextKey(state.context)) return;
      invalidate("Context changed; the previous options, selection, plan and result were cleared.");
      update({ context: next && clone(next), open: false, options: null, selection: emptySelection() });
    },
    setActive(active: boolean) {
      if (active === state.active) return;
      invalidate("Publication paused; explicitly refresh options before planning.");
      update({ active, options: null });
    },
    suspend() { invalidate("Publication paused; explicitly refresh options before planning."); update({ active: false, options: null }); },
    async open() { if (!state.active || state.open) return; update({ open: true }); await refresh(); },
    close() { invalidate("Section closed; its previous plan/result were cleared."); update({ open: false, options: null }); },
    refresh,
    select(patch: Partial<PublicationSelection>) {
      const next = { ...state.selection, ...clone(patch) };
      if (next.kind !== state.selection.kind) { next.sourceId = ""; next.destinationId = ""; next.itemIds = []; }
      else if (next.sourceId !== state.selection.sourceId) next.itemIds = [];
      invalidate("Selection changed; the previous plan/result and confirmation were cleared.");
      update({ selection: next });
    },
    async plan() {
      if (!state.active || !state.open || state.phase !== "idle") return;
      try {
        requireValue(state.context && state.options, "Open or refresh valid publication options first.");
        const body = publicationRequest(state.context, state.options, state.selection);
        invalidate();
        await perform("plan", body);
      } catch (error) { update({ error: String(error) }); }
    },
    confirm(confirmed: boolean) {
      if (state.phase === "idle" && state.plan && !state.result) update({ confirmed });
    },
    async publish() {
      if (!state.active || !state.open || state.phase !== "idle" || !state.confirmed || !state.plan || !state.options || !state.context || state.result) return;
      try {
        const plan = state.plan;
        requireValue(JSON.stringify(publicationRequest(state.context, state.options, state.selection)) === JSON.stringify(plan.request),
          "Selection changed since planning. Refresh and replan.");
        requireValue(!submitted.has(plan.response.confirmationKey), "This confirmation was already submitted. Inspect its destination instead of replaying it.");
        submitted.add(plan.response.confirmationKey);
        await perform("commit", { ...plan.request, confirmed: true, confirmationKey: plan.response.confirmationKey });
      } catch (error) { update({ error: String(error), confirmed: false }); }
    },
  };
}
