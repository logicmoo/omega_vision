import { useEffect, useMemo, useRef, useState, type ReactNode } from "react";
import { ResourceSourceEditor } from "./ResourceSourceEditor";
import { ShapeObjectInspectorPreview } from "./ShapeObjectInspectorPreview";
import {
  exactReferencedRecord, inspectRecord, objectValue, recordIdentity,
  type InspectorConcept, type InspectorRecord, type InspectorReference, type ShapeReference,
} from "./ShapeObjectInspector.model";
import "../styles/ShapeObjectInspector.css";

export interface ShapeObjectInspectorProps {
  contextKey: string;
  record: InspectorRecord | null;
  concept?: InspectorConcept;
  onSelectVersion?: (record: InspectorRecord) => void;
  onResolveReference?: (reference: ShapeReference, signal: AbortSignal) => Promise<InspectorConcept[]>;
  onNavigate?: (record: InspectorRecord, concept: InspectorConcept) => void;
  renderActions?: (record: InspectorRecord) => ReactNode;
}

function display(value: unknown): string {
  return typeof value === "string" ? value : JSON.stringify(value, null, 2) ?? "Not supplied";
}

export function InspectorProperties({ value, label }: { value: unknown; label: string }) {
  const entries: Array<[string, unknown]> = objectValue(value) ? Object.entries(value) : [["Value", value]];
  return <div className="shape-inspector__scroll" tabIndex={0} role="region" aria-label={label}>
    <table className="shape-inspector__properties"><caption>{label}</caption>
      <tbody>{entries.map(([key, item]) => <tr key={key}><th scope="row">{key}</th><td><pre>{display(item)}</pre></td></tr>)}</tbody>
    </table>
  </div>;
}

function ReferenceDetail({ item, onResolve, onNavigate }: {
  item: InspectorReference;
  onResolve?: ShapeObjectInspectorProps["onResolveReference"];
  onNavigate?: ShapeObjectInspectorProps["onNavigate"];
}) {
  const controller = useRef<AbortController | null>(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");
  const [resolved, setResolved] = useState<{ record: InspectorRecord; concept: InspectorConcept } | null>(null);
  useEffect(() => () => controller.current?.abort(), []);
  const resolve = async () => {
    if (!item.reference || !onResolve) return;
    controller.current?.abort();
    const current = new AbortController();
    controller.current = current;
    setLoading(true); setError(""); setResolved(null);
    try {
      const concepts = await onResolve(item.reference, current.signal);
      current.signal.throwIfAborted();
      setResolved(exactReferencedRecord(concepts, item.reference));
    } catch (failure) {
      if (!current.signal.aborted) setError(failure instanceof Error ? failure.message : String(failure));
    } finally {
      if (!current.signal.aborted) setLoading(false);
    }
  };
  const model = resolved ? inspectRecord(resolved.record) : null;
  return <details className="shape-inspector__reference">
    <summary>{item.reference ? `Shape ${item.reference.recordUid} / ${item.reference.revision}` : "Unresolved shape reference"}</summary>
    <InspectorProperties value={item.value} label="Exact constituent attribution" />
    {item.reason && <p role="status">{item.reason}</p>}
    {item.reference && !onResolve && <p role="status">Reference resolver unavailable in this context.</p>}
    {item.reference && onResolve && <button type="button" disabled={loading} onClick={() => void resolve()}>
      {loading ? "Resolving exact shape..." : "Resolve exact shape"}
    </button>}
    {error && <p role="alert">{error}</p>}
    {resolved && <>
      <p role="status">Resolved exact source revision; no other version substituted.</p>
      {model?.views[0] && <ShapeObjectInspectorPreview key={recordIdentity(resolved.record)}
        geometry={model.views[0].geometry} label={model.title} />}
      {onNavigate && <button type="button" onClick={() => onNavigate(resolved.record, resolved.concept)}>Inspect resolved shape</button>}
    </>}
  </details>;
}

function RecordPanel({ record, onResolveReference, onNavigate }: Pick<ShapeObjectInspectorProps, "onResolveReference" | "onNavigate"> & { record: InspectorRecord }) {
  const model = useMemo(() => inspectRecord(record), [record]);
  const [viewKey, setViewKey] = useState(
    model.format.startsWith("Observed prototype") ? model.views.at(-1)?.key ?? "" : model.views[0]?.key ?? "");
  const view = model.views.find(item => item.key === viewKey) ?? model.views[0];
  const sourceSummary = { stableId: model.stableId ?? "Missing stable payload identity", recordUid: record.recordUid,
    revision: record.revision, memoryKind: record.memoryKind, recordType: record.recordType,
    ...record.source, ...(record.origin !== undefined ? { origin: record.origin } : {}) };
  const historyFields = ["revisions", "compositionHistory", "evidence", "history", "contradictions"];
  const properties = Object.fromEntries(Object.entries(model.properties)
    .filter(([key]) => !["canonicalPoints", "points", "cells", "turtle", "forms", "members", "shapeReferences", ...historyFields].includes(key)));
  return <article className="shape-inspector__record">
    <h4>{model.title}</h4>
    <p><strong>{model.format}</strong> - {model.status}</p>
    {model.notices.map((notice, index) => <p key={index} role="note" className="shape-inspector__notice">{notice}</p>)}
    <InspectorProperties value={sourceSummary} label="Identity and source provenance" />
    {record.memoryKind === "shape" && <>
      {!!model.views.length && <label className="shape-inspector__view-label">Geometry / observed revision
        <select value={view?.key ?? ""} onChange={event => setViewKey(event.target.value)}>
          {model.views.map(item => <option key={item.key} value={item.key}>{item.label}</option>)}
        </select>
      </label>}
      {view ? <>
        <ShapeObjectInspectorPreview key={view.key} geometry={view.geometry} label={`${model.title}: ${view.label}`} />
        <details><summary>Selected geometry properties and evidence</summary>
          <InspectorProperties value={view.properties} label={view.label} />
        </details>
      </> : <p role="status">No supported shape geometry supplied.</p>}
    </>}
    {record.memoryKind === "object" && <section aria-label="Object constituent hierarchy">
      <h5>Constituents ({model.members.length})</h5>
      {!model.members.length && <p role="status">No constituent membership supplied.</p>}
      <ul className="shape-inspector__tree">{model.members.map(member =>
        <li key={member.key}><details>
          <summary>{member.label} ({member.references.length} attributed shape references)</summary>
          <InspectorProperties value={member.properties} label="Member roles, visibility and properties" />
          {!member.references.length && <p role="status">No exact provider-attributed shape reference supplied for this entry.</p>}
          {member.references.map(item => <ReferenceDetail key={item.key} item={item}
            onResolve={onResolveReference} onNavigate={onNavigate} />)}
        </details></li>)}</ul>
    </section>}
    <details><summary>Record properties</summary><InspectorProperties value={properties} label="Stored properties" /></details>
    {historyFields.filter(key => model.properties[key] !== undefined).map(key =>
      <details key={key}><summary>{key} ({Array.isArray(model.properties[key]) ? model.properties[key].length : "stored"})</summary>
        <InspectorProperties value={model.properties[key]} label={`Stored ${key}; not re-evaluated`} />
      </details>)}
    <details><summary>Exact immutable source (JSON / MeTTa)</summary>
      <ResourceSourceEditor value={JSON.stringify(record, null, 2)} onChange={() => undefined}
        contentReadOnly defaultFormat="json" label="Exact memory record and original provenance" />
    </details>
  </article>;
}

function InspectorContext({ record, concept, onSelectVersion, onResolveReference, onNavigate, renderActions }: ShapeObjectInspectorProps & { record: InspectorRecord }) {
  const [compareKey, setCompareKey] = useState("");
  const versions = concept?.versions ?? [record];
  const selectedKey = recordIdentity(record);
  const comparison = versions.find((version, index) => `${index}:${recordIdentity(version)}` === compareKey);
  const preferred = concept && recordIdentity(concept.preferred) === selectedKey;
  return <section className="shape-inspector" aria-label="Shape / Object inspector">
    <div className="shape-inspector__controls">
      <strong>Shape / Object inspector</strong>
      <span>{preferred ? "Preferred source version" : concept ? "Historical / alternative source version" : "Selected source version"}</span>
      {concept?.conflict && <span role="status">Different source revisions - kept separate</span>}
      {renderActions?.(record)}
    </div>
    <div className="shape-inspector__controls">
      <label>Source version
        <select value={selectedKey} disabled={!onSelectVersion} onChange={event => {
          const next = versions.find(version => recordIdentity(version) === event.target.value);
          if (next) onSelectVersion?.(next);
        }}>
          {versions.map((version, index) => <option key={index} value={recordIdentity(version)}>
            {concept && recordIdentity(concept.preferred) === recordIdentity(version) ? "Preferred: " : ""}
            {version.revision} / {version.source.providerRef} / {version.source.workspaceId} / {version.source.memoryLocationId}
          </option>)}
        </select>
      </label>
      <label>Compare source revision
        <select value={compareKey} onChange={event => setCompareKey(event.target.value)}>
          <option value="">No comparison</option>
          {versions.map((version, index) => recordIdentity(version) !== selectedKey &&
            <option key={index} value={`${index}:${recordIdentity(version)}`}>
              {version.revision} / {version.source.providerRef} / {version.source.workspaceId} / {version.source.memoryLocationId}
            </option>)}
        </select>
      </label>
    </div>
    <div className={`shape-inspector__panels${comparison ? " is-comparing" : ""}`}>
      <RecordPanel key={selectedKey} record={record} onResolveReference={onResolveReference} onNavigate={onNavigate} />
      {comparison && <RecordPanel key={recordIdentity(comparison)} record={comparison}
        onResolveReference={onResolveReference} onNavigate={onNavigate} />}
    </div>
  </section>;
}

export function ShapeObjectInspector(props: ShapeObjectInspectorProps) {
  if (!props.record) return <p role="status">Select a Shape or Object record to inspect.</p>;
  return <InspectorContext key={JSON.stringify([props.contextKey, recordIdentity(props.record)])} {...props} record={props.record} />;
}
