from __future__ import annotations

import argparse
import json
import os
import subprocess
import sys
import time
from threading import get_ident
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from launch_diagnostics import announce_launch, configured_logs, configured_urls, prepare_console_launch, read_service_metadata, redact_arguments, redact_text

ROOT = Path(__file__).resolve().parents[3]
POLICY_PATH = (
    ROOT / "workspaces" / "shared_library_system" / "policies"
    / "workbench_startup.workbench_startup_policy.metta"
)
LEGACY_POLICY_PATH = ROOT / "config" / "workbench_startup.json"
SERVICE_DIRECTORY = ROOT / "workspaces" / "shared_library_system" / "design" / "services"
PROCESS_LEDGER = ROOT / "runtime" / "run_workbench_processes.json"


def _record_started_process(
    service_id: str, process: subprocess.Popen, command: list[str], cwd: Path,
    *, spawn_command: list[str] | None = None,
) -> None:
    PROCESS_LEDGER.parent.mkdir(parents=True, exist_ok=True)
    try:
        entries = json.loads(PROCESS_LEDGER.read_text(encoding="utf-8"))
    except (OSError, json.JSONDecodeError):
        entries = []
    if not isinstance(entries, list):
        entries = []
    entries = [entry for entry in entries if isinstance(entry, dict) and entry.get("service") != service_id]
    entries.append({
        "service": service_id,
        "pid": process.pid,
        "parentPid": os.getpid(),
        "launcherPath": str(Path(__file__).resolve()),
        "startedAtEpoch": time.time(),
        "cwd": str(cwd.resolve()),
        "rawCommand": redact_arguments(command),
        "spawnCommand": redact_arguments(spawn_command or command),
        "terminationScope": "process-tree",
    })
    temporary = PROCESS_LEDGER.with_name(
        f".{PROCESS_LEDGER.name}.{os.getpid()}.{get_ident()}.tmp"
    )
    temporary.write_text(json.dumps(entries, indent=2) + "\n", encoding="utf-8")
    temporary.replace(PROCESS_LEDGER)


def _policy_document() -> dict:
    if POLICY_PATH.is_file():
        sys.path.insert(0, str(ROOT / "python" / "workbench_api_server"))
        from metta_resource_codec import metta_document_to_json
        return metta_document_to_json(POLICY_PATH.read_text(encoding="utf-8"))
    try:
        return json.loads(LEGACY_POLICY_PATH.read_text(encoding="utf-8"))
    except (OSError, json.JSONDecodeError):
        return {}


def policy_for(service_id: str) -> dict[str, bool]:
    defaults = {"start": True, "hiddenWindow": False}
    for candidate in SERVICE_DIRECTORY.glob("*.managed_service.metta"):
        try:
            sys.path.insert(0, str(ROOT / "python" / "workbench_api_server"))
            from metta_resource_codec import metta_document_to_json
            service = metta_document_to_json(candidate.read_text(encoding="utf-8"))
            if service.get("id") == service_id:
                configured_default = service.get("defaultStartup") or {}
                defaults = {"start": configured_default.get("start", True) is True, "hiddenWindow": configured_default.get("hiddenWindow", configured_default.get("hidden")) is True}
                break
        except (OSError, ValueError, AttributeError):
            continue
    try:
        document = _policy_document()
        value = document.get("services", {}).get(service_id)
    except (OSError, ValueError, AttributeError):
        value = None
    if not isinstance(value, dict):
        return defaults
    return {"start": value.get("start", defaults["start"]) is True, "hiddenWindow": value.get("hiddenWindow", value.get("hidden", defaults["hiddenWindow"])) is True}


def main() -> int:
    parser = argparse.ArgumentParser(description="Start one run_workbench child according to the persisted system policy.")
    parser.add_argument("--service", required=True)
    parser.add_argument("--cwd", type=Path, default=ROOT)
    parser.add_argument("command", nargs=argparse.REMAINDER)
    args = parser.parse_args()
    if args.command[:1] == ["--"]:
        args.command = args.command[1:]
    print(f"[launch] Checking startup policy for {redact_text(args.service)}...", file=sys.stderr, flush=True)
    declared = read_service_metadata(SERVICE_DIRECTORY, args.service)
    policy = policy_for(args.service)
    if not policy["start"]:
        print(f"{redact_text(args.service)}: disabled by the shared Workbench startup policy resource", flush=True)
        return 3
    if not args.command:
        parser.error("a child command is required")
    metadata = {
        "identity": args.service,
        "label": str(declared.get("label") or args.service),
        "description": str(declared.get("description") or "No service description declared."),
        "urls": configured_urls(declared, args.command, os.environ),
        "logs": configured_logs(declared),
    }
    flags = getattr(subprocess, "CREATE_NEW_PROCESS_GROUP", 0)
    stdout = stderr = None
    if os.name == "nt":
        flags |= getattr(subprocess, "CREATE_NO_WINDOW" if policy["hiddenWindow"] else "CREATE_NEW_CONSOLE", 0)
    if policy["hiddenWindow"]:
        log_root = ROOT / "runtime" / "logs"
        log_root.mkdir(parents=True, exist_ok=True)
        stdout = (log_root / f"{args.service}.stdout.log").open("a", encoding="utf-8")
        stderr = (log_root / f"{args.service}.stderr.log").open("a", encoding="utf-8")
        metadata["logs"].update({"stdout": str(stdout.name), "stderr": str(stderr.name)})
    try:
        announce_launch(args.command, args.cwd, **metadata)
        if stderr is not None:
            announce_launch(args.command, args.cwd, stream=stderr, **metadata)
        command, environment = args.command, dict(os.environ)
        if os.name == "nt" and not policy["hiddenWindow"]:
            command, environment = prepare_console_launch(args.command, args.cwd, environment, **metadata)
        process = subprocess.Popen(command, cwd=args.cwd, env=environment, stdin=subprocess.DEVNULL, stdout=stdout, stderr=stderr, creationflags=flags, close_fds=False)
        _record_started_process(args.service, process, list(args.command), args.cwd, spawn_command=command)
    finally:
        if stdout:
            stdout.close()
        if stderr:
            stderr.close()
    print(f"{redact_text(args.service)}: started ({'hidden window' if policy['hiddenWindow'] else 'visible window'})", flush=True)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
