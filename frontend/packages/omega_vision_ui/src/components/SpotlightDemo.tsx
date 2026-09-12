import { useEffect, useId, useLayoutEffect, useRef, useState } from "react";
import { useMenuSurfaceLifecycle } from "@app/components/MenuVisibilityBoundary";
import { loadRecordingTests } from "./RecordingTestsModel";
import { FullRasterViewport } from "./FullRasterViewport";
import { PacedSequencePlayback, SequencePlaybackCoordinator } from "./VisualSequencePlayback";
import {
  canStepSpotlight, isSpotlightTestId, loadSpotlightFrame, loadSpotlightScript, spotlightReceiptLabel, SpotlightRunClient, validateSpotlightFrame,
  type SpotlightFrame, type SpotlightReceipt, type SpotlightRun, type SpotlightValidation,
} from "./SpotlightDemoModel";

function errorMessage(error: unknown) {
  return error instanceof Error ? error.message : String(error);
}

export function useSpotlightDemo(workspaceId: string, visualSequenceId: string, controlsVisible: boolean, coordinator: SequencePlaybackCoordinator) {
  const lifecycle = useMenuSurfaceLifecycle();
  const active = useRef(false);
  const pending = useRef(false);
  const [client, setClient] = useState<SpotlightRunClient | null>(null);
  const [registered, setRegistered] = useState(false);
  const [capabilityError, setCapabilityError] = useState("");
  const [metadataRetry, setMetadataRetry] = useState(0);
  const [confirmed, setConfirmed] = useState(false);
  const [busy, setBusy] = useState("");
  const [error, setError] = useState("");
  const [run, setRun] = useState<SpotlightRun | null>(null);
  const [frameIndex, setFrameIndex] = useState(0);
  const [script, setScript] = useState<SpotlightReceipt[]>([]);
  const [scriptError, setScriptError] = useState("");
  const [frameRetry, setFrameRetry] = useState(0);
  const [loaded, setLoaded] = useState<{ key: string; frame: SpotlightFrame | null; error: string }>({ key: "", frame: null, error: "" });
  const [validation, setValidation] = useState<{ key: string; revision: number; result: SpotlightValidation } | null>(null);
  const validationAbort = useRef<AbortController | null>(null);
  const validationContext = useRef("");
  const [testPlaying, setTestPlaying] = useState(false);
  const [testSpeed, setTestSpeed] = useState(1);
  const native = useRef({ allowed: false, ready: false, atEnd: true, speed: 1, advance: async () => false });
  const [playback] = useState(() => new PacedSequencePlayback({
    coordinator, channel: "test",
    allowed: () => native.current.allowed && !lifecycle.paused && document.visibilityState !== "hidden",
    ready: () => native.current.ready,
    atEnd: () => native.current.atEnd,
    advance: () => native.current.advance(),
    paceMs: () => 1000 / native.current.speed,
    suspensionEpoch: () => lifecycle.suspensionEpoch,
    onPlayingChange: setTestPlaying,
    onError: error => setError(errorMessage(error)),
  }));
  useEffect(() => {
    active.current = true;
    pending.current = false;
    setBusy("");
    return () => { active.current = false; pending.current = false; playback.pause(); client?.cancel(); coordinator.unhold("test"); };
  }, [client, playback, coordinator]);
  useEffect(() => {
    if (lifecycle.paused) return;
    const controller = new AbortController();
    const epoch = lifecycle.suspensionEpoch;
    setCapabilityError("");
    void loadRecordingTests(workspaceId, controller.signal).then(tests => {
      if (!controller.signal.aborted && !lifecycle.paused && epoch === lifecycle.suspensionEpoch) {
        const test = tests.find(test => isSpotlightTestId(test.id)
          && test.recordings.some(recording => recording.visualSequenceId === visualSequenceId));
        if (test && isSpotlightTestId(test.id)) {
          const testId = test.id;
          setClient(current => current?.testId === testId ? current : new SpotlightRunClient(workspaceId, visualSequenceId, fetch, testId));
          setRegistered(true);
        } else setRegistered(false);
      }
    }).catch(error => {
      if (!controller.signal.aborted) setCapabilityError(errorMessage(error));
    });
    return () => controller.abort();
  }, [workspaceId, visualSequenceId, lifecycle, metadataRetry]);
  useEffect(() => {
    if (!registered || lifecycle.paused) return;
    const controller = new AbortController();
    setScript([]);
    setScriptError("");
    void loadSpotlightScript(workspaceId, visualSequenceId, controller.signal).then(value => {
      if (!controller.signal.aborted) setScript(value);
    }).catch(error => {
      if (!controller.signal.aborted) setScriptError(errorMessage(error));
    });
    return () => controller.abort();
  }, [registered, workspaceId, visualSequenceId, lifecycle, metadataRetry]);

  const evidence = run?.evidence[frameIndex];
  const frameKey = evidence && run ? `${workspaceId}:${visualSequenceId}:${run.id}:${run.revision}:${evidence.frameId}:${evidence.nativeCheckpointUid}:${evidence.sourceHash}` : "";
  validationContext.current = `${frameKey}:${run?.revision}`;
  useEffect(() => () => validationAbort.current?.abort(), [frameKey, run?.revision, lifecycle]);
  useEffect(() => {
    if (!evidence || !run || !frameKey || lifecycle.paused) return;
    const controller = new AbortController();
    const epoch = lifecycle.suspensionEpoch;
    setLoaded({ key: frameKey, frame: null, error: "" });
    void loadSpotlightFrame(workspaceId, run, evidence, controller.signal).then(frame => {
      if (!controller.signal.aborted && !lifecycle.paused && epoch === lifecycle.suspensionEpoch) setLoaded({ key: frameKey, frame, error: "" });
    }).catch(error => {
      if (!controller.signal.aborted) setLoaded({ key: frameKey, frame: null, error: errorMessage(error) });
    });
    return () => controller.abort();
  }, [workspaceId, frameKey, frameRetry, lifecycle]);

  const frame = frameKey && loaded.key === frameKey ? loaded.frame : null;
  const frameError = frameKey && loaded.key === frameKey ? loaded.error : "";
  const currentValidation = validation?.key === frameKey && validation.revision === run?.revision ? validation.result : null;
  const atEnd = !run || run.progress.processedFrames >= run.progress.totalFrames;
  native.current = {
    allowed: controlsVisible && registered && confirmed && Boolean(run) && !error && !run?.error && !frameError && !scriptError
      && !client?.needsRefresh && canStepSpotlight(run, frame, currentValidation),
    ready: Boolean(run && (run.progress.processedFrames === 0
      || frame?.nativeCheckpointUid === run.evidence[run.progress.processedFrames - 1]?.nativeCheckpointUid)),
    atEnd, speed: testSpeed,
    advance: async () => {
      const result = await perform("step", true);
      return Boolean(result && ["ready", "interrupted"].includes(result.status) && result.progress.processedFrames < result.progress.totalFrames);
    },
  };
  useEffect(() => { playback.notify(); }, [playback, controlsVisible, confirmed, registered, run, error, scriptError, frameError, frame]);
  useEffect(() => { playback.notify(true); }, [playback, testSpeed]);
  useEffect(() => {
    const update = () => playback.notify();
    document.addEventListener("visibilitychange", update);
    return () => { document.removeEventListener("visibilitychange", update); playback.pause(); };
  }, [playback]);

  async function perform(action: "start" | "step" | "refresh" | "stop" | "validate", automatic = false): Promise<SpotlightRun | null> {
    if (!registered || !client || lifecycle.paused || pending.current) return null;
    if (action === "validate" && (!run || !evidence)) return null;
    if (!automatic) { playback.pause(); coordinator.pauseAll(); }
    const hold = coordinator.hold("test");
    pending.current = true;
    const epoch = lifecycle.suspensionEpoch;
    setBusy(action);
    setError("");
    try {
      if (action === "validate" && run && evidence) {
        const controller = new AbortController();
        validationAbort.current = controller;
        const context = validationContext.current;
        setValidation(null);
        const result = await validateSpotlightFrame(workspaceId, run, evidence, frame, controller.signal);
        if (!controller.signal.aborted && active.current && !lifecycle.paused
          && epoch === lifecycle.suspensionEpoch && context === validationContext.current) {
          setValidation({ key: frameKey, revision: run.revision, result });
        }
        return run;
      }
      if (action === "validate") return null;
      const result = await (action === "start" ? client.start(confirmed) : client[action]());
      if (result && active.current && !lifecycle.paused && epoch === lifecycle.suspensionEpoch) {
        setRun(result);
        if (action === "step") {
          native.current.ready = false;
          native.current.atEnd = result.progress.processedFrames >= result.progress.totalFrames;
        }
        if (action === "start") setFrameIndex(0);
        if (action === "step" && result.progress.frameIndex !== null) setFrameIndex(result.progress.frameIndex);
        return result;
      }
    } catch (error) {
      if (active.current && !lifecycle.paused && epoch === lifecycle.suspensionEpoch) setError(errorMessage(error));
    } finally {
      coordinator.unhold("test", hold);
      if (active.current && epoch === lifecycle.suspensionEpoch) { pending.current = false; setBusy(""); }
    }
    return null;
  }
  return {
    registered, testId: client?.testId, capabilityError, retryMetadata: () => setMetadataRetry(value => value + 1),
    confirmed, setConfirmed, busy, error, run, frameIndex, setFrameIndex, script, scriptError,
    evidence, frame, frameError,
    validation: currentValidation,
    retryFrame: () => setFrameRetry(value => value + 1), perform, needsRefresh: client?.needsRefresh === true,
    testPlaying, testSpeed, setTestSpeed, pauseTest: () => playback.pause(),
    playTest: () => {
      if (pending.current || !native.current.allowed || !run) return;
      setFrameIndex(run.progress.frameIndex ?? 0);
      playback.play();
    },
    canPlayTest: native.current.allowed && !atEnd,
  };
}

type Demo = ReturnType<typeof useSpotlightDemo>;

export function SpotlightControls({ demo }: { demo: Demo }) {
  const confirmationId = useId();
  const speedId = useId();
  if (!demo.registered) return demo.capabilityError ? <p role="alert">
    Fog-test availability could not be checked: {demo.capabilityError} <button type="button" onClick={demo.retryMetadata}>Retry tests</button>
  </p> : null;
  const terminal = demo.run && ["completed", "stopped", "stale", "error"].includes(demo.run.status);
  const nextIndex = demo.run?.progress.processedFrames ?? 0;
  return <section className="spotlight-execution-controls" aria-label="Explicit fog-test execution">
    <label htmlFor={confirmationId} className="spotlight-memory-confirmation">
      <input id={confirmationId} type="checkbox" checked={demo.confirmed} disabled={!!demo.busy}
        onChange={event => { demo.pauseTest(); demo.setConfirmed(event.target.checked); }} />
      I confirm writing this test's observations to the shared native frame memory and STM.
    </label>
    <div className="spotlight-execution-toolbar">
      <button type="button" disabled={!demo.confirmed || !!demo.busy || !!demo.run && !terminal}
        onClick={() => void demo.perform("start")}>{demo.busy === "start" ? "Starting…" : demo.run ? "Start new fog run" : "Start fog test"}</button>
      <button type="button" disabled={demo.testPlaying || !!demo.busy || demo.needsRefresh || !canStepSpotlight(demo.run, demo.frame, demo.validation)}
        onClick={() => void demo.perform("step")}>{demo.busy === "step" ? "Observing frame…" : `Step frame ${nextIndex}`}</button>
      <button type="button" aria-pressed={demo.testPlaying} disabled={!demo.testPlaying && (!!demo.busy || !demo.canPlayTest)}
        onClick={() => demo.testPlaying ? demo.pauseTest() : demo.playTest()}>{demo.testPlaying ? "Pause test" : "Play test"}</button>
      <label htmlFor={speedId}>Test speed</label>
      <select id={speedId} value={demo.testSpeed} onChange={event => demo.setTestSpeed(Number(event.target.value))}
        title="UI pacing only; recorded actions and acquisition times are unchanged">
        {[0.5, 1, 2, 4].map(value => <option key={value} value={value}>{value} steps/s</option>)}
      </select>
      <button type="button" disabled={!!demo.busy || !demo.run} onClick={() => void demo.perform("refresh")}>Refresh report</button>
      <button type="button" disabled={!!demo.busy || !demo.evidence || demo.needsRefresh}
        title="Assert full knowledge from this frozen frame and its observed prefix. Does not advance, observe, fill memory or save a report."
        onClick={() => void demo.perform("validate")}>{demo.busy === "validate" ? "Validating knowledge..." : "VALIDATE_MUST_BE_KNOWN"}</button>
      <button type="button" disabled={!!demo.busy || !demo.run || !!terminal} onClick={() => void demo.perform("stop")}>Stop run</button>
    </div>
    {demo.scriptError && <button type="button" onClick={demo.retryMetadata}>Retry recorded script</button>}
  </section>;
}

function NativeCanvas({ frame, mask }: { frame: SpotlightFrame; mask: boolean }) {
  const ref = useRef<HTMLCanvasElement>(null);
  useLayoutEffect(() => {
    const context = ref.current?.getContext("2d");
    if (!context) return;
    const pixels = context.createImageData(frame.width, frame.height);
    pixels.data.set(mask ? frame.unknownMask : frame.rgba);
    context.putImageData(pixels, 0, 0);
  }, [frame, mask]);
  return <FullRasterViewport width={frame.width} height={frame.height}>
    <canvas ref={ref} width={frame.width} height={frame.height} className="spotlight-native-canvas"
      role="img" aria-label={mask ? "Native unknown mask: white is unknown, black is known" : "Reconstructed scene from native observed frame and earlier STM only"} />
  </FullRasterViewport>;
}

export function SpotlightMemoryBoard({ demo, controlsVisible }: { demo: Demo; controlsVisible: boolean }) {
  const [mask, setMask] = useState(false);
  const visibility = demo.frame?.visibility || demo.evidence?.visibility;
  return <figure className="arc3-visual-sequence-figure spotlight-memory-figure">
    <div className="spotlight-board-heading">
      <strong>{mask ? "Unknown mask" : "Remembered scene"}</strong>
      {controlsVisible && <button type="button" aria-pressed={mask} onClick={() => setMask(value => !value)}>
        {mask ? "Show reconstruction" : "Show unknown mask"}
      </button>}
    </div>
    <div className="arc3-visual-sequence-stage">
      {demo.frame ? <NativeCanvas key={`${demo.run?.id}:${demo.evidence?.nativeCheckpointUid}:${mask}`} frame={demo.frame} mask={mask} />
        : <div className="arc3-visual-sequence-message">
          {demo.frameError ? <><p role="alert">{demo.frameError}</p><button type="button" onClick={demo.retryFrame}>Retry native frame</button></>
            : <p role="status">{demo.evidence ? "Loading this frame's bound native checkpoint…" : "No runtime memory for this frame yet. Add controls, confirm native STM, then Start and Step."}</p>}
        </div>}
    </div>
    <figcaption>{visibility
      ? <><span>{visibility.knownPixels} known · {visibility.unknownPixels} unknown · +{visibility.newKnownPixels} newly known</span>
        <progress value={visibility.knownPixels} max={visibility.knownPixels + visibility.unknownPixels} aria-label="Observed scene coverage" /></>
      : <span>No reconstruction inferred or substituted.</span>}</figcaption>
    {demo.frame && <span className="arc3-visual-sequence-note">Full viewport: {demo.frame.width} × {demo.frame.height} px</span>}
    <p className="arc3-visual-sequence-note">{mask ? "White = unknown; black = known. This mask is derived only from native alpha." : "Checkerboard = still unknown. Opaque black is a known black pixel."}</p>
  </figure>;
}

export function SpotlightResults({ demo }: { demo: Demo }) {
  const currentReceipt = demo.frame?.receipt || demo.script[demo.frameIndex];
  const nextIndex = demo.run?.progress.processedFrames ?? 0;
  return <div className="spotlight-runtime-strip" aria-label="Fog runtime status">
    <span title={demo.frame ? "Current native receipt" : "Current recorded script entry; actions are not inferred from identical pixels"}>
      <strong>Current · {demo.frameIndex}:</strong> {spotlightReceiptLabel(currentReceipt)}</span>
    <span><strong>Next Step · {nextIndex}:</strong> {demo.run?.progress.processedFrames === demo.run?.progress.totalFrames
      && demo.run ? "Complete" : spotlightReceiptLabel(demo.script[nextIndex])}</span>
    {demo.run ? <>
      <span role="status"><strong>{demo.run.status}</strong> · {demo.run.progress.processedFrames}/{demo.run.progress.totalFrames}
        · {demo.run.status === "completed" ? `${demo.run.outcome} (selected clip)` : "not scored"}</span>
      {demo.run.error && <span role="alert">{demo.run.error}</span>}
      {(demo.frame?.currentImplementationMatches === false || demo.validation?.currentImplementationMatches === false)
        && <span role="status">Historical checkpoint · {demo.frame?.producingVersion || demo.validation?.producingVersion}.
          {" "}Not current execution; image inspection does not authorize more steps.</span>}
      {demo.validation && <span role="status"><strong>VALIDATE_MUST_BE_KNOWN: {demo.validation.outcome}</strong>
        {" · "}{demo.validation.assessment.replaceAll("_", " ")}
        {demo.validation.knownPixels !== null && <> · {demo.validation.knownPixels} known · {demo.validation.unknownPixels} unknown</>}</span>}
      <details><summary>Native proof / report</summary>
        <code>Run {demo.run.id} · revision {demo.run.revision}</code>
        {demo.run.status === "completed" && <p>{(demo.run.recordingScore || demo.run.score).passed} passed · {(demo.run.recordingScore || demo.run.score).failed} failed
          · {(demo.run.recordingScore || demo.run.score).inconclusive} inconclusive · {(demo.run.recordingScore || demo.run.score).unsupported} unsupported checks.</p>}
        {demo.evidence && <>
        <dl><dt>Frame / acquired</dt><dd>{demo.evidence.frameId} / {demo.evidence.atSeconds}s</dd>
          <dt>Source hash</dt><dd><code>{demo.evidence.sourceHash}</code></dd>
          <dt>Native checkpoint</dt><dd><code>{demo.evidence.nativeCheckpointUid}</code></dd>
          <dt>Frozen frame result</dt><dd><code>{demo.evidence.frameResultRef}</code></dd></dl>
        {demo.frame && <dl><dt>Producing version</dt><dd>{demo.frame.producingVersion || "Version details unavailable"}</dd>
          <dt>STM read boundary</dt><dd>Strictly before frame {demo.frame.readCutoffExclusive}</dd>
          <dt>Actual earlier reads</dt><dd>{!demo.frame.readReceiptsRecorded ? "Not recorded by the historical producer"
            : demo.frame.readRefs.length
            ? demo.frame.readRefs.map(ref => <div key={ref}><code>{ref}</code></div>)
            : "None (initial observation)"}</dd></dl>}
        <ul>{demo.evidence.memoryRefs.map(ref => <li key={ref}><code>{ref}</code></li>)}</ul>
        </>}
        {demo.run.limitations.length > 0 && <ul>{demo.run.limitations.map((item, index) => <li key={index}>{item}</li>)}</ul>}
        {demo.validation && <details><summary>Read-only knowledge assertion</summary>
          <pre style={{ maxHeight: 240, overflow: "auto", whiteSpace: "pre-wrap" }}>{JSON.stringify(demo.validation.proof, null, 2)}</pre>
        </details>}
      </details>
    </> : <span role="status">Not started</span>}
    {demo.error && <span role="alert">{demo.error} {demo.run ? "Refresh report before retrying." : "An interrupted request may already have created a run."}</span>}
    {demo.scriptError && <span role="alert">{demo.scriptError}</span>}
  </div>;
}
