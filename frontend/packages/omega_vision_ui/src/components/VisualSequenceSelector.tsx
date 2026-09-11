import { ColoredTagCombobox, type ColoredTagDescription } from "@app/components/ColoredTagCombobox";
import { CONFIRMED_VISUAL_SEQUENCE_ID } from "./SharedVisualSequenceSelection";
import { useSharedVisualSequenceSelection, useVisualSequenceCatalog } from "./useSharedVisualSequenceSelection";
import { requiresVisualSequenceConfirmation, visualSequenceConfirmationMessage } from "./VisualSequenceLoadGate";
import { visualSequenceLocationForEntry, type VisualSequenceCatalogEntry } from "./VideoImportRecordingUrl";

export function VisualSequenceSelector({ workspaceId, active = true, onApproved }: {
  workspaceId: string; active?: boolean; onApproved?: (entry: VisualSequenceCatalogEntry) => void;
}) {
  const selection = useSharedVisualSequenceSelection(workspaceId, active);
  const catalog = useVisualSequenceCatalog(workspaceId, active);
  const describe = (id: string): ColoredTagDescription => {
    const entry = catalog.entries.find(item => item.id === id);
    if (!entry) return { label: id || "Loading shared selection…", groupKey: "unavailable", groupLabel: "Unavailable", tags: [], disabled: true };
    const legacy = !id.startsWith("recordings/") && !id.startsWith("curated/");
    return {
      label: entry.label || id, groupKey: entry.groupKey || entry.group || "sequences", groupLabel: entry.group || "Visual Sequences",
      tags: [
        { text: `${entry.imageCount} images`, color: "#8aa0aa" },
        ...(entry.level != null ? [{ text: `L${entry.level}`, color: "#9b8cff" }] : []),
        ...(entry.reducedCount ? [{ text: `${entry.reducedCount} reduced`, color: "#7bd88f" }] : []),
        ...(legacy ? [{ text: "legacy · read-only", color: "#e0b450" }] : []),
      ],
      disabled: !visualSequenceLocationForEntry(entry),
    };
  };
  return <div className="video-import-imageset-picker" style={{ flexWrap: "wrap", minWidth: 0 }}>
    <label className="video-import-imageset-selector"><span>Visual Sequence</span>
      <ColoredTagCombobox value={selection.visualSequenceId} ids={catalog.entries.map(entry => entry.id)}
        ariaLabel="Visual Sequence" describe={describe} openWidth="30ch"
        allowNone={false} noneLabel={selection.loading ? "Loading shared selection…" : "Shared selection unavailable"}
        disabled={!selection.selection || selection.writing || catalog.loading}
        onChange={id => {
          const entry = catalog.entries.find(item => item.id === id);
          if (!entry || !visualSequenceLocationForEntry(entry)) return;
          if (requiresVisualSequenceConfirmation(entry, false) && !window.confirm(visualSequenceConfirmationMessage(entry))) return;
          void selection.select(id).then(saved => { if (saved) onApproved?.(entry); });
        }} />
    </label>
    <button type="button" disabled={catalog.loading || selection.writing} onClick={() => { catalog.refresh(); void selection.refresh(); }}>
      Refresh Visual Sequences
    </button>
    {selection.writing && <span role="status">Saving shared selection…</span>}
    {selection.visualSequenceId === CONFIRMED_VISUAL_SEQUENCE_ID &&
      <span role="note">Confirmed default · LS20 Level 1 · 14 frames.</span>}
    {selection.visualSequenceId && !catalog.loading && !catalog.entries.some(entry => entry.id === selection.visualSequenceId) &&
      <span role="status">Selected ID unavailable in the catalog: {selection.visualSequenceId}. No substitute selected.</span>}
    {(selection.error || catalog.error) && <p role="alert">{selection.error || catalog.error} Saved-area browsing is still available.</p>}
  </div>;
}
