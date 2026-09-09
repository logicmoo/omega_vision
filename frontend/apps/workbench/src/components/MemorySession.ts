import { useSyncExternalStore } from "react";

export const NOWHERE_LIMITS_NOTICE = "When learned Shape or Object memory uses Nowhere, it stays only in this browser session: at most 128 frames per execution, 16 MiB per snapshot, and 1,024 retained outputs. Larger requests fail explicitly; nothing is truncated or silently saved to disk. Offline Nowhere execution is unavailable.";

let token = crypto.randomUUID();
let revision = 0;
const listeners = new Set<() => void>();
const snapshots = new Map<string, string>();
const errors = new Map<string, string>();
const queues = new Map<string, Promise<unknown>>();
const controllers = new Set<AbortController>();
const subscribe = (listener: () => void) => {
  listeners.add(listener);
  return () => { listeners.delete(listener); };
};

export function memorySessionId(_workspaceId?: string): string { return token; }
export function useMemorySessionId(_workspaceId?: string): string {
  return useSyncExternalStore(subscribe, memorySessionId);
}
export function useMemoryRevision(): number {
  return useSyncExternalStore(subscribe, () => revision);
}
export function useMemoryError(workspaceId: string): string | null {
  return useSyncExternalStore(subscribe, () => errors.get(workspaceId) ?? null);
}

export function rotateMemorySession(): void {
  token = crypto.randomUUID();
  snapshots.clear();
  errors.clear();
  queues.clear();
  controllers.forEach(controller => controller.abort());
  controllers.clear();
  revision += 1;
  listeners.forEach(listener => listener());
}

/** Snapshot strings never enter component/job records or persistent browser storage. */
export async function memoryRequest<T = Record<string, unknown>>(
  url: string, body: Record<string, unknown>, signal?: AbortSignal,
  onProgress?: (receipt: Record<string, unknown>) => void,
  readOnly = false,
): Promise<T> {
  const workspace = String(body.workspaceId ?? "");
  if (!workspace) throw new Error("Browser memory requires a workspace.");
  const page = token;
  const previous = readOnly ? undefined : queues.get(workspace);
  const operation = (async () => {
    await previous?.catch(() => undefined);
    if (page !== token || signal?.aborted) throw new DOMException("Memory session ended", "AbortError");
    const controller = new AbortController();
    const abort = () => controller.abort();
    signal?.addEventListener("abort", abort, { once: true });
    controllers.add(controller);
    const assertCurrent = () => {
      if (page !== token || controller.signal.aborted) throw new DOMException("Memory session ended", "AbortError");
    };
    let receivedProgress = false;
    try {
      const response = await fetch(url, {
        method: "POST", cache: "no-store", signal: controller.signal,
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ ...body, memorySessionId: page, memorySnapshot: snapshots.get(workspace) ?? null }),
      });
      let result: Record<string, unknown> | undefined;
      const accept = (value: Record<string, unknown>) => {
        assertCurrent();
        if (value.progress && typeof value.progress === "object") {
          receivedProgress = true;
          onProgress?.(value.progress as Record<string, unknown>);
          return;
        }
        result = value;
      };
      if (response.headers.get("Content-Type")?.includes("application/x-ndjson") && response.body) {
        const reader = response.body.getReader();
        const decoder = new TextDecoder();
        let buffer = "";
        try {
          for (;;) {
            const { done, value } = await reader.read();
            buffer += decoder.decode(value, { stream: !done });
            let boundary: number;
            while ((boundary = buffer.indexOf("\n")) >= 0) {
              const line = buffer.slice(0, boundary);
              buffer = buffer.slice(boundary + 1);
              if (line.trim()) accept(JSON.parse(line));
            }
            if (done) break;
          }
          if (buffer.trim()) accept(JSON.parse(buffer));
        } finally { reader.releaseLock(); }
      } else {
        accept(await response.json());
      }
      assertCurrent();
      if (!result) throw new Error("Execution ended before returning its browser memory snapshot. Retry in this page.");
      if (!response.ok) {
        const detail = result.detail;
        const error = new Error(typeof detail === "string" ? detail : JSON.stringify(detail ?? result));
        Object.assign(error, { status: response.status, detail });
        throw error;
      }
      const { memorySnapshot, ...receipt } = result;
      if (!readOnly && typeof memorySnapshot === "string"
        && (memorySnapshot !== snapshots.get(workspace) || errors.has(workspace))) {
        snapshots.set(workspace, memorySnapshot);
        errors.delete(workspace);
        revision += 1;
        listeners.forEach(listener => listener());
      }
      return receipt as T;
    } catch (failure) {
      if (receivedProgress && page === token && !controller.signal.aborted) {
        errors.set(workspace, "Execution transport ended without returning session memory. "
          + "The previous snapshot is retained; rerun dependencies in this page before continuing.");
        revision += 1;
        listeners.forEach(listener => listener());
      }
      throw failure;
    } finally {
      controllers.delete(controller);
      signal?.removeEventListener("abort", abort);
    }
  })();
  if (!readOnly) queues.set(workspace, operation);
  try { return await operation; }
  finally { if (queues.get(workspace) === operation) queues.delete(workspace); }
}

if (typeof window !== "undefined") {
  const onPageHide = () => rotateMemorySession();
  window.addEventListener("pagehide", onPageHide);
  if (import.meta.hot) import.meta.hot.dispose(() => {
    window.removeEventListener("pagehide", onPageHide);
    rotateMemorySession();
  });
}
