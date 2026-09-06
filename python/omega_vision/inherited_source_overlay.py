"""inherited_source_overlay.py -- chain-aware resolution of workspace data.

Every data home follows the same exact canonical layout under ``<root>/data/``
(``arc3_games/{recordings,curated,importables}``, ``vision_frames/...``,
``recognition_reduce``, ``video_import``, ``object_memory``, ...). A workspace
sees that layout as an overlay stacked in precedence order:

1. the workspace's own ``data/`` directory,
2. each included workspace's ``data/`` (``workspace.json`` ``includes``,
   nearest first, recursively down the inheritance chain),
3. the shared repo store ``<repo>/data/omega_vision``.

The ``OMEGA_VISION_DATA`` environment variable replaces the whole chain with a
single home (matching the historical single-home contract), and roots outside
the repo ``workspaces/`` container (tests, external checkouts) see only their
own ``root/data`` so temporary fixtures stay hermetic.

Reads prefer the nearest existing hit; writes always target the canonical
write home (:func:`vision_data_root`).
"""
from __future__ import annotations

import os
from pathlib import Path

_REPO_ROOT = Path(__file__).resolve().parents[2]

SHARED_WORKSPACE_ID = "shared_library_system"

# (source, layer_id, data_root): source is one of
# "workspace" | "included" | "shared" | "global".
DataLayer = tuple[str, "str | None", Path]


def _effective_layers(root: Path, workspaces_root: Path) -> list[Path]:
    try:
        from workspace_inheritance import effective_workspace_layers
    except ImportError:  # pragma: no cover - fall back to the packaged twin
        from omega_vision.services.workspace_inheritance import effective_workspace_layers
    return effective_workspace_layers(root, workspaces_root)


def vision_data_root(root: Path) -> Path:
    """The canonical WRITE home for vision data: the env override, the shared
    repo store for real workspaces, or the caller's own data dir (tests,
    external roots)."""
    env = os.environ.get("OMEGA_VISION_DATA")
    if env:
        return Path(env)
    try:
        root.resolve().relative_to((_REPO_ROOT / "workspaces").resolve())
    except ValueError:
        return root / "data"
    return _REPO_ROOT / "data" / "omega_vision"


def data_layers(root: Path) -> list[DataLayer]:
    """Every data layer visible to this root, highest precedence first."""
    env = os.environ.get("OMEGA_VISION_DATA")
    if env:
        return [("global", None, Path(env))]
    workspaces_root = (_REPO_ROOT / "workspaces").resolve()
    try:
        root.resolve().relative_to(workspaces_root)
    except ValueError:
        return [("workspace", root.name, root / "data")]
    layers = [root]
    try:
        layers = _effective_layers(root, workspaces_root)
    except Exception:  # noqa: BLE001 - inheritance problems never hide data
        pass
    result: list[DataLayer] = []
    seen: set[Path] = set()
    resolved_root = root.resolve()
    for layer in reversed(layers):  # workspace first, deepest include last
        home = layer / "data"
        key = home.resolve()
        if key in seen:
            continue
        seen.add(key)
        if layer.resolve() == resolved_root:
            source = "workspace"
        elif layer.name == SHARED_WORKSPACE_ID:
            source = "shared"
        else:
            source = "included"
        result.append((source, layer.name, home))
    result.append(("global", None, _REPO_ROOT / "data" / "omega_vision"))
    return result


def data_homes(root: Path) -> list[Path]:
    """Every data home visible to this root, highest precedence first."""
    return [home for _source, _layer_id, home in data_layers(root)]


def data_rel_of(root: Path, path: Path) -> str:
    """Workspace-facing relative path for a file in the workspace itself or
    in any visible data home (expressed as ``data/<...>`` for data homes).
    Raises ValueError like Path.relative_to when the path is in neither."""
    resolved = path.resolve()
    try:
        return resolved.relative_to(root.resolve()).as_posix()
    except ValueError:
        pass
    for home in data_homes(root):
        try:
            tail = resolved.relative_to(home.resolve()).as_posix()
        except ValueError:
            continue
        return "data" if tail == "." else f"data/{tail}"
    raise ValueError(f"path is outside the workspace and its data homes: {path}")


def resolve_workspace_child(root: Path, relative: str) -> Path:
    """Resolve a workspace-facing relative path. ``data/...`` paths resolve
    down the overlay (nearest existing hit wins, falling back to the canonical
    write home); other paths stay inside the workspace root."""
    rel = str(relative).replace("\\", "/").lstrip("/")
    if rel == "data" or rel.startswith("data/"):
        tail = rel[5:] if len(rel) > 5 else ""
        for home in data_homes(root):
            resolved_home = home.resolve()
            candidate = (resolved_home / tail).resolve() if tail else resolved_home
            if candidate != resolved_home and resolved_home not in candidate.parents:
                raise ValueError("path escapes workspace data home")
            if candidate.exists():
                return candidate
        write_home = vision_data_root(root).resolve()
        candidate = (write_home / tail).resolve() if tail else write_home
        if candidate != write_home and write_home not in candidate.parents:
            raise ValueError("path escapes workspace data home")
        return candidate
    resolved_root = root.resolve()
    resolved = (resolved_root / relative).resolve()
    if resolved != resolved_root and resolved_root not in resolved.parents:
        raise ValueError("path escapes workspace root")
    return resolved
