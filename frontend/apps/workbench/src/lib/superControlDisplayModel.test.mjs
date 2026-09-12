import assert from "node:assert/strict";
import test from "node:test";
import { readFileSync } from "node:fs";
import { resourceHeader, superControlPaneIds } from "./superControlDisplayModel.ts";
import { builtinSubControls, selectSubControls } from "./subControls.ts";

const ids = Object.freeze(["file", "markdown", "resource", "runner"]);
for (const [mode, primary, secondary] of [
  ["tabs", ["markdown"], []],
  ["stacked", [...ids], []],
  ["single", ["file"], []],
  ["split-v", ["file"], ["resource"]],
  ["split-h", ["file"], ["resource"]],
]) {
  test(`${mode} selects only its own pane renderers without changing available controls`, () => {
    assert.deepEqual(superControlPaneIds(mode, ids, "markdown", "file", "resource"), { primary, secondary });
    assert.deepEqual(ids, ["file", "markdown", "resource", "runner"]);
  });
}
test("split panes independently accept identical selections and reject absent renderers", () => {
  for (const mode of ["split-v", "split-h"]) {
    assert.deepEqual(superControlPaneIds(mode, ids, "runner", "file", "file"), { primary: ["file"], secondary: ["file"] });
    assert.deepEqual(superControlPaneIds(mode, ids, "file", "missing", "runner"), { primary: [], secondary: ["runner"] });
  }
});
test("CTX uses actual selector metadata, not a hard-coded copy of ALL", () => {
  const available = [...builtinSubControls(), { id: "semantic", label: "Semantic", contexts: ["operation"] }, { id: "other", label: "Other" }];
  const selected = selectSubControls(available, { resourceKind: "operation" });
  assert.deepEqual(selected.map(entry => entry.id), ["file", "markdown", "resource", "runner", "semantic"]);
  assert.deepEqual(selectSubControls(available, {}).map(entry => entry.id), ["file", "markdown", "resource"]);
});
test("identity header preserves stable id and every declared discriminator", () => {
  const result = resourceHeader(JSON.stringify({ id: "op.7", label: "Find", kind: "operation", type: "native", subkind: "query", role: "reader" }), "Fallback");
  assert.equal(result.title, "OPERATION - Find (op.7)");
  assert.equal(result.resolved, true);
  assert.equal(result.error, "");
  assert.equal(result.metadata, "id: op.7 · kind: operation · type: native · subkind: query · role: reader");
});
test("identity header handles zero, duplicate labels and absent labels", () => {
  assert.equal(resourceHeader('{"id":0,"type":"counter"}', "Fallback").title, "COUNTER - 0");
  assert.equal(resourceHeader('{"id":"same","label":"same","kind":"model"}', "").title, "MODEL - same");
  assert.equal(resourceHeader('{"id":"x","subkind":"small_model"}', "").title, "SMALL MODEL - x");
  assert.equal(resourceHeader('{"id":"x","role":"reader"}', "").title, "READER - x");
});
test("malformed, missing-id and non-resource JSON identities are explicit", () => {
  assert.match(resourceHeader('{"id":', "Fallback").error, /JSON parse error/);
  assert.match(resourceHeader("broken", "Fallback", "file.json").error, /JSON parse error/);
  assert.match(resourceHeader('{"kind":"model","label":"Display"}', "").error, /stable id/);
  for (const source of ["[]", "null", "false", "0"]) assert.match(resourceHeader(source, "Fallback").error, /no single resource object/);
  assert.equal(resourceHeader("# Documentation", "README").title, "README");
  assert.equal(resourceHeader("# Documentation", "README").error, "");
});
test("active embedded surface retains renderer instances, banner modes and separate host comparison", () => {
  const source = readFileSync(new URL("../components/UniversalArtifactEditor.tsx", import.meta.url), "utf8");
  const embedded = source.slice(source.indexOf("function EmbeddedSuperControl("), source.indexOf("export function SuperControl("));
  assert.match(embedded, /availableControls\.filter\(hasControlRenderer\)/);
  assert.match(embedded, /selectSubControls\(/);
  assert.match(embedded, /<Activity key=\{pane\}/);
  assert.match(embedded, /<Activity key=\{entry\.id\}/);
  assert.match(embedded, /mountedControls\.map/);
  assert.match(embedded, /displayMode !== "tabs" && <button[^\n]*setDisplayMode\("tabs"\)/);
  for (const mode of ["tabs", "stacked", "single", "split-v", "split-h"]) assert.ok(embedded.includes(`<option value="${mode}">`));
  assert.match(embedded, /aria-pressed=\{tabSet === "all"\}/);
  assert.match(embedded, /aria-pressed=\{tabSet === "ctx"\}/);
  assert.match(embedded, /control\.initialControlId \|\| "file"/);
  assert.match(embedded, /invalidDrafts\.scope === draftScope/);
  assert.match(embedded, /<ResourceSourceEditor\s+key=\{draftScope\}/);
  assert.match(embedded, /disabled=\{control\.busy \|\| hasInvalidDraft/);
  assert.doesNotMatch(embedded, /compareKey|setCompareKey/);
  assert.match(source.slice(source.indexOf("export function SuperControl(")), /compareKey/);
});

test("narrow panes retain visible identity and format controls without silently changing split orientation", () => {
  const css = readFileSync(new URL("../styles/super_control.css", import.meta.url), "utf8");
  assert.match(css, /\.super-control-embedded > \.operation-editor-toolbar h2\s*\{[^}]*white-space: normal/);
  assert.match(css, /\.super-control-embedded > \.operation-editor-toolbar small\s*\{[^}]*overflow-wrap: anywhere/);
  assert.match(css, /\.resource-source-editor \.source-format-tabs\s*\{[^}]*flex-wrap: wrap/);
  assert.match(css, /\.super-control-split\s*\{[^}]*overflow: auto/);
  assert.match(css, /\.super-control-split\.split-v\s*\{[^}]*grid-template-columns: repeat\(2, minmax\(320px, 1fr\)\)/);
  assert.match(css, /\.super-control-split\.split-h\s*\{[^}]*grid-template-rows: repeat\(2, minmax\(260px, 1fr\)\)/);
  assert.doesNotMatch(css.slice(css.indexOf("@media")), /\.super-control-split\.split-v/);
});
