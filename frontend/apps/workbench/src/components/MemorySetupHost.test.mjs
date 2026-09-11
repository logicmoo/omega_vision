import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import test from "node:test";

const source = readFileSync(new URL("./MemorySetupHost.tsx", import.meta.url), "utf8");

test("inherited saved memory does not require a recording context", () => {
  const guard = source.slice(source.indexOf("const requireAreaContext"), source.indexOf("useEffect", source.indexOf("const requireAreaContext")));
  assert.match(guard, /contextual:scene.*contextual:previous-moment.*contextual:current-moment/);
  assert.doesNotMatch(guard, /contextual:inherited|areaType === "contextual"/);
});

test("configured inspector choices load independently of preferences and sequence readiness", () => {
  const areaEffect = source.slice(source.indexOf("void request<InspectorAreasResponse>"), source.indexOf("async function refresh"));
  assert.match(areaEffect, /\/inspectable-areas\?workspaceId=/);
  assert.doesNotMatch(areaEffect, /\/setup|preferences|sequenceReady/);
  assert.match(source, /areas=\{areas\?\.areas \?\? \[\]\}/);
  assert.match(source, /loading=\{areasLoading\} error=\{areasError \|\| memoryError\}/);
  assert.match(source, /setAreasReload\(value => value \+ 1\)/);
});

test("frame-bound reads keep area selection but reset preferences and obsolete read authority", () => {
  assert.match(source, /key=\{`\$\{props\.workspaceId\}\|\$\{session\}`\}/);
  assert.match(source, /contextKey=\{`\$\{workspaceId\}\|\$\{session\}`\}/);
  assert.match(source, /readContextKey=\{`\$\{inspectorContextKey\}/);
  assert.match(source, /frameId: frameId \|\| undefined/);
  assert.match(source, /preferencesContext === contextKey \? loadedPreferences : null/);
  assert.match(source, /currentContext\.current === contextKey/);
});

test("area and exact-reference transports remain read-only and retain captured context", () => {
  assert.match(source, /url\.endsWith\("\/inspect-area"\) \|\| url\.endsWith\("\/inspect-reference"\)/);
  assert.match(source, /onInspectArea=\{\(areaId, memoryKind, signal\)/);
  assert.match(source, /\.\.\.inspectorBody, areaId, kind: memoryKind/);
  assert.match(source, /onInspectReference=\{\(areaId, reference, signal\)/);
  assert.match(source, /\.\.\.inspectorBody, areaId, reference/);
});

test("inspector contains an always-visible shared selector and explicit manifest frame control", () => {
  const browser = readFileSync(new URL("./ShapeObjectInspectorBrowser.tsx", import.meta.url), "utf8");
  assert.match(source, /sequenceSelector=\{<>[\s\S]*?<VisualSequenceSelector workspaceId=\{workspaceId\}/);
  assert.match(browser, /<h3>Shape \/ Object memory inspector<\/h3>\s*\{sequenceSelector\}/);
  assert.match(source, /aria-label="Visual Sequence frame"/);
  assert.match(source, /recordingContext\?\.frames\.map/);
  assert.match(source, /first explicit manifest frame/);
  assert.doesNotMatch(source, /frames\.sort|frames\[0\]/);
});

test("inspector frame authority is separate from preference context and ignores stale requests", () => {
  assert.match(source, /pageFrame = pageSequenceId === `data\/\$\{sharedSelection\.visualSequenceId\}` \? frameId : undefined/);
  assert.match(source, /pageSequenceId=\{props\.sequenceId\}/);
  assert.match(source, /recordingState\?\.key === inspectorContextKey \? recordingState\.value : null/);
  assert.match(source, /return \(\) => requestController\.abort\(\)/);
  assert.match(source, /if \(!requestController\.signal\.aborted\) setRecordingState/);
  assert.match(source, /frameId: recordingContext\?\.selectedFrameId/);
  assert.match(source, /const body = \{ workspaceId, sequenceId: sequenceId \|\| undefined, frameId: frameId \|\| undefined/);
  assert.match(source, /\["contextual:scene", "contextual:previous-moment", "contextual:current-moment"\]\.includes\(areaId\) && !recordingContext/);
  const preferenceSave = source.slice(source.indexOf("onSave={async"), source.indexOf("onResetVolatile"));
  assert.match(preferenceSave, /\.\.\.body, preferences: next, expectedRevision/);
  assert.doesNotMatch(preferenceSave, /inspectorBody|recordingContext|sharedSelection/);
});

test("explicit saves retire old setup responses and block refreshes until acknowledged", () => {
  const refresh = source.slice(source.indexOf("async function refresh"), source.indexOf("async function readRecords"));
  assert.match(refresh, /preferenceRequests\.current\.beginRead\(\)/);
  assert.match(refresh, /if \(current === null\) return/);
  assert.match(refresh, /!preferenceRequests\.current\.isCurrent\(current\).*signal\.aborted.*currentContext\.current !== contextKey/);
  const save = source.slice(source.indexOf("onSave={async"), source.indexOf("onResetVolatile"));
  assert.match(save, /preferenceRequests\.current\.beginSave\(\)/);
  assert.match(save, /if \(current === null\) throw/);
  assert.match(save, /!signal\.aborted && preferenceRequests\.current\.isCurrent\(current\) && currentContext\.current === contextKey/);
  assert.match(save, /finally[\s\S]*preferenceRequests\.current\.finishSave\(current\)/);
  assert.match(source, /controller\.current\.abort\(\); preferenceRequests\.current\.reset\(\)/);
  assert.equal((source.match(/"PUT"/g) ?? []).length, 1);
  assert.equal((save.match(/"PUT"/g) ?? []).length, 1);
});
