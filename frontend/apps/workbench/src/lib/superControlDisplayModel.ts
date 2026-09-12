export type SuperControlDisplayMode = "tabs" | "stacked" | "single" | "split-v" | "split-h";

export function superControlPaneIds(
  mode: SuperControlDisplayMode, ids: readonly string[], active: string, primary: string, secondary: string,
): { primary: string[]; secondary: string[] } {
  const available = (id: string) => ids.includes(id) ? [id] : [];
  return {
    primary: mode === "stacked" ? [...ids] : available(mode === "tabs" ? active : primary),
    secondary: mode === "split-v" || mode === "split-h" ? available(secondary) : [],
  };
}

export function resourceHeader(source: string, fallback: string, path = "") {
  let value: unknown;
  try { value = JSON.parse(source); }
  catch (error) {
    return { title: fallback, resolved: false, metadata: "", error: /^\s*[[{]/.test(source) || /\.json$/i.test(path)
      ? `JSON parse error: ${error instanceof Error ? error.message : String(error)}` : "" };
  }
  if (!value || typeof value !== "object" || Array.isArray(value)) {
    return { title: fallback, resolved: false, metadata: "", error: "JSON source has no single resource object." };
  }
  const resource = value as Record<string, unknown>;
  const text = (key: string) => typeof resource[key] === "string" ? (resource[key] as string).trim()
    : typeof resource[key] === "number" && Number.isFinite(resource[key]) ? String(resource[key]) : "";
  const id = text("id"), label = text("label");
  const discriminator = text("kind") || text("type") || text("subkind") || text("role") || "resource";
  const identity = label ? `${label}${id && id !== label ? ` (${id})` : ""}` : id || fallback;
  const metadata = ["id", "kind", "type", "subkind", "role"].filter(key => text(key)).map(key => `${key}: ${text(key)}`).join(" · ");
  return { title: `${discriminator.replace(/[_-]+/g, " ").toUpperCase()} - ${identity}`,
    resolved: Boolean(id), metadata, error: id ? "" : "JSON resource has no stable id." };
}
