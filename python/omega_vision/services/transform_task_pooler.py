"""transform_task_pooler.py — offline worker for per-image transformation todos.

Every unit (a Sequence Set move dir or an Image Set transforms/<stem> dir)
carries a little ``todos.json`` describing what still needs to get done:

    {"kind": "transformation_todos", "unit": "17", "imagePath": "image.png",
     "todos": [{"transformation": "parts_extraction_0", "doer": "python_scikit",
                "options": {}, "status": "pending"}, ...]}

This pooler scans one or more roots for those files, claims pending todos,
executes them with the exact same runners the HTTP endpoint uses (result.pl +
meta.json + optional debug_image.png contract), and rewrites each todos.json
as work completes. Run it anywhere the venv exists — no server needed:

    python python/omega_vision/services/transform_task_pooler.py --once
    python .../transform_task_pooler.py --root data/omega_vision --interval 30
"""
from __future__ import annotations

import argparse
import json
import sys
import time
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path

_HERE = Path(__file__).resolve()
_REPO_ROOT = _HERE.parents[3]
for entry in (str(_REPO_ROOT / "python"), str(_REPO_ROOT / "python" / "workbench_api_server")):
    if entry not in sys.path:
        sys.path.insert(0, entry)

from omega_vision.services.video_import_api import (  # noqa: E402
    run_transform_step,
    write_unit_todos,
)


def find_todo_files(roots: list[Path]) -> list[Path]:
    files: list[Path] = []
    for root in roots:
        if root.is_file() and root.name == "todos.json":
            files.append(root)
        elif root.is_dir():
            files.extend(root.rglob("todos.json"))
    return files


def load_unit(todo_file: Path, *, retry_errors: bool) -> tuple[dict, list[dict], list[dict]] | None:
    """Return (unit, all todo entries, workable entries) or None."""
    try:
        payload = json.loads(todo_file.read_text(encoding="utf-8"))
    except (OSError, ValueError):
        return None
    if payload.get("kind") != "transformation_todos":
        return None
    unit_dir = todo_file.parent
    image_rel = payload.get("imagePath")
    unit = {
        "id": str(payload.get("unit") or unit_dir.name),
        "dir": unit_dir,
        "image": (unit_dir / image_rel).resolve() if image_rel else None,
    }
    entries = [t for t in payload.get("todos", []) if t.get("transformation") and t.get("doer")]
    workable_statuses = {"pending", "started"} | ({"error"} if retry_errors else set())
    workable = [t for t in entries if t.get("status") in workable_statuses]
    return (unit, entries, workable) if workable else None


def one_pass(roots: list[Path], *, workers: int, limit: int, retry_errors: bool,
             only_type: str | None, skip_type: str | None) -> int:
    """Collect every workable todo under the roots, order them by priority
    (lower first, then unit id), and execute. Claim files make concurrent
    poolers/servers safe; dependency-blocked tasks wait for a later pass."""
    tasks: list[tuple[int, str, dict, list[dict], dict]] = []
    for todo_file in find_todo_files(roots):
        loaded = load_unit(todo_file, retry_errors=retry_errors)
        if loaded is None:
            continue
        unit, entries, workable = loaded
        for todo in workable:
            if only_type and todo.get("type") != only_type:
                continue
            if skip_type and todo.get("type") == skip_type:
                continue
            tasks.append((int(todo.get("priority", 100)), unit["id"], unit, entries, todo))
    tasks.sort(key=lambda item: (item[0], item[1]))
    if limit:
        tasks = tasks[:limit]
    if not tasks:
        return 0

    def run_task(item: tuple[int, str, dict, list[dict], dict]) -> tuple[dict, dict, dict, int]:
        _prio, _uid, unit, entries, todo = item
        step = run_transform_step(unit, todo["transformation"], todo["doer"],
                                  todo.get("options") or {},
                                  depends_on=todo.get("dependsOn") or [])
        pending = write_unit_todos(unit, entries, [step])
        return unit, todo, step, pending

    done = 0
    with ThreadPoolExecutor(max_workers=max(1, workers)) as pool:
        for unit, todo, step, pending in pool.map(run_task, tasks):
            done += 1
            status = step.get("status")
            detail = ""
            if status == "written":
                detail = f" {step.get('elapsedMs', 0) / 1000:.1f}s"
            elif status == "blocked":
                detail = f" (needs {step.get('missing')})"
            elif status == "claimed":
                detail = f" (by {step.get('claimedBy')})"
            elif status == "error":
                detail = f" {str(step.get('error', ''))[:120]}"
            kind = f" [{todo['type']}]" if todo.get("type") else ""
            print(f"[pooler] {unit['id']} p{todo.get('priority', 100)}{kind} "
                  f"{step['step']}: {status}{detail} | {pending} pending", flush=True)
    return done


def main(argv: list[str]) -> int:
    ap = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    ap.add_argument("--root", action="append", default=None,
                    help="directory to scan for todos.json (repeatable; default: the global "
                         "vision data home data/omega_vision)")
    ap.add_argument("--interval", type=float, default=0.0,
                    help="poll every N seconds; 0 (default) = single pass")
    ap.add_argument("--workers", type=int, default=4)
    ap.add_argument("--limit", type=int, default=0, help="max tasks per pass (0 = all)")
    ap.add_argument("--retry-errors", action="store_true",
                    help="also rerun steps whose last attempt errored")
    ap.add_argument("--only-type", default=None,
                    help="only work todos of this type (e.g. ui)")
    ap.add_argument("--skip-type", default=None,
                    help="skip todos of this type (e.g. ui)")
    args = ap.parse_args(argv)

    roots = [Path(r) for r in (args.root or [str(_REPO_ROOT / "data" / "omega_vision")])]
    print(f"[pooler] scanning: {', '.join(str(r) for r in roots)}", flush=True)
    while True:
        done = one_pass(roots, workers=args.workers, limit=args.limit,
                        retry_errors=args.retry_errors,
                        only_type=args.only_type, skip_type=args.skip_type)
        print(f"[pooler] pass complete: {done} task(s) worked", flush=True)
        if args.interval <= 0:
            return 0
        time.sleep(args.interval)


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
