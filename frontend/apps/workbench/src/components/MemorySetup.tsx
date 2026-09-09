import { useEffect, useId, useMemo, useRef, useState } from 'react';
import type { KeyboardEvent } from 'react';
import {
  NOWHERE, addLocations, flattenMemoryTree, memoryTree, preferencesEqual, selectionSummary,
  toggleLocations, triState, visibleWindow,
} from './MemorySetupModel';
import type { MemoryCatalog, MemoryKind, MemoryPreferences, MemorySelection } from './MemorySetupModel';
import '../styles/memory-setup.css';

export interface MemorySetupProps {
  contextKey: string;
  catalog: MemoryCatalog | null;
  preferences: MemoryPreferences | null;
  onSave: (preferences: MemoryPreferences, expectedRevision: string) => Promise<MemoryPreferences>;
  onRefresh: () => Promise<void> | void;
  /** Explicit user action only: copy this kind's volatile records to the selected durable destination. */
  onSaveVolatileCopies?: (kind: MemoryKind, destinationId: string) => Promise<void>;
  /** The parent must also reset its volatile store on reload/session reset. */
  onResetVolatile?: () => Promise<void> | void;
  loading?: boolean;
  error?: string | null;
}

function LookupTree({ kind, catalog, selection, onChange, disabled }: {
  kind: MemoryKind; catalog: MemoryCatalog; selection: MemorySelection;
  onChange: (next: MemorySelection) => void;
  disabled: boolean;
}) {
  const id = useId();
  const [query, setQuery] = useState('');
  const [collapsed, setCollapsed] = useState(new Set<string>());
  const [scrollTop, setScrollTop] = useState(0);
  const [focused, setFocused] = useState<string | null>(null);
  const viewport = useRef<HTMLDivElement>(null);
  const nodes = useMemo(() => memoryTree(catalog.locations, kind, query), [catalog.locations, kind, query]);
  const rows = useMemo(() => flattenMemoryTree(nodes, collapsed, !!query.trim()), [nodes, collapsed, query]);
  const window = visibleWindow(rows.length, scrollTop);
  const shown = nodes.flatMap(node => node.locationIds);
  const summary = selectionSummary(kind, selection, catalog);
  const nowhere = catalog.locations.find(item => item.memoryLocationId === NOWHERE);
  const update = (lookIn: string[]) => { if (!disabled) onChange({ ...selection, lookIn }); };
  const toggleBranch = (nodeId: string) => setCollapsed(previous => {
    const next = new Set(previous);
    if (next.has(nodeId)) next.delete(nodeId); else next.add(nodeId);
    return next;
  });
  const focusRow = (index: number) => {
    const row = rows[index];
    if (!row || !viewport.current) return;
    setFocused(row.node.id);
    const top = index * 36;
    if (top < viewport.current.scrollTop || top + 36 > viewport.current.scrollTop + 288) {
      viewport.current.scrollTop = top;
      setScrollTop(top);
    }
    requestAnimationFrame(() => {
      viewport.current?.querySelector<HTMLElement>(`[data-row="${index}"]`)?.focus();
    });
  };
  const keyboard = (event: KeyboardEvent<HTMLDivElement>, index: number) => {
    const { node, parentId } = rows[index];
    if (event.key === 'ArrowDown') focusRow(Math.min(rows.length - 1, index + 1));
    else if (event.key === 'ArrowUp') focusRow(Math.max(0, index - 1));
    else if (event.key === 'Home') focusRow(0);
    else if (event.key === 'End') focusRow(rows.length - 1);
    else if (event.key === 'ArrowRight' && node.children.length) {
      if (collapsed.has(node.id)) toggleBranch(node.id); else focusRow(index + 1);
    } else if (event.key === 'ArrowLeft') {
      if (node.children.length && !collapsed.has(node.id)) toggleBranch(node.id);
      else if (parentId) focusRow(rows.findIndex(row => row.node.id === parentId));
    } else if (event.key === ' ' || event.key === 'Enter') update(toggleLocations(selection.lookIn, node.locationIds));
    else return;
    event.preventDefault();
  };
  useEffect(() => {
    if (viewport.current) viewport.current.scrollTop = 0;
    setScrollTop(0);
    setFocused(null);
  }, [query, kind]);
  const activeId = rows.some(row => row.node.id === focused) ? focused : rows[0]?.node.id;
  return <div className="memory-setup__lookup">
    <label htmlFor={`${id}-search`}>Look In</label>
    <input id={`${id}-search`} type="search" placeholder="Search providers, scopes or paths"
      value={query} onChange={event => setQuery(event.target.value)} />
    <div className="memory-setup__actions" aria-label={`${kind} lookup choices`}>
      <button type="button" onClick={() => update(addLocations(selection.lookIn, catalog.effective[kind]))}>Effective</button>
      <button type="button" onClick={() => update(addLocations(selection.lookIn, shown))}>All visible</button>
      <button type="button" onClick={() => update([])}>Clear</button>
      {selection.recentLookIn.length > 0 && <button type="button"
        onClick={() => update(addLocations(selection.lookIn, selection.recentLookIn))}>Recent</button>}
      <span>{selection.lookIn.length} selected</span>
    </div>
    <p className="memory-setup__hint">Run → Level → Game → Global. Search keeps hidden selections.</p>
    {rows.length > 0 ? <div ref={viewport} className="memory-setup__tree" role="tree"
      aria-label={`${kind === 'shape' ? 'Shape' : 'Object'} memory locations`} aria-multiselectable="true"
      aria-disabled={disabled || undefined}
      onScroll={event => setScrollTop(event.currentTarget.scrollTop)}>
      <div role="none" style={{ height: rows.length * 36, position: 'relative' }}>
        <div role="none" style={{ position: 'absolute', top: window.offset, width: '100%' }}>
          {rows.slice(window.start, window.end).map(({ node, depth }, offset) => {
            const index = window.start + offset;
            const checked = triState(node.locationIds, selection.lookIn);
            return <div key={node.id} className="memory-setup__row" role="treeitem"
              data-row={index} aria-level={depth + 1} aria-checked={checked}
              aria-expanded={node.children.length ? !collapsed.has(node.id) || !!query.trim() : undefined}
              tabIndex={!disabled && node.id === activeId ? 0 : -1} title={node.location?.pathLabel || node.label}
              style={{ paddingInlineStart: 8 + depth * 14 }}
              onFocus={() => setFocused(node.id)} onKeyDown={event => keyboard(event, index)}
              onClick={() => { setFocused(node.id); update(toggleLocations(selection.lookIn, node.locationIds)); }}>
              {node.children.length > 0 ? <button type="button" className="memory-setup__branch" tabIndex={-1}
                aria-label={`${collapsed.has(node.id) ? 'Expand' : 'Collapse'} ${node.label}`}
                onClick={event => { event.stopPropagation(); toggleBranch(node.id); }}>
                {collapsed.has(node.id) && !query.trim() ? '›' : '⌄'}
              </button> : <span className="memory-setup__branch" aria-hidden="true" />}
              <span className="memory-setup__check" data-checked={checked} aria-hidden="true">
                {checked === 'true' ? '✓' : checked === 'mixed' ? '−' : ''}
              </span>
              <span className="memory-setup__row-label">{node.label}</span>
              <span className="memory-setup__row-count">{node.location ? node.location.counts[kind] : node.locationIds.length}</span>
              {node.location && !node.location.capabilities.write && <span title={node.location.capabilities.reason ?? 'Read-only'}>Read-only</span>}
            </div>;
          })}
        </div>
      </div>
    </div> : <p className="memory-setup__empty">{query ? 'No populated locations match this search.' : 'No populated memory locations are available.'}</p>}
    <label className="memory-setup__nowhere">
      <input type="checkbox" checked={selection.lookIn.includes(NOWHERE)}
        onChange={() => update(toggleLocations(selection.lookIn, [NOWHERE]))} />
      <span><strong>Nowhere</strong> · {nowhere?.counts[kind] ?? 0} session records
        <small>Volatile only. Lost on reload or session reset.</small></span>
    </label>
    {summary.unavailableLocations.length > 0 && <div className="memory-setup__warning" role="status">
      {summary.unavailableLocations.length} selected locations are unavailable. They have not been removed.
      <button type="button" onClick={() => update(selection.lookIn.filter(value => !summary.unavailableLocations.includes(value)))}>
        Remove unavailable selections
      </button>
    </div>}
  </div>;
}

export function MemorySetup(props: MemorySetupProps) {
  const { catalog, contextKey } = props;
  const id = useId();
  const currentContext = useRef(contextKey);
  currentContext.current = contextKey;
  const [base, setBase] = useState(props.preferences);
  const [draft, setDraft] = useState(props.preferences);
  const [pending, setPending] = useState(false);
  const [localError, setLocalError] = useState<string | null>(null);
  const [context, setContext] = useState(contextKey);
  const incomingPreferences = useRef(props.preferences);
  useEffect(() => {
    if (contextKey !== context) {
      setContext(contextKey);
      setBase(props.preferences);
      setDraft(props.preferences);
      setLocalError(null);
      setPending(false);
      incomingPreferences.current = props.preferences;
    } else if (props.preferences !== incomingPreferences.current) {
      incomingPreferences.current = props.preferences;
      if (!props.preferences || props.preferences.revision === base?.revision) return;
      if (base && draft && !preferencesEqual(base, draft)) {
        setLocalError('Preferences changed elsewhere. Refresh and discard local changes before saving.');
      } else {
        setBase(props.preferences);
        setDraft(props.preferences);
      }
    }
  }, [contextKey, context, props.preferences, base, draft]);
  const dirty = !!base && !!draft && !preferencesEqual(base, draft);
  const unavailable = catalog && draft ? (['shape', 'object'] as const).some(kind => {
    const summary = selectionSummary(kind, draft[kind], catalog);
    return summary.unavailableDestination || summary.unavailableLocations.length > 0;
  }) : false;
  const busy = pending || props.loading || contextKey !== context;
  const error = props.error || localError;
  const run = async (operation: () => Promise<void> | void) => {
    const source = contextKey;
    setPending(true);
    setLocalError(null);
    try { await operation(); }
    catch (failure) { if (currentContext.current === source) setLocalError(failure instanceof Error ? failure.message : String(failure)); }
    finally { if (currentContext.current === source) setPending(false); }
  };
  const persist = async (next: MemoryPreferences, disclosureOnly = false) => {
    if (!base) return;
    const source = contextKey;
    const saved = await props.onSave(next, base.revision);
    if (currentContext.current !== source) return;
    setBase(saved);
    setDraft(previous => disclosureOnly && previous ? { ...previous, expanded: saved.expanded, revision: saved.revision } : saved);
  };
  const discard = () => {
    setBase(props.preferences);
    setDraft(props.preferences);
    setLocalError(null);
  };
  return <section className="memory-setup" aria-label="Shape and Object Memory Setup" aria-busy={busy || undefined}>
    <div className="memory-setup__heading">
      <button type="button" className="memory-setup__disclosure" aria-expanded={draft?.expanded ?? false}
        aria-controls={`${id}-content`} disabled={!base || busy}
        onClick={() => {
          if (!base || !draft) return;
          const expanded = !draft.expanded;
          setDraft({ ...draft, expanded });
          void run(() => persist({ ...base, expanded }, true));
        }}>
        <span aria-hidden="true">{draft?.expanded ? '⌄' : '›'}</span>
        <strong>Memory Setup</strong>
      </button>
      <div className="memory-setup__summary">
        {catalog && draft ? (['shape', 'object'] as const).map(kind =>
          <span key={kind}>{selectionSummary(kind, draft[kind], catalog).text}</span>) : <span>Loading memory locations and preferences…</span>}
      </div>
      <span className="memory-setup__status" role="status">{busy ? 'Saving / loading…' : dirty ? 'Unsaved changes' : base ? 'Saved' : 'Not loaded'}</span>
    </div>
    {(error || unavailable || !!catalog?.errors.length) && <div className="memory-setup__warning" role={error ? 'alert' : 'status'}>
      {error || (unavailable ? 'Some selected memory locations or destinations are unavailable. No fallback will be used.' : 'Some providers could not be read. The catalog is incomplete.')}
      {catalog?.errors.map((item, index) => <span key={index}>{item.providerRef ? `${item.providerRef}: ` : ''}{item.message}</span>)}
    </div>}
    <div id={`${id}-content`} hidden={!draft?.expanded} className="memory-setup__content">
      {catalog && draft && <div className="memory-setup__columns">
        {(['shape', 'object'] as const).map(kind => {
          const destination = catalog.destinations.find(item => item.memoryLocationId === draft[kind].saveTo && item.memoryKinds.includes(kind));
          const volatileCount = catalog.locations.find(item => item.memoryLocationId === NOWHERE)?.counts[kind] ?? 0;
          const change = (selection: MemorySelection) => setDraft(previous => previous ? { ...previous, [kind]: selection } : previous);
          return <fieldset key={kind} className="memory-setup__kind" disabled={!!busy}>
            <legend>{kind === 'shape' ? 'Shape Memory' : 'Object Memory'}</legend>
            <label htmlFor={`${id}-${kind}-save`}>Save To</label>
            <select id={`${id}-${kind}-save`} value={draft[kind].saveTo}
              onChange={event => change({ ...draft[kind], saveTo: event.target.value })}>
              {!destination && <option value={draft[kind].saveTo} disabled>Unavailable destination</option>}
              {catalog.destinations.filter(item => item.memoryKinds.includes(kind)).map(item =>
                <option key={item.memoryLocationId} value={item.memoryLocationId} disabled={!item.capabilities.write} title={item.pathLabel}>
                  {item.label}{item.memoryLocationId !== NOWHERE ? ` — ${item.providerLabel} / ${item.workspaceId}` : ' — session only'}
                  {item.memoryLocationId !== NOWHERE && [item.context.gameId, item.context.levelId, item.context.runId].some(Boolean)
                    ? ` / ${[item.context.gameId, item.context.levelId, item.context.runId].filter(Boolean).join(' / ')}` : ''}
                  {!item.capabilities.write ? ' (read-only)' : ''}
                </option>)}
            </select>
            <p className="memory-setup__hint" title={destination?.pathLabel}>
              {destination?.capabilities.reason || 'Applies to new saves only. Existing records stay where they are.'}
            </p>
            <LookupTree key={`${contextKey}-${kind}`} kind={kind} catalog={catalog} selection={draft[kind]} onChange={change} disabled={!!busy} />
            {props.onSaveVolatileCopies && volatileCount > 0 && <button type="button"
              disabled={draft[kind].saveTo === NOWHERE || !destination?.capabilities.write || dirty}
              onClick={() => void run(() => props.onSaveVolatileCopies!(kind, draft[kind].saveTo))}>
              Save {volatileCount} session {kind} {volatileCount === 1 ? 'copy' : 'copies'} to {destination?.label ?? 'destination'}
            </button>}
          </fieldset>;
        })}
      </div>}
      <div className="memory-setup__footer">
        <button type="button" disabled={!draft || !dirty || !!busy} onClick={() => {
          if (!draft) return;
          const next = { ...draft };
          for (const kind of ['shape', 'object'] as const) next[kind] = { ...draft[kind],
            recentLookIn: addLocations(draft[kind].lookIn, draft[kind].recentLookIn).slice(0, 20) };
          void run(() => persist(next));
        }}>Save preferences</button>
        <button type="button" disabled={!dirty && !localError || !!busy} onClick={discard}>Discard changes</button>
        <button type="button" disabled={!!busy} onClick={() => void run(props.onRefresh)}>Refresh locations</button>
        {props.onResetVolatile && <button type="button" disabled={!!busy}
          onClick={() => void run(props.onResetVolatile!)}>Clear session memory</button>}
        <span>No memory records are moved by changing these settings.</span>
      </div>
    </div>
  </section>;
}
