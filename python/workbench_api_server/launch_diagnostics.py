"""Human startup diagnostics; never change execution arguments or print environments."""

from __future__ import annotations

import base64
import json
import re
import shutil
import subprocess
import sys
from collections.abc import Mapping, Sequence
from pathlib import Path
from typing import TextIO
from urllib.parse import parse_qsl, urlencode, urlsplit, urlunsplit

_SECRET = re.compile(r"(?i)(?:password|passwd|pwd|secret|token|api[-_]?key|access[-_]?key|private[-_]?key|credential|authorization|bearer|cookie|signature|^sig$|^key$)")
_URL = re.compile(r"\b[a-zA-Z][a-zA-Z0-9+.-]*://[^\s<>\"']+")
_ASSIGNMENT = re.compile(
    r"(?i)((?:password|passwd|pwd|secret|token|api[-_]?key|access[-_]?key|credential|cookie)"
    r"[\w-]*\s*[:=]\s*)(\"[^\"]*\"|'[^']*'|[^\s,;&]+)"
)
_FLAG_VALUE = re.compile(
    r"(?i)(--[\w-]*(?:password|passwd|secret|token|api[-_]?key|credential)[\w-]*\s+)"
    r"(\"[^\"]*\"|'[^']*'|[^\s]+)"
)
_ANSI = re.compile(r"\x1b(?:\[[0-?]*[ -/]*[@-~]|\][^\x07]*(?:\x07|$))")


def _safe_url(match: re.Match[str]) -> str:
    try:
        value = urlsplit(match.group())
        host = value.netloc.rsplit("@", 1)[-1]
        if "@" in value.netloc:
            host = "[REDACTED]@" + host
        query = urlencode([
            (key, "[REDACTED]" if _SECRET.search(key) else val)
            for key, val in parse_qsl(value.query, keep_blank_values=True)
        ])
        fragment = _ASSIGNMENT.sub(r"\1[REDACTED]", value.fragment)
        return urlunsplit((value.scheme, host, value.path, query, fragment))
    except ValueError:
        return "[REDACTED URL]"


def redact_text(value: object) -> str:
    text = _ANSI.sub("", str(value))
    text = _URL.sub(_safe_url, text)
    text = re.sub(r"(?i)((?:authorization|(?:set-)?cookie)\s*[:=]\s*).+", r"\1[REDACTED]", text)
    text = _ASSIGNMENT.sub(r"\1[REDACTED]", text)
    text = _FLAG_VALUE.sub(r"\1[REDACTED]", text)
    text = re.sub(r"\b(?:sk|or-v1)-[A-Za-z0-9_-]{12,}\b", "[REDACTED]", text)
    return "".join(char if ord(char) >= 32 and ord(char) != 127 else " " for char in text)


def redact_arguments(command: Sequence[str], cwd: Path | str | None = None) -> list[str]:
    parts: list[str] = []
    hide_next = False
    for index, argument in enumerate(command):
        if hide_next:
            parts.append("[REDACTED]")
            hide_next = False
            continue
        name, separator, _ = argument.partition("=")
        flag = argument.startswith("-") or bool(re.match(r"^/[\w-]+(?:=|$)", argument))
        assignment = bool(separator and re.fullmatch(r"[\w-]+", name))
        if index and _SECRET.search(name.lstrip("-/")) and (flag or assignment):
            parts.append(f"{name}=[REDACTED]" if separator else name)
            hide_next = not separator
            continue
        if index == 0 and cwd is not None:
            candidate = Path(argument)
            if candidate.is_absolute() or candidate.parent != Path("."):
                argument = str((Path(cwd) / candidate).resolve())
            else:
                argument = shutil.which(argument) or argument
        parts.append(redact_text(argument))
    return parts


def display_command(command: Sequence[str], cwd: Path | str) -> str:
    parts = redact_arguments(command, cwd)
    return subprocess.list2cmdline(parts) if parts else "(in-process; no child command)"


def launch_banner(
    command: Sequence[str], cwd: Path | str, *, identity: str,
    label: str | None = None, description: str | None = None,
    urls: Mapping[str, str] | None = None, logs: Mapping[str, str] | None = None,
    details: Mapping[str, str] | None = None,
) -> str:
    endpoint = (urls or {}).get("service origin") or (urls or {}).get("API")
    purpose = redact_text(label or identity)
    if endpoint:
        purpose += f" on {redact_text(endpoint)}"
    lines = [
        f"[launch command] {display_command(command, cwd)} — {purpose}",
        f"[launch] {redact_text(label or identity)} [{redact_text(identity)}]",
        f"  Purpose: {redact_text(description or 'No description declared.')}",
        f"  Working directory: {redact_text(Path(cwd).resolve())}",
    ]
    for group, values in (("URL", urls), ("Log/output", logs), ("Detail", details)):
        for name, value in (values or {}).items():
            if value:
                lines.append(f"  {group} {redact_text(name)}: {redact_text(value)}")
    return "\n".join(lines) + "\n"


def announce_launch(command: Sequence[str], cwd: Path | str, *, stream: TextIO | None = None, **metadata) -> None:
    print(launch_banner(command, cwd, **metadata), end="", file=stream or sys.stderr, flush=True)


def console_command(command: Sequence[str], cwd: Path | str, **metadata) -> list[str]:
    """Keep one owned console wrapper alive until its one child exits."""
    if not command:
        raise ValueError("A console child command is required")
    program = Path(command[0])
    resolved = str((Path(cwd) / program).resolve()) if program.is_absolute() or program.parent != Path(".") else shutil.which(command[0])
    if not resolved or not Path(resolved).is_file():
        raise FileNotFoundError(2, "Console child executable was not found", command[0])
    child = [resolved, *command[1:]]
    runner = Path(__file__).parent / "scripts" / "run_announced_command.py"
    print(f"[launch] Console runner: {display_command([sys.executable, str(runner)], cwd)} "
          "--console --banner [redacted display metadata] -- [command above]", file=sys.stderr, flush=True)
    banner = base64.b64encode(launch_banner(command, cwd, **metadata).encode("utf-8")).decode("ascii")
    return [sys.executable, str(runner), "--console", "--banner", banner, "--", *child]


def prepare_console_launch(
    command: Sequence[str], cwd: Path | str, environment: Mapping[str, str], **metadata,
) -> tuple[list[str], dict[str, str]]:
    """The visible shell announces before Python; execution argv never enters shell text."""
    shell = shutil.which("cmd.exe")
    if not shell or not shutil.which("powershell.exe"):
        raise FileNotFoundError("Command Prompt and Windows PowerShell are required for the announced console bootstrap")
    if not command:
        raise ValueError("A console child command is required")
    program = Path(command[0])
    resolved = str((Path(cwd) / program).resolve()) if program.is_absolute() or program.parent != Path(".") else shutil.which(command[0])
    if not resolved or not Path(resolved).is_file():
        raise FileNotFoundError(2, "Console child executable was not found", command[0])
    script = Path(__file__).parent / "scripts" / "run_announced_console.cmd"
    runner = script.with_name("run_announced_command.py")
    metadata = {**metadata, "details": {
        **(metadata.get("details") or {}),
        "bootstrap runner": display_command([sys.executable, str(runner), "--environment"], cwd),
    }}
    keys = ("WB_CONSOLE_BANNER", "WB_CONSOLE_TITLE", "WB_CONSOLE_PYTHON", "WB_CONSOLE_RUNNER", "WB_CONSOLE_SCRIPT",
            "WB_CONSOLE_PAYLOAD", "WB_CONSOLE_REQUIRE_VISIBLE", "WB_CONSOLE_READY")
    title = f"{metadata.get('label') or metadata['identity']} [{metadata['identity']}]"
    urls = metadata.get("urls") or {}
    if urls.get("service origin"):
        title += " - " + urls["service origin"]
    launch_environment = dict(environment)
    launch_environment.update({
        "WB_CONSOLE_BANNER": launch_banner(command, cwd, **metadata),
        "WB_CONSOLE_TITLE": redact_text(title),
        "WB_CONSOLE_PYTHON": sys.executable,
        "WB_CONSOLE_RUNNER": str(runner),
        "WB_CONSOLE_SCRIPT": f'"{script}"',
        "WB_CONSOLE_REQUIRE_VISIBLE": "1",
        "WB_CONSOLE_READY": "0",
        "WB_CONSOLE_PAYLOAD": json.dumps({
            "argv": [resolved, *command[1:]],
            "restoreEnvironment": {key: environment.get(key) for key in keys},
        }),
    })
    # Expand the quoted path once in CMD, without list2cmdline escaping its quotes.
    return [shell, "/d", "/q", "/v:off", "/s", "/c", "%WB_CONSOLE_SCRIPT%"], launch_environment


def read_service_metadata(directory: Path, service_id: str) -> dict:
    for path in sorted(directory.glob("*.managed_service.*")):
        if path.suffix not in {".json", ".metta"}:
            continue
        try:
            if path.suffix == ".json":
                value = json.loads(path.read_text(encoding="utf-8"))
            else:
                from metta_resource_codec import metta_document_to_json
                value = metta_document_to_json(path.read_text(encoding="utf-8"))
        except (OSError, ValueError) as error:
            print(f"[launch] Cannot read service metadata {redact_text(path)}: {redact_text(error)}",
                  file=sys.stderr, flush=True)
            continue
        if isinstance(value, dict) and value.get("id") == service_id:
            return value
    return {}


def configured_urls(metadata: Mapping, command: Sequence[str] = (), environment: Mapping[str, str] | None = None) -> dict[str, str]:
    urls = {
        key: str(metadata[key]) for key in
        ("uiUrl", "apiUrl", "healthUrl", "configPage", "adminApiPath", "modelBaseUrl", "url")
        if metadata.get(key)
    }
    for section in ("servicesEndpoint", "mailboxEndpoint", "plugin-api"):
        value = metadata.get(section)
        if isinstance(value, str):
            urls[section] = value
        elif isinstance(value, Mapping):
            for key in ("url", "baseUrl", "path", "endpoint", "healthUrl", "healthPath"):
                if isinstance(value.get(key), str) and value[key]:
                    urls[f"{section} {key}"] = value[key]
    env = environment or {}
    is_web = metadata.get("id") == "workbench-web" or any(
        Path(argument.replace("\\", "/")).name == "run_vite_server.bat" for argument in command
    )
    host = (env.get("WORKBENCH_WEB_HOST") if is_web else None) or str(metadata.get("host") or "127.0.0.1")
    port = (env.get("WORKBENCH_WEB_PORT") if is_web else None) or metadata.get("port")
    for index, argument in enumerate(command[:-1]):
        if argument == "--host":
            host = command[index + 1]
        elif argument == "--port":
            port = command[index + 1]
        elif argument == "--api":
            urls["control API"] = command[index + 1]
        elif Path(argument.replace("\\", "/")).name in {"run_api_server.bat", "run_vite_server.bat"}:
            host = command[index + 1]
            if index + 2 < len(command):
                port = command[index + 2]
        elif Path(argument.replace("\\", "/")).name in {"run_clawrouter.bat", "run_omniroute.bat"}:
            port = command[index + 1]
    try:
        if port and 0 < int(port) <= 65535:
            origin = f"http://{host}:{int(port)}"
            urls.setdefault("service origin", origin)
            if metadata.get("healthPath"):
                urls.setdefault("health", origin + "/" + str(metadata["healthPath"]).lstrip("/"))
    except (TypeError, ValueError):
        pass  # An invalid/unresolved port is not an endpoint to advertise.
    if is_web and env.get("WORKBENCH_API_TARGET"):
        urls["API target"] = env["WORKBENCH_API_TARGET"]
    return urls


def configured_logs(metadata: Mapping) -> dict[str, str]:
    logs = {}
    for key in ("logPath", "logFile", "stdoutLog", "stderrLog", "serverEventLog"):
        value = metadata.get(key)
        if isinstance(value, str) and value:
            logs[key] = value
        elif isinstance(value, Mapping) and isinstance(value.get("path"), str):
            logs[key] = value["path"]
    return logs
