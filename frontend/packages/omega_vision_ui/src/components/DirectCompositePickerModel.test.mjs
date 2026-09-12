import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import test from "node:test";
import { directCompositeDescription } from "./DirectCompositePickerModel.ts";

test("colored groups follow declared frame and STM contracts in the requested order", () => {
  const choices = [
    { id: "one/native", inputContract: { frameInputCount: 1, usesSTM: false } },
    { id: "one-stm/native", inputContract: { frameInputCount: 1, usesSTM: true } },
    { id: "two/native", inputContract: { frameInputCount: 2, usesSTM: false } },
    { id: "two-stm/native", inputContract: { frameInputCount: 2, usesSTM: true } },
  ].map(entry => ({ ...entry, available: true, type: "py_pl" }));
  const descriptions = choices.map(entry => directCompositeDescription(entry.id, choices));
  assert.deepEqual(descriptions.map(item => item.groupLabel),
    ["Single frame", "Single frame + STM", "Two frames", "Two frames + STM"]);
  assert.deepEqual(descriptions.map(item => item.groupKey), descriptions.map(item => item.groupKey).sort());
  assert.equal(new Set(descriptions.map(item => item.tags[0].color)).size, 4);
  assert.ok(descriptions.every(item => !item.disabled));
});

test("names and partial metadata cannot pretend a stage has no STM or a known frame window", () => {
  for (const inputContract of [undefined, { frameInputCount: 2 }, { usesSTM: false },
    { frameInputCount: 1, usesSTM: "false" }, { frameInputCount: 4, usesSTM: true }]) {
    const entry = { id: "resolve_objects_via_one_frame_and_stm/native", available: true, inputContract };
    assert.equal(directCompositeDescription(entry.id, [entry]).groupLabel, "Other stages / scope not declared");
  }
});

test("unavailable choices stay unavailable and inference categories remain separate tags", () => {
  assert.equal(directCompositeDescription("missing/native", []).disabled, true);
  const entry = { id: "two_frame_x_duction/abduction", label: "Abduction", available: false,
    resultCategory: "hypotheses", inputContract: { frameInputCount: 2, usesSTM: true } };
  const description = directCompositeDescription(entry.id, [entry]);
  assert.equal(description.disabled, true);
  assert.equal(description.groupLabel, "Two frames + STM");
  assert.ok(description.tags.some(tag => tag.text === "hypotheses"));
  assert.ok(description.label.includes(entry.id));
});

test("both existing process slots use the real colored combo without auto-calling on selection", () => {
  const source = readFileSync(new URL("./VideoImportPage.tsx", import.meta.url), "utf8");
  assert.match(source, /<ColoredTagCombobox ariaLabel=\{`Direct process\/doer \$\{slot \+ 1\}`\}/);
  assert.match(source, /describe=\{id => directCompositeDescription\(id, directComposites\)\}/);
  assert.match(source, /onChange=\{id => chooseDirectComposite\(slot, id\)\}/);
  assert.doesNotMatch(source, /<select aria-label=\{`Direct process\/doer/);
  assert.match(source, /onClick=\{\(\) => void callDirect\(slot\)\}/);
});
