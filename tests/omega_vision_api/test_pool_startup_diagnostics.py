from __future__ import annotations

import builtins
import io
import json
import sys
from pathlib import Path
from types import SimpleNamespace
from unittest.mock import Mock

import pytest

from omega_vision.services import transform_task_pooler as pooler
from omega_vision.services import video_import_api as api


ROOT = Path(__file__).resolve().parents[2]
POOL_SCRIPT = ROOT / "python" / "omega_vision" / "services" / "transform_task_pooler.py"
MAILBOX_SCRIPT = ROOT / "scripts" / "mailbox_codex_listener.py"


class TrackedText(io.StringIO):
    def __init__(self, events: list[str]):
        super().__init__()
        self.events = events

    def write(self, value: str) -> int:
        self.events.append("stderr-write")
        return super().write(value)

    def flush(self) -> None:
        self.events.append("stderr-flush")
        super().flush()


@pytest.mark.parametrize("platform", ["nt", "posix"])
@pytest.mark.parametrize("spawn_fails", [False, True])
def test_pool_banner_is_flushed_to_both_destinations_before_single_spawn(
    monkeypatch: pytest.MonkeyPatch, platform: str, spawn_fails: bool,
) -> None:
    events: list[str] = []
    stderr = TrackedText(events)
    binary = io.BytesIO()
    log = Mock()
    log.write.side_effect = lambda value: (events.append("log-write"), binary.write(value))[1]
    log.flush.side_effect = lambda: events.append("log-flush")
    log.close.side_effect = lambda: events.append("log-close")
    command = [sys.executable, str(POOL_SCRIPT), "--control", str(api._POOLER_CONTROL_PATH)]
    root = api._POOLER_CONTROL_PATH.parent / "curated" / "test-sequence"
    monkeypatch.setattr(api, "_pooler_alive", lambda: 0)
    monkeypatch.setattr(api, "_pooler_read", lambda path: {"root": str(root)})
    monkeypatch.setattr(api, "os", SimpleNamespace(name=platform))
    monkeypatch.setattr(sys, "stderr", stderr)
    opened = Mock(return_value=log)
    monkeypatch.setattr(api, "open", opened, raising=False)

    def spawn(*args, **kwargs):
        assert events[-2:] == ["log-write", "log-flush"]
        assert "stderr-flush" in events[:events.index("log-write")]
        assert args == (command,)
        flags = (getattr(api.subprocess, "CREATE_NEW_PROCESS_GROUP", 0)
                 | getattr(api.subprocess, "DETACHED_PROCESS", 8)) if platform == "nt" else 0
        assert kwargs == {
            "cwd": str(ROOT), "stdout": log, "stderr": api.subprocess.STDOUT,
            "stdin": api.subprocess.DEVNULL, "creationflags": flags,
        }
        events.append("spawn")
        if spawn_fails:
            raise OSError("test spawn failure")
        return SimpleNamespace(pid=12345)

    popen = Mock(side_effect=spawn)
    monkeypatch.setattr(api.subprocess, "Popen", popen)
    if spawn_fails:
        with pytest.raises(OSError, match="test spawn failure"):
            api._pooler_spawn_if_dead()
    else:
        assert api._pooler_spawn_if_dead() == 12345
    popen.assert_called_once()
    opened.assert_called_once_with(api._POOLER_CONTROL_PATH.with_name("pooler.log"), "ab")
    assert events[-2:] == ["spawn", "log-close"]
    for banner in (stderr.getvalue(), binary.getvalue().decode("utf-8")):
        assert "omega-vision-transform-task-pooler" in banner
        assert "Offline worker" in banner
        assert str(ROOT) in banner
        assert str(root) in banner
        assert "pooler_control.json" in banner
        assert "pooler_status.json" in banner
        assert "pooler.log" in banner
        assert "http://" not in banner
        assert banner.endswith("\n")


def test_live_pooler_is_not_reannounced_or_spawned(monkeypatch: pytest.MonkeyPatch) -> None:
    monkeypatch.setattr(api, "_pooler_alive", lambda: 12345)
    popen = Mock(side_effect=AssertionError("unexpected duplicate spawn"))
    opened = Mock(side_effect=AssertionError("unexpected log open"))
    monkeypatch.setattr(api.subprocess, "Popen", popen)
    monkeypatch.setattr(api, "open", opened, raising=False)
    stderr = io.StringIO()
    monkeypatch.setattr(sys, "stderr", stderr)
    assert api._pooler_spawn_if_dead() == 12345
    assert stderr.getvalue() == ""
    popen.assert_not_called()
    opened.assert_not_called()


@pytest.mark.parametrize(
    ("script", "bootstrap", "identity", "arguments"),
    [
        (POOL_SCRIPT, "omega_vision.services.video_import_api",
         "omega-vision-transform-task-pooler", ["--control", "data/omega_vision/pooler_control.json"]),
        (POOL_SCRIPT, "omega_vision.services.video_import_api",
         "omega-vision-transform-task-pooler", ["--root", "data/omega_vision/curated"]),
        (MAILBOX_SCRIPT, "_runtime", "mailbox-codex-listener", ["poll", "--timeout", "0"]),
    ],
)
def test_child_announces_and_flushes_before_application_bootstrap(
    monkeypatch: pytest.MonkeyPatch, script: Path, bootstrap: str, identity: str, arguments: list[str],
) -> None:
    events: list[str] = []
    stderr = TrackedText(events)
    stdout = io.StringIO()
    original_import = builtins.__import__

    class BootstrapReached(Exception):
        pass

    def guarded_import(name, *args, **kwargs):
        if name == bootstrap:
            assert "stderr-flush" in events
            assert identity in stderr.getvalue()
            events.append("bootstrap")
            raise BootstrapReached
        return original_import(name, *args, **kwargs)

    monkeypatch.setattr(sys, "argv", [str(script), *arguments])
    monkeypatch.setattr(sys, "path", list(sys.path))
    monkeypatch.setattr(sys, "stderr", stderr)
    monkeypatch.setattr(sys, "stdout", stdout)
    monkeypatch.setattr(builtins, "__import__", guarded_import)
    with pytest.raises(BootstrapReached):
        exec(compile(script.read_text(encoding="utf-8"), str(script), "exec"),
             {"__name__": "__main__", "__file__": str(script)})
    assert events[-1] == "bootstrap"
    assert stdout.getvalue() == ""
    assert str(script) in stderr.getvalue()
    assert str(Path.cwd()) in stderr.getvalue()
    if "--root" in arguments:
        assert str(Path(arguments[-1]).resolve()) in stderr.getvalue()
        assert "pooler_status.json" not in stderr.getvalue()


def _mailbox_namespace(monkeypatch: pytest.MonkeyPatch) -> dict:
    monkeypatch.setitem(sys.modules, "_runtime", SimpleNamespace(configure_runtime_home=lambda _: ROOT))
    namespace = {"__name__": "mailbox_diagnostics_test", "__file__": str(MAILBOX_SCRIPT)}
    exec(compile(MAILBOX_SCRIPT.read_text(encoding="utf-8"), str(MAILBOX_SCRIPT), "exec"), namespace)
    return namespace


@pytest.mark.parametrize("platform", ["nt", "posix"])
def test_mailbox_detached_fallback_flushes_stderr_without_polluting_json(
    monkeypatch: pytest.MonkeyPatch, platform: str,
) -> None:
    listener = _mailbox_namespace(monkeypatch)
    events: list[str] = []
    stderr = TrackedText(events)
    stdout = io.StringIO()
    listener["os"] = SimpleNamespace(name=platform)
    listener["RELAY_URL"] = "http://user:example-password@127.0.0.1:46667/?token=example-token"
    monkeypatch.setattr(sys, "stderr", stderr)
    monkeypatch.setattr(sys, "stdout", stdout)
    command = [str(ROOT.parent / "mailbox_channel" / "mailbox-server.cmd")]

    def spawn(*args, **kwargs):
        assert events[-1] == "stderr-flush"
        assert args == (command,)
        subprocess = listener["subprocess"]
        flags = (getattr(subprocess, "CREATE_NO_WINDOW", 0)
                 | getattr(subprocess, "DETACHED_PROCESS", 0)) if platform == "nt" else 0
        assert kwargs == {
            "cwd": str(ROOT.parent), "stdin": subprocess.DEVNULL,
            "stdout": subprocess.DEVNULL, "stderr": subprocess.DEVNULL, "creationflags": flags,
        }
        return SimpleNamespace(pid=456)

    popen = Mock(side_effect=spawn)
    monkeypatch.setattr(listener["subprocess"], "Popen", popen)
    assert listener["_spawn_detached"](command, cwd=ROOT.parent) == 456
    listener["_print"]({"status": "starting", "pid": 456})
    popen.assert_called_once()
    assert json.loads(stdout.getvalue()) == {"status": "starting", "pid": 456}
    banner = stderr.getvalue()
    assert "mailbox-relay-fallback" in banner
    assert "mailbox-server.cmd" in banner
    assert "46667" in banner
    assert "DEVNULL" in banner
    assert "example-password" not in banner
    assert "example-token" not in banner


@pytest.mark.parametrize("abort", [False, True])
def test_in_process_tasks_are_named_without_spawning_python(
    monkeypatch: pytest.MonkeyPatch, capsys: pytest.CaptureFixture[str], abort: bool,
) -> None:
    todo = {"transformation": "sample-transform", "doer": "sample-doer", "status": "pending"}
    unit = {"id": "sample-unit", "dir": ROOT}
    monkeypatch.setattr(pooler, "find_todo_files", lambda _: [ROOT / "todos.json"])
    monkeypatch.setattr(pooler, "load_unit", lambda *args, **kwargs: (unit, [todo], [todo]))
    monkeypatch.setattr(pooler, "write_unit_todos", lambda *args: 0)
    popen = Mock(side_effect=AssertionError("in-process tasks must not spawn Python"))
    monkeypatch.setattr(api.subprocess, "Popen", popen)

    def transform(*args, **kwargs):
        assert "in-process task starting: sample-unit" in capsys.readouterr().err
        return {"step": "sample-transform/sample-doer", "status": "written"}

    runner = Mock(side_effect=transform)
    monkeypatch.setattr(pooler, "run_transform_step", runner)
    assert pooler.one_pass(
        [ROOT], workers=2, limit=0, retry_errors=False, only_types=None, skip_types=None,
        should_abort=lambda: abort,
    ) == (0 if abort else 1)
    popen.assert_not_called()
    if abort:
        runner.assert_not_called()
        assert capsys.readouterr().err == ""
    else:
        runner.assert_called_once()
        assert "in-process task sample-unit" in capsys.readouterr().out
