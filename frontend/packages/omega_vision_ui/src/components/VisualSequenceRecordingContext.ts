export type VisualSequenceRecordingContext = {
  schemaVersion: 1;
  sequenceId: string;
  gameId: string;
  frames: Array<{ frameId: string; levelId: string | null; frameOrder: number }>;
  selectedFrameId: string;
};

export async function loadVisualSequenceRecordingContext(
  workspaceId: string, visualSequenceId: string, frameId: string | undefined, signal: AbortSignal,
): Promise<VisualSequenceRecordingContext> {
  if (!visualSequenceId.startsWith("recordings/")
    || !visualSequenceId.split("/").every(part => /^[A-Za-z0-9][A-Za-z0-9._-]*$/.test(part) && part !== "." && part !== "..")) {
    throw new Error("Contextual memory unavailable: this Visual Sequence is not a canonical recording. Saved-area browsing remains available.");
  }
  const sequenceId = `data/${visualSequenceId}`;
  const query = new URLSearchParams({ workspaceId, sequenceId });
  // An explicit invalid (even empty) frame is never turned into a first-frame request.
  if (frameId !== undefined) query.set("frameId", frameId);
  const response = await fetch(`/workbench/video-import/semantic/memory/recording-context?${query}`, { signal, cache: "no-store" });
  const value = await response.json();
  if (!response.ok) {
    throw new Error(`${value?.detail?.reasonCode || `HTTP ${response.status}`}: ${value?.detail?.message || value?.detail || "Recording context unavailable"}`);
  }
  if (!value || value.schemaVersion !== 1 || value.sequenceId !== sequenceId || typeof value.gameId !== "string" || !value.gameId
    || !Array.isArray(value.frames) || !value.frames.length
    || !value.frames.every((frame: VisualSequenceRecordingContext["frames"][number]) => frame && typeof frame.frameId === "string" && frame.frameId
      && (frame.levelId === null || typeof frame.levelId === "string") && Number.isSafeInteger(frame.frameOrder) && frame.frameOrder >= 0)
    || new Set(value.frames.map((frame: VisualSequenceRecordingContext["frames"][number]) => frame.frameId)).size !== value.frames.length
    || !value.frames.some((frame: VisualSequenceRecordingContext["frames"][number]) => frame.frameId === value.selectedFrameId)
    || (frameId !== undefined && value.selectedFrameId !== frameId)) {
    throw new Error("Invalid recording manifest context. No frame was substituted.");
  }
  return value;
}
