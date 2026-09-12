import type { ColoredTagDescription } from "@app/components/ColoredTagCombobox";

export type DirectComposite = {
  id: string;
  available: boolean;
  type?: string;
  label?: string;
  family?: string;
  resultCategory?: string;
  inputContract?: { frameInputCount?: number; usesSTM?: boolean };
};

const GROUPS = {
  single: { key: "01-single-frame", label: "Single frame", color: "#8cc8ff" },
  singleStm: { key: "02-single-frame-stm", label: "Single frame + STM", color: "#7bd88f" },
  pair: { key: "03-two-frames", label: "Two frames", color: "#b5a2ff" },
  pairStm: { key: "04-two-frames-stm", label: "Two frames + STM", color: "#58d6cf" },
  unspecified: { key: "90-unspecified", label: "Other stages / scope not declared", color: "#a8b4be" },
};

export function directCompositeDescription(id: string, entries: readonly DirectComposite[]): ColoredTagDescription {
  const entry = entries.find(item => item.id === id);
  if (!entry) return {
    label: `Unavailable: ${id}`, groupKey: "99-unavailable", groupLabel: "Unavailable",
    tags: [], disabled: true,
  };
  const count = entry.inputContract?.frameInputCount;
  const stm = entry.inputContract?.usesSTM;
  const group = count === 1 && typeof stm === "boolean" ? (stm ? GROUPS.singleStm : GROUPS.single)
    : count === 2 && typeof stm === "boolean" ? (stm ? GROUPS.pairStm : GROUPS.pair)
    : GROUPS.unspecified;
  return {
    label: entry.label && entry.label !== id ? `${entry.label} · ${id}` : id,
    groupKey: group.key, groupLabel: group.label, disabled: !entry.available,
    tags: [
      { text: group === GROUPS.unspecified ? "Scope not declared" : group.label, color: group.color },
      ...(entry.resultCategory ? [{ text: entry.resultCategory, color: "#e0b450" }] : []),
      ...(entry.type ? [{ text: entry.type === "llm" ? "LLM" : entry.type, color: "#8aa0aa" }] : []),
    ],
  };
}
