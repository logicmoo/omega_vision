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


def load_unit(todo_file: Path) -> tuple[dict, list[tuple[str, str, dict]]] | None:
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
    pipeline = [(str(t.get("transformation")), str(t.get("doer")), t.get("options") or {})
                for t in payload.get("todos", [])
                if t.get("transformation") and t.get("doer")]
    has_pending = any(t.get("status") in ("pending", "error") for t in payload.get("todos", []))
    return (unit, pipeline) if has_pending else None


def work_unit(unit: dict, pipeline: list[tuple[str, str, dict]], *, retry_errors: bool) -> dict:
    steps = []
    for transformation, doer, options in pipeline:
        out_meta = unit["dir"] / transformation / doer / "meta.json"
        if out_meta.is_file() and not retry_errors:
            continue
        steps.append(run_transform_step(unit, transformation, doer, options))
    pending = write_unit_todos(unit, pipeline, steps)
    return {"unit": unit["id"], "dir": str(unit["dir"]), "steps": steps, "pending": pending}


def one_pass(roots: list[Path], *, workers: int, limit: int, retry_errors: bool) -> int:
    jobs: list[tuple[dict, list[tuple[str, str, dict]]]] = []
    for todo_file in find_todo_files(roots):
        loaded = load_unit(todo_file)
        if loaded is not None:
            jobs.append(loaded)
        if limit and len(jobs) >= limit:
            break
    if not jobs:
        return 0
    done = 0
    with ThreadPoolExecutor(max_workers=max(1, workers)) as pool:
        for result in pool.map(lambda job: work_unit(job[0], job[1], retry_errors=retry_errors), jobs):
            done += 1
            written = sum(1 for s in result["steps"] if s.get("status") == "written")
            errors = [s for s in result["steps"] if s.get("status") == "error"]
            line = f"[pooler] {result['unit']}: {written} written, {result['pending']} pending"
            if errors:
                line += f", {len(errors)} error(s): {errors[0].get('error', '')[:120]}"
            print(line, flush=True)
    return done


def main(argv: list[str]) -> int:
    ap = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    ap.add_argument("--root", action="append", default=None,
                    help="directory to scan for todos.json (repeatable; default: the global "
                         "vision data home data/omega_vision)")
    ap.add_argument("--interval", type=float, default=0.0,
                    help="poll every N seconds; 0 (default) = single pass")
    ap.add_argument("--workers", type=int, default=4)
    ap.add_argument("--limit", type=int, default=0, help="max units per pass (0 = all)")
    ap.add_argument("--retry-errors", action="store_true",
                    help="also rerun steps whose last attempt errored")
    args = ap.parse_args(argv)

    roots = [Path(r) for r in (args.root or [str(_REPO_ROOT / "data" / "omega_vision")])]
    print(f"[pooler] scanning: {', '.join(str(r) for r in roots)}", flush=True)
    while True:
        done = one_pass(roots, workers=args.workers, limit=args.limit, retry_errors=args.retry_errors)
        print(f"[pooler] pass complete: {done} unit(s) worked", flush=True)
        if args.interval <= 0:
            return 0
        time.sleep(args.interval)


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
