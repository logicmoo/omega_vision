import { useEffect, useId, useLayoutEffect, useState, useSyncExternalStore } from "react";
import {
  createNativeMemoryPublication, publicationContextError, publicationContextKey, publicationRequest,
  type PublicationArea, type PublicationContext, type PublicationKind,
} from "./NativeMemoryPublicationModel";
import "../styles/memory-setup.css";
import "../styles/native-memory-publication.css";

export type NativeMemoryPublicationProps = {
  workspaceId: string; sequenceId?: string; frameId?: string; active: boolean;
};

function AreaIdentity({ area }: { area: PublicationArea }) {
  return <dl className="native-publication__identity">
    <dt>Area ID</dt><dd><code>{area.id}</code></dd>
    <dt>Provider</dt><dd>{area.providerRef}</dd>
    <dt>Registered path</dt><dd><code>{area.registeredPath}</code></dd>
    <dt>Database revision</dt><dd><code>{area.revision ?? "Absent — authorized creation only after confirmation"}</code></dd>
  </dl>;
}

export function NativeMemoryPublication({ workspaceId, sequenceId, frameId, active }: NativeMemoryPublicationProps) {
  const context: PublicationContext | null = sequenceId !== undefined && frameId !== undefined ? { workspaceId, sequenceId, frameId } : null;
  const contextKey = publicationContextKey(context);
  const [publication] = useState(() => createNativeMemoryPublication(context));
  const state = useSyncExternalStore(publication.subscribe, publication.getSnapshot, publication.getSnapshot);
  const contentId = useId();
  useLayoutEffect(() => {
    publication.setContext(context);
    publication.setActive(active);
  }, [publication, contextKey, active]);
  useEffect(() => () => publication.suspend(), [publication]);

  const options = state.options, selection = state.selection;
  const source = options?.sources.find(entry => entry.id === selection.sourceId);
  const destination = options?.destinations.find(entry => entry.id === selection.destinationId);
  const committing = state.phase === "committing", busy = state.phase !== "idle";
  const kinds = [...new Set(options?.sources.map(entry => entry.kind) ?? [])];
  const compatibleSources = options?.sources.filter(entry => entry.kind === selection.kind) ?? [];
  const compatibleDestinations = options?.destinations.filter(entry => entry.kind === selection.kind) ?? [];
  let selectionError = publicationContextError(state.context);
  if (!selectionError) {
    try {
      if (!state.context || !options) throw new Error("Open or refresh native publication options first.");
      publicationRequest(state.context, options, selection);
    } catch (error) { selectionError = error instanceof Error ? error.message : String(error); }
  }
  const plan = state.plan?.response;
  const appendCount = plan?.items.filter(item => item.action === "append").length ?? 0;
  const presentCount = plan?.items.filter(item => item.action === "already_present").length ?? 0;

  return <section className="memory-setup native-publication" hidden={!active} aria-label="Native STM to LTM publication">
    <div className="memory-setup__heading">
      <button type="button" className="memory-setup__disclosure" aria-expanded={state.open} aria-controls={contentId}
        onClick={() => state.open ? publication.close() : void publication.open()}>
        <span aria-hidden="true">{state.open ? "▾" : "▸"}</span>Native STM → LTM publication
      </button>
      <span className="memory-setup__status" role="status">{state.phase === "options" ? "Reading authorized native entries…"
        : state.phase === "planning" ? "Building read-only plan…" : committing ? "Awaiting publication acknowledgment…"
          : state.result ? state.result.status : state.open ? "Explicit plan and confirmation required" : "Closed — no automatic publication"}</span>
    </div>
    {state.notice && <p className="native-publication__notice" role="status">{state.notice}</p>}
    {state.unknownOutcome && <div className="native-publication__error" role="alert">{state.unknownOutcome}
      <button type="button" onClick={() => publication.dismissOutcomeWarning()}>Dismiss outcome warning</button>
    </div>}
    {state.open && <div className="memory-setup__content" id={contentId}>
      <p className="memory-setup__hint">Publication appends typed native copies/references, preserves STM history, adds no confidence or independent evidence,
        accepts no candidate, and starts no inference. It does not change Save To, Look In, or the shared Visual Sequence.</p>
      <p className="native-publication__context">Recording <code>{state.context?.sequenceId ?? "unavailable"}</code> · frame <code>{state.context?.frameId ?? "unavailable"}</code>
        {options && <> · game {options.context.gameId} · level {options.context.levelId} · cutoff order {options.context.frameOrder}</>}
      </p>
      <p className="memory-setup__hint">Changing context clears this panel’s previous plan/result; saved-area inspection remains independent.</p>
      <div className="memory-setup__actions">
        <button type="button" disabled={busy || Boolean(publicationContextError(state.context))} onClick={() => void publication.refresh()}>Refresh publication options</button>
      </div>
      {state.error && <p className="native-publication__error" role="alert">{state.error}</p>}
      {!options && !busy && !state.error && <p role="status">{publicationContextError(state.context) || "Refresh options to inspect persistent native entries."}</p>}
      {options && <>
        <div className="native-publication__selectors">
          <label>Native type<select value={selection.kind} disabled={committing} onChange={event => publication.select({ kind: event.target.value as PublicationKind | "" })}>
            <option value="">Choose native type</option>
            {kinds.map(kind => <option key={kind} value={kind}>{kind === "deduction" ? "Deduction — already accepted references only" : kind}</option>)}
          </select></label>
          <label>Source STM<select value={selection.sourceId} disabled={committing || !selection.kind} onChange={event => publication.select({ sourceId: event.target.value })}>
            <option value="">Choose recording STM</option>
            {compatibleSources.map(area => <option key={area.id} value={area.id}>{area.label} · {area.eligibleCount} eligible{!area.exists ? " · no database" : ""}</option>)}
          </select></label>
          <label>Destination LTM<select value={selection.destinationId} disabled={committing || !selection.kind} onChange={event => publication.select({ destinationId: event.target.value })}>
            <option value="">Choose authorized destination</option>
            {compatibleDestinations.map(area => <option key={area.id} value={area.id}>{area.scopeKind === "game" ? "Game LTM" : "Level LTM"} · {area.label}
              {!area.exists ? " · create on confirmed publication" : ""}{!area.capabilities.write ? " · read-only" : ""}</option>)}
          </select></label>
        </div>
        {!kinds.length && <p role="status">No supported native publication sources are registered for this context.</p>}
        {source && <details className="native-publication__details"><summary>Selected STM identity and revision</summary><AreaIdentity area={source} />
          {!source.capabilities.read || !source.capabilities.write ? <p>Publication unavailable: {source.capabilities.reason || "Provider access does not permit publication."}</p> : null}
        </details>}
        {destination && <details className="native-publication__details"><summary>Selected LTM identity and revision</summary><AreaIdentity area={destination} />
          {!destination.capabilities.read || !destination.capabilities.write ? <p>Publication unavailable: {destination.capabilities.reason || "Provider access does not permit publication."}</p> : null}
        </details>}
        {source && <>
          <div className="memory-setup__actions"><strong>{selection.itemIds.length} / 100 selected native entries</strong>
            <button type="button" disabled={committing || !selection.itemIds.length} onClick={() => publication.select({ itemIds: [] })}>Clear item selection</button>
          </div>
          {!source.items.length ? <p className="memory-setup__empty">No native entries in this recording STM. Nothing is synthesized or converted.</p>
            : <div className="native-publication__scroll" tabIndex={0} aria-label="Native publication entries">
              <table><caption>Only eligible immutable native entry IDs may be selected; original identities remain visible.</caption>
                <thead><tr><th>Select</th><th>Native entry / identity</th><th>Revision / cutoff</th><th>Eligibility</th></tr></thead>
                <tbody>{source.items.map(item => {
                  const checked = selection.itemIds.includes(item.id);
                  return <tr key={item.id}>
                    <td><input type="checkbox" aria-label={`Select native ${item.kind} entry ${item.id}`} checked={checked}
                      disabled={committing || !item.eligible || (!checked && selection.itemIds.length >= 100)}
                      onChange={event => publication.select({ itemIds: event.target.checked
                        ? [...selection.itemIds, item.id] : selection.itemIds.filter(id => id !== item.id) })} /></td>
                    <td><code>{item.id}</code><div>{item.payloadUid ?? item.candidateId ?? "Identity unavailable"}</div>
                      {item.recordUid && <small>Record <code>{item.recordUid}</code></small>}
                      {item.conceptUid && <small>Concept <code>{item.conceptUid}</code></small>}
                      {item.evaluationId && <small>Evaluation <code>{item.evaluationId}</code></small>}</td>
                    <td><code>{item.revision ?? "Unavailable"}</code>{item.causal && <small>Frame {item.causal.frameId} · order {item.causal.frameOrder}</small>}</td>
                    <td>{item.eligible ? "Eligible at this cutoff" : item.reason}</td>
                  </tr>;
                })}</tbody>
              </table>
            </div>}
        </>}
        <fieldset className="native-publication__approval" disabled={committing}>
          <legend>Publication attribution — not rule acceptance</legend>
          <label>Reviewer<input type="text" value={selection.approval.reviewer} maxLength={2000} autoComplete="off"
            onChange={event => publication.select({ approval: { ...selection.approval, reviewer: event.target.value } })} /></label>
          <label>Publication reason<input type="text" value={selection.approval.reason} maxLength={2000} autoComplete="off"
            onChange={event => publication.select({ approval: { ...selection.approval, reason: event.target.value } })} /></label>
        </fieldset>
        <div className="memory-setup__actions">
          <button type="button" disabled={busy || Boolean(selectionError)} onClick={() => void publication.plan()}>Plan publication (read-only)</button>
          {selectionError && <p className="memory-setup__hint">{selectionError}</p>}
        </div>
        <details className="native-publication__details"><summary>Publication limits and unsupported native types</summary>
          <p>No implicit LTM reading is added to the four look-at stages. Cross-recording inference reuse remains unavailable without a registered ordering policy.
            Observations, hypotheses and groups are not converted into Object payloads.</p>
          <dl className="native-publication__identity">{Object.entries(options.unsupportedKinds).map(([kind, reason]) =>
            <div key={kind}><dt>{kind}</dt><dd>{reason}</dd></div>)}</dl>
        </details>
      </>}
      {plan && <section className="native-publication__plan" aria-label="Immutable publication plan">
        <h4>Reviewed native publication plan</h4>
        <p><strong>{appendCount} append · {presentCount} already present</strong> · source preserved · activation none · rule acceptance unchanged · no independent evidence added</p>
        <p>Exact cutoff <code>{plan.cutoff.sequenceId}</code> · frame {plan.cutoff.frameId} · order {plan.cutoff.frameOrder}</p>
        <p>Confirmation key <code>{plan.confirmationKey}</code></p>
        <div className="native-publication__areas"><div><h5>Source snapshot</h5><AreaIdentity area={plan.source} /></div>
          <div><h5>Destination snapshot</h5><AreaIdentity area={plan.destination} /></div></div>
        <p>{plan.identityPolicy}. {plan.reusePolicy}</p>
        <div className="native-publication__scroll" tabIndex={0} aria-label="Planned native identities"><table>
          <caption>Immutable identities and exact append actions; physical destination record addresses may differ.</caption>
          <thead><tr><th>Native entry</th><th>Action</th><th>Preserved identities / provenance</th></tr></thead>
          <tbody>{plan.items.map(item => <tr key={item.sourceEntryUid}>
            <td><code>{item.sourceEntryUid}</code></td><td>{item.action}
              {item.existingEntryUid && <small>Existing entry <code>{item.existingEntryUid}</code></small>}</td>
            <td><dl className="native-publication__identity">
              {(["sourceRecordUid", "destinationRecordUid", "conceptUid", "recordRevision", "candidateId", "candidateVersion", "evaluationId"] as const).map(key =>
                item[key] !== undefined && <div key={key}><dt>{key}</dt><dd><code>{item[key]}</code></dd></div>)}
              <dt>Other concept revisions</dt><dd>{item.existingConceptRevisions.length ? item.existingConceptRevisions.join(", ") : "None"}</dd>
            </dl><details><summary>Bound proof metadata</summary><pre>{JSON.stringify(item.proof, null, 2)}</pre></details></td>
          </tr>)}</tbody>
        </table></div>
        <p>Reviewer <strong>{state.plan?.request.approval.reviewer}</strong> · reason: {state.plan?.request.approval.reason}</p>
        {!state.result && <div className="native-publication__confirmation">
          <label><input type="checkbox" checked={state.confirmed} disabled={busy}
            onChange={event => publication.confirm(event.target.checked)} />I reviewed this exact plan and confirm publication only — no activation, new evidence or candidate acceptance.</label>
          <button type="button" disabled={busy || !state.confirmed} onClick={() => void publication.publish()}>
            {committing ? "Awaiting acknowledgment…" : "Publish confirmed plan"}
          </button>
          {committing && <p role="status">Do not repeat this request. Closing or changing context stops waiting, not an already-sent publication.</p>}
        </div>}
      </section>}
      {state.result && <section className="native-publication__result" role="status">
        <h4>{state.result.status === "published" ? "Publication acknowledged" : state.result.status === "already_published" ? "Previously published — acknowledged" : "Already present — no append required"}</h4>
        <p>Bound confirmation <code>{state.result.confirmationKey}</code>. STM history preserved; no inference activation or evidence added.</p>
        <ul>{state.result.items.map(item => <li key={item.sourceEntryUid}><code>{item.sourceEntryUid}</code> → <code>{item.destinationEntryUid
          ?? plan?.items.find(planned => planned.sourceEntryUid === item.sourceEntryUid)?.existingEntryUid ?? "Unavailable"}</code></li>)}</ul>
      </section>}
    </div>}
  </section>;
}
