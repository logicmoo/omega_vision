export type TestRecording = {
  visualSequenceId: string;
  label: string;
  partition: string;
  frameCount: number;
};

export type RecordingTest = {
  id: string;
  group: "Events" | "Pressure plates" | "Pushing";
  title: string;
  summary: string;
  executionStatus: "not_run";
  recordings: TestRecording[];
};

export type RecordingTestDetail = RecordingTest & { documentation: string };
export type TestFrame = { path: string; label: string };

const ID = /^[a-z][a-z0-9_]*$/;
const RECORDING = /^recordings\/events_tests\/[a-z][a-z0-9_]*$/;

function object(value: unknown): value is Record<string, unknown> {
  return value !== null && typeof value === "object" && !Array.isArray(value);
}

function recording(value: unknown): value is TestRecording {
  return object(value) && typeof value.visualSequenceId === "string"
    && RECORDING.test(value.visualSequenceId)
    && typeof value.label === "string" && !!value.label.trim()
    && typeof value.partition === "string" && !!value.partition
    && typeof value.frameCount === "number" && Number.isSafeInteger(value.frameCount) && value.frameCount > 0;
}

function testEntry(value: unknown): value is RecordingTest {
  return object(value) && typeof value.id === "string" && ID.test(value.id)
    && ["Events", "Pressure plates", "Pushing"].includes(String(value.group))
    && typeof value.title === "string" && !!value.title.trim()
    && typeof value.summary === "string" && value.executionStatus === "not_run"
    && Array.isArray(value.recordings) && value.recordings.length > 0 && value.recordings.every(recording)
    && new Set(value.recordings.map(item => item.visualSequenceId)).size === value.recordings.length;
}

export function parseRecordingTests(value: unknown): RecordingTest[] {
  if (!object(value) || !Array.isArray(value.tests) || !value.tests.every(testEntry)
      || value.count !== value.tests.length
      || new Set(value.tests.map(item => item.id)).size !== value.tests.length) {
    throw new Error("The recording-test catalog is invalid. Refresh tests or repair its saved index.");
  }
  return value.tests;
}

export function parseRecordingTestDetail(value: unknown, id: string): RecordingTestDetail {
  if (!testEntry(value) || value.id !== id || !("documentation" in value)
      || typeof value.documentation !== "string" || !value.documentation.trim()) {
    throw new Error("Documentation does not match the requested recording test.");
  }
  return { ...value, documentation: value.documentation };
}

async function readJson(url: string, signal?: AbortSignal, transport: typeof fetch = fetch): Promise<unknown> {
  const response = await transport(url, { cache: "no-store", signal });
  if (!response.ok) {
    throw new Error(`Recording test request failed: HTTP ${response.status}. Refresh to retry.`);
  }
  return response.json();
}

export async function loadRecordingTests(workspaceId: string, signal?: AbortSignal, transport?: typeof fetch) {
  return parseRecordingTests(await readJson(
    `/workbench/recognition/recording-tests?workspaceId=${encodeURIComponent(workspaceId)}`, signal, transport,
  ));
}

export async function loadRecordingTestDetail(workspaceId: string, id: string, signal?: AbortSignal, transport?: typeof fetch) {
  if (!ID.test(id)) throw new Error("Invalid recording test identifier.");
  return parseRecordingTestDetail(await readJson(
    `/workbench/recognition/recording-tests/${encodeURIComponent(id)}?workspaceId=${encodeURIComponent(workspaceId)}`,
    signal, transport,
  ), id);
}

export async function loadRecordingTestFrames(
  workspaceId: string, selected: TestRecording, signal?: AbortSignal, transport?: typeof fetch,
): Promise<TestFrame[]> {
  if (!recording(selected)) throw new Error("Invalid test recording.");
  const sequenceId = `data/${selected.visualSequenceId}`;
  const frames: TestFrame[] = [];
  while (frames.length < selected.frameCount) {
    const result = await readJson(
      `/workbench/video-import/preprocessing-frames?workspaceId=${encodeURIComponent(workspaceId)}`
      + `&sequenceId=${encodeURIComponent(sequenceId)}&offset=${frames.length}&limit=100`,
      signal, transport,
    );
    if (!object(result) || result.sequenceId !== sequenceId || result.total !== selected.frameCount
        || result.offset !== frames.length || !Array.isArray(result.frames) || !result.frames.length
        || result.frames.length + frames.length > selected.frameCount) {
      throw new Error("Recording frames changed or are unavailable. Refresh tests before loading.");
    }
    for (const frame of result.frames) {
      if (!object(frame) || frame.path !== `${sequenceId}/${frames.length}/image.png`
          || typeof frame.label !== "string") {
        throw new Error("Test frame does not match its numbered recording source.");
      }
      frames.push({ path: frame.path, label: frame.label });
    }
  }
  return frames;
}

export function filterRecordingTests(tests: RecordingTest[], group: string, query: string): RecordingTest[] {
  const terms = query.toLowerCase().trim().split(/\s+/).filter(Boolean);
  return tests.filter(test => (group === "All" || group === test.group)
    && terms.every(term => `${test.id} ${test.title} ${test.summary} ${test.group}`.toLowerCase().includes(term)));
}
