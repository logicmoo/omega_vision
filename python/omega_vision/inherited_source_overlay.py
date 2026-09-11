"""Omega storage boundary, independent of workbench configuration inheritance.

Repository workspaces share repo/data/omega_vision. Unrecognized external roots
are rejected; tests explicitly configure a temporary repository. No resolver migrates
data, discovers workspace overlays, or creates directories.
"""
from __future__ import annotations

import os
from pathlib import Path

_REPO_ROOT = Path(__file__).resolve().parents[2]
SHARED_WORKSPACE_ID = "shared_library_system"
OMEGA_PROVIDER_ID = "filesystem:omega_vision"
OMEGA_STORAGE_ID = "omega_vision"
DataLayer = tuple[str, "str | None", Path]

def retired_sequence_location(relative: Path) -> bool:
    """Retired sequence roots remain inventory/history only, never active sources."""
    parts = tuple(part.casefold() for part in relative.parts)
    if parts[:1] == ("vision_frames",):
        parts = parts[1:]
    return bool(parts and parts[0] in {"arc_recordings", "arc3_recordings"})


def resolve_storage_path(path: Path) -> Path:
    """Normalize equivalent Windows device prefixes after resolving symlinks.

    Windows realpath can retain the extended prefix when a concurrent writer
    creates a previously missing directory during resolution.
    """
    resolved = path.resolve()
    value = str(resolved)
    if os.name == "nt":
        if value.startswith("\\\\?\\UNC\\"):
            return Path("\\\\" + value[8:])
        if value.startswith("\\\\?\\") and len(value) >= 7 and value[5:7] == ":\\":
            return Path(value[4:])
    return resolved


def vision_data_root(root: Path) -> Path:
    """Return the one repository home; no external or fixture-layout fallback."""
    root = resolve_storage_path(Path(root))
    repo = resolve_storage_path(_REPO_ROOT)
    canonical = repo / "data" / "omega_vision"
    if resolve_storage_path(canonical) != canonical:
        raise ValueError("Canonical Omega root cannot redirect to another physical directory")
    env = os.environ.get("OMEGA_VISION_DATA")
    if root in {repo, repo / "data"} or root.is_relative_to(repo / "workspaces") or root.is_relative_to(canonical):
        if env and Path(env).resolve() != canonical.resolve():
            raise ValueError("Configured Omega root is unavailable: repository data must remain under data/omega_vision")
        return canonical
    raise ValueError("Unrecognized Omega storage context; select an authorized repository workspace")


def storage_path(root: Path, *parts: str) -> Path:
    """Resolve an Omega-only write target, rejecting traversal and symlink escape."""
    home = resolve_storage_path(vision_data_root(root))
    target = resolve_storage_path(home.joinpath(*parts))
    if not target.is_relative_to(home):
        raise ValueError("Omega storage path escapes its canonical data root")
    return target


def shared_storage_path(*parts: str) -> Path:
    return storage_path(_REPO_ROOT, *parts)


def authorize_storage_path(path: Path) -> Path:
    """Validate configured physical targets without inventing a fallback."""
    home = shared_storage_path()
    target = resolve_storage_path(path)
    if not target.is_relative_to(home):
        raise PermissionError("Configured Omega path is outside data/omega_vision; explicit selection or migration is required")
    return target


def storage_scratch_directory(family: str) -> Path:
    directory = shared_storage_path("runtime", "scratch", family)
    directory.mkdir(parents=True, exist_ok=True)
    return directory


def data_layers(root: Path) -> list[DataLayer]:
    return [("global", None, vision_data_root(root))]


def data_homes(root: Path) -> list[Path]:
    return [vision_data_root(root)]


def data_rel_of(root: Path, path: Path) -> str:
    """Use logical data/... references even when the caller is the repository."""
    resolved = resolve_storage_path(path)
    home = resolve_storage_path(vision_data_root(root))
    if resolved.is_relative_to(home):
        tail = resolved.relative_to(home).as_posix()
        parts = tail.split("/")
        for family in ("recordings", "curated"):
            if Path(parts[0]) == Path(family):
                parts[0] = family
                tail = "/".join(parts)
        return "data" if tail == "." else f"data/{tail}"
    return resolved.relative_to(root.resolve()).as_posix()


def resolve_workspace_child(root: Path, relative: str) -> Path:
    """Resolve logical data URLs in one home; leave non-Omega config paths alone."""
    rel = str(relative).replace("\\", "/")
    if rel.startswith("/") or Path(rel).is_absolute():
        raise ValueError("Expected a relative workspace path")
    if rel == "data" or rel.startswith("data/"):
        parts = [part for part in rel[5:].split("/") if part and part != "."]
        while parts and Path(parts[0]) == Path("omega_vision"):
            parts.pop(0)
        return storage_path(root, "/".join(parts))
    resolved_root = root.resolve()
    resolved = (resolved_root / rel).resolve()
    if not resolved.is_relative_to(resolved_root):
        raise ValueError("path escapes workspace root")
    return resolved


def sequence_writable(root: Path, path: Path) -> bool:
    """Legacy families remain readable but cannot receive new sequence outputs."""
    home = resolve_storage_path(vision_data_root(root))
    resolved = resolve_storage_path(path)
    return any(resolved.is_relative_to(home / family) for family in ("recordings", "curated"))


def require_sequence_write(root: Path, path: Path) -> Path:
    if not sequence_writable(root, path):
        raise ValueError("Legacy sequence is read-only; explicit migration to recordings/curated is required")
    return storage_path(root, resolve_storage_path(path).relative_to(resolve_storage_path(vision_data_root(root))).as_posix())


def unavailable_legacy_storage(root: Path) -> list[dict[str, str]]:
    """Inventory paths only, never mount, read payloads, or move historical stores."""
    root = root.resolve()
    repo = _REPO_ROOT.resolve()
    home = vision_data_root(root).resolve()
    families = (
        "data", "runtime/memory-settings", "runtime/rule-candidates", "runtime/rule-proposals",
        "runtime/events/visual-sequences", "runtime/event-hypotheses/visual-sequences",
        "runtime/object-checkpoints", "runtime/grouping-checkpoints", "runtime/temporal-checkpoints",
        "runtime/grouping-reviews", "runtime/executions", "design/event-rules", "design/grouping-rules",
        "knowledge/artifacts/memory",
    )
    layers = [root]
    if root.is_relative_to(_REPO_ROOT.resolve() / "workspaces"):
        from workspace_inheritance import effective_workspace_layers
        layers = effective_workspace_layers(root, _REPO_ROOT.resolve() / "workspaces")
    unavailable = [
        {"path": str(layer / family), "workspaceId": layer.name, "status": "unavailable", "migrationRequired": "true",
         "message": "Historical Omega storage outside the canonical root requires explicit migration or selection"}
        for layer in layers
        for family in families
        if (layer / family).exists() and not (layer / family).resolve().is_relative_to(home)
        and not home.is_relative_to((layer / family).resolve())
    ]
    if root in {repo, repo / "data"} or root.is_relative_to(repo / "workspaces"):
        legacy_home = repo / "data"
        if legacy_home.is_dir():
            known = {"recordings", "curated", "importables", "video", "video_import", "videoimports",
                     "arc3_games", "arc_recordings", "vision_frames", "runtime", "knowledge", ".cache"}
            unavailable.extend({
                "path": str(path), "workspaceId": OMEGA_STORAGE_ID, "status": "unavailable", "migrationRequired": "true",
                "message": "Historical sibling Omega storage requires explicit migration or selection",
            } for path in legacy_home.iterdir() if path.name.lower() in known or path.name.lower().startswith("recognition_"))
    return unavailable
