"""transform_task_pooler.py — offline worker for per-image transformation todos.

Every unit (a Sequence Set move dir or an Image Set transforms/<stem> dir)
carries a little ``todos.json`` describing what still needs to get done:

    {"kind": "transformation_todos", "unit": "17", "imagePath": "image.png",
     "todos": [{"transformation": "parts_extraction_0", "doer": "python_opencv",
                "options": {}, "status": "pending"}, ...]}

This pooler scans one or more roots for those files, claims pending todos,
executes them with the exact same runners the HTTP endpoint uses (result.pl +
meta.json + optional debug_image.png contract), and rewrites each todos.json
as work completes. Run it anywhere the venv exists — no server needed.

CONTROL-FILE MODE (default): the pooler serves ONE active todo set at a time,
directed by ``data/omega_vision/pooler_control.json``:

    {"kind": "pooler_control", "command": "run" | "pause" | "exit",
     "root": "<dir to work, absolute or repo-relative>",
     "workers": 10, "interval": 5}

The file is re-read continuously (including between tasks mid-pass), so
whoever stamps a new todo set just rewrites ``root`` and the pooler abandons
the rest of its pass and moves over; ``pause``/``exit`` obey the same path.
The pooler heartbeats ``pooler_status.json`` next to the control file so UIs
can show pid/state/progress. Legacy scan mode remains via explicit --root:

    python python/omega_vision/services/transform_task_pooler.py --root data/omega_vision --interval 30
"""
from __future__ import annotations

import argparse
import json
import os
import sys
import threading
import time
from concurrent.futures import ThreadPoolExecutor, as_completed
from datetime import datetime, timezone
from pathlib import Path
from typing import Any, Callable

_HERE = Path(__file__).resolve()
_REPO_ROOT = _HERE.parents[3]
for entry in (str(_REPO_ROOT / "python"), str(_REPO_ROOT / "python" / "workbench_api_server")):
    if entry not in sys.path:
        sys.path.insert(0, entry)

from omega_vision.services.video_import_api import (  # noqa: E402
    run_transform_step,
    write_unit_todos,
)

_DEFAULT_CONTROL = _REPO_ROOT / "data" / "omega_vision" / "pooler_control.json"
_DEFAULT_WORKERS = 10
_HEARTBEAT_STALE_S = 20.0


def _utc_now() -> str:
    return datetime.now(timezone.utc).isoformat()


def read_control(path: Path) -> dict[str, Any]:
    try:
        payload = json.loads(path.read_text(encoding="utf-8"))
        if isinstance(payload, dict):
            return payload
    except (OSError, ValueError):
        pass
    return {}


def write_control(path: Path, payload: dict[str, Any]) -> None:
    payload = {"kind": "pooler_control", **payload, "updatedAt": _utc_now()}
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(payload, indent=2), encoding="utf-8")


def _status_path(control_path: Path) -> Path:
    return control_path.with_name("pooler_status.json")


def write_status(control_path: Path, state: str, ctl: dict[str, Any],
                 extra: dict[str, Any] | None = None) -> None:
    payload: dict[str, Any] = {
        "kind": "pooler_status", "pid": os.getpid(), "state": state,
        "root": str(ctl.get("root") or ""), "workers": _ctl_workers(ctl),
        "heartbeatAt": _utc_now(),
    }
    if extra:
        payload.update(extra)
    try:
        _status_path(control_path).write_text(json.dumps(payload, indent=2), encoding="utf-8")
    except OSError:
        pass


def _ctl_workers(ctl: dict[str, Any]) -> int:
    try:
        return max(1, min(32, int(ctl.get("workers") or _DEFAULT_WORKERS)))
    except (TypeError, ValueError):
        return _DEFAULT_WORKERS


def _ctl_root(ctl: dict[str, Any]) -> Path | None:
    raw = str(ctl.get("root") or "").strip()
    if not raw:
        return None
    p = Path(raw)
    if not p.is_absolute():
        p = _REPO_ROOT / p
    return p if p.is_dir() else None


def _other_pooler_alive(control_path: Path) -> int:
    """Another live pooler = fresh heartbeat from a different pid."""
    try:
        st = json.loads(_status_path(control_path).read_text(encoding="utf-8"))
        pid = int(st.get("pid") or 0)
        if pid and pid != os.getpid() and st.get("state") not in ("exited",):
            beat = datetime.fromisoformat(str(st.get("heartbeatAt")))
            age = (datetime.now(timezone.utc) - beat).total_seconds()
            if age < _HEARTBEAT_STALE_S:
                return pid
    except (OSError, ValueError, TypeError):
        pass
    return 0


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
        "sequenceId": payload.get("sequenceId"),
        "frameOrder": payload.get("frameOrder"),
        "frameSourceKey": payload.get("frameSourceKey"),
        "sequenceOrdered": bool(payload.get("sequenceOrdered", False)),
    }
    entries = [t for t in payload.get("todos", []) if t.get("transformation") and t.get("doer")]
    workable_statuses = {"pending", "started"} | ({"error"} if retry_errors else set())
    workable = [t for t in entries if t.get("status") in workable_statuses]
    return (unit, entries, workable) if workable else None


def one_pass(roots: list[Path], *, workers: int, limit: int, retry_errors: bool,
             only_types: set[str] | None, skip_types: set[str] | None,
             should_abort: Callable[[], bool] | None = None,
             report: Callable[[dict[str, Any]], None] | None = None) -> int:
    """Collect every workable todo under the roots, order them by priority
    (lower first, then unit id), and execute. Claim files make concurrent
    poolers/servers safe; dependency-blocked tasks wait for a later pass.
    Todo ``type`` tags (ui / llm / p_shot / py_pl) select work via
    only_types/skip_types. ``should_abort`` is polled before each task so a
    retargeted/paused control file stops the rest of the pass promptly.
    ``report`` (when given) receives a progress snapshot on every task
    start/finish AND every few seconds from a ticker thread, so heartbeats
    stay fresh even while long tasks run — status readers (the /pooler
    endpoint, other poolers' liveness checks) always see what is being
    worked on right now."""
    tasks: list[tuple[int, str, dict, list[dict], dict]] = []
    for todo_file in find_todo_files(roots):
        loaded = load_unit(todo_file, retry_errors=retry_errors)
        if loaded is None:
            continue
        unit, entries, workable = loaded
        for todo in workable:
            # Untyped legacy extraction/Prolog todos belong to the py_pl lane.
            ttype = str(todo.get("type") or "py_pl")
            if only_types and ttype not in only_types:
                continue
            if skip_types and ttype in skip_types:
                continue
            tasks.append((int(todo.get("priority", 100)), unit["id"], unit, entries, todo))
    tasks.sort(key=lambda item: (item[0], item[1]))
    if limit:
        tasks = tasks[:limit]
    if not tasks:
        return 0

    total = len(tasks)
    state_lock = threading.Lock()
    active: dict[int, str] = {}
    recent: list[str] = []
    counts: dict[str, int] = {"done": 0}

    def _snapshot() -> dict[str, Any]:
        with state_lock:
            return {
                "done": counts["done"], "total": total,
                "active": sorted(active.values()),
                "recent": list(recent),
                "results": {k: v for k, v in counts.items() if k != "done"},
            }

    def _tell() -> None:
        if report is not None:
            try:
                report(_snapshot())
            except Exception:  # noqa: BLE001 - reporting never kills work
                pass

    def run_task(item: tuple[int, str, dict, list[dict], dict]) -> tuple[dict, dict, dict, int] | None:
        if should_abort is not None and should_abort():
            return None
        _prio, _uid, unit, entries, todo = item
        label = f"{unit['id']} · {todo['transformation']}/{todo['doer']}"
        token = id(item)
        with state_lock:
            active[token] = label
        _tell()
        try:
            step = run_transform_step(unit, todo["transformation"], todo["doer"],
                                      todo.get("options") or {},
                                      depends_on=todo.get("dependsOn") or [],
                                      depends_on_resolved=todo.get("dependsOnResolved") or [])
            pending = write_unit_todos(unit, entries, [step])
        finally:
            with state_lock:
                active.pop(token, None)
        status = str(step.get("status") or "unknown")
        with state_lock:
            counts["done"] += 1
            counts[status] = counts.get(status, 0) + 1
            note = f"{label}: {status}"
            if status == "written":
                note += f" {step.get('elapsedMs', 0) / 1000:.1f}s"
            recent.append(note)
            del recent[:-8]
        _tell()
        return unit, todo, step, pending

    stop_ticker = threading.Event()

    def _tick() -> None:
        while not stop_ticker.wait(5.0):
            _tell()

    ticker = threading.Thread(target=_tick, name="pooler-heartbeat", daemon=True)
    ticker.start()
    done = 0
    try:
        with ThreadPoolExecutor(max_workers=max(1, workers)) as pool:
            futures = [pool.submit(run_task, item) for item in tasks]
            for future in as_completed(futures):
                result = future.result()
                if result is None:
                    continue
                unit, todo, step, pending = result
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
    finally:
        stop_ticker.set()
        ticker.join(timeout=1.0)
        _tell()
    return done


def _ctl_types(ctl: dict[str, Any], key: str, fallback: str | None) -> set[str] | None:
    raw = ctl.get(key)
    types = {str(t) for t in raw if t} if isinstance(raw, list) else set()
    if fallback:
        types.add(fallback)
    return types or None


def control_loop(control_path: Path, *, retry_errors: bool,
                 only_type: str | None, skip_type: str | None) -> int:
    """Serve the active todo set: obey command/root/workers/type filters from
    the control file, abandoning the current pass when any of them change.
    An exclusive pooler.lock (plus the status heartbeat) guarantees a single
    pooler per control file even when two spawn in the same instant."""
    lock = control_path.with_name("pooler.lock")

    def _try_lock() -> bool:
        try:
            fd = os.open(str(lock), os.O_CREAT | os.O_EXCL | os.O_WRONLY)
            os.write(fd, str(os.getpid()).encode("ascii"))
            os.close(fd)
            return True
        except OSError:
            return False

    control_path.parent.mkdir(parents=True, exist_ok=True)
    got = _try_lock()
    if not got and not _other_pooler_alive(control_path):
        try:
            lock.unlink()  # stale lock from a crashed pooler
        except OSError:
            pass
        got = _try_lock()
    if not got:
        other = _other_pooler_alive(control_path)
        print(f"[pooler] another pooler (pid {other or 'unknown'}) already serves {control_path}; exiting", flush=True)
        return 0
    try:
        return _control_loop_locked(control_path, retry_errors=retry_errors,
                                    only_type=only_type, skip_type=skip_type)
    finally:
        try:
            lock.unlink()
        except OSError:
            pass


def _control_loop_locked(control_path: Path, *, retry_errors: bool,
                         only_type: str | None, skip_type: str | None) -> int:
    if not read_control(control_path):
        write_control(control_path, {"command": "pause", "root": "",
                                     "workers": _DEFAULT_WORKERS, "interval": 5,
                                     "onlyTypes": ["py_pl", "ui"], "skipTypes": []})
    print(f"[pooler] pid {os.getpid()} controlled by {control_path}", flush=True)
    while True:
        ctl = read_control(control_path)
        command = str(ctl.get("command") or "pause").lower()
        try:
            interval = max(1.0, float(ctl.get("interval") or 5))
        except (TypeError, ValueError):
            interval = 5.0
        if command == "exit":
            write_status(control_path, "exited", ctl)
            print("[pooler] exit command received", flush=True)
            return 0
        root = _ctl_root(ctl)
        if command != "run" or root is None:
            write_status(control_path, "paused" if command != "run" else "idle", ctl)
            time.sleep(1.0)
            continue

        only_types = _ctl_types(ctl, "onlyTypes", only_type)
        skip_types = _ctl_types(ctl, "skipTypes", skip_type)
        baseline = {"command": command, "root": str(ctl.get("root") or ""),
                    "workers": _ctl_workers(ctl),
                    "only": sorted(only_types or ()), "skip": sorted(skip_types or ())}

        def _changed() -> bool:
            live = read_control(control_path)
            return {"command": str(live.get("command") or "pause").lower(),
                    "root": str(live.get("root") or ""),
                    "workers": _ctl_workers(live),
                    "only": sorted(_ctl_types(live, "onlyTypes", only_type) or ()),
                    "skip": sorted(_ctl_types(live, "skipTypes", skip_type) or ())} != baseline

        write_status(control_path, "working", ctl)
        report_lock = threading.Lock()

        def _report(progress: dict[str, Any]) -> None:
            with report_lock:
                write_status(control_path, "working", ctl, progress)

        done = one_pass([root], workers=baseline["workers"], limit=0,
                        retry_errors=retry_errors, only_types=only_types,
                        skip_types=skip_types, should_abort=_changed,
                        report=_report)
        write_status(control_path, "idle", ctl, {"lastPassDone": done, "lastPassAt": _utc_now()})
        if done:
            print(f"[pooler] pass complete: {done} task(s) worked", flush=True)
            continue
        # idle: nap in 1s ticks so control edits stay responsive
        napped = 0.0
        while napped < interval:
            time.sleep(1.0)
            napped += 1.0
            if _changed():
                break
            write_status(control_path, "idle", ctl)


def main(argv: list[str]) -> int:
    ap = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    ap.add_argument("--root", action="append", default=None,
                    help="legacy scan mode: directory to scan for todos.json (repeatable). "
                         "When omitted the pooler runs in control-file mode.")
    ap.add_argument("--control", default=str(_DEFAULT_CONTROL),
                    help="control file for the active todo set (default: data/omega_vision/pooler_control.json)")
    ap.add_argument("--interval", type=float, default=0.0,
                    help="legacy mode: poll every N seconds; 0 (default) = single pass")
    ap.add_argument("--workers", type=int, default=4, help="legacy mode worker count")
    ap.add_argument("--limit", type=int, default=0, help="max tasks per pass (0 = all)")
    ap.add_argument("--retry-errors", action="store_true",
                    help="also rerun steps whose last attempt errored")
    ap.add_argument("--only-type", default=None,
                    help="only work todos of this type (e.g. ui)")
    ap.add_argument("--skip-type", default=None,
                    help="skip todos of this type (e.g. ui)")
    args = ap.parse_args(argv)

    # announce: first log line is the exact command, and the console window
    # (when visible) is titled so stray windows are identifiable.
    print(f"[pooler] $ {sys.executable} {' '.join(sys.argv)}", flush=True)
    if os.name == "nt":
        try:
            import ctypes  # noqa: PLC0415
            ctypes.windll.kernel32.SetConsoleTitleW(
                f"transform_task_pooler · pid {os.getpid()} · {args.control if not args.root else 'legacy scan'}")
        except Exception:  # noqa: BLE001
            pass

    if not args.root:
        return control_loop(Path(args.control), retry_errors=args.retry_errors,
                            only_type=args.only_type, skip_type=args.skip_type)

    roots = [Path(r) for r in args.root]
    print(f"[pooler] scanning: {', '.join(str(r) for r in roots)}", flush=True)
    while True:
        done = one_pass(roots, workers=args.workers, limit=args.limit,
                        retry_errors=args.retry_errors,
                        only_types={args.only_type} if args.only_type else None,
                        skip_types={args.skip_type} if args.skip_type else None)
        print(f"[pooler] pass complete: {done} task(s) worked", flush=True)
        if args.interval <= 0:
            return 0
        time.sleep(args.interval)


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
