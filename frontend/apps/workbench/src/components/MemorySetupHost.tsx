import { useEffect, useRef, useState } from "react";
import { MemorySetup } from "./MemorySetup";
import type { MemoryCatalog, MemoryKind, MemoryPreferences } from "./MemorySetupModel";
import { createMemoryPreferenceRequestGuard, NOWHERE } from "./MemorySetupModel";
import { memoryRequest, NOWHERE_LIMITS_NOTICE, rotateMemorySession, useMemoryError, useMemoryRevision, useMemorySessionId } from "./MemorySession";
import { ResourceSourceEditor } from "./ResourceSourceEditor";
import { ShapeObjectInspectorBrowser } from "./ShapeObjectInspectorBrowser";
import type { InspectorAreasResponse, InspectorAreaReadResult } from "./ShapeObjectInspector.model";
import { VisualSequenceSelector } from "@omega_vision_ui/components/VisualSequenceSelector";
import { useSharedVisualSequenceSelection } from "@omega_vision_ui/components/useSharedVisualSequenceSelection";
import { loadVisualSequenceRecordingContext, type VisualSequenceRecordingContext } from "@omega_vision_ui/components/VisualSequenceRecordingContext";

type SavedRecord = {
  recordUid: string;
  revision: string;
  memoryKind: MemoryKind;
  recordType: string;
  payload: Record<string, unknown>;
  source: { providerRef: string; workspaceId: string; memoryLocationId: string };
};
type MemoryConcept = { conceptUid: string; preferred: SavedRecord; versions: SavedRecord[]; conflict: boolean };
type ReadResult = { records: MemoryConcept[]; errors: Array<{ message: string }> };
type Props = { workspaceId: string; sequenceId: string; frameId?: string; active: boolean; sequenceReady?: boolean };
const endpoint = "/workbench/video-import/semantic/memory";

async function request<T>(url: string, signal: AbortSignal, body?: Record<string, unknown>, method = "POST"): Promise<T> {
  if (body && method === "POST") return memoryRequest<T>(url, body, signal, undefined,
    url.endsWith("/read") || url.endsWith("/setup") || url.endsWith("/inspect-area") || url.endsWith("/inspect-reference"));
  const response = await fetch(url, {
    signal, cache: "no-store", ...(body ? {
      method, headers: { "Content-Type": "application/json" }, body: JSON.stringify(body),
    } : {}),
  });
  const value = await response.json();
  if (!response.ok) throw new Error(typeof value.detail === "string" ? value.detail : JSON.stringify(value.detail ?? value));
  return value as T;
}

export function MemorySetupHost(props: Props) {
  const session = useMemorySessionId(props.workspaceId);
  const sequenceReady = props.sequenceReady ?? Boolean(props.sequenceId);
  return <MemorySetupContext key={`${props.workspaceId}|${session}`}
    {...props} pageSequenceId={props.sequenceId} sequenceId={sequenceReady ? props.sequenceId : ""} sequenceReady={sequenceReady} session={session} />;
}

function MemorySetupContext({ workspaceId, sequenceId, pageSequenceId, frameId, active, sequenceReady, session }: Props & { session: string; pageSequenceId: string }) {
  const memoryRevision = useMemoryRevision();
  const memoryError = useMemoryError(workspaceId);
  const contextKey = `${workspaceId}|${sequenceId}|${frameId || ""}|${session}`;
  const currentContext = useRef(contextKey);
  currentContext.current = contextKey;
  const controller = useRef(new AbortController());
  const preferenceRequests = useRef(createMemoryPreferenceRequestGuard());
  const readGeneration = useRef(0);
  const [catalog, setCatalog] = useState<MemoryCatalog | null>(null);
  const [loadedPreferences, setPreferences] = useState<MemoryPreferences | null>(null);
  const [preferencesContext, setPreferencesContext] = useState("");
  const preferences = preferencesContext === contextKey ? loadedPreferences : null;
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [kind, setKind] = useState<MemoryKind>("shape");
  const [records, setRecords] = useState<MemoryConcept[]>([]);
  const [selected, setSelected] = useState<SavedRecord | null>(null);
  const [reading, setReading] = useState(false);
  const [recordError, setRecordError] = useState("");
  const [recordsOpen, setRecordsOpen] = useState(false);
  const [areas, setAreas] = useState<InspectorAreasResponse | null>(null);
  const [areasLoading, setAreasLoading] = useState(false);
  const [areasError, setAreasError] = useState<string | null>(null);
  const [areasReload, setAreasReload] = useState(0);
  const body = { workspaceId, sequenceId: sequenceId || undefined, frameId: frameId || undefined, memorySessionId: session };
  const sharedSelection = useSharedVisualSequenceSelection(workspaceId, active);
  const pageFrame = pageSequenceId === `data/${sharedSelection.visualSequenceId}` ? frameId : undefined;
  const frameSourceKey = JSON.stringify([workspaceId, sharedSelection.visualSequenceId, pageFrame]);
  const [frameChoice, setFrameChoice] = useState<{ sourceKey: string; frameId?: string } | null>(null);
  const requestedFrame = frameChoice?.sourceKey === frameSourceKey ? frameChoice.frameId : pageFrame;
  const inspectorContextKey = JSON.stringify([workspaceId, sharedSelection.visualSequenceId, requestedFrame, session]);
  const [recordingState, setRecordingState] = useState<{
    key: string; value: VisualSequenceRecordingContext | null; error: string;
  } | null>(null);
  const [contextReload, setContextReload] = useState(0);
  const recordingContext = recordingState?.key === inspectorContextKey ? recordingState.value : null;
  const contextError = recordingState?.key === inspectorContextKey ? recordingState.error : "";
  const inspectorBody = {
    workspaceId, memorySessionId: session, sequenceId: recordingContext?.sequenceId,
    frameId: recordingContext?.selectedFrameId,
  };
  useEffect(() => {
    if (!active || !workspaceId || !sharedSelection.visualSequenceId) return;
    const requestController = new AbortController();
    void loadVisualSequenceRecordingContext(workspaceId, sharedSelection.visualSequenceId, requestedFrame, requestController.signal)
      .then(value => {
        if (!requestController.signal.aborted) setRecordingState({ key: inspectorContextKey, value, error: "" });
      }).catch(failure => {
        if (!requestController.signal.aborted) setRecordingState({ key: inspectorContextKey, value: null, error: String(failure) });
      });
    return () => requestController.abort();
  }, [active, workspaceId, inspectorContextKey, contextReload]);
  const requireAreaContext = (areaId: string) => {
    if (["contextual:scene", "contextual:previous-moment", "contextual:current-moment"].includes(areaId) && !recordingContext) {
      throw new Error(contextError || "Contextual memory unavailable while the recording frame is being validated. Saved-area browsing remains available.");
    }
  };

  useEffect(() => {
    if (!active || !workspaceId) return;
    const requestController = new AbortController();
    setAreasLoading(true);
    setAreasError(null);
    void request<InspectorAreasResponse>(
      `${endpoint}/inspectable-areas?workspaceId=${encodeURIComponent(workspaceId)}`,
      requestController.signal,
    ).then(value => {
      if (requestController.signal.aborted) return;
      if (value.schemaVersion !== 1 || !Array.isArray(value.areas) || typeof value.areasRevision !== "string") {
        throw new Error("Invalid configured memory-area response");
      }
      setAreas(value);
    }).catch(failure => {
      if (!requestController.signal.aborted) setAreasError(String(failure));
    }).finally(() => {
      if (!requestController.signal.aborted) setAreasLoading(false);
    });
    return () => requestController.abort();
  }, [active, workspaceId, areasReload]);

  async function refresh(force = false) {
    if (!active || !workspaceId || !sequenceReady) return;
    const signal = controller.current.signal;
    const current = preferenceRequests.current.beginRead();
    if (current === null) return;
    setLoading(true);
    setError(null);
    try {
      const value = await request<{ catalog: MemoryCatalog; preferences: MemoryPreferences }>(
        `${endpoint}/setup`, signal, { ...body, refresh: force },
      );
      if (!preferenceRequests.current.isCurrent(current) || signal.aborted || currentContext.current !== contextKey) return;
      setCatalog(value.catalog);
      setPreferences(value.preferences);
      setPreferencesContext(contextKey);
    } catch (failure) {
      if (!signal.aborted && preferenceRequests.current.isCurrent(current) && currentContext.current === contextKey) setError(String(failure));
    } finally {
      if (!signal.aborted && preferenceRequests.current.isCurrent(current) && currentContext.current === contextKey) setLoading(false);
    }
  }

  async function readRecords() {
    if (!preferences) return;
    const current = ++readGeneration.current;
    const signal = controller.current.signal;
    setReading(true);
    setRecordError("");
    try {
      const result = await request<ReadResult>(`${endpoint}/read`, signal, {
        ...body, kind, locationIds: preferences[kind].lookIn,
      });
      if (signal.aborted || current !== readGeneration.current) return;
      setRecords(result.records);
      if (result.errors.length) setRecordError(result.errors.map((item) => item.message).join("; "));
    } catch (failure) {
      if (!signal.aborted && current === readGeneration.current) setRecordError(String(failure));
    } finally {
      if (!signal.aborted && current === readGeneration.current) setReading(false);
    }
  }

  useEffect(() => {
    controller.current = new AbortController();
    void refresh();
    return () => { controller.current.abort(); preferenceRequests.current.reset(); readGeneration.current += 1; };
  }, [active, contextKey]);
  useEffect(() => { void refresh(); }, [memoryRevision]);
  useEffect(() => {
    setRecords([]);
    setSelected(null);
    readGeneration.current += 1;
    setReading(false);
    if (active && recordsOpen) void readRecords();
  }, [active, recordsOpen, kind, preferences?.revision, memoryRevision, contextKey]);

  const copy = async (record: SavedRecord, destinationId: string) => {
    await request(`${endpoint}/copy`, controller.current.signal, {
      ...body, kind: record.memoryKind, sourceLocationId: record.source.memoryLocationId,
      recordUid: record.recordUid, destinationId,
    });
  };
  const action = async (operation: () => Promise<void>) => {
    const signal = controller.current.signal;
    setReading(true);
    setRecordError("");
    try {
      await operation();
      if (!signal.aborted) { await refresh(); await readRecords(); }
    } catch (failure) {
      if (!signal.aborted) setRecordError(String(failure));
    } finally {
      if (!signal.aborted) setReading(false);
    }
  };

  return <>
    <p role="note">{NOWHERE_LIMITS_NOTICE}</p>
    {active && !sequenceReady && <>
      <p role="status">Browse authorized memory areas independently of a Visual Sequence.
        Select and validate a sequence to edit its Save To / Look In preferences or save copies.</p>
      <div className="memory-setup__actions">
        <button type="button" disabled={areasLoading || !workspaceId} onClick={() => setAreasReload(value => value + 1)}>Refresh inspectable areas</button>
        <button type="button" onClick={() => rotateMemorySession()}>Reset Nowhere browser memory</button>
      </div>
    </>}
    {sequenceReady && <MemorySetup key={contextKey} contextKey={contextKey} catalog={preferences ? catalog : null} preferences={preferences}
      loading={loading} error={error || memoryError} onRefresh={() => refresh(true)}
      onSave={async (next, expectedRevision) => {
        const signal = controller.current.signal;
        if (signal.aborted || currentContext.current !== contextKey || !preferences) {
          throw new Error("Memory context changed. Load its preferences before saving.");
        }
        const current = preferenceRequests.current.beginSave();
        if (current === null) throw new Error("Memory preferences are already being saved.");
        setLoading(true);
        try {
          const saved = await request<MemoryPreferences>(`${endpoint}/preferences`, signal,
            { ...body, preferences: next, expectedRevision }, "PUT");
          if (!signal.aborted && preferenceRequests.current.isCurrent(current) && currentContext.current === contextKey) {
            setPreferences(saved);
            setPreferencesContext(contextKey);
          }
          return saved;
        } finally {
          if (!signal.aborted && preferenceRequests.current.isCurrent(current) && currentContext.current === contextKey) setLoading(false);
          preferenceRequests.current.finishSave(current);
        }
      }}
      onResetVolatile={async () => {
        rotateMemorySession();
      }}
      onSaveVolatileCopies={async (memoryKind, destinationId) => {
        const result = await request<ReadResult>(`${endpoint}/read`, controller.current.signal, {
          ...body, kind: memoryKind, locationIds: [NOWHERE],
        });
        for (const concept of result.records) for (const version of concept.versions) await copy(version, destinationId);
        await refresh();
      }}
    />}
    {active && <ShapeObjectInspectorBrowser
      contextKey={`${workspaceId}|${session}`}
      readContextKey={`${inspectorContextKey}|${recordingContext?.selectedFrameId ?? "unavailable"}|${memoryRevision}`}
      sequenceSelector={<>
        <VisualSequenceSelector workspaceId={workspaceId} active={active} />
        <div className="shape-inspector__controls">
          <label>Frame <select aria-label="Visual Sequence frame" value={recordingContext?.selectedFrameId ?? requestedFrame ?? ""}
            disabled={!recordingContext} onChange={event => setFrameChoice({ sourceKey: frameSourceKey, frameId: event.target.value })}>
            {!recordingContext && <option value={requestedFrame ?? ""}>{requestedFrame !== undefined ? `${requestedFrame} · unavailable` : "No validated recording frame"}</option>}
            {recordingContext?.frames.map(frame => <option key={frame.frameId} value={frame.frameId}>
              {frame.frameId} · order {frame.frameOrder}{frame.levelId !== null ? ` · level ${frame.levelId}` : " · level unavailable"}
            </option>)}
          </select></label>
          <button type="button" disabled={!sharedSelection.visualSequenceId.startsWith("recordings/")}
            onClick={() => { setFrameChoice({ sourceKey: frameSourceKey }); setContextReload(value => value + 1); }}>Use first manifest frame</button>
          {contextError && <button type="button" onClick={() => setContextReload(value => value + 1)}>Retry recording context</button>}
          {recordingContext && <span>Game {recordingContext.gameId} · {recordingContext.selectedFrameId}
            {requestedFrame === undefined ? " · first explicit manifest frame" : " · explicitly selected frame"}</span>}
        </div>
        {!recordingContext && <p role="status">{contextError || "Contextual memory unavailable until a canonical recording frame is validated."}
          {" "}Noncontextual saved-area browsing does not require a Visual Sequence catalog.</p>}
      </>}
      areas={areas?.areas ?? []} areasRevision={areas?.areasRevision}
      loading={areasLoading} error={areasError || memoryError}
      onRead={(memoryKind, locationIds, signal) => request<ReadResult>(
        `${endpoint}/read`, signal, { ...inspectorBody, kind: memoryKind, locationIds },
      )}
      onInspectArea={(areaId, memoryKind, signal) => {
        requireAreaContext(areaId);
        return request<InspectorAreaReadResult>(`${endpoint}/inspect-area`, signal, { ...inspectorBody, areaId, kind: memoryKind });
      }}
      onInspectReference={(areaId, reference, signal) => {
        requireAreaContext(areaId);
        return request<InspectorAreaReadResult>(`${endpoint}/inspect-reference`, signal, { ...inspectorBody, areaId, reference });
      }}
      renderActions={(record) => <><button type="button"
        disabled={!sequenceReady || reading || !preferences || preferences[record.memoryKind].saveTo === record.source.memoryLocationId}
        onClick={() => void action(async () => {
          if (sequenceReady && preferences) await copy(record, preferences[record.memoryKind].saveTo);
        })}>
        Save copy to selected {record.memoryKind} destination
      </button>{recordError && <p role="alert">{recordError}</p>}</>}
    />}
    {active && sequenceReady && <details className="memory-setup" open={recordsOpen}
      onToggle={(event) => setRecordsOpen(event.currentTarget.open)}>
      <summary>Selected Shape / Object memory · records and history</summary>
      {recordsOpen && <div className="memory-setup__content">
        <div className="memory-setup__actions">
          <label>Memory kind <select value={kind} disabled={reading} onChange={(event) => setKind(event.target.value as MemoryKind)}>
            <option value="shape">Shapes</option><option value="object">Objects</option>
          </select></label>
          <button type="button" disabled={reading || !preferences} onClick={() => void readRecords()}>Refresh selected locations</button>
          <span role="status">{reading ? "Reading memory…" : `${records.length} concepts`}</span>
        </div>
        {recordError && <p role="alert">{recordError}</p>}
        {!records.length && !reading && <p>No records in the selected Look In locations. Run an explicit object/grouping stage, or select a populated location.</p>}
        <div style={{ overflowX: "auto", maxHeight: 360, overflowY: "auto" }}>
          <table><caption>Provider-attributed versions; no source records are merged or overwritten</caption>
            <thead><tr><th>Identity</th><th>Type</th><th>Provider / workspace</th><th>History</th></tr></thead>
            <tbody>{records.map((concept) => <tr key={concept.conceptUid}>
              <td>{String(concept.preferred.payload.uid)}</td><td>{concept.preferred.recordType}</td>
              <td>{concept.preferred.source.providerRef} · {concept.preferred.source.workspaceId}</td>
              <td>{concept.conflict && <span>Different source revisions · </span>}{concept.versions.map((version) =>
                <button type="button" key={`${version.recordUid}:${version.revision}`} onClick={() => setSelected(version)}
                  title={`${version.source.memoryLocationId} · ${version.revision}`}>Inspect {version.revision.slice(0, 10)}</button>)}</td>
            </tr>)}</tbody></table>
        </div>
        {selected && <>
          <div className="memory-setup__actions">
            <strong>Stored record and provenance</strong>
            <button type="button" onClick={() => setSelected(null)}>Close record</button>
            <button type="button" disabled={reading || !preferences || preferences[selected.memoryKind].saveTo === selected.source.memoryLocationId}
              onClick={() => void action(async () => { if (preferences) await copy(selected, preferences[selected.memoryKind].saveTo); })}>
              Save copy to selected {selected.memoryKind} destination
            </button>
          </div>
          {Array.isArray(selected.payload.shapeReferences) && selected.payload.shapeReferences.map((value, index) => {
            const ref = value as SavedRecord["source"] & { recordUid: string; revision: string };
            return <button type="button" key={index} disabled={reading} title={`${ref.providerRef} · ${ref.workspaceId}`}
              onClick={() => void action(async () => {
                const result = await request<ReadResult>(`${endpoint}/read`, controller.current.signal, {
                  ...body, kind: "shape", locationIds: [ref.memoryLocationId],
                });
                const linked = result.records.flatMap((item) => item.versions).find((item) =>
                  item.recordUid === ref.recordUid && item.revision === ref.revision &&
                  item.memoryKind === "shape" && item.source.providerRef === ref.providerRef &&
                  item.source.memoryLocationId === ref.memoryLocationId);
                if (!linked) throw new Error("The exact provider-attributed shape revision is unavailable.");
                setSelected(linked);
              })}>Inspect referenced shape {ref.revision.slice(0, 10)}</button>;
          })}
          <ResourceSourceEditor value={JSON.stringify(selected, null, 2)} onChange={() => undefined}
            contentReadOnly defaultFormat="json" label="Exact memory record, history and attributed shape references" />
        </>}
      </div>}
    </details>}
  </>;
}
