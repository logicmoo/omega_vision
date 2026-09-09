import assert from "node:assert/strict";
import test from "node:test";
import { readFileSync } from "node:fs";
import {
  assessmentLabel, compareHypotheses, createRequestScope, entryChannel, entryFrames, groupingDeploymentRequest, groupingDeploymentSource,
  episodeDuration, isUninitializedCanonicalLog, observeSemanticJobs, planConfirmationError, promotionBlocker, records,
  savedSourceReferences, selectionAfterRefresh, SemanticApiError, semanticJson, semanticOutputDetail, semanticUrl,
} from "./SemanticEventsModel.ts";

test("deployment creation uses recorded training provenance without copying rule or promotion", () => {
  const candidate = {
    kind: "grouping", status: "promoted", candidate_id: "guarded",
    rule: { body: [{ predicate: "independent_group_support", args: ["$G"] }] },
    proposals: [{ source: "measured_grouping_induction", provenance: {
      groupingTraining: { sequenceId: "data/training-original" },
    } }],
  };
  const original = structuredClone(candidate);
  assert.equal(groupingDeploymentSource(candidate), "data/training-original");
  const body = groupingDeploymentRequest(candidate, "workspace", "data/training-original", " reviewer ", " explicit new deployment ");
  assert.deepEqual(body, {
    workspaceId: "workspace", trainingSequenceId: "data/training-original",
    reviewer: "reviewer", reason: "explicit new deployment",
  });
  assert.deepEqual(candidate, original);
  assert.equal(groupingDeploymentRequest(candidate, "workspace", "training", "reviewer", "reason", " frame_000001 ").trainingFrameId, "frame_000001");
  assert.throws(() => groupingDeploymentRequest(candidate, "workspace", "training", "", "reason"), /reviewer/);
  assert.equal(groupingDeploymentSource({ ...candidate, status: "rejected" }), undefined);
  assert.equal(groupingDeploymentSource({ ...candidate, proposals: [{ provenance: { groupingDeployment: {} } }] }), undefined);
  assert.equal(groupingDeploymentSource({ ...candidate, kind: "event_detector" }), undefined);
});

test("active candidate review exposes distinct creation and shows Nowhere bounds before calls", () => {
  const read = (path) => readFileSync(new URL(path, import.meta.url), "utf8");
  const panel = read("./SemanticEventsPanel.tsx");
  const evaluation = read("./SemanticCandidateEvaluation.tsx");
  assert.match(panel, /onCreateDeployment=.*postCandidate\("deployment"/);
  assert.match(panel, /result\.requiresIndependentEvaluation === true/);
  assert.match(evaluation, /Create distinct deployment candidate/);
  assert.match(evaluation, /Training checkpoint frame ID/);
  assert.match(evaluation, /trainingFrameId: trainingFrame\.trim\(\)/);
  assert.match(evaluation, /No support or promotion is inherited/);
  assert.match(evaluation, /groupingDeploymentSource\(candidate\) \|\| sequenceId/);
  for (const path of ["./SemanticEventsConfirmation.tsx", "./VideoImportPage.tsx", "../../../../apps/workbench/src/components/MemorySetupHost.tsx"]) {
    assert.match(read(path), /NOWHERE_LIMITS_NOTICE/);
  }
  const memory = read("../../../../apps/workbench/src/components/MemorySession.ts");
  for (const bound of ["128 frames", "16 MiB", "1,024 retained outputs", "fail explicitly"]) assert.ok(memory.includes(bound));
});

test("boundary, unknown and adequate unchanged assessments remain distinct non-events", () => {
  assert.match(assessmentLabel("initial_observation"), /no predecessor/);
  assert.match(assessmentLabel("unknown"), /insufficient evidence/);
  assert.match(assessmentLabel("no_material_change"), /Adequately compared/);
  assert.equal(entryChannel({ kind: "frame_assessment" }), "Boundary assessment");
  assert.equal(entryChannel({ kind: "user_action" }), "Authoritative action");
  assert.equal(entryChannel({ kind: "frame_event" }), "Prolog deduction");
});

test("open and baseline episodes expose lower-bound duration, never a fabricated end", () => {
  assert.equal(episodeDuration({ duration_frames: 3, currently_open: true, duration_is_lower_bound: true }), "At least 3 frame intervals");
  assert.equal(episodeDuration({ duration_frames: 0, duration_is_lower_bound: false }), "0 frame intervals");
  assert.equal(episodeDuration({ currently_open: true }), "Duration not recorded");
  assert.deepEqual(entryFrames({ source_pair: { from_frame: "first", to_frame: "last" } }), ["first", "last"]);
});

test("saved output summaries never obscure status, errors or stale reasons", () => {
  const detail = semanticOutputDetail({
    status: "stale", staleReason: "upstream pixels changed", error: "latest replay failed",
    summary: { matchCount: 4 },
  });
  assert.equal(detail.status, "stale");
  assert.deepEqual(detail.details, [
    { kind: "staleReason", label: "Stale reason", value: "upstream pixels changed" },
    { kind: "error", label: "Error", value: "latest replay failed" },
    { kind: "summary", label: "Summary", value: '{"matchCount":4}' },
  ]);
  assert.equal(semanticOutputDetail({ status: "error", summary: "older successful summary" }).status, "error");
  assert.deepEqual(semanticOutputDetail({ status: "done", error: {}, staleReason: "current", summary: { eventCount: 2 } }), {
    status: "done", details: [{ kind: "summary", label: "Summary", value: '{"eventCount":2}' }],
  });
  assert.equal(semanticOutputDetail({ status: "done", summary: { eventCount: 0 } }).status, "done");
  assert.deepEqual(semanticOutputDetail({}), { status: "Not recorded", details: [] });
});

test("known asynchronous jobs notify once on completion, failure, cancellation or interruption", () => {
  const prior = new Map([["a", "running"], ["b", "starting"], ["c", "queued"], ["d", "running"]]);
  const jobs = [
    { id: "a", state: "done" }, { id: "b", state: "error" },
    { id: "c", state: "cancelled" }, { id: "d", state: "interrupted" },
  ];
  const observed = observeSemanticJobs(prior, jobs);
  assert.deepEqual(observed.completedJobIds, ["a", "b", "c", "d"]);
  assert.equal(prior.get("a"), "running");
  assert.deepEqual(observeSemanticJobs(observed.states, jobs).completedJobIds, []);
  assert.deepEqual(observeSemanticJobs(new Map(), jobs).completedJobIds, []);
});

test("job observation ignores nonterminal/invalid records and remembers returned direct jobs", () => {
  const started = observeSemanticJobs(new Map(), [{ id: "direct", state: "running" }]);
  assert.deepEqual(started.completedJobIds, []);
  const intermediate = observeSemanticJobs(started.states, [
    { id: "direct" }, { jobId: "direct", cancelling: true }, { id: "other", state: "unknown" },
  ]);
  assert.equal(intermediate.states.get("direct"), "running");
  assert.deepEqual(intermediate.completedJobIds, []);
  const finished = observeSemanticJobs(intermediate.states, [
    { id: "direct", state: "done" }, { id: "direct", state: "done" },
  ]);
  assert.deepEqual(finished.completedJobIds, ["direct"]);
});

test("only a current eligible server evaluation permits promotion; raw proposals never bypass gates", () => {
  assert.match(promotionBlocker({ status: "proposed", proposals: [{ source: "llm_proposal" }] }), /Evaluate/);
  assert.match(promotionBlocker({ status: "proposed", evaluations: [{ eligible: false, reasons: ["insufficient_independent_positive_pairs"] }] }), /insufficient_independent/);
  assert.match(promotionBlocker({ status: "demoted", evaluations: [{ eligible: true }] }), /Evaluate again/);
  assert.match(promotionBlocker({ status: "rejected", evaluations: [{ eligible: true }] }), /Rejected/);
  assert.equal(promotionBlocker({ status: "eligible", evaluations: [{ eligible: true }] }), undefined);
});

test("hypotheses never imply authoritative coverage or material change", () => {
  const hypothesis = { status: "valid", parsed: { pair_id: "pair", assessment: "no_material_change", events: [] } };
  assert.equal(compareHypotheses(hypothesis, []).status, "not_deduced");
  assert.equal(compareHypotheses(hypothesis, [{ kind: "transition_assessment", pair_id: "pair", assessment: "unknown" }]).status, "not_assessed");
  assert.equal(compareHypotheses(hypothesis, [{ kind: "transition_assessment", pair_id: "pair", assessment: "no_material_change" }]).status, "agreement");
  assert.match(compareHypotheses(hypothesis, [{ kind: "transition_assessment", pair_id: "pair", assessment: "no_material_change" }]).label, /remains advisory/);
  assert.equal(compareHypotheses({ status: "invalid" }, []).status, "invalid");
  assert.equal(compareHypotheses({ status: "valid", parsed: { pair_id: "pair" } }, []).status, "invalid");
  const changed = { ...hypothesis, parsed: { ...hypothesis.parsed, assessment: "changed", events: [{ canonical_term: "turned(g1)" }] } };
  assert.equal(compareHypotheses(changed, [{ kind: "transition_assessment", pair_id: "pair", assessment: "no_material_change" }]).status, "disagreement");
});

test("malformed lists throw rather than masquerade as genuine empty data", () => {
  assert.deepEqual(records([]), []);
  for (const value of [null, undefined, {}, [null], ["event"]]) assert.throws(() => records(value), /Invalid semantic API response/);
});

test("selection survives harmless refresh, but never leaks to a missing record", () => {
  assert.equal(selectionAfterRefresh("chosen", [{ id: "chosen" }], "id"), "chosen");
  assert.equal(selectionAfterRefresh("chosen", [{ id: "other" }], "id"), "");
});

test("source links use only actual saved provenance fields, not guessed relative outputs", () => {
  assert.deepEqual(savedSourceReferences({
    proposals: [{ provenance: { prompt_ref: "runtime/a/prompt.txt", raw_output_ref: "runtime/a/raw.txt" } }],
    resultArtifact: "result.json",
    unrelated: "invented.pl",
    promoted_rule_ref: "design/event-rules/accepted.json",
  }), ["runtime/a/prompt.txt", "runtime/a/raw.txt", "design/event-rules/accepted.json"]);
  assert.deepEqual(savedSourceReferences({ prompt_ref: "not-a-file-reference" }), []);
});

test("context changes abort old reads and reject stale success, errors and finally callbacks", () => {
  const scope = createRequestScope();
  const old = scope.capture();
  assert.equal(old.current(), true);
  scope.invalidate();
  assert.equal(old.signal.aborted, true);
  assert.equal(old.current(), false);
  assert.equal(scope.capture().current(), true);
});

test("semantic URL encodes context without conflating sequence and workspace", () => {
  const url = new URL(semanticUrl("/snapshot", "shared space", "arc/a&b", 5), "http://localhost");
  assert.equal(url.searchParams.get("workspaceId"), "shared space");
  assert.equal(url.searchParams.get("sequenceId"), "arc/a&b");
  assert.equal(url.searchParams.get("firstN"), "5");
});

test("paid plans require provider disclosure and exact count; large batches get a second gate", () => {
  const plan = { frameCount: 9, pairCount: 8, llmCallCount: 8, modelId: "configured", backendId: "resolved", blockedReasons: [] };
  assert.match(planConfirmationError(plan, false, "8", ""), /images and context/);
  assert.match(planConfirmationError(plan, true, "7", ""), /exact planned/);
  assert.equal(planConfirmationError(plan, true, "8", ""), undefined);
  assert.match(planConfirmationError({ ...plan, backendId: "" }, true, "8", ""), /resolved/);
  assert.match(planConfirmationError({ ...plan, frameCount: 801 }, true, "8", ""), /large sequence/);
  assert.equal(planConfirmationError({ ...plan, frameCount: 801 }, true, "8", "801"), undefined);
  assert.match(planConfirmationError({ ...plan, blockedReasons: ["missing Turtle"] }, true, "8", ""), /missing Turtle/);
  assert.match(planConfirmationError({ ...plan, pairCount: NaN }, true, "8", ""), /valid frame/);
});

test("transport preserves server validation failures and does not silently accept non-JSON", async (t) => {
  t.mock.method(globalThis, "fetch", async () => new Response(JSON.stringify({ detail: ["held-out replay required"] }), { status: 409 }));
  await assert.rejects(semanticJson("/test"), /409.*held-out replay required/);
  globalThis.fetch = async () => new Response("<html>Proxy failed</html>", { status: 502 });
  await assert.rejects(semanticJson("/test"), /502.*Proxy failed/);
});

test("only the explicit canonical not-initialized 404 gets the honest unsaved state", async (t) => {
  const detail = "'sequence log has not been initialized: arc/sequence'";
  t.mock.method(globalThis, "fetch", async () => new Response(JSON.stringify({ detail }), { status: 404 }));
  await assert.rejects(semanticJson("/test"), (reason) => isUninitializedCanonicalLog(reason));
  assert.equal(isUninitializedCanonicalLog(new SemanticApiError(404, "sequence log has not been initialized: sequence")), true);
  for (const reason of [
    new SemanticApiError(403, detail),
    new SemanticApiError(409, detail),
    new SemanticApiError(503, detail),
    new SemanticApiError(404, "Required semantic input is missing: result.json"),
    new SemanticApiError(404, "unknown event-log generation: 2"),
    new SemanticApiError(404, { message: detail }),
    new Error(`Semantic API HTTP 404: ${detail}`),
  ]) assert.equal(isUninitializedCanonicalLog(reason), false);
});

test("panel is additive, uses real semantic read routes and never invents a provider setup", () => {
  const panel = readFileSync(new URL("./SemanticEventsPanel.tsx", import.meta.url), "utf8");
  const views = readFileSync(new URL("./SemanticEventsViews.tsx", import.meta.url), "utf8");
  const confirmation = readFileSync(new URL("./SemanticEventsConfirmation.tsx", import.meta.url), "utf8");
  assert.match(panel, /<details className="semantic-events-panel"/);
  assert.match(panel, /\/events\/hypotheses/);
  assert.match(panel, /\/events\/episodes/);
  assert.match(panel, /generation=\$\{value.generation\}/);
  assert.match(panel, /\/candidates/);
  assert.match(views, /ResourceSourceEditor/);
  assert.match(views, /PrologDataInspector/);
  assert.doesNotMatch(panel + views, /<textarea|localStorage\.setItem|allowLlmPromotion|manual_approval_by/);
  assert.match(confirmation, /Create \/ merge TODOs/);
  assert.match(confirmation, /Run directly · no TODO changes/);
  assert.match(confirmation, /charges may apply/);
  assert.match(panel, /executionApi\.plan/);
  assert.match(panel, /readScope\.current\.invalidate/);
  assert.match(panel, /key === "canonical" && isUninitializedCanonicalLog\(reason\)/);
  assert.match(panel, /No canonical log saved yet/);
  assert.match(panel, /delete next\.canonical; delete next\.episodes/);
  assert.match(panel, /semanticOutputDetail\(output\)/);
  assert.match(panel, /<strong>\{result\.status\}<\/strong>/);
  assert.match(panel, /"semantic-output-summary"/);
  assert.doesNotMatch(panel, /output\.summary \?\? output\.status/);
  assert.match(panel, /observeSemanticJobs\(knownJobs\.current, \(value as SemanticExecutionState\)\.jobs\)/);
  assert.match(panel, /if \(observation\.completedJobIds\.length\)/);
  assert.match(panel, /await callbacks\.current\.onUpdated\?\.\(\)/);
});
