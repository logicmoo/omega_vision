export const INSPECTOR_KIND_NAMES = {
  shape: "Shape",
  shape_group: "Group (Shapes)",
  object_group: "Group (Objects)",
  shape_group_class: "Shape Group Class",
  object_group_class: "Object Group Class",
  object: "Object",
  object_class: "Object Class",
} as const;

export type InspectorKind = keyof typeof INSPECTOR_KIND_NAMES;
export type InspectorRelation = "references" | "has_shape" | "has_member" | "member_of"
  | "instance_of" | "has_instance" | "has_part" | "part_of";

export const INSPECTOR_RELATIONS: Readonly<Record<InspectorRelation, {
  targets: ReadonlyArray<InspectorKind>;
  pairs?: Partial<Record<InspectorKind, InspectorKind>>;
}>> = {
  references: { targets: ["shape", "shape_group", "object_group", "shape_group_class", "object_group_class", "object", "object_class"] },
  has_shape: { targets: ["shape"] },
  has_member: { targets: ["shape", "object"], pairs: { shape_group: "shape", object_group: "object" } },
  member_of: { targets: ["shape_group", "object_group"], pairs: { shape: "shape_group", object: "object_group" } },
  instance_of: { targets: ["shape_group_class", "object_group_class", "object_class"],
    pairs: { shape_group: "shape_group_class", object_group: "object_group_class", object: "object_class" } },
  has_instance: { targets: ["shape_group", "object_group", "object"],
    pairs: { shape_group_class: "shape_group", object_group_class: "object_group", object_class: "object" } },
  has_part: { targets: ["object"], pairs: { object: "object" } },
  part_of: { targets: ["object"], pairs: { object: "object" } },
};

export function isInspectorKind(value: unknown): value is InspectorKind {
  return typeof value === "string" && Object.hasOwn(INSPECTOR_KIND_NAMES, value);
}

export function isInspectorRelation(value: unknown): value is InspectorRelation {
  return typeof value === "string" && Object.hasOwn(INSPECTOR_RELATIONS, value);
}

const MARKERS: Readonly<Record<InspectorKind, string>> = {
  shape: "S", shape_group: "G", object_group: "C", shape_group_class: "GC",
  object_group_class: "CC", object: "O", object_class: "OC",
};

/** Only capitalize an explicitly supplied, type-compatible alias; never number records by position. */
export function formatInspectorType(kind: InspectorKind, alias?: unknown): string {
  const match = typeof alias === "string" ? /^([a-z]+)(\d+)$/i.exec(alias) : null;
  const marker = match?.[1].toUpperCase();
  return match && marker === MARKERS[kind]
    ? `${marker}${match[2]} \u2014 ${INSPECTOR_KIND_NAMES[kind]}`
    : INSPECTOR_KIND_NAMES[kind];
}
