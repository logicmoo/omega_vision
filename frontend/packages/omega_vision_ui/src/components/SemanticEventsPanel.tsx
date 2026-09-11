import { useEffect, useId, useRef, useState } from "react";
import { useContextReset } from "@app/lib/useContextReset";
import { postSemanticMemoryAction } from "./SemanticExecutionApi";
import {
  compareHypotheses, createRequestScope, errorMessage, isRecord, isUninitializedCanonicalLog, latestEvaluation, observeSemanticJobs, record, records,
  savedSourceReferences, scopedCandidateBody, selectionAfterRefresh, semanticJson, semanticOutputDetail, semanticUrl, strings, text, type SemanticPlan, type SemanticRecord,
} from "./SemanticEventsModel";
import {
  SemanticArtifact, SemanticCandidateDetail, SemanticEpisodes, SemanticEventLog,
  SemanticFrames, SemanticJson, SemanticTable,
} from "./SemanticEventsViews";
import { SemanticEventsConfirmation } from "./SemanticEventsConfirmation";
import { SemanticCandidateEvaluation } from "./SemanticCandidateEvaluation";
import "../styles/semantic_events_panel.css";

export type SemanticContext = {
  workspaceId: string;
  sequenceId: string;
  firstN: number;
  modelId: string;
};

export type SemanticExecutionState = {
  ordered: boolean;
  frameCount: number;
  frames: Array<{ id: string; label: string; index: number }>;
  stages: Array<{ id: string; label: string; description: string; llm: boolean }>;
  todos: SemanticRecord[];
  jobs: SemanticRecord[];
  artifacts: Array<{ path: string; label: string; url: string }>;
  outputs: SemanticRecord[];
};

/** The transport maps the registered stage router; no provider setup or mutation runs in effects. */
export type SemanticExecutionApi = {
  read: (context: SemanticContext, signal: AbortSignal) => Promise<SemanticExecutionState>;
  plan: (context: SemanticContext, stageId: string, signal: AbortSignal) => Promise<SemanticPlan>;
  /** run=true executes directly without changing TODOs; false only merges the planned TODOs. */
  commit: (context: SemanticContext, plan: SemanticPlan, run: boolean, signal: AbortSignal) => Promise<SemanticRecord>;
  cancel?: (context: SemanticContext, job: SemanticRecord, signal: AbortSignal) => Promise<SemanticRecord>;
};

export type SemanticEventsPanelProps = {
  workspaceId: string;
  sequenceId: string;
  firstN: number;
  visionModelId: string;
  contextReady: boolean;
  executionApi: SemanticExecutionApi;
  onSelectFrame?: (frameId: string) => void;
  onUpdated?: () => void;
  refreshKey?: string | number;
  defaultOpen?: boolean;
  selectedFrameId?: string;
};

type ResourceState = {
  candidates?: SemanticRecord[];
  ruleContext?: { frameId: string; proposalFrameId: string; frames: Array<{ frameId: string; levelId: string | null; frameOrder: number }> };
  canonical?: SemanticRecord;
  hypotheses?: SemanticRecord[];
  abductions?: SemanticRecord[];
  episodes?: SemanticRecord[];
  execution?: SemanticExecutionState;
};

export function SemanticEventsPanel(props: SemanticEventsPanelProps) {
  return <SemanticEventsPanelContext key={JSON.stringify([props.workspaceId, props.sequenceId])} {...props} />;
}

function SemanticEventsPanelContext(props: SemanticEventsPanelProps) {
  const { workspaceId, sequenceId, firstN, visionModelId, contextReady, defaultOpen = false } = props;
  const id = useId();
  const callbacks = useRef(props);
  callbacks.current = props;
  const scope = useRef(createRequestScope());
  const readScope = useRef(createRequestScope());
  const knownJobs = useRef(new Map<string, string>());
  const reading = useRef(false);
  const mutating = useRef(false);
  const [expanded, setExpanded] = useState(defaultOpen);
  const [data, setData] = useState<ResourceState>({});
  const [canonicalUninitialized, setCanonicalUninitialized] = useState(false);
  const [errors, setErrors] = useState<Record<string, string>>({});
  const [loading, setLoading] = useState(false);
  const [busy, setBusy] = useState(false);
  const [actionError, setActionError] = useState("");
  const [actionResult, setActionResult] = useState<SemanticRecord | null>(null);
  const [plan, setPlan] = useState<SemanticPlan | null>(null);
  const [selectedFrame, setSelectedFrame] = useState("");
  useContextReset(props.selectedFrameId || "", () => setSelectedFrame(props.selectedFrameId || ""));
  const [selectedCandidate, setSelectedCandidate] = useState("");
  const [ruleFrameId, setRuleFrameId] = useState("");
  const [proposalFrameId, setProposalFrameId] = useState("");
  const [evaluation, setEvaluation] = useState<SemanticRecord | null>(null);
  const [replayOpen, setReplayOpen] = useState(false);
  const [supersede, setSupersede] = useState(false);
  const [replayFrameCount, setReplayFrameCount] = useState("");
  const [inspected, setInspected] = useState<SemanticRecord | null>(null);
  const [sourcePath, setSourcePath] = useState("");
  const context = (): SemanticContext => ({
    workspaceId, sequenceId, firstN: callbacks.current.firstN, modelId: callbacks.current.visionModelId,
  });
  const ready = contextReady && Boolean(workspaceId && sequenceId);

  async function refresh(force = false) {
    if (!ready || (reading.current && !force)) return;
    if (force) readScope.current.invalidate();
    const request = readScope.current.capture();
    reading.current = true;
    setLoading(true);
    const ruleContextRequest = (async () => {
        const requestedFrame = ruleFrameId || props.selectedFrameId || "";
        const payload = record(await semanticJson(
          `${semanticUrl("/memory/recording-context", workspaceId, sequenceId)}${requestedFrame ? `&frameId=${encodeURIComponent(requestedFrame)}` : ""}`,
          { signal: request.signal },
        ));
        const frames = records(payload.frames, "recording frames").map(frame => {
          if (typeof frame.frameId !== "string" || typeof frame.frameOrder !== "number"
              || (frame.levelId !== null && typeof frame.levelId !== "string")) throw new Error("Invalid recording frame context.");
          return { frameId: frame.frameId, levelId: frame.levelId, frameOrder: frame.frameOrder };
        });
        const current = frames.find(frame => frame.frameId === payload.selectedFrameId);
        const origin = frames.find(frame => frame.frameId === (proposalFrameId || current?.frameId));
        if (!current || !origin || origin.frameOrder > current.frameOrder) throw new Error("Proposal frame must be the current or an earlier manifest frame.");
        const ruleContext = { frameId: current.frameId, proposalFrameId: origin.frameId, frames };
        if (request.current()) setData(previous => ({ ...previous, ruleContext }));
        return ruleContext;
    })();
    const tasks: Array<[keyof ResourceState, () => Promise<unknown>]> = [
      ["candidates", async () => {
        const current = await ruleContextRequest;
        return records(record(await semanticJson(
          `${semanticUrl("/candidates", workspaceId, sequenceId)}&frameId=${encodeURIComponent(current.frameId)}&proposalFrameId=${encodeURIComponent(current.proposalFrameId)}`,
          { signal: request.signal },
        )).candidates, "candidates");
      }],
      ["abductions", async () => {
        const current = await ruleContextRequest;
        const value = record(await semanticJson(
          `${semanticUrl("/abductions", workspaceId, sequenceId)}&frameId=${encodeURIComponent(current.frameId)}`,
          { signal: request.signal },
        ));
        if (value.authoritative !== false) throw new Error("Abductive explanations must be non-authoritative.");
        const entries = records(value.entries, "abduction snapshots");
        for (const entry of entries) {
          const result = record(entry.result, "abduction result");
          if (entry.authoritative !== false || result.authoritative !== false) throw new Error("Stored abduction snapshot must remain non-authoritative.");
          for (const hypothesis of records(result.hypotheses, "abductive hypotheses")) {
            if (hypothesis.authoritative !== false) throw new Error("Abductive hypothesis cannot be an observed fact.");
            record(hypothesis.rule, "explaining rule");
            record(hypothesis.observed_effect, "observed effect");
          }
        }
        return entries;
      }],
      ["canonical", async () => {
        const value = record(await semanticJson(semanticUrl("/events", workspaceId, sequenceId), { signal: request.signal }));
        records(value.entries, "canonical entries");
        if (typeof value.generation !== "number") throw new Error("Canonical log generation is missing.");
        try {
          const episodes = records(record(await semanticJson(
            `${semanticUrl("/events/episodes", workspaceId, sequenceId)}&generation=${value.generation}`,
            { signal: request.signal },
          )).episodes, "episodes");
          if (request.current()) {
            setData((previous) => ({ ...previous, episodes }));
            setErrors((previous) => { const next = { ...previous }; delete next.episodes; return next; });
          }
        } catch (reason) {
          if (request.current()) setErrors((previous) => ({ ...previous, episodes: errorMessage(reason) }));
        }
        return value;
      }],
      ["hypotheses", async () => records(record(await semanticJson(semanticUrl("/events/hypotheses", workspaceId, sequenceId), { signal: request.signal })).hypotheses, "hypotheses")],
      ["execution", async () => callbacks.current.executionApi.read(context(), request.signal)],
    ];
    await Promise.all(tasks.map(async ([key, load]) => {
      try {
        const value = await load();
        if (!request.current()) return;
        if (key === "canonical") setCanonicalUninitialized(false);
        setData((previous) => ({ ...previous, [key]: value }));
        setErrors((previous) => { const next = { ...previous }; delete next[key]; return next; });
        if (key === "candidates") setSelectedCandidate((previous) => selectionAfterRefresh(previous, value as SemanticRecord[], "candidate_id"));
        if (key === "execution") {
          const observation = observeSemanticJobs(knownJobs.current, (value as SemanticExecutionState).jobs);
          knownJobs.current = observation.states;
          if (observation.completedJobIds.length) {
            try {
              await callbacks.current.onUpdated?.();
            } catch (reason) {
              if (request.current()) setActionError(`Job completed, but refreshing the parent view failed: ${errorMessage(reason)}`);
            }
          }
        }
      } catch (reason) {
        if (!request.current()) return;
        if (key === "canonical" && isUninitializedCanonicalLog(reason)) {
          setCanonicalUninitialized(true);
          setData((previous) => { const next = { ...previous }; delete next.canonical; delete next.episodes; return next; });
          setErrors((previous) => { const next = { ...previous }; delete next.canonical; delete next.episodes; return next; });
        } else {
          if (key === "canonical") setCanonicalUninitialized(false);
          setErrors((previous) => ({ ...previous, [key]: errorMessage(reason) }));
        }
      }
    }));
    if (request.current()) {
      reading.current = false;
      setLoading(false);
    }
  }

  useContextReset(JSON.stringify([workspaceId, sequenceId, firstN, visionModelId, contextReady, ruleFrameId, proposalFrameId, props.selectedFrameId]), () => {
    scope.current.invalidate();
    readScope.current.invalidate();
    reading.current = false;
    mutating.current = false;
    setBusy(false);
    setLoading(false);
    setPlan(null);
    setEvaluation(null);
    setReplayOpen(false);
    setSupersede(false);
    setReplayFrameCount("");
    setActionError("");
    setActionResult(null);
    setData(previous => { const next = { ...previous }; delete next.candidates; delete next.abductions; delete next.ruleContext; return next; });
    setSelectedCandidate("");
  });
  useEffect(() => {
    reading.current = false;
    mutating.current = false;
    setBusy(false);
    setLoading(false);
    return () => { scope.current.invalidate(); readScope.current.invalidate(); };
  }, [workspaceId, sequenceId, firstN, visionModelId, contextReady]);

  useEffect(() => {
    if (expanded && ready) void refresh();
  }, [expanded, ready, firstN, visionModelId, props.refreshKey, ruleFrameId, proposalFrameId, props.selectedFrameId]);

  const activeJobs = data.execution?.jobs.some((job) => ["running", "starting", "queued"].includes(text(job.state))) ?? false;
  useEffect(() => {
    if (!expanded || !ready || !activeJobs || errors.execution) return;
    const timer = window.setInterval(() => void refresh(), 2500);
    return () => window.clearInterval(timer);
  }, [expanded, ready, activeJobs, errors.execution, firstN, visionModelId, ruleFrameId, proposalFrameId, props.selectedFrameId]);

  async function act(operation: (signal: AbortSignal) => Promise<SemanticRecord>, clearPlan = true) {
    if (!ready || mutating.current) return;
    const request = scope.current.capture();
    mutating.current = true;
    setBusy(true);
    setActionError("");
    setActionResult(null);
    try {
      const result = await operation(request.signal);
      if (!request.current()) return;
      knownJobs.current = observeSemanticJobs(knownJobs.current, [result]).states;
      setActionResult(result);
      if (result.requiresIndependentEvaluation === true && isRecord(result.candidate)) {
        setSelectedCandidate(text(result.candidate.candidate_id));
      }
      if (clearPlan) setPlan(null);
      setEvaluation(null);
      callbacks.current.onUpdated?.();
      await refresh(true);
    } catch (reason) {
      if (request.current()) setActionError(errorMessage(reason));
    } finally {
      if (request.current()) { mutating.current = false; setBusy(false); }
    }
  }

  async function prepare(stageId: string) {
    if (!ready || mutating.current) return;
    const request = scope.current.capture();
    mutating.current = true;
    setBusy(true);
    setPlan(null);
    setActionError("");
    setActionResult(null);
    try {
      const value = await callbacks.current.executionApi.plan(context(), stageId, request.signal);
      if (request.current()) setPlan(value);
    } catch (reason) {
      if (request.current()) setActionError(errorMessage(reason));
    } finally {
      if (request.current()) { mutating.current = false; setBusy(false); }
    }
  }

  const postCandidate = (action: string, candidate: SemanticRecord, body: SemanticRecord) =>
    act(async (signal) => {
      const path = `/candidates/${encodeURIComponent(text(candidate.candidate_id))}/${action}`;
      const scoped = scopedCandidateBody(action, candidate.kind, body, {
        workspaceId, sequenceId, frameId: data.ruleContext?.frameId || "",
        proposalFrameId: data.ruleContext?.proposalFrameId || "",
      });
      if (action === "evaluate" || action === "deployment") return postSemanticMemoryAction(path, scoped, signal);
      return record(await semanticJson(semanticUrl(path, workspaceId), {
        method: "POST", signal, headers: { "Content-Type": "application/json" }, body: JSON.stringify(scoped),
      }));
    });
  const candidates = data.candidates;
  const candidate = candidates?.find((item) => item.candidate_id === selectedCandidate);
  const entries = data.canonical ? records(data.canonical.entries) : undefined;
  const execution = data.execution;
  const canonicalFrames = isRecord(data.canonical?.inputs) && Array.isArray(data.canonical.inputs.frames)
    ? data.canonical.inputs.frames.filter(isRecord) : [];
  const frameSelection = (frameId: string) => {
    const canonical = canonicalFrames.find((frame) => frame.id === frameId);
    const unit = canonical ? execution?.frames.find((frame) => frame.index === canonical.index)
      : execution?.frames.find((frame) => frame.id === frameId);
    const selected = canonical ?? canonicalFrames.find((frame) => frame.index === unit?.index);
    return { filterId: selected ? text(selected.id) : frameId, sourceId: unit?.id };
  };
  const sources = new Map((execution?.artifacts ?? []).map((artifact) => [artifact.path, artifact]));
  for (const path of savedSourceReferences([candidates, data.hypotheses, actionResult])) {
    if (!sources.has(path)) sources.set(path, {
      path, label: path.split(/[\\/]/).at(-1) || path,
      url: `/workbench/workspaces/${encodeURIComponent(workspaceId)}/asset?path=${encodeURIComponent(path)}`,
    });
  }
  const source = sources.get(sourcePath);
  const selectFrame = (frameId: string) => {
    const selection = frameSelection(frameId);
    setSelectedFrame(selection.filterId);
    if (selection.sourceId) callbacks.current.onSelectFrame?.(selection.sourceId);
  };

  return <details className="semantic-events-panel" data-section="semantic-events" open={expanded}
    onToggle={(event) => setExpanded(event.currentTarget.open)}>
    <summary><strong>Temporal events &amp; learned rules</strong><small>
      {execution ? `${execution.frameCount} frames · ${execution.todos.length} TODOs` : "Open to load saved semantic evidence"}
      {candidates && ` · ${candidates.length} scoped candidates`}
      {activeJobs && " · work in progress"}
    </small></summary>
    <div className="semantic-events-body" aria-busy={loading}>
      {!ready ? <p role="status">Select a Visual Sequence and wait for its workspace context before loading or running semantic work.</p> : <>
        <div className="semantic-events-toolbar">
          <span>First N: {firstN || "all"} · configured vision model: <code>{visionModelId || "not selected"}</code></span>
          <button type="button" disabled={loading || busy} onClick={() => void refresh()}>{loading ? "Loading…" : "Refresh saved records"}</button>
        </div>
        {Object.entries(errors).map(([resource, message]) => <div key={resource} role="alert">
          <strong>{resource} unavailable:</strong> {message}
          {data[resource as keyof ResourceState] !== undefined && " Showing the last successful read; refresh before acting."}
        </div>)}
        {actionError && <div role="alert">{actionError}<p>No success is assumed. Refresh to inspect the server state before retrying.</p></div>}
        {actionResult && <details open><summary>Actual server response</summary>
          <SemanticJson value={actionResult} label="Semantic action result" /></details>}
        <section aria-labelledby={`${id}-actions`}>
          <h3 id={`${id}-actions`}>Run deduction, induction, or abduction</h3>
          <p>Applying authored or promoted rules is <strong>deduction</strong>. Learning a new rule is <strong>induction</strong>.
            Explaining an observed effect by possible earlier causes is <strong>abduction</strong>.
            Neither abductive explanations, LLM hypotheses, nor proposed rules become authoritative events automatically.</p>
          {execution ? <>
            <p>{execution.ordered ? "Ordered sequence. The first frame is an initial boundary, not an event pair."
              : "Not applicable: this sequence is unordered. No adjacent-pair TODOs or LLM calls may be created."}</p>
            <div className="semantic-events-stages">{execution.stages.map((stage) => <div className="semantic-events-stage" key={stage.id}>
              <strong>{stage.label}</strong><p>{stage.description}</p>
              <button type="button" disabled={busy || loading || Boolean(errors.execution) || !execution.ordered || (stage.llm && !visionModelId)}
                onClick={() => void prepare(stage.id)}>Review {stage.label.toLowerCase()}…</button>
            </div>)}</div>
          </> : !errors.execution && <p>Loading registered stages and pair dependencies…</p>}
          {plan && <SemanticEventsConfirmation key={plan.confirmationKey} plan={plan} busy={busy}
            onCancel={() => setPlan(null)} onConfirm={(run) => void act((signal) => callbacks.current.executionApi.commit(context(), plan, run, signal))} />}
        </section>

        <details open className="semantic-events-jobs"><summary>Pair TODOs &amp; jobs{execution && ` · ${execution.todos.length} TODOs / ${execution.jobs.length} jobs`}</summary>
          {execution && <>
            {execution.todos.length ? <SemanticTable label="Saved semantic TODOs" headings={["Frame / pair", "Stage", "Status", "Dependencies / errors", "Record"]}>
              {execution.todos.map((todo, index) => <tr key={text(todo.id ?? index)}>
                <td><SemanticFrames frames={strings([todo.frameId, todo.fromFrame, todo.toFrame])} onSelectFrame={selectFrame} /></td>
                <td>{text(todo.composite ?? todo.step)}</td><td>{text(todo.status)}</td>
                <td>{text(todo.error ?? todo.reason ?? todo.blocked ?? todo.dependsOn)}</td>
                <td><button type="button" onClick={() => setInspected(todo)}>Inspect TODO</button></td>
              </tr>)}</SemanticTable> : <p>The backend reports no saved semantic TODOs.</p>}
            {execution.jobs.length ? <SemanticTable label="Actual semantic jobs" headings={["Stage", "State", "Progress", "Message", "Actions"]}>
              {execution.jobs.map((job) => <tr key={text(job.id)}>
                <td>{text(job.composite ?? job.label)}</td><td>{text(job.state)}</td>
                <td>{typeof job.done === "number" && typeof job.total === "number" && job.total > 0
                  ? <><progress value={job.done} max={job.total} aria-label={`${text(job.label)} progress`} /> {job.done}/{job.total}</>
                  : "Progress not reported"}</td>
                <td>{text(job.error ?? job.message)}</td>
                <td><button type="button" onClick={() => setInspected(job)}>Inspect job</button>
                  {props.executionApi.cancel && ["running", "starting", "queued"].includes(text(job.state)) &&
                    <button type="button" disabled={busy} onClick={() => void act((signal) => callbacks.current.executionApi.cancel!(context(), job, signal), false)}>
                      Request cancellation</button>}</td>
              </tr>)}</SemanticTable> : <p>The backend reports no semantic jobs.</p>}
          </>}
        </details>

        <details open><summary>Canonical log &amp; episodes{data.canonical && ` · generation ${text(data.canonical.generation)}`}</summary>
          <p>Authoritative recorded actions and Prolog deductions are separate from the advisory LLM channel.
            Unknown means insufficient evidence; adequately unchanged means no material change, not an event.</p>
          {canonicalUninitialized && <p role="status">No canonical log saved yet. Run event_log_0/canonical
            from the registered stages after its dependencies are ready. No boundary assessment, transition or episode has been saved.</p>}
          <button type="button" disabled={busy || !execution?.ordered || Boolean(errors.execution)} onClick={() => setReplayOpen((value) => !value)}>
            Review canonical replay…
          </button>
          {replayOpen && <section className="semantic-events-confirm" aria-label="Confirm canonical replay">
            <p>Replay saved deterministic measurements, objects and accepted rules for First N ({firstN || "all"}).
              This makes no LLM calls. Earlier changes require explicit suffix supersession; history is retained.</p>
            <label><input type="checkbox" checked={supersede}
              disabled={!data.canonical || Boolean(errors.canonical)}
              onChange={(event) => setSupersede(event.target.checked)} />
              Supersede the changed suffix of generation {text(data.canonical?.generation)}</label>
            {execution && execution.frameCount > 800 && <label>Confirm all {execution.frameCount} frames
              <input inputMode="numeric" value={replayFrameCount} onChange={(event) => setReplayFrameCount(event.target.value)} /></label>}
            <button type="button" disabled={busy || !execution || (execution.frameCount > 800 && replayFrameCount.trim() !== String(execution.frameCount))}
              onClick={() => void act(async (signal) => {
                const result = await postSemanticMemoryAction("/events/replay", {
                  workspaceId, sequenceId, firstN, supersede,
                  ...(data.canonical && !errors.canonical ? { expectedGeneration: data.canonical.generation } : {}),
                }, signal);
                return result;
              })}>Confirm deterministic replay</button>
            <button type="button" disabled={busy} onClick={() => setReplayOpen(false)}>Cancel replay</button>
          </section>}
          <label>Canonical log frame filter<select value={selectedFrame} onChange={(event) => {
            const frame = event.target.value; if (frame) selectFrame(frame); else setSelectedFrame("");
          }}><option value="">All frames</option>
            {execution?.frames.map((frame) => <option key={frame.id} value={frameSelection(frame.id).filterId}>{frame.label}</option>)}
            {selectedFrame && !execution?.frames.some((frame) => frameSelection(frame.id).filterId === selectedFrame) &&
              <option value={selectedFrame}>{selectedFrame}</option>}
          </select></label>
          {entries && <SemanticEventLog entries={entries} selectedFrame={selectedFrame} onSelectFrame={selectFrame} onInspect={setInspected} />}
          {data.episodes && <SemanticEpisodes episodes={data.episodes} onSelectFrame={selectFrame} onInspect={setInspected} />}
        </details>

        <details open><summary>Abductive event explanations · hypotheses{data.abductions && ` · ${data.abductions.length} saved snapshots`}</summary>
          <p>Grounded backward inference uses accepted, causally available rules to explain observed effects.
            Missing antecedents and exception absence remain assumptions. Rankings are search preferences, not probabilities.
            Saved snapshots retain their original evidence and rule versions; they are not automatically revalidated or promoted.</p>
          {data.abductions?.length === 0 && <p>No abductive explanations saved for this frame. Review the registered event abduction stage to run it explicitly.</p>}
          {data.abductions?.map((entry, index) => {
            const result = record(entry.result, "abduction result");
            return <section key={text(entry.entryUid ?? index)} aria-label="Saved abduction snapshot">
              <p>Search outcome: {text(result.outcome)}</p>
              <SemanticTable label="Grounded non-authoritative explanations" headings={["Observed effect", "Possible causes / assumptions", "Rule / status", "Provenance"]}>
                {records(result.hypotheses, "abductive hypotheses").map(hypothesis => <tr key={text(hypothesis.hypothesis_id)}>
                  <td>{text(record(hypothesis.observed_effect).term)}<small>{text(hypothesis.observed_event_id)}</small></td>
                  <td>{text(hypothesis.causes)}<small>Assumptions: {text(hypothesis.assumptions)}</small></td>
                  <td>{text(record(hypothesis.rule).candidate_id)}<small>{text(hypothesis.status)}</small></td>
                  <td><button type="button" onClick={() => setInspected(hypothesis)}>Inspect explanation and evidence</button></td>
                </tr>)}
              </SemanticTable>
              <button type="button" onClick={() => setInspected(entry)}>Inspect full hypothesis snapshot</button>
            </section>;
          })}
        </details>

        <details><summary>LLM hypotheses · advisory{data.hypotheses && ` · ${data.hypotheses.length} audit records`}</summary>
          {data.hypotheses?.length === 0 && <p>No saved LLM hypothesis records. Deduce events (LLM) requires explicit confirmation.</p>}
          {data.hypotheses && data.hypotheses.length > 0 && <SemanticTable label="LLM hypotheses compared with canonical deductions"
            headings={["Pair / audit record", "Assessment / terms", "Comparison", "Evidence"]}>
            {data.hypotheses.map((hypothesis, index) => {
              const parsed = isRecord(hypothesis.parsed) ? hypothesis.parsed : undefined;
              const events = parsed && Array.isArray(parsed.events) ? parsed.events.filter(isRecord) : [];
              const comparison = compareHypotheses(hypothesis, errors.canonical ? [] : entries ?? []);
              return <tr key={`${text(hypothesis.response_id)}:${index}`}>
                <td>{text(parsed?.pair_id ?? hypothesis.response_id)}<small>{text(hypothesis.operation)}</small></td>
                <td>{text(parsed?.assessment ?? hypothesis.status)}
                  {events.map((event, eventIndex) => <div key={eventIndex}><code>{text(event.canonical_term)}</code><small>{text(event.rationale)}</small></div>)}
                  {hypothesis.errors !== undefined && <div role="alert">{text(hypothesis.errors)}</div>}</td>
                <td>{comparison.label}</td>
                <td><button type="button" onClick={() => setInspected(hypothesis)}>Inspect hypothesis / provenance</button></td>
              </tr>;
            })}
          </SemanticTable>}
        </details>

        <details open><summary>Candidate rules · frame memory{candidates && ` · ${candidates.length}`}</summary>
          <p>Proposal history stays in its generating frame. Evaluation and explicit promotion use the selected current frame and server evidence gates;
            approved references go to this recording's level STM, never automatically to LTM.</p>
          {data.ruleContext && <div className="semantic-events-toolbar">
            <label>Current rule frame<select aria-label="Current rule frame" value={data.ruleContext.frameId}
              onChange={event => { setRuleFrameId(event.target.value); setProposalFrameId(""); }}>
              {data.ruleContext.frames.map(frame => <option key={frame.frameId} value={frame.frameId}>{frame.frameId} · level {frame.levelId ?? "unavailable"}</option>)}
            </select></label>
            <label>Proposal frame<select aria-label="Proposal frame" value={data.ruleContext.proposalFrameId}
              onChange={event => setProposalFrameId(event.target.value)}>
              {data.ruleContext.frames.filter(frame => frame.frameOrder <= (data.ruleContext?.frames.find(item => item.frameId === data.ruleContext?.frameId)?.frameOrder ?? -1))
                .map(frame => <option key={frame.frameId} value={frame.frameId}>{frame.frameId}</option>)}
            </select></label>
          </div>}
          {candidates?.length === 0 && <p>The selected frame contains no rule proposals.</p>}
          {candidates && candidates.length > 0 && <SemanticTable label="Persisted candidate rules" headings={["Candidate / kind", "Scope / version", "Lifecycle", "Support / contradictions", "Action"]}>
            {candidates.map((item) => <tr key={text(item.candidate_id)} aria-selected={item.candidate_id === selectedCandidate}>
              <td><code>{text(item.candidate_id)}</code><small>{text(item.kind)}</small></td>
              <td>{text(item.scope)}<small>{text(item.version)}</small></td><td>{text(item.status)}</td>
              <td>{latestEvaluation(item) ? text(latestEvaluation(item)?.metrics) : "Not evaluated"}</td>
              <td><button type="button" onClick={() => { setSelectedCandidate(text(item.candidate_id)); setEvaluation(null); }}>Select rule</button></td>
            </tr>)}</SemanticTable>}
          {candidate && <SemanticCandidateDetail key={`${text(candidate.candidate_id)}:${text(candidate.status)}:${text(candidate.history)}`}
            candidate={candidate} busy={busy || Boolean(errors.candidates)} onInspect={setInspected}
            onAction={(action, item, review) => {
              if (action === "evaluate") setEvaluation(item);
              else void postCandidate(action, item, { workspaceId, ...(action === "reject" ? review : {}) });
            }} />}
          {evaluation && <SemanticCandidateEvaluation key={text(evaluation.candidate_id)} candidate={evaluation}
            workspaceId={workspaceId} sequenceId={sequenceId} frameId={data.ruleContext?.frameId || ""}
            proposalFrameId={data.ruleContext?.proposalFrameId || ""} busy={busy} onCancel={() => setEvaluation(null)}
            onCreateDeployment={(body) => void postCandidate("deployment", evaluation, body)}
            onEvaluate={(body) => void postCandidate("evaluate", evaluation, body)} />}
        </details>

        <details><summary>Temporal / object / grouping results &amp; saved sources</summary>
          <p>Inspect real correspondence measurements, attached/co-moving object evidence, grouping learning, exact prompts,
            raw responses and result JSON/Prolog. Source viewing never executes generated code.</p>
          {execution?.outputs.length === 0 && <p>No saved semantic stage results.</p>}
          {execution && execution.outputs.length > 0 && <SemanticTable label="Saved stage results" headings={["Frame", "Stage", "Result", "Inspect"]}>
            {execution.outputs.map((output, index) => {
              const result = semanticOutputDetail(output);
              return <tr key={text(output.path ?? index)}>
                <td><SemanticFrames frames={strings([output.frameId])} onSelectFrame={selectFrame} /></td>
                <td>{text(output.composite ?? output.stage)}</td>
                <td><strong>{result.status}</strong>{result.details.map((detail) =>
                  <div key={detail.kind} role={detail.kind === "error" ? "alert" : detail.kind === "summary" ? "region" : undefined}
                    className={detail.kind === "summary" ? "semantic-output-summary" : undefined}
                    tabIndex={detail.kind === "summary" ? 0 : undefined}
                    aria-label={detail.kind === "summary" ? `${text(output.frameId)} stage summary` : undefined}>
                    {detail.label}: {detail.value}
                  </div>)}</td>
                <td><button type="button" onClick={() => setInspected(output)}>Inspect result</button></td>
              </tr>;
            })}</SemanticTable>}
          {execution && sources.size === 0 && <p>No saved source artifacts.</p>}
          <div className="semantic-events-toolbar semantic-events-sources">{[...sources.values()].map((artifact) =>
            <button type="button" key={artifact.path} title={artifact.path} onClick={() => setSourcePath(artifact.path)}>{artifact.label}</button>)}</div>
        </details>
        {inspected && <section aria-label="Selected semantic record"><div className="semantic-events-toolbar"><h3>Saved record</h3>
          <button type="button" onClick={() => setInspected(null)}>Close record</button></div>
          <SemanticJson value={inspected} label="Saved semantic record and provenance" /></section>}
        {source && <SemanticArtifact key={`${workspaceId}:${sequenceId}:${source.path}`} workspaceId={workspaceId}
          path={source.path} url={source.url} onClose={() => setSourcePath("")} />}
      </>}
    </div>
  </details>;
}
