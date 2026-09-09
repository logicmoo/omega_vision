import { useRef, useState } from "react";
import type { ShapeGeometry, ShapePrimitive } from "./ShapeObjectInspector.model";

function polygonPath(primitive: Extract<ShapePrimitive, { kind: "polygon" }>): string {
  return [primitive.outer, ...primitive.holes].map(ring =>
    `M ${ring.map(([x, y]) => `${x} ${y}`).join(" L ")} Z`).join(" ");
}

export function ShapeObjectInspectorPreview({ geometry, label }: { geometry: ShapeGeometry; label: string }) {
  const [zoom, setZoom] = useState(1);
  const viewport = useRef<HTMLDivElement>(null);
  const drag = useRef<{ x: number; y: number; left: number; top: number } | null>(null);
  const bounds = geometry.bounds;
  if (!bounds) return <p role="status" className="shape-inspector__notice">{geometry.description}</p>;
  const padding = Math.max(bounds.width, bounds.height) * 0.03;
  const fit = () => { setZoom(1); viewport.current?.scrollTo({ left: 0, top: 0 }); };
  return <figure className="shape-inspector__preview">
    <div className="shape-inspector__controls" aria-label={`${label} preview controls`}>
      <button type="button" onClick={() => setZoom(value => Math.max(1, value / 2))} disabled={zoom <= 1}>Zoom out</button>
      <output aria-label="Preview zoom">{Math.round(zoom * 100)}%</output>
      <button type="button" onClick={() => setZoom(value => Math.min(32, value * 2))} disabled={zoom >= 32}>Zoom in</button>
      <button type="button" onClick={fit}>Fit</button>
      <span>Drag or scroll to pan; keyboard arrows scroll the focused preview.</span>
    </div>
    <div ref={viewport} className="shape-inspector__viewport" tabIndex={0} role="region"
      aria-label={`${label} scrollable geometry`}
      onPointerDown={event => {
        if (event.button !== 0) return;
        event.currentTarget.setPointerCapture(event.pointerId);
        drag.current = { x: event.clientX, y: event.clientY,
          left: event.currentTarget.scrollLeft, top: event.currentTarget.scrollTop };
      }}
      onPointerMove={event => {
        if (!drag.current) return;
        event.currentTarget.scrollLeft = drag.current.left + drag.current.x - event.clientX;
        event.currentTarget.scrollTop = drag.current.top + drag.current.y - event.clientY;
      }}
      onPointerUp={() => { drag.current = null; }}
      onPointerCancel={() => { drag.current = null; }}>
      <svg role="img" aria-label={label}
        viewBox={`${bounds.x - padding} ${bounds.y - padding} ${bounds.width + padding * 2} ${bounds.height + padding * 2}`}
        preserveAspectRatio="xMidYMid meet" style={{ width: `${zoom * 100}%`, height: 260 * zoom }}
        shapeRendering="crispEdges">
        <title>{label}</title>
        {geometry.primitives.map((primitive, index) => primitive.kind === "rect"
          ? <rect key={index} x={primitive.x} y={primitive.y} width={primitive.width}
            height={primitive.height} fill={primitive.fill} />
          : <path key={index} d={polygonPath(primitive)} fill={primitive.fill} fillRule="evenodd" />)}
      </svg>
    </div>
    <figcaption>{geometry.description}. Extents: ({bounds.x}, {bounds.y}) to ({bounds.x + bounds.width}, {bounds.y + bounds.height});
      {" "}{bounds.width} x {bounds.height} source units. Checkerboard is transparent, not stored background.</figcaption>
  </figure>;
}
