import type { VisualSequenceCatalogEntry } from "./VideoImportRecordingUrl";

type Snapshot = { etag: string; entries: VisualSequenceCatalogEntry[] };
const requests = new Map<string, Promise<VisualSequenceCatalogEntry[]>>();
const snapshots = new Map<string, Snapshot>();

export function loadVisualSequenceCatalog(workspaceId: string, refresh = false): Promise<VisualSequenceCatalogEntry[]> {
  const key = `videoImport.catalog.v2:${workspaceId}`;
  const requestKey = `${key}:${refresh}`;
  const current = requests.get(requestKey);
  if (current) return current;
  const request = (async () => {
    let cached = snapshots.get(key);
    if (!cached) {
      try {
        const stored = JSON.parse(sessionStorage.getItem(key) || "null");
        if (stored && typeof stored.etag === "string" && Array.isArray(stored.entries)
          && stored.entries.every((entry: VisualSequenceCatalogEntry) => entry && typeof entry.id === "string")) {
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
    if (response.status === 304 && cached) return cached.entries;
    if (!response.ok) throw new Error(`Visual Sequence catalog request failed: HTTP ${response.status}`);
    const data = await response.json();
    const entries = data.visualSequences ?? data.sets;
    if (!Array.isArray(entries) || !entries.every((entry) => entry && typeof entry.id === "string")) {
      throw new Error("Visual Sequence catalog response has invalid entries");
    }
    const etag = response.headers.get("ETag");
    if (etag) {
      const snapshot = { etag, entries };
      snapshots.set(key, snapshot);
      try { sessionStorage.setItem(key, JSON.stringify(snapshot)); } catch { /* storage is optional */ }
    }
    return entries;
  })().finally(() => { requests.delete(requestKey); });
  requests.set(requestKey, request);
  return request;
}
