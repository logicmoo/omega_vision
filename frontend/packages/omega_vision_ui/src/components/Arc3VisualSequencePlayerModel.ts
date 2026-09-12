import type { VisualSequenceCatalogEntry } from "./VideoImportRecordingUrl";

export const VISUAL_SEQUENCE_PAGE_SIZE = 100;
const MAX_CACHED_PAGES = 3;
const IMAGE_EXTENSION = /\.(png|jpe?g|webp|bmp|gif)$/i;
const LEGACY_SOURCE_FAMILIES = [
  "arc3_games/recordings", "arc3_games/curated", "curated_data", "vision_frames/curated_data",
  "video", "vision_frames/video", "image_archives", "live_streams",
  "vision_frames/image_archives", "vision_frames/live_streams",
  "video_import", "VideoImports", "recognition_inputs", "vision_frames/recognition_inputs",
  "recognition_reduce",
];

export type VisualSequenceFrame = { path: string; label: string };
export type VisualSequenceFramePage = {
  sequenceId: string;
  total: number;
  offset: number;
  frames: VisualSequenceFrame[];
};

function object(value: unknown): value is Record<string, unknown> {
  return value !== null && typeof value === "object" && !Array.isArray(value);
}

function safePath(value: unknown): value is string {
  return typeof value === "string" && !/[\\:<>|"*?\u0000-\u001f\u007f]/.test(value)
    && !/%[0-9a-f]{2}/i.test(value)
    && value.split("/").every(part => part && part !== "." && part !== ".." && !/[. ]$/.test(part));
}

function validateWorkspaceId(workspaceId: string): void {
  if (!safePath(workspaceId) || workspaceId.includes("/")) throw new Error("Invalid workspace request context.");
}

export function visualSequenceSourceId(sequence: VisualSequenceCatalogEntry): string {
  const canonical = ["recordings", "curated"].includes(sequence.id.split("/")[0]);
  const legacy = LEGACY_SOURCE_FAMILIES.some(family => sequence.id === family || sequence.id.startsWith(`${family}/`));
  if (!safePath(sequence.id) || (!canonical && !(legacy && sequence.readOnly === true && sequence.migrationRequired === true))) {
    throw new Error("This Visual Sequence is not an authorized shared source. Reload the catalog.");
  }
  const sourceId = `data/${sequence.id}`;
  if ((sequence.visualSequenceId !== undefined && sequence.visualSequenceId !== sequence.id)
      || (sequence.dir !== undefined && sequence.dir !== sourceId)
      || (sequence.providerRef !== undefined && sequence.providerRef !== sourceId)) {
    throw new Error("Visual Sequence source identities disagree. Reload the catalog.");
  }
  return sourceId;
}

function validateSourceId(sequenceId: string): void {
  const id = sequenceId.slice(5);
  if (!sequenceId.startsWith("data/") || !safePath(id)
      || (!["recordings", "curated"].includes(id.split("/")[0])
        && !LEGACY_SOURCE_FAMILIES.some(family => id === family || id.startsWith(`${family}/`)))) {
    throw new Error("Invalid Visual Sequence source identity.");
  }
}

function safeFramePath(sequenceId: string, path: unknown): path is string {
  return safePath(path) && path.startsWith(`${sequenceId}/`) && IMAGE_EXTENSION.test(path);
}

export function visualSequenceFrameAssetUrl(workspaceId: string, sequenceId: string, path: string): string {
  validateWorkspaceId(workspaceId);
  validateSourceId(sequenceId);
  if (!safeFramePath(sequenceId, path)) throw new Error("Image is outside the selected Visual Sequence.");
  return `/workbench/workspaces/${encodeURIComponent(workspaceId)}/asset?path=${encodeURIComponent(path)}`;
}

export function visualSequencePageOffset(index: number): number {
  if (!Number.isSafeInteger(index) || index < 0) throw new Error("Invalid frame index.");
  return Math.floor(index / VISUAL_SEQUENCE_PAGE_SIZE) * VISUAL_SEQUENCE_PAGE_SIZE;
}

export function clampVisualSequenceFrameIndex(index: number, total: number): number {
  if (!Number.isSafeInteger(total) || total <= 0 || !Number.isFinite(index)) return 0;
  return Math.max(0, Math.min(total - 1, Math.trunc(index)));
}

export function visualSequenceNavigationIndex(key: string, index: number, total: number): number | null {
  if (key === "ArrowLeft") return clampVisualSequenceFrameIndex(index - 1, total);
  if (key === "ArrowRight") return clampVisualSequenceFrameIndex(index + 1, total);
  if (key === "Home") return 0;
  if (key === "End") return clampVisualSequenceFrameIndex(total - 1, total);
  return null;
}

export function parseVisualSequenceFramePage(
  value: unknown, sequenceId: string, offset: number, expectedTotal: number | null = null,
): VisualSequenceFramePage {
  validateSourceId(sequenceId);
  if (visualSequencePageOffset(offset) !== offset) throw new Error("Invalid frame page offset.");
  if (!object(value) || value.sequenceId !== sequenceId || value.offset !== offset
      || typeof value.total !== "number" || !Number.isSafeInteger(value.total) || value.total < 0
      || !Array.isArray(value.frames)) {
    throw new Error("Frame page does not match the requested Visual Sequence.");
  }
  const total = value.total;
  if (expectedTotal !== null && total !== expectedTotal) {
    throw new Error("The stored frame count changed. Retry frames to reload from the beginning.");
  }
  if ((total === 0 && offset !== 0) || (total > 0 && offset >= total)) {
    throw new Error("The requested frame page is outside this Visual Sequence.");
  }
  if (value.frames.length !== Math.min(VISUAL_SEQUENCE_PAGE_SIZE, total - offset)) {
    throw new Error("The requested frame page is empty or incomplete. Retry frames to reload.");
  }
  const seen = new Set<string>();
  const frames = value.frames.map((frame: unknown) => {
    if (!object(frame) || !safeFramePath(sequenceId, frame.path) || typeof frame.label !== "string"
        || seen.has(frame.path)) {
      throw new Error("Frame page contains an invalid or duplicate image source.");
    }
    seen.add(frame.path);
    return { path: frame.path, label: frame.label };
  });
  return { sequenceId, total, offset, frames };
}

/** Only the current player's references are retained; no payloads or browser storage are written. */
export class VisualSequenceFramePager {
  readonly workspaceId: string;
  readonly sequenceId: string;
  total: number | null = null;
  private transport: typeof fetch;
  private pages = new Map<number, VisualSequenceFramePage>();
  private serial = 0;
  private controller: AbortController | null = null;

  constructor(workspaceId: string, sequence: VisualSequenceCatalogEntry, transport: typeof fetch = fetch) {
    validateWorkspaceId(workspaceId);
    this.workspaceId = workspaceId;
    this.sequenceId = visualSequenceSourceId(sequence);
    this.transport = (input, init) => transport(input, init);
  }

  cancel(): void {
    this.serial += 1;
    this.controller?.abort();
    this.controller = null;
  }

  reset(): void {
    this.cancel();
    this.pages.clear();
    this.total = null;
  }

  async load(index: number): Promise<VisualSequenceFramePage | null> {
    const offset = visualSequencePageOffset(index);
    if ((this.total === null && index !== 0)
        || (this.total !== null && index >= Math.max(1, this.total))) {
      throw new Error("Frame index is outside the loaded Visual Sequence.");
    }
    this.cancel();
    const serial = this.serial;
    const cached = this.pages.get(offset);
    if (cached) {
      this.pages.delete(offset);
      this.pages.set(offset, cached);
      return cached;
    }
    const controller = new AbortController();
    this.controller = controller;
    try {
      const response = await this.transport(
        `/workbench/video-import/preprocessing-frames?workspaceId=${encodeURIComponent(this.workspaceId)}`
        + `&sequenceId=${encodeURIComponent(this.sequenceId)}&offset=${offset}&limit=${VISUAL_SEQUENCE_PAGE_SIZE}`,
        { method: "GET", cache: "no-store", redirect: "error", signal: controller.signal },
      );
      if (serial !== this.serial || controller.signal.aborted) return null;
      if (!response.ok) throw new Error(`Frames could not be loaded (HTTP ${response.status}). Retry frames.`);
      const value: unknown = await response.json();
      if (serial !== this.serial || controller.signal.aborted) return null;
      const page = parseVisualSequenceFramePage(value, this.sequenceId, offset, this.total);
      const knownPaths = new Set([...this.pages.values()].flatMap(known => known.frames.map(frame => frame.path)));
      if (page.frames.some(frame => knownPaths.has(frame.path))) {
        throw new Error("Frame pages repeat an image source. Retry frames to reload.");
      }
      this.total = page.total;
      this.pages.set(offset, page);
      while (this.pages.size > MAX_CACHED_PAGES) {
        this.pages.delete(this.pages.keys().next().value!);
      }
      return page;
    } catch (error) {
      if (serial !== this.serial || controller.signal.aborted) return null;
      throw error;
    } finally {
      if (this.controller === controller) this.controller = null;
    }
  }
}
