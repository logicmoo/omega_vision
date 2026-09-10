"""Exercise real CMD parsing with inert native executables, never real services."""

from __future__ import annotations

import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import uuid

import pytest


ROOT = Path(__file__).resolve().parents[2]
LAUNCHERS = (
    "run_workbench.bat",
    "python/arc_cli_debugger/cli/interactive_runner.bat",
    "python/arc_cli_debugger/webui/run_webui.bat",
    "python/workbench_api_server/scripts/run_api_server.bat",
    "python/workbench_api_server/scripts/run_channel_relay.bat",
    "python/workbench_api_server/scripts/run_clawrouter.bat",
    "python/workbench_api_server/scripts/run_demo.bat",
    "python/workbench_api_server/scripts/run_meet_bridge.bat",
    "python/workbench_api_server/scripts/run_omniroute.bat",
    "python/workbench_api_server/scripts/run_vite_server.bat",
    "scripts/build_api_docs.bat",
    "scripts/codex_commit.cmd",
    "scripts/install_vb_cable.bat",
    "scripts/setup_windows.bat",
)
HELPER = "scripts/windows_launcher_diagnostics.ps1"

# Native .exe stubs preserve CMD's return/quoting behavior, unlike .cmd files
# impersonating python.exe (which would require CALL to return to the launcher).
STUB_SOURCE = r"""
using System;
using System.IO;
using System.Diagnostics;
using System.Linq;
using System.Web.Script.Serialization;
public class Stub {
    static string Env(string name) { return Environment.GetEnvironmentVariable(name) ?? ""; }
    static int Code(string name, int fallback) {
        int value;
        return int.TryParse(Env(name), out value) ? value : fallback;
    }
    static string Quote(string arg) {
        return "\"" + System.Text.RegularExpressions.Regex.Replace(
            arg, @"(\\*)(""|$)", m => m.Groups[1].Value + m.Groups[1].Value +
            (m.Groups[2].Value == "\"" ? "\\\"" : "")) + "\"";
    }
    public static int Main(string[] args) {
        string exe = Process.GetCurrentProcess().MainModule.FileName;
        string name = Path.GetFileNameWithoutExtension(exe).ToLowerInvariant();
        if (name == "powershell") {
            if (args.Contains("-File")) {
                var info = new ProcessStartInfo(Env("REAL_POWERSHELL"),
                    String.Join(" ", args.Select(Quote))) { UseShellExecute = false };
                using (var process = Process.Start(info)) {
                    process.WaitForExit();
                    return process.ExitCode;
                }
            }
            // All health checks/downloads are inert and unsuccessful.
            return 1;
        }
        var record = new {
            exe = exe, args = args, cwd = Environment.CurrentDirectory,
            detail = Env("WB_DIAG_DETAIL"),
            caller = Env("ARC3_CALLER_CWD"),
            webHost = Env("WORKBENCH_WEB_HOST"),
            webPort = Env("WORKBENCH_WEB_PORT"),
            apiTarget = Env("WORKBENCH_API_TARGET"),
            setupSecret = Env("SETUP_SECRET")
        };
        File.AppendAllText(Env("STUB_LOG"), new JavaScriptSerializer().Serialize(record) + "\n");
        Console.WriteLine("STUB_" + name.ToUpperInvariant());
        if (name == "git") {
            if (args.Contains("--quiet")) return 1;
            return 0;
        }
        if (args.Contains("-c")) {
            if (args.Any(a => a == "import json_repair")) return Code("STUB_REPAIR", 0);
            if (args.Any(a => a.Contains("import fastapi"))) return Code("STUB_DEMO_IMPORT", 0);
            if (args.Contains("-3.12")) return Code("STUB_PY312", 0);
            if (args.Contains("-3")) return Code("STUB_PY3", 0);
            return 0;
        }
        int module = Array.IndexOf(args, "-m");
        if (module >= 0 && args[module + 1] == "venv") {
            string destination = Path.GetFullPath(args[module + 2]);
            string root = Path.GetFullPath(Env("STUB_ROOT")) + Path.DirectorySeparatorChar;
            if (!destination.StartsWith(root, StringComparison.OrdinalIgnoreCase)) return 99;
            Directory.CreateDirectory(Path.Combine(destination, "Scripts"));
            File.Copy(exe, Path.Combine(destination, "Scripts", "python.exe"), true);
            return 0;
        }
        if (module >= 0 && args[module + 1] == "pip") return Code("STUB_PIP_EXIT", 0);
        if (args.Contains("--version")) return 0;
        return Code("STUB_EXIT", 0);
    }
}
"""


def test_all_tracked_launchers_have_early_safe_diagnostics():
    tracked = subprocess.run(
        ["git", "ls-files", "*.bat", "*.cmd"], cwd=ROOT,
        capture_output=True, text=True, check=True,
    ).stdout.splitlines()
    assert set(tracked) == set(LAUNCHERS)
    for relative in LAUNCHERS:
        text = (ROOT / relative).read_text(encoding="utf-8")
        command = (
            'echo [launcher] command: "%ComSpec%" /d /c "%~f0" '
            '[forwarded arguments: REDACTED]'
        )
        banner = text.index(command)
        echoes = [line.strip() for line in text.splitlines()
                  if line.lstrip().lower().startswith("echo")]
        assert echoes[0] == command
        assert 'set "WB_DIAG_BOOTSTRAP_SCRIPT=%~f0"' in text
        assert 'set "WB_DIAG_BOOTSTRAP_PURPOSE=' in text
        bootstrap = text.index(' -Bootstrap')
        assert banner < text.index("\ntitle ") < bootstrap
        assert 'set "WB_DIAG_TITLE=' in text
        assert 'set "WB_DIAG_TITLE_PORTS=' in text
        if "setkeys.bat" in text:
            assert bootstrap < text.index('if exist "C:\\snet\\setkeys.bat"')
            assert 'call "C:\\snet\\setkeys.bat" >nul 2>nul\n@echo off' in text
        assert "EnableDelayedExpansion" not in text
        assert not any("%*" in line for line in text.splitlines() if line.lstrip().startswith("echo"))
        if relative not in ("scripts/codex_commit.cmd", "scripts/install_vb_cable.bat"):
            assert "windows_launcher_diagnostics.ps1" in text
        else:
            assert "[launcher] Handoff:" in text
    vite = (ROOT / LAUNCHERS[9]).read_text(encoding="utf-8")
    assert not any(line.lower().startswith("setlocal") for line in vite.splitlines())


def test_diagnostics_use_only_the_attached_console_and_headless_fallbacks():
    helper = (ROOT / HELPER).read_text(encoding="utf-8")
    assert "param([switch] $Bootstrap)" in helper
    assert "[Console]::IsOutputRedirected" in helper
    assert "'CONOUT$', 0x40000000, 3, [IntPtr]::Zero, 3, 0" in helper
    assert "WriteConsoleW" in helper
    assert "CloseHandle" in helper
    assert "[Console]::Out.WriteLine($safe)" in helper
    assert "[Console]::Error.WriteLine($safe)" in helper
    assert "Write-Diagnostic $command -AlreadyLogged" in helper
    assert helper.index("Write-Diagnostic $command -AlreadyLogged") < helper.index(
        "Write-Diagnostic ('[launcher] Purpose:"
    )
    for prohibited in (
        "AllocConsole", "AttachConsole", "FreeConsole", "ShowWindow",
        "Start-Process", "Add-Type", "Process.Start", "-WindowStyle",
    ):
        assert prohibited not in helper


def test_service_titles_update_with_validated_ports_not_raw_arguments():
    expected = {
        "run_workbench.bat": "KILL_WEB_PORT;KILL_API_PORT",
        "python/workbench_api_server/scripts/run_demo.bat": "WEB_PORT;API_PORT",
        "python/workbench_api_server/scripts/run_api_server.bat": "API_PORT",
        "python/workbench_api_server/scripts/run_vite_server.bat": "WEB_PORT",
        "python/workbench_api_server/scripts/run_clawrouter.bat": "CLAWROUTER_PORT",
        "python/workbench_api_server/scripts/run_omniroute.bat": "OMNIROUTE_PORT",
    }
    for relative, ports in expected.items():
        source = (ROOT / relative).read_text(encoding="utf-8")
        assert f'set "WB_DIAG_TITLE_PORTS={ports}"' in source
        for line in source.splitlines():
            if line.lower().startswith("title "):
                assert "%" not in line
    helper = (ROOT / HELPER).read_text(encoding="utf-8")
    assert "[Console]::Title = $title" in helper
    assert "$value -match '^[0-9]{1,5}$'" in helper
    assert "[int]$value -le 65535" in helper


def test_demo_and_vite_never_echo_dynamic_urls_or_port_values_raw():
    for name in ("run_demo", "run_vite_server"):
        source = ROOT / f"python/workbench_api_server/scripts/{name}.bat"
        echoes = "\n".join(
            line for line in source.read_text(encoding="utf-8").splitlines()
            if line.lstrip().lower().startswith("echo")
        )
        assert not re.search(r"%(?:\w*URL\w*|\w*TARGET|\w*PORT|PORT_VALUE)%", echoes)


def test_api_describe_mode_bypasses_credentials_and_bootstrap():
    source = (ROOT / "python/workbench_api_server/scripts/run_api_server.bat").read_text(
        encoding="utf-8"
    )
    branch = source.index('if /I "%~1"=="/describe" goto :describe')
    assert branch < source.index(" -Bootstrap")
    assert branch < source.index('if exist "C:\\snet\\setkeys.bat"')
    describe = source.split("\n:describe\n", 1)[1]
    assert 'echo [launcher] command: "%PYTHON_EXE%" "%~dp0run_api_server.py" --help' in describe
    assert "title MeTTa Workbench API - Describe Only" in describe
    assert '"%PYTHON_EXE%" "%~dp0run_api_server.py" --help\nexit /b %ERRORLEVEL%' in describe
    for forbidden in ("setkeys", " -Bootstrap", "--host", "--port", "%*", "pip install", "start "):
        assert forbidden not in describe


def test_api_describe_executes_help_only_and_preserves_exit(sandbox):
    _, caller, run = sandbox
    result, records = run(
        "python/workbench_api_server/scripts/run_api_server.bat",
        "/describe --host ignored --port 9999", STUB_EXIT="19",
    )
    assert result.returncode == 19, result.stdout + result.stderr
    assert len(records) == 1
    assert Path(records[0]["args"][0]).name == "run_api_server.py"
    assert records[0]["args"][1:] == ["--help"]
    assert records[0]["cwd"] == str(caller)
    assert records[0]["setupSecret"] == ""
    assert result.stdout.splitlines()[0].endswith('" --help')
    assert result.stdout.index("--help") < result.stdout.index("STUB_PYTHON")
    assert "ignored" not in result.stdout


def test_api_describe_missing_python_does_not_bootstrap(sandbox):
    directory, _, run = sandbox
    (directory / ".venv/Scripts/python.exe").unlink()
    result, records = run("python/workbench_api_server/scripts/run_api_server.bat", "/describe")
    assert result.returncode == 2, result.stdout + result.stderr
    assert not records
    assert "will not create an environment" in result.stdout


@pytest.fixture(scope="module")
def native_stub():
    if os.name != "nt":
        pytest.skip("Actual Windows CMD execution requires Windows")
    compiler = Path(os.environ["WINDIR"]) / "Microsoft.NET/Framework64/v4.0.30319/csc.exe"
    if not compiler.is_file():
        pytest.skip("Windows inbox .NET Framework compiler is unavailable")
    directory = ROOT / (".launcher-test-compiler-" + uuid.uuid4().hex)
    directory.mkdir()
    try:
        source = directory / "Stub.cs"
        source.write_text(STUB_SOURCE, encoding="utf-8")
        executable = directory / "stub.exe"
        result = subprocess.run(
            [str(compiler), "/nologo", "/target:exe", f"/out:{executable}",
             "/reference:System.Web.Extensions.dll", str(source)],
            cwd=directory, capture_output=True, text=True, timeout=60,
            env={**os.environ, "TEMP": str(directory), "TMP": str(directory)},
        )
        assert result.returncode == 0, result.stdout + result.stderr
        yield executable
    finally:
        shutil.rmtree(directory)


@pytest.fixture
def sandbox(native_stub):
    directory = ROOT / (".launcher-test space & (group)!-" + uuid.uuid4().hex)
    directory.mkdir()
    try:
        for relative in (*LAUNCHERS, HELPER):
            target = directory / relative
            target.parent.mkdir(parents=True, exist_ok=True)
            text = (ROOT / relative).read_text(encoding="utf-8")
            # Replace the literal reference in a COPY. Never inspect/invoke setkeys.
            text = text.replace(r"C:\snet\setkeys.bat", str(directory / "secret-setup.bat"))
            target.write_text(text, encoding="utf-8")
        (directory / "secret-setup.bat").write_text(
            "@echo off\nset SETUP_SECRET=never-show-this-secret\n"
            "echo never-show-this-secret\n@echo on\n", encoding="utf-8",
        )
        binary_paths = (
            "bin/python.exe", "bin/py.exe", "bin/powershell.exe", "bin/git.exe",
            ".venv/Scripts/python.exe",
            "python/arc_cli_debugger/venv/Scripts/python.exe",
            "relay space & (mail)!/.venv/Scripts/python.exe",
        )
        for relative in binary_paths:
            target = directory / relative
            target.parent.mkdir(parents=True, exist_ok=True)
            shutil.copyfile(native_stub, target)
        activate = directory / "python/arc_cli_debugger/venv/Scripts/activate.bat"
        activate.write_text(
            '@echo off\nset "PATH=%~dp0;%PATH%"\n', encoding="utf-8",
        )
        for relative in (
            "bin/npm.cmd", "bin/npx.cmd", "npm/omniroute.cmd",
            "frontend/apps/workbench/node_modules/.bin/vite.cmd",
            "vendor/ARC-AGI-3-Agents/.git/fixture",
            ".codex-commit-message.txt",
        ):
            target = directory / relative
            target.parent.mkdir(parents=True, exist_ok=True)
            target.write_text("@echo off\nexit /b 0\n", encoding="utf-8")
        caller = directory / "caller space & (workspace)!"
        caller.mkdir()
        windows = Path(os.environ["WINDIR"])
        environment = {
            "SystemRoot": str(windows), "WINDIR": str(windows),
            "ComSpec": str(windows / "System32/cmd.exe"),
            "PATH": str(directory / "bin") + ";" + str(windows / "System32"),
            "PATHEXT": ".COM;.EXE;.BAT;.CMD",
            "REAL_POWERSHELL": str(windows / "System32/WindowsPowerShell/v1.0/powershell.exe"),
            "STUB_LOG": str(directory / "calls.jsonl"),
            "STUB_ROOT": str(directory),
            "APPDATA": str(directory), "USERPROFILE": str(directory),
            "TEMP": str(directory), "TMP": str(directory),
        }

        def run(relative, arguments="", **overrides):
            log = directory / "calls.jsonl"
            log.write_text("", encoding="utf-8")
            result = subprocess.run(
                f'"{environment["ComSpec"]}" /d /v:off /s /c '
                f'""{directory / relative}" {arguments}"',
                cwd=caller, env={**environment, **overrides},
                input="\n", capture_output=True, text=True, timeout=90,
            )
            records = [json.loads(line) for line in log.read_text().splitlines()]
            return result, records

        yield directory, caller, run
    finally:
        shutil.rmtree(directory)


@pytest.mark.parametrize("relative", LAUNCHERS)
def test_every_launcher_executes_only_stubs_with_visible_banner(sandbox, relative):
    directory, caller, run = sandbox
    args = f'"{directory / "relay space & (mail)!"}"' if "run_channel_relay" in relative else ""
    result, records = run(relative, args)
    output = result.stdout + result.stderr
    assert "[launcher]" in output, output
    first = result.stdout.splitlines()[0]
    assert first.startswith('[launcher] command: "'), output
    assert "\\cmd.exe\" /d /c \"" in first.casefold(), output
    assert str(directory / relative) in first
    assert first.endswith("[forwarded arguments: REDACTED]")
    assert result.stdout.index("[launcher] command:") < result.stdout.index("[launcher] Purpose:")
    assert result.stdout.index("[launcher] Purpose:") < result.stdout.index("[launcher] CWD:")
    assert str(directory / relative) in output
    assert str(caller) in output
    assert "never-show-this-secret" not in output
    assert "was unexpected" not in output
    assert "diagnostic unavailable" not in output
    assert "is not recognized" not in output
    assert result.returncode == (1 if "install_vb_cable" in relative else 0), output
    if relative not in ("scripts/install_vb_cable.bat", "scripts/codex_commit.cmd"):
        assert records, output
        assert "[launcher] execute:" in output
        for record in records:
            if Path(record["exe"]).stem in ("python", "py"):
                assert record["exe"].casefold() in output.casefold(), output
        if "STUB_" in output:
            assert output.index("[launcher] execute:") < output.index("STUB_")
        assert all(record["detail"] or "build_api_docs" in relative for record in records if
                   Path(record["exe"]).name == "python.exe" and
                   not any("slim_framework" in arg for arg in record["args"]))


@pytest.mark.parametrize("relative", [
    "python/arc_cli_debugger/cli/interactive_runner.bat",
    "python/arc_cli_debugger/webui/run_webui.bat",
    "python/workbench_api_server/scripts/run_meet_bridge.bat",
])
def test_forwarded_arguments_are_opaque_but_unchanged_once(sandbox, relative):
    _, caller, run = sandbox
    result, records = run(
        relative, '--token "opaque-secret & (value)!" --label "space & (value)! ^|<>"',
        STUB_EXIT="37",
    )
    output = result.stdout + result.stderr
    assert result.returncode == 37, output
    assert "opaque-secret" not in output
    assert "forwarded arguments: [REDACTED]" in output
    forwarded = [record for record in records if "--token" in record["args"]]
    assert len(forwarded) == 1
    assert forwarded[0]["args"][-4:] == [
        "--token", "opaque-secret & (value)!", "--label", "space & (value)! ^|<>",
    ]
    if "interactive_runner" in relative:
        assert forwarded[0]["cwd"] == str(caller)
        assert forwarded[0]["caller"] == str(caller)


def test_repair_failure_uses_fresh_errorlevel_and_never_runs_debugger(sandbox):
    _, _, run = sandbox
    result, records = run(
        "python/arc_cli_debugger/cli/interactive_runner.bat",
        STUB_REPAIR="1", STUB_PIP_EXIT="43",
    )
    output = result.stdout + result.stderr
    assert result.returncode == 1, output
    assert "Unable to update" in output
    assert any(record["args"][:3] == ["-m", "pip", "install"] for record in records)
    assert not any("interactive_runner.py" in " ".join(record["args"]) for record in records)
    assert output.index("-m pip install -e .") < output.index("STUB_PYTHON")
    assert "stdout/stderr: NUL" in output


def test_root_stop_handoff_preserves_nonzero_exit(sandbox):
    _, _, run = sandbox
    result, records = run("run_workbench.bat", "/kill 5511 8811", STUB_EXIT="31")
    assert result.returncode == 31
    assert len(records) == 1
    assert records[0]["args"][-4:] == ["--web-port", "5511", "--api-port", "8811"]
    assert "stop_workbench.py" in result.stdout
    assert result.stdout.index("[launcher] execute:") < result.stdout.index("STUB_PYTHON")


def test_secret_setup_failure_is_visible_without_revealing_its_output(sandbox):
    directory, _, run = sandbox
    (directory / "secret-setup.bat").write_text(
        "@echo off\necho never-show-this-secret\nexit /b 9\n", encoding="utf-8",
    )
    result, records = run("run_workbench.bat", "/kill 5511 8811", STUB_EXIT="31")
    assert result.returncode == 31
    assert len(records) == 1
    assert "credential setup returned an error" in result.stdout
    assert "never-show-this-secret" not in result.stdout + result.stderr


def test_root_stop_preserves_exclamations_and_metacharacters_in_arguments(sandbox):
    directory, _, run = sandbox
    result, records = run(
        "run_workbench.bat", '/kill "5511! & (web)" "8811! ^|<>"', STUB_EXIT="23",
    )
    assert result.returncode == 23, result.stdout + result.stderr
    assert len(records) == 1
    assert records[0]["args"][-4:] == [
        "--web-port", "5511! & (web)", "--api-port", "8811! ^|<>",
    ]
    assert str(directory / ".venv/Scripts/python.exe") in result.stdout
    assert "KILL_WEB_PORT=5511! & (web)" in result.stdout
    assert "KILL_API_PORT=8811! ^|<>" in result.stdout


def test_root_child_handoff_preserves_exclamation_in_host(sandbox):
    directory, _, run = sandbox
    result, records = run("run_workbench.bat", "host!label 5517 8817")
    assert result.returncode == 0, result.stdout + result.stderr
    api = next(record for record in records if "workbench-api" in record["args"])
    web = next(record for record in records if "workbench-web" in record["args"])
    assert api["args"][-2:] == ["host!label", "8817"]
    assert web["args"][-3:] == ["host!label", "5517", "http://host!label:8817"]
    assert result.stdout.count("BIND_IP=host!label") == 2
    assert f'Handoff: {directory / "python/workbench_api_server/scripts/run_demo.bat"}' in result.stdout


def test_invalid_port_diagnostic_does_not_reveal_supplied_secrets(sandbox):
    _, _, run = sandbox
    result, records = run(
        "run_workbench.bat", '127.0.0.1 "token=port-secret" 8817',
    )
    assert result.returncode == 2, result.stdout + result.stderr
    assert not records
    assert "Invalid web port" in result.stdout
    assert "port-secret" not in result.stdout + result.stderr


@pytest.mark.parametrize("name", ["run_api_server", "run_clawrouter", "run_omniroute", "run_channel_relay"])
def test_managed_wrappers_preserve_nonzero_exit(sandbox, name):
    _, _, run = sandbox
    result, records = run(f"python/workbench_api_server/scripts/{name}.bat", STUB_EXIT="35")
    assert result.returncode == 35, result.stdout + result.stderr
    assert len(records) == 1
    assert result.stdout.index("[launcher] execute:") < result.stdout.index("STUB_PYTHON")


def test_vite_redacts_urls_preserves_environment_and_exit(sandbox):
    directory, _, run = sandbox
    url = "https://user:password@example.invalid:8443/api?token=secret-query&mode=dev"
    result, records = run(
        "python/workbench_api_server/scripts/run_vite_server.bat",
        f'127.0.0.1 5517 "{url}"', STUB_EXIT="29",
    )
    assert result.returncode == 29, result.stdout + result.stderr
    assert len(records) == 1
    assert records[0]["apiTarget"] == url
    assert url in records[0]["args"]
    assert "password" not in result.stdout
    assert "secret-query" not in result.stdout
    assert "example.invalid:8443/api?[REDACTED]" in result.stdout
    assert "--service workbench-web" in result.stdout
    assert "npm.cmd run dev" in result.stdout
    assert str(directory / ".venv/Scripts/python.exe") in result.stdout


@pytest.mark.parametrize("selector,overrides", [
    ("-3.12", {}),
    ("-3", {"STUB_PY312": "1"}),
    ("", {"STUB_PY312": "1", "STUB_PY3": "1"}),
])
def test_setup_python_selection_and_hidden_probes(sandbox, selector, overrides):
    directory, _, run = sandbox
    result, records = run("scripts/setup_windows.bat", **overrides)
    assert result.returncode == 0, result.stdout + result.stderr
    version = next(record for record in records if "--version" in record["args"])
    assert version["args"] == ([selector] if selector else []) + ["--version"]
    assert "stdout/stderr: NUL" in result.stdout
    expected = directory / ("bin/py.exe" if selector else "bin/python.exe")
    assert str(expected).casefold() in result.stdout.casefold()
    assert result.stdout.index("--version") < result.stdout.index("STUB_")


def test_demo_shows_environment_creation_before_stub_execution(sandbox):
    directory, _, run = sandbox
    (directory / ".venv/Scripts/python.exe").unlink()
    result, records = run("python/workbench_api_server/scripts/run_demo.bat")
    assert result.returncode == 0, result.stdout + result.stderr
    assert records[0]["args"][:2] == ["-m", "venv"]
    assert result.stdout.index("-m venv") < result.stdout.index("STUB_PYTHON")
    assert "-c import fastapi, pydantic, uvicorn" in result.stdout


def test_demo_dependency_failure_is_visible_and_stops_bootstrap(sandbox):
    _, _, run = sandbox
    result, records = run(
        "python/workbench_api_server/scripts/run_demo.bat",
        STUB_DEMO_IMPORT="1", STUB_PIP_EXIT="41",
    )
    assert result.returncode == 1, result.stdout + result.stderr
    assert len(records) == 2
    assert records[-1]["args"][:3] == ["-m", "pip", "install"]
    assert "--disable-pip-version-check -q -e" in result.stdout
    assert result.stdout.index("-m pip install") < result.stdout.index("STUB_PYTHON")


def test_cmd_current_directory_python_resolution_precedes_path(sandbox):
    directory, _, run = sandbox
    (directory / ".venv/Scripts/python.exe").unlink()
    shutil.copyfile(directory / "bin/python.exe", directory / "python.exe")
    result, records = run("scripts/build_api_docs.bat", STUB_EXIT="17")
    assert result.returncode == 17, result.stdout + result.stderr
    assert records[0]["exe"] == str(directory / "python.exe")
    assert f'execute: "{directory / "python.exe"}"'.casefold() in result.stdout.casefold()


def test_vite_keeps_restart_environment_in_calling_cmd(sandbox):
    directory, _, run = sandbox
    harness = directory / "vite-caller.cmd"
    harness.write_text(
        '@echo off\n'
        'call "%~dp0python\\workbench_api_server\\scripts\\run_vite_server.bat" '
        '127.0.0.1 5523 http://localhost:8123\n'
        'set "RESULT=%ERRORLEVEL%"\n'
        'echo RETAINED_HOST=%WORKBENCH_WEB_HOST%\n'
        'echo RETAINED_PORT=%WORKBENCH_WEB_PORT%\n'
        'if not "%WORKBENCH_API_TARGET%"=="http://localhost:8123" exit /b 99\n'
        'exit /b %RESULT%\n', encoding="utf-8",
    )
    result, _ = run("vite-caller.cmd", STUB_EXIT="27")
    assert result.returncode == 27, result.stdout + result.stderr
    assert "RETAINED_HOST=127.0.0.1" in result.stdout
    assert "RETAINED_PORT=5523" in result.stdout
