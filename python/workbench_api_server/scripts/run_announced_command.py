"""Print a prepared, redacted banner in the actual child console, then run once."""

from __future__ import annotations

import argparse
import base64
import json
import os
import subprocess
import sys


def _announce(banner: str, console: bool) -> None:
    if console and os.name == "nt":
        try:
            with open("CONOUT$", "w", encoding="utf-8", errors="replace") as output:
                print(banner, end="", file=output, flush=True)
            return
        except OSError:
            pass  # Headless callers have no attached console; use diagnostics stderr.
    print(banner, end="", file=sys.stderr, flush=True)


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--banner")
    parser.add_argument("--environment", action="store_true")
    parser.add_argument("--console", action="store_true")
    parser.add_argument("command", nargs=argparse.REMAINDER)
    args = parser.parse_args(argv)
    command = args.command[1:] if args.command[:1] == ["--"] else args.command
    if args.environment:
        payload = json.loads(os.environ["WB_CONSOLE_PAYLOAD"])
        command = payload["argv"]
        for key, value in payload["restoreEnvironment"].items():
            if value is None:
                os.environ.pop(key, None)
            else:
                os.environ[key] = value
    if not command:
        parser.error("a child command is required")
    if args.banner:
        _announce(base64.b64decode(args.banner, validate=True).decode("utf-8"), args.console)
    elif not args.environment:
        parser.error("a prepared banner or environment payload is required")
    try:
        child = subprocess.Popen(command)
    except OSError as error:
        print(f"[launch] Cannot start child: {type(error).__name__} (OS error {error.errno})",
              file=sys.stderr, flush=True)
        return 1
    try:
        return child.wait()
    except KeyboardInterrupt:
        return child.wait()


if __name__ == "__main__":
    raise SystemExit(main())
