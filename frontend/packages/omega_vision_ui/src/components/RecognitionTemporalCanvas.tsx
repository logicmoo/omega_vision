import { useEffect, useLayoutEffect, useRef, useState, type ReactNode, type RefObject } from "react";
import { createPortal } from "react-dom";
import { MenuVisibilityBoundary } from "@app/components/MenuVisibilityBoundary";

const CONTEXT_BLOCKS = ".video-import-prolog-inspector, .video-import-reduce-listrow, .video-import-reduce-charrow, .video-import-recognition-head, .video-import-recognition-headbar, .vi2-section, .video-import-sequence-setup";

export function RecognitionTemporalCanvas({ root, active, enabled, sequenceId, frameId, children }: {
  root: RefObject<HTMLElement | null>;
  active: boolean;
  enabled: boolean;
  sequenceId: string;
  frameId: string;
  children: ReactNode;
}) {
  const [open, setOpen] = useState(false);
  const [collapsed, setCollapsed] = useState(false);
  const [error, setError] = useState("");
  const [anchor, setAnchor] = useState<HTMLElement | null>(null);
  const rememberedContext = useRef<HTMLElement | null>(null);
  const [host] = useState(() => {
    const element = document.createElement("section");
    element.className = "video-import-temporal-canvas";
    element.setAttribute("aria-label", "Temporal events & learned rules canvas");
    return element;
  });
  useEffect(() => {
    if (!active || !enabled) return;
    const remember = (event: Event) => {
      const target = event.target instanceof Element ? event.target : null;
      if (!target || !root.current?.contains(target) || host.contains(target)) return;
      const block = target.closest<HTMLElement>(CONTEXT_BLOCKS);
      if (block) rememberedContext.current = block;
    };
    const show = () => {
      const page = root.current;
      if (!page) return;
      const bounds = page.closest(".main-stage")?.getBoundingClientRect() || page.getBoundingClientRect();
      const top = Math.max(0, bounds.top), bottom = Math.min(window.innerHeight, bounds.bottom);
      const remembered = rememberedContext.current;
      const rememberedBounds = remembered?.getBoundingClientRect();
      const visibleRemembered = remembered?.isConnected && rememberedBounds && rememberedBounds.bottom > top && rememberedBounds.top < bottom;
      const point = document.elementFromPoint(Math.max(0, Math.min(window.innerWidth - 1, bounds.left + bounds.width / 2)), Math.max(top, top + (bottom - top) / 2));
      const visibleBlock = point && page.contains(point) && !host.contains(point) ? point.closest<HTMLElement>(CONTEXT_BLOCKS) : null;
      const nextAnchor = visibleRemembered ? remembered : visibleBlock || (anchor?.isConnected ? anchor : null);
      if (!nextAnchor) {
        setError("Select or focus a Recognition frame, source inspector, or section first so the canvas can open immediately below that context.");
        return;
      }
      setError("");
      setAnchor(nextAnchor);
      setCollapsed(false);
      setOpen(true);
    };
    document.addEventListener("pointerdown", remember, true);
    document.addEventListener("focusin", remember, true);
    window.addEventListener("workbench:open-temporal-events", show);
    return () => {
      document.removeEventListener("pointerdown", remember, true);
      document.removeEventListener("focusin", remember, true);
      window.removeEventListener("workbench:open-temporal-events", show);
    };
  }, [active, enabled, anchor, host, root]);
  useLayoutEffect(() => {
    if (open && active && enabled && anchor?.isConnected) anchor.after(host);
    else host.remove();
    return () => host.remove();
  }, [open, active, enabled, anchor, host]);
  useEffect(() => {
    if (!open || !anchor || !root.current) return;
    const observer = new MutationObserver(() => {
      if (anchor.isConnected) return;
      setOpen(false);
      setError("The canvas context is no longer visible. Select the current Recognition context and open the canvas again.");
    });
    observer.observe(root.current, { childList: true, subtree: true });
    return () => observer.disconnect();
  }, [open, anchor, root]);
  return <>
    {error && active && <p role="alert">{error}</p>}
    {createPortal(<MenuVisibilityBoundary visible={open && active && enabled}>
      <header className="video-import-temporal-canvas-heading">
        <div><h2>Temporal events &amp; learned rules</h2><small>Sequence: {sequenceId || "not selected"}{frameId ? ` · Frame: ${frameId}` : " · No frame selected"}</small></div>
        <button type="button" aria-expanded={!collapsed} onClick={() => setCollapsed(value => !value)}>{collapsed ? "Expand canvas" : "Collapse canvas"}</button>
        <button type="button" onClick={() => setOpen(false)}>Close canvas</button>
      </header>
      <MenuVisibilityBoundary visible={!collapsed}>{children}</MenuVisibilityBoundary>
    </MenuVisibilityBoundary>, host)}
  </>;
}
