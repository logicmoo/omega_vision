import { createContext, useContext, useState } from "react";
import { isMenuFamilyVisible, type VisibilityMenuItem } from "../lib/menuVisibility";
import { updateUserUiPreferences, useUserUiPreferences, type UserUiPreferences } from "../lib/uiPreferences";
import "../styles/menu_visibility.css";

export const VisibilityMenuContext = createContext<ReadonlyArray<VisibilityMenuItem>>([]);

export function MenuVisibilitySettings() {
  const items = useContext(VisibilityMenuContext);
  const preferences = useUserUiPreferences();
  const [error, setError] = useState("");
  const update = (patch: Partial<UserUiPreferences>) => {
    try {
      updateUserUiPreferences(patch);
      setError("");
    } catch (reason) {
      setError(`Unable to save UI settings: ${String(reason)}`);
    }
  };
  const groups = [...new Set(items.map(item => item.group))];
  return <section className="menu-visibility-settings" aria-label="Menu visibility settings">
    <h2>Menu visibility</h2>
    <p>Display preferences for this browser, not access control. Backend jobs and shared data are unchanged. Newly discovered menu items are shown by default.</p>
    <div className="menu-visibility-masters">
      <label><input type="checkbox" checked={preferences.showOmegaVision} onChange={event => update({ showOmegaVision: event.target.checked })} />Show Omega Vision</label>
      <label><input type="checkbox" checked={preferences.showWorkbench} onChange={event => update({ showWorkbench: event.target.checked })} />Show Workbench</label>
    </div>
    <p>Family switches preserve individual choices. Common Settings / recovery remains available even when every menu item is hidden.</p>
    <fieldset>
      <legend>Workspace navigation</legend>
      <label className="menu-visibility-item">
        <input type="checkbox" checked={preferences.redirectDefaultWorkspaceToArc3} onChange={event => update({ redirectDefaultWorkspaceToArc3: event.target.checked })} />
        <span>Redirect default workspace to ARC3 Random Player
          <small>Applies to the next workspace navigation, not the current editor. Links without a workspace always open ARC3 Random Player.</small>
        </span>
      </label>
    </fieldset>
    {error && <p role="alert">{error}</p>}
    {groups.map(group => <fieldset key={group}>
      <legend>{group}</legend>
      {items.filter(item => item.group === group).map(item => <label className="menu-visibility-item" key={item.id}>
        <input type="checkbox" checked={preferences.menuItemVisibility[item.id] !== false} onChange={event => update({ menuItemVisibility: { [item.id]: event.target.checked } })} />
        <span>{item.label}<small>{item.id}{!isMenuFamilyVisible(item.family, preferences) ? " (family hidden)" : ""}{item.view === "setup" ? " (common recovery stays available)" : ""}</small></span>
      </label>)}
    </fieldset>)}
  </section>;
}
