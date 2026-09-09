import assert from "node:assert/strict";
import test from "node:test";

import { compactTransformStatus } from "./CompactTransformStatusModel.ts";

const done = new Set([
  "parts_extraction_0/python_opencv",
  "parts_grouping_0/group_regions_prolog",
  "group_acceptance_0/group_acceptance_prolog",
]);

test("completed G acceptance shows real mode counts and source access", () => {
  const status = compactTransformStatus("group_acceptance_0", {
    doer: "group_acceptance_prolog",
    status: "done",
    resultPath: "frame/group_acceptance_0/group_acceptance_prolog/result.pl",
    elapsedMs: 542,
    summary: {
      acceptedGroupCount: 10,
      exactConsensusCount: 3,
      symbolicShapeAnalogyCount: 1,
      pixelShapeFallbackCount: 2,
      singletonRemainderCount: 4,
      partsFacts: "parts_extraction_0/python_opencv/result.pl",
    },
  }, "python_opencv", done);

  assert.equal(status.label, "G acceptance: 10 final · 3 exact · 1 shape · 2 pixel · 4 single");
  assert.equal(status.tone, "done");
  assert.equal(status.clickable, true);
  assert.match(status.title, /group_acceptance_prolog/);
  assert.match(status.title, /duration: 542ms/);
});

test("completed observations show the persisted stable count", () => {
  const status = compactTransformStatus("observation_identity_0", {
    doer: "content_hash",
    status: "done",
    resultPath: "frame/observation_identity_0/content_hash/result.pl",
    summary: {
      observationCount: 42,
      partsFacts: "parts_extraction_0/python_opencv/result.pl",
    },
  }, "python_opencv", done);

  assert.equal(status.label, "Observation IDs: 42 stable");
  assert.equal(status.tone, "done");
  assert.equal(status.clickable, true);
});

test("missing legacy metadata stages stay visible without fake counts", () => {
  const acceptance = compactTransformStatus(
    "group_acceptance_0",
    undefined,
    "python_opencv",
    done,
  );
  const observations = compactTransformStatus(
    "observation_identity_0",
    undefined,
    "python_opencv",
    done,
  );

  assert.equal(acceptance.label, "G acceptance: not available");
  assert.equal(observations.label, "Observation IDs: not available");
  assert.equal(acceptance.clickable, false);
  assert.equal(observations.clickable, false);
  assert.equal(
    compactTransformStatus(
      "group_acceptance_0",
      { status: "done" },
      "python_opencv",
      done,
    ).label,
    "G acceptance: done · count unavailable",
  );
});

test("queued running error and stale states remain honest", () => {
  const queued = compactTransformStatus("group_acceptance_0", {
    status: "pending",
    dependsOn: ["parts_grouping_0/group_regions_prolog"],
  }, "python_opencv", new Set());
  const running = compactTransformStatus("observation_identity_0", {
    status: "started",
    doer: "content_hash",
  }, "python_opencv", done);
  const error = compactTransformStatus("observation_identity_0", {
    status: "error",
    error: "bad artifact",
  }, "python_opencv", done);
  const stale = compactTransformStatus("group_acceptance_0", {
    status: "done",
    summary: {
      acceptedGroupCount: 2,
      partsFacts: "parts_extraction_0/python_scikit/result.pl",
    },
  }, "python_opencv", done);

  assert.equal(queued.label, "G acceptance: waiting for parts_grouping_0");
  assert.equal(queued.tone, "pending");
  assert.equal(running.label, "Observation IDs: running");
  assert.equal(running.tone, "running");
  assert.equal(error.label, "Observation IDs: error");
  assert.equal(error.tone, "error");
  assert.match(error.title, /bad artifact/);
  assert.equal(stale.label, "G acceptance: 2 final · stale");
  assert.equal(stale.tone, "stale");
});
