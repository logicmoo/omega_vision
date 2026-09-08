const RECORDING_QUERY_PARAMETER = "recording";
const GAME_QUERY_PARAMETER = "game";
const SAFE_SEGMENT = /^[A-Za-z0-9][A-Za-z0-9._-]*$/;

export interface VisualSequenceCatalogEntry {
  id: string;
  dir?: string;
  kind?: string;
  gameId?: string;
  label?: string;
  group?: string;
  groupKey?: string;
  level?: number | null;
  imageCount?: number;
  reducedCount?: number;
}

export interface VisualSequenceLocation {
  game?: string;
  recording: string;
}

export interface ParsedVisualSequenceLocation {
  location: VisualSequenceLocation | null;
  legacy: boolean;
  error: string;
}

function isSafeSegment(value: string): boolean {
  return value !== "." && value !== ".." && SAFE_SEGMENT.test(value);
}

function isSafeNamespacedId(value: string): boolean {
  return value.split("/").every(isSafeSegment);
}

function legacyGameLocation(value: string): VisualSequenceLocation | null {
  const parts = value.split("/");
  const prefixes = [
    ["data", "omega_vision", "recordings"],
    ["data", "arc3_games", "recordings"],
    ["arc3_games", "recordings"],
    ["data", "recordings"],
    ["recordings"],
  ];
  for (const prefix of prefixes) {
    if (parts.length !== prefix.length + 2) continue;
    if (!prefix.every((part, index) => parts[index] === part)) continue;
    const game = parts[prefix.length];
    const recording = parts[prefix.length + 1];
    return isSafeSegment(game) && isSafeSegment(recording)
      ? { game, recording }
      : null;
  }
  return null;
}

export function visualSequenceLocationFromLegacyRef(value: string): VisualSequenceLocation | null {
  return legacyGameLocation(value.trim());
}

export function visualSequenceLocationFromUrl(href: string): ParsedVisualSequenceLocation {
  const url = new URL(href);
  const game = url.searchParams.get(GAME_QUERY_PARAMETER)?.trim() || "";
  const recording = url.searchParams.get(RECORDING_QUERY_PARAMETER)?.trim() || "";
  if (!game && !recording) return { location: null, legacy: false, error: "" };
  if (!recording) {
    return { location: null, legacy: false, error: "The game parameter requires a recording parameter." };
  }
  if (game) {
    if (!isSafeSegment(game) || !isSafeSegment(recording)) {
      return { location: null, legacy: false, error: "The game and recording parameters must be catalog identifiers, not paths." };
    }
    return { location: { game, recording }, legacy: false, error: "" };
  }
  const legacy = legacyGameLocation(recording);
  if (legacy) return { location: legacy, legacy: true, error: "" };
  if (!isSafeNamespacedId(recording)) {
    return { location: null, legacy: false, error: "The recording parameter is not a valid Visual Sequence identifier." };
  }
  return { location: { recording }, legacy: false, error: "" };
}

export function visualSequenceLocationForEntry(
  entry: VisualSequenceCatalogEntry,
): VisualSequenceLocation | null {
  const id = String(entry.id || "").trim();
  if (!id || !isSafeNamespacedId(id)) return null;
  if (entry.kind !== "arc-recording") return { recording: id };
  const game = String(entry.gameId || "").trim();
  const recording = id.split("/").pop() || "";
  if (!isSafeSegment(game) || !isSafeSegment(recording)) return null;
  return { game, recording };
}

export function visualSequenceProviderRef(entry: VisualSequenceCatalogEntry): string {
  const dir = String(entry.dir || "").trim().replace(/\\/g, "/").replace(/^\/+|\/+$/g, "");
  return dir || `data/${entry.id}`;
}

export function resolveVisualSequenceLocation<T extends VisualSequenceCatalogEntry>(
  entries: readonly T[],
  location: VisualSequenceLocation,
): { entry: T | null; error: string } {
  const matches = entries.filter((entry) => {
    const candidate = visualSequenceLocationForEntry(entry);
    return candidate?.recording === location.recording
      && (candidate.game || "") === (location.game || "");
  });
  const label = location.game
    ? `${location.game}/${location.recording}`
    : location.recording;
  if (matches.length === 0) {
    return { entry: null, error: `Visual Sequence "${label}" is not available in this workspace.` };
  }
  if (matches.length > 1) {
    return { entry: null, error: `Visual Sequence "${label}" is ambiguous in this workspace.` };
  }
  return { entry: matches[0], error: "" };
}

export function urlWithVisualSequence(
  href: string,
  location: VisualSequenceLocation | null,
): string {
  const url = new URL(href);
  if (location) {
    url.searchParams.set(RECORDING_QUERY_PARAMETER, location.recording);
    if (location.game) url.searchParams.set(GAME_QUERY_PARAMETER, location.game);
    else url.searchParams.delete(GAME_QUERY_PARAMETER);
  } else {
    url.searchParams.delete(RECORDING_QUERY_PARAMETER);
    url.searchParams.delete(GAME_QUERY_PARAMETER);
  }
  return url.toString();
}
