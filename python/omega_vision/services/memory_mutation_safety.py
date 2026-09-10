"""Fail closed before tree operations can destroy or duplicate memory identities."""
from __future__ import annotations

from contextlib import contextmanager
from pathlib import Path
from stat import S_ISDIR

from fastapi import HTTPException

from omega_vision.inherited_source_overlay import storage_path
from omega_vision.perception.metta_memory import (
    DATABASE_FILES, PLANNED_DATABASE_FILES, is_memory_directory, memory_tree_lock,
)

_MEMORY_FILES = {
    *DATABASE_FILES.values(), *PLANNED_DATABASE_FILES.values(),
    "groups_db.metta", "grp_classes_db.metta", "shapes.pl", "identities.db.pl",
}


def _require_memory_free(root: Path, target: Path) -> None:
    home = storage_path(root)
    pending = [Path(target).absolute()]
    while pending:
        path = pending.pop()
        relative = path.relative_to(home)
        if storage_path(root, *relative.parts) != path:
            raise ValueError("A mutation target or descendant redirects to another directory")
        if (any(is_memory_directory(part) for part in relative.parts)
                or path.name.casefold() in _MEMORY_FILES or path.name.casefold().endswith(".memory.json")):
            raise HTTPException(
                status_code=409,
                detail=f"Memory/history at {path} was retained. Tree replacement, deletion, rename or copy "
                       "requires an explicit identity-preserving policy; none is implemented.",
            )
        try:
            metadata = path.stat(follow_symlinks=False)
        except FileNotFoundError:
            continue
        if S_ISDIR(metadata.st_mode):
            pending.extend(path.iterdir())


@contextmanager
def preserve_memory_trees(root: Path, *targets: Path):
    with memory_tree_lock(root):
        try:
            for target in targets:
                _require_memory_free(root, target)
        except (OSError, ValueError) as error:
            raise HTTPException(status_code=409, detail="Cannot safely inspect mutation targets; existing data was retained.") from error
        yield
