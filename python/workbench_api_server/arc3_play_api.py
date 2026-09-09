"""Live human-play API for ARC3 games.

Hosts real ARC3 environments inside the workbench server so a person can
enumerate games, pick one, and play it move by move in the web UI. Every
move is recorded as a B1->B2 consumable setup directory:

    <workspace>/data/recordings/<game>/saved_<NNN>/
        image.png            initial frame for this attempt
        state.json           initial state payload
        recording.json       ordered move manifest for this attempt dir
                              (includes the "level" this attempt was on --
                              the directory name itself no longer encodes it)
        0/  image.png state.json     first move
        1/  image.png state.json     second move
        ...

A new saved_<NNN> directory starts on every new attempt (reset) and on
every detected level transition; NNN is a game-wide, 0-padded, ever-
increasing rank so concurrent sessions never collide.
"""
from __future__ import annotations

import hashlib
import importlib.util
import json
import os
import re
import sys
import threading
import time
import uuid
from datetime import datetime, timezone
from pathlib import Path
from typing import Any

from fastapi import APIRouter, Body, HTTPException
from fastapi.responses import FileResponse

from resource_store import get_filesystem_provider

router = APIRouter(prefix="/arc3-play", tags=["arc3-play"])
resources = get_filesystem_provider()

_REPO_ROOT = Path(__file__).resolve().parents[2]
_PYTHON_ROOT = _REPO_ROOT / "python"

# Chain-aware data resolution lives in the shared overlay module: every data
# home follows the same canonical layout under <root>/data/, stacked as
# workspace -> included workspaces -> shared repo store (see module docs).
from omega_vision.inherited_source_overlay import (  # noqa: E402
    data_homes as _data_homes,
    data_rel_of as _data_rel_of,
    resolve_workspace_child as _resolve_workspace_child,
    vision_data_root as _vision_data_root,
    storage_path as _storage_path, shared_storage_path as _shared_storage_path,
    authorize_storage_path as _authorize_storage_path,
    require_sequence_write as _require_sequence_write, sequence_writable as _sequence_writable,
)

_THUMBNAIL_CACHE_DIR: Path | None = None


def _safe_workspace_child(root: Path, relative: str) -> Path:
    try:
        return _authorize_storage_path(_resolve_workspace_child(root, relative))
    except PermissionError as error:
        raise ValueError(str(error)) from error


def _writable_game_dirs(root: Path, game_id: str | None) -> list[Path]:
    directories = _game_dirs_for(root, _game_slug(game_id)) if game_id else _all_game_dirs(root)
    try:
        return [_require_sequence_write(root, directory) for directory in directories]
    except ValueError as error:
        raise HTTPException(status_code=409, detail=str(error)) from error
_THUMBNAIL_SCALE = 4

_engine_lock = threading.Lock()
_catalog_cache: tuple[float, list[dict[str, Any]]] | None = None
_CATALOG_TTL_SECONDS = 600.0

_sessions: dict[str, "PlaySession"] = {}
_sessions_lock = threading.Lock()
_savepoints_lock = threading.Lock()


def _load_savepoints(path: Path) -> list[dict[str, Any]]:
    try:
        loaded = resources.read_config_json(path)
        return list(loaded) if isinstance(loaded, list) else []
    except (OSError, ValueError):
        return []


def _ensure_python_path() -> None:
    path = str(_PYTHON_ROOT)
    if path not in sys.path:
        sys.path.insert(0, path)


def _load_runner_module() -> Any:
    _ensure_python_path()
    try:
        import arc3_runner
    except Exception as error:  # pragma: no cover - environment-specific
        raise HTTPException(
            status_code=503,
            detail=f"ARC3 engine unavailable: {error}",
        ) from error
    return arc3_runner


def _utc_now() -> str:
    return datetime.now(timezone.utc).isoformat().replace("+00:00", "Z")


def _slug(value: str) -> str:
    cleaned = re.sub(r"[^A-Za-z0-9_.-]+", "_", str(value).strip())
    return cleaned.strip("._") or "unknown"


def _game_slug(game_id: str) -> str:
    value = str(game_id).strip()
    match = re.fullmatch(r"([A-Za-z0-9]+)-[0-9A-Fa-f]{8}", value)
    return _slug(match.group(1) if match else value)


_RANKED_SAVED_DIR_RE = re.compile(r"^saved_(?P<rank>\d+)$")
# Legacy naming this rename replaces: level_<level>_<rank> (a mistake from
# months ago -- the level was redundantly baked into the directory name
# instead of just recording.json). Still recognized when reading existing
# workspaces and when computing the next rank, but never written anymore.
_RANKED_LEVEL_DIR_RE = re.compile(r"^level_(?P<level>[^_]+)_(?P<rank>\d+)$")
_data_layout_lock = threading.RLock()
_migrated_arc3_roots: set[Path] = set()

# Legacy layout containers merged up into the flat data layout by
# _migrate_arc3_games_root, and the manifest path tokens they leave behind.
_LEGACY_PATH_REWRITES = (
    ("data/Recordings/", "data/recordings/"),
    ("data/arc3_games/recordings/", "data/recordings/"),
    ("data/arc3_games/importables/", "data/importables/"),
    ("data/arc3_games/curated/", "data/curated/"),
    ("data/vision_frames/video/", "data/video/"),
    ("data/vision_frames/arc_recordings/", "data/arc_recordings/"),
    ("data/vision_frames/curated_data/", "data/curated_data/"),
    ("data/vision_frames/image_archives/", "data/image_archives/"),
    ("data/vision_frames/recognition_inputs/", "data/recognition_inputs/"),
    ("data/vision_frames/live_streams/", "data/live_streams/"),
)


def _file_digest(path: Path) -> bytes:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        while chunk := handle.read(1024 * 1024):
            digest.update(chunk)
    return digest.digest()


def _merge_legacy_tree(source: Path, destination: Path) -> None:
    resources.make_directory(destination)
    for entry in resources.iterdir(source):
        target = destination / entry.name
        if entry.is_dir():
            _merge_legacy_tree(entry, target)
            continue
        if not target.exists():
            resources.move(entry, target)
            continue
        if (
            entry.stat().st_size == target.stat().st_size
            and _file_digest(entry) == _file_digest(target)
        ):
            resources.delete_file(entry)
            continue
        raise RuntimeError(
            f"cannot merge legacy ARC3 data; conflicting files: {entry} and {target}"
        )
    source.rmdir()


def _is_same_dir(a: Path, b: Path) -> bool:
    """True when both paths refer to one existing directory (guards the
    Recordings -> recordings migration on case-insensitive filesystems)."""
    try:
        return a.samefile(b)
    except OSError:
        return False


def _migrate_arc3_games_root(root: Path) -> Path:
    """Compatibility name only: layout lookup must never migrate operator data."""
    from omega_vision.inherited_source_overlay import storage_path
    return storage_path(root, "recordings")


def _importables_container(root: Path) -> Path:
    _migrate_arc3_games_root(root)
    return _vision_data_root(root) / "importables"


def _importables_containers(root: Path) -> list[Path]:
    """Every visible importables dir, workspace overrides first (legacy
    arc3_games/ locations kept readable for unmigrated data homes)."""
    _migrate_arc3_games_root(root)
    containers: list[Path] = []
    for home in _data_homes(root):
        containers.append(home / "importables")
        containers.append(home / "arc3_games" / "importables")
    return containers


def _curated_games_container(root: Path) -> Path:
    _migrate_arc3_games_root(root)
    return _vision_data_root(root) / "curated"


def _curated_games_containers(root: Path) -> list[Path]:
    """Every visible curated-games dir, workspace overrides first (legacy
    arc3_games/ locations kept readable for unmigrated data homes)."""
    _migrate_arc3_games_root(root)
    containers: list[Path] = []
    for home in _data_homes(root):
        containers.append(home / "curated")
        containers.append(home / "arc3_games" / "curated")
    return containers


def _games_container(root: Path) -> Path:
    """The canonical home for recordings: data/recordings/<game>/.

    All NEW recordings (live play sessions and imports alike) are written
    here. Some data homes may still have artifacts at the older
    arc3_games/recordings/ or Recordings/ locations -- see
    _game_dirs_for()/_all_game_dirs(), which read the legacy containers too
    so nothing already on disk is hidden from listings.
    """
    return _vision_data_root(root) / "recordings"


def _game_write_dir(root: Path, game_dir: str) -> Path:
    """Where a specific game's new recordings/savepoints are written."""
    _migrate_arc3_games_root(root)
    return _storage_path(root, "recordings", game_dir)


def _game_dirs_for(root: Path, game_dir: str) -> list[Path]:
    """Every existing directory for one game across all visible data homes:
    new location first, then legacy container locations."""
    candidates = [_game_write_dir(root, game_dir)]
    for home in _data_homes(root):
        candidates.append(home / "recordings" / game_dir)
        candidates.append(home / "arc3_games" / "recordings" / game_dir)
        candidates.append(home / "Recordings" / game_dir)
    seen: set[Path] = set()
    result: list[Path] = []
    for candidate in candidates:
        if candidate in seen or not candidate.is_dir():
            continue
        seen.add(candidate)
        result.append(candidate)
    return result


def _all_game_dirs(root: Path) -> list[Path]:
    """Every per-game recording directory across all visible data homes:
    data/recordings/<game> plus legacy container locations."""
    seen: set[Path] = set()
    result: list[Path] = []
    recordings_root = _migrate_arc3_games_root(root)
    containers = [recordings_root]
    for home in _data_homes(root):
        containers.append(home / "recordings")
        containers.append(home / "arc3_games" / "recordings")
        containers.append(home / "Recordings")
    for container in containers:
        if not container.is_dir():
            continue
        for path in resources.iterdir(container):
            if path.is_dir() and path.resolve() not in seen:
                seen.add(path.resolve())
                result.append(path)
    return result


def _next_ranked_saved_dir_name(container: Path) -> str:
    """saved_<NNN>, continuing from the highest existing NNN under container
    (0-padded to at least 3 digits, starting at 001). Game-wide (not scoped
    per level) -- which level an attempt was on lives in recording.json, not
    the directory name. Legacy level_<level>_<rank> siblings (the old, now
    retired naming) contribute their rank too, so numbering stays strictly
    increasing across the rename for workspaces that already have them.
    Unranked/legacy-timestamped siblings (bare level_1, level_1_<stamp>_<ns>)
    are ignored -- they don't participate in or block this numbering."""
    highest = 0
    if container.is_dir():
        for entry in resources.iterdir(container):
            if not entry.is_dir():
                continue
            match = _RANKED_SAVED_DIR_RE.fullmatch(entry.name) or _RANKED_LEVEL_DIR_RE.fullmatch(entry.name)
            if not match:
                continue
            try:
                highest = max(highest, int(match.group("rank")))
            except ValueError:
                continue
    return f"saved_{highest + 1:03d}"


_SIZE_RANK_SUFFIX_RE = re.compile(r"^(?P<base>.+)_size_(?P<rank>\d+)$")


def _strip_size_suffix(name: str) -> str:
    """Undo a previous "Sort dirs by size" rename (see _rerank_imports_by_size_in)
    so re-ranking after new imports land is idempotent instead of piling up
    _size_..._size_... suffixes."""
    match = _SIZE_RANK_SUFFIX_RE.fullmatch(name)
    return match.group("base") if match else name


def _import_instance_dir_name(container: Path, base: str, attempt_index: int) -> str:
    """Directory name for one attempt/level dir produced by an import: the
    import's own natural name (source file stem for a human-JSONL import,
    or the release-run's own timestamp dir name) for the first attempt,
    then base_attempt2, base_attempt3, ... for further level transitions
    inside the same import run -- recording.json still records which level
    each attempt was actually on. A trailing numeric suffix is added on top
    if that name still collides with something already on disk (e.g. a
    second, differently-sourced import that happens to share a name)."""
    slug = _slug(base) or "import"
    name = slug if attempt_index <= 1 else f"{slug}_attempt{attempt_index}"
    if not (container / name).exists():
        return name
    suffix = 2
    while (container / f"{name}_{suffix}").exists():
        suffix += 1
    return f"{name}_{suffix}"


def _iter_recording_dirs(game_root: Path) -> list[Path]:
    """Every per-attempt recording directory directly under one game root,
    identified by containing a recording.json (robust regardless of naming
    convention: the current saved_<NNN> live-play naming, an import's own
    suggested name, a size-ranked import name, or the retired legacy
    level_<n>_<rank> naming)."""
    if not game_root.is_dir():
        return []
    entries = [
        entry
        for entry in resources.iterdir(game_root)
        if entry.is_dir() and (entry / "recording.json").is_file()
    ]
    return sorted(entries, key=lambda entry: entry.name)


def _looks_like_image_set_dir(entry: Path) -> bool:
    """True when a directory holds an image set in any accepted layout:
    a recording.json manifest, move subdirs (0/ 1/ 2/ ... or free-form
    foo/ bar/) with an image.png each, or a flat directory of frame *.png
    files."""
    if (entry / "recording.json").is_file():
        return True
    try:
        for child in resources.iterdir(entry):
            if child.is_dir() and (child / "image.png").is_file():
                return True
            if child.is_file() and child.suffix.lower() == ".png":
                return True
    except OSError:
        return False
    # Curated-style sets keep images in nested subdirs; accept any dir that
    # holds at least one image anywhere below it (short-circuits on the first).
    try:
        for sub in resources.rglob(entry, "*"):
            if sub.is_file() and sub.suffix.lower() in {".png", ".jpg", ".jpeg", ".gif", ".webp", ".bmp"}:
                return True
    except OSError:
        return False
    return False


def _iter_image_set_dirs(game_root: Path) -> list[Path]:
    """Superset of _iter_recording_dirs: every child directory holding an
    image set, INCLUDING legacy/manual sets without a recording.json -- the
    Recordings tab lists the full population, not only manifest-bearing
    dirs."""
    if not game_root.is_dir():
        return []
    entries = [
        entry
        for entry in resources.iterdir(game_root)
        if entry.is_dir() and _looks_like_image_set_dir(entry)
    ]
    return sorted(entries, key=lambda entry: entry.name)


def _workspace_root(workspace_id: str) -> Path:
    from workspace_api import _resolve_workspace_without_counts

    try:
        workspace = _resolve_workspace_without_counts(workspace_id)
    except KeyError as error:
        raise HTTPException(status_code=404, detail=str(error)) from error
    return Path(workspace["root"]).resolve()


def _jsonable(value: Any) -> Any:
    module = _load_runner_module()
    return module._jsonable(value)


# Mirrors Arc3B1B2PipelinePage.tsx's scanSetupStatePath bucketing exactly (same
# suffix/name rules, same result-object shape) so every recorded move already
# carries a "scan" block and is natively usable as a B1->B2 SETUP source with
# no separate manual scan pass required.
_SCAN_IMAGE_SUFFIXES = {".png", ".jpg", ".jpeg", ".gif", ".webp", ".bmp", ".svg"}


def _scan_setup_dir(directory: Path, root: Path) -> dict[str, Any]:
    results: dict[str, list[str]] = {
        "obj_images": [],
        "grp_images": [],
        "sub_images": [],
        "pl_files": [],
        "eng_files": [],
        "json_files": [],
        "metta_files": [],
        "prompt_files": [],
        "unknown_files": [],
    }
    if directory.is_dir():
        for entry in resources.iterdir(directory):
            if not entry.is_file():
                continue
            suffix = entry.suffix.lower()
            name = entry.name.lower()
            try:
                candidate = _data_rel_of(root, entry)
            except ValueError:
                candidate = entry.as_posix()
            if suffix in _SCAN_IMAGE_SUFFIXES:
                if name.startswith("obj"):
                    results["obj_images"].append(candidate)
                elif name.startswith("grp"):
                    results["grp_images"].append(candidate)
                else:
                    results["sub_images"].append(candidate)
            elif suffix == ".pl":
                results["pl_files"].append(candidate)
            elif suffix == ".json":
                results["json_files"].append(candidate)
            elif suffix == ".metta":
                results["metta_files"].append(candidate)
            elif suffix == ".prompt":
                results["prompt_files"].append(candidate)
            elif "eng" in name:
                results["eng_files"].append(candidate)
            else:
                results["unknown_files"].append(candidate)
    for values in results.values():
        values.sort()
    try:
        path = _data_rel_of(root, directory)
    except ValueError:
        path = directory.as_posix()
    return {"path": path, "results": results}


class PlaySession:
    """One live ARC3 environment plus its flat 0/1/2 move recording."""

    def __init__(
        self,
        workspace_id: str,
        workspace_root: Path,
        game_id: str,
        recordings_path: str | None = None,
    ) -> None:
        module = _load_runner_module()
        self.id = uuid.uuid4().hex
        self.workspace_id = workspace_id
        self.workspace_root = workspace_root
        self.game_id = str(game_id)
        self.game_dir = _game_slug(self.game_id)
        self.created_at = _utc_now()
        self.lock = threading.RLock()
        self.closed = False
        self._autosave_id = uuid.uuid4().hex[:12]
        # Whether game moves are written to the recorder. A new session starts
        # attached (record button pressed); Clear detaches it and only the
        # Begin-recording control re-attaches (into a fresh level dir).
        self.recording = True
        # Optional per-session override of where recordings/savepoints are
        # written (relative to workspace_root); None means the default
        # data/recordings/<game>/ location. See set_recordings_path().
        self.recordings_root: Path | None = None
        if recordings_path:
            self.set_recordings_path(recordings_path)
        with _engine_lock:
            self.runner = module.Arc3Runner(
                game_id=self.game_id,
                render_mode=None,
                capture_terminal=True,
                tree_root=_storage_path(workspace_root, "runtime", "states", "play_action_trees"),
            )
        self.level_dirs: list[Path] = []
        self.moves: list[dict[str, Any]] = []
        self._level_moves: list[dict[str, Any]] = []
        # Deterministic recipe from env creation to now: step/reset ops.
        self.replay_log: list[dict[str, Any]] = []
        self.forked_from: str | None = None
        self._last_level = self.runner.current_level_label()
        self._begin_level_dir(reason="session_start")

    # ---- recording ----------------------------------------------------

    def _frame_png(self) -> bytes:
        _ensure_python_path()
        from image_codec import frame_to_png_bytes

        return frame_to_png_bytes(self.runner.current_grid())

    def _recordings_container(self) -> Path:
        """Where this session currently writes new level dirs/savepoints.json:
        the custom override if one was set, else the default
        data/recordings/<game>/ location."""
        if self.recordings_root is not None:
            from omega_vision.inherited_source_overlay import require_sequence_write
            return require_sequence_write(self.workspace_root, self.recordings_root)
        return _game_write_dir(self.workspace_root, self.game_dir)

    def set_recordings_path(self, relative_path: str | None) -> None:
        """Override (or, with None/empty, reset to default) where this
        session's FUTURE level dirs and savepoints.json are written. Does not
        move anything already on disk. relative_path is resolved against
        workspace_root and must stay inside it."""
        if not relative_path or not relative_path.strip():
            self.recordings_root = None
            return
        resolved = _safe_workspace_child(self.workspace_root, relative_path.strip())
        from omega_vision.inherited_source_overlay import require_sequence_write
        require_sequence_write(self.workspace_root, resolved)
        resources.make_directory(resolved)
        self.recordings_root = resolved

    def set_recording(self, enabled: bool) -> None:
        """Attach or detach the recorder.

        Detaching stops all disk writes (level dirs, nodes, recording.json,
        autosaves) while the game keeps playing. Re-attaching begins a fresh
        level dir so a detached stretch never dirties an old recording.
        """
        with self.lock:
            self._require_open()
            if enabled and not self.recording:
                self.recording = True
                self._begin_level_dir(reason="recording_resumed")
            elif not enabled:
                self.recording = False

    def _begin_level_dir(self, reason: str) -> None:
        level = self.runner.current_level_label()
        if not self.recording:
            # Detached: track the level marker but touch nothing on disk.
            self._level_moves = []
            self._last_level = level
            return
        container = self._recordings_container()
        name = _next_ranked_saved_dir_name(container)
        directory = container / name
        resources.make_directory(directory)
        self.level_dir = directory
        self.level_dirs.append(directory)
        self._level_moves = []
        self._last_level = level
        self._write_node(directory, incoming_action=None, action_data={}, ordinal=None)
        self._write_recording(reason=reason)

    def _write_node(
        self,
        directory: Path,
        *,
        incoming_action: str | None,
        action_data: dict[str, Any],
        ordinal: int | None,
    ) -> dict[str, Any]:
        resources.make_directory(directory)
        try:
            png = self._frame_png()
        except Exception:
            png = b""
        if png:
            resources.write_bytes(directory / "image.png", png)
        payload = {
            **self.runner._state_payload(),
            "game_id": self.game_id,
            "game_directory": self.game_dir,
            "image_hash": hashlib.sha256(png).hexdigest()[:16] if png else None,
            "incoming_action": incoming_action,
            "action_directory": str(ordinal) if ordinal is not None else None,
            "action_data": _jsonable(action_data),
            "parent_node": ".." if ordinal is not None else None,
            "action_path": [str(index) for index in range(ordinal + 1)] if ordinal is not None else [],
            "recorded_at": _utc_now(),
            "scan": _scan_setup_dir(directory, self.workspace_root),
        }
        resources.write_config_json(
            directory / "state.json",
            payload,
            ensure_ascii=False,
            trailing_newline=False,
        )
        return payload

    def _write_recording(self, reason: str = "move") -> None:
        if not self.recording:
            return
        manifest = {
            "kind": "arc3_play_recording",
            "session_id": self.id,
            "game_id": self.game_id,
            "game_directory": self.game_dir,
            "level": self._last_level,
            "level_directory": self._relative(self.level_dir),
            "started_at": self.created_at,
            "updated_at": _utc_now(),
            "last_event": reason,
            "moves": self._level_moves,
        }
        resources.write_config_json(
            self.level_dir / "recording.json",
            manifest,
            ensure_ascii=False,
            trailing_newline=False,
        )

    def _relative(self, path: Path) -> str:
        # data_rel_of tries the workspace root first, then maps files living
        # in any visible data home to their workspace-facing data/... path --
        # recordings live in the global data home, so plain relative_to would
        # leak an absolute path the asset route cannot serve.
        try:
            return _data_rel_of(self.workspace_root, path)
        except ValueError:
            return path.as_posix()

    # ---- gameplay -----------------------------------------------------

    def act(self, action: str, x: int | None = None, y: int | None = None) -> dict[str, Any]:
        with self.lock:
            self._require_open()
            with _engine_lock:
                self.runner.step(action, x=x, y=y)
            data = {key: value for key, value in (("x", x), ("y", y)) if value is not None}
            op: dict[str, Any] = {"op": "step", "action": str(action).upper(), "data": data}
            level = self.runner.current_level_label()
            if level != self._last_level:
                move = self._record_level_transition(action, x, y, level)
            else:
                move = self._record_move(action, x, y)
            op["directory"] = move.get("directory")
            op["level"] = move.get("level")
            self.replay_log.append(op)
            self._autosave()
            return move

    def _record_move(self, action: str, x: int | None, y: int | None) -> dict[str, Any]:
        ordinal = len(self._level_moves)
        directory = self.level_dir / str(ordinal)
        data = {key: value for key, value in (("x", x), ("y", y)) if value is not None}
        if self.recording:
            payload = self._write_node(
                directory,
                incoming_action=str(action).upper(),
                action_data=data,
                ordinal=ordinal,
            )
        else:
            # Detached: the move happens and is tracked in memory, but nothing
            # is written to the recorder.
            payload = {**self.runner._state_payload(), "recorded_at": _utc_now()}
        move = {
            "index": ordinal,
            "action": str(action).upper(),
            "data": data,
            "directory": self._relative(directory) if self.recording else None,
            "state": payload.get("state"),
            "level": payload.get("level"),
            "recorded_at": payload.get("recorded_at"),
        }
        self._level_moves.append(move)
        self.moves.append(move)
        self._write_recording()
        return move

    def _record_level_transition(
        self, action: str, x: int | None, y: int | None, level: str
    ) -> dict[str, Any]:
        # The winning move is recorded in the level it finished, then a fresh
        # stamped directory begins for the newly loaded level.
        move = self._record_move(action, x, y)
        move["level_completed"] = self._last_level
        self._write_recording(reason="level_complete")
        self._begin_level_dir(reason="level_start")
        return move

    def reset(self) -> None:
        with self.lock:
            self._require_open()
            with _engine_lock:
                self.runner.reset(clear_history=True)
            self._begin_level_dir(reason="new_attempt")
            self.replay_log.append({"op": "reset", "level": self._last_level})
            self._autosave()

    def undo(self, count: int = 1) -> dict[str, Any]:
        # Artificial rewind: games are deterministic, so RESET the current
        # level and replay every recorded move except the last `count`.
        # While recording, the rewind BRANCHES: the previous play's level dir
        # is left untouched and the replayed moves are re-recorded into a
        # fresh level dir, so nothing already on disk is overwritten.
        with self.lock:
            self._require_open()
            if not self._level_moves:
                raise ValueError("no moves to undo in this level")
            count = max(1, min(int(count), len(self._level_moves)))
            replay = list(self._level_moves[:-count])
            rewound = list(self._level_moves[-count:])
            branched = [dict(move) for move in replay]
            with _engine_lock:
                self.runner.reset(clear_history=True)
            if self.recording:
                self._begin_level_dir(reason="undo_branch")
            with _engine_lock:
                for index, move in enumerate(branched):
                    data = move.get("data") or {}
                    self.runner.step(
                        move["action"], x=data.get("x"), y=data.get("y")
                    )
                    if self.recording:
                        directory = self.level_dir / str(index)
                        payload = self._write_node(
                            directory,
                            incoming_action=str(move["action"]).upper(),
                            action_data=dict(data),
                            ordinal=index,
                        )
                        move["directory"] = self._relative(directory)
                        move["recorded_at"] = payload.get("recorded_at")
            self._level_moves = branched
            for move in reversed(rewound):
                if self.moves and self.moves[-1] is move:
                    self.moves.pop()
                if self.replay_log and self.replay_log[-1].get("op") == "step":
                    self.replay_log.pop()
            # The main move log keeps object identity with _level_moves, so
            # swap the replayed tail for the branched copies.
            if branched and len(self.moves) >= len(branched) and all(
                self.moves[-len(branched) + offset] is replay[offset] for offset in range(len(branched))
            ):
                self.moves[-len(branched):] = branched
            # Verify the deterministic replay landed on the recorded frame.
            verified: bool | None = None
            try:
                png = self._frame_png()
                digest = hashlib.sha256(png).hexdigest()[:16] if png else None
                expected_dir = (
                    self.level_dir / str(branched[-1]["index"])
                    if branched
                    else self.level_dir
                )
                expected = resources.read_config_json(
                    expected_dir / "state.json"
                ).get("image_hash")
                verified = bool(digest and expected and digest == expected)
            except Exception:
                verified = None
            self._write_recording(reason="undo")
            self._autosave()
            return {
                "rewound": rewound,
                "count": len(rewound),
                "undone_at": _utc_now(),
                "replay_verified": verified,
            }

    def restart(self) -> None:
        # Full game restart: fresh environment back at level 1 (unlike
        # reset, which only restarts the current level).
        with self.lock:
            self._require_open()
            with _engine_lock:
                old_env = getattr(self.runner, "env", None)
                self.runner.restart_game()
                if hasattr(self.runner, "_pending_level_after_win"):
                    self.runner._pending_level_after_win = None
                close = getattr(old_env, "close", None)
                if callable(close):
                    try:
                        close()
                    except Exception:
                        pass
            self.replay_log = []
            self._begin_level_dir(reason="game_restart")
            self._autosave()

    def fork(self, label: str | None = None) -> dict[str, Any]:
        # Non-disruptive save-point: snapshot the deterministic replay
        # recipe into the game log and keep playing.
        with self.lock:
            self._require_open()
            savepoint = self._savepoint_payload(uuid.uuid4().hex[:12], label)
            self._write_savepoint(savepoint)
            return savepoint

    def _savepoint_payload(self, savepoint_id: str, label: str | None) -> dict[str, Any]:
        return {
            "id": savepoint_id,
            "kind": "arc3_play_savepoint",
            "created_at": _utc_now(),
            "label": str(label).strip() if label else None,
            "game_id": self.game_id,
            "game_directory": self.game_dir,
            "level": self._last_level,
            "level_directory": self._relative(self.level_dir),
            "move_index": len(self._level_moves) - 1 if self._level_moves else None,
            "state": self.runner.state_name(),
            "session_id": self.id,
            "replay_log": [dict(entry) for entry in self.replay_log],
        }

    def _write_savepoint(self, savepoint: dict[str, Any], replace_id: str | None = None) -> None:
        path = self._recordings_container() / "savepoints.json"
        with _savepoints_lock:
            entries = _load_savepoints(path)
            if replace_id:
                entries = [entry for entry in entries if str(entry.get("id")) != replace_id]
            entries.append(savepoint)
            resources.write_config_json(
                path,
                entries,
                ensure_ascii=False,
                trailing_newline=False,
            )

    def _autosave(self) -> None:
        # Rolling backup: one savepoint per session, overwritten after every
        # move so the latest position is always resumable. Skipped while the
        # recorder is detached — nothing may touch the recordings dir then.
        if not self.recording:
            return
        if not any(entry.get("op") == "step" for entry in self.replay_log):
            return
        savepoint = self._savepoint_payload(self._autosave_id, "auto save (latest)")
        self._write_savepoint(savepoint, replace_id=self._autosave_id)

    def replay_recipe(self, recipe: list[dict[str, Any]], forked_from: str) -> None:
        # Re-drive the session through the normal act/reset path so every
        # replayed move is recorded exactly like live play.
        for entry in recipe:
            op = str(entry.get("op") or "")
            if op == "reset":
                self.reset()
            elif op == "step":
                data = entry.get("data") or {}
                self.act(str(entry.get("action")), x=data.get("x"), y=data.get("y"))
        self.forked_from = forked_from
        with self.lock:
            self._write_recording(reason="fork_resume")

    def close(self) -> None:
        with self.lock:
            if self.closed:
                return
            self.closed = True
            self._write_recording(reason="session_closed")
            environment = getattr(self.runner, "env", None)
            close = getattr(environment, "close", None)
            if callable(close):
                try:
                    close()
                except Exception:
                    pass

    def _require_open(self) -> None:
        if self.closed:
            raise HTTPException(status_code=409, detail="play session is closed")

    # ---- snapshots ----------------------------------------------------

    def _available_actions(self) -> list[dict[str, Any]]:
        _ensure_python_path()
        from arc3_runner import action_name, is_complex_action

        observation = self.runner.current_observation
        raw_available = getattr(observation, "available_actions", None)
        available_values: set[int] | None = None
        if isinstance(raw_available, (list, tuple)) and raw_available:
            try:
                available_values = {int(item) for item in raw_available}
            except (TypeError, ValueError):
                available_values = None
        friendly = {
            "ACTION1": "UP",
            "ACTION2": "DOWN",
            "ACTION3": "LEFT",
            "ACTION4": "RIGHT",
            "ACTION5": "SPACE",
            "ACTION6": "CLICK",
            "ACTION7": "UNDO",
        }
        actions: list[dict[str, Any]] = []
        for candidate in self.runner.action_space:
            name = action_name(candidate).upper().split(".")[-1]
            if name == "RESET":
                continue
            value = getattr(candidate, "value", None)
            enabled = True
            if available_values is not None and isinstance(value, int):
                enabled = value in available_values
            actions.append(
                {
                    "id": name,
                    "label": friendly.get(name, name),
                    "complex": is_complex_action(candidate),
                    "enabled": enabled,
                }
            )
        return actions

    def snapshot(self, include_moves: bool = True) -> dict[str, Any]:
        with self.lock:
            latest_dir = (
                self.level_dir / str(len(self._level_moves) - 1)
                if self._level_moves
                else self.level_dir
            )
            frame_path = latest_dir / "image.png"
            payload: dict[str, Any] = {
                "id": self.id,
                "workspaceId": self.workspace_id,
                "gameId": self.game_id,
                "gameDirectory": self.game_dir,
                "createdAt": self.created_at,
                "closed": self.closed,
                "state": self.runner.state_name(),
                "level": self.runner.current_level_label(),
                "moveCount": len(self.moves),
                "levelMoveCount": len(self._level_moves),
                "levelDir": self._relative(self.level_dir),
                "levelDirs": [self._relative(path) for path in self.level_dirs],
                "framePath": self._relative(frame_path) if frame_path.is_file() else None,
                "forkedFrom": self.forked_from,
                "recording": self.recording,
                "availableActions": self._available_actions(),
                "replayLog": [dict(entry) for entry in self.replay_log],
                "recordingsPath": self._relative(self._recordings_container()),
                "recordingsPathIsDefault": self.recordings_root is None,
            }
            if include_moves:
                payload["moves"] = list(self.moves)
            return payload


# ---- catalog ------------------------------------------------------------


def _game_catalog(refresh: bool = False) -> list[dict[str, Any]]:
    global _catalog_cache
    now = time.monotonic()
    if not refresh and _catalog_cache and now - _catalog_cache[0] < _CATALOG_TTL_SECONDS:
        return _catalog_cache[1]
    module = _load_runner_module()
    _ensure_python_path()
    import arc_agi

    with _engine_lock:
        arcade = arc_agi.Arcade()
        games = [module.Arc3Runner.game_info(game) for game in (arcade.get_environments() or [])]
    for game in games:
        game["short_id"] = _game_slug(str(game.get("game_id") or ""))
    games.sort(key=lambda game: str(game.get("short_id") or ""))
    if games:
        _catalog_cache = (now, games)
    elif _catalog_cache:
        # Transient empty read (engine hiccup): keep serving the last good
        # catalog instead of caching emptiness for the whole TTL.
        return _catalog_cache[1]
    return games


def _find_game(game_id: str) -> dict[str, Any] | None:
    catalog = _game_catalog()
    return next(
        (game for game in catalog if game.get("short_id") == game_id or game.get("game_id") == game_id),
        None,
    )


def _thumbnail_path(short_id: str) -> Path:
    safe = re.sub(r"[^A-Za-z0-9_.-]", "_", short_id) or "unknown"
    directory = _THUMBNAIL_CACHE_DIR or _shared_storage_path(".cache", "environment_thumbnails")
    return _authorize_storage_path(directory / f"{safe}.png")


def _render_game_preview_png(full_game_id: str) -> bytes:
    """Instantiate the game briefly (offline, no action-tree side effects) and
    PNG-encode its initial frame -- a lightweight one-shot render, not a full
    ``Arc3Runner`` play session (which would also start writing action-tree
    state to disk for every one of the 278+ catalog games)."""
    _ensure_python_path()
    import arc_agi
    from image_codec import extract_latest_frame, frame_to_png_bytes

    with _engine_lock:
        arcade = arc_agi.Arcade(operation_mode=arc_agi.OperationMode.OFFLINE)
        env = arcade.make(full_game_id, include_frame_data=True, render_mode=None)
        if env is None:
            raise RuntimeError(f"could not create environment for {full_game_id}")
        frame = extract_latest_frame(getattr(env, "observation_space", None), env)
        return frame_to_png_bytes(frame, scale=_THUMBNAIL_SCALE)


# ---- routes -------------------------------------------------------------


@router.get("/games")
def list_games(refresh: bool = False) -> dict[str, Any]:
    return {"games": _game_catalog(refresh=refresh)}


@router.post("/games/sync")
def sync_games_from_arc_interactive() -> dict[str, Any]:
    """Notice + import any new games from a sibling ``../arc-interactive``
    checkout (if present) into the local environment_files cache, then bust
    the catalog cache so the next /games list reflects them immediately."""
    _ensure_python_path()
    from arc_interactive_sync import DEFAULT_DEST, DEFAULT_SOURCE, sync_summary

    with _engine_lock:
        summary = sync_summary(DEFAULT_SOURCE, DEFAULT_DEST)
    if summary["copied"] or not _catalog_cache:
        _game_catalog(refresh=True)
    return summary


@router.get("/games/{game_id}/preview")
def game_preview(game_id: str, refresh: bool = False) -> FileResponse:
    game = _find_game(game_id)
    if game is None:
        raise HTTPException(status_code=404, detail=f"unknown game: {game_id}")
    short_id = str(game.get("short_id") or game_id)
    full_id = str(game.get("game_id") or game_id)
    cache_path = _thumbnail_path(short_id)
    if refresh and cache_path.is_file():
        resources.delete_file(cache_path)
    if not cache_path.is_file():
        try:
            png_bytes = _render_game_preview_png(full_id)
        except HTTPException:
            raise
        except Exception as error:
            raise HTTPException(status_code=502, detail=f"could not render preview for {full_id}: {error}") from error
        resources.make_directory(cache_path.parent)
        resources.write_bytes(cache_path, png_bytes)
    return FileResponse(cache_path, media_type="image/png")



@router.get("/sessions")
def list_sessions() -> dict[str, Any]:
    with _sessions_lock:
        sessions = list(_sessions.values())
    return {"sessions": [session.snapshot(include_moves=False) for session in sessions]}


@router.post("/sessions", status_code=201)
def create_session(body: dict[str, Any] = Body(default_factory=dict)) -> dict[str, Any]:
    workspace_id = str(body.get("workspaceId") or "").strip()
    game_id = str(body.get("gameId") or "").strip()
    savepoint_id = str(body.get("savepointId") or "").strip()
    recordings_path = str(body.get("recordingsPath") or "").strip() or None
    replay_ops_raw = body.get("replayLog")
    replay_ops = [dict(op) for op in replay_ops_raw] if isinstance(replay_ops_raw, list) else []
    if not workspace_id or (not game_id and not savepoint_id):
        raise HTTPException(status_code=400, detail="workspaceId and gameId are required")
    root = _workspace_root(workspace_id)
    savepoint: dict[str, Any] | None = None
    if savepoint_id:
        savepoint = _find_savepoint(root, savepoint_id, game_dir=_game_slug(game_id) if game_id else None)
        if savepoint is None:
            raise HTTPException(status_code=404, detail=f"savepoint not found: {savepoint_id}")
        game_id = str(savepoint.get("game_id") or game_id)
    try:
        session = PlaySession(workspace_id, root, game_id, recordings_path=recordings_path)
        if savepoint is not None:
            session.replay_recipe(
                list(savepoint.get("replay_log") or []),
                forked_from=str(savepoint.get("id")),
            )
        elif replay_ops:
            # Play-from-here on a closed session: re-drive the recorded ops
            # into this fresh session (no revival of the old one needed).
            session.replay_recipe(replay_ops, forked_from=str(body.get("forkedFrom") or "history"))
    except HTTPException:
        raise
    except ValueError as error:
        raise HTTPException(status_code=400, detail=str(error)) from error
    except Exception as error:
        raise HTTPException(status_code=400, detail=f"could not start game: {error}") from error
    with _sessions_lock:
        _sessions[session.id] = session
    return {"session": session.snapshot()}


@router.get("/savepoints")
def list_savepoints(workspaceId: str, gameId: str | None = None) -> dict[str, Any]:
    root = _workspace_root(workspaceId)
    entries: list[dict[str, Any]] = []
    directories = _game_dirs_for(root, _game_slug(gameId)) if gameId else _all_game_dirs(root)
    with _savepoints_lock:
        for directory in directories:
            for entry in _load_savepoints(directory / "savepoints.json"):
                summary = {key: value for key, value in entry.items() if key != "replay_log"}
                summary["move_total"] = sum(
                    1 for op in entry.get("replay_log") or [] if op.get("op") == "step"
                )
                level_directory = entry.get("level_directory")
                summary["absolute_directory"] = (
                    str(_safe_workspace_child(root, str(level_directory))) if level_directory else str(directory / "savepoints.json")
                )
                entries.append(summary)
    entries.sort(key=lambda entry: str(entry.get("created_at") or ""), reverse=True)
    return {"savepoints": entries}


def _dedupe_key(entry: dict[str, Any]) -> str:
    imported = entry.get("imported_from")
    if imported:
        return f"import:{imported}"
    return f"log:{json.dumps(entry.get('replay_log') or [], sort_keys=True)}"


def _dedupe_savepoints_in(path: Path) -> int:
    entries = _load_savepoints(path)
    groups: dict[str, list[dict[str, Any]]] = {}
    for entry in entries:
        groups.setdefault(_dedupe_key(entry), []).append(entry)
    kept: list[dict[str, Any]] = []
    removed = 0
    for group in groups.values():
        if len(group) == 1:
            kept.append(group[0])
            continue
        # Same source recording or byte-identical replay recipe: keep the
        # newest entry (freshest label/timestamp), drop the rest.
        group.sort(key=lambda entry: str(entry.get("created_at") or ""))
        kept.append(group[-1])
        removed += len(group) - 1
    if removed:
        resources.write_config_json(
            path,
            kept,
            ensure_ascii=False,
            trailing_newline=False,
        )
    return removed


@router.post("/savepoints/dedupe")
def dedupe_savepoints(workspaceId: str, gameId: str | None = None) -> dict[str, Any]:
    root = _workspace_root(workspaceId)
    directories = _writable_game_dirs(root, gameId)
    removed = 0
    with _savepoints_lock:
        for directory in directories:
            path = directory / "savepoints.json"
            if path.is_file():
                removed += _dedupe_savepoints_in(path)
    return {"removed": removed}


@router.get("/savepoints/{savepoint_id}")
def read_savepoint(savepoint_id: str, workspaceId: str, gameId: str | None = None) -> dict[str, Any]:
    root = _workspace_root(workspaceId)
    entry = _find_savepoint(root, savepoint_id, game_dir=_game_slug(gameId) if gameId else None)
    if entry is None:
        raise HTTPException(status_code=404, detail=f"savepoint not found: {savepoint_id}")
    return {"savepoint": entry}


@router.delete("/savepoints/{savepoint_id}")
def delete_savepoint(savepoint_id: str, workspaceId: str, gameId: str | None = None) -> dict[str, Any]:
    root = _workspace_root(workspaceId)
    directories = _writable_game_dirs(root, gameId)
    with _savepoints_lock:
        for directory in directories:
            path = directory / "savepoints.json"
            entries = _load_savepoints(path)
            kept = [entry for entry in entries if str(entry.get("id")) != savepoint_id]
            if len(kept) != len(entries):
                resources.write_config_json(
                    path,
                    kept,
                    ensure_ascii=False,
                    trailing_newline=False,
                )
                return {"deleted": savepoint_id}
    raise HTTPException(status_code=404, detail=f"savepoint not found: {savepoint_id}")


@router.post("/savepoints/{savepoint_id}/duplicate", status_code=201)
def duplicate_savepoint(savepoint_id: str, workspaceId: str, gameId: str | None = None) -> dict[str, Any]:
    root = _workspace_root(workspaceId)
    directories = _writable_game_dirs(root, gameId)
    with _savepoints_lock:
        for directory in directories:
            path = directory / "savepoints.json"
            entries = _load_savepoints(path)
            for entry in entries:
                if str(entry.get("id")) == savepoint_id:
                    copy = json.loads(json.dumps(entry))
                    copy["id"] = uuid.uuid4().hex[:12]
                    copy["created_at"] = _utc_now()
                    label = str(entry.get("label") or "").strip()
                    copy["label"] = f"{label} (copy)" if label else f"copy of {savepoint_id}"
                    entries.append(copy)
                    resources.write_config_json(
                        path,
                        entries,
                        ensure_ascii=False,
                        trailing_newline=False,
                    )
                    return {"savepoint": {key: value for key, value in copy.items() if key != "replay_log"}}
    raise HTTPException(status_code=404, detail=f"savepoint not found: {savepoint_id}")


# ---- human recording import ----------------------------------------------
#
# Official ARC-AGI-3 recordings (arcprize agents SDK / human plays) are JSONL
# files: one {"timestamp", "data": {frame, state, action_input, ...}} line per
# frame plus a final scorecard line. The importer converts one offline into
# the exact same saved_<NNN>/0..k recording layout the live recorder writes, and
# registers a savepoint whose replay_log can re-drive a real session.

_RECORDING_SKIP_NAMES = {"savepoints.json", "recording.json", "state.json"}


def _sniff_recording_head(path: Path) -> str | None:
    try:
        with path.open("r", encoding="utf-8") as handle:
            head = handle.readline(131072).strip()
    except OSError:
        return None
    if not head.startswith("{") or '"action_input"' not in head or '"frame"' not in head:
        return None
    return head


def _list_recording_files(root: Path) -> list[dict[str, Any]]:
    data_root = _importables_container(root)
    if not data_root.is_dir():
        return []
    found: list[dict[str, Any]] = []
    for path in sorted(resources.rglob(data_root, "*.json")):
        if path.name in _RECORDING_SKIP_NAMES:
            continue
        head = _sniff_recording_head(path)
        if head is None:
            continue
        match = re.search(r'"game_id"\s*:\s*"([^"]+)"', head)
        found.append(
            {
                "path": _data_rel_of(root, path),
                "absolutePath": str(path),
                "name": path.name,
                "gameId": match.group(1) if match else None,
                "sizeBytes": path.stat().st_size,
                "kind": "human-jsonl",
            }
        )
    # Official agent release-runs: <game>/<timestamp>/workspace/log.txt (+ its
    # own bundled arclog.py parser), below data/importables/release-runs/.
    release_root = data_root / "release-runs"
    if release_root.is_dir():
        for game_dir in sorted(p for p in resources.iterdir(release_root) if p.is_dir()):
            for run_dir in sorted(p for p in resources.iterdir(game_dir) if p.is_dir()):
                log_path = run_dir / "workspace" / "log.txt"
                arclog_path = run_dir / "workspace" / "arclog.py"
                if not (log_path.is_file() and arclog_path.is_file()):
                    continue
                score = None
                scorecard_path = run_dir / "scorecard.json"
                if scorecard_path.is_file():
                    try:
                        score = resources.read_config_json(scorecard_path).get("total_actions")
                    except (OSError, json.JSONDecodeError):
                        score = None
                found.append(
                    {
                        "path": _data_rel_of(root, run_dir),
                        "absolutePath": str(run_dir),
                        "name": f"{game_dir.name}/{run_dir.name}",
                        "gameId": game_dir.name,
                        "sizeBytes": log_path.stat().st_size,
                        "kind": "release-run",
                        "totalActions": score,
                    }
                )
    return found


def _purge_prior_import(root: Path, game_dir: str, rel_path: str) -> int:
    """Remove level dirs + savepoints from an earlier import of the same source file.

    Makes re-importing idempotent: clicking Import again on a file that was
    already converted replaces its artifacts instead of piling up duplicates.
    Checks the canonical data/recordings/<game> and legacy container
    locations, since an earlier import may predate this fix.
    """
    removed = 0
    for game_root in _game_dirs_for(root, game_dir):
        for level_dir in _iter_recording_dirs(game_root):
            manifest_path = level_dir / "recording.json"
            if not manifest_path.is_file():
                continue
            try:
                manifest = resources.read_config_json(manifest_path)
            except (OSError, json.JSONDecodeError):
                continue
            if manifest.get("imported_from") == rel_path:
                resources.delete_tree(level_dir)
                removed += 1
        savepoints_path = game_root / "savepoints.json"
        with _savepoints_lock:
            entries = _load_savepoints(savepoints_path)
            kept = [entry for entry in entries if entry.get("imported_from") != rel_path]
            if len(kept) != len(entries):
                resources.write_config_json(
                    savepoints_path,
                    kept,
                    ensure_ascii=False,
                    trailing_newline=False,
                )
    return removed


def _purge_prior_movelist_import(root: Path, game_dir: str, rel_path: str) -> int:
    """Movelist-only counterpart to _purge_prior_import: since this mode
    never writes Recording directories, only savepoints.json needs
    de-duplicating for a re-import of the same source."""
    removed = 0
    for game_root in _game_dirs_for(root, game_dir):
        savepoints_path = game_root / "savepoints.json"
        with _savepoints_lock:
            entries = _load_savepoints(savepoints_path)
            kept = [entry for entry in entries if entry.get("imported_from") != rel_path]
            removed += len(entries) - len(kept)
            if len(kept) != len(entries):
                resources.write_config_json(
                    savepoints_path,
                    kept,
                    ensure_ascii=False,
                    trailing_newline=False,
                )
    return removed


def _import_recording_as_movelist(root: Path, rel_path: str, label: str | None) -> dict[str, Any]:
    """Lightweight counterpart to _import_recording: parse the same
    human-JSONL source into a MOVE-LIST (savepoint) only -- no per-move
    image.png/state.json, no Recording directories at all. Lets a big
    recording be scanned into a resumable move-list cheaply; the actual
    Recording (with images) can be materialized later on demand (see
    import_movelists_from_recordings' counterpart, "Import All Movelists",
    which replays a move-list through a real session to produce one)."""
    try:
        source = _safe_workspace_child(root, rel_path)
    except ValueError as error:
        raise HTTPException(status_code=400, detail="path must live inside the workspace") from error
    if not source.is_file():
        raise HTTPException(status_code=404, detail=f"recording not found: {rel_path}")

    events: list[dict[str, Any]] = []
    for line in resources.read_text(source, encoding="utf-8").splitlines():
        line = line.strip()
        if not line:
            continue
        try:
            row = json.loads(line)
        except json.JSONDecodeError:
            continue
        data = row.get("data") if isinstance(row, dict) else None
        if isinstance(data, dict) and isinstance(data.get("frame"), list):
            events.append(row)
    if not events:
        raise HTTPException(status_code=400, detail="no frame events found in recording")

    first = events[0]["data"]
    game_id = str(first.get("game_id") or source.stem)
    guid = str(first.get("guid") or uuid.uuid4().hex)
    game_dir = _game_slug(game_id)
    session_tag = f"import-{guid[:12]}"
    import_label = str(label).strip() if label else f"human recording {source.stem} (move-list only)"
    _purge_prior_movelist_import(root, game_dir, rel_path)

    replay_log: list[dict[str, Any]] = []
    move_total = 0
    current_level = str(int(events[0]["data"].get("levels_completed") or 0) + 1)
    last_completed = int(events[0]["data"].get("levels_completed") or 0)
    final_state = str(events[0]["data"].get("state") or "NOT_FINISHED")

    for event in events[1:]:
        data = event["data"]
        action_input = data.get("action_input") or {}
        action_id = int(action_input.get("id") or 0)
        if action_id == 0:
            current_level = str(int(data.get("levels_completed") or 0) + 1)
            replay_log.append({"op": "reset", "level": current_level})
            last_completed = int(data.get("levels_completed") or 0)
            continue
        action = f"ACTION{action_id}"
        raw_data = action_input.get("data") or {}
        action_data = {key: int(raw_data[key]) for key in ("x", "y") if key in raw_data}
        replay_log.append({"op": "step", "action": action, "data": action_data, "level": current_level})
        move_total += 1
        final_state = str(data.get("state") or final_state)
        completed = int(data.get("levels_completed") or 0)
        if completed != last_completed and final_state.upper() != "WIN":
            current_level = str(completed + 1)
        last_completed = completed

    savepoint = {
        "id": uuid.uuid4().hex[:12],
        "kind": "arc3_play_savepoint",
        "created_at": _utc_now(),
        "label": import_label,
        "game_id": game_id,
        "game_directory": game_dir,
        "level": current_level,
        "level_directory": None,
        "move_index": None,
        "state": final_state,
        "session_id": session_tag,
        "imported_from": rel_path,
        "replay_log": replay_log,
    }
    savepoints_path = _game_write_dir(root, game_dir) / "savepoints.json"
    with _savepoints_lock:
        entries = _load_savepoints(savepoints_path)
        entries.append(savepoint)
        resources.write_config_json(
            savepoints_path,
            entries,
            ensure_ascii=False,
            trailing_newline=False,
        )
    return {
        "imported": {
            "path": rel_path,
            "gameId": game_id,
            "gameDirectory": game_dir,
            "moveCount": move_total,
            "levelDirs": [],
            "state": final_state,
        },
        "savepoint": {key: value for key, value in savepoint.items() if key != "replay_log"},
    }


def _import_recording(root: Path, rel_path: str, label: str | None) -> dict[str, Any]:
    _ensure_python_path()
    from image_codec import frame_to_png_bytes

    try:
        source = _safe_workspace_child(root, rel_path)
    except ValueError as error:
        raise HTTPException(status_code=400, detail="path must live inside the workspace") from error
    if not source.is_file():
        raise HTTPException(status_code=404, detail=f"recording not found: {rel_path}")

    events: list[dict[str, Any]] = []
    for line in resources.read_text(source, encoding="utf-8").splitlines():
        line = line.strip()
        if not line:
            continue
        try:
            row = json.loads(line)
        except json.JSONDecodeError:
            continue
        data = row.get("data") if isinstance(row, dict) else None
        if isinstance(data, dict) and isinstance(data.get("frame"), list):
            events.append(row)
    if not events:
        raise HTTPException(status_code=400, detail="no frame events found in recording")

    first = events[0]["data"]
    game_id = str(first.get("game_id") or source.stem)
    guid = str(first.get("guid") or uuid.uuid4().hex)
    game_dir = _game_slug(game_id)
    session_tag = f"import-{guid[:12]}"
    import_label = str(label).strip() if label else f"human recording {source.stem}"
    _purge_prior_import(root, game_dir, rel_path)

    def relative(path: Path) -> str:
        return _data_rel_of(root, path)

    def grid_of(event: dict[str, Any]) -> Any:
        frames = event["data"].get("frame") or []
        return frames[-1] if frames else []

    level_dirs: list[Path] = []
    level_moves: list[dict[str, Any]] = []
    replay_log: list[dict[str, Any]] = []
    move_total = 0
    current_dir: Path | None = None
    current_level = "1"
    import_base_name = source.stem
    attempt_index = 0

    def write_node(
        directory: Path,
        event: dict[str, Any],
        incoming_action: str | None,
        action_data: dict[str, Any],
        ordinal: int | None,
        step_count: int,
    ) -> dict[str, Any]:
        resources.make_directory(directory)
        try:
            png = frame_to_png_bytes(grid_of(event))
        except Exception:
            png = b""
        if png:
            resources.write_bytes(directory / "image.png", png)
        data = event["data"]
        observation = {key: value for key, value in data.items() if key != "frame"}
        observation["frame_count"] = len(data.get("frame") or [])
        payload = {
            "state": data.get("state"),
            "level": current_level,
            "level_source": "imported_recording",
            "next_level_expected": None,
            "observation": observation,
            "step_count": step_count,
            "game_id": game_id,
            "game_directory": game_dir,
            "image_hash": hashlib.sha256(png).hexdigest()[:16] if png else None,
            "incoming_action": incoming_action,
            "action_directory": str(ordinal) if ordinal is not None else None,
            "action_data": action_data,
            "parent_node": ".." if ordinal is not None else None,
            "action_path": [str(index) for index in range(ordinal + 1)] if ordinal is not None else [],
            "recorded_at": str(event.get("timestamp") or _utc_now()),
            "scan": _scan_setup_dir(directory, root),
        }
        resources.write_config_json(
            directory / "state.json",
            payload,
            ensure_ascii=False,
            trailing_newline=False,
        )
        return payload

    def write_recording(reason: str) -> None:
        if current_dir is None:
            return
        manifest = {
            "kind": "arc3_play_recording",
            "session_id": session_tag,
            "game_id": game_id,
            "game_directory": game_dir,
            "level": current_level,
            "level_directory": relative(current_dir),
            "started_at": str(events[0].get("timestamp") or _utc_now()),
            "updated_at": _utc_now(),
            "last_event": reason,
            "imported_from": rel_path,
            "moves": level_moves,
        }
        resources.write_config_json(
            current_dir / "recording.json",
            manifest,
            ensure_ascii=False,
            trailing_newline=False,
        )

    def begin_level(event: dict[str, Any], reason: str, step_count: int) -> None:
        nonlocal current_dir, level_moves, current_level, attempt_index
        current_level = str(int(event["data"].get("levels_completed") or 0) + 1)
        container = _game_write_dir(root, game_dir)
        attempt_index += 1
        directory = container / _import_instance_dir_name(container, import_base_name, attempt_index)
        resources.make_directory(directory)
        current_dir = directory
        level_dirs.append(directory)
        level_moves = []
        write_node(directory, event, None, {}, None, step_count)
        write_recording(reason)

    begin_level(events[0], "imported_start", 0)
    last_completed = int(events[0]["data"].get("levels_completed") or 0)

    for index, event in enumerate(events[1:], start=1):
        data = event["data"]
        action_input = data.get("action_input") or {}
        action_id = int(action_input.get("id") or 0)
        if action_id == 0:
            begin_level(event, "new_attempt", index)
            replay_log.append({"op": "reset", "level": current_level})
            last_completed = int(data.get("levels_completed") or 0)
            continue
        action = f"ACTION{action_id}"
        raw_data = action_input.get("data") or {}
        action_data = {key: int(raw_data[key]) for key in ("x", "y") if key in raw_data}
        assert current_dir is not None
        ordinal = len(level_moves)
        directory = current_dir / str(ordinal)
        payload = write_node(directory, event, action, action_data, ordinal, index)
        move = {
            "index": ordinal,
            "action": action,
            "data": action_data,
            "directory": relative(directory),
            "state": payload.get("state"),
            "level": payload.get("level"),
            "recorded_at": payload.get("recorded_at"),
        }
        level_moves.append(move)
        move_total += 1
        replay_log.append({"op": "step", "action": action, "data": action_data, "directory": move["directory"], "level": move.get("level")})
        completed = int(data.get("levels_completed") or 0)
        if completed != last_completed and str(data.get("state") or "").upper() != "WIN":
            move["level_completed"] = current_level
            write_recording("level_complete")
            begin_level(event, "level_start", index)
        else:
            write_recording("move")
        last_completed = completed

    final_state = str(events[-1]["data"].get("state") or "NOT_FINISHED")
    savepoint = {
        "id": uuid.uuid4().hex[:12],
        "kind": "arc3_play_savepoint",
        "created_at": _utc_now(),
        "label": import_label,
        "game_id": game_id,
        "game_directory": game_dir,
        "level": current_level,
        "level_directory": relative(current_dir) if current_dir else None,
        "move_index": len(level_moves) - 1 if level_moves else None,
        "state": final_state,
        "session_id": session_tag,
        "imported_from": rel_path,
        "replay_log": replay_log,
    }
    savepoints_path = _game_write_dir(root, game_dir) / "savepoints.json"
    with _savepoints_lock:
        entries = _load_savepoints(savepoints_path)
        entries.append(savepoint)
        resources.write_config_json(
            savepoints_path,
            entries,
            ensure_ascii=False,
            trailing_newline=False,
        )
    return {
        "imported": {
            "path": rel_path,
            "gameId": game_id,
            "gameDirectory": game_dir,
            "moveCount": move_total,
            "levelDirs": [relative(path) for path in level_dirs],
            "state": final_state,
        },
        "savepoint": {key: value for key, value in savepoint.items() if key != "replay_log"},
    }


def _parse_transcript_actions(run_dir: Path) -> list[dict[str, Any]]:
    """Flatten transcript.jsonl's invocations into one entry per planned
    action, in order. Each release-run's total planned actions across every
    invocation lines up 1:1 with its real (non-RESET) steps in log.txt, so
    this list can be walked in lockstep with arclog's Step list to attach
    the agent's own commentary/reasoning to the exact move it produced.
    """
    transcript_path = run_dir / "transcript.jsonl"
    if not transcript_path.is_file():
        return []
    flattened: list[dict[str, Any]] = []
    for line in resources.read_text(transcript_path, encoding="utf-8").splitlines():
        line = line.strip()
        if not line:
            continue
        try:
            invocation = json.loads(line)
        except json.JSONDecodeError:
            continue
        text = str(invocation.get("text") or "")
        marker = text.find("[ACTIONS]")
        commentary = (text[:marker] if marker >= 0 else text).strip()
        plan_entries: list[dict[str, Any]] = []
        if marker >= 0:
            try:
                plan = json.loads(text[marker + len("[ACTIONS]"):].strip())
                if isinstance(plan, dict) and isinstance(plan.get("plan"), list):
                    plan_entries = plan["plan"]
            except json.JSONDecodeError:
                plan_entries = []
        for entry in plan_entries:
            if not isinstance(entry, dict):
                continue
            flattened.append(
                {
                    "invocation": invocation.get("invocation"),
                    "commentary": commentary,
                    "action": entry.get("action"),
                    "expect": entry.get("expect"),
                    "reasoning": entry.get("reasoning"),
                }
            )
    return flattened


def _load_trace_playbook_snapshots(run_dir: Path, filename: str = "playbook.md") -> dict[int, str]:
    """Return {invocation_number: cumulative file content as of the end of
    that invocation}, reconstructed from write/edit tool-call spans in the
    run's OTel-style trace files. Trace files are sorted by their earliest
    span timestamp, which lines up with invocation order 1..N -- this is a
    persistent, cross-invocation "working memory" file the agent edits and
    recompacts over the whole run, not a per-step artifact.
    """
    traces_root = run_dir / "traces"
    if not traces_root.is_dir():
        return {}
    trace_files: list[Path] = []
    for workspace_dir in resources.iterdir(traces_root):
        if workspace_dir.is_dir():
            trace_files.extend(resources.glob(workspace_dir, (".",), "*.jsonl"))

    def min_started_at(path: Path) -> float:
        best = float("inf")
        try:
            for line in resources.read_text(path, encoding="utf-8").splitlines():
                if not line.strip():
                    continue
                try:
                    span = json.loads(line)
                except json.JSONDecodeError:
                    continue
                started = span.get("started_at")
                if isinstance(started, (int, float)) and started < best:
                    best = started
        except OSError:
            pass
        return best

    trace_files.sort(key=min_started_at)
    snapshots: dict[int, str] = {}
    content = ""
    for invocation_number, trace_path in enumerate(trace_files, start=1):
        changed = False
        try:
            lines = resources.read_text(trace_path, encoding="utf-8").splitlines()
        except OSError:
            lines = []
        for line in lines:
            if not line.strip() or filename not in line:
                continue
            try:
                span = json.loads(line)
            except json.JSONDecodeError:
                continue
            attrs = span.get("attributes") or {}
            if attrs.get("gen_ai.tool.name") not in ("write", "edit"):
                continue
            raw_args = attrs.get("gen_ai.tool.call.arguments")
            args = raw_args
            if isinstance(raw_args, str):
                try:
                    args = json.loads(raw_args)
                except json.JSONDecodeError:
                    continue
            if not isinstance(args, dict) or args.get("path") != filename:
                continue
            piece = args.get("content")
            if not isinstance(piece, str):
                continue
            content = f"{content}{piece}" if args.get("append") and content else piece
            changed = True
        if changed:
            snapshots[invocation_number] = content
    return snapshots


def _import_release_run_as_movelist(root: Path, rel_dir: str, label: str | None) -> dict[str, Any]:
    """Lightweight counterpart to _import_release_run: parse the same
    release-run log into a MOVE-LIST (savepoint) only -- no per-move
    image.png/state.json, no Recording directories at all. See
    _import_recording_as_movelist for the human-JSONL equivalent and the
    rationale (skip the expensive part of a big import; materialize a real
    Recording from the move-list later on demand, only if actually needed)."""
    _ensure_python_path()

    try:
        run_dir = _safe_workspace_child(root, rel_dir)
    except ValueError as error:
        raise HTTPException(status_code=400, detail="path must live inside the workspace") from error
    log_path = run_dir / "workspace" / "log.txt"
    arclog_path = run_dir / "workspace" / "arclog.py"
    if not log_path.is_file() or not arclog_path.is_file():
        raise HTTPException(status_code=404, detail=f"not a release-run directory: {rel_dir}")

    spec = importlib.util.spec_from_file_location(f"_arclog_{abs(hash(str(arclog_path)))}", arclog_path)
    if spec is None or spec.loader is None:
        raise HTTPException(status_code=400, detail=f"could not load parser at {arclog_path}")
    arclog_module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = arclog_module
    spec.loader.exec_module(arclog_module)
    steps = arclog_module.load(str(log_path))
    if not steps:
        raise HTTPException(status_code=400, detail="no steps found in log.txt")

    scorecard: dict[str, Any] = {}
    scorecard_path = run_dir / "scorecard.json"
    if scorecard_path.is_file():
        try:
            scorecard = resources.read_config_json(scorecard_path)
        except (OSError, json.JSONDecodeError):
            scorecard = {}
    envs = scorecard.get("environments") if isinstance(scorecard, dict) else None
    env_id = envs[0].get("id") if isinstance(envs, list) and envs else None
    game_id = str(env_id or run_dir.parent.name)
    game_dir = _game_slug(game_id)
    session_tag = f"release-{run_dir.parent.name}-{run_dir.name}"
    import_label = str(label).strip() if label else f"release run {run_dir.parent.name}/{run_dir.name} (move-list only)"
    _purge_prior_movelist_import(root, game_dir, rel_dir)

    replay_log: list[dict[str, Any]] = []
    move_total = 0
    current_level = str(int(steps[0].levels_completed) + 1)
    last_completed = steps[0].levels_completed
    final_state = str(steps[0].state or "NOT_FINISHED")

    for step in steps[1:]:
        action = str(step.action).upper()
        if action == "RESET":
            current_level = str(int(step.levels_completed) + 1)
            replay_log.append({"op": "reset", "level": current_level})
            last_completed = step.levels_completed
            continue
        action_data = {key: value for key, value in (("x", step.x), ("y", step.y)) if value is not None}
        replay_log.append({"op": "step", "action": action, "data": action_data, "level": current_level})
        move_total += 1
        final_state = str(step.state or final_state)
        completed = step.levels_completed
        if completed != last_completed and final_state.upper() != "WIN":
            current_level = str(int(completed) + 1)
        last_completed = completed

    savepoint = {
        "id": uuid.uuid4().hex[:12],
        "kind": "arc3_play_savepoint",
        "created_at": _utc_now(),
        "label": import_label,
        "game_id": game_id,
        "game_directory": game_dir,
        "level": current_level,
        "level_directory": None,
        "move_index": None,
        "state": final_state,
        "session_id": session_tag,
        "imported_from": rel_dir,
        "replay_log": replay_log,
    }
    savepoints_path = _game_write_dir(root, game_dir) / "savepoints.json"
    with _savepoints_lock:
        entries = _load_savepoints(savepoints_path)
        entries.append(savepoint)
        resources.write_config_json(
            savepoints_path,
            entries,
            ensure_ascii=False,
            trailing_newline=False,
        )
    return {
        "imported": {
            "path": rel_dir,
            "gameId": game_id,
            "gameDirectory": game_dir,
            "moveCount": move_total,
            "levelDirs": [],
            "state": final_state,
        },
        "savepoint": {key: value for key, value in savepoint.items() if key != "replay_log"},
    }


def _import_release_run(root: Path, rel_dir: str, label: str | None) -> dict[str, Any]:
    """Import an official ARC-AGI-3 agent release-run directory.

    Shape: <run_dir>/scorecard.json, workspace/log.txt, workspace/arclog.py
    (the log parser is copied fresh into every run's own workspace, so we
    load that exact copy dynamically instead of re-implementing parsing --
    guarantees the same interpretation the agent itself used). Converts into
    our standard saved_<NNN>/0..k recording layout + a resumable savepoint, same
    as the human-JSONL importer.
    """
    _ensure_python_path()
    from image_codec import frame_to_png_bytes

    try:
        run_dir = _safe_workspace_child(root, rel_dir)
    except ValueError as error:
        raise HTTPException(status_code=400, detail="path must live inside the workspace") from error
    log_path = run_dir / "workspace" / "log.txt"
    arclog_path = run_dir / "workspace" / "arclog.py"
    if not log_path.is_file() or not arclog_path.is_file():
        raise HTTPException(status_code=404, detail=f"not a release-run directory: {rel_dir}")

    spec = importlib.util.spec_from_file_location(f"_arclog_{abs(hash(str(arclog_path)))}", arclog_path)
    if spec is None or spec.loader is None:
        raise HTTPException(status_code=400, detail=f"could not load parser at {arclog_path}")
    arclog_module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = arclog_module  # dataclass() introspects sys.modules by name
    spec.loader.exec_module(arclog_module)
    steps = arclog_module.load(str(log_path))
    if not steps:
        raise HTTPException(status_code=400, detail="no steps found in log.txt")

    scorecard: dict[str, Any] = {}
    scorecard_path = run_dir / "scorecard.json"
    if scorecard_path.is_file():
        try:
            scorecard = resources.read_config_json(scorecard_path)
        except (OSError, json.JSONDecodeError):
            scorecard = {}
    envs = scorecard.get("environments") if isinstance(scorecard, dict) else None
    env_id = envs[0].get("id") if isinstance(envs, list) and envs else None
    game_id = str(env_id or run_dir.parent.name)
    game_dir = _game_slug(game_id)
    session_tag = f"release-{run_dir.parent.name}-{run_dir.name}"
    import_label = str(label).strip() if label else f"release run {run_dir.parent.name}/{run_dir.name}"
    _purge_prior_import(root, game_dir, rel_dir)

    def relative(path: Path) -> str:
        return _data_rel_of(root, path)

    level_dirs: list[Path] = []
    level_moves: list[dict[str, Any]] = []
    replay_log: list[dict[str, Any]] = []
    move_total = 0
    current_dir: Path | None = None
    current_level = "1"
    import_base_name = run_dir.name
    attempt_index = 0

    def write_node(directory: Path, step: Any, incoming_action: str | None, action_data: dict[str, Any], ordinal: int | None) -> dict[str, Any]:
        resources.make_directory(directory)
        try:
            png = frame_to_png_bytes(step.settled)
        except Exception:
            png = b""
        if png:
            resources.write_bytes(directory / "image.png", png)
        payload = {
            "state": step.state,
            "level": current_level,
            "level_source": "imported_release_run",
            "next_level_expected": None,
            "observation": {
                "available_actions": list(step.available),
                "levels_completed": step.levels_completed,
                "win_levels": step.win_levels,
                "log_step": step.step,
            },
            "step_count": step.step,
            "game_id": game_id,
            "game_directory": game_dir,
            "image_hash": hashlib.sha256(png).hexdigest()[:16] if png else None,
            "incoming_action": incoming_action,
            "action_directory": str(ordinal) if ordinal is not None else None,
            "action_data": action_data,
            "parent_node": ".." if ordinal is not None else None,
            "action_path": [str(index) for index in range(ordinal + 1)] if ordinal is not None else [],
            "recorded_at": _utc_now(),
            "scan": _scan_setup_dir(directory, root),
        }
        resources.write_config_json(
            directory / "state.json",
            payload,
            ensure_ascii=False,
            trailing_newline=False,
        )
        return payload

    def write_recording(reason: str) -> None:
        if current_dir is None:
            return
        manifest = {
            "kind": "arc3_play_recording",
            "session_id": session_tag,
            "game_id": game_id,
            "game_directory": game_dir,
            "level": current_level,
            "level_directory": relative(current_dir),
            "started_at": _utc_now(),
            "updated_at": _utc_now(),
            "last_event": reason,
            "imported_from": rel_dir,
            "moves": level_moves,
        }
        resources.write_config_json(
            current_dir / "recording.json",
            manifest,
            ensure_ascii=False,
            trailing_newline=False,
        )

    def begin_level(step: Any, reason: str) -> None:
        nonlocal current_dir, level_moves, current_level, attempt_index
        is_first = not level_dirs
        current_level = str(int(step.levels_completed) + 1)
        container = _game_write_dir(root, game_dir)
        attempt_index += 1
        directory = container / _import_instance_dir_name(container, import_base_name, attempt_index)
        resources.make_directory(directory)
        current_dir = directory
        level_dirs.append(directory)
        level_moves = []
        write_node(directory, step, None, {}, None)
        if is_first:
            prime_path = run_dir / "prime.json"
            if prime_path.is_file():
                try:
                    prime = resources.read_config_json(prime_path)
                except (OSError, json.JSONDecodeError):
                    prime = {}
                description = prime.get("description") if isinstance(prime, dict) else None
                if isinstance(description, str) and description.strip():
                    vision_model = prime.get("vision_model") or "vision model"
                    resources.write_text(
                        directory / "vision_prime.md",
                        f"# Opening-frame read ({vision_model})\n\n{description}\n",
                        encoding="utf-8",
                    )
        write_recording(reason)

    flattened_actions = _parse_transcript_actions(run_dir)
    playbook_snapshots = _load_trace_playbook_snapshots(run_dir)

    begin_level(steps[0], "imported_start")
    last_completed = steps[0].levels_completed

    for index, step in enumerate(steps[1:], start=1):
        action = str(step.action).upper()
        if action == "RESET":
            begin_level(step, "new_attempt")
            replay_log.append({"op": "reset", "level": current_level})
            last_completed = step.levels_completed
            continue
        action_data = {key: value for key, value in (("x", step.x), ("y", step.y)) if value is not None}
        assert current_dir is not None
        ordinal = len(level_moves)
        directory = current_dir / str(ordinal)
        payload = write_node(directory, step, action, action_data, ordinal)
        # Agent's own commentary/reasoning for this move (from transcript.jsonl,
        # flattened 1:1 against non-RESET steps) and, when this move is the
        # last one its invocation produced, the persistent playbook.md
        # snapshot as of that point (reconstructed from trace write/edit
        # spans) -- so stepping through the replay surfaces both as they
        # actually accrued during the run, not just a single final artifact.
        flat_index = move_total
        if flat_index < len(flattened_actions):
            entry = flattened_actions[flat_index]
            commentary_lines = [f"# Agent commentary (invocation {entry.get('invocation')})", "", entry.get("commentary") or ""]
            if entry.get("reasoning"):
                commentary_lines += ["", "## Reasoning for this action", "", str(entry["reasoning"])]
            if entry.get("expect"):
                commentary_lines += ["", "## Predicted cells (x, y, old, new)", "", json.dumps(entry["expect"])]
            resources.write_text(
                directory / "commentary.md",
                "\n".join(commentary_lines).strip() + "\n",
                encoding="utf-8",
            )
            invocation_number = entry.get("invocation")
            is_last_of_invocation = (
                flat_index + 1 >= len(flattened_actions)
                or flattened_actions[flat_index + 1].get("invocation") != invocation_number
            )
            if is_last_of_invocation and invocation_number in playbook_snapshots:
                resources.write_text(
                    directory / "playbook.md",
                    playbook_snapshots[invocation_number],
                    encoding="utf-8",
                )
        move = {
            "index": ordinal,
            "action": action,
            "data": action_data,
            "directory": relative(directory),
            "state": payload.get("state"),
            "level": payload.get("level"),
            "recorded_at": payload.get("recorded_at"),
        }
        level_moves.append(move)
        move_total += 1
        replay_log.append({"op": "step", "action": action, "data": action_data, "directory": move["directory"], "level": move.get("level")})
        completed = step.levels_completed
        if completed != last_completed and str(step.state or "").upper() != "WIN":
            move["level_completed"] = current_level
            write_recording("level_complete")
            begin_level(step, "level_start")
        else:
            write_recording("move")
        last_completed = completed

    final_state = str(steps[-1].state or "NOT_FINISHED")
    savepoint = {
        "id": uuid.uuid4().hex[:12],
        "kind": "arc3_play_savepoint",
        "created_at": _utc_now(),
        "label": import_label,
        "game_id": game_id,
        "game_directory": game_dir,
        "level": current_level,
        "level_directory": relative(current_dir) if current_dir else None,
        "move_index": len(level_moves) - 1 if level_moves else None,
        "state": final_state,
        "session_id": session_tag,
        "imported_from": rel_dir,
        "replay_log": replay_log,
    }
    savepoints_path = _game_write_dir(root, game_dir) / "savepoints.json"
    with _savepoints_lock:
        entries = _load_savepoints(savepoints_path)
        entries.append(savepoint)
        resources.write_config_json(
            savepoints_path,
            entries,
            ensure_ascii=False,
            trailing_newline=False,
        )
    return {
        "imported": {
            "path": rel_dir,
            "gameId": game_id,
            "gameDirectory": game_dir,
            "moveCount": move_total,
            "levelDirs": [relative(path) for path in level_dirs],
            "state": final_state,
        },
        "savepoint": {key: value for key, value in savepoint.items() if key != "replay_log"},
    }


@router.get("/recordings")
def list_recordings(workspaceId: str) -> dict[str, Any]:
    root = _workspace_root(workspaceId)
    return {"recordings": _list_recording_files(root)}


# Per-directory stat memo for /recording-dirs: walking every image-set tree is
# the expensive part, and the trees are effectively immutable once written
# (live saved_<NNN> dirs only grow while a session records). Keyed by absolute
# path; invalidated when the dir's own mtime or its recording.json mtime
# changes, and always rewalked while a live session is still writing into it.
_recording_dir_stats_cache: dict[str, tuple[tuple[float, float], dict[str, Any]]] = {}


def _recording_dir_stats(entry: Path) -> dict[str, Any]:
    try:
        dir_mtime = entry.stat().st_mtime
    except OSError:
        dir_mtime = 0.0
    manifest_path = entry / "recording.json"
    try:
        manifest_mtime = manifest_path.stat().st_mtime if manifest_path.is_file() else 0.0
    except OSError:
        manifest_mtime = 0.0
    key = str(entry)
    cached = _recording_dir_stats_cache.get(key)
    if cached and cached[0] == (dir_mtime, manifest_mtime):
        return cached[1]
    size_bytes = 0
    move_dir_count = 0
    move_file_count = 0
    try:
        for child in resources.iterdir(entry):
            if child.is_dir():
                files_here = 0
                for sub in resources.rglob(child, "*"):
                    if sub.is_file():
                        files_here += 1
                        try:
                            size_bytes += sub.stat().st_size
                        except OSError:
                            pass
                if (child / "image.png").is_file():
                    move_dir_count += 1
                    move_file_count += files_here
            elif child.is_file():
                try:
                    size_bytes += child.stat().st_size
                except OSError:
                    pass
    except OSError:
        pass
    stats = {
        "sizeBytes": size_bytes,
        "moveDirCount": move_dir_count,
        "avgMoveDirFiles": round(move_file_count / move_dir_count, 2) if move_dir_count else 0,
    }
    _recording_dir_stats_cache[key] = ((dir_mtime, manifest_mtime), stats)
    return stats


def _image_set_dir_stats(entry: Path) -> dict[str, Any]:
    """Same memo for curated / sequence-set dumps: size, recursive image count
    (as moveTotal), direct subdir count, and avg images per subdir."""
    try:
        dir_mtime = entry.stat().st_mtime
    except OSError:
        dir_mtime = 0.0
    key = f"imageset::{entry}"
    cached = _recording_dir_stats_cache.get(key)
    if cached and cached[0] == (dir_mtime, 0.0):
        return cached[1]
    image_suffixes = {".png", ".jpg", ".jpeg", ".gif", ".webp", ".bmp"}
    size_bytes = 0
    image_count = 0
    subdir_count = 0
    try:
        for sub in resources.rglob(entry, "*"):
            if sub.is_dir():
                if sub.parent == entry:
                    subdir_count += 1
                continue
            if not sub.is_file():
                continue
            try:
                size_bytes += sub.stat().st_size
            except OSError:
                pass
            if sub.suffix.lower() in image_suffixes:
                image_count += 1
    except OSError:
        pass
    stats = {
        "sizeBytes": size_bytes,
        "imageCount": image_count,
        "moveDirCount": subdir_count,
        "avgMoveDirFiles": round(image_count / subdir_count, 2) if subdir_count else 0,
    }
    _recording_dir_stats_cache[key] = ((dir_mtime, 0.0), stats)
    return stats


@router.get("/recording-dirs")
def list_recording_dirs(workspaceId: str, gameId: str | None = None) -> dict[str, Any]:
    """Every image-set directory the Objects page's "Extracted Images source"
    combobox offers: per-game recording dirs (live-play saved_<NNN>, imported,
    and legacy manifest-less sets) plus the curated image sources under
    data/curated/*. One walk per dir collects size, frame count,
    and per-move-subdir stats for the listbox sort modes."""
    root = _workspace_root(workspaceId)
    directories = _game_dirs_for(root, _game_slug(gameId)) if gameId else _all_game_dirs(root)
    entries: list[dict[str, Any]] = []
    for game_root in directories:
        if not game_root.is_dir():
            continue
        for entry in _iter_image_set_dirs(game_root):
            has_manifest = (entry / "recording.json").is_file()
            manifest: dict[str, Any] = {}
            if has_manifest:
                try:
                    loaded = resources.read_config_json(entry / "recording.json")
                    if isinstance(loaded, dict):
                        manifest = loaded
                except (OSError, json.JSONDecodeError):
                    pass
            moves = manifest.get("moves")
            try:
                rel_path = _data_rel_of(root, entry)
            except ValueError:
                rel_path = entry.as_posix()
            stats = _recording_dir_stats(entry)
            entries.append(
                {
                    "path": rel_path,
                    "absolutePath": str(entry),
                    "name": entry.name,
                    "gameDirectory": game_root.name,
                    "gameId": manifest.get("game_id"),
                    "level": manifest.get("level"),
                    "moveTotal": len(moves) if isinstance(moves, list) else None,
                    "updatedAt": manifest.get("updated_at"),
                    "imported": bool(manifest.get("imported_from")),
                    "hasManifest": has_manifest,
                    "family": "recording",
                    "sizeBytes": stats["sizeBytes"],
                    "moveDirCount": stats["moveDirCount"],
                    "avgMoveDirFiles": stats["avgMoveDirFiles"],
                }
            )
    # The other disk-backed families the Objects "Extracted Images source"
    # combobox and the Recognition page's Sequence Sets selector list:
    # curated sources plus the flat sequence-set dumps (Games / Curated /
    # Movies). Only when not filtering by game: these sets are not
    # per-game. gameDirectory carries the family container so chips group
    # and sort naturally.
    if not gameId:
        families = [
            ("curated", "curated", "curated", {"videoimports", "recordings", "importables"}),
            ("arc3_games/curated", "curated", "curated", {"videoimports", "recordings", "importables"}),  # legacy layout
            ("arc_recordings", "arc_recordings", "sequence-games", set()),
            ("vision_frames/arc_recordings", "arc_recordings", "sequence-games", set()),  # legacy layout
            ("curated_data", "curated_data", "sequence-curated", set()),
            ("vision_frames/curated_data", "curated_data", "sequence-curated", set()),  # legacy layout
            ("video", "video", "sequence-movies", set()),
            ("vision_frames/video", "video", "sequence-movies", set()),  # legacy layout
        ]
        family_seen: dict[str, set[str]] = {}
        for rel_base, group_name, family, excludes in families:
            seen_names = family_seen.setdefault(family, set())
            for home in _data_homes(root):
                base_dir = home
                for part in rel_base.split("/"):
                    base_dir = base_dir / part
                if not base_dir.is_dir():
                    continue
                for entry in sorted(
                    (child for child in resources.iterdir(base_dir) if child.is_dir()),
                    key=lambda p: p.name.lower(),
                ):
                    if entry.name.lower() in excludes or entry.name.lower() in seen_names:
                        continue
                    stats = _image_set_dir_stats(entry)
                    if stats["imageCount"] == 0:
                        continue
                    seen_names.add(entry.name.lower())
                    try:
                        rel_path = _data_rel_of(root, entry)
                    except ValueError:
                        rel_path = entry.as_posix()
                    entries.append(
                        {
                            "path": rel_path,
                            "absolutePath": str(entry),
                            "name": entry.name,
                            "gameDirectory": group_name,
                            "gameId": None,
                            "level": None,
                            "moveTotal": stats["imageCount"],
                            "updatedAt": None,
                            "imported": False,
                            "hasManifest": (entry / "recording.json").is_file(),
                            "family": family,
                            "sizeBytes": stats["sizeBytes"],
                            "moveDirCount": stats["moveDirCount"],
                            "avgMoveDirFiles": stats["avgMoveDirFiles"],
                        }
                    )
    for item in entries:
        readonly = not _sequence_writable(root, Path(item["absolutePath"]))
        item.update(readOnly=readonly, migrationRequired=readonly)
        if readonly:
            item["name"] += " (read-only; migration required)"
    entries.sort(key=lambda item: (str(item.get("gameDirectory") or ""), str(item.get("name") or "")))
    return {"recordingDirs": entries, "count": len(entries)}


def _recording_dir_of(root: Path, rel_path: str) -> Path:
    try:
        target = _safe_workspace_child(root, rel_path)
    except ValueError as error:
        raise HTTPException(status_code=400, detail="path must live inside the workspace") from error
    if not target.is_dir() or not _looks_like_image_set_dir(target):
        raise HTTPException(status_code=404, detail="not a recording/image-set directory")
    try:
        return _require_sequence_write(root, target)
    except ValueError as error:
        raise HTTPException(status_code=409, detail=str(error)) from error


@router.post("/recording-dirs/movelist")
def ensure_recording_dir_movelist(body: dict[str, Any] = Body(default_factory=dict)) -> dict[str, Any]:
    """Return the MOVE-LIST (savepoint) referencing one Recording directory,
    deriving and persisting it from the dir's own recording.json when none
    exists yet -- the Recordings tab's per-dir Resume/Load buttons build on
    this so a recording is replayable exactly like a move-list."""
    workspace_id = str(body.get("workspaceId") or "").strip()
    rel_path = str(body.get("path") or "").strip()
    if not workspace_id or not rel_path:
        raise HTTPException(status_code=400, detail="workspaceId and path are required")
    root = _workspace_root(workspace_id)
    target = _recording_dir_of(root, rel_path)
    if not (target / "recording.json").is_file():
        raise HTTPException(status_code=422, detail="this image-set directory has no recording.json manifest to replay")
    game_root = target.parent
    savepoints_path = game_root / "savepoints.json"
    rel = _data_rel_of(root, target)
    with _savepoints_lock:
        entries = _load_savepoints(savepoints_path)
        existing = next((entry for entry in entries if str(entry.get("level_directory")) == rel), None)
        created = False
        if existing is None:
            existing = _savepoint_from_recording(root, game_root.name, target)
            if existing is None:
                raise HTTPException(status_code=422, detail="recording.json has no replayable moves")
            entries.append(existing)
            resources.write_config_json(
                savepoints_path,
                entries,
                ensure_ascii=False,
                trailing_newline=False,
            )
            created = True
    return {"savepoint": existing, "created": created}


@router.post("/recording-dirs/duplicate", status_code=201)
def duplicate_recording_dir(body: dict[str, Any] = Body(default_factory=dict)) -> dict[str, Any]:
    """Copy one Recording directory to <name>_copy[N] beside it, fixing the
    copy's recording.json self-reference."""
    workspace_id = str(body.get("workspaceId") or "").strip()
    rel_path = str(body.get("path") or "").strip()
    if not workspace_id or not rel_path:
        raise HTTPException(status_code=400, detail="workspaceId and path are required")
    root = _workspace_root(workspace_id)
    target = _recording_dir_of(root, rel_path)
    base = f"{target.name}_copy"
    new_name = base
    suffix = 2
    while (target.parent / new_name).exists():
        new_name = f"{base}{suffix}"
        suffix += 1
    new_path = target.parent / new_name
    resources.copy_tree(target, new_path)
    manifest_path = new_path / "recording.json"
    try:
        manifest = resources.read_config_json(manifest_path)
        if isinstance(manifest, dict):
            manifest["level_directory"] = _data_rel_of(root, new_path)
            resources.write_config_json(
                manifest_path,
                manifest,
                ensure_ascii=False,
                trailing_newline=False,
            )
    except (OSError, json.JSONDecodeError):
        pass
    return {"path": _data_rel_of(root, new_path), "name": new_name}


@router.post("/recording-dirs/delete")
def delete_recording_dir(body: dict[str, Any] = Body(default_factory=dict)) -> dict[str, Any]:
    """Delete ONE Recording directory. Does not touch move-lists (savepoints);
    a move-list referencing the deleted dir can rematerialize it later."""
    workspace_id = str(body.get("workspaceId") or "").strip()
    rel_path = str(body.get("path") or "").strip()
    if not workspace_id or not rel_path:
        raise HTTPException(status_code=400, detail="workspaceId and path are required")
    root = _workspace_root(workspace_id)
    target = _recording_dir_of(root, rel_path)
    rel = _data_rel_of(root, target)
    resources.delete_tree(target)
    return {"removed": rel}


def _dedupe_recordings_in(root: Path, game_root: Path) -> list[str]:
    groups: dict[str, list[tuple[float, Path]]] = {}
    for level_dir in _iter_recording_dirs(game_root):
        manifest_path = level_dir / "recording.json"
        if not manifest_path.is_file():
            continue
        try:
            manifest = resources.read_config_json(manifest_path)
        except (OSError, json.JSONDecodeError):
            continue
        imported_from = manifest.get("imported_from")
        if not imported_from:
            continue  # never touch live-played recordings, only re-imports
        groups.setdefault(imported_from, []).append((manifest_path.stat().st_mtime, level_dir))

    removed: list[str] = []
    for entries in groups.values():
        if len(entries) <= 1:
            continue
        entries.sort(key=lambda item: item[0])
        # Sequential clustering: a new import run starts whenever the gap
        # between consecutive level dirs' last-write time exceeds 2 minutes.
        clusters: list[list[tuple[float, Path]]] = []
        for item in entries:
            if clusters and item[0] - clusters[-1][-1][0] <= 120:
                clusters[-1].append(item)
            else:
                clusters.append([item])
        clusters.sort(key=lambda cluster: cluster[-1][0])
        for cluster in clusters[:-1]:  # keep only the most recent run
            for _, path in cluster:
                resources.delete_tree(path)
                removed.append(_data_rel_of(root, path))
    return removed


@router.post("/recordings/dedupe")
def dedupe_recordings(workspaceId: str, gameId: str | None = None) -> dict[str, Any]:
    root = _workspace_root(workspaceId)
    directories = _game_dirs_for(root, _game_slug(gameId)) if gameId else _all_game_dirs(root)
    removed: list[str] = []
    for directory in directories:
        if directory.is_dir():
            removed.extend(_dedupe_recordings_in(root, directory))
    return {"removed": removed, "count": len(removed)}


def _dir_size(path: Path) -> int:
    total = 0
    for entry in resources.rglob(path, "*"):
        if entry.is_file():
            try:
                total += entry.stat().st_size
            except OSError:
                pass
    return total


def _ranked_recordings_by_size_in(root: Path, game_root: Path) -> list[tuple[int, Path]]:
    """Every IMPORTED recording directory in one game root (never live-played
    saved_<NNN> dirs -- identified by recording.json having "imported_from"),
    paired with its on-disk size, sorted biggest first."""
    ranked: list[tuple[int, Path]] = []
    for entry in _iter_recording_dirs(game_root):
        manifest_path = entry / "recording.json"
        try:
            manifest = resources.read_config_json(manifest_path)
        except (OSError, json.JSONDecodeError):
            continue
        if not manifest.get("imported_from"):
            continue  # never touch live-played recordings, only imports
        ranked.append((_dir_size(entry), entry))
    ranked.sort(key=lambda item: item[0], reverse=True)
    return ranked


def _rewrite_recording_references(root: Path, game_root: Path, rename_map: dict[str, str]) -> None:
    """After renaming directories per rename_map ({old_relpath: new_relpath}),
    fix each renamed dir's own recording.json self-reference plus every
    matching level_directory/replay_log[].directory in that game's
    savepoints.json."""
    for new_rel in rename_map.values():
        manifest_path = _require_sequence_write(root, _safe_workspace_child(root, new_rel) / "recording.json")
        if not manifest_path.is_file():
            continue
        try:
            manifest = resources.read_config_json(manifest_path)
        except (OSError, json.JSONDecodeError):
            continue
        if isinstance(manifest, dict) and manifest.get("level_directory") in rename_map:
            manifest["level_directory"] = rename_map[manifest["level_directory"]]
            resources.write_config_json(
                manifest_path,
                manifest,
                ensure_ascii=False,
                trailing_newline=False,
            )

    savepoints_path = game_root / "savepoints.json"
    if not savepoints_path.is_file():
        return
    try:
        entries = resources.read_config_json(savepoints_path)
    except (OSError, json.JSONDecodeError):
        return
    if not isinstance(entries, list):
        return
    changed = False
    for entry in entries:
        if not isinstance(entry, dict):
            continue
        level_directory = entry.get("level_directory")
        if isinstance(level_directory, str) and level_directory in rename_map:
            entry["level_directory"] = rename_map[level_directory]
            changed = True
        for op in entry.get("replay_log") or []:
            if not isinstance(op, dict):
                continue
            directory = op.get("directory")
            if not isinstance(directory, str):
                continue
            for old_rel, new_rel in rename_map.items():
                if directory == old_rel or directory.startswith(old_rel + "/"):
                    op["directory"] = new_rel + directory[len(old_rel):]
                    changed = True
                    break
    if changed:
        resources.write_config_json(
            savepoints_path,
            entries,
            ensure_ascii=False,
            trailing_newline=False,
        )


def _sort_recordings_by_size_in(root: Path, game_root: Path) -> list[tuple[str, str]]:
    """Rank every imported recording directory in one game root by on-disk
    size (biggest first) and rename it to end with _size_<NNNN> -- stripping
    any previous _size_ suffix first so re-running after new imports land is
    idempotent instead of piling up suffixes. Live-play saved_<NNN>
    directories are never touched; this is purely a housekeeping aid for
    later pruning/retaining imported instances by size (see
    retain_largest_recordings). Returns [(old_relpath, new_relpath), ...]."""
    ranked = _ranked_recordings_by_size_in(root, game_root)
    pairs: list[tuple[str, str, Path, Path]] = []  # (old_rel, new_rel, entry, new_path)
    for rank, (_size, entry) in enumerate(ranked, start=1):
        base = _strip_size_suffix(entry.name)
        new_name = f"{base}_size_{rank:04d}"
        if entry.name == new_name:
            continue
        new_path = entry.parent / new_name
        old_rel = _data_rel_of(root, entry)
        new_rel = _data_rel_of(root, new_path)
        pairs.append((old_rel, new_rel, entry, new_path))

    # Two-phase (stage under temp names first) so re-ranking never collides
    # with a directory that hasn't moved yet, same technique used by the
    # older per-level scripts/rename_level_dirs_by_size.py.
    staged: list[tuple[Path, Path]] = []
    for rank, (_old_rel, _new_rel, entry, new_path) in enumerate(pairs, start=1):
        temp_path = entry.parent / f"{entry.name}.rename_staging_{rank}"
        resources.move(entry, temp_path)
        staged.append((temp_path, new_path))
    for temp_path, new_path in staged:
        resources.make_directory(new_path.parent)
        resources.move(temp_path, new_path)

    rename_map = {old_rel: new_rel for old_rel, new_rel, _entry, _new_path in pairs}
    if rename_map:
        _rewrite_recording_references(root, game_root, rename_map)
    return [(old_rel, new_rel) for old_rel, new_rel, _entry, _new_path in pairs]


@router.post("/recordings/sort-by-size")
def sort_recordings_by_size(workspaceId: str, gameId: str | None = None) -> dict[str, Any]:
    root = _workspace_root(workspaceId)
    directories = _writable_game_dirs(root, gameId)
    renamed: list[dict[str, str]] = []
    for directory in directories:
        if directory.is_dir():
            for old_rel, new_rel in _sort_recordings_by_size_in(root, directory):
                renamed.append({"from": old_rel, "to": new_rel})
    return {"renamed": renamed, "count": len(renamed)}


@router.post("/recordings/retain-largest")
def retain_largest_recordings(workspaceId: str, keep: int, gameId: str | None = None) -> dict[str, Any]:
    """Delete every imported recording directory beyond the `keep` largest
    (by on-disk size) in each targeted game -- never touches live-play
    saved_<NNN> directories. Run "Sort dirs by size" first if you want the
    remaining directories' _size_<NNNN> suffix to reflect the new ranking."""
    if keep < 0:
        raise HTTPException(status_code=400, detail="keep must be >= 0")
    root = _workspace_root(workspaceId)
    directories = _writable_game_dirs(root, gameId)
    removed: list[str] = []
    for game_root in directories:
        if not game_root.is_dir():
            continue
        ranked = _ranked_recordings_by_size_in(root, game_root)
        for _size, entry in ranked[keep:]:
            removed.append(_data_rel_of(root, entry))
            resources.delete_tree(entry)
    return {"removed": removed, "count": len(removed)}


@router.post("/recordings/clear")
def clear_recordings(workspaceId: str, gameId: str | None = None) -> dict[str, Any]:
    """Delete EVERY Recording directory for the targeted game(s) -- both
    live-play saved_<NNN> dirs and imported ones alike. Does not touch
    savepoints.json (MOVE-LISTS); see /savepoints/clear for that.

    Any live session in scope is DETACHED from the recorder (its record
    switch turns off) so cleared dirs are not immediately recreated; the
    Begin-recording control re-attaches it."""
    root = _workspace_root(workspaceId)
    directories = _writable_game_dirs(root, gameId)
    removed: list[str] = []
    for game_root in directories:
        if not game_root.is_dir():
            continue
        for entry in _iter_recording_dirs(game_root):
            removed.append(_data_rel_of(root, entry))
            resources.delete_tree(entry)
    with _sessions_lock:
        sessions = list(_sessions.values())
    detached: list[str] = []
    wanted_dir = _game_slug(gameId) if gameId else None
    for session in sessions:
        if session.closed or _vision_data_root(session.workspace_root) != _vision_data_root(root):
            continue
        if wanted_dir and session.game_dir != wanted_dir:
            continue
        session.recording = False
        detached.append(session.id)
    return {"removed": removed, "count": len(removed), "detached": detached}


@router.post("/savepoints/clear")
def clear_savepoints(workspaceId: str, gameId: str | None = None) -> dict[str, Any]:
    """Delete EVERY MOVE-LIST (savepoint) for the targeted game(s). Does not
    touch Recording directories; see /recordings/clear for that."""
    root = _workspace_root(workspaceId)
    directories = _writable_game_dirs(root, gameId)
    removed = 0
    for game_root in directories:
        savepoints_path = game_root / "savepoints.json"
        if not savepoints_path.is_file():
            continue
        with _savepoints_lock:
            entries = _load_savepoints(savepoints_path)
            removed += len(entries)
            resources.write_config_json(
                savepoints_path,
                [],
                indent=None,
                trailing_newline=False,
            )
    return {"count": removed}


def _savepoint_from_recording(root: Path, game_dir: str, entry: Path) -> dict[str, Any] | None:
    """Derive a MOVE-LIST (savepoint) from one existing Recording directory's
    own recording.json -- its "moves" list, replayed as a flat sequence of
    step ops (a single Recording directory holds one attempt's moves only,
    so there is nothing to reset between)."""
    manifest_path = entry / "recording.json"
    try:
        manifest = resources.read_config_json(manifest_path)
    except (OSError, json.JSONDecodeError):
        return None
    moves = manifest.get("moves")
    if not isinstance(moves, list) or not moves:
        return None
    replay_log: list[dict[str, Any]] = []
    for move in moves:
        if not isinstance(move, dict):
            continue
        replay_log.append(
            {
                "op": "step",
                "action": move.get("action"),
                "data": move.get("data") or {},
                "directory": move.get("directory"),
                "level": move.get("level"),
            }
        )
    last_move = moves[-1] if isinstance(moves[-1], dict) else {}
    return {
        "id": uuid.uuid4().hex[:12],
        "kind": "arc3_play_savepoint",
        "created_at": _utc_now(),
        "label": f"derived from {entry.name}",
        "game_id": manifest.get("game_id") or game_dir,
        "game_directory": game_dir,
        "level": manifest.get("level"),
        "level_directory": _data_rel_of(root, entry),
        "move_index": len(moves) - 1,
        "state": last_move.get("state") or "NOT_FINISHED",
        "session_id": manifest.get("session_id") or f"derived-{entry.name}",
        "replay_log": replay_log,
    }


def _import_movelists_from_recordings_in(root: Path, game_root: Path) -> int:
    """For every Recording directory in one game root that doesn't already
    have a MOVE-LIST (savepoint) referencing it, derive one from its own
    recorded moves and append it to savepoints.json."""
    savepoints_path = game_root / "savepoints.json"
    with _savepoints_lock:
        entries = _load_savepoints(savepoints_path)
        existing_dirs = {str(entry.get("level_directory")) for entry in entries if entry.get("level_directory")}
        created = 0
        for recording_dir in _iter_recording_dirs(game_root):
            rel = _data_rel_of(root, recording_dir)
            if rel in existing_dirs:
                continue
            savepoint = _savepoint_from_recording(root, game_root.name, recording_dir)
            if savepoint is None:
                continue
            entries.append(savepoint)
            created += 1
        if created:
            resources.write_config_json(
                savepoints_path,
                entries,
                ensure_ascii=False,
                trailing_newline=False,
            )
    return created


@router.post("/recordings/import-movelists")
def import_movelists_from_recordings(workspaceId: str, gameId: str | None = None) -> dict[str, Any]:
    """MOVE-LISTS panel's "Import All Recordings' Moves": scan every Recording
    directory and create a MOVE-LIST for any that doesn't already have one."""
    root = _workspace_root(workspaceId)
    directories = _writable_game_dirs(root, gameId)
    created = 0
    for directory in directories:
        if directory.is_dir():
            created += _import_movelists_from_recordings_in(root, directory)
    return {"created": created}


@router.post("/recordings/materialize-movelists")
def materialize_movelists(workspaceId: str, gameId: str | None = None, maxMoves: int = 400) -> dict[str, Any]:
    """RECORDINGS panel's "Import All Movelists": for every MOVE-LIST whose
    referenced Recording directory doesn't exist on disk (movelist-only
    imports via /import-movelist, or a directory since deleted), replay its
    move-list through a fresh session -- writing a brand-new saved_<NNN>
    Recording -- and repoint the savepoint's level_directory at it.

    Bounded by maxMoves (total replayed moves across this one call, default
    400): a real engine replay writes a full image+state per move, so a
    handful of large move-lists can legitimately take minutes; capping each
    call keeps every request fast and visibly progressing (the response's
    "remaining" count is >0 when there's more to do -- call again to
    continue) instead of one request blocking for an unbounded time."""
    root = _workspace_root(workspaceId)
    directories = _writable_game_dirs(root, gameId)
    materialized: list[dict[str, str]] = []
    budget = max(1, maxMoves)
    remaining = 0
    for game_root in directories:
        savepoints_path = game_root / "savepoints.json"
        if not savepoints_path.is_file():
            continue
        with _savepoints_lock:
            entries = _load_savepoints(savepoints_path)
        for entry in entries:
            level_directory = entry.get("level_directory")
            if level_directory and _safe_workspace_child(root, level_directory).is_dir():
                continue  # already materialized on disk
            replay_log = entry.get("replay_log") or []
            if not replay_log:
                continue
            if budget <= 0:
                remaining += 1
                continue
            game_id = str(entry.get("game_id") or entry.get("game_directory") or "")
            if not game_id:
                continue
            try:
                session = PlaySession(workspaceId, root, game_id)
                session.replay_recipe(list(replay_log), forked_from=str(entry.get("id")))
                new_level_dir = session._relative(session.level_dir)
                session.close()
            except Exception:
                continue
            budget -= len(replay_log)
            with _savepoints_lock:
                current = _load_savepoints(savepoints_path)
                for item in current:
                    if item.get("id") == entry.get("id"):
                        item["level_directory"] = new_level_dir
                        item["move_index"] = len(replay_log) - 1
                resources.write_config_json(
                    savepoints_path,
                    current,
                    ensure_ascii=False,
                    trailing_newline=False,
                )
            materialized.append({"savepointId": str(entry.get("id")), "levelDirectory": new_level_dir})
    return {"materialized": materialized, "count": len(materialized), "remaining": remaining}


@router.post("/import-recording", status_code=201)
def import_recording(body: dict[str, Any] = Body(default_factory=dict)) -> dict[str, Any]:
    workspace_id = str(body.get("workspaceId") or "").strip()
    rel_path = str(body.get("path") or "").strip()
    if not workspace_id or not rel_path:
        raise HTTPException(status_code=400, detail="workspaceId and path are required")
    root = _workspace_root(workspace_id)
    label = body.get("label")
    try:
        target = _safe_workspace_child(root, rel_path)
    except ValueError as error:
        raise HTTPException(status_code=400, detail="path must live inside the workspace") from error
    if target.is_dir() and (target / "workspace" / "log.txt").is_file():
        return _import_release_run(root, rel_path, str(label) if label else None)
    return _import_recording(root, rel_path, str(label) if label else None)


@router.post("/import-movelist", status_code=201)
def import_movelist(body: dict[str, Any] = Body(default_factory=dict)) -> dict[str, Any]:
    """Lightweight import: create only the MOVE-LIST (savepoint) from an
    IMPORTABLE source, skipping the expensive per-move image.png/state.json
    writes -- so importing a big recording just to get a resumable
    move-list doesn't require paying for a full Recording. Materialize a
    real Recording from the resulting move-list later, on demand, via the
    MOVE-LISTS panel's "Import All Recordings' Moves" / resuming it."""
    workspace_id = str(body.get("workspaceId") or "").strip()
    rel_path = str(body.get("path") or "").strip()
    if not workspace_id or not rel_path:
        raise HTTPException(status_code=400, detail="workspaceId and path are required")
    root = _workspace_root(workspace_id)
    label = body.get("label")
    try:
        target = _safe_workspace_child(root, rel_path)
    except ValueError as error:
        raise HTTPException(status_code=400, detail="path must live inside the workspace") from error
    if target.is_dir() and (target / "workspace" / "log.txt").is_file():
        return _import_release_run_as_movelist(root, rel_path, str(label) if label else None)
    return _import_recording_as_movelist(root, rel_path, str(label) if label else None)


def _find_savepoint(root: Path, savepoint_id: str, game_dir: str | None = None) -> dict[str, Any] | None:
    directories = _game_dirs_for(root, game_dir) if game_dir else _all_game_dirs(root)
    with _savepoints_lock:
        for directory in directories:
            for entry in _load_savepoints(directory / "savepoints.json"):
                if str(entry.get("id")) == savepoint_id:
                    return entry
    return None


def _get_session(session_id: str) -> PlaySession:
    with _sessions_lock:
        session = _sessions.get(session_id)
    if session is None:
        raise HTTPException(status_code=404, detail="unknown play session")
    return session


@router.get("/sessions/{session_id}")
def read_session(session_id: str) -> dict[str, Any]:
    return {"session": _get_session(session_id).snapshot()}


@router.put("/sessions/{session_id}/recordings-path")
def set_session_recordings_path(session_id: str, body: dict[str, Any] = Body(default_factory=dict)) -> dict[str, Any]:
    """Override where THIS session's future level dirs/savepoints.json are
    written (relative to the workspace root), or reset to the default
    data/recordings/<game>/ location by passing an empty/missing path. Takes
    effect starting with the next level dir (a new attempt/level transition);
    nothing already written on disk is moved."""
    session = _get_session(session_id)
    path = body.get("path")
    try:
        with session.lock:
            session.set_recordings_path(str(path) if path is not None else None)
    except ValueError as error:
        raise HTTPException(status_code=400, detail=str(error)) from error
    return {"session": session.snapshot()}


@router.get("/silo/files")
def silo_files(workspaceId: str, dir: str) -> dict[str, Any]:
    """List the files in one setup-silo directory (a session level dir)."""
    root = _workspace_root(workspaceId)
    try:
        directory = _safe_workspace_child(root, dir)
    except ValueError as error:
        raise HTTPException(status_code=400, detail=str(error)) from error
    if not directory.is_dir():
        return {"dir": dir, "files": []}
    files = [
        {
            "name": entry.name,
            "bytes": entry.stat().st_size,
            "path": _data_rel_of(root, entry),
        }
        for entry in sorted(resources.iterdir(directory))
        if entry.is_file()
    ]
    return {"dir": dir, "files": files}


@router.post("/silo/write")
def silo_write(body: dict[str, Any] = Body(...)) -> dict[str, Any]:
    """Write one prompt-output file into a setup-silo directory.

    The prompt operators on the Play page read silo files and write more (or
    the same) files back; this is their only write surface, constrained to a
    single flat file name inside the workspace."""
    workspace_id = str(body.get("workspaceId") or "")
    directory_rel = str(body.get("dir") or "")
    name = str(body.get("name") or "").strip()
    content = body.get("content")
    if not workspace_id or not directory_rel or not name:
        raise HTTPException(status_code=400, detail="workspaceId, dir, and name are required")
    if any(sep in name for sep in ("/", "\\", "..")):
        raise HTTPException(status_code=400, detail="name must be a flat file name")
    if not isinstance(content, str):
        raise HTTPException(status_code=400, detail="content must be a string")
    root = _workspace_root(workspace_id)
    try:
        directory = _require_sequence_write(root, _safe_workspace_child(root, directory_rel))
    except ValueError as error:
        raise HTTPException(status_code=400, detail=str(error)) from error
    resources.make_directory(directory)
    target = _require_sequence_write(root, directory / name)
    if target.suffix.lower() == ".json":
        resources.write_bytes(target, content.encode("utf-8"))
    else:
        resources.write_text(target, content, encoding="utf-8")
    return {"path": _data_rel_of(root, target), "bytes": len(content.encode("utf-8"))}


@router.post("/sessions/{session_id}/recording")
def set_session_recording(session_id: str, body: dict[str, Any] = Body(default_factory=dict)) -> dict[str, Any]:
    """Attach (enabled: true) or detach (enabled: false) the session's recorder."""
    session = _get_session(session_id)
    try:
        session.set_recording(bool(body.get("enabled")))
    except HTTPException:
        raise
    except Exception as error:
        raise HTTPException(status_code=400, detail=f"recording toggle failed: {error}") from error
    return {"session": session.snapshot()}


@router.post("/sessions/{session_id}/action")
def act(session_id: str, body: dict[str, Any] = Body(default_factory=dict)) -> dict[str, Any]:
    session = _get_session(session_id)
    action = str(body.get("action") or "").strip()
    if not action:
        raise HTTPException(status_code=400, detail="action is required")
    x = body.get("x")
    y = body.get("y")
    try:
        move = session.act(
            action,
            x=int(x) if x is not None else None,
            y=int(y) if y is not None else None,
        )
    except HTTPException:
        raise
    except (TypeError, ValueError) as error:
        raise HTTPException(status_code=400, detail=str(error)) from error
    except Exception as error:
        raise HTTPException(status_code=400, detail=f"action failed: {error}") from error
    return {"move": move, "session": session.snapshot()}


@router.post("/sessions/{session_id}/reset")
def reset(session_id: str) -> dict[str, Any]:
    session = _get_session(session_id)
    try:
        session.reset()
    except HTTPException:
        raise
    except Exception as error:
        raise HTTPException(status_code=400, detail=f"reset failed: {error}") from error
    return {"session": session.snapshot()}


@router.post("/sessions/{session_id}/undo")
def undo(session_id: str, body: dict[str, Any] = Body(default_factory=dict)) -> dict[str, Any]:
    session = _get_session(session_id)
    try:
        count = int(body.get("count") or 1)
    except (TypeError, ValueError):
        count = 1
    try:
        removed = session.undo(count=count)
    except HTTPException:
        raise
    except ValueError as error:
        raise HTTPException(status_code=400, detail=str(error)) from error
    except Exception as error:
        raise HTTPException(status_code=400, detail=f"undo failed: {error}") from error
    return {"removed": removed, "session": session.snapshot()}


@router.post("/sessions/{session_id}/fork")
def fork(session_id: str, body: dict[str, Any] = Body(default_factory=dict)) -> dict[str, Any]:
    session = _get_session(session_id)
    try:
        savepoint = session.fork(label=body.get("label"))
    except HTTPException:
        raise
    except Exception as error:
        raise HTTPException(status_code=400, detail=f"fork failed: {error}") from error
    return {"savepoint": savepoint, "session": session.snapshot()}


@router.post("/sessions/{session_id}/restart")
def restart(session_id: str) -> dict[str, Any]:
    session = _get_session(session_id)
    try:
        session.restart()
    except HTTPException:
        raise
    except Exception as error:
        raise HTTPException(status_code=400, detail=f"restart failed: {error}") from error
    return {"session": session.snapshot()}


@router.delete("/sessions/{session_id}")
def close_session(session_id: str) -> dict[str, Any]:
    session = _get_session(session_id)
    session.close()
    with _sessions_lock:
        _sessions.pop(session_id, None)
    return {"session": session.snapshot()}


@router.on_event("shutdown")
def _save_open_sessions_on_shutdown() -> None:
    # The dev server file-watcher reloads the process on code changes.
    # The rolling per-move autosave already keeps every session backed up,
    # so shutdown only needs to close environments cleanly.
    with _sessions_lock:
        sessions = list(_sessions.values())
    for session in sessions:
        try:
            session.close()
        except Exception:
            pass
