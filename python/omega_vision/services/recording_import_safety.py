"""Reject unconfirmed recording replacement without touching existing history."""

from __future__ import annotations

import json
from collections.abc import Iterable
from pathlib import Path

from fastapi import HTTPException

from omega_vision.inherited_source_overlay import authorize_storage_path, resolve_workspace_child


def _same_source(root: Path, saved: object, requested: str) -> bool:
    if not isinstance(saved, str):
        return False
    if saved == requested:
        return True
    try:
        return authorize_storage_path(resolve_workspace_child(root, saved)) == authorize_storage_path(
            resolve_workspace_child(root, requested)
        )
    except (ValueError, PermissionError):
        return False


def _read_metadata(path: Path):
    path = authorize_storage_path(path)
    try:
        return json.loads(path.read_text(encoding="utf-8"))
    except FileNotFoundError:
        return None
    except (OSError, ValueError) as error:
        raise HTTPException(
            status_code=409,
            detail=f"Cannot safely inspect existing recording metadata at {path}; import was not started.",
        ) from error


def require_new_import(root: Path, game_roots: Iterable[Path], source: str) -> None:
    for game_root in game_roots:
        game_root = authorize_storage_path(game_root)
        if not game_root.is_dir():
            continue
        for entry in game_root.iterdir():
            if not entry.is_dir():
                continue
            metadata = _read_metadata(entry / "recording.json")
            if isinstance(metadata, dict) and _same_source(root, metadata.get("imported_from"), source):
                raise HTTPException(
                    status_code=409,
                    detail=f"Source is already imported at {entry}. Existing recording, outputs and memory were retained. "
                           "Select the existing recording; replacement requires an explicit confirmed workflow.",
                )
        savepoints = _read_metadata(game_root / "savepoints.json")
        if savepoints is not None and not isinstance(savepoints, list):
            raise HTTPException(status_code=409, detail="Existing savepoint metadata is invalid; import was not started.")
        if any(isinstance(entry, dict) and _same_source(root, entry.get("imported_from"), source)
               for entry in savepoints or []):
            raise HTTPException(
                status_code=409,
                detail="This source already has saved import history. It was retained; replacement requires explicit confirmation.",
            )


def claim_import_directory(directory: Path) -> None:
    directory = authorize_storage_path(directory)
    try:
        directory.mkdir(parents=True, exist_ok=False)
    except FileExistsError as error:
        raise HTTPException(
            status_code=409,
            detail=f"Import destination already exists: {directory}. Existing data was not replaced.",
        ) from error
