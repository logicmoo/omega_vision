import type { ReactNode } from "react";

import {
  resolveRegionHighlight,
  uniqueRegionMembers,
  type ExtractionRegionGeometry,
  type RegionHighlightShape,
} from "./VisualRegionHighlightModel";

export type RegionGeometryStatus = "idle" | "loading" | "ready" | "unavailable";

export interface RegionHighlightMembers {
  pinned: string[];
  hovered: string[];
}

function polygonPath(shape: RegionHighlightShape): string {
  const ring = (points: [number, number][]) => (
    points.length
      ? `M ${points.map(([x, y]) => `${x} ${y}`).join(" L ")} Z`
      : ""
  );
  return [ring(shape.outer), ...shape.holes.map(ring)].filter(Boolean).join(" ");
}

function highlightShapes(
  shapes: RegionHighlightShape[],
  tone: "pinned" | "hovered",
): ReactNode {
  return shapes.map((shape) => {
    const path = polygonPath(shape);
    return (
      <g
        key={`${tone}-${shape.id}`}
        className={`video-import-region-highlight-shape is-${tone}`}
        data-highlight-region={shape.id}
      >
        {shape.pixelRuns.map(([y, x0, x1], index) => (
          <rect
            key={`${shape.id}-run-${index}`}
            x={x0}
            y={y}
            width={x1 - x0 + 1}
            height={1}
            className="video-import-region-highlight-pixels"
          />
        ))}
        {path && (
          <>
            <path d={path} className="video-import-region-highlight-halo" fillRule="evenodd" />
            <path d={path} className="video-import-region-highlight-path" fillRule="evenodd" />
          </>
        )}
      </g>
    );
  });
}

export function RegionHighlightLayer({
  geometry,
  members,
}: {
  geometry: ExtractionRegionGeometry;
  members: RegionHighlightMembers;
}) {
  const pinned = resolveRegionHighlight(geometry, members.pinned);
  const hovered = resolveRegionHighlight(geometry, members.hovered);
  return (
    <g
      className="video-import-region-highlight-layer"
      pointerEvents="none"
      data-pinned-regions={uniqueRegionMembers(members.pinned).join(",")}
      data-hovered-regions={uniqueRegionMembers(members.hovered).join(",")}
    >
      {highlightShapes(pinned.shapes, "pinned")}
      {highlightShapes(hovered.shapes, "hovered")}
    </g>
  );
}

export function VisualRegionHighlightOverlay({
  geometry,
  status,
  members,
  unavailableReason,
}: {
  geometry: ExtractionRegionGeometry | null;
  status: RegionGeometryStatus;
  members: RegionHighlightMembers;
  unavailableReason?: string;
}) {
  const requested = uniqueRegionMembers([...members.pinned, ...members.hovered]);
  if (!requested.length) return null;
  if (!geometry || status !== "ready") {
    return (
      <span className="video-import-region-highlight-unavailable" role="status">
        {status === "loading"
          ? "loading highlight geometry"
          : unavailableReason || "highlight geometry unavailable"}
      </span>
    );
  }
  const resolution = resolveRegionHighlight(geometry, requested);
  return (
    <>
      <svg
        className="video-import-region-highlight-overlay"
        viewBox={`0 0 ${geometry.width} ${geometry.height}`}
        preserveAspectRatio="xMidYMid meet"
        aria-label={`Highlighted regions: ${requested.join(", ")}`}
        pointerEvents="none"
      >
        <RegionHighlightLayer geometry={geometry} members={members} />
      </svg>
      {resolution.missing.length > 0 && (
        <span className="video-import-region-highlight-unavailable" role="status">
          geometry unavailable for {resolution.missing.join(", ")}
        </span>
      )}
    </>
  );
}
