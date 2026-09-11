import { useCallback, useEffect, useState, useSyncExternalStore } from "react";
import { sharedVisualSequenceSelection } from "./SharedVisualSequenceSelection";
import { loadVisualSequenceCatalog } from "./VisualSequenceCatalog";
import type { VisualSequenceCatalogEntry } from "./VideoImportRecordingUrl";

export function useSharedVisualSequenceSelection(workspaceId: string, active = true) {
  const subscribe = useCallback((listener: () => void) =>
    active && workspaceId ? sharedVisualSequenceSelection.subscribe(workspaceId, listener) : () => undefined,
  [workspaceId, active]);
  const state = useSyncExternalStore(subscribe, sharedVisualSequenceSelection.getSnapshot, sharedVisualSequenceSelection.getSnapshot);
  const select = useCallback((id: string) => sharedVisualSequenceSelection.select(workspaceId, id), [workspaceId]);
  const refresh = useCallback(() => sharedVisualSequenceSelection.refresh(workspaceId), [workspaceId]);
  return { ...state, visualSequenceId: state.selection?.visualSequenceId ?? "", select, refresh };
}

export function useVisualSequenceCatalog(workspaceId: string, active = true) {
  const [entries, setEntries] = useState<VisualSequenceCatalogEntry[]>([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");
  const [reload, setReload] = useState(0);
  useEffect(() => {
    if (!active || !workspaceId) return;
    let cancelled = false;
    setLoading(true);
    setError("");
    void loadVisualSequenceCatalog(workspaceId, reload > 0).then(value => {
      if (!cancelled) setEntries(value);
    }).catch(reason => {
      if (!cancelled) { setEntries([]); setError(String(reason)); }
    }).finally(() => { if (!cancelled) setLoading(false); });
    return () => { cancelled = true; };
  }, [workspaceId, active, reload]);
  return { entries, loading, error, refresh: () => setReload(value => value + 1) };
}
