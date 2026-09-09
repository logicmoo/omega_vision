import { useState } from "react";
import { SemanticJson } from "./SemanticEventsViews";
import { groupingDeploymentRequest, groupingDeploymentSource, text, type SemanticRecord } from "./SemanticEventsModel";

export function SemanticCandidateEvaluation({
  candidate, workspaceId, sequenceId, busy, onEvaluate, onCreateDeployment, onCancel,
}: {
  candidate: SemanticRecord; workspaceId: string; sequenceId: string; busy: boolean;
  onEvaluate: (body: SemanticRecord) => void; onCancel: () => void;
  onCreateDeployment?: (body: SemanticRecord) => void;
}) {
  const [evaluationSequence, setEvaluationSequence] = useState(sequenceId);
  const [trainingSequence, setTrainingSequence] = useState(groupingDeploymentSource(candidate) || sequenceId);
  const [trainingFrame, setTrainingFrame] = useState("");
  const [partition, setPartition] = useState("held_out");
  const [frameUid, setFrameUid] = useState("");
  const [groupUid, setGroupUid] = useState("");
  const [anchorUid, setAnchorUid] = useState("");
  const [expected, setExpected] = useState("unknown");
  const [reviewer, setReviewer] = useState("");
  const [reason, setReason] = useState("");
  const grouping = candidate.kind === "grouping";
  const body: SemanticRecord = grouping ? {
    workspaceId, trainingSequenceId: trainingSequence, sequenceId: evaluationSequence, partition,
    ...(trainingFrame.trim() ? { trainingFrameId: trainingFrame.trim() } : {}),
    labels: [{ frameUid, groupUid, anchorUid, expectedTemplateMatch: expected === "unknown" ? null : expected === "match", reviewer, reason }],
  } : { workspaceId, sequences: [{ sequenceId: evaluationSequence, partition }] };
  const blocked = !evaluationSequence.trim() || (grouping && (
    !trainingSequence.trim() || !frameUid.trim() || !groupUid.trim() || !anchorUid.trim() || !reviewer.trim() || !reason.trim()
  ));
  return <section className="semantic-events-confirm" aria-label="Evaluate candidate against saved sequence">
    <h4>Evaluate {text(candidate.kind)} evidence</h4>
    <p>Replay real saved evidence. Held-out sequences must be independent of training sources and pixels;
      the server rejects overlap. No supplied evidence count or score can override the gates.</p>
    <div className="semantic-events-toolbar">
      <label>Evaluation sequence ID<input value={evaluationSequence} onChange={(event) => setEvaluationSequence(event.target.value)} /></label>
      <label>Partition<select value={partition} onChange={(event) => setPartition(event.target.value)}>
        <option value="held_out">Held out · independent validation</option>
        <option value="train">Training · does not count as held out</option>
      </select></label>
    </div>
    {grouping && <>
      <p>Grouping requires an attributed independent human label. Copy actual frame, final-group and anchor IDs
        from the saved grouping evidence; unknown never counts as positive support.</p>
      <div className="semantic-events-toolbar">
        <label>Training sequence ID<input value={trainingSequence} onChange={(event) => setTrainingSequence(event.target.value)} /></label>
        <label>Training checkpoint frame ID (optional)<input value={trainingFrame} onChange={(event) => setTrainingFrame(event.target.value)}
          placeholder="e.g. frame_000001" /></label>
        <label>Evaluation frame UID<input value={frameUid} onChange={(event) => setFrameUid(event.target.value)} /></label>
        <label>Final group UID<input value={groupUid} onChange={(event) => setGroupUid(event.target.value)} /></label>
        <label>Anchor UID<input value={anchorUid} onChange={(event) => setAnchorUid(event.target.value)} /></label>
        <label>Template match<select value={expected} onChange={(event) => setExpected(event.target.value)}>
          <option value="unknown">Unknown</option><option value="match">Match</option><option value="mismatch">Does not match</option>
        </select></label>
        <label>Reviewer<input value={reviewer} onChange={(event) => setReviewer(event.target.value)} /></label>
        <label>Review rationale<input value={reason} onChange={(event) => setReason(event.target.value)} /></label>
      </div>
      <p>For a partial First N run, specify its completed grouping checkpoint frame ID, not an observation UID.
        Leaving this blank selects the final frame of the entire training sequence.</p>
    </>}
    {onCreateDeployment && groupingDeploymentSource(candidate) && <section aria-label="Create distinct deployment candidate">
      <p>The original guarded proposal stays unchanged. Create a separate, unpromoted deployment AST
        from its recorded training checkpoint, then evaluate that new candidate on independent evidence
        and explicitly promote it. No support or promotion is inherited.</p>
      <button type="button" disabled={busy || !trainingSequence.trim() || !reviewer.trim() || !reason.trim()}
        onClick={() => onCreateDeployment(groupingDeploymentRequest(candidate, workspaceId, trainingSequence, reviewer, reason, trainingFrame))}>
        Create distinct deployment candidate
      </button>
    </section>}
    <details><summary>Exact evaluation request</summary><SemanticJson value={body} label="Evaluation request" /></details>
    <button type="button" disabled={busy || blocked} onClick={() => onEvaluate(body)}>Run validated evaluation</button>
    <button type="button" disabled={busy} onClick={onCancel}>Cancel evaluation</button>
  </section>;
}
