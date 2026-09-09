import { useEffect, useRef, useState } from "react";
import { MemorySetup } from "./MemorySetup";
import type { MemoryCatalog, MemoryKind, MemoryPreferences } from "./MemorySetupModel";
import { NOWHERE } from "./MemorySetupModel";
import { memoryRequest, NOWHERE_LIMITS_NOTICE, rotateMemorySession, useMemoryError, useMemoryRevision, useMemorySessionId } from "./MemorySession";
import { ResourceSourceEditor } from "./ResourceSourceEditor";
import { ShapeObjectInspectorBrowser } from "./ShapeObjectInspectorBrowser";

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
type Props = { workspaceId: string; sequenceId: string; active: boolean; sequenceReady?: boolean };
const endpoint = "/workbench/video-import/semantic/memory";

async function request<T>(url: string, signal: AbortSignal, body?: Record<string, unknown>, method = "POST"): Promise<T> {
  if (body && method === "POST") return memoryRequest<T>(url, body, signal, undefined,
    url.endsWith("/read") || url.endsWith("/setup"));
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
  return <MemorySetupContext key={`${props.workspaceId}|${sequenceReady ? props.sequenceId : ""}|${session}`}
    {...props} sequenceId={sequenceReady ? props.sequenceId : ""} sequenceReady={sequenceReady} session={session} />;
}

function MemorySetupContext({ workspaceId, sequenceId, active, sequenceReady, session }: Props & { session: string }) {
  const memoryRevision = useMemoryRevision();
  const memoryError = useMemoryError(workspaceId);
  const contextKey = `${workspaceId}|${sequenceId}|${session}`;
  const controller = useRef(new AbortController());
  const generation = useRef(0);
  const readGeneration = useRef(0);
  const [catalog, setCatalog] = useState<MemoryCatalog | null>(null);
  const [preferences, setPreferences] = useState<MemoryPreferences | null>(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [kind, setKind] = useState<MemoryKind>("shape");
  const [records, setRecords] = useState<MemoryConcept[]>([]);
  const [selected, setSelected] = useState<SavedRecord | null>(null);
  const [reading, setReading] = useState(false);
  const [recordError, setRecordError] = useState("");
  const [recordsOpen, setRecordsOpen] = useState(false);
  const body = { workspaceId, sequenceId: sequenceId || undefined, memorySessionId: session };

  async function refresh(force = false) {
    if (!active || !workspaceId) return;
    const signal = controller.current.signal;
    const current = ++generation.current;
    setLoading(true);
    setError(null);
    try {
      const value = await request<{ catalog: MemoryCatalog; preferences: MemoryPreferences }>(
        `${endpoint}/setup`, signal, { ...body, refresh: force },
      );
      if (current !== generation.current || signal.aborted) return;
      setCatalog(value.catalog);
      setPreferences(value.preferences);
    } catch (failure) {
      if (!signal.aborted && current === generation.current) setError(String(failure));
    } finally {
      if (!signal.aborted && current === generation.current) setLoading(false);
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
    return () => { controller.current.abort(); generation.current += 1; readGeneration.current += 1; };
  }, [active, contextKey]);
  useEffect(() => { void refresh(); }, [memoryRevision]);
  useEffect(() => {
    setRecords([]);
    setSelected(null);
    readGeneration.current += 1;
    setReading(false);
    if (active && recordsOpen) void readRecords();
  }, [active, recordsOpen, kind, preferences?.revision, memoryRevision]);

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
        <button type="button" disabled={loading || !workspaceId} onClick={() => void refresh(true)}>Refresh inspectable areas</button>
        <button type="button" onClick={() => rotateMemorySession()}>Reset Nowhere browser memory</button>
      </div>
    </>}
    {sequenceReady && <MemorySetup contextKey={contextKey} catalog={catalog} preferences={preferences}
      loading={loading} error={error || memoryError} onRefresh={() => refresh(true)}
      onSave={async (next, expectedRevision) => {
        const saved = await request<MemoryPreferences>(`${endpoint}/preferences`, controller.current.signal,
          { ...body, preferences: next, expectedRevision }, "PUT");
        if (!controller.current.signal.aborted) setPreferences(saved);
        return saved;
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
      contextKey={`${contextKey}|${memoryRevision}`}
      catalog={catalog} loading={loading} error={error || memoryError}
      onRead={(memoryKind, locationIds, signal) => request<ReadResult>(
        `${endpoint}/read`, signal, { ...body, kind: memoryKind, locationIds },
      )}
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
