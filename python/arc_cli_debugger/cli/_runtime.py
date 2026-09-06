"""Debugger-CLI shim for the repo-level ``scripts/_runtime.py``.

The CLI entry points moved into ``python/arc_cli_debugger/cli/`` while the
shared runtime bootstrapper stayed at ``scripts/_runtime.py`` (other repo
scripts import it as a sibling). This shim keeps ``from _runtime import
configure_runtime_home`` working unchanged from the CLI directory.
"""
from __future__ import annotations

import importlib.util as _ilu
from pathlib import Path as _Path

_REAL = _Path(__file__).resolve().parents[3] / "scripts" / "_runtime.py"
_SPEC = _ilu.spec_from_file_location("_arc3_scripts_runtime", _REAL)
_MOD = _ilu.module_from_spec(_SPEC)
assert _SPEC.loader is not None
_SPEC.loader.exec_module(_MOD)

configure_runtime_home = _MOD.configure_runtime_home
