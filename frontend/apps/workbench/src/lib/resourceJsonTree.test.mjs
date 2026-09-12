import assert from "node:assert/strict";
import test from "node:test";
import { foldedRanges, foldEffect, unfoldEffect } from "@codemirror/language";
import {
  createJsonTreeState, jsonTreeNodes, jsonChildPath, jsonPathTokens, expandedJsonPaths,
  changeJsonFolds, updateJsonTreeDocument, restoreJsonFolds, jsonBranchAt,
} from "./resourceJsonTree.ts";
import { jsonDocumentToMetta, mettaToJsonValue, mettaDocumentToJson } from "./mettaResourceCodec.ts";

const doc = JSON.stringify({ id: "root", items: [{ id: "first", values: [1, 2] }, {}], "a.b": { "x[0]": [] } }, null, 2);
const closedRanges = state => {
  const ranges = [];
  foldedRanges(state).between(0, state.doc.length, (from, to) => { ranges.push([from, to]); });
  return ranges;
};
test("tree nodes have real CodeMirror JSON syntax offsets and escaped paths", () => {
  const state = createJsonTreeState(doc);
  const nodes = jsonTreeNodes(state);
  for (const path of ["$", "$.items", "$.items[0]", "$.items[0].values", '$["a.b"]', '$["a.b"]["x[0]"]']) {
    const node = nodes.find(entry => entry.path === path);
    assert.ok(node?.fold, path);
    assert.doesNotThrow(() => JSON.parse(state.sliceDoc(node.from, node.to)), path);
  }
  assert.equal(state.sliceDoc(...["from", "to"].map(key => nodes.find(node => node.path === "$.id")[key])), '"root"');
});
test("safe paths distinguish object keys and array positions without prototype traversal", () => {
  for (const key of ["ordinary", "a.b", "x[0]", 'quote"slash\\', "", "0", "__proto__", "line\nbreak"]) {
    assert.deepEqual(jsonPathTokens(jsonChildPath("$", key)), [key]);
  }
  assert.deepEqual(jsonPathTokens('$["0"][0].value'), ["0", 0, "value"]);
  for (const bad of ["x", "$.a tail", "$..a", "$[01]", '$["unterminated]', "$[-1]"]) assert.throws(() => jsonPathTokens(bad));
});
test("whole-tree folding changes real foldedRanges and never document bytes", () => {
  const original = createJsonTreeState(doc);
  const collapsed = changeJsonFolds(original, "$", false);
  assert.equal(expandedJsonPaths(collapsed).size, 0);
  assert.equal(closedRanges(collapsed).length, jsonTreeNodes(original).filter(node => node.fold).length);
  const expanded = changeJsonFolds(collapsed, "$", true);
  assert.deepEqual(closedRanges(expanded), []);
  for (const state of [original, collapsed, expanded]) assert.equal(state.doc.toString(), doc);
});
test("selected branch folds descendants without folding siblings or ancestors", () => {
  const state = changeJsonFolds(createJsonTreeState(doc), "$.items", false);
  const expanded = expandedJsonPaths(state);
  assert.ok(expanded.has("$"));
  assert.ok(expanded.has('$["a.b"]'));
  assert.ok(!expanded.has("$.items"));
  assert.ok(!expanded.has("$.items[0].values"));
  assert.equal(state.doc.toString(), doc);
});
test("every empty object and array has an operable disclosure", () => {
  for (const doc of ["{}", "[]", '{"empty":{},"array":[]}']) {
    const original = createJsonTreeState(doc);
    for (const node of jsonTreeNodes(original).filter(node => node.fold)) {
      const closed = changeJsonFolds(original, node.path, false, false);
      assert.ok(!expandedJsonPaths(closed).has(node.path));
      assert.ok(expandedJsonPaths(changeJsonFolds(closed, node.path, true, false)).has(node.path));
      assert.equal(closed.doc.toString(), doc);
    }
  }
});
test("native CodeMirror fold and unfold effects are reflected by Tree", () => {
  const original = createJsonTreeState(doc);
  const node = jsonTreeNodes(original).find(node => node.path === "$.items[0]");
  const closed = original.update({ effects: foldEffect.of(node.fold) }).state;
  assert.ok(!expandedJsonPaths(closed).has(node.path));
  const opened = closed.update({ effects: unfoldEffect.of(node.fold) }).state;
  assert.ok(expandedJsonPaths(opened).has(node.path));
});
test("JSON view restoration reuses current fold paths without changing source", () => {
  const folded = changeJsonFolds(createJsonTreeState(doc), "$.items", false);
  const nextView = createJsonTreeState(doc);
  const transaction = nextView.update({ effects: restoreJsonFolds(nextView, folded) });
  assert.equal(transaction.docChanged, false);
  assert.deepEqual(closedRanges(transaction.state), closedRanges(folded));
});
test("restoring an invalid draft preserves its actual CodeMirror fold ranges", () => {
  let state = changeJsonFolds(createJsonTreeState(doc), "$.items", false);
  state = state.update({ changes: { from: state.doc.length, insert: " unfinished" } }).state;
  assert.equal(jsonTreeNodes(state), null);
  const target = createJsonTreeState(state.doc.toString());
  const restored = target.update({ effects: restoreJsonFolds(target, state) }).state;
  assert.deepEqual(closedRanges(restored), closedRanges(state));
  assert.equal(restored.doc.toString(), state.doc.toString());
});
test("restoration does not fabricate folds for newly inserted branches", () => {
  const state = changeJsonFolds(createJsonTreeState(doc), "$.items", false);
  const next = createJsonTreeState(JSON.stringify({ ...JSON.parse(doc), added: { value: 1 } }));
  const restored = next.update({ effects: restoreJsonFolds(next, state) }).state;
  assert.ok(expandedJsonPaths(restored).has("$.added"));
  assert.ok(!expandedJsonPaths(restored).has("$.items"));
});
test("fold state survives MeTTa edits and new JSON offsets", () => {
  const state = changeJsonFolds(createJsonTreeState(doc), "$.items", false);
  const metta = jsonDocumentToMetta(doc);
  const edited = mettaToJsonValue(metta);
  edited.id = "longer identity moves every subsequent source offset";
  const nextDoc = JSON.stringify(edited, null, 4);
  const next = updateJsonTreeDocument(state, nextDoc);
  assert.ok(!expandedJsonPaths(next).has("$.items"));
  assert.ok(expandedJsonPaths(next).has('$["a.b"]'));
  assert.equal(next.doc.toString(), nextDoc);
  assert.notDeepEqual(closedRanges(next), closedRanges(state));
});
test("primitive roots are valid and JSON-only generic conversion does not weaken resource-map codec", () => {
  for (const value of [null, false, 0, "", [1, { id: "x" }]]) {
    const source = JSON.stringify(value);
    assert.equal(jsonTreeNodes(createJsonTreeState(source))[0].path, "$");
    assert.deepEqual(mettaToJsonValue(jsonDocumentToMetta(source)), value);
  }
  assert.throws(() => mettaDocumentToJson(jsonDocumentToMetta("[]")), /resource document must be a map/);
});
test("invalid syntax and absent branches stay unavailable without mutations", () => {
  for (const doc of ["", '{"x":}', "{", "[1,]", "not JSON"]) {
    const state = createJsonTreeState(doc);
    assert.equal(jsonTreeNodes(state), null);
    assert.equal(changeJsonFolds(state, "$", false), state);
    assert.equal(state.doc.toString(), doc);
  }
  const state = createJsonTreeState(doc);
  assert.equal(changeJsonFolds(state, "$.missing", false), state);
});
test("JSON cursor selects its nearest parsed branch", () => {
  const state = createJsonTreeState(doc);
  assert.equal(jsonBranchAt(state, doc.indexOf('"first"') + 2), "$.items[0]");
  assert.equal(jsonBranchAt(state, doc.indexOf("1,") + 1), "$.items[0].values");
  assert.equal(jsonBranchAt(state, 0), "$");
});
