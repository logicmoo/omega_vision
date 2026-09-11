export const CONFIRMED_VISUAL_SEQUENCE_ID = "recordings/ls20/20260718-154544";
const endpoint = "/workbench/video-import/semantic/visual-sequence-selection";

export type VisualSequenceSelection = {
  schemaVersion: 1;
  visualSequenceId: string;
  version: number;
  revision: string;
};
export type SelectionSnapshot = {
  selection: VisualSequenceSelection | null;
  loading: boolean;
  writing: boolean;
  error: string;
  conflict: boolean;
};

export function isVisualSequenceId(value: unknown): value is string {
  return typeof value === "string" && value.length > 0
    && value.split("/").every(part => /^[A-Za-z0-9][A-Za-z0-9._-]*$/.test(part) && part !== "." && part !== "..");
}

export async function visualSequenceResponse<T>(response: Response): Promise<T> {
  const value = await response.json().catch(() => null);
  if (!response.ok) {
    const detail = value?.detail;
    const message = typeof detail === "string" ? detail : detail?.message;
    const error = new Error(message || `Visual Sequence request failed: HTTP ${response.status}`);
    Object.assign(error, { status: response.status, reasonCode: detail?.reasonCode });
    throw error;
  }
  return value as T;
}

function validateSelection(value: VisualSequenceSelection): VisualSequenceSelection {
  if (!value || value.schemaVersion !== 1 || !isVisualSequenceId(value.visualSequenceId)
    || !Number.isSafeInteger(value.version) || value.version < 0
    || typeof value.revision !== "string" || !value.revision) {
    throw new Error("Invalid shared Visual Sequence selection response.");
  }
  return value;
}

// One store per JS realm, not per workspace. Separate windows converge by polling
// the same authoritative metadata; no sequence or memory payload is persisted here.
export function createVisualSequenceSelectionStore(
  transport: typeof fetch = (...args) => fetch(...args),
  pollMs = 1000,
) {
  let snapshot: SelectionSnapshot = { selection: null, loading: false, writing: false, error: "", conflict: false };
  const listeners = new Map<() => void, string>();
  let timer: ReturnType<typeof setInterval> | undefined;
  let read: Promise<void> | null = null;
  let mutationEpoch = 0;
  let actionError = "";
  const publish = (patch: Partial<SelectionSnapshot>) => {
    snapshot = { ...snapshot, ...patch };
    for (const listener of listeners.keys()) listener();
  };
  const accept = (next: VisualSequenceSelection) => {
    const previous = snapshot.selection;
    if (previous && next.version < previous.version) return;
    if (previous && next.version === previous.version) {
      if (next.revision !== previous.revision || next.visualSequenceId !== previous.visualSequenceId) {
        throw new Error("Inconsistent shared Visual Sequence revision. Refresh before selecting.");
      }
      return;
    }
    publish({ selection: next });
  };
  const refresh = (workspaceId: string): Promise<void> => {
    if (snapshot.writing) return Promise.resolve();
    if (read) return read;
    const epoch = mutationEpoch;
    publish({ loading: !snapshot.selection });
    read = (async () => {
      try {
        const value = validateSelection(await visualSequenceResponse<VisualSequenceSelection>(await transport(
          `${endpoint}?workspaceId=${encodeURIComponent(workspaceId)}`, { cache: "no-store" },
        )));
        if (epoch !== mutationEpoch) return;
        accept(value);
        publish({ error: actionError });
      } catch (error) {
        if (epoch === mutationEpoch) publish({ error: error instanceof Error ? error.message : String(error) });
      } finally {
        if (epoch === mutationEpoch) { publish({ loading: false }); read = null; }
      }
    })();
    return read;
  };
  return {
    getSnapshot: () => snapshot,
    refresh,
    subscribe(workspaceId: string, listener: () => void) {
      listeners.set(listener, workspaceId);
      if (!timer) {
        timer = setInterval(() => {
          const workspace = listeners.values().next().value;
          if (workspace) void refresh(workspace);
        }, pollMs);
      }
      void refresh(workspaceId);
      return () => {
        listeners.delete(listener);
        if (!listeners.size) { clearInterval(timer); timer = undefined; }
      };
    },
    async select(workspaceId: string, visualSequenceId: string): Promise<boolean> {
      if (snapshot.writing) return false;
      if (!isVisualSequenceId(visualSequenceId) || !snapshot.selection) {
        publish({ error: "Load the shared selection and choose a valid Visual Sequence before saving." });
        return false;
      }
      if (visualSequenceId === snapshot.selection.visualSequenceId) return true;
      const expectedRevision = snapshot.selection.revision;
      ++mutationEpoch;
      read = null;
      actionError = "";
      publish({ writing: true, loading: false, error: "", conflict: false });
      let conflict = false;
      try {
        const value = validateSelection(await visualSequenceResponse<VisualSequenceSelection>(await transport(endpoint, {
          method: "PUT", cache: "no-store", headers: { "Content-Type": "application/json" },
          body: JSON.stringify({ workspaceId, visualSequenceId, expectedRevision }),
        })));
        if (value.visualSequenceId !== visualSequenceId || value.version <= snapshot.selection!.version) {
          throw new Error("The server did not confirm the requested Visual Sequence with a newer revision. Refresh before retrying.");
        }
        accept(value);
        return true;
      } catch (error) {
        conflict = (error as { status?: number })?.status === 409;
        actionError = conflict
          ? "Visual Sequence changed in another window. The shared selection has been reloaded; choose again to retry."
          : error instanceof Error ? error.message : String(error);
        publish({ error: actionError, conflict });
        return false;
      } finally {
        publish({ writing: false });
        if (conflict) await refresh(workspaceId);
      }
    },
  };
}

export const sharedVisualSequenceSelection = createVisualSequenceSelectionStore();
