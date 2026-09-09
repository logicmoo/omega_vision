export type RegionPoint = [number, number];
export type RegionPixelRun = [number, number, number];

export interface RegionGeometryEntry {
  outer?: RegionPoint[];
  holes?: RegionPoint[][];
  smallFeature?: {
    pixelRuns?: RegionPixelRun[];
  };
}

export interface ExtractionRegionGeometry {
  width: number;
  height: number;
  polygons?: Record<string, RegionGeometryEntry>;
  smallFeatures?: Record<string, { pixelRuns?: RegionPixelRun[] }>;
}

export interface RegionHighlightShape {
  id: string;
  outer: RegionPoint[];
  holes: RegionPoint[][];
  pixelRuns: RegionPixelRun[];
}

export interface RegionHighlightResolution {
  shapes: RegionHighlightShape[];
  missing: string[];
}

function finitePoint(value: unknown): RegionPoint | null {
  if (!Array.isArray(value) || value.length < 2) return null;
  const x = Number(value[0]);
  const y = Number(value[1]);
  return Number.isFinite(x) && Number.isFinite(y) ? [x, y] : null;
}

function normalizedPoints(value: unknown): RegionPoint[] {
  if (!Array.isArray(value)) return [];
  return value.map(finitePoint).filter((point): point is RegionPoint => point !== null);
}

function normalizedRuns(value: unknown): RegionPixelRun[] {
  if (!Array.isArray(value)) return [];
  return value.flatMap((run) => {
    if (!Array.isArray(run) || run.length < 3) return [];
    const y = Number(run[0]);
    const x0 = Number(run[1]);
    const x1 = Number(run[2]);
    if (![y, x0, x1].every(Number.isFinite) || x1 < x0) return [];
    return [[y, x0, x1] as RegionPixelRun];
  });
}

function geometryKeys(member: string): string[] {
  const normalized = String(member).trim();
  if (!normalized) return [];
  const numeric = /^r(\d+)$/i.exec(normalized)?.[1];
  return numeric ? [normalized, normalized.toLowerCase(), numeric] : [normalized];
}

export function uniqueRegionMembers(members: readonly string[]): string[] {
  return [...new Set(members.map(String).filter(Boolean))];
}

export function resolveRegionHighlight(
  geometry: ExtractionRegionGeometry | null | undefined,
  members: readonly string[],
): RegionHighlightResolution {
  const shapes: RegionHighlightShape[] = [];
  const missing: string[] = [];
  for (const member of uniqueRegionMembers(members)) {
    const keys = geometryKeys(member);
    const polygonKey = keys.find((key) => geometry?.polygons?.[key] !== undefined);
    const details = polygonKey ? geometry?.polygons?.[polygonKey] : undefined;
    const featureKey = keys.find((key) => geometry?.smallFeatures?.[key] !== undefined);
    const outer = normalizedPoints(details?.outer);
    const holes = Array.isArray(details?.holes)
      ? details.holes.map(normalizedPoints).filter((ring) => ring.length >= 3)
      : [];
    const pixelRuns = normalizedRuns(
      details?.smallFeature?.pixelRuns
      || (featureKey ? geometry?.smallFeatures?.[featureKey]?.pixelRuns : undefined),
    );
    if (outer.length < 3 && pixelRuns.length === 0) {
      missing.push(member);
      continue;
    }
    shapes.push({ id: member, outer, holes, pixelRuns });
  }
  return { shapes, missing };
}

export function togglePinnedMembers(
  current: readonly string[],
  requested: readonly string[],
  additive: boolean,
): string[] {
  const existing = new Set(uniqueRegionMembers(current));
  const next = uniqueRegionMembers(requested);
  if (additive) {
    const removing = next.every((member) => existing.has(member));
    next.forEach((member) => removing ? existing.delete(member) : existing.add(member));
    return [...existing];
  }
  const same = next.length === existing.size && next.every((member) => existing.has(member));
  return same ? [] : next;
}

export function activeHighlightMembers(
  pinned: readonly string[],
  hovered: readonly string[] | null | undefined,
): { pinned: string[]; hovered: string[] } {
  return {
    pinned: uniqueRegionMembers(pinned),
    hovered: uniqueRegionMembers(hovered || []),
  };
}

export function sanitizePinnedHighlights(
  current: Readonly<Record<string, readonly string[]>>,
  validByRow: Readonly<Record<string, readonly string[]>>,
): Record<string, string[]> {
  const sanitized: Record<string, string[]> = {};
  for (const [rowKey, members] of Object.entries(current)) {
    const valid = new Set(validByRow[rowKey] || []);
    const retained = uniqueRegionMembers(members).filter((member) => valid.has(member));
    if (retained.length) sanitized[rowKey] = retained;
  }
  return sanitized;
}

export function containCoordinateTransform(
  sourceWidth: number,
  sourceHeight: number,
  renderedWidth: number,
  renderedHeight: number,
): { scale: number; offsetX: number; offsetY: number } {
  if (
    sourceWidth <= 0
    || sourceHeight <= 0
    || renderedWidth <= 0
    || renderedHeight <= 0
  ) {
    return { scale: 0, offsetX: 0, offsetY: 0 };
  }
  const scale = Math.min(renderedWidth / sourceWidth, renderedHeight / sourceHeight);
  return {
    scale,
    offsetX: (renderedWidth - sourceWidth * scale) / 2,
    offsetY: (renderedHeight - sourceHeight * scale) / 2,
  };
}
