export type VisualGroupClaimKind = "v" | "w" | "o";

export interface VisualGroupClaim {
  kind: VisualGroupClaimKind;
  id: string;
  members: string[];
  sourceOrder: number;
  method?: string;
  confidence?: number;
  evidence?: Record<string, unknown>;
}

export interface VisualGroupDisplayRow {
  claims: VisualGroupClaim[];
  members: string[];
}

function naturalAliasKey(value: string): [string, number, string] {
  const match = /^([a-z_-]*?)(\d+)$/i.exec(value);
  return match
    ? [match[1].toLowerCase(), Number(match[2]), value.toLowerCase()]
    : [value.toLowerCase(), Number.MAX_SAFE_INTEGER, value.toLowerCase()];
}

function compareAliases(left: string, right: string): number {
  const a = naturalAliasKey(left);
  const b = naturalAliasKey(right);
  return a[0].localeCompare(b[0]) || a[1] - b[1] || a[2].localeCompare(b[2]);
}

function sharedCount(left: VisualGroupClaim, right: VisualGroupClaim): number {
  const rightMembers = new Set(right.members);
  return left.members.reduce((count, member) => count + Number(rightMembers.has(member)), 0);
}

function jaccard(left: VisualGroupClaim, right: VisualGroupClaim): number {
  const shared = sharedCount(left, right);
  const union = new Set([...left.members, ...right.members]).size;
  return union ? shared / union : 0;
}

export function interleaveVisualGroupClaims(
  input: readonly VisualGroupClaim[],
): VisualGroupClaim[] {
  const claims = input.map((claim) => ({
    ...claim,
    members: [...new Set(claim.members)],
  }));
  if (claims.length < 2) return claims;

  const memberOrder = new Map<string, number>();
  [...claims]
    .sort((left, right) => left.sourceOrder - right.sourceOrder || compareAliases(left.id, right.id))
    .forEach((claim) => claim.members.forEach((member) => {
      if (!memberOrder.has(member)) memberOrder.set(member, memberOrder.size);
    }));

  const remaining = new Set(claims.map((_, index) => index));
  const neighborhoods: number[][] = [];
  while (remaining.size) {
    const seed = Math.min(...remaining);
    remaining.delete(seed);
    const neighborhood = [seed];
    const queue = [seed];
    while (queue.length) {
      const current = queue.shift() as number;
      for (const candidate of [...remaining]) {
        if (sharedCount(claims[current], claims[candidate]) === 0) continue;
        remaining.delete(candidate);
        neighborhood.push(candidate);
        queue.push(candidate);
      }
    }
    neighborhoods.push(neighborhood);
  }

  const neighborhoodKey = (indices: number[]): [number, number, string] => {
    const rows = indices.map((index) => claims[index]);
    const firstMember = Math.min(
      ...rows.flatMap((claim) => claim.members.map((member) => memberOrder.get(member) ?? Number.MAX_SAFE_INTEGER)),
    );
    const firstSource = Math.min(...rows.map((claim) => claim.sourceOrder));
    const firstAlias = [...rows].sort((a, b) => compareAliases(a.id, b.id))[0]?.id || "";
    return [firstMember, firstSource, firstAlias];
  };
  neighborhoods.sort((left, right) => {
    const a = neighborhoodKey(left);
    const b = neighborhoodKey(right);
    return a[0] - b[0] || a[1] - b[1] || compareAliases(a[2], b[2]);
  });

  const output: VisualGroupClaim[] = [];
  for (const neighborhood of neighborhoods) {
    const pending = neighborhood.map((index) => claims[index]);
    pending.sort((left, right) =>
      left.sourceOrder - right.sourceOrder || compareAliases(left.id, right.id)
    );
    let current = pending.shift() as VisualGroupClaim;
    output.push(current);
    while (pending.length) {
      pending.sort((left, right) => {
        const sharedDelta = sharedCount(current, right) - sharedCount(current, left);
        if (sharedDelta) return sharedDelta;
        const jaccardDelta = jaccard(current, right) - jaccard(current, left);
        if (jaccardDelta) return jaccardDelta;
        const leftAlternates = left.kind !== current.kind;
        const rightAlternates = right.kind !== current.kind;
        if (leftAlternates !== rightAlternates) return rightAlternates ? 1 : -1;
        return left.sourceOrder - right.sourceOrder || compareAliases(left.id, right.id);
      });
      current = pending.shift() as VisualGroupClaim;
      output.push(current);
    }
  }
  return output;
}

export function coalesceIdenticalVisualAndSymbolicGroups(
  orderedClaims: readonly VisualGroupClaim[],
): VisualGroupDisplayRow[] {
  const buckets = new Map<string, VisualGroupClaim[]>();
  for (const claim of orderedClaims) {
    const key = [...new Set(claim.members)].sort(compareAliases).join("\u0000");
    const bucket = buckets.get(key) || [];
    bucket.push(claim);
    buckets.set(key, bucket);
  }
  const emitted = new Set<VisualGroupClaim>();
  const rows: VisualGroupDisplayRow[] = [];
  for (const claim of orderedClaims) {
    if (emitted.has(claim)) continue;
    const key = [...new Set(claim.members)].sort(compareAliases).join("\u0000");
    const bucket = buckets.get(key) || [claim];
    const kinds = new Set(bucket.map((candidate) => candidate.kind));
    const combined = kinds.has("v") && kinds.has("w") ? bucket : [claim];
    combined.forEach((candidate) => emitted.add(candidate));
    rows.push({
      claims: combined,
      members: [...new Set(claim.members)],
    });
  }
  return rows;
}
