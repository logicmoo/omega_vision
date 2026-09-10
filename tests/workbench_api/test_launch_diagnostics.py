from __future__ import annotations

import base64
import importlib.util
import io
import json
import os
import subprocess
import sys
from pathlib import Path
from types import SimpleNamespace

import pytest
from starlette.requests import Request

import launch_diagnostics as diagnostics
import service_monitor_api as monitor

ROOT = Path(__file__).resolve().parents[2]


def load_script(name):
    path = ROOT / "python" / "workbench_api_server" / "scripts" / name
    spec = importlib.util.spec_from_file_location("diagnostics_" + path.stem, path)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def test_command_redaction_preserves_original_arguments_and_public_url_fields(tmp_path):
    command = [
        sys.executable, "path with spaces/worker.py", "--api-key", "secret-one",
        "--password=secret-two", "--header", "Authorization: Bearer secret-three",
        "--endpoint", "https://alice:secret-four@host.test/run?token=secret-five&view=ready",
        "--header", "Cookie: theme=dark; session=secret-six",
    ]
    before = list(command)
    text = diagnostics.launch_banner(command, tmp_path, identity="worker",
                                     description="Configured task worker.", logs={"stderr": str(tmp_path / "worker.log")})
    assert command == before
    assert all(secret not in text for secret in ("secret-one", "secret-two", "secret-three", "secret-four", "secret-five", "secret-six", "alice"))
    assert "view=ready" in text
    assert "worker.py" in text and "worker.log" in text and "[REDACTED]" in text
    assert str(Path(sys.executable).resolve()) in text


def test_console_wrapper_announces_in_child_stderr_before_running_once_and_preserves_exit(tmp_path):
    directory = tmp_path / "directory with spaces & symbols!"
    directory.mkdir()
    target = directory / "safe child.py"
    target.write_text(
        "import json,sys\nsys.stderr.write('CHILD_STARTED\\n');sys.stderr.flush()\n"
        "print(json.dumps(sys.argv[1:]))\nraise SystemExit(37)\n",
        encoding="utf-8",
    )
    arguments = ["value with spaces", "a&b", "bang!", "%literal%", "--token", "sensitive-value"]
    command = diagnostics.console_command([sys.executable, str(target), *arguments], directory,
                                         identity="pool-worker", description="Run one task.")
    command.remove("--console")  # This inert test captures streams; it creates no visible window.
    result = subprocess.run(command, cwd=directory, text=True, capture_output=True, timeout=20)
    assert result.returncode == 37
    assert json.loads(result.stdout) == arguments
    assert result.stderr.index("[launch] pool-worker") < result.stderr.index("CHILD_STARTED")
    assert result.stderr.count("CHILD_STARTED") == 1
    assert "sensitive-value" not in result.stderr
    assert str(directory) in result.stderr


def test_missing_console_executable_fails_before_a_wrapper_can_be_spawned(tmp_path):
    with pytest.raises(FileNotFoundError):
        diagnostics.console_command([str(tmp_path / "absent.exe")], tmp_path, identity="missing")


def test_configured_metadata_urls_follow_real_command_ports_not_defaults():
    value = diagnostics.configured_urls(
        {"port": 8000, "healthPath": "/ready", "uiUrl": "https://configured.test/panel"},
        ["cmd.exe", "/d", "/c", r"python\workbench_api_server\scripts\run_api_server.bat", "127.0.0.2", "8111"],
    )
    assert value["health"] == "http://127.0.0.2:8111/ready"
    assert value["uiUrl"] == "https://configured.test/panel"
    assert diagnostics.configured_urls({}) == {}
    router = diagnostics.configured_urls(
        {"id": "clawrouter", "port": 3456, "healthPath": "/health"},
        ["cmd.exe", "/c", r"scripts\run_clawrouter.bat", "3460"],
        {"WORKBENCH_WEB_PORT": "5173", "WORKBENCH_API_TARGET": "http://unrelated.test"},
    )
    assert router == {"service origin": "http://127.0.0.1:3460", "health": "http://127.0.0.1:3460/health"}


@pytest.mark.parametrize("hidden", [False, True])
@pytest.mark.parametrize("service_id", ["plugin", "workbench-api", "workbench-web"])
def test_policy_launch_announces_before_spawn_and_keeps_windows_launches_visible(tmp_path, monkeypatch, capsys, hidden, service_id):
    starter = load_script("start_with_policy.py")
    monkeypatch.setattr(starter, "ROOT", tmp_path)
    monkeypatch.setattr(starter, "policy_for", lambda _: {"start": True, "hiddenWindow": hidden})
    monkeypatch.setattr(starter, "read_service_metadata", lambda *_: {
        "label": "Actual plugin", "description": "Declared purpose.", "port": 1234, "healthPath": "/health",
    })
    recorded = []
    monkeypatch.setattr(starter, "_record_started_process", lambda *args, **kwargs: recorded.append(args))
    original = [sys.executable, "child.py", "--token", "private-value"]
    monkeypatch.setattr(sys, "argv", ["start_with_policy.py", "--service", service_id, "--cwd", str(tmp_path), "--", *original])
    def spawn(command, **kwargs):
        output = capsys.readouterr().err
        assert "Declared purpose" in output and "private-value" not in output
        assert "http://127.0.0.1:1234/health" in output
        if hidden and sys.platform != "win32":
            assert command == original
            assert "Declared purpose" in (tmp_path / "runtime" / "logs" / f"{service_id}.stderr.log").read_text()
        elif sys.platform == "win32":
            assert Path(command[0]).name.lower() == "cmd.exe"
            assert command[-1] == "%WB_CONSOLE_SCRIPT%"
            assert kwargs["creationflags"] & subprocess.CREATE_NEW_CONSOLE
            assert not kwargs["creationflags"] & subprocess.CREATE_NO_WINDOW
            assert json.loads(kwargs["env"]["WB_CONSOLE_PAYLOAD"])["argv"] == original
            assert "Declared purpose" in kwargs["env"]["WB_CONSOLE_BANNER"]
            assert kwargs["stdout"] is None and kwargs["stderr"] is None
            assert not (tmp_path / "runtime" / "logs").exists()
        return SimpleNamespace(pid=71)
    monkeypatch.setattr(starter.subprocess, "Popen", spawn)
    assert starter.main() == 0
    assert recorded[0][2] == original


def test_disabled_plugin_is_not_started_to_show_a_console(tmp_path, monkeypatch):
    starter = load_script("start_with_policy.py")
    monkeypatch.setattr(starter, "policy_for", lambda _: {"start": False, "hiddenWindow": True})
    monkeypatch.setattr(starter, "read_service_metadata", lambda *_: {})
    monkeypatch.setattr(sys, "argv", ["start_with_policy.py", "--service", "plugin", "--", sys.executable])
    monkeypatch.setattr(starter.subprocess, "Popen", lambda *_args, **_kwargs: pytest.fail("Disabled plugin must not start"))
    assert starter.main() == 3


def test_managed_start_announces_in_a_visible_console_even_with_log_redirection(tmp_path, monkeypatch, capsys):
    definition = monitor.ServiceDefinition(
        "plugin", "Actual plugin", "Declared plugin purpose", 9988, "/ready",
        launcher=tmp_path / "plugin.cmd", working_directory=tmp_path,
    )
    monkeypatch.setattr(monitor, "_port_open", lambda _: False)
    monkeypatch.setattr(monitor, "_read_managed_service_resources", lambda: {})
    monkeypatch.setattr(monitor, "LOG_ROOT", tmp_path / "logs")
    monkeypatch.setattr(monitor, "get_filesystem_provider", lambda: SimpleNamespace(
        make_directory=lambda path: path.mkdir(parents=True, exist_ok=True),
        open_append_text=lambda path: path.open("a", encoding="utf-8"),
    ))
    calls = []
    def spawn(command, **kwargs):
        calls.append(command)
        assert "Declared plugin purpose" in capsys.readouterr().err
        assert kwargs["stdout"].name.endswith("plugin.stdout.log")
        assert kwargs["stderr"].name.endswith("plugin.stderr.log")
        if sys.platform == "win32":
            assert Path(command[0]).name.lower() == "cmd.exe"
            assert kwargs["creationflags"] & subprocess.CREATE_NEW_CONSOLE
            assert not kwargs["creationflags"] & subprocess.CREATE_NO_WINDOW
            banner = kwargs["env"]["WB_CONSOLE_BANNER"]
            assert "9988" in banner.splitlines()[0]
            assert "Actual plugin" in banner
            assert kwargs["env"]["WB_CONSOLE_REQUIRE_VISIBLE"] == "1"
            assert str(definition.launcher) in json.loads(kwargs["env"]["WB_CONSOLE_PAYLOAD"])["argv"]
        return SimpleNamespace(pid=71)
    monkeypatch.setattr(monitor.subprocess, "Popen", spawn)
    monitor._start(definition)
    assert len(calls) == 1


def test_visible_managed_launch_passes_real_metadata_into_console_before_spawn(tmp_path, monkeypatch, capsys):
    definition = monitor.ServiceDefinition("omniroute", "Configured router", "Real configured purpose", 9988, "/ready")
    monkeypatch.setattr(monitor, "_definitions", lambda _: (definition,))
    monkeypatch.setattr(monitor, "_read_managed_service_resources", lambda: {})
    monkeypatch.setattr(monitor, "_port_open", lambda _: False)
    monkeypatch.setattr(monitor, "_record_api_launch", lambda *args, **kwargs: None)
    monkeypatch.setattr(monitor, "_PENDING_LAUNCHES", {})
    request = Request({"type": "http", "client": ("127.0.0.1", 1), "server": ("127.0.0.1", 8000), "scheme": "http", "path": "/", "headers": []})
    original = [sys.executable, "omniroute-worker.py", "--port", "9989", "--api-key", "secret-value"]
    def spawn(command, **kwargs):
        assert "Real configured purpose" in capsys.readouterr().err
        assert kwargs["cwd"] == tmp_path
        if sys.platform == "win32":
            assert json.loads(kwargs["env"]["WB_CONSOLE_PAYLOAD"])["argv"] == original
            banner = kwargs["env"]["WB_CONSOLE_BANNER"]
            assert "9989/ready" in banner and "secret-value" not in banner
        return SimpleNamespace(pid=71)
    monkeypatch.setattr(monitor.subprocess, "Popen", spawn)
    result = monitor.launch_submitted_command("omniroute", request, {"cwd": str(tmp_path), "command": original})
    assert result["pid"] == 71 and result["rawCommand"] == diagnostics.redact_arguments(original)


def test_announce_flushes_and_never_writes_machine_protocol_stdout(tmp_path, capsys):
    diagnostics.announce_launch([], tmp_path, identity="plugin", description="In-process registration.")
    output = capsys.readouterr()
    assert not output.out
    assert "in-process; no child command" in output.err
    class Stream(io.StringIO):
        flushed = False
        def flush(self):
            self.flushed = True
    stream = Stream()
    diagnostics.announce_launch(["python", "worker.py"], tmp_path, identity="worker", stream=stream)
    assert stream.flushed and "worker.py" in stream.getvalue()


def test_plugin_owned_boundary_announces_declared_metadata_before_import(tmp_path, monkeypatch, capsys):
    import plugin_api
    root = tmp_path / "plugins"
    directory = root / "external-plugin"
    directory.mkdir(parents=True)
    manifest = {
        "id": "external-plugin", "label": "External plugin", "description": "Actual declared purpose.",
        "scan": "startup", "entrypoint": "plugin.py", "routePrefix": "/external",
        "configPage": "http://user:private-password@host.test/ui?token=private-token&mode=view",
        "serverEventLog": {"path": "configured-events.log"},
        "servicesEndpoint": {"path": "/external/endpoints"},
    }
    monkeypatch.setattr(plugin_api, "PLUGINS_ROOT", root)
    monkeypatch.setattr(plugin_api, "POLICY_PATH", root / "plugins.json")
    monkeypatch.setattr(plugin_api, "_policy", lambda: {"pluginsFound": {}})
    monkeypatch.setattr(plugin_api, "_read_json", lambda _: manifest)
    monkeypatch.setattr(plugin_api, "_discover_manifests", lambda _: [directory / "plugin.json"])
    monkeypatch.setattr(plugin_api, "_run_init_commands", lambda _: None)
    monkeypatch.setattr(plugin_api, "_loaded", set())
    seen = []
    def before_import(*args):
        text = capsys.readouterr().err
        assert "Actual declared purpose" in text and "configured-events.log" in text
        assert "/external/endpoints" in text and "mode=view" in text
        assert "private-password" not in text and "private-token" not in text
        assert "in-process; no child command" in text
        seen.append(True)
        return None
    monkeypatch.setattr(plugin_api.importlib.util, "spec_from_file_location", before_import)
    result = plugin_api._scan(register=True)
    assert seen == [True]
    assert result[0]["loaded"] is False


def test_process_receipt_does_not_persist_secret_command_arguments(tmp_path, monkeypatch):
    starter = load_script("start_with_policy.py")
    ledger = tmp_path / "processes.json"
    monkeypatch.setattr(starter, "PROCESS_LEDGER", ledger)
    command = [sys.executable, "worker.py", "--api-key", "private-argument"]
    starter._record_started_process("worker", SimpleNamespace(pid=71), command, tmp_path)
    assert "private-argument" not in ledger.read_text()
    receipt = json.loads(ledger.read_text())[0]
    assert receipt["parentPid"] and receipt["launcherPath"].endswith("start_with_policy.py")
    assert receipt["spawnCommand"] == diagnostics.redact_arguments(command)
    assert command[-1] == "private-argument"


def test_visible_console_uses_its_own_console_device_before_child_spawn(monkeypatch, capsys):
    if sys.platform != "win32":
        pytest.skip("Windows console device contract")
    runner = load_script("run_announced_command.py")
    writes = []
    class Console(io.StringIO):
        def close(self):
            writes.append(self.getvalue())
            super().close()
    def console_open(path, *args, **kwargs):
        assert path == "CONOUT$"
        return Console()
    monkeypatch.setattr("builtins.open", console_open)
    def spawn(command):
        assert writes == ["visible child banner\n"]
        assert not capsys.readouterr().out
        return SimpleNamespace(wait=lambda: 23)
    monkeypatch.setattr(runner.subprocess, "Popen", spawn)
    encoded = base64.b64encode(b"visible child banner\n").decode()
    assert runner.main(["--console", "--banner", encoded, "--", "safe-child"]) == 23


def test_project_shell_bootstrap_announces_before_python_and_does_not_parse_execution_argv(tmp_path):
    if sys.platform != "win32":
        pytest.skip("Windows shell bootstrap")
    original = [sys.executable, "space & bang!.py", "", "quote\"value", "%literal%", "--token", "private-value"]
    command, environment = diagnostics.prepare_console_launch(
        original, tmp_path, {"KEEP": "original", "WB_CONSOLE_TITLE": "prior"},
        identity="worker", label="Actual worker", description="Actual purpose",
        urls={"service origin": "http://127.0.0.1:8111"},
    )
    assert Path(command[0]).name.lower() == "cmd.exe"
    assert command[1:] == ["/d", "/q", "/v:off", "/s", "/c", "%WB_CONSOLE_SCRIPT%"]
    wrapper = Path(environment["WB_CONSOLE_SCRIPT"].strip('"'))
    assert wrapper.name == "run_announced_console.cmd"
    cmd_source = wrapper.read_text()
    assert "DisableDelayedExpansion" in cmd_source
    assert 'powershell.exe -NoProfile -NoLogo -NonInteractive -ExecutionPolicy Bypass -File "%~dp0run_announced_console.ps1"' in cmd_source
    assert "exit /b %ERRORLEVEL%" in cmd_source
    assert "%*" not in cmd_source and "WB_CONSOLE_PAYLOAD" not in cmd_source
    script = wrapper.with_suffix(".ps1").read_text()
    assert environment["WB_CONSOLE_BANNER"].splitlines()[0].startswith("[launch command]")
    assert "8111" in environment["WB_CONSOLE_BANNER"].splitlines()[0]
    assert "Actual worker" in environment["WB_CONSOLE_BANNER"].splitlines()[0]
    assert "private-value" not in environment["WB_CONSOLE_BANNER"]
    assert "8111" in environment["WB_CONSOLE_TITLE"]
    assert json.loads(environment["WB_CONSOLE_PAYLOAD"])["argv"] == original
    assert script.index("& $diagnostics -PreparedConsole") < script.index("[Diagnostics.Process]::Start")
    console = (ROOT / "scripts" / "windows_launcher_diagnostics.ps1").read_text()
    assert "CONOUT$" in console and "[Console]::Title" in console
    assert "Write-ConsoleOrError $line" in console
    assert "WB_CONSOLE_PAYLOAD" not in script
    assert "$start.UseShellExecute = $false" in script
    assert environment["WB_CONSOLE_REQUIRE_VISIBLE"] == "1"
    assert script.index("$env:WB_CONSOLE_READY -ne '1'") < script.index("[Diagnostics.Process]::Start")


@pytest.mark.skipif(sys.platform != "win32", reason="Windows CMD parsing contract")
def test_cmd_bootstrap_path_is_expanded_once_without_creating_a_visible_window(tmp_path, monkeypatch):
    directory = tmp_path / "space & (group)! %UNEXPANDED_PATH%"
    scripts = directory / "scripts"
    scripts.mkdir(parents=True)
    wrapper = scripts / "run_announced_console.cmd"
    wrapper.write_text("@echo off\necho INERT_CMD_BOOTSTRAP\nexit /b 27\n", encoding="ascii")
    monkeypatch.setattr(diagnostics, "__file__", str(directory / "launch_diagnostics.py"))
    command, environment = diagnostics.prepare_console_launch(
        [sys.executable, "not-executed.py"], directory,
        {**os.environ, "UNEXPANDED_PATH": "must-not-be-substituted"},
        identity="inert-parser-check",
    )
    result = subprocess.run(
        command, cwd=directory, env=environment, capture_output=True, text=True,
        creationflags=subprocess.CREATE_NO_WINDOW, timeout=15,
    )
    assert result.returncode == 27, result.stdout + result.stderr
    assert result.stdout.strip() == "INERT_CMD_BOOTSTRAP"
    assert not result.stderr


def test_environment_runner_restores_caller_environment_and_forwards_once(tmp_path, monkeypatch, capsys):
    runner = load_script("run_announced_command.py")
    arguments = ["safe-child", "", "a&b", "bang!", "%literal%", "--token", "private-value"]
    monkeypatch.setenv("WB_CONSOLE_PAYLOAD", json.dumps({
        "argv": arguments, "restoreEnvironment": {"WB_CONSOLE_PAYLOAD": None, "WB_CONSOLE_TITLE": "original"},
    }))
    monkeypatch.setenv("WB_CONSOLE_TITLE", "temporary")
    calls = []
    def spawn(command):
        import os
        calls.append(command)
        assert "WB_CONSOLE_PAYLOAD" not in os.environ
        assert os.environ["WB_CONSOLE_TITLE"] == "original"
        return SimpleNamespace(wait=lambda: 37)
    monkeypatch.setattr(runner.subprocess, "Popen", spawn)
    assert runner.main(["--environment"]) == 37
    assert calls == [arguments]
    output = capsys.readouterr()
    assert "private-value" not in output.out + output.err


def test_raw_api_entrypoint_announces_before_slow_imports_without_protocol_stdout():
    source = (ROOT / "python" / "workbench_api_server" / "scripts" / "run_api_server.py").read_text()
    assert source.index("    _early_console_command()") < source.index("import argparse")
    assert "[launch command]" in source and "CONOUT$" in source and "SetConsoleTitleW" in source
