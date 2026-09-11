import { useEffect, useRef, useState, type ReactNode } from "react";
import type { MemoryCatalog } from "./MemorySetupModel";
import { ShapeObjectInspector } from "./ShapeObjectInspector";
import { formatInspectorType, INSPECTOR_KIND_NAMES, isInspectorKind, type InspectorKind } from "./ShapeObjectInspectorTypeDisplay";
import {
  areaIdentity, areaLabel, inspectableAreas, readInspectorArea, recordIdentity, sourceMatchesArea,
  isConfiguredInspectorArea, readConfiguredInspectorArea, resolveConfiguredReference, isAncestorRecord,
  type InspectorArea, type InspectorConcept, type InspectorRead, type InspectorReadResult, type InspectorRecord,
  type InspectorAreaRead, type InspectorAreaReadResult, type InspectorReferenceRead,
} from "./ShapeObjectInspector.model";
import "../styles/ShapeObjectInspector.css";

export interface ShapeObjectInspectorBrowserProps {
  /** Caller/browser-session boundary; changing this also resets the selected area. */
  contextKey: string;
  /** Captured sequence/frame/content revision; changing this reloads contents, not the area choice. */
  readContextKey?: string;
  catalog?: MemoryCatalog | null;
  areas?: ReadonlyArray<InspectorArea>;
  areasRevision?: string | number;
  loading?: boolean;
  error?: string | null;
  onRead?: InspectorRead;
  onInspectArea?: InspectorAreaRead;
  onInspectReference?: InspectorReferenceRead;
  renderActions?: (record: InspectorRecord) => ReactNode;
  sequenceSelector?: ReactNode;
}

type Selection = { record: InspectorRecord; concept: InspectorConcept };
const areaReadable = (area: InspectorArea) => isConfiguredInspectorArea(area) || area.capabilities.read;
const areaDeclaresKind = (area: InspectorArea, kind: InspectorKind) => isConfiguredInspectorArea(area)
  ? area.memoryKinds.includes(kind) || area.plannedMemoryKinds?.includes(kind) === true
  : (kind === "shape" || kind === "object") && area.memoryKinds.includes(kind);

function AreaRecords({ area, kind, contextKey, areas, onRead, onInspectArea, onInspectReference, renderActions }: {
  area: InspectorArea; kind: InspectorKind; areas: ReadonlyArray<InspectorArea>;
} & Pick<ShapeObjectInspectorBrowserProps, "contextKey" | "onRead" | "onInspectArea" | "onInspectReference" | "renderActions">) {
  const read = useRef(onRead);
  read.current = onRead;
  const inspectArea = useRef(onInspectArea);
  inspectArea.current = onInspectArea;
  const inspectReference = useRef(onInspectReference);
  inspectReference.current = onInspectReference;
  const [result, setResult] = useState<InspectorReadResult | InspectorAreaReadResult | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");
  const [reload, setReload] = useState(0);
  const [query, setQuery] = useState("");
  const [selection, setSelection] = useState<Selection | null>(null);
  const [trail, setTrail] = useState<Selection[]>([]);
  const [navigationError, setNavigationError] = useState("");
  const loadedRequest = useRef("");
  const identity = areaIdentity(area);
  useEffect(() => {
    const requestKey = JSON.stringify([reload, identity, kind, contextKey]);
    if (loadedRequest.current === requestKey) return;
    const controller = new AbortController();
    setLoading(true); setResult(null); setError(""); setSelection(null); setTrail([]); setNavigationError("");
    const load = async () => {
      if (isConfiguredInspectorArea(area)) {
        if (!inspectArea.current) throw new Error("Configured-area inspection transport is unavailable. No catalog fallback was used.");
        return readConfiguredInspectorArea(inspectArea.current, area, kind, controller.signal);
      }
      if (!read.current || (kind !== "shape" && kind !== "object")) throw new Error("Legacy catalog inspection is unavailable for this kind.");
      const value = await readInspectorArea(read.current, kind, [area.memoryLocationId], controller.signal);
      if (value.records.some(concept => concept.versions.some(record => !sourceMatchesArea(record.source, area)))) {
        throw new Error("The returned records do not belong to the selected provider/location.");
      }
      return value;
    };
    void load().then(value => {
      controller.signal.throwIfAborted();
      setResult(value);
      loadedRequest.current = requestKey;
    }).catch(failure => {
      if (!controller.signal.aborted) setError(failure instanceof Error ? failure.message : String(failure));
    }).finally(() => { if (!controller.signal.aborted) setLoading(false); });
    return () => controller.abort();
  }, [reload, identity, kind, contextKey]);
  const configuredResult = result && "status" in result ? result : null;
  const unavailable = configuredResult?.status === "unavailable";
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
      <span role="status">{loading ? "Loading area records..." : unavailable || error ? "Area contents unavailable"
        : result?.errors.length ? "Some area reads failed" : `${filtered.length} of ${concepts.length} concepts`}</span>
    </div>
    {error && <p role="alert">{error}</p>}
    {unavailable && <p role="status">{configuredResult.message || "The selected area is unavailable in this context."}
      {configuredResult.reasonCode && <> ({configuredResult.reasonCode})</>}</p>}
    {configuredResult?.policyNotes?.map((note, index) => <p key={index} role="note">{note}</p>)}
    {result?.errors.map((item, index) => <p key={index} role="alert">Area read unavailable: {item.message}</p>)}
    {!loading && !unavailable && !error && !result?.errors.length && !concepts.length && <p role="status">This area contains no {kind} records.</p>}
    {!!configuredResult?.authorizedSources.length && <details>
      <summary>Authorized physical sources ({configuredResult.authorizedSources.length})</summary>
      <div className="shape-inspector__scroll" tabIndex={0} role="region" aria-label="Actual memory sources">
        <ul>{configuredResult.authorizedSources.map((source, index) => <li key={`${source.providerRef}:${source.memoryLocationId}:${source.memoryKind}:${index}`}>
          <code>{source.providerRef} / {source.memoryLocationId} / {formatInspectorType(source.memoryKind)}</code>
          {(source.path || source.pathLabel) && <div>{source.path || source.pathLabel}</div>}
          {source.format && <div>{source.format}</div>}
        </li>)}</ul>
      </div>
      <p role="note">Normalized JSON and converted MeTTa are projections. Original stored MeTTa is shown only when the API supplies the selected document.</p>
    </details>}
    {!!concepts.length && !filtered.length && <p role="status">No records match the filter. Clear it to show all records.</p>}
    {!!filtered.length && <div className="shape-inspector__scroll" tabIndex={0} role="region" aria-label="Inspectable records">
      <table className="shape-inspector__catalog"><caption>Actual stored records; versions and providers are never merged</caption>
        <thead><tr><th scope="col">Identity</th><th scope="col">Type</th><th scope="col">Provider / workspace provenance</th><th scope="col">Versions</th></tr></thead>
        <tbody>{filtered.map((concept, index) => <tr key={`${concept.conceptUid}:${index}`}>
          <td title={concept.preferred.recordUid}>{formatInspectorType(concept.preferred.memoryKind, concept.preferred.payload.alias)}
            {" / "}{String(concept.preferred.payload.name ?? concept.preferred.payload.uid ?? concept.preferred.recordUid)}</td>
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
      {navigationError && <p role="status">{navigationError}</p>}
      <div className="shape-inspector__controls">
        {!!trail.length && <button type="button" onClick={() => {
          setSelection(trail.at(-1) ?? null); setTrail(items => items.slice(0, -1)); setNavigationError("");
        }}>Back to previous record</button>}
        <button type="button" onClick={() => { setSelection(null); setTrail([]); }}>Close inspector record</button>
      </div>
      <ShapeObjectInspector contextKey={contextKey} record={selection.record} concept={selection.concept}
        renderActions={renderActions}
        onSelectVersion={record => { setSelection({ record, concept: selection.concept }); setNavigationError(""); }}
        onNavigate={(record, concept) => {
          if (isAncestorRecord([...trail.map(item => item.record), selection.record], record)) {
            setNavigationError("This exact physical version is already an ancestor. Use Back to previous record rather than expanding a cycle.");
            return;
          }
          setNavigationError(""); setTrail(items => [...items, selection]); setSelection({ record, concept });
        }}
        onResolveReference={async (reference, signal) => {
          if (isConfiguredInspectorArea(area)) {
            return resolveConfiguredReference(area, areas, reference, inspectArea.current, inspectReference.current, signal);
          }
          const source = areas.find(location => sourceMatchesArea(reference, location));
          if (!source || isConfiguredInspectorArea(source) || !source.capabilities.read || !source.memoryKinds.includes("shape")) {
            throw new Error("Unresolved reference: its exact shape area is unavailable in the authorized catalog.");
          }
          if (!read.current) throw new Error("Legacy catalog reference transport is unavailable.");
          const response = await readInspectorArea(read.current, "shape", [source.memoryLocationId], signal);
          if (response.errors.length) throw new Error(response.errors.map(item => item.message).join("; "));
          return response.records;
        }}
      />
    </div>}
  </div>;
}

function BrowserContext({ contextKey, readContextKey, catalog, areas: configuredAreas, areasRevision, loading, error, onRead, onInspectArea, onInspectReference, renderActions, sequenceSelector }: ShapeObjectInspectorBrowserProps) {
  const [areaKey, setAreaKey] = useState("");
  const [kind, setKind] = useState<InspectorKind>("shape");
  const areas: ReadonlyArray<InspectorArea> = configuredAreas ?? inspectableAreas(catalog ?? null);
  const metadataAvailable = configuredAreas !== undefined || Boolean(catalog);
  const area = areas.find(location => areaIdentity(location) === areaKey);
  const selectionContext = JSON.stringify([contextKey, readContextKey ?? ""]);
  return <section className="shape-inspector shape-inspector__browser" aria-label="Browse Shape / Object memory">
    <h3>Shape / Object memory inspector</h3>
    {sequenceSelector}
    <p>Browse an inspectable area without changing Save To or Look In. Inspection is read-only; it runs no extraction, induction or model calls.</p>
    {configuredAreas?.some(isConfiguredInspectorArea) && <p role="note">
      Shape and Object record adapters are available. Group/class and recursive composition payload renderers remain unavailable; typed references do not supply missing schemas.
      A (Objects articulated) is a planned structured whole of one or more Objects, not a joint-only relation or arbitrary collection. No whole or unseen parts are inferred here.
    </p>}
    <div className="shape-inspector__controls">
      <label>Inspectable area
        <select value={areaKey} disabled={!metadataAvailable} onChange={event => {
          const next = areas.find(location => areaIdentity(location) === event.target.value);
          setAreaKey(event.target.value);
          if (next && !areaDeclaresKind(next, kind)) {
            if (next.memoryKinds.includes("shape")) setKind("shape");
            else if (next.memoryKinds.includes("object")) setKind("object");
          }
        }}>
          <option value="">Select an inspectable area</option>
          {areaKey && !area && <option value={areaKey}>Previously selected area is unavailable</option>}
          {areas.map((location, index) => <option key={`${areaIdentity(location)}:${index}`} value={areaIdentity(location)}
            disabled={!areaReadable(location)}>
            {areaLabel(location)}{!isConfiguredInspectorArea(location) && !location.capabilities.read ? ` - unavailable: ${location.capabilities.reason ?? "read not authorized"}` : ""}
          </option>)}
        </select>
      </label>
      <label>Record kind <select value={area && !areaDeclaresKind(area, kind) ? "" : kind}
        disabled={!area} onChange={event => {
        if (isInspectorKind(event.target.value)) setKind(event.target.value);
      }}>
        {area && !areaDeclaresKind(area, kind) && <option value="">Unsupported kind schema</option>}
        {Object.keys(INSPECTOR_KIND_NAMES).filter(isInspectorKind).map(value => <option key={value} value={value}
          disabled={!area || !areaDeclaresKind(area, value)}>
          {formatInspectorType(value)}{value !== "shape" && value !== "object" ? " (schema unavailable)" : ""}
        </option>)}
      </select></label>
    </div>
    {loading && <p role="status">Loading authorized inspectable areas...</p>}
    {error && <p role="alert">{error}</p>}
    {catalog?.errors.map((item, index) => <p key={index} role="alert">
      Catalog area unavailable: {item.providerRef} / {item.workspaceId} / {item.memoryLocationId}: {item.message}
    </p>)}
    {!loading && !metadataAvailable && !error && <p role="status">Inspectable area metadata is unavailable.</p>}
    {!loading && metadataAvailable && !areas.length && <p role="status">No inspectable areas are configured.</p>}
    {!loading && !areaKey && !!areas.length && <p role="status">Select an area to load its real shapes or objects.</p>}
    {areaKey && !area && <p role="status">The selected area is no longer available. No records from the previous area are retained.</p>}
    {area && <>
      {isConfiguredInspectorArea(area)
        ? <p className="shape-inspector__area-path">{area.registeredPath || area.areaId}{area.format && <> / {area.format}</>}</p>
        : <p className="shape-inspector__area-path">{area.pathLabel} / {area.format} / {area.scopeKind}</p>}
      {(isConfiguredInspectorArea(area) || area.availability === "not_loaded") && <p>Configured area. Existence and record counts are unknown until its contents are read.</p>}
      {(isConfiguredInspectorArea(area) ? area.areaType === "session" : area.scopeKind === "volatile") && <p role="note">Nowhere holds only current browser RAM. Reload/session reset clears it. Browsing does not persist records or selection.</p>}
      {!isConfiguredInspectorArea(area) && !area.capabilities.read && <p role="status">Area unavailable: {area.capabilities.reason ?? "read not authorized"}</p>}
      {!areaDeclaresKind(area, kind) && <p role="status">This area does not declare {kind} records.</p>}
      {area.memoryKinds.some(value => value !== "shape" && value !== "object") && <p role="status">
        Unsupported record kinds remain declared: {area.memoryKinds.filter(value => value !== "shape" && value !== "object").join(", ")}.
      </p>}
    </>}
    {area && areaReadable(area) && areaDeclaresKind(area, kind) &&
      <AreaRecords key={JSON.stringify([areaKey, kind, selectionContext, areasRevision ?? catalog?.revision])} contextKey={selectionContext}
        area={area} kind={kind} areas={areas} onRead={onRead} onInspectArea={onInspectArea}
        onInspectReference={onInspectReference} renderActions={renderActions} />}
  </section>;
}

export function ShapeObjectInspectorBrowser(props: ShapeObjectInspectorBrowserProps) {
  return <BrowserContext key={props.contextKey} {...props} />;
}
