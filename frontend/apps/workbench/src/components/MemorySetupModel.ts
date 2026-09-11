export type MemoryKind = 'shape' | 'object';
export const NOWHERE = 'memory-nowhere';

export interface MemoryLocation {
  memoryLocationId: string;
  providerRef: string;
  workspaceId: string;
  providerLabel: string;
  label: string;
  scopeKind: 'run' | 'level' | 'game' | 'global' | 'volatile';
  context: { gameId: string | null; levelId: string | null; runId: string | null };
  memoryKinds: MemoryKind[];
  pathLabel: string;
  format: string;
  capabilities: { read: boolean; write: boolean; reason: string | null };
  counts: Record<MemoryKind, number>;
  revision: string | null;
}

export interface MemoryCatalog {
  schemaVersion: 1;
  context?: { providerRef: string; workspaceId: string };
  locations: MemoryLocation[];
  destinations: MemoryLocation[];
  effective: Record<MemoryKind, string[]>;
  errors: { memoryLocationId?: string; providerRef?: string; workspaceId?: string; message: string }[];
  revision: string;
}

export interface MemorySelection {
  saveTo: string;
  lookIn: string[];
  recentLookIn: string[];
}

export interface MemoryPreferences {
  schemaVersion: 1;
  expanded: boolean;
  shape: MemorySelection;
  object: MemorySelection;
  revision: string;
}

export function createMemoryPreferenceRequestGuard() {
  let generation = 0;
  let writing = false;
  return {
    beginRead: () => writing ? null : ++generation,
    beginSave: () => {
      if (writing) return null;
      writing = true;
      return ++generation;
    },
    isCurrent: (request: number) => request === generation,
    finishSave: (request: number) => { if (request === generation) writing = false; },
    reset: () => { ++generation; writing = false; },
  };
}

export interface MemoryBranch {
  id: string;
  label: string;
  children: MemoryBranch[];
  locationIds: string[];
  location?: MemoryLocation;
}

export interface MemoryTreeRow {
  node: MemoryBranch;
  depth: number;
  parentId: string | null;
}

export function triState(ids: string[], selected: string[]): 'false' | 'mixed' | 'true' {
  const checked = new Set(selected);
  const count = ids.filter(id => checked.has(id)).length;
  return count === 0 ? 'false' : count === ids.length ? 'true' : 'mixed';
}

export function toggleLocations(selected: string[], ids: string[]): string[] {
  const next = new Set(selected);
  const remove = triState(ids, selected) === 'true';
  ids.forEach(id => remove ? next.delete(id) : next.add(id));
  return [...next].sort();
}

export function addLocations(selected: string[], ids: string[]): string[] {
  return [...new Set([...selected, ...ids])].sort();
}

export function memoryTree(locations: MemoryLocation[], kind: MemoryKind, query = ''): MemoryBranch[] {
  const roots: MemoryBranch[] = [];
  const search = query.trim().toLocaleLowerCase();
  const ordered = [...locations].sort((a, b) => a.memoryLocationId.localeCompare(b.memoryLocationId));
  for (const location of ordered) {
    if (!location.memoryKinds.includes(kind) || location.memoryLocationId === NOWHERE) continue;
    const context = location.context;
    const text = [location.label, location.pathLabel, location.providerLabel, location.providerRef,
      location.workspaceId, context.gameId, context.levelId, context.runId].join(' ').toLocaleLowerCase();
    if (search && !text.includes(search)) continue;
    const segments: [string, string][] = [
      [`provider:${location.providerRef}`, location.providerLabel],
    ];
    if (context.gameId) segments.push([`game:${context.gameId}`, context.gameId]);
    if (context.levelId) segments.push([`level:${context.levelId}`, `Level ${context.levelId}`]);
    if (context.runId) segments.push([`run:${context.runId}`, `Run ${context.runId}`]);
    let siblings = roots;
    let path: string[] = [];
    for (const [key, label] of segments) {
      path = [...path, key];
      const id = JSON.stringify(path);
      let branch = siblings.find(item => item.id === id);
      if (!branch) {
        branch = { id, label, children: [], locationIds: [] };
        siblings.push(branch);
      }
      branch.locationIds.push(location.memoryLocationId);
      siblings = branch.children;
    }
    siblings.push({ id: location.memoryLocationId, label: location.label,
      locationIds: [location.memoryLocationId], children: [], location });
  }
  const sortBranches = (branches: MemoryBranch[]) => {
    branches.sort((a, b) => Number(!a.children.length) - Number(!b.children.length)
      || a.label.localeCompare(b.label) || a.id.localeCompare(b.id));
    branches.forEach(branch => sortBranches(branch.children));
  };
  sortBranches(roots);
  return roots;
}

export function flattenMemoryTree(roots: MemoryBranch[], collapsed: Set<string>, searching = false): MemoryTreeRow[] {
  const rows: MemoryTreeRow[] = [];
  function visit(nodes: MemoryBranch[], depth: number, parentId: string | null) {
    for (const node of nodes) {
      rows.push({ node, depth, parentId });
      if (searching || !collapsed.has(node.id)) visit(node.children, depth + 1, node.id);
    }
  }
  visit(roots, 0, null);
  return rows;
}

export function visibleWindow(count: number, scrollTop: number, height = 288, rowHeight = 36) {
  const start = Math.min(Math.max(0, count - Math.ceil(height / rowHeight)), Math.max(0, Math.floor(scrollTop / rowHeight) - 3));
  return { start, end: Math.min(count, start + Math.ceil(height / rowHeight) + 6), offset: start * rowHeight };
}

export function selectionSummary(kind: MemoryKind, selection: MemorySelection, catalog: MemoryCatalog) {
  const destination = catalog.destinations.find(item =>
    item.memoryLocationId === selection.saveTo && item.memoryKinds.includes(kind));
  const relevant = catalog.locations.filter(item =>
    selection.lookIn.includes(item.memoryLocationId) && item.memoryKinds.includes(kind));
  const unknown = selection.lookIn.filter(id => !relevant.some(item => item.memoryLocationId === id));
  const count = relevant.reduce((sum, item) => sum + item.counts[kind], 0);
  const foreign = destination && catalog.context && destination.providerRef !== catalog.context.providerRef
    && destination.memoryLocationId !== NOWHERE;
  const name = destination ? `${destination.label}${destination.label === 'Run Memory' ? ` (${destination.context.runId})` : ''}${foreign ? ` — ${destination.providerLabel}` : ''}` : 'Unavailable';
  return {
    destination: destination ? name : 'Unavailable destination',
    unavailableDestination: !destination || !destination.capabilities.write,
    unavailableLocations: unknown,
    text: `${kind === 'shape' ? 'Shapes' : 'Objects'} → ${name} · ${relevant.length} locations · ${count} source records`,
  };
}

export function preferencesEqual(a: MemoryPreferences, b: MemoryPreferences): boolean {
  return a.expanded === b.expanded && (['shape', 'object'] as const).every(kind =>
    a[kind].saveTo === b[kind].saveTo
    && JSON.stringify([...a[kind].lookIn].sort()) === JSON.stringify([...b[kind].lookIn].sort())
    && JSON.stringify(a[kind].recentLookIn) === JSON.stringify(b[kind].recentLookIn));
}
