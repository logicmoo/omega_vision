import { useEffect, useLayoutEffect, useRef, useState, useSyncExternalStore } from "react";
import { useMenuSurfaceLifecycle } from "@app/components/MenuVisibilityBoundary";
import type { RecordingTest } from "./RecordingTestsModel";
import {
  canCreateRecordingExecution, canStepRecordingExecution, canStopRecordingExecution, createRecordingTestExecution,
  recordingExecutionContextError, recordingExecutionKey,
} from "./RecordingTestExecutionModel";
import "../styles/recording_test_execution.css";

export type RecordingTestExecutionProps = {
  workspaceId: string; test: RecordingTest; visualSequenceId: string;
  controlsVisible?: boolean; previewFrameKey?: string; beforeWrite?: () => void;
};

function EvidenceJson({ label, value }: { label: string; value: unknown }) {
  return <details><summary>{label}</summary><pre>{JSON.stringify(value, null, 2)}</pre></details>;
}

export function RecordingTestExecution({ workspaceId, test, visualSequenceId, controlsVisible = true,
  previewFrameKey = "", beforeWrite }: RecordingTestExecutionProps) {
  const lifecycle = useMenuSurfaceLifecycle();
  const visible = useRef(controlsVisible);
  visible.current = controlsVisible;
  const context = { workspaceId, test, visualSequenceId }, contextKey = recordingExecutionKey(context);
  const [client] = useState(() => createRecordingTestExecution(context, {
    allowed: () => visible.current && !lifecycle.paused && document.visibilityState !== "hidden",
    epoch: () => lifecycle.suspensionEpoch,
  }));
  const state = useSyncExternalStore(client.subscribe, client.getSnapshot, client.getSnapshot);
  useLayoutEffect(() => {
    client.setContext(context, previewFrameKey);
    client.setActive(controlsVisible && !lifecycle.paused && document.visibilityState !== "hidden");
  }, [client, contextKey, controlsVisible, previewFrameKey, lifecycle]);
  useEffect(() => {
    const update = () => client.setActive(visible.current && !lifecycle.paused && document.visibilityState !== "hidden");
    update();
    document.addEventListener("visibilitychange", update);
    return () => { document.removeEventListener("visibilitychange", update); client.suspend(); };
  }, [client, lifecycle]);
  const run = state.run, busy = Boolean(state.busy);
  const contextError = recordingExecutionContextError(state.context);
  const write = (action: () => Promise<void>) => { beforeWrite?.(); void action(); };
  const grading = state.report?.grading[0];
  return <section className="recording-execution" aria-label={`${test.title}: selected-recording native execution`}>
    {controlsVisible && <>
      <h4>Native execution · {test.title}</h4>
      <p>Selected recording only: <code>{visualSequenceId}</code>. Definition metadata: <code>{test.executionStatus}</code> — not a saved run status.</p>
      <label className="recording-execution-confirm"><input type="checkbox" checked={state.confirmed} disabled={busy}
        onChange={event => client.confirm(event.target.checked)} />I confirm durable native STM for this recording. No learning, approval or promotion.</label>
      <div className="recording-execution-controls">
        <button type="button" disabled={!canCreateRecordingExecution(state)} onClick={() => write(() => client.start("step"))}>Start step run</button>
        <button type="button" disabled={!canStepRecordingExecution(state)} onClick={() => write(client.step)}>Step</button>
        <button type="button" disabled={!canCreateRecordingExecution(state)} onClick={() => write(() => client.start("run"))}>Run selected recording (background job)</button>
        <button type="button" disabled={busy || !run || !state.active} onClick={() => void client.refresh()}>Refresh run / report</button>
        <button type="button" disabled={!canStopRecordingExecution(state)} onClick={() => write(client.stop)}>Stop</button>
        <span role="status">{busy ? `${state.busy}…` : state.polling ? "Read-only status monitoring" : "Explicit actions only"}</span>
      </div>
      <p className="recording-execution-note">Start step run creates a cursor without executing; the first Step processes frame 0. Preview transport remains read-only.
        A background job continues when controls/view close. Stop is required; an in-flight frame may finish. Stopped is terminal.</p>
      {contextError && <p role="alert">{contextError}</p>}
      <div className="recording-execution-history">
        <button type="button" disabled={busy || !state.active || Boolean(contextError)} onClick={() => void client.refreshHistory()}>Refresh saved run history (read-only)</button>
        {state.history && !state.history.length && <span>No saved selected-recording runs. Other clips and full-family runs are excluded.</span>}
        {Boolean(state.history?.length) && <label>Saved run for this exact recording<select value={state.history?.some(item => item.id === run?.id) ? run!.id : ""}
          disabled={busy} onChange={event => void client.load(event.target.value)}>
          <option value="">Choose a run to load read-only</option>
          {state.history?.map(item => <option key={item.id} value={item.id}>{item.createdAt} · {item.id} · {item.status} / {item.outcome}</option>)}
        </select></label>}
      </div>
      {state.unknownCreate && <p role="alert">The start outcome is unknown. Inspect history and load the actual issued run; do not start another as a retry.
        <button type="button" disabled={busy || !run || state.needsRefresh || !state.history?.some(item => item.id === run.id)}
          onClick={() => client.acknowledgeReconciledCreate()}>I identified the issued run in saved history</button>
      </p>}
    </>}
    {state.notice && <p className="recording-execution-note" role="status">{state.notice}</p>}
    {state.error && <p role="alert">{state.error}</p>}
    {run && <>
      <div className="recording-execution-status" role="status">
        <strong>{run.status} · {run.outcome}</strong><span>{run.progress.processedFrames} / {run.progress.totalFrames} processed</span>
        <span>Executed frame {run.progress.frameIndex ?? "none"} · revision {run.revision} · observer {run.observer}</span>
      </div>
      <p><code>{run.id}</code> · <code>{run.recordings[0].visualSequenceId}</code> · {run.mode === "run" ? "server background job" : "explicit step run"}</p>
      {run.status === "stale" && <p role="alert">Historical producing implementation/source is no longer current. Stored status: {run.storedStatus ?? "unavailable"};
        stored outcome: {run.storedOutcome ?? "unavailable"}. This is not permission to resume.</p>}
      {run.error && <p role="alert">{run.error}</p>}
      {run.learn && <p>This saved run enabled learning. It can be inspected or stopped here, but not stepped, approved or promoted.</p>}
      <p className="recording-execution-note">{run.status === "stale" ? "Stored historical score" : "Actual score"}: {run.score.passed} passed · {run.score.failed} failed · {run.score.inconclusive} inconclusive · {run.score.unsupported} unsupported.
        Completion and preview ticks do not imply a pass or successful learning.</p>
      {run.limitations.length > 0 && <ul>{run.limitations.map((item, index) => <li key={index}>{item}</li>)}</ul>}
      <details className="recording-execution-evidence"><summary>Frozen frame evidence, predictions and conditional hypotheses ({run.evidence.length})</summary>
        <p>Observation rows, predictions and competing hypotheses are distinct. Hypotheses do not establish a hidden physical cause.
          References below identify stored provenance; this view does not reconstruct frames or fetch evaluator assets.</p>
        {!run.evidence.length && <p>No frame has been executed.</p>}
        {run.evidence.map(row => <details key={row.frameId}><summary>Frame {row.frameId} · acquired {row.atSeconds}s · decision {row.decisionSeconds}s · core {row.coreStatus}</summary>
          <EvidenceJson label="Recorded observation rows" value={row.observed} />
          <EvidenceJson label="Predictions — not observed facts" value={row.predictions} />
          <EvidenceJson label="Conditional / competing hypotheses — not established causes" value={row.hypotheses} />
          <EvidenceJson label="Core event assessment and evidence references" value={{ assessment: row.recognizedEventAssessment, evidenceRefs: row.coreEvidenceRefs }} />
          <EvidenceJson label="Frozen source and native STM provenance" value={{
            visualSequenceId: row.visualSequenceId, frameId: row.frameId, sourceHash: row.sourceHash,
            nativeCheckpointUid: row.nativeCheckpointUid, memoryRefs: row.memoryRefs, frameResultRef: row.frameResultRef,
          }} />
        </details>)}
      </details>
      {grading && <details className="recording-execution-evidence"><summary>Evaluator-only grading · {grading.status}</summary>
        <p>Grading is separate from native observed memory and uses already-frozen inference. It adds no student evidence.</p>
        {grading.status === "pending" ? <p>Not graded yet.</p> : <>
          <ul>{grading.result.checks.map((check: any, index: number) => <li key={index}>
            <strong>{check.outcome}</strong> · {check.name}<EvidenceJson label="Conditional assessment / proof references" value={check} />
          </li>)}</ul>
          <EvidenceJson label="Exact grading scope, counts and immutable report provenance" value={grading} />
        </>}
      </details>}
    </>}
  </section>;
}
