import { useEffect, useId, useRef, useState, type KeyboardEvent, type ReactNode } from "react";
import { useMenuSurfaceLifecycle } from "@app/components/MenuVisibilityBoundary";
import type { VisualSequenceCatalogEntry } from "./VideoImportRecordingUrl";
import { FullRasterViewport } from "./FullRasterViewport";
import { PacedSequencePlayback, SequencePlaybackCoordinator } from "./VisualSequencePlayback";
import {
  clampVisualSequenceFrameIndex,
  visualSequenceFrameAssetUrl,
  VisualSequenceFramePager,
  visualSequenceNavigationIndex,
  visualSequencePageOffset,
  type VisualSequenceFramePage,
} from "./Arc3VisualSequencePlayerModel";
import "../styles/arc3_visual_sequence_player.css";

type Props = {
  workspaceId: string;
  sequence: VisualSequenceCatalogEntry;
  onClose: () => void;
  controlsVisible?: boolean;
  frameIndex?: number;
  onFrameIndexChange?: (index: number) => void;
  comparison?: ReactNode;
  playbackCoordinator?: SequencePlaybackCoordinator;
  navigationDisabled?: boolean;
};

type PageState = {
  status: "loading" | "ready" | "error";
  page: VisualSequenceFramePage | null;
  error: string;
};

function message(error: unknown): string {
  return error instanceof Error ? error.message : "Frames could not be loaded. Retry frames.";
}

type Dimensions = { width: number; height: number };
type ImageStatus = "loading" | "ready" | "error";

function StoredFrameImage({ url, label, onDimensions, onStatus }: {
  url: string; label: string; onDimensions: (size: Dimensions) => void; onStatus: (status: ImageStatus) => void;
}) {
  const [attempt, setAttempt] = useState(0);
  return <FrameImageAttempt key={attempt} url={`${url}${attempt ? `&retry=${attempt}` : ""}`}
    label={label} onRetry={() => setAttempt(value => value + 1)} onDimensions={onDimensions} onStatus={onStatus} />;
}

function FrameImageAttempt({ url, label, onRetry, onDimensions, onStatus }: {
  url: string; label: string; onRetry: () => void; onDimensions: (size: Dimensions) => void; onStatus: (status: ImageStatus) => void;
}) {
  const [status, setStatus] = useState<"loading" | "ready" | "error">("loading");
  const [dimensions, setDimensions] = useState<Dimensions | null>(null);
  const reportStatus = useRef(onStatus);
  reportStatus.current = onStatus;
  useEffect(() => {
    reportStatus.current("loading");
    return () => reportStatus.current("loading");
  }, [url]);
  return <>
    {status !== "error" && <FullRasterViewport width={dimensions?.width ?? null} height={dimensions?.height ?? null}>
      <img src={url} alt={label} draggable={false}
        className={`arc3-visual-sequence-image${status === "ready" ? " ready" : ""}`}
        onLoad={event => {
          const size = { width: event.currentTarget.naturalWidth, height: event.currentTarget.naturalHeight };
          setDimensions(size);
          onDimensions(size);
          setStatus("ready");
          onStatus("ready");
        }} onError={() => { setStatus("error"); onStatus("error"); }} />
    </FullRasterViewport>}
    {status === "loading" && <div className="arc3-visual-sequence-message" role="status">Loading image…</div>}
    {status === "error" && <div className="arc3-visual-sequence-message">
      <p role="alert">The stored image could not be displayed. You can retry or browse another frame.</p>
      <button type="button" onClick={onRetry}>Retry image</button>
    </div>}
  </>;
}

export function Arc3VisualSequencePlayer(props: Props) {
  // Remount before rendering a different request context, not after an effect resets stale images.
  const { workspaceId, sequence } = props;
  const identity = JSON.stringify([workspaceId, sequence.id, sequence.visualSequenceId, sequence.dir, sequence.providerRef]);
  return <VisualSequencePlayerSession key={identity} {...props} />;
}

function VisualSequencePlayerSession({ workspaceId, sequence, onClose, controlsVisible = true,
  frameIndex, onFrameIndexChange, comparison, playbackCoordinator, navigationDisabled = false }: Props) {
  const lifecycle = useMenuSurfaceLifecycle();
  const headingId = useId();
  const helpId = useId();
  const scrubberId = useId();
  const speedId = useId();
  const [resource] = useState(() => {
    try { return { pager: new VisualSequenceFramePager(workspaceId, sequence), error: "" }; }
    catch (error) { return { pager: null, error: message(error) }; }
  });
  const [localIndex, setIndex] = useState(0);
  const [retry, setRetry] = useState(0);
  const [sourceSize, setSourceSize] = useState<(Dimensions & { path: string }) | null>(null);
  const [state, setState] = useState<PageState>({ status: "loading", page: null, error: "" });
  const [imageStatus, setImageStatus] = useState<{ path: string; status: ImageStatus }>({ path: "", status: "loading" });
  const [playing, setPlaying] = useState(false);
  const [speed, setSpeed] = useState(1);
  const live = useRef({ enabled: false, ready: false, failed: false, index: 0, total: 0, speed: 1, path: "", move: (_index: number) => {} });
  const [coordinator] = useState(() => playbackCoordinator || new SequencePlaybackCoordinator());
  const [playback] = useState(() => new PacedSequencePlayback({
    coordinator, channel: "frames",
    allowed: () => live.current.enabled && !live.current.failed && !lifecycle.paused && document.visibilityState !== "hidden",
    ready: () => live.current.ready,
    atEnd: () => live.current.index >= live.current.total - 1,
    advance: () => { live.current.move(live.current.index + 1); return true; },
    paceMs: () => 1000 / live.current.speed,
    suspensionEpoch: () => lifecycle.suspensionEpoch,
    onPlayingChange: setPlaying,
  }));
  const pager = resource.pager;
  const index = frameIndex === undefined ? localIndex : clampVisualSequenceFrameIndex(frameIndex, pager?.total ?? 0);
  const offset = visualSequencePageOffset(index);

  useEffect(() => {
    if (!pager || lifecycle.paused) return;
    let cancelled = false;
    const epoch = lifecycle.suspensionEpoch;
    setState({ status: "loading", page: null, error: "" });
    void pager.load(offset).then(page => {
      if (!page || cancelled || lifecycle.paused || epoch !== lifecycle.suspensionEpoch) return;
      setState({ status: "ready", page, error: "" });
    }).catch(error => {
      if (cancelled || lifecycle.paused || epoch !== lifecycle.suspensionEpoch) return;
      setState({ status: "error", page: null, error: message(error) });
    });
    return () => { cancelled = true; pager.cancel(); };
  }, [pager, offset, retry, lifecycle]);

  const total = pager?.total ?? null;
  const frame = state.status === "ready" && state.page?.offset === offset
    ? state.page.frames[index - offset] : undefined;
  const loading = !resource.error && (state.status === "loading"
    || (state.status === "ready" && state.page?.offset !== offset));
  const error = resource.error || state.error;
  const frameLabel = total ? `Frame ${index + 1} of ${total} · index ${index}${index === 0 ? " (baseline)" : ""}` : "";
  live.current = {
    enabled: controlsVisible && !navigationDisabled && !error && (total ?? 0) > 1,
    ready: !loading && Boolean(frame) && imageStatus.path === frame?.path && imageStatus.status === "ready",
    failed: imageStatus.path === frame?.path && imageStatus.status === "error",
    index, total: total ?? 0, speed, path: frame?.path || "", move: next => moveTo(next, false),
  };
  useEffect(() => { playback.notify(); }, [playback, controlsVisible, navigationDisabled, index, frame?.path, loading, error, imageStatus]);
  useEffect(() => { playback.notify(true); }, [playback, speed]);
  useEffect(() => {
    const update = () => playback.notify();
    document.addEventListener("visibilitychange", update);
    return () => { document.removeEventListener("visibilitychange", update); playback.pause(); };
  }, [playback]);

  function moveTo(value: number, manual = true) {
    if (!lifecycle.paused && !navigationDisabled) {
      if (manual) playback.pause();
      const next = clampVisualSequenceFrameIndex(value, total ?? 0);
      if (next !== live.current.index) live.current.ready = false;
      live.current.index = next;
      setIndex(next);
      onFrameIndexChange?.(next);
    }
  }

  function handleKeyDown(event: KeyboardEvent<HTMLElement>) {
    if (!controlsVisible || lifecycle.paused || navigationDisabled || event.altKey || event.ctrlKey || event.metaKey) return;
    const next = visualSequenceNavigationIndex(event.key, index, total ?? 0);
    if (next === null) return;
    event.preventDefault();
    event.stopPropagation();
    moveTo(next);
  }

  function retryFrames() {
    if (!pager || lifecycle.paused) return;
    playback.pause();
    pager.reset();
    setState({ status: "loading", page: null, error: "" });
    setIndex(0);
    onFrameIndexChange?.(0);
    setRetry(value => value + 1);
  }

  return <section className="arc3-visual-sequence-player" tabIndex={0} role="region"
    aria-labelledby={headingId} aria-describedby={helpId} onKeyDown={handleKeyDown}>
    <header className="arc3-visual-sequence-header">
      <div className="arc3-visual-sequence-source">
        <h3 id={headingId}>{sequence.label || "Visual Sequence"}</h3>
        <code>{sequence.id}</code>
      </div>
      {controlsVisible && <button type="button" onClick={() => { playback.pause(); onClose(); }} title="Close this player without ending any game session">
        Close player
      </button>}
    </header>
    <div className={`arc3-visual-sequence-boards${comparison ? " comparing" : ""}`}>
    <figure className="arc3-visual-sequence-figure">
      {comparison && <div className="spotlight-board-heading"><strong>Recorded observation</strong></div>}
      <div className="arc3-visual-sequence-stage" aria-busy={loading}>
        {loading && <div className="arc3-visual-sequence-message" role="status">Loading frame page…</div>}
        {error && <div className="arc3-visual-sequence-message">
          <p role="alert">{error}</p>
          {pager && <button type="button" onClick={retryFrames}>Retry frames</button>}
        </div>}
        {!loading && !error && total === 0 && <div className="arc3-visual-sequence-message">
          <p>No stored image frames were found in this Visual Sequence.</p>
          <button type="button" onClick={retryFrames}>Retry frames</button>
        </div>}
        {!error && frame && pager && <StoredFrameImage key={frame.path}
          url={visualSequenceFrameAssetUrl(workspaceId, pager.sequenceId, frame.path)}
          label={`${frameLabel}: ${frame.label || frame.path}`}
          onDimensions={size => setSourceSize({ ...size, path: frame.path })}
          onStatus={status => {
            if (live.current.path === frame.path) {
              live.current.ready = status === "ready";
              live.current.failed = status === "error";
            }
            setImageStatus({ path: frame.path, status });
          }} />}
      </div>
      <figcaption>
        <span role="status" aria-live="polite">{frameLabel || (total === 0 ? "0 frames" : "Frames not loaded")}</span>
        {sourceSize && sourceSize.path === frame?.path && <span>Full viewport: {sourceSize.width} × {sourceSize.height} px</span>}
        <code>{frame?.label || (frame ? frame.path : "Stored source images")}</code>
      </figcaption>
    </figure>
    {comparison}
    </div>
    {controlsVisible && <div className="arc3-visual-sequence-controls">
      <div className="arc3-visual-sequence-playback-controls">
        <button type="button" aria-pressed={playing} disabled={navigationDisabled || !total || total < 2 || !!error || live.current.failed}
          onClick={() => {
            if (playing) playback.pause();
            else {
              if (total && index === total - 1) moveTo(0, false);
              playback.play();
            }
          }}>{playing ? "Pause frames" : total && index === total - 1 ? "Replay frames" : "Play frames"}</button>
        <label htmlFor={speedId}>Frame speed</label>
        <select id={speedId} value={speed} onChange={event => setSpeed(Number(event.target.value))}
          title="UI pacing only; recorded acquisition times are unchanged">
          {[0.5, 1, 2, 4].map(value => <option key={value} value={value}>{value} frames/s</option>)}
        </select>
        <span>Preview only</span>
      </div>
      <button type="button" onClick={() => moveTo(index - 1)} disabled={navigationDisabled || !total || index === 0}>
        Previous frame
      </button>
      <div className="arc3-visual-sequence-scrubber">
        <label htmlFor={scrubberId}>Frame index</label>
        <input id={scrubberId} type="range" min={0} max={Math.max(0, (total ?? 0) - 1)} step={1}
          value={index} disabled={navigationDisabled || !total || total < 2} aria-valuetext={frameLabel || "No frames"}
          onChange={event => moveTo(Number(event.currentTarget.value))} />
      </div>
      <button type="button" onClick={() => moveTo(index + 1)} disabled={navigationDisabled || !total || index >= total - 1}>
        Next frame
      </button>
    </div>}
    <p id={helpId} className="arc3-visual-sequence-note">
      {sequence.ordered === true ? "Stored sequence order." : "Source order; causal chronology is not verified."}
      {" "}Index 0 is the browsing baseline. No game is required.{" "}
      {controlsVisible ? "Left / Right arrows browse while this player is focused. " : "Add controls to step through the recording. "}
      Checkerboard means transparency, not black.
    </p>
  </section>;
}
