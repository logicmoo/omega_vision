import { useState } from "react";
import { NOWHERE_LIMITS_NOTICE } from "@app/components/MemorySession";
import { planConfirmationError, text, type SemanticPlan } from "./SemanticEventsModel";

export function SemanticEventsConfirmation({
  plan, busy, onConfirm, onCancel,
}: { plan: SemanticPlan; busy: boolean; onConfirm: (run: boolean) => void; onCancel: () => void }) {
  const [acknowledged, setAcknowledged] = useState(false);
  const [callCount, setCallCount] = useState("");
  const [largeFrameCount, setLargeFrameCount] = useState("");
  const blocked = planConfirmationError(plan, acknowledged, callCount, largeFrameCount);
  return <section className="semantic-events-confirm" role="group" aria-label={`Confirm ${plan.label}`}>
    <h4>{plan.label} · review exact scope</h4>
    <dl className="semantic-events-facts">
      <dt>Scope</dt><dd>{plan.frameCount} frames · {plan.pairCount} adjacent pairs</dd>
      <dt>LLM calls</dt><dd>{plan.llmCallCount}</dd>
      {plan.llmCallCount > 0 && <>
        <dt>Effective model</dt><dd>{plan.modelId || "Unresolved"} · {plan.backendId || "Unresolved"}</dd>
        <dt>Estimated cost</dt><dd>{plan.cost === null || plan.cost === undefined ? "Unknown — this does not mean free" : text(plan.cost)}</dd>
      </>}
    </dl>
    <p>The first frame has no predecessor. Unordered frames cannot create adjacent-pair work.
      Only this explicit confirmation may create or run work.</p>
    <p className="semantic-events-note" role="note">{NOWHERE_LIMITS_NOTICE}</p>
    {plan.blockedReasons.length > 0 && <div role="alert">Cannot proceed:
      <ul>{plan.blockedReasons.map((reason, index) => <li key={index}>{reason}</li>)}</ul>
    </div>}
    {plan.llmCallCount > 0 && <>
      <label><input type="checkbox" checked={acknowledged} onChange={(event) => setAcknowledged(event.target.checked)} />
        I authorize sending these images and their context to the selected model provider; charges may apply.</label>
      <label>Type the exact LLM call count ({plan.llmCallCount})
        <input inputMode="numeric" value={callCount} onChange={(event) => setCallCount(event.target.value)} autoComplete="off" /></label>
    </>}
    {plan.frameCount > 800 && <label>Large sequence: type the frame count ({plan.frameCount})
      <input inputMode="numeric" value={largeFrameCount} onChange={(event) => setLargeFrameCount(event.target.value)} autoComplete="off" /></label>}
    {blocked && <p className="semantic-events-note">{blocked}</p>}
    <button type="button" disabled={busy || Boolean(blocked)} onClick={() => onConfirm(false)}>Create / merge TODOs</button>
    <button type="button" disabled={busy || Boolean(blocked)} onClick={() => onConfirm(true)}>Run directly · no TODO changes</button>
    <button type="button" disabled={busy} onClick={onCancel}>Cancel</button>
    <p className="semantic-events-note">No automatic paid calls on load, refresh or navigation. LLM deductions and proposals remain advisory.</p>
  </section>;
}
