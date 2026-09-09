import { useEffect, useRef, useState, type ReactNode } from "react";
import type { MemoryCatalog, MemoryKind, MemoryLocation } from "./MemorySetupModel";
import { ShapeObjectInspector } from "./ShapeObjectInspector";
import {
  areaIdentity, areaLabel, inspectableAreas, readInspectorArea, recordIdentity, sourceMatchesArea,
  type InspectorConcept, type InspectorRead, type InspectorReadResult, type InspectorRecord,
} from "./ShapeObjectInspector.model";
import "../styles/ShapeObjectInspector.css";

export interface ShapeObjectInspectorBrowserProps {
  contextKey: string;
  catalog: MemoryCatalog | null;
  loading?: boolean;
  error?: string | null;
  onRead: InspectorRead;
  renderActions?: (record: InspectorRecord) => ReactNode;
}

type Selection = { record: InspectorRecord; concept: InspectorConcept };

function AreaRecords({ area, kind, contextKey, catalog, onRead, renderActions }: {
  area: MemoryLocation; kind: MemoryKind; catalog: MemoryCatalog;
} & Pick<ShapeObjectInspectorBrowserProps, "contextKey" | "onRead" | "renderActions">) {
  const read = useRef(onRead);
  read.current = onRead;
  const [result, setResult] = useState<InspectorReadResult | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");
  const [reload, setReload] = useState(0);
  const [query, setQuery] = useState("");
  const [selection, setSelection] = useState<Selection | null>(null);
  const [trail, setTrail] = useState<Selection[]>([]);
  useEffect(() => {
    const controller = new AbortController();
    setLoading(true); setResult(null); setError(""); setSelection(null); setTrail([]);
    void readInspectorArea(read.current, kind, [area.memoryLocationId], controller.signal).then(value => {
      controller.signal.throwIfAborted();
      if (value.records.some(concept => concept.versions.some(record => !sourceMatchesArea(record.source, area)))) {
        throw new Error("The returned records do not belong to the selected provider/location.");
      }
      setResult(value);
    }).catch(failure => {
      if (!controller.signal.aborted) setError(failure instanceof Error ? failure.message : String(failure));
    }).finally(() => { if (!controller.signal.aborted) setLoading(false); });
    return () => controller.abort();
  }, [reload, area.memoryLocationId, area.providerRef, area.scopeKind, kind]);
  const concepts = result?.records ?? [];
  const filtered = concepts.filter(concept => {
    const search = query.trim().toLocaleLowerCase();
    return !search || concept.versions.some(record =>
      [record.payload.uid, record.payload.name, record.payload.legacyKey, record.recordUid, record.recordType,
        record.revision, record.source.providerRef, record.source.workspaceId, record.source.memoryLocationId]
        .join(" ").toLocaleLowerCase().includes(search));
  });
  return <div className="shape-inspector__area-records">
    <div className="shape-inspector__controls">
      <label>Filter records <input type="search" value={query} onChange={event => setQuery(event.target.value)}
        placeholder="Stable ID, name, type or revision" /></label>
      <button type="button" disabled={loading} onClick={() => {
        setSelection(null); setTrail([]); setReload(value => value + 1);
      }}>Reload area records</button>
      <span role="status">{loading ? "Loading area records..." : `${filtered.length} of ${concepts.length} concepts`}</span>
    </div>
    {error && <p role="alert">{error}</p>}
    {result?.errors.map((item, index) => <p key={index} role="alert">Area read unavailable: {item.message}</p>)}
    {!loading && !error && !result?.errors.length && !concepts.length && <p role="status">This area contains no {kind} records.</p>}
    {!!concepts.length && !filtered.length && <p role="status">No records match the filter. Clear it to show all records.</p>}
    {!!filtered.length && <div className="shape-inspector__scroll" tabIndex={0} role="region" aria-label="Inspectable records">
      <table className="shape-inspector__catalog"><caption>Actual stored records; versions and providers are never merged</caption>
        <thead><tr><th scope="col">Identity</th><th scope="col">Type</th><th scope="col">Provider / workspace provenance</th><th scope="col">Versions</th></tr></thead>
        <tbody>{filtered.map((concept, index) => <tr key={`${concept.conceptUid}:${index}`}>
          <td>{String(concept.preferred.payload.name ?? concept.preferred.payload.uid ?? concept.preferred.recordUid)}</td>
          <td>{concept.preferred.recordType}</td>
          <td>{concept.preferred.source.providerRef} / {concept.preferred.source.workspaceId}</td>
          <td>{concept.conflict && <span>Different source revisions. </span>}
            {concept.versions.map((record, versionIndex) => <button type="button" key={`${recordIdentity(record)}:${versionIndex}`}
              title={`${record.revision} / ${record.source.memoryLocationId}`}
              aria-pressed={selection !== null && recordIdentity(selection.record) === recordIdentity(record)}
              onClick={() => { setSelection({ record, concept }); setTrail([]); }}>
              {recordIdentity(record) === recordIdentity(concept.preferred) ? "Inspect preferred" : `Inspect version ${versionIndex + 1}`}
            </button>)}
          </td>
        </tr>)}</tbody>
      </table>
    </div>}
    {selection && <div className="shape-inspector__selection">
      <div className="shape-inspector__controls">
        {!!trail.length && <button type="button" onClick={() => {
          setSelection(trail.at(-1) ?? null); setTrail(items => items.slice(0, -1));
        }}>Back to previous record</button>}
        <button type="button" onClick={() => { setSelection(null); setTrail([]); }}>Close inspector record</button>
      </div>
      <ShapeObjectInspector contextKey={contextKey} record={selection.record} concept={selection.concept}
        renderActions={renderActions}
        onSelectVersion={record => setSelection({ record, concept: selection.concept })}
        onNavigate={(record, concept) => { setTrail(items => [...items, selection]); setSelection({ record, concept }); }}
        onResolveReference={async (reference, signal) => {
          const source = catalog.locations.find(location => sourceMatchesArea(reference, location));
          if (!source?.capabilities.read || !source.memoryKinds.includes("shape")) {
            throw new Error("Unresolved reference: its exact shape area is unavailable in the authorized catalog.");
          }
          const response = await readInspectorArea(read.current, "shape", [source.memoryLocationId], signal);
          if (response.errors.length) throw new Error(response.errors.map(item => item.message).join("; "));
          return response.records;
        }}
      />
    </div>}
  </div>;
}

function BrowserContext({ contextKey, catalog, loading, error, onRead, renderActions }: ShapeObjectInspectorBrowserProps) {
  const [areaKey, setAreaKey] = useState("");
  const [kind, setKind] = useState<MemoryKind>("shape");
  const areas = inspectableAreas(catalog);
  const area = areas.find(location => areaIdentity(location) === areaKey);
  return <section className="shape-inspector shape-inspector__browser" aria-label="Browse Shape / Object memory">
    <h3>Shape / Object memory inspector</h3>
    <p>Browse an inspectable area without changing Save To or Look In. Inspection is read-only; it runs no extraction, induction or model calls.</p>
    <div className="shape-inspector__controls">
      <label>Inspectable area
        <select value={areaKey} disabled={loading || !catalog} onChange={event => {
          const next = areas.find(location => areaIdentity(location) === event.target.value);
          setAreaKey(event.target.value);
          if (next && !next.memoryKinds.includes(kind)) setKind(next.memoryKinds.includes("shape") ? "shape" : "object");
        }}>
          <option value="">Select an inspectable area</option>
          {areaKey && !area && <option value={areaKey}>Previously selected area is unavailable</option>}
          {areas.map((location, index) => <option key={`${areaIdentity(location)}:${index}`} value={areaIdentity(location)}
            disabled={!location.capabilities.read}>
            {areaLabel(location)}{location.capabilities.read ? "" : ` - unavailable: ${location.capabilities.reason ?? "read not authorized"}`}
          </option>)}
        </select>
      </label>
      <label>Record kind <select value={kind} disabled={!area || loading} onChange={event => {
        if (event.target.value === "shape" || event.target.value === "object") setKind(event.target.value);
      }}>
        <option value="shape" disabled={!area?.memoryKinds.includes("shape")}>Shapes</option>
        <option value="object" disabled={!area?.memoryKinds.includes("object")}>Objects</option>
      </select></label>
    </div>
    {loading && <p role="status">Loading authorized inspectable areas...</p>}
    {error && <p role="alert">{error}</p>}
    {catalog?.errors.map((item, index) => <p key={index} role="alert">
      Catalog area unavailable: {item.providerRef} / {item.workspaceId} / {item.memoryLocationId}: {item.message}
    </p>)}
    {!loading && !catalog && !error && <p role="status">Inspectable area catalog is unavailable.</p>}
    {!loading && catalog && !areas.length && <p role="status">No inspectable areas in the authorized catalog.</p>}
    {!loading && !areaKey && !!areas.length && <p role="status">Select an area to load its real shapes or objects.</p>}
    {areaKey && !area && <p role="status">The selected area is no longer available. No records from the previous area are retained.</p>}
    {area && <>
      <p className="shape-inspector__area-path">{area.pathLabel} / {area.format} / {area.scopeKind}</p>
      {area.scopeKind === "volatile" && <p role="note">Nowhere holds only current browser RAM. Reload/session reset clears it. Browsing does not persist records or selection.</p>}
      {!area.capabilities.read && <p role="status">Area unavailable: {area.capabilities.reason ?? "read not authorized"}</p>}
      {!area.memoryKinds.includes(kind) && <p role="status">This area does not hold {kind} records.</p>}
    </>}
    {area && catalog && !loading && area.capabilities.read && area.memoryKinds.includes(kind) &&
      <AreaRecords key={JSON.stringify([areaKey, kind, catalog.revision])} contextKey={contextKey}
        area={area} kind={kind} catalog={catalog} onRead={onRead} renderActions={renderActions} />}
  </section>;
}

export function ShapeObjectInspectorBrowser(props: ShapeObjectInspectorBrowserProps) {
  return <BrowserContext key={props.contextKey} {...props} />;
}
