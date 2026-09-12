import { useEffect, useId, useRef, useState, type ReactNode } from "react";
import { MarkdownDocument } from "@app/components/MarkdownDocument";
import { RecordingTestExecution } from "./RecordingTestExecution";
import { isSpotlightTestId } from "./SpotlightDemoModel";
import { loadVisualSequenceCatalog } from "./VisualSequenceCatalog";
import { useSharedVisualSequenceSelection } from "./useSharedVisualSequenceSelection";
import { requiresVisualSequenceConfirmation, visualSequenceConfirmationMessage } from "./VisualSequenceLoadGate";
import { urlWithVisualSequence, visualSequenceLocationForEntry } from "./VideoImportRecordingUrl";
import { visualSequenceSpriteViewUrl } from "./VideoImportNavigationUrl";
import {
  filterRecordingTests, loadRecordingTestDetail, loadRecordingTestFrames, loadRecordingTests,
  type RecordingTest, type RecordingTestDetail, type TestFrame, type TestRecording,
} from "./RecordingTestsModel";
import "../styles/recording_tests.css";

function RecordingPreview({ workspaceId, recording, controlsVisible, onFrameChange }: {
  workspaceId: string; recording: TestRecording; controlsVisible: boolean; onFrameChange?: (path: string) => void;
}) {
  const [frames, setFrames] = useState<TestFrame[]>([]);
  const [index, setIndex] = useState(0);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");
  const [revision, setRevision] = useState(0);
  const [opening, setOpening] = useState(false);
  const active = useRef(true);
  const selection = useSharedVisualSequenceSelection(workspaceId);
  const sliderId = useId();

  useEffect(() => {
    active.current = true;
    return () => { active.current = false; };
  }, []);

  useEffect(() => {
    const controller = new AbortController();
    setLoading(true);
    setFrames([]);
    setIndex(0);
    setError("");
    void loadRecordingTestFrames(workspaceId, recording, controller.signal).then(value => {
      if (!controller.signal.aborted) setFrames(value);
    }).catch(reason => {
      if (!controller.signal.aborted) setError(String(reason));
    }).finally(() => {
      if (!controller.signal.aborted) setLoading(false);
    });
    return () => controller.abort();
  }, [workspaceId, recording, revision]);
  useEffect(() => { onFrameChange?.(frames[index]?.path ?? ""); }, [frames, index, onFrameChange]);

  const openRecording = async () => {
    setOpening(true);
    setError("");
    try {
      const entries = await loadVisualSequenceCatalog(workspaceId);
      if (!active.current) return;
      const entry = entries.find(item => item.id === recording.visualSequenceId);
      const location = entry && visualSequenceLocationForEntry(entry);
      if (!entry || !location) throw new Error("Recording is unavailable in the Visual Sequence catalog. Refresh tests.");
      if (requiresVisualSequenceConfirmation(entry, false) && !window.confirm(visualSequenceConfirmationMessage(entry))) return;
      const saved = await selection.select(entry.id);
      if (!active.current || !saved) return;
      const href = visualSequenceSpriteViewUrl(urlWithVisualSequence(window.location.href, location));
      window.history.pushState(null, "", href);
      window.dispatchEvent(new PopStateEvent("popstate"));
    } catch (reason) {
      if (active.current) setError(String(reason));
    } finally {
      if (active.current) setOpening(false);
    }
  };
  const frame = frames[index];
  return <div className="recording-test-preview">
    {loading && <p role="status">Loading recording frames...</p>}
    {(error || selection.error) && <p role="alert">{error || selection.error}
      <button type="button" onClick={() => setRevision(value => value + 1)}>Retry frames</button>
    </p>}
    {frame && <figure>
      <img key={frame.path}
        src={`/workbench/workspaces/${encodeURIComponent(workspaceId)}/asset?path=${encodeURIComponent(frame.path)}`}
        alt={`${recording.label}, frame ${index}`}
        onError={() => setError(`Cannot load frame ${index}. Refresh the recording before retrying.`)} />
      <figcaption>Frame {index} of {frames.length - 1}{index === 0 ? " - baseline" : ""}</figcaption>
    </figure>}
    {controlsVisible && frame && <div className="recording-test-frame-controls">
      <button type="button" disabled={index === 0} onClick={() => setIndex(value => value - 1)}>Previous frame</button>
      <label htmlFor={sliderId}>Frame</label>
      <input id={sliderId} type="range" min={0} max={frames.length - 1} value={index}
        onChange={event => setIndex(Number(event.target.value))} />
      <button type="button" disabled={index === frames.length - 1} onClick={() => setIndex(value => value + 1)}>Next frame</button>
    </div>}
    {controlsVisible && <div className="recording-test-open">
      <button type="button" disabled={opening || selection.writing || !selection.selection || loading || !frame}
        onClick={() => void openRecording()}>{opening ? "Loading recording..." : "Load recording in Sprite View"}</button>
      <span>Changes the shared Visual Sequence only when clicked. Does not run recognition or train rules.</span>
    </div>}
    <code className="recording-test-path">data/{recording.visualSequenceId}</code>
  </div>;
}

function TestDocumentation({ workspaceId, test, visualSequenceId, controlsVisible, showRecordingPreview }: {
  workspaceId: string; test: RecordingTest; visualSequenceId?: string; controlsVisible: boolean; showRecordingPreview: boolean;
}) {
  const [detail, setDetail] = useState<RecordingTestDetail | null>(null);
  const [error, setError] = useState("");
  const [revision, setRevision] = useState(0);
  const [recordingId, setRecordingId] = useState(visualSequenceId || test.recordings[0].visualSequenceId);
  const [previewFrameKey, setPreviewFrameKey] = useState("");
  const selectorId = useId();
  useEffect(() => {
    const controller = new AbortController();
    setDetail(null);
    setError("");
    void loadRecordingTestDetail(workspaceId, test.id, controller.signal).then(value => {
      if (!controller.signal.aborted) {
        if (visualSequenceId && !value.recordings.some(item => item.visualSequenceId === visualSequenceId)) {
          throw new Error("This test no longer refers to the selected Visual Sequence. Refresh tests before retrying.");
        }
        setDetail(value);
        setRecordingId(visualSequenceId || value.recordings[0].visualSequenceId);
      }
    }).catch(reason => {
      if (!controller.signal.aborted) setError(String(reason));
    });
    return () => controller.abort();
  }, [workspaceId, test.id, visualSequenceId, revision]);
  const selected = detail?.recordings.find(item => item.visualSequenceId === recordingId);
  return <div className="recording-test-detail">
    {error ? <p role="alert">{error} <button type="button" onClick={() => setRevision(value => value + 1)}>Retry documentation</button></p>
      : !detail ? <p role="status">Loading this test's documentation...</p> : null}
    {detail && <>
      {controlsVisible && showRecordingPreview && <div className="recording-test-recording-picker">
        <label htmlFor={selectorId}>This test's recordings</label>
        <select id={selectorId} value={recordingId} onChange={event => setRecordingId(event.target.value)}>
          {detail.recordings.filter(item => !visualSequenceId || item.visualSequenceId === visualSequenceId).map(item => <option key={item.visualSequenceId} value={item.visualSequenceId}>
            {item.label} - {item.partition} - {item.frameCount} frames
          </option>)}
        </select>
      </div>}
      {showRecordingPreview && selected && <RecordingPreview key={`${workspaceId}:${selected.visualSequenceId}`} workspaceId={workspaceId}
        recording={selected} controlsVisible={controlsVisible} onFrameChange={setPreviewFrameKey} />}
      {showRecordingPreview && selected && <RecordingTestExecution workspaceId={workspaceId} test={detail}
        visualSequenceId={selected.visualSequenceId} controlsVisible={controlsVisible} previewFrameKey={previewFrameKey} />}
      <div className="recording-test-documentation" aria-label={`${test.title} documentation`}>
        <MarkdownDocument content={detail.documentation} />
      </div>
    </>}
  </div>;
}

type RecordingTestsProps = {
  workspaceId: string; visualSequenceId?: string; controlsVisible?: boolean; showRecordingPreview?: boolean;
  presentation?: "catalog" | "summary" | "documentation" | "runtime";
  renderResults?: (test: RecordingTest) => ReactNode;
  previewFrameKey?: string; beforeExecution?: () => void;
};

export function RecordingTests(props: RecordingTestsProps) {
  return <RecordingTestsSession key={JSON.stringify([props.workspaceId, props.visualSequenceId, props.presentation])} {...props} />;
}

function RecordingTestsSession({ workspaceId, visualSequenceId, controlsVisible: providedControls,
  showRecordingPreview = true, presentation = "catalog", renderResults, previewFrameKey, beforeExecution }: RecordingTestsProps) {
  const [localControls, setControlsVisible] = useState(!visualSequenceId);
  const controlsVisible = presentation === "documentation" ? false : providedControls ?? localControls;
  const [tests, setTests] = useState<RecordingTest[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");
  const [revision, setRevision] = useState(0);
  const [group, setGroup] = useState("All");
  const [query, setQuery] = useState("");
  const [expanded, setExpanded] = useState<string | null>(null);
  const searchId = useId();
  const groupId = useId();
  const detailPrefix = useId();
  useEffect(() => {
    if (presentation !== "catalog" && !visualSequenceId) {
      setLoading(false);
      return;
    }
    const controller = new AbortController();
    setLoading(true);
    setTests([]);
    setExpanded(null);
    setError("");
    void loadRecordingTests(workspaceId, controller.signal).then(value => {
      if (!controller.signal.aborted) {
        const matching = visualSequenceId
          ? value.filter(test => test.recordings.some(item => item.visualSequenceId === visualSequenceId))
          : value;
        setTests(matching);
        if (visualSequenceId && matching.length === 1) setExpanded(matching[0].id);
      }
    }).catch(reason => {
      if (!controller.signal.aborted) setError(String(reason));
    }).finally(() => {
      if (!controller.signal.aborted) setLoading(false);
    });
    return () => controller.abort();
  }, [workspaceId, visualSequenceId, presentation, revision]);
  const visible = filterRecordingTests(tests, group, query);
  const groups = [...new Set(tests.map(test => test.group))];
  if (presentation === "runtime") return <div className="recording-test-runtime" aria-label="Selected test runtime output">
    {loading && <span role="status">Loading test runtime context…</span>}
    {error && <span role="alert">{error} <button type="button" onClick={() => setRevision(value => value + 1)}>Retry tests</button></span>}
    {tests.map(test => <div key={test.id}>
      {visualSequenceId && !isSpotlightTestId(test.id) && <RecordingTestExecution workspaceId={workspaceId} test={test}
        visualSequenceId={visualSequenceId} controlsVisible={controlsVisible} previewFrameKey={previewFrameKey} beforeWrite={beforeExecution} />}
      {renderResults?.(test)}
    </div>)}
    {controlsVisible && !loading && !error && !tests.length && <span>No test registered for this selected recording; preview remains available.</span>}
  </div>;
  if (presentation === "summary") return <section className="recording-tests recording-tests-summary" aria-label="Selected sequence test results">
    <h3>Tests &amp; results</h3>
    {loading && <p role="status">Loading this sequence's test definitions…</p>}
    {error && <p role="alert">{error} <button type="button" onClick={() => setRevision(value => value + 1)}>Retry tests</button></p>}
    {!loading && !error && tests.length === 0 && <p>No registered test definition for this Visual Sequence. You can still browse every stored frame.</p>}
    {tests.map(test => {
      const results = renderResults?.(test);
      return <article key={test.id} data-recording-test-id={test.id}>
      <div className="recording-test-summary-heading"><strong>{test.title}</strong><span>{results ? "Execution details below" : "Not run (definition metadata, not saved-run status)"}</span></div>
      <p>{test.summary}</p>
      {results}
    </article>;
    })}
    <p className="arc3-visual-sequence-note">Frame stepping does not execute a test. Test documentation is in the right-hand Documentation panel.</p>
  </section>;
  const documentationOnly = presentation === "documentation";
  return <section className="recording-tests" aria-label="Recording-based tests">
    <h3>{documentationOnly ? "Selected sequence" : "Recording-based tests"}</h3>
    {documentationOnly ? <p><code>{visualSequenceId}</code></p> : <p>Each test includes its own online documentation, local-memory requirements and recorded sequences.
      These are test inputs, not passed results. Native execution is separate from the read-only recording preview and older built-in demos.</p>}
    {visualSequenceId && !documentationOnly && providedControls === undefined && <button type="button" aria-expanded={controlsVisible}
      onClick={() => setControlsVisible(value => !value)}>{controlsVisible ? "Hide controls" : "Add controls"}</button>}
    {controlsVisible && <div className="recording-tests-toolbar">
      <label htmlFor={searchId}>Find a test</label>
      <input id={searchId} type="search" value={query} placeholder="Event, pressure plate, pushing..."
        onChange={event => setQuery(event.target.value)} />
      <label htmlFor={groupId}>Group</label>
      <select id={groupId} value={group} onChange={event => setGroup(event.target.value)}>
        <option value="All">All</option>
        {groups.map(name => <option key={name} value={name}>{name}</option>)}
      </select>
      <button type="button" disabled={loading} onClick={() => setRevision(value => value + 1)}>Refresh tests</button>
    </div>}
    {loading && <p role="status">Loading recorded tests...</p>}
    {error && <p role="alert">{error} <button type="button" onClick={() => setRevision(value => value + 1)}>Retry tests</button></p>}
    {!loading && !error && !documentationOnly && <p role="status">{visible.length} of {tests.length} tests</p>}
    {!loading && !error && tests.length === 0 && <p>{visualSequenceId
      ? "This Visual Sequence has no registered test definition yet. Its frames are still available in the frame player and Inputs."
      : "No recording-test index is available in the shared store yet."}</p>}
    {!loading && !error && tests.length > 0 && visible.length === 0 && <p>No tests match these filters.</p>}
    <div className="recording-tests-list">
      {visible.map(test => <article key={test.id} className="recording-test" data-recording-test-id={test.id}>
        <div className="recording-test-heading">
          <button type="button" aria-expanded={expanded === test.id} aria-controls={`${detailPrefix}-${test.id}`}
            onClick={() => setExpanded(value => value === test.id ? null : test.id)}>
            <strong>{test.title}</strong><span>{documentationOnly
              ? expanded === test.id ? "Hide documentation" : "Read documentation"
              : expanded === test.id ? "Hide documentation & recordings" : "Documentation & recordings"}</span>
          </button>
          <span>{test.group} / {test.recordings.length} recording{test.recordings.length === 1 ? "" : "s"} / Definition: {test.executionStatus} (not saved-run status)</span>
        </div>
        <p>{test.summary}</p>
        <div id={`${detailPrefix}-${test.id}`}>
          {expanded === test.id && <TestDocumentation key={`${workspaceId}:${test.id}`} workspaceId={workspaceId}
            test={test} visualSequenceId={visualSequenceId} controlsVisible={controlsVisible} showRecordingPreview={showRecordingPreview && !documentationOnly} />}
        </div>
      </article>)}
    </div>
  </section>;
}
