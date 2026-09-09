import { useEffect, useState, type ReactNode } from "react";
import { ResourceSourceEditor, textLanguageForFilename } from "@app/components/ResourceSourceEditor";
import { PrologDataInspector } from "./PrologDataInspector";
import {
  assessmentLabel, entryChannel, entryFrames, episodeDuration, errorMessage,
  isRecord, latestEvaluation, promotionBlocker, strings, text, type SemanticRecord,
} from "./SemanticEventsModel";

const readOnly = () => undefined;

export function SemanticJson({ value, label }: { value: unknown; label: string }) {
  return <div className="semantic-events-source">
    <ResourceSourceEditor value={JSON.stringify(value, null, 2)} onChange={readOnly}
      contentReadOnly defaultFormat="json" label={label} />
  </div>;
}

export function SemanticArtifact({
  workspaceId, path, url, onClose,
}: { workspaceId: string; path: string; url: string; onClose: () => void }) {
  const [content, setContent] = useState<string | null>(null);
  const [error, setError] = useState("");
  const [revision, setRevision] = useState(0);
  const isProlog = /\.(pl|prolog)$/i.test(path);
  useEffect(() => {
    if (isProlog) return;
    const controller = new AbortController();
    setContent(null);
    setError("");
    void (async () => {
      try {
        const response = await fetch(url, { signal: controller.signal, cache: "no-store" });
        if (!response.ok) throw new Error(`Source HTTP ${response.status}: ${(await response.text()).slice(0, 500)}`);
        const body = await response.text();
        if (!controller.signal.aborted) setContent(body);
      } catch (reason) {
        if (!controller.signal.aborted) setError(errorMessage(reason));
      }
    })();
    return () => controller.abort();
  }, [url, isProlog, revision]);
  if (isProlog) return <PrologDataInspector workspaceId={workspaceId}
    sourcePath={path} sourceUrl={url} title="Saved semantic Prolog" onClose={onClose} />;
  return <section className="semantic-events-source" aria-label="Saved semantic source">
    <div className="semantic-events-toolbar">
      <strong>{path}</strong>
      <a href={url} target="_blank" rel="noreferrer">Open saved file</a>
      <button type="button" onClick={() => setRevision((value) => value + 1)}>Reload source</button>
      <button type="button" onClick={onClose}>Close source</button>
    </div>
    {error ? <div role="alert">{error} <button type="button" onClick={() => setRevision((value) => value + 1)}>Retry source</button></div>
      : content === null ? <p role="status">Loading saved source…</p>
        : <ResourceSourceEditor key={path} value={content} onChange={readOnly}
          contentReadOnly defaultFormat="text" defaultTextLang={textLanguageForFilename(path)}
          sourcePath={path} label={path} />}
  </section>;
}

export function SemanticFrames({
  frames, onSelectFrame,
}: { frames: string[]; onSelectFrame?: (frameId: string) => void }) {
  return <span className="semantic-events-frame-links">{frames.map((frameId) =>
    onSelectFrame ? <button type="button" key={frameId} onClick={() => onSelectFrame(frameId)} title={`Select ${frameId}`}>
      {frameId}
    </button> : <code key={frameId}>{frameId}</code>,
  )}</span>;
}

export function SemanticTable({
  label, headings, children,
}: { label: string; headings: string[]; children: ReactNode }) {
  return <div className="semantic-events-table-scroll" role="region" aria-label={label} tabIndex={0}>
    <table><caption>{label}</caption><thead><tr>{headings.map((heading) =>
      <th key={heading} scope="col">{heading}</th>)}</tr></thead><tbody>{children}</tbody></table>
  </div>;
}

export function SemanticEventLog({
  entries, selectedFrame, onSelectFrame, onInspect,
}: { entries: SemanticRecord[]; selectedFrame: string; onSelectFrame?: (id: string) => void; onInspect: (entry: SemanticRecord) => void }) {
  const visible = selectedFrame ? entries.filter((entry) => entryFrames(entry).includes(selectedFrame)) : entries;
  if (!visible.length) return <p>No canonical records{selectedFrame ? " for this frame" : ""} in the saved log.</p>;
  return <SemanticTable label="Canonical event log · authoritative actions and Prolog deductions"
    headings={["Order", "Channel", "Frame / pair", "Assessment or event", "Evidence"]}>
    {visible.map((entry) => <tr key={text(entry.id)}>
      <td>{text(entry.order)}</td>
      <td>{entryChannel(entry)}</td>
      <td><SemanticFrames frames={entryFrames(entry)} onSelectFrame={onSelectFrame} /></td>
      <td><code>{typeof entry.canonical_term === "string" ? entry.canonical_term
        : entry.assessment ? assessmentLabel(entry.assessment)
          : Array.isArray(entry.canonical_terms) ? strings(entry.canonical_terms).join("; ") : text(entry.action_type)}</code>
        {entry.kind === "user_action" && <small>{text(entry.direction)}{entry.boundary === true && " · unpaired boundary action"}</small>}
        {entry.kind === "transition_assessment" && <small>{text(entry.event_count)} events · confidence {text(entry.confidence)}</small>}
        {typeof entry.episode_id === "string" && <small>Episode {entry.episode_id}</small>}
      </td>
      <td><button type="button" onClick={() => onInspect(entry)}>Inspect record</button></td>
    </tr>)}
  </SemanticTable>;
}

export function SemanticEpisodes({
  episodes, onSelectFrame, onInspect,
}: { episodes: SemanticRecord[]; onSelectFrame?: (id: string) => void; onInspect: (entry: SemanticRecord) => void }) {
  if (!episodes.length) return <p>No saved episodes. Initial relations are baseline observations, not fabricated starts.</p>;
  return <SemanticTable label="Episodes · start, continue and end" headings={["Relation", "Status / duration", "Start or baseline", "Continuations", "End", "Evidence"]}>
    {episodes.map((episode) => <tr key={text(episode.episode_id)}>
      <td><code>{text(episode.relation)}</code></td>
      <td>{episode.currently_open === true ? "Open at sequence end" : episode.currently_open === false ? "Closed" : "State not recorded"}
        <small>{episodeDuration(episode)}</small></td>
      <td>{episode.baseline_at_sequence_start === true && <small>Baseline; start not observed</small>}
        <SemanticFrames frames={strings([episode.start_frame])} onSelectFrame={onSelectFrame} /></td>
      <td><SemanticFrames frames={Array.isArray(episode.continuations) ? episode.continuations.filter(isRecord)
        .flatMap((entry) => strings([entry.frame_id])) : []} onSelectFrame={onSelectFrame} /></td>
      <td>{typeof episode.end_frame === "string" ? <SemanticFrames frames={[episode.end_frame]} onSelectFrame={onSelectFrame} />
        : "No closing event"}</td>
      <td><button type="button" onClick={() => onInspect(episode)}>Inspect episode</button></td>
    </tr>)}
  </SemanticTable>;
}

export function SemanticCandidateDetail({
  candidate, busy, onAction, onInspect,
}: {
  candidate: SemanticRecord; busy: boolean;
  onAction: (action: "evaluate" | "promote" | "reject", candidate: SemanticRecord, review?: { reason: string; reviewer: string }) => void;
  onInspect: (entry: SemanticRecord) => void;
}) {
  const [reason, setReason] = useState("");
  const [reviewer, setReviewer] = useState("");
  const [confirm, setConfirm] = useState<"promote" | "reject" | null>(null);
  const evaluation = latestEvaluation(candidate);
  const blocked = promotionBlocker(candidate);
  return <section className="semantic-events-candidate" aria-label="Candidate rule detail">
    <h4>{text(candidate.kind)} · {text(candidate.status)}</h4>
    <dl className="semantic-events-facts">
      <dt>ID / version</dt><dd><code>{text(candidate.candidate_id)}</code><br />{text(candidate.version)}</dd>
      <dt>Scope</dt><dd>{text(candidate.scope)}</dd>
      <dt>Clause</dt><dd><code>{text(candidate.clause ?? candidate.rule)}</code></dd>
      <dt>Gate</dt><dd>{blocked || "Latest server evaluation is eligible; promotion will revalidate."}</dd>
      <dt>Support and contradictions</dt><dd>{evaluation ? text(evaluation.metrics) : "Not evaluated"}</dd>
      <dt>Provenance</dt><dd>{Array.isArray(candidate.proposals) ? candidate.proposals.filter(isRecord).map((proposal, index) =>
        <div key={index}>{text(proposal.source)}{proposal.source === "llm_proposal" && " · advisory, never executable as raw code"}
          <small>{text(proposal.provenance)}</small></div>) : "Not recorded"}</dd>
      <dt>Promoted resource</dt><dd>{text(candidate.promoted_rule_ref)}</dd>
    </dl>
    <div className="semantic-events-toolbar">
      <button type="button" disabled={busy} onClick={() => onAction("evaluate", candidate)}>Evaluate evidence gates</button>
      <button type="button" disabled={busy || Boolean(blocked)} title={blocked} onClick={() => setConfirm("promote")}>Promote…</button>
      <button type="button" disabled={busy || candidate.status === "rejected"} onClick={() => setConfirm("reject")}>Reject…</button>
      <button type="button" onClick={() => onInspect(candidate)}>Inspect full history / evidence</button>
    </div>
    {confirm && <div className="semantic-events-confirm" role="group" aria-label={`Confirm ${confirm}`}>
      {confirm === "promote" ? <p>Promote this saved candidate? The server must revalidate its current evidence gates.
        LLM text is never installed or executed directly.</p> : <>
        <label>Rejection reason<input value={reason} onChange={(event) => setReason(event.target.value)} required /></label>
        <label>Reviewer<input value={reviewer} onChange={(event) => setReviewer(event.target.value)} required /></label>
      </>}
      <button type="button" disabled={busy || (confirm === "reject" && (!reason.trim() || !reviewer.trim()))}
        onClick={() => { onAction(confirm, candidate, { reason: reason.trim(), reviewer: reviewer.trim() }); setConfirm(null); }}>
        {confirm === "promote" ? "Confirm promotion" : "Confirm rejection"}
      </button>
      <button type="button" disabled={busy} onClick={() => setConfirm(null)}>Keep candidate unchanged</button>
    </div>}
  </section>;
}
