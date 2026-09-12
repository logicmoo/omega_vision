import { useLayoutEffect, useRef, useState, useSyncExternalStore } from "react";
import { ColoredTagCombobox } from "@app/components/ColoredTagCombobox";
import { useMenuSurfaceLifecycle } from "@app/components/MenuVisibilityBoundary";
import { memoryRequest } from "@app/components/MemorySession";
import { directCompositeDescription, type DirectComposite } from "./DirectCompositePickerModel";
import { semanticJson } from "./SemanticEventsModel";
import { actualRowFrameId, loadRowTargetEligibility, RecognitionRowCallController, rowJobActive, rowPlanConfirmationError, rowStageAvailable, rowTargetEligibilityError, type RowTargetEligibility } from "./RecognitionRowStageCallModel";

type Props = {
  workspaceId: string;
  sequenceId: string;
  unitId: unknown;
  composites: readonly DirectComposite[];
  catalogError?: string;
  disabledReason?: string;
  beforeRequest: () => Promise<void>;
  onCompleted: () => void | Promise<void>;
};

export function RecognitionRowStageCall(props: Props) {
  const frameId = actualRowFrameId(props.unitId);
  return <RowStageCall key={JSON.stringify([props.workspaceId, props.sequenceId, frameId])} {...props} frameId={frameId} />;
}

function RowStageCall(props: Props & { frameId: string | null }) {
  const lifecycle = useMenuSurfaceLifecycle();
  const callbacks = useRef(props);
  callbacks.current = props;
  const [eligibility, setEligibility] = useState<RowTargetEligibility | null>(null);
  const eligibilityRef = useRef(eligibility);
  eligibilityRef.current = eligibility;
  const eligibilityAbort = useRef<AbortController | null>(null);
  const mounted = useRef(false);
  const eligibilityPending = useRef(false);
  const [eligibilityBusy, setEligibilityBusy] = useState(false);
  const [eligibilityError, setEligibilityError] = useState("");
  const [controller] = useState(() => new RecognitionRowCallController({
    workspaceId: props.workspaceId, sequenceId: props.sequenceId, frameId: props.frameId,
  }, {
    catalog: () => callbacks.current.composites,
    eligibility: () => eligibilityRef.current,
    enabled: () => !callbacks.current.disabledReason && !callbacks.current.catalogError,
    visible: () => !document.hidden && !lifecycle.paused,
    beforeRequest: () => callbacks.current.beforeRequest(),
    post: (url, body, signal, progress, readOnly) => memoryRequest(url, body, signal, progress, readOnly),
    get: (url, signal) => semanticJson(url, { signal }),
    cancel: (url, body, signal) => semanticJson(url, {
      method: "POST", signal, headers: { "Content-Type": "application/json" }, body: JSON.stringify(body),
    }),
    completed: () => callbacks.current.onCompleted(),
  }));
  const state = useSyncExternalStore(controller.subscribe, controller.getSnapshot);
  useLayoutEffect(() => {
    mounted.current = true;
    const visibility = () => {
      if (document.hidden || lifecycle.paused) {
        eligibilityAbort.current?.abort();
        eligibilityPending.current = false;
        setEligibilityBusy(false);
        controller.suspend();
      } else controller.resume();
    };
    visibility();
    document.addEventListener("visibilitychange", visibility);
    return () => {
      mounted.current = false;
      document.removeEventListener("visibilitychange", visibility);
      eligibilityAbort.current?.abort();
      eligibilityPending.current = false;
      setEligibilityBusy(false);
      controller.suspend();
    };
  }, [controller, lifecycle]);

  async function checkEligibility() {
    if (!mounted.current || eligibilityPending.current || props.disabledReason || props.catalogError || !props.frameId || document.hidden || lifecycle.paused
        || state.busy === "committing" || rowJobActive(state.job)) return;
    eligibilityAbort.current?.abort();
    const abort = new AbortController(), epoch = lifecycle.suspensionEpoch;
    eligibilityAbort.current = abort;
    eligibilityPending.current = true;
    eligibilityRef.current = null;
    setEligibility(null); setEligibilityBusy(true); setEligibilityError("");
    controller.dismissPlan();
    try {
      const result = await loadRowTargetEligibility({
        workspaceId: props.workspaceId, sequenceId: props.sequenceId, frameId: props.frameId,
      }, memoryRequest, abort.signal);
      if (!abort.signal.aborted && epoch === lifecycle.suspensionEpoch && !lifecycle.paused) {
        eligibilityRef.current = result;
        setEligibility(result);
      }
    } catch (error) {
      if (!abort.signal.aborted && epoch === lifecycle.suspensionEpoch) {
        setEligibilityError(error instanceof Error ? error.message : String(error));
      }
    } finally {
      if (!abort.signal.aborted && epoch === lifecycle.suspensionEpoch) {
        eligibilityPending.current = false;
        setEligibilityBusy(false);
      }
    }
  }

  const disabledReason = !props.frameId ? "No actual unitId on this row; its display ID is not an execution target."
    : props.disabledReason || props.catalogError || "";
  const selected = props.composites.find(entry => entry.id === state.stageId);
  const active = rowJobActive(state.job);
  const locked = active || state.busy === "committing" || state.uncertain;
  const eligibilityBlock = rowTargetEligibilityError(state.stageId, eligibility);
  const planError = state.plan ? rowPlanConfirmationError(state.plan) : undefined;
  const job = state.job;
  return <div className="video-import-direct-call" role="group" aria-label={`Row stage call: ${props.frameId ?? "unit unavailable"}`}
    style={{ padding: "6px 10px", alignItems: "flex-start", boxSizing: "border-box" }}
    onClick={event => event.stopPropagation()} onKeyDown={event => event.stopPropagation()}>
    <div style={{ flex: "1 1 280px", minWidth: 0, maxWidth: "38rem" }}>
      <ColoredTagCombobox ariaLabel={`Registered stage for frame ${props.frameId ?? "unavailable"}`}
        value={state.stageId} ids={props.composites.map(entry => entry.id)} allowNone
        noneLabel={props.catalogError ? "Registered stages unavailable" : eligibilityBusy ? "Checking row targets…" : "Choose a registered stage"}
        onOpen={() => queueMicrotask(() => void checkEligibility())}
        describe={id => {
          const description = directCompositeDescription(id, props.composites);
          const reason = rowTargetEligibilityError(id, eligibility);
          return { ...description,
            disabled: description.disabled || Boolean(reason) || !rowStageAvailable(props.composites.find(entry => entry.id === id)),
            tags: reason ? [{ text: reason, color: "#a8b4be" }] : description.tags,
          };
        }}
        disabled={Boolean(disabledReason) || locked || !props.composites.length}
        closedWidth="100%" openWidth="min(70ch, 85vw)" onChange={id => controller.select(id)} />
    </div>
    <button type="button" disabled={Boolean(disabledReason) || locked || Boolean(state.busy) || Boolean(eligibilityBlock) || !rowStageAvailable(selected)}
      onClick={() => void controller.plan()}>{state.busy === "planning" ? "Planning…" : state.plan ? "Replan row" : "Plan row call"}</button>
    <span style={{ alignSelf: "center", fontSize: 11, maxWidth: "100%", overflowWrap: "anywhere" }}>Unit <code>{props.frameId ?? "unavailable"}</code></span>
    {disabledReason && <small role="status">{disabledReason}</small>}
    {eligibilityBusy && <small role="status">Checking supported row targets…</small>}
    {eligibilityError && <small role="alert">{eligibilityError} <button type="button" disabled={eligibilityBusy || locked}
      onClick={() => void checkEligibility()}>Retry supported targets</button></small>}
    {!eligibilityBusy && state.stageId && eligibilityBlock && <small role="status">{eligibilityBlock}</small>}
    {state.plan && <div style={{ flexBasis: "100%", minWidth: 0 }} role="region" aria-label="Review row call">
      <div style={{ display: "flex", flexWrap: "wrap", alignItems: "center", gap: 8, padding: "4px 0" }}>
        <span>Current <code>{state.plan.target.currentFrameId}</code> · index {state.plan.target.currentFrameOrder}</span>
        <span>Previous <code>{state.plan.target.previousFrameId ?? "none"}</code> ({state.plan.target.status.replaceAll("_", " ")})</span>
        <span>{state.plan.frameCount} support frames · {state.plan.llmCallCount} model calls</span>
        <button type="button" disabled={Boolean(disabledReason) || Boolean(state.busy) || active || Boolean(planError) || Boolean(eligibilityBlock)}
          onClick={() => void controller.confirm()}>{state.busy === "committing" ? "Calling…" : "Confirm & call row"}</button>
        <button type="button" disabled={Boolean(state.busy)} onClick={() => controller.dismissPlan()}>Dismiss plan</button>
      </div>
      {planError && <div role="alert">{planError}</div>}
      <details>
        <summary>Evidence configuration &amp; causal support</summary>
        <div>Stage: <code>{state.plan.stageId}</code>. Outputs target only <code>{state.plan.request.frameId}</code>.</div>
        <div style={{ overflowWrap: "anywhere" }}>Support: {state.plan.supportFrameIds.join(", ") || "none"}</div>
        <pre style={{ maxHeight: 240, overflow: "auto", whiteSpace: "pre-wrap" }}>{JSON.stringify({
          pipeline: state.plan.raw.pipeline, steps: state.plan.raw.steps,
        }, null, 2)}</pre>
        <div>These are the server-reported pipeline options. Resolved memory destinations are not returned by this plan.
          Confirmation rechecks preprocessing, runtime preferences and the browser-memory snapshot.</div>
      </details>
    </div>}
    {job && <div style={{ flexBasis: "100%", minWidth: 0 }}>
      <div style={{ display: "flex", flexWrap: "wrap", alignItems: "center", gap: 8 }}>
        <span role="status"><code>{job.request.stageId}</code>: {job.state} · {job.done}/{job.total}
          {job.cancelling ? " · cancellation requested" : ""}{state.busy === "committing" ? " · awaiting final execution receipt" : ""}</span>
        {job.total > 0 && <progress aria-label="Row call stages completed" value={job.done} max={job.total} />}
        <button type="button" disabled={state.reading} onClick={() => void controller.refreshStatus()}>
          {state.reading ? "Reading status…" : "Refresh job status"}</button>
        <button type="button" disabled={!active || state.stopping || job.cancelling} onClick={() => void controller.stop()}>
          {state.stopping ? "Requesting stop…" : "Stop row call"}</button>
      </div>
      {job.error && <div role="alert">{job.error}</div>}
      <details><summary>Job evidence</summary>
        <pre style={{ maxHeight: 240, overflow: "auto", whiteSpace: "pre-wrap" }}>{JSON.stringify(job.raw, null, 2)}</pre>
      </details>
    </div>}
    {(state.error || state.statusError) && <div role="alert" style={{ flexBasis: "100%", overflowWrap: "anywhere" }}>
      {state.error && <div>{state.error}</div>}{state.statusError && <div>{state.statusError}</div>}
      {state.uncertain && <div>No job ID was received. Check execution history before starting another call; this control will not retry execution.</div>}
    </div>}
    {!state.plan && !job && !disabledReason && <small>Planning does not execute. LLM stages and their confirmations remain in the existing rich controls.</small>}
  </div>;
}
