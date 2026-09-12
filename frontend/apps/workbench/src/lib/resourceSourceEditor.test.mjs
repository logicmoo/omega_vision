import assert from "node:assert/strict";
import test from "node:test";
import { readFileSync } from "node:fs";
import { stripTypeScriptTypes } from "node:module";
import { parse } from "@babel/parser";
import { EditorState } from "@codemirror/state";
import { ensureSyntaxTree } from "@codemirror/language";
import { jsonDocumentToMetta, mettaDocumentToJson, mettaToJsonValue } from "./mettaResourceCodec.ts";
import { createJsonTreeState } from "./resourceJsonTree.ts";

// Exercise the actual non-JSX editor helpers with their installed lexer modules.
const editorUrl = new URL("../components/ResourceSourceEditor.tsx", import.meta.url);
const source = readFileSync(editorUrl, "utf8");
const prefix = source.slice(0, source.indexOf("export function ResourceSourceEditor("));
const ast = parse(prefix, { sourceType: "module", plugins: ["typescript", "jsx"] });
const declarations = ast.program.body.filter(node => node.type !== "ImportDeclaration").map(node => prefix.slice(node.start, node.end)).join("\n");
const imports = ast.program.body.filter(node => node.type === "ImportDeclaration" && (
  node.source.value.startsWith("@codemirror/") || /\/(?:resourceJsonTree|prologMode|prologFolding)$/.test(node.source.value)
)).map(node => {
  const specifier = node.source.value;
  const resolved = specifier.startsWith(".") ? new URL(`${specifier}.ts`, editorUrl).href : import.meta.resolve(specifier);
  return prefix.slice(node.start, node.source.start) + JSON.stringify(resolved) + ";";
}).join("\n");
const exports = "\nexport { textLanguageExtension, jsonNodeSummary, getNodeAtPath, updateJsonAtPath };";
const helpers = await import(`data:text/javascript;base64,${Buffer.from(stripTypeScriptTypes(imports + declarations + exports)).toString("base64")}`);
const detect = helpers.detectResourceSourceMode;
const component = parse(source, { sourceType: "module", plugins: ["typescript", "jsx"] }).program.body
  .find(node => node.type === "ExportNamedDeclaration" && node.declaration?.id?.name === "ResourceSourceEditor").declaration;
const editDeclarations = component.body.body.filter(node => node.type === "VariableDeclaration"
  && ["sourceMettaToJson", "validDraft", "editMetta", "editJson", "editText", "reloadCurrentSource"].includes(node.declarations[0].id.name))
  .map(node => source.slice(node.start, node.end)).join("\n");
function editHarness(model = "json", locked = false) {
  const state = { changes: [], validity: [], metta: "", json: "", error: "", conflict: false };
  const value = model === "raw" ? "((id latest))" : '{"id":"latest"}';
  const environment = {
    editingLocked: locked, sourceModel: { current: model }, rawMettaProjection: { current: false },
    emittedJson: { current: null }, invalidDraft: { current: false }, jsonDocumentToMetta, mettaDocumentToJson, mettaToJsonValue,
    value, initialMode: detect(value, "source.metta"), isJsonContent: input => { try { JSON.parse(input); return true; } catch { return false; } },
    jsonState: { current: createJsonTreeState(value) }, createJsonTreeState, setFormat: () => {}, setTextLang: () => {},
    setMetta: value => { state.metta = value; }, setJsonDraft: value => { state.json = value; },
    setError: value => { state.error = value; }, setExternalConflict: value => { state.conflict = value; },
    onChange: value => { state.changes.push(value); }, onValidityChange: value => { state.validity.push(value); },
  };
  const callbacks = new Function(...Object.keys(environment), `${stripTypeScriptTypes(editDeclarations)}\nreturn { editMetta, editJson, editText, reloadCurrentSource };`)(...Object.values(environment));
  return { state, environment, ...callbacks };
}

test("every JSON document defaults to MeTTa even with misleading extension or metadata", () => {
  for (const value of ['{"id":"x"}', "[]", "false", "null", "0", '""']) {
    assert.deepEqual(detect(value, "misleading.py", { language: "python" }), { format: "metta", textLanguage: "clojure" });
  }
  assert.deepEqual(detect('{"id":"x"}', "", {}, "text", "clojure"), { format: "text", textLanguage: "json" });
});
test("extensionless and misleadingly named Markdown gets its real Markdown lexer", () => {
  for (const path of ["", "README", "wrong.py", "wrong.metta"]) {
    assert.deepEqual(detect("# Heading\n\n- Entry\n\n**Emphasis**", path, { language: "python" }), { format: "text", textLanguage: "markdown" });
  }
  assert.equal(detect("# Guide\n```python\nimport os\n```\nText", "README").textLanguage, "markdown");
  assert.equal(detect("# Operators\nThe Prolog token is :- in this prose.", "README").textLanguage, "markdown");
});
test("actual code outranks comment-like Markdown and misleading paths", () => {
  for (const [value, expected] of [
    ["# Python heading\nimport os\nprint(os.getcwd())", "python"],
    ["// JavaScript heading\nimport value from './value.js';", "javascript"],
    ["# Comment\nfrom pathlib import Path", "python"],
    ["/* # Notes */\nexport const x = 3;", "javascript"],
    ["% # Relations\nparent(X, Y) :- child(Y, X).", "prolog"],
    ["(= (solve $x) (match &self $x $x))", "clojure"],
  ]) assert.equal(detect(value, "wrong.md").textLanguage, expected, value);
  assert.equal(detect("def read():\n  return 3", "wrong.metta").format, "text");
});
test("shebangs precede misleading paths and metadata", () => {
  for (const [bang, language] of [["/usr/bin/env python3", "python"], ["/usr/bin/env node", "javascript"], ["/bin/bash", "shell"], ["/usr/bin/env pwsh", "powershell"]]) {
    assert.equal(detect(`#!${bang}\necho value`, "wrong.md", { language: "clojure" }).textLanguage, language);
  }
});
test("unknown content uses metadata, known file types or honest plain text", () => {
  assert.equal(detect("arbitrary body", "unknown", { language: "MeTTa" }).textLanguage, "clojure");
  assert.equal(detect("arbitrary body", "", { mimeType: "text/markdown" }).textLanguage, "markdown");
  assert.equal(detect("arbitrary body", "native.metta").textLanguage, "clojure");
  assert.equal(detect("arbitrary body", "native.metta").format, "metta");
  assert.equal(detect("arbitrary body", "source.unknown").textLanguage, "plain");
  assert.equal(helpers.textLanguageForFilename(String.raw`C:\project\source.py`), "python");
  assert.equal(helpers.textLanguageForFilename("Dockerfile"), "dockerfile");
});
test("detected languages actually instantiate installed CodeMirror parsers", () => {
  for (const [source, filename] of [["# Heading", ""], ['{"id":"x"}', ""], ["def read():\n  return 3", ""], ["export const x = 1;", ""], ["(= (solve $x) $x)", "native.metta"]]) {
    const mode = detect(source, filename);
    const state = EditorState.create({ doc: source, extensions: helpers.textLanguageExtension(mode.textLanguage) });
    assert.ok(ensureSyntaxTree(state, state.doc.length, 100), mode.textLanguage);
  }
});
test("enhanced summaries retain numeric identity and kind/type/subkind/role", () => {
  const summary = helpers.jsonNodeSummary({ id: 0, label: "Visible", kind: "resource", type: "native", subkind: "query", role: "reader" });
  for (const token of ["0", "Visible", "resource", "native", "query", "reader"]) assert.ok(summary.includes(token), summary);
});
test("tree editing round-trips escaped keys and arrays while rejecting inherited keys", () => {
  const original = { "a.b": [{ "x[0]": 1 }, { id: "keep" }] };
  assert.equal(helpers.getNodeAtPath(original, '$["a.b"][0]["x[0]"]'), 1);
  assert.deepEqual(helpers.updateJsonAtPath(original, '$["a.b"][0]["x[0]"]', () => 2), { "a.b": [{ "x[0]": 2 }, { id: "keep" }] });
  assert.deepEqual(helpers.updateJsonAtPath(original, '$["a.b"][0]', () => null), { "a.b": [{ id: "keep" }] });
  assert.deepEqual(original, { "a.b": [{ "x[0]": 1 }, { id: "keep" }] });
  assert.equal(helpers.getNodeAtPath({}, "$.constructor"), null);
  assert.equal(helpers.updateJsonAtPath({}, "$.constructor", () => 2), null);
});
test("view switches preserve invalid drafts and only explicit actions discard conflicting source", () => {
  assert.match(source, /invalidDraft\.current && value !== emittedJson\.current/);
  assert.match(source, /setExternalConflict\(true\);\s*return;/);
  assert.match(source, /Use latest source \(discard this draft\)/);
  assert.match(source, /const chooseFormat = .*setFormat\(next\)/);
  assert.doesNotMatch(source, /onClick=\{\(\) => \{ setError\(""\); setFormat/);
  assert.match(source, /\{error && <div className="validation bad"/);
  assert.match(source, /if \(!formatChosen\.current\)/);
});
test("actual JSON and MeTTa edit callbacks synchronize data without emitting invalid drafts", () => {
  const editor = editHarness();
  editor.editJson('{"id":"one","items":[]}');
  assert.deepEqual(mettaToJsonValue(editor.state.metta), { id: "one", items: [] });
  editor.editMetta(jsonDocumentToMetta('{"id":"two","items":[1]}'));
  assert.deepEqual(JSON.parse(editor.state.json), { id: "two", items: [1] });
  const committedDraftCount = editor.state.changes.length;
  editor.editJson('{"id":');
  assert.equal(editor.state.changes.length, committedDraftCount);
  assert.equal(editor.state.json, '{"id":');
  assert.equal(editor.environment.invalidDraft.current, true);
  assert.ok(editor.state.error);
});
test("native map edits retain MeTTa emission through JSON and Text projections", () => {
  const editor = editHarness("raw");
  editor.editMetta(jsonDocumentToMetta('{"id":"one"}'));
  assert.equal(editor.environment.rawMettaProjection.current, true);
  editor.editJson('{"id":"two"}');
  assert.deepEqual(mettaToJsonValue(editor.state.changes.at(-1)), { id: "two" });
  editor.editText('{"id":"three"}');
  assert.deepEqual(mettaToJsonValue(editor.state.changes.at(-1)), { id: "three" });
});
test("native program text stays editable and updates its MeTTa view without inventing a resource map", () => {
  const editor = editHarness("raw");
  editor.editText("(= (foo $x) $x)");
  assert.equal(editor.state.metta, "(= (foo $x) $x)");
  editor.editMetta("(= (foo $x) (+ $x 1))");
  assert.equal(editor.state.changes.at(-1), "(= (foo $x) (+ $x 1))");
  assert.equal(editor.environment.rawMettaProjection.current, false);
  assert.equal(editor.environment.invalidDraft.current, false);
});
test("actual read-only edit callbacks cannot mutate drafts or emit source", () => {
  const editor = editHarness("json", true);
  editor.editJson('{"id":"one"}');
  editor.editMetta("((id two))");
  editor.editText("replacement");
  assert.deepEqual(editor.state.changes, []);
  assert.equal(editor.state.metta, "");
  assert.equal(editor.state.json, "");
  assert.deepEqual(editor.state.validity, []);
});
test("explicit conflict reload restores synchronized JSON and native map projections without emitting", () => {
  for (const model of ["json", "raw"]) {
    const editor = editHarness(model);
    editor.environment.invalidDraft.current = true;
    editor.reloadCurrentSource();
    assert.deepEqual(JSON.parse(editor.state.json), { id: "latest" });
    assert.deepEqual(mettaToJsonValue(editor.state.metta), { id: "latest" });
    assert.equal(editor.environment.rawMettaProjection.current, model === "raw");
    assert.equal(editor.environment.invalidDraft.current, false);
    assert.deepEqual(editor.state.changes, []);
  }
});
test("read-only and folding wiring cannot write source or silently clear invalid data", () => {
  assert.match(source, /const editingLocked = disabled \|\| contentReadOnly/);
  assert.match(source, /editable=\{!editingLocked\}/);
  assert.match(source, /readOnly=\{editingLocked\}/);
  assert.match(source, /if \(!editingLocked && resource\)/);
  assert.match(source, /disabled=\{editingLocked\}.*Add key/);
  assert.match(source, /key=\{`\$\{format\}:\$\{codeMirrorLanguage\}`\}/);
  assert.match(source, /jsonState\.current = update\.state/);
  assert.match(source, /restoreJsonFolds\(view\.state, jsonState\.current\)/);
  assert.match(source, /aria-expanded=\{hasChildren \? expanded : undefined\}/);
  assert.match(source, /editJson\(nextText\)/);
  assert.doesNotMatch(source.slice(source.indexOf("const changeTreeFolds"), source.indexOf("const writeTreeDocument")), /onChange\(/);
});
