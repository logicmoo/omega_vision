import { useLayoutEffect, useRef, useState, type ReactNode } from "react";
import { fitRasterViewport } from "./FullRasterViewportModel";
import "../styles/full_raster_viewport.css";

export function FullRasterViewport({ width, height, children }: {
  width: number | null; height: number | null; children: ReactNode;
}) {
  const host = useRef<HTMLDivElement>(null);
  const [available, setAvailable] = useState({ width: 0, height: 0 });
  useLayoutEffect(() => {
    const element = host.current;
    if (!element) return;
    const measure = () => setAvailable(previous => {
      const width = element.clientWidth, height = element.clientHeight;
      return previous.width === width && previous.height === height ? previous : { width, height };
    });
    measure();
    const observer = new ResizeObserver(measure);
    observer.observe(element);
    return () => observer.disconnect();
  }, []);
  const fitted = fitRasterViewport(width ?? 0, height ?? 0, available.width, available.height);
  return <div ref={host} className="full-raster-viewport-host">
    <div className="full-raster-viewport" data-source-width={width ?? undefined} data-source-height={height ?? undefined}
      aria-label={width && height ? `Full viewport: ${width} by ${height} pixels` : "Loading viewport dimensions"}
      style={{ width: fitted?.width ?? 0, height: fitted?.height ?? 0, visibility: fitted ? "visible" : "hidden" }}>
      {children}
    </div>
  </div>;
}
