from __future__ import annotations

import argparse
import os
from pathlib import Path
import subprocess
import sys
import time

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from launch_diagnostics import announce_launch


REPO_ROOT = Path(__file__).resolve().parents[3]
WORKBENCH_ROOT = REPO_ROOT
SERVER_ROOT = Path(__file__).resolve().parents[1]
RESTART_EXIT_CODE = 75
SUPERVISED_WORKER_ENV = "WORKBENCH_API_SUPERVISED_WORKER"


def _stop_worker(worker: subprocess.Popen[bytes]) -> None:
    if worker.poll() is not None:
        return
    worker.terminate()
    try:
        worker.wait(timeout=5)
    except subprocess.TimeoutExpired:
        worker.kill()
        worker.wait(timeout=5)


def _run_explicit_restart_supervisor(host: str, port: int) -> None:
    command = [sys.executable, str(Path(__file__).resolve()), "--host", host, "--port", str(port)]
    environment = {**os.environ, SUPERVISED_WORKER_ENV: "1"}
    def announce() -> None:
        announce_launch(command, WORKBENCH_ROOT, identity="workbench-api",
                        description="Workbench API worker under the explicit restart supervisor.",
                        urls={"API": f"http://{host}:{port}", "health": f"http://{host}:{port}/workbench/health"})
    announce()
    worker = subprocess.Popen(command, cwd=WORKBENCH_ROOT, env=environment)
    try:
        while True:
            return_code = worker.wait()
            if return_code != RESTART_EXIT_CODE:
                raise SystemExit(return_code)
            print("Explicit API restart requested; starting fresh worker...", flush=True)
            time.sleep(0.2)
            announce()
            worker = subprocess.Popen(command, cwd=WORKBENCH_ROOT, env=environment)
    except KeyboardInterrupt:
        pass
    finally:
        _stop_worker(worker)


def main() -> None:
    parser = argparse.ArgumentParser(description="Run the Workbench API development server.")
    parser.add_argument("--host", default="127.0.0.1")
    parser.add_argument("--port", default=8000, type=int)
    args = parser.parse_args()
    announce_launch([sys.executable, str(Path(__file__).resolve()), *sys.argv[1:]], Path.cwd(),
                    identity="workbench-api", description=parser.description,
                    urls={"API": f"http://{args.host}:{args.port}", "health": f"http://{args.host}:{args.port}/workbench/health"})

    os.chdir(SERVER_ROOT)
    for extra in (SERVER_ROOT, REPO_ROOT / "python", REPO_ROOT / "python" / "plugins_framework"):
        sys.path.insert(0, str(extra))
    if os.environ.get(SUPERVISED_WORKER_ENV) != "1":
        _run_explicit_restart_supervisor(args.host, args.port)
        return
    import uvicorn
    uvicorn.run(
        "app:app",
        host=args.host,
        port=args.port,
        reload=False,
        timeout_graceful_shutdown=5,
    )


if __name__ == "__main__":
    main()
