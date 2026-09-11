import type { MemoryCatalog, MemoryKind, MemoryLocation } from "./MemorySetupModel";
import type { RegionPoint } from "@omega_vision_ui/components/VisualRegionHighlightModel";
import { INSPECTOR_RELATIONS, isInspectorKind, isInspectorRelation,
  type InspectorKind, type InspectorRelation } from "./ShapeObjectInspectorTypeDisplay";
export type { InspectorKind, InspectorRelation } from "./ShapeObjectInspectorTypeDisplay";

export interface InspectorSource {
  providerRef: string;
  workspaceId: string;
  memoryLocationId: string;
  scopeKind?: string;
  context?: unknown;
  registeredPath?: string;
}

export interface InspectorRecord {
  recordUid: string;
  revision: string;
  memoryKind: MemoryKind;
  recordType: string;
  payload: Record<string, unknown>;
  source: InspectorSource;
  origin?: unknown;
  originalSource?: {
    format: "metta";
    path: string;
    text: string;
    entryUid: string;
    readOnly: true;
  };
}

export interface InspectorConcept {
  conceptUid: string;
  preferred: InspectorRecord;
  versions: InspectorRecord[];
  conflict: boolean;
}

export interface InspectorReadResult {
  records: InspectorConcept[];
  errors: Array<{ message: string }>;
}

export type InspectorPhysicalArea = Omit<MemoryLocation, "counts" | "revision"> & {
  counts: MemoryLocation["counts"] | null;
  revision: string | null;
  availability?: "not_loaded";
};

export interface InspectorConfiguredArea {
  areaId: string;
  areaType: "contextual" | "session" | "legacy";
  label: string;
  memoryKinds: string[];
  plannedMemoryKinds?: InspectorKind[];
  counts: Record<string, number | null>;
  revision: null;
  loadState: "not_loaded";
  readOnly: true;
  registeredPath?: string;
  format?: string;
}

export type InspectorArea = InspectorPhysicalArea | InspectorConfiguredArea;

export interface InspectorAreasResponse {
  schemaVersion: 1;
  areasRevision: string;
  areas: InspectorConfiguredArea[];
  kindSchemas?: Record<string, unknown>;
  referenceSchema?: Record<string, unknown>;
}

export interface InspectorAuthorizedSource extends Omit<InspectorSource, "workspaceId"> {
  workspaceId?: string;
  memoryKind: InspectorKind;
  capabilities?: { read: boolean; write?: boolean; reason?: string | null };
  pathLabel?: string;
  path?: string | null;
  format?: string;
  registeredPath?: string;
  catalogProviderRef?: string;
}

export interface InspectorAreaReadResult extends InspectorReadResult {
  areaId: string;
  kind: InspectorKind;
  status: "ready" | "unavailable";
  reasonCode?: string | null;
  message?: string;
  authorizedSources: InspectorAuthorizedSource[];
  sources?: unknown[];
  revision: string | null;
  cachePolicy: "no-store";
  policyNotes?: string[];
}

export type InspectorAreaRead = (
  areaId: string, kind: InspectorKind, signal: AbortSignal,
) => Promise<InspectorAreaReadResult>;

export type InspectorReferenceReadResult = InspectorAreaReadResult;

export type InspectorReferenceRead = (
  areaId: string, reference: TypedInspectorReference, signal: AbortSignal,
) => Promise<InspectorReferenceReadResult>;

export type InspectorRead = (
  kind: MemoryKind, locationIds: string[], signal: AbortSignal,
) => Promise<InspectorReadResult>;

export interface TypedInspectorReference extends Omit<InspectorSource, "workspaceId"> {
  workspaceId?: string;
  targetKind: InspectorKind;
  relation: InspectorRelation;
  recordUid: string;
  revision: string;
  memberTrackUid?: string;
  observationUid?: string;
}

export type ShapeReference = TypedInspectorReference & { targetKind: "shape" };
export interface InspectorReference {
  key: string;
  value: unknown;
  reference: ShapeReference | null;
  reason: string | null;
}

export interface InspectorMember {
  key: string;
  label: string;
  properties: unknown;
  references: InspectorReference[];
}

export type ShapePrimitive =
  | { kind: "rect"; x: number; y: number; width: number; height: number; fill: string }
  | { kind: "polygon"; outer: RegionPoint[]; holes: RegionPoint[][]; fill: string };

export interface ShapeGeometry {
  primitives: ShapePrimitive[];
  bounds: { x: number; y: number; width: number; height: number } | null;
  status: "ready" | "missing" | "unsupported";
  description: string;
}

export interface ShapeView {
  key: string;
  label: string;
  geometry: ShapeGeometry;
  properties: unknown;
}

export interface InspectorModel {
  title: string;
  stableId: string | null;
  format: string;
  status: string;
  notices: string[];
  views: ShapeView[];
  members: InspectorMember[];
  properties: Record<string, unknown>;
}

export function objectValue(value: unknown): value is Record<string, unknown> {
  return typeof value === "object" && value !== null && !Array.isArray(value);
}

function text(value: unknown): value is string {
  return typeof value === "string" && value.length > 0;
}

function finite(value: unknown): value is number {
  return typeof value === "number" && Number.isFinite(value);
}

export function stableIdentity(value: unknown): value is string {
  return text(value) && !/^(?:[rsvwgioac]|gc|oc|cc)\d+$/i.test(value);
}

function sourceValue(value: unknown): value is InspectorSource {
  return objectValue(value) && text(value.providerRef) && text(value.workspaceId) && text(value.memoryLocationId);
}

export function isInspectorRecord(value: unknown): value is InspectorRecord {
  return objectValue(value) && stableIdentity(value.recordUid) && text(value.revision)
    && (value.memoryKind === "shape" || value.memoryKind === "object")
    && text(value.recordType) && objectValue(value.payload) && sourceValue(value.source)
    && (value.originalSource === undefined || (objectValue(value.originalSource)
      && value.originalSource.format === "metta" && text(value.originalSource.path)
      && text(value.originalSource.text) && text(value.originalSource.entryUid) && value.originalSource.readOnly === true));
}

export function recordIdentity(record: InspectorRecord): string {
  return referenceIdentity(record.memoryKind, { ...record.source, recordUid: record.recordUid, revision: record.revision });
}

export function referenceIdentity(kind: InspectorKind, reference: { providerRef: string; memoryLocationId: string; recordUid: string; revision: string }): string {
  return JSON.stringify([kind, reference.providerRef, reference.memoryLocationId, reference.recordUid, reference.revision]);
}

export function isAncestorRecord(ancestors: ReadonlyArray<InspectorRecord>, record: InspectorRecord): boolean {
  return ancestors.some(ancestor => recordIdentity(ancestor) === recordIdentity(record));
}
export function areaIdentity(area: InspectorArea): string {
  if (isConfiguredInspectorArea(area)) return JSON.stringify(["configured", area.areaId]);
  return JSON.stringify([area.providerRef, area.memoryLocationId]);
}

export function sourceMatchesArea(source: Pick<InspectorSource, "providerRef" | "memoryLocationId">, area: InspectorArea): boolean {
  if (isConfiguredInspectorArea(area)) return false;
  // Nowhere retains the original provider provenance; exact record resolution still checks it.
  return source.memoryLocationId === area.memoryLocationId
    && (area.scopeKind === "volatile" || source.providerRef === area.providerRef);
}

export function inspectableAreas(catalog: MemoryCatalog | null): MemoryLocation[] {
  return (catalog?.locations ?? []).filter(area =>
    area.memoryKinds.some(kind => kind === "shape" || kind === "object"));
}

export function areaLabel(area: InspectorArea): string {
  if (isConfiguredInspectorArea(area)) {
    return area.areaType === "legacy" ? `Legacy compatibility: ${area.label}` : area.label;
  }
  return [area.label, area.providerRef, area.workspaceId, area.scopeKind,
    area.context.gameId, area.context.levelId, area.context.runId, area.memoryLocationId]
    .filter(Boolean).join(" / ");
}

export function isConfiguredInspectorArea(area: InspectorArea): area is InspectorConfiguredArea {
  return "areaId" in area;
}

export function validateInspectorAreas(value: unknown): InspectorAreasResponse {
  if (!objectValue(value) || value.schemaVersion !== 1 || !text(value.areasRevision)
    || !Array.isArray(value.areas) || !value.areas.every(area =>
      objectValue(area) && text(area.areaId) && text(area.label)
      && ["contextual", "session", "legacy"].includes(String(area.areaType))
      && Array.isArray(area.memoryKinds) && area.memoryKinds.every(text)
      && (area.plannedMemoryKinds === undefined || (Array.isArray(area.plannedMemoryKinds) && area.plannedMemoryKinds.every(isInspectorKind)))
      && objectValue(area.counts) && Object.values(area.counts).every(count => count === null)
      && area.revision === null && area.loadState === "not_loaded" && area.readOnly === true
      && (area.registeredPath === undefined || text(area.registeredPath))
      && (area.format === undefined || text(area.format)))) {
    throw new Error("Malformed configured-area metadata; inspection stopped.");
  }
  if (new Set(value.areas.map(area => area.areaId)).size !== value.areas.length) {
    throw new Error("Configured-area metadata contains duplicate identities; inspection stopped.");
  }
  if ((value.kindSchemas !== undefined && !objectValue(value.kindSchemas))
    || (value.referenceSchema !== undefined && !objectValue(value.referenceSchema))) {
    throw new Error("Malformed configured-area schemas; inspection stopped.");
  }
  return { schemaVersion: 1, areasRevision: value.areasRevision, areas: value.areas,
    ...(objectValue(value.kindSchemas) ? { kindSchemas: value.kindSchemas } : {}),
    ...(objectValue(value.referenceSchema) ? { referenceSchema: value.referenceSchema } : {}) };
}

export function typedReferenceValue(
  value: unknown, sourceKind?: InspectorKind, legacyShape = false,
): TypedInspectorReference | null {
  if (!objectValue(value) || !text(value.providerRef) || !text(value.memoryLocationId)
    || !stableIdentity(value.recordUid) || !text(value.revision)
    || (value.workspaceId !== undefined && !text(value.workspaceId))
    || (value.registeredPath !== undefined && (!text(value.registeredPath)
      || /[\\:]/.test(value.registeredPath) || value.registeredPath.split("/").some(part => !part || part === "." || part === "..")))
    || (value.memberTrackUid !== undefined && !text(value.memberTrackUid))
    || (value.observationUid !== undefined && !text(value.observationUid))) return null;
  const targetKind = legacyShape && value.targetKind === undefined ? "shape" : value.targetKind;
  const relation = legacyShape && value.relation === undefined ? "has_shape" : value.relation;
  if (!isInspectorKind(targetKind) || !isInspectorRelation(relation)
    || (legacyShape && (targetKind !== "shape" || relation !== "has_shape"))) return null;
  const rule = INSPECTOR_RELATIONS[relation];
  if (!rule.targets.includes(targetKind) || (sourceKind !== undefined
    && (!isInspectorKind(sourceKind) || (rule.pairs && rule.pairs[sourceKind] !== targetKind)))) return null;
  return {
    targetKind, relation,
    providerRef: value.providerRef, memoryLocationId: value.memoryLocationId,
    recordUid: value.recordUid, revision: value.revision,
    ...(text(value.workspaceId) ? { workspaceId: value.workspaceId } : {}),
    ...(text(value.registeredPath) ? { registeredPath: value.registeredPath } : {}),
    ...(text(value.memberTrackUid) ? { memberTrackUid: value.memberTrackUid } : {}),
    ...(text(value.observationUid) ? { observationUid: value.observationUid } : {}),
  };
}

export function referenceValue(value: unknown): ShapeReference | null {
  const reference = typedReferenceValue(value);
  return reference?.targetKind === "shape" ? { ...reference, targetKind: "shape" } : null;
}

export function exactReferencedRecord(concepts: InspectorConcept[], reference: TypedInspectorReference): {
  record: InspectorRecord; concept: InspectorConcept;
} {
  if (!typedReferenceValue(reference)) throw new Error("Unresolved reference: explicit valid kind and relation are required.");
  const key = referenceIdentity(reference.targetKind, reference);
  const matches = concepts.flatMap(concept => concept.versions
    .filter(record => recordIdentity(record) === key).map(record => ({ record, concept })));
  if (matches.length !== 1) {
    throw new Error(matches.length
      ? "Ambiguous exact reference: multiple records claim this provider/location/revision."
      : "Unresolved reference: the exact provider/location/kind/record revision is unavailable.");
  }
  return matches[0];
}

/** The caller supplies the existing read-only memory transport, including Nowhere RAM. */
export async function readInspectorArea(
  read: InspectorRead, kind: MemoryKind, locationIds: string[], signal: AbortSignal,
): Promise<InspectorReadResult> {
  signal.throwIfAborted();
  const result = await read(kind, locationIds, signal);
  signal.throwIfAborted();
  validateInspectorRecords(result, kind, record => locationIds.includes(record.source.memoryLocationId));
  return result;
}

function validateInspectorRecords(
  result: unknown, kind: InspectorKind, permitted: (record: InspectorRecord) => boolean,
): void {
  if (!objectValue(result) || !Array.isArray(result.records) || !Array.isArray(result.errors)
    || !result.errors.every(error => objectValue(error) && typeof error.message === "string")
    || !result.records.every(concept => objectValue(concept) && text(concept.conceptUid)
      && typeof concept.conflict === "boolean" && isInspectorRecord(concept.preferred)
      && concept.preferred.memoryKind === kind && permitted(concept.preferred)
      && Array.isArray(concept.versions) && concept.versions.length > 0
      && concept.versions.every(record => isInspectorRecord(record) && record.memoryKind === kind
        && permitted(record))
      && concept.versions.some(record => sameJsonValue(record, concept.preferred)))) {
    throw new Error("Memory read returned malformed or out-of-area records; inspection stopped.");
  }
}

function sameJsonValue(left: unknown, right: unknown): boolean {
  if (left === right) return true;
  if (Array.isArray(left)) return Array.isArray(right) && left.length === right.length
    && left.every((value, index) => sameJsonValue(value, right[index]));
  if (!objectValue(left) || !objectValue(right)) return false;
  const keys = Object.keys(left);
  return keys.length === Object.keys(right).length
    && keys.every(key => Object.hasOwn(right, key) && sameJsonValue(left[key], right[key]));
}

function authorizedSource(value: unknown): value is InspectorAuthorizedSource {
  return objectValue(value) && text(value.providerRef) && text(value.memoryLocationId)
    && (value.workspaceId === undefined || text(value.workspaceId)) && isInspectorKind(value.memoryKind)
    && (value.capabilities === undefined || (objectValue(value.capabilities) && typeof value.capabilities.read === "boolean"))
    && (value.pathLabel === undefined || typeof value.pathLabel === "string")
    && (value.path === undefined || value.path === null || text(value.path))
    && (value.format === undefined || typeof value.format === "string");
}

function validateConfiguredResult(
  result: InspectorAreaReadResult, area: InspectorConfiguredArea, kind: InspectorKind,
): void {
  if (!objectValue(result) || result.areaId !== area.areaId || result.kind !== kind
    || !["ready", "unavailable"].includes(result.status) || result.cachePolicy !== "no-store"
    || !Array.isArray(result.authorizedSources) || !result.authorizedSources.every(authorizedSource)
    || (result.revision !== null && !text(result.revision))
    || (result.reasonCode != null && typeof result.reasonCode !== "string")
    || (result.message !== undefined && typeof result.message !== "string")
    || (result.policyNotes !== undefined && (!Array.isArray(result.policyNotes) || !result.policyNotes.every(text)))) {
    throw new Error("Malformed contextual-area response; inspection stopped.");
  }
  validateInspectorRecords(result, kind, record => result.authorizedSources.some(source =>
    source.capabilities?.read !== false && source.memoryKind === record.memoryKind
    && source.providerRef === record.source.providerRef
    && source.memoryLocationId === record.source.memoryLocationId
    && (!record.originalSource || typeof source.path !== "string" || record.originalSource.path === source.path)));
  if (result.status === "unavailable" && result.records.length) {
    throw new Error("An unavailable area returned records; inspection stopped.");
  }
  if (kind !== "shape" && kind !== "object" && result.status !== "unavailable") {
    throw new Error(`The ${kind} payload schema is unsupported; inspection stopped.`);
  }
}

/** Context and browser RAM remain exclusively in the caller's captured read-only transport. */
export async function readConfiguredInspectorArea(
  read: InspectorAreaRead, area: InspectorConfiguredArea, kind: InspectorKind, signal: AbortSignal,
): Promise<InspectorAreaReadResult> {
  signal.throwIfAborted();
  if (!area.memoryKinds.includes(kind) && !area.plannedMemoryKinds?.includes(kind)) {
    throw new Error("The configured area does not declare this record kind.");
  }
  const result = await read(area.areaId, kind, signal);
  signal.throwIfAborted();
  validateConfiguredResult(result, area, kind);
  return result;
}

export async function readConfiguredInspectorReference(
  read: InspectorReferenceRead, area: InspectorConfiguredArea, reference: TypedInspectorReference, signal: AbortSignal,
): Promise<InspectorReferenceReadResult> {
  signal.throwIfAborted();
  if (!typedReferenceValue(reference)) throw new Error("Invalid typed reference; inspection stopped.");
  const result = await read(area.areaId, reference, signal);
  signal.throwIfAborted();
  validateConfiguredResult(result, area, reference.targetKind);
  validateInspectorRecords(result, reference.targetKind, record =>
    recordIdentity(record) === referenceIdentity(reference.targetKind, reference));
  return result;
}

/** A legacy target is selectable only through an exact registration already supplied by the host. */
export function configuredReferenceArea(
  area: InspectorConfiguredArea, reference: TypedInspectorReference, areas: ReadonlyArray<InspectorArea>,
): InspectorConfiguredArea {
  if (area.areaType !== "legacy" || !reference.registeredPath) return area;
  const matches = areas.filter((candidate): candidate is InspectorConfiguredArea =>
    isConfiguredInspectorArea(candidate) && candidate.areaType === "legacy"
    && candidate.registeredPath === reference.registeredPath);
  if (matches.length !== 1) throw new Error("Unresolved reference: its exact legacy registration is unavailable or ambiguous.");
  return matches[0];
}

export async function resolveConfiguredReference(
  area: InspectorConfiguredArea, areas: ReadonlyArray<InspectorArea>, reference: TypedInspectorReference,
  read: InspectorAreaRead | undefined, readReference: InspectorReferenceRead | undefined, signal: AbortSignal,
): Promise<InspectorConcept[]> {
  signal.throwIfAborted();
  if (!typedReferenceValue(reference)) throw new Error("Invalid typed reference; inspection stopped.");
  let result: InspectorAreaReadResult;
  if (area.areaType !== "legacy") {
    if (!read) throw new Error("Context-safe reference inspection is unavailable. No fallback was used.");
    result = await readConfiguredInspectorArea(read, area, reference.targetKind, signal);
  } else {
    if (!readReference) throw new Error("Exact legacy-reference transport is unavailable. No discovery fallback was used.");
    result = await readConfiguredInspectorReference(readReference,
      configuredReferenceArea(area, reference, areas), reference, signal);
  }
  if (result.status === "unavailable") throw new Error(result.message || result.reasonCode || "Reference context is unavailable.");
  if (result.errors.length) throw new Error(result.errors.map(item => item.message).join("; "));
  exactReferencedRecord(result.records, reference);
  return result.records;
}
function noGeometry(description: string, status: "missing" | "unsupported" = "missing"): ShapeGeometry {
  return { primitives: [], bounds: null, status, description };
}

function point(value: unknown): value is RegionPoint {
  return Array.isArray(value) && value.length === 2 && value.every(finite);
}

function ring(value: unknown): value is RegionPoint[] {
  return Array.isArray(value) && value.length >= 3 && value.every(point);
}

function color(value: unknown, fallback = "#7c9cff"): string | null {
  if (value === undefined) return fallback;
  // Only literal colors: SVG paint URLs and arbitrary CSS/source are not executable inputs.
  if (typeof value !== "string") return null;
  if (/^#(?:[\da-f]{3}|[\da-f]{4}|[\da-f]{6}|[\da-f]{8})$/i.test(value)) return value;
  if (/^(?:transparent|none|black|white|red|green|blue|yellow|cyan|magenta|gray|grey|orange|purple)$/i.test(value)) return value;
  const match = /^rgba?\(([^)]+)\)$/.exec(value);
  if (match) {
    const parts = match[1].split(",").map(part => part.trim());
    const numbers = parts.map(Number);
    const count = value.startsWith("rgba(") ? 4 : 3;
    if (parts.every(part => part.length > 0) && numbers.length === count && numbers.every(Number.isFinite)
      && numbers.slice(0, 3).every(n => n >= 0 && n <= 255)
      && (count === 3 || (numbers[3] >= 0 && numbers[3] <= 1))) return value;
  }
  return null;
}

function geometry(primitives: ShapePrimitive[], description: string): ShapeGeometry {
  if (!primitives.length) return noGeometry(`Empty ${description}.`);
  let x0 = Infinity, y0 = Infinity, x1 = -Infinity, y1 = -Infinity;
  const extend = (x: number, y: number) => {
    x0 = Math.min(x0, x); y0 = Math.min(y0, y);
    x1 = Math.max(x1, x); y1 = Math.max(y1, y);
  };
  for (const primitive of primitives) {
    if (primitive.kind === "rect") {
      extend(primitive.x, primitive.y);
      extend(primitive.x + primitive.width, primitive.y + primitive.height);
    } else {
      primitive.outer.forEach(([x, y]) => extend(x, y));
      primitive.holes.forEach(hole => hole.forEach(([x, y]) => extend(x, y)));
    }
  }
  if (![x0, y0, x1, y1, x1 - x0, y1 - y0].every(Number.isFinite) || x1 <= x0 || y1 <= y0) {
    return noGeometry("Unsupported non-finite or degenerate geometry extents.", "unsupported");
  }
  return { primitives, bounds: { x: x0, y: y0, width: x1 - x0, height: y1 - y0 },
    status: "ready", description };
}

export function pointGeometry(value: unknown, description: string): ShapeGeometry {
  if (!Array.isArray(value) || !value.every(point)) return noGeometry(`Unsupported ${description}: expected [x, y] cells.`, "unsupported");
  return geometry(value.map(([x, y]) => ({ kind: "rect", x, y, width: 1, height: 1, fill: "#7c9cff" })), description);
}

export function turtleGeometry(value: unknown): ShapeGeometry {
  if (typeof value === "string") {
    try { value = JSON.parse(value); }
    catch (error) {
      if (!(error instanceof SyntaxError)) throw error;
      return noGeometry("Unsupported Turtle source: only structured JSON commands are inspected, never executed.", "unsupported");
    }
  }
  if (!objectValue(value) || !Array.isArray(value.commands)) return noGeometry("No structured Turtle commands.", "unsupported");
  const primitives: ShapePrimitive[] = [];
  for (const command of value.commands) {
    if (!objectValue(command)) return noGeometry("Invalid Turtle command.", "unsupported");
    // Generated vocabulary uses move for the pen position; it draws no geometry.
    if (command.op === "move" && finite(command.x) && finite(command.y)) continue;
    if (command.op !== "rectangle" || !Array.isArray(command.box) || command.box.length !== 4
      || !command.box.every(finite)) return noGeometry(`Unsupported Turtle command: ${String(command.op)}. Source retained below.`, "unsupported");
    const [x0, y0, x1, y1] = command.box;
    const fill = color(command.fill);
    if (!fill || x1 <= x0 || y1 <= y0 || (command.outline !== undefined && command.outline !== command.fill && command.outline !== "none")) {
      return noGeometry("Unsupported Turtle fill, outline or rectangle extents.", "unsupported");
    }
    primitives.push({ kind: "rect", x: x0, y: y0, width: x1 - x0, height: y1 - y0, fill });
  }
  return geometry(primitives, "Structured Turtle rectangles; original coordinates");
}

export function payloadGeometry(payload: Record<string, unknown>): ShapeGeometry {
  if (payload.canonicalPoints !== undefined) return pointGeometry(payload.canonicalPoints, "Canonical anchor cells (normalized source)");
  if (payload.cells !== undefined) return pointGeometry(payload.cells, "Source cells");
  if (payload.points !== undefined) return pointGeometry(payload.points, "Observed prototype cells (normalized source)");
  if (payload.turtle !== undefined) return turtleGeometry(payload.turtle);
  const input = objectValue(payload.geometry) ? payload.geometry : payload;
  if (input.pixelRuns !== undefined) {
    if (!Array.isArray(input.pixelRuns) || !input.pixelRuns.every(run =>
      Array.isArray(run) && run.length === 3 && run.every(finite) && run[2] >= run[1])) {
      return noGeometry("Invalid pixel runs: expected [y, x0, x1] inclusive.", "unsupported");
    }
    const fill = color(input.fill);
    if (!fill) return noGeometry("Unsupported pixel-run color.", "unsupported");
    return geometry(input.pixelRuns.map(([y, x0, x1]) =>
      ({ kind: "rect", x: x0, y, width: x1 - x0 + 1, height: 1, fill })), "Pixel runs [y, x0, x1], inclusive");
  }
  if (input.outer !== undefined || input.polygons !== undefined) {
    const polygons = input.outer !== undefined ? [input]
      : Array.isArray(input.polygons) ? input.polygons
        : objectValue(input.polygons) ? Object.values(input.polygons) : null;
    if (!polygons) return noGeometry("Unsupported polygon collection.", "unsupported");
    const primitives: ShapePrimitive[] = [];
    for (const polygon of polygons) {
      if (!objectValue(polygon) || !ring(polygon.outer)
        || (polygon.holes !== undefined && (!Array.isArray(polygon.holes) || !polygon.holes.every(ring)))) {
        return noGeometry("Invalid polygon or hole; refusing a partial drawing.", "unsupported");
      }
      const fill = color(polygon.fill);
      if (!fill) return noGeometry("Unsupported polygon color.", "unsupported");
      primitives.push({ kind: "polygon", outer: polygon.outer, holes: polygon.holes ?? [], fill });
    }
    return geometry(primitives, "Source polygons; even-odd holes and alpha preserved");
  }
  return noGeometry("No supported cell, pixel-run, polygon or structured Turtle geometry in this record.");
}

function facts(payload: Record<string, unknown>, predicate: string): Record<string, unknown>[] {
  return Array.isArray(payload.facts)
    ? payload.facts.filter((fact): fact is Record<string, unknown> =>
      objectValue(fact) && fact.predicate === predicate && Array.isArray(fact.args)) : [];
}

function references(payload: Record<string, unknown>, sourceKind: InspectorKind): InspectorReference[] {
  if (payload.shapeReferences === undefined) return [];
  const values = Array.isArray(payload.shapeReferences) ? payload.shapeReferences : [payload.shapeReferences];
  return values.map((value, index) => {
    const normalized = typedReferenceValue(value, sourceKind, true);
    const reference = normalized?.targetKind === "shape" ? referenceValue(normalized) : null;
    return { key: `reference-${index}`, value, reference, reason: reference ? null
      : "Unresolved: shapeReferences requires shape/has_shape tags (or absent legacy tags), stable provider/location/record/revision, and valid optional provenance." };
  });
}

export function inspectRecord(record: InspectorRecord): InspectorModel {
  const p = record.payload;
  const notices: string[] = [];
  const stableId = stableIdentity(p.uid) ? p.uid : null;
  if (!stableId) notices.push("Missing stable payload identity. Frame-local aliases are labels, not persistent identities.");
  const model: InspectorModel = {
    title: text(p.name) ? p.name : stableId ?? record.recordUid,
    stableId, format: record.recordType, status: text(p.status) ? p.status : "Stored record; no execution or promotion implied",
    notices, views: [], members: [], properties: p,
  };
  const addView = (key: string, label: string, data: Record<string, unknown>) =>
    model.views.push({ key, label, properties: data, geometry: payloadGeometry(data) });
  if (record.source.memoryLocationId === "memory-nowhere" || record.source.scopeKind === "volatile") {
    notices.push("Nowhere: browser RAM only. Reload or session reset clears this record; inspection saves nothing.");
  }
  if (record.memoryKind === "shape") {
    if (p.kind === "shape_point_anchor") {
      model.format = "Immutable shape anchor";
      addView("anchor", "Canonical anchor", p);
      if (objectValue(p.forms)) Object.entries(p.forms).forEach(([name, form], index) => {
        if (objectValue(form)) addView(`form-${index}`, `Form: ${name}`, form);
        else notices.push(`Unsupported anchor form: ${name}.`);
      });
    } else if (p.anchorUid !== undefined && p.revisions !== undefined) {
      model.format = "Observed prototype (not an accepted grouping rule)";
      notices.push(`Anchor reference: ${String(p.anchorUid)}. No provider-attributed revision supplied; not resolved by alias or UID alone.`);
      if (Array.isArray(p.revisions)) p.revisions.forEach((revision, index) => {
        if (objectValue(revision)) addView(`prototype-${index}`, `Observed revision ${String(revision.revision ?? index + 1)} / ${String(revision.uid ?? "missing UID")}`, revision);
        else notices.push(`Unsupported observed revision at position ${index + 1}.`);
      });
      else notices.push("Unsupported prototype revisions: expected a list.");
    } else if (p.legacyKey !== undefined && p.facts !== undefined) {
      model.format = "Legacy shape vocabulary";
      const shapes = facts(p, "shape");
      shapes.forEach((fact, index) => {
        const args = fact.args;
        if (!Array.isArray(args) || args.length !== 3) return;
        if (index === 0 && text(args[1])) model.title = args[1];
        model.views.push({ key: `legacy-${index}`, label: String(args[1]), properties: fact, geometry: turtleGeometry(args[2]) });
      });
      if (!shapes.length) notices.push("No live shape/3 facts supplied. Prolog source is not executed.");
    } else {
      model.format = `Generic shape (${record.recordType})`;
      addView("source", "Stored geometry", p);
      notices.push("Unrecognized shape schema; only explicitly supported geometry fields are rendered.");
    }
  } else {
    const refs = references(p, record.memoryKind);
    const assigned = new Set<string>();
    if (Array.isArray(p.members)) p.members.forEach((member, index) => {
      const attributed = objectValue(member) ? refs.filter(({ reference }) => reference
        && (reference.memberTrackUid !== undefined || reference.observationUid !== undefined)
        && (reference.memberTrackUid === undefined || reference.memberTrackUid === member.trackUid)
        && (reference.observationUid === undefined || reference.observationUid === member.observationUid)) : [];
      attributed.forEach(item => assigned.add(item.key));
      model.members.push({
        key: `member-${index}`, label: objectValue(member)
          ? String(member.trackUid ?? member.observationUid ?? `Unidentified member ${index + 1}`) : String(member),
        properties: member, references: attributed,
      });
    });
    else if (Array.isArray(p.memberTrackUids)) p.memberTrackUids.forEach((uid, index) =>
      model.members.push({ key: `track-${index}`, label: String(uid), properties: { trackUid: uid }, references: [] }));
    const remaining = refs.filter(item => !assigned.has(item.key));
    if (remaining.length) model.members.push({ key: "unassigned", label: "Shape references without matching member attribution",
      properties: { note: "References remain separate; no composition inferred." }, references: remaining });
    if (p.legacyKey !== undefined && p.facts !== undefined) {
      model.format = "Legacy known object / shape identity";
      notices.push("Legacy identity is not evidence of a multi-group object. Unattributed shape keys cannot resolve an exact source revision.");
      for (const predicate of ["known_object", "known_variation", "known_placement"]) {
        facts(p, predicate).forEach((fact, index) => model.members.push({
          key: `${predicate}-${index}`, label: `${predicate} ${index + 1}`, properties: fact, references: [],
        }));
      }
    } else if (Array.isArray(p.memberTrackUids)) {
      model.format = "Persistent multi-group object";
      if (p.memberTrackUids.length < 2 || !p.memberTrackUids.every(stableIdentity)
        || new Set(p.memberTrackUids).size !== p.memberTrackUids.length) notices.push("Invalid composition: at least two distinct stable member tracks are required.");
    } else notices.push("Unsupported object composition schema; inspect exact properties and provenance below.");
    notices.push("Constituent shapes are inspected individually; no flattened object silhouette is invented.");
  }
  return model;
}
