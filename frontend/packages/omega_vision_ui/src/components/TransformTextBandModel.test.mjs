import assert from "node:assert/strict";
import test from "node:test";

import { summarizeTransformCell } from "./TransformTextBandModel.ts";

const done = new Set([
  "parts_extraction_0/python_opencv",
  "parts_grouping_0/group_regions_prolog",
  "turtle_programs/turtle_programs_prolog",
]);

test("completed extraction reports honest counts and inspector access", () => {
  const text = summarizeTransformCell({
    name: "parts_extraction_0",
    doer: "python_opencv",
    status: "done",
    elapsedMs: 1240,
    resultPath: "frame/parts_extraction_0/python_opencv/result.pl",
    summary: { regionCount: 12, componentCount: 5, visualGroupCount: 3, smallFeatureCount: 2 },
  }, done, "python_opencv");

  assert.equal(text.state, "done");
  assert.equal(text.tone, "done");
  assert.equal(text.timing, "1.2s");
  assert.equal(text.clickable, true);
  assert.deepEqual(text.stats, ["12 regions", "5 cv components", "3 v groups", "2 small marks"]);
});

test("grouping cell summarizes groups, part-of and background instead of raw counts", () => {
  const text = summarizeTransformCell({
    name: "parts_grouping_0",
    doer: "group_regions_prolog",
    status: "done",
    resultPath: "frame/parts_grouping_0/group_regions_prolog/result.pl",
    groups: [{ id: "w0", members: ["r1", "r2"] }, { id: "w1", members: ["r3"] }],
    partOf: ["r1", "r2", "r3"],
    background: ["r9"],
    summary: { groupCount: 2 },
  }, done, "python_opencv");

  assert.deepEqual(text.stats, ["2 groups", "3 part-of", "bg r9"]);
});

test("debug cell keeps the compare-with-Turtle note in the text band", () => {
  const text = summarizeTransformCell({
    name: "parts_debug_0",
    doer: "python_pil",
    status: "done",
    debugImage: "frame/parts_debug_0/python_pil/debug.png",
    resultPath: "frame/parts_debug_0/python_pil/result.pl",
    summary: {},
  }, done, "python_opencv");

  assert.equal(text.note, "compare beside Turtle · same source geometry");
  assert.equal(text.clickable, true);
});

test("started, error, missing and waiting states stay honest", () => {
  const started = summarizeTransformCell({
    name: "turtle_programs", doer: "turtle_programs_prolog", status: "started", claimedBy: "worker-2",
  }, done);
  const failed = summarizeTransformCell({
    name: "turtle_programs", doer: "turtle_programs_prolog", status: "error", error: "swipl crashed",
  }, done);
  const missing = summarizeTransformCell({
    name: "group_acceptance_0", doer: "group_acceptance_prolog", status: "missing",
  }, done);
  const waiting = summarizeTransformCell({
    name: "parts_debug_0",
    doer: "python_pil",
    status: "pending",
    dependsOn: ["parts_extraction_0/python_opencv", "turtle_programs/turtle_programs_prolog"],
  }, new Set(["parts_extraction_0/python_opencv"]));

  assert.equal(started.state, "started");
  assert.equal(started.stateText, "started · worker-2");
  assert.equal(failed.state, "error");
  assert.match(failed.stateText, /swipl crashed/);
  assert.equal(missing.state, "missing");
  assert.match(missing.stateText, /not stamped/);
  assert.equal(waiting.state, "waiting");
  assert.equal(waiting.stateText, "waiting for turtle_programs…");
});

test("stale extractor source is flagged without hiding the completed stats", () => {
  const text = summarizeTransformCell({
    name: "group_acceptance_0",
    doer: "group_acceptance_prolog",
    status: "done",
    resultPath: "frame/group_acceptance_0/group_acceptance_prolog/result.pl",
    summary: { acceptedGroupCount: 4, partsFacts: "parts_extraction_0/python_scikit/result.pl" },
  }, done, "python_opencv");

  assert.equal(text.stale, true);
  assert.equal(text.tone, "stale");
  assert.equal(text.stateText, "stale source");
  assert.deepEqual(text.stats, ["4 g final"]);
});

test("non-clickable transforms without a written source are not inspector links", () => {
  const text = summarizeTransformCell({
    name: "observation_identity_0",
    doer: "content_hash",
    status: "done",
    summary: { observationCount: 7 },
  }, done, "python_opencv");

  assert.equal(text.clickable, false);
  assert.deepEqual(text.stats, ["7 stable observations"]);
});
