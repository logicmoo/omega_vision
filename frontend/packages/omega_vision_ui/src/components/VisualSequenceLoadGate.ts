import type { VisualSequenceCatalogEntry } from "./VideoImportRecordingUrl";

export const VISUAL_SEQUENCE_CONFIRMATION_THRESHOLD = 800;

export function requiresVisualSequenceConfirmation(
  entry: VisualSequenceCatalogEntry,
  confirmed: boolean,
): boolean {
  return !confirmed && Number(entry.imageCount || 0) > VISUAL_SEQUENCE_CONFIRMATION_THRESHOLD;
}

export function visualSequenceConfirmationMessage(entry: VisualSequenceCatalogEntry): string {
  const label = String(entry.label || entry.id);
  const count = Number(entry.imageCount || 0).toLocaleString("en-US");
  return `${label} contains ${count} images and may be slow to load. Load this Visual Sequence?`;
}
