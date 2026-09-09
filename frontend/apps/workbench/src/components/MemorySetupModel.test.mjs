import assert from 'node:assert/strict';
import test from 'node:test';
import {
  NOWHERE, addLocations, flattenMemoryTree, memoryTree, preferencesEqual,
  selectionSummary, toggleLocations, triState, visibleWindow,
} from './MemorySetupModel.ts';

function location(id, overrides = {}) {
  return { memoryLocationId: id, providerRef: 'provider', workspaceId: 'workspace',
    providerLabel: 'Local files', label: id, scopeKind: 'run',
    context: { gameId: 'game', levelId: '1', runId: 'run' },
    memoryKinds: ['shape'], pathLabel: `authorized\\${id}`, format: 'memory_json',
    capabilities: { read: true, write: true, reason: null }, counts: { shape: 2, object: 0 },
    revision: 'revision', ...overrides };
}

test('search tree preserves hierarchy and does not conflate provider identities', () => {
  const roots = memoryTree([location('a'), location('b', { providerRef: 'remote' })], 'shape');
  assert.equal(roots.length, 2);
  assert.notEqual(roots[0].id, roots[1].id);
  assert.deepEqual(roots.map(root => root.locationIds), [['a'], ['b']]);
  assert.equal(memoryTree([location('a')], 'object').length, 0);
});

test('filtered branch toggles preserve hidden, unavailable and Nowhere selections', () => {
  const tree = memoryTree([location('visible'), location('hidden')], 'shape', 'visible');
  const selected = ['hidden', 'lost-store', NOWHERE];
  assert.deepEqual(toggleLocations(selected, tree[0].locationIds), [NOWHERE, 'hidden', 'lost-store', 'visible'].sort());
  assert.deepEqual(toggleLocations([...selected, 'visible'], tree[0].locationIds), selected.sort());
});

test('tri-state parents reflect exactly their visible descendants', () => {
  assert.equal(triState(['a', 'b'], []), 'false');
  assert.equal(triState(['a', 'b'], ['a']), 'mixed');
  assert.equal(triState(['a', 'b'], ['a', 'b']), 'true');
  assert.equal(triState([], []), 'false');
});

test('effective and all-visible selection are additive with explicit clear possible', () => {
  assert.deepEqual(addLocations([NOWHERE, 'remote'], ['run', 'level', 'game', 'global']), [NOWHERE, 'remote', 'run', 'level', 'game', 'global'].sort());
  assert.deepEqual(toggleLocations(['a'], ['a']), []);
});

test('Nowhere is a separate always-visible control, not hidden in search trees', () => {
  assert.deepEqual(memoryTree([location(NOWHERE, { scopeKind: 'volatile' })], 'shape', 'no match'), []);
});

test('virtual window is bounded for thousands of memory locations', () => {
  const result = visibleWindow(10000, 3600);
  assert.equal(result.start, 97);
  assert.equal(result.end - result.start, 14);
  assert.equal(result.offset, 3492);
});

test('collapsed tree hides descendants but searching opens matching ancestors', () => {
  const roots = memoryTree([location('a')], 'shape');
  assert.equal(flattenMemoryTree(roots, new Set([roots[0].id])).length, 1);
  assert.equal(flattenMemoryTree(roots, new Set([roots[0].id]), true).length, 6);
});

test('summary exposes unavailable save/lookup state without inventing counts', () => {
  const catalog = { locations: [location('a')], destinations: [location('a')], errors: [], effective: { shape: ['a'], object: [] } };
  const summary = selectionSummary('shape', { saveTo: 'lost', lookIn: ['a', 'gone'], recentLookIn: [] }, catalog);
  assert.equal(summary.unavailableDestination, true);
  assert.deepEqual(summary.unavailableLocations, ['gone']);
  assert.match(summary.text, /2 source records/);
  assert.match(summary.text, /Unavailable/);
});

test('shape preference changes do not mutate object destination or lookup', () => {
  const original = { schemaVersion: 1, expanded: false, revision: 'old',
    shape: { saveTo: 'shape-run', lookIn: ['a'], recentLookIn: [] },
    object: { saveTo: 'object-run', lookIn: ['b'], recentLookIn: [] } };
  const next = { ...original, shape: { ...original.shape, saveTo: NOWHERE } };
  assert.equal(next.object, original.object);
  assert.equal(preferencesEqual(original, next), false);
  assert.equal(preferencesEqual(original, { ...original, revision: 'new' }), true);
});

test('foreign run destination summary retains provider and run identity', () => {
  const other = location('remote-run', { label: 'Run Memory', providerRef: 'remote', providerLabel: 'Other provider' });
  const catalog = { context: { providerRef: 'local', workspaceId: 'workspace' },
    locations: [other], destinations: [other], errors: [], effective: { shape: [], object: [] } };
  const summary = selectionSummary('shape', { saveTo: 'remote-run', lookIn: [], recentLookIn: [] }, catalog);
  assert.match(summary.text, /Run Memory \(run\) — Other provider/);
});
