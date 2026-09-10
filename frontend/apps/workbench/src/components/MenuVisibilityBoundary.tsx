import { Activity, createContext, useContext, useEffect, useLayoutEffect, useRef, useState, type ReactNode } from "react";
import { MenuVisibilitySettings } from "./MenuVisibilitySettings";

const MenuSurfaceLifecycleContext = createContext({ paused: false, suspensionEpoch: 0 });
export const useMenuSurfaceLifecycle = () => useContext(MenuSurfaceLifecycleContext);

export function MenuVisibilityBoundary({ visible, children }: { visible: boolean; children: ReactNode }) {
  const [visited, setVisited] = useState(visible);
  const parent = useMenuSurfaceLifecycle();
  const paused = useRef(!visible);
  const wasVisible = useRef(visible);
  const suspensionEpoch = useRef(0);
  paused.current = !visible;
  useLayoutEffect(() => {
    if (wasVisible.current && !visible) suspensionEpoch.current += 1;
    wasVisible.current = visible;
  }, [visible]);
  const lifecycle = useRef({
    get paused() { return paused.current || parent.paused; },
    get suspensionEpoch() { return suspensionEpoch.current + parent.suspensionEpoch; },
  });
  if (visible && !visited) setVisited(true);
  // Activity releases effects/listeners, unlike CSS hiding. Drafts remain only
  // in their original component state; initially disabled routes never mount.
  return visited ? <MenuSurfaceLifecycleContext.Provider value={lifecycle.current}><Activity mode={visible ? "visible" : "hidden"}>{children}</Activity></MenuSurfaceLifecycleContext.Provider> : null;
}

export function MenuVisibilityRecovery({ label }: { label: string }) {
  return <section className="menu-visibility-recovery" role="region" aria-label="Hidden page">
    <h1>{label} is hidden</h1>
    <p>This page is disabled in your display settings. Any already-open editor state is retained in this tab while its effects are paused. Re-enable it here to continue editing before navigating away.</p>
    <MenuVisibilitySettings />
  </section>;
}

export function MenuVisibilityDialog({ onClose }: { onClose: () => void }) {
  const ref = useRef<HTMLDialogElement>(null);
  useEffect(() => {
    const previous = document.activeElement;
    ref.current?.showModal();
    return () => {
      ref.current?.close();
      if (previous instanceof HTMLElement && previous.isConnected) previous.focus();
    };
  }, []);
  return <dialog className="menu-visibility-dialog" ref={ref} aria-label="Settings / menu visibility" onCancel={onClose}>
    <button className="menu-visibility-close" type="button" onClick={onClose}>Close settings</button>
    <MenuVisibilitySettings />
  </dialog>;
}
