import assert from "node:assert/strict";
import test from "node:test";
import { foldable } from "@codemirror/language";
import { EditorState } from "@codemirror/state";
import {
  prologClauseFolding,
  prologClauseFoldRange,
} from "./prologFolding.ts";

test("multiline Prolog clauses expose a CodeMirror fold range", () => {
  const source = `% heading
shape(
  [a, b(c, d)],
  "x.y").
next_fact(ok).
`;
  const state = EditorState.create({
    doc: source,
    extensions: [prologClauseFolding],
  });
  const firstClauseLine = state.doc.line(2);
  const nextFactLine = state.doc.line(5);

  assert.deepEqual(
    foldable(state, firstClauseLine.from, firstClauseLine.to),
    prologClauseFoldRange(source, firstClauseLine.from, firstClauseLine.to),
  );
  assert.equal(
    foldable(state, nextFactLine.from, nextFactLine.to),
    null,
  );
});

test("folding ignores periods in quoted values and comments", () => {
  const source = `example(
  "not.the.end", % nor.this
  nested(foo.bar)).
`;
  const state = EditorState.create({
    doc: source,
    extensions: [prologClauseFolding],
  });
  const firstLine = state.doc.line(1);
  const range = foldable(state, firstLine.from, firstLine.to);

  assert.ok(range);
  assert.equal(source.slice(range.to, range.to + 1), ".");
  assert.match(source.slice(range.from, range.to), /nested\(foo\.bar\)\)/);
});
