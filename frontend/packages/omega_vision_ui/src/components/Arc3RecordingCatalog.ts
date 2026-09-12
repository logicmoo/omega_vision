import type { VisualSequenceCatalogEntry } from "./VideoImportRecordingUrl";

export type RecordingDirStats = {
  path: string;
  absolutePath?: string | null;
  imported?: boolean;
  hasManifest?: boolean;
  sizeBytes?: number;
  moveDirCount?: number;
  avgMoveDirFiles?: number;
  updatedAt?: string | null;
};

export type RecordingDirInfo = RecordingDirStats & {
  name: string;
  gameDirectory: string;
  gameId?: string;
  level?: string;
  moveTotal: number;
  readOnly: boolean;
  canManage: boolean;
  sequence: VisualSequenceCatalogEntry;
};

export function recordingRows(
  catalog: readonly VisualSequenceCatalogEntry[], statistics: readonly RecordingDirStats[] = [],
): RecordingDirInfo[] {
  const byPath = new Map(statistics.map(item => [item.path, item]));
  return catalog.map(sequence => {
    const parts = sequence.id.split("/");
    const path = `data/${sequence.id}`;
    const stats = byPath.get(path);
    const hasManifest = sequence.kind === "arc-recording" || sequence.kind === "recording" || stats?.hasManifest === true;
    const readOnly = sequence.readOnly === true || !["recordings", "curated"].includes(parts[0]);
    return {
      ...stats, path, name: parts.at(-1) || sequence.id,
      gameDirectory: sequence.game || parts.slice(0, -1).join("/"),
      gameId: sequence.gameId, level: sequence.level == null ? undefined : String(sequence.level),
      moveTotal: sequence.imageCount ?? 0, hasManifest, readOnly,
      canManage: !readOnly && parts.length === 3 && parts[0] === "recordings" && hasManifest,
      sequence,
    };
  });
}

export function recordingCanReplay(
  row: RecordingDirInfo, games: readonly { game_id: string; short_id?: string }[],
): boolean {
  return row.hasManifest === true && !row.readOnly && !!row.gameId
    && games.some(game => game.game_id === row.gameId || (game.short_id || game.game_id) === row.gameId);
}

export function filterRecordingRows(rows: readonly RecordingDirInfo[], query: string): RecordingDirInfo[] {
  const words = query.toLowerCase().trim().split(/\s+/).filter(Boolean);
  return rows.filter(row => words.every(word =>
    `${row.path} ${row.sequence.label || ""} ${row.sequence.group || ""}`.toLowerCase().includes(word)));
}

export function parseRecordingStats(value: unknown): RecordingDirStats[] {
  if (!value || typeof value !== "object" || !("recordingDirs" in value) || !Array.isArray(value.recordingDirs)) {
    throw new Error("Recording disk-statistics response is invalid.");
  }
  const rows: RecordingDirStats[] = [];
  for (const row of value.recordingDirs) {
    if (!row || typeof row !== "object" || typeof row.path !== "string"
        || (row.absolutePath != null && typeof row.absolutePath !== "string")
        || (row.updatedAt != null && typeof row.updatedAt !== "string")
        || ["sizeBytes", "moveDirCount", "avgMoveDirFiles"].some(key =>
          row[key] != null && (typeof row[key] !== "number" || !Number.isFinite(row[key]) || row[key] < 0))) {
      throw new Error("Recording disk-statistics entry is invalid.");
    }
    rows.push({
      path: row.path, absolutePath: row.absolutePath, updatedAt: row.updatedAt,
      imported: row.imported === true, hasManifest: row.hasManifest === true,
      sizeBytes: row.sizeBytes, moveDirCount: row.moveDirCount, avgMoveDirFiles: row.avgMoveDirFiles,
    });
  }
  return rows;
}
