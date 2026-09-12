import type { VisualSequenceCatalogEntry } from "./VideoImportRecordingUrl";

type Snapshot = { etag: string; entries: VisualSequenceCatalogEntry[] };
const requests = new Map<string, Promise<VisualSequenceCatalogEntry[]>>();
const snapshots = new Map<string, Snapshot>();
let requestSerial = 0;
let publishedSerial = 0;

function validOptions(value: unknown): value is VisualSequenceCatalogEntry[] {
  return Array.isArray(value) && value.every((entry) =>
    entry && typeof entry.id === "string" && entry.id.length > 0
    && !/[\\:\u0000-\u001f]/.test(entry.id)
    && entry.id.split("/").every((part: string) => part && part !== "." && part !== "..")
    && Number.isSafeInteger(entry.imageCount) && entry.imageCount >= 0
    && (entry.visualSequenceId === undefined || entry.visualSequenceId === entry.id)
    && (entry.dir === undefined || entry.dir === `data/${entry.id}`)
    && (entry.providerRef === undefined || entry.providerRef === `data/${entry.id}`));
}

export async function loadVisualSequenceEntry(
  workspaceId: string, sequenceId: string, signal?: AbortSignal, transport: typeof fetch = fetch,
): Promise<VisualSequenceCatalogEntry> {
  if (!sequenceId || /[\\:\u0000-\u001f]/.test(sequenceId)
      || sequenceId.split("/").some(part => !part || part === "." || part === "..")) {
    throw new Error("Invalid selected Visual Sequence identifier.");
  }
  const response = await transport(
    `/workbench/video-import/visual-sequences/resolve?workspaceId=${encodeURIComponent(workspaceId)}&sequenceId=${encodeURIComponent(sequenceId)}`,
    { cache: "no-store", signal },
  );
  if (!response.ok) throw new Error(`Selected Visual Sequence request failed: HTTP ${response.status}`);
  const payload = await response.json();
  const entry = payload && typeof payload === "object" ? payload.visualSequence : undefined;
  if (!validOptions([entry]) || entry.id !== sequenceId) throw new Error("Selected Visual Sequence response does not match its requested identity.");
  return entry;
}

export function loadVisualSequenceCatalog(workspaceId: string, refresh = false): Promise<VisualSequenceCatalogEntry[]> {
  const key = "videoImport.optionList.v1";
  // Only transport deduplication retains caller context; choices are shared.
  const requestKey = `${key}:${workspaceId}:${refresh}`;
  const current = requests.get(requestKey);
  if (current) return current;
  const serial = ++requestSerial;
  const request = (async () => {
    let cached = snapshots.get(key);
    if (!cached) {
      try {
        const stored = JSON.parse(sessionStorage.getItem(key) || "null");
        if (stored && typeof stored.etag === "string" && validOptions(stored.entries)) {
          cached = stored;
        }
      } catch {
        // Browser storage is optional; server revalidation remains authoritative.
      }
    }
    const response = await fetch(
      `/workbench/video-import/visual-sequences?workspaceId=${encodeURIComponent(workspaceId)}${refresh ? "&refresh=true" : ""}`,
      { cache: "no-cache", headers: cached && !refresh ? { "If-None-Match": cached.etag } : {} },
    );
    if (response.status === 304 && cached) return (snapshots.get(key) ?? cached).entries;
    if (!response.ok) throw new Error(`Visual Sequence catalog request failed: HTTP ${response.status}`);
    const data = await response.json();
    const entries = data.visualSequences ?? data.sets;
    if (!validOptions(entries)) {
      throw new Error("Visual Sequence catalog response has invalid entries");
    }
    const etag = response.headers.get("ETag");
    if (serial < publishedSerial) return (snapshots.get(key) ?? { entries }).entries;
    if (etag) {
      const snapshot = { etag, entries };
      snapshots.set(key, snapshot);
      publishedSerial = serial;
      try { sessionStorage.setItem(key, JSON.stringify(snapshot)); } catch { /* storage is optional */ }
    }
    return entries;
  })().finally(() => { requests.delete(requestKey); });
  requests.set(requestKey, request);
  return request;
}
