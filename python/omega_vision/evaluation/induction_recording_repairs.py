"""Explicit, backed-up repair of the task-authored v1 clip descriptions only.

This is not part of the ordinary create-only generator. Archive the old generated
baseline before changing its description source, then explicitly publish the fix.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
from pathlib import Path
import re
from uuid import uuid4

from omega_vision.inherited_source_overlay import shared_storage_path, storage_path, vision_data_root
from omega_vision.perception._event_journal import writer_lock

from .event_recordings import SUITE_ID as LOCK_ID, _json
from .induction_recording_cases import STEMS, induction_clips
from .induction_recordings import recording_test_files

REPAIR_ID = "20260912-clip-descriptions-v1"
ARCHIVE = ("runtime", "documentation-repairs", REPAIR_ID)


def _path(home: Path, parts: tuple[str, ...]) -> Path:
    target = storage_path(home, *parts)
    if target != home.joinpath(*parts):
        raise ValueError("Documentation repair cannot redirect a physical path")
    return target


def _digest(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def _repairable() -> set[tuple[str, ...]]:
    prefix = ("recordings", "events_tests")
    return {(*prefix, "documentation", f"{stem}.md") for stem in STEMS} | {
        (*prefix, clip.name, "evaluation.json") for clip in induction_clips()
    }


def _write_new(home: Path, parts: tuple[str, ...], data: bytes) -> None:
    path = _path(home, parts)
    if path.exists():
        if not path.is_file() or path.read_bytes() != data:
            raise FileExistsError(f"Existing repair history differs; preserved: {path}")
        return
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("xb") as stream:
        stream.write(data)


def archive_generated_baseline(root: Path) -> dict[str, int | str]:
    home = vision_data_root(root)
    files, _ = recording_test_files()
    backed_up = _repairable() & files.keys()
    manifest = {
        "repairId": REPAIR_ID,
        "files": {"/".join(parts): _digest(data) for parts, data in files.items()},
        "backedUp": sorted("/".join(parts) for parts in backed_up),
    }
    outputs = {(*ARCHIVE, "old", *parts): files[parts] for parts in backed_up}
    outputs[(*ARCHIVE, "baseline.json")] = _json(manifest)
    _path(home, ("locks", LOCK_ID, ".writer.lock"))
    with writer_lock(_path(home, ("locks", LOCK_ID))):
        # Check the entire original publication, including immutable images/states.
        for parts, data in files.items():
            if _path(home, parts).read_bytes() != data:
                raise FileExistsError(f"Live file is not the generated baseline; preserved: {'/'.join(parts)}")
        for parts, data in outputs.items():
            target = _path(home, parts)
            if target.exists() and (not target.is_file() or target.read_bytes() != data):
                raise FileExistsError(f"Existing repair history differs; preserved: {target}")
        for parts, data in outputs.items():
            _write_new(home, parts, data)
    return {"repairId": REPAIR_ID, "archivedFiles": len(backed_up), "verifiedPublicationFiles": len(files)}


def _replace_checked(home: Path, parts: tuple[str, ...], expected: bytes, replacement: bytes) -> None:
    target = _path(home, parts)
    staging_parts = (*ARCHIVE, f".replacement-{uuid4().hex}")
    staging = _path(home, staging_parts)
    try:
        with staging.open("xb") as stream:
            stream.write(replacement)
            stream.flush()
            os.fsync(stream.fileno())
        # Revalidate after staging, not just during the whole-publication preflight.
        target = _path(home, parts)
        if target.read_bytes() != expected:
            raise FileExistsError(f"Concurrent documentation edit preserved: {target}")
        os.replace(_path(home, staging_parts), target)
    finally:
        cleanup = _path(home, staging_parts)
        if cleanup.exists():
            cleanup.unlink()


def _check_description_only(parts: tuple[str, ...], old: bytes, new: bytes) -> None:
    if parts[-1] == "evaluation.json":
        previous, corrected = json.loads(old), json.loads(new)
        previous.pop("controlInterpretation", None)
        corrected.pop("controlInterpretation", None)
        if previous != corrected:
            raise ValueError("Description repair cannot change evaluator frames or other metadata")
    else:
        pattern = r"^(- \*\*(?:train_[abc]|control_a|control_horizon|validation_a|test_a|test_control_a)\*\*: ).*$"
        previous = re.sub(pattern, r"\1<description>", old.decode("utf-8"), flags=re.MULTILINE)
        corrected = re.sub(pattern, r"\1<description>", new.decode("utf-8"), flags=re.MULTILINE)
        if previous != corrected:
            raise ValueError("Description repair cannot change documentation outside per-clip descriptions")


def publish_description_repair(root: Path) -> dict[str, int | str]:
    home = vision_data_root(root)
    files, _ = recording_test_files()
    allowed = _repairable()
    _path(home, ("locks", LOCK_ID, ".writer.lock"))
    with writer_lock(_path(home, ("locks", LOCK_ID))):
        baseline = json.loads(_path(home, (*ARCHIVE, "baseline.json")).read_text(encoding="utf-8"))
        if (baseline.get("repairId") != REPAIR_ID
                or set(baseline.get("files", {})) != {"/".join(parts) for parts in files}
                or set(baseline.get("backedUp", [])) != {"/".join(parts) for parts in allowed & files.keys()}):
            raise ValueError("Repair baseline does not match this exact generated publication")
        pending = []
        changed = {}
        for parts, data in files.items():
            name = "/".join(parts)
            old_hash = baseline["files"][name]
            target = _path(home, parts)
            actual = target.read_bytes()
            if parts in allowed:
                archived = _path(home, (*ARCHIVE, "old", *parts)).read_bytes()
                if _digest(archived) != old_hash:
                    raise ValueError(f"Repair archive is corrupt: {name}")
            if _digest(data) != old_hash:
                if parts not in allowed:
                    raise ValueError(f"Description repair cannot change this file type: {name}")
                _check_description_only(parts, archived, data)
                if actual not in (archived, data):
                    raise FileExistsError(f"Concurrent documentation edit preserved: {target}")
                changed[name] = _digest(data)
                if actual != data:
                    pending.append((parts, actual, data))
            elif actual != data:
                raise FileExistsError(f"Unrelated live file changed; preserved: {target}")
        receipt = _json({"repairId": REPAIR_ID, "repairedFiles": changed})
        receipt_parts = (*ARCHIVE, "repaired.json")
        receipt_path = _path(home, receipt_parts)
        if receipt_path.exists() and receipt_path.read_bytes() != receipt:
            raise FileExistsError("A different repair receipt already exists; preserved")
        for parts, old, new in pending:
            _replace_checked(home, parts, old, new)
        _write_new(home, receipt_parts, receipt)
    return {"repairId": REPAIR_ID, "changedFiles": len(pending), "repairedPublicationFiles": len(changed)}


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("action", choices=("archive", "publish"))
    action = parser.parse_args().action
    function = archive_generated_baseline if action == "archive" else publish_description_repair
    print(json.dumps(function(shared_storage_path()), indent=2))


if __name__ == "__main__":
    main()
