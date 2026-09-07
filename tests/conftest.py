"""Suite-wide safety defaults for Workbench plugin integration tests."""

from __future__ import annotations

import os
import uuid
from pathlib import Path


# Importing the real Workbench app starts every startup plugin. Keep the task
# harness recovery scan and TestClient shutdown hooks away from operator-owned
# durable tasks even when a test imports ``python/workbench_api_server/app.py`` directly.
os.environ["LLM_TASK_HARNESS_STATE_DIRECTORY"] = (
    f".codex/pytest-llm-task-harness-runtime-{os.getpid()}-{uuid.uuid4().hex}"
)

# arc_agi loads its packaged dotenv file during import. Pin resource selectors
# first so those package-local development paths cannot redirect test collection.
_ROOT = Path(__file__).resolve().parents[1]
os.environ["ARC3_RUNTIME_HOME"] = str(_ROOT)
os.environ["ARC3_CONFIG_ROOT"] = str(_ROOT / "python" / "arc_cli_debugger" / "config")
os.environ["ARC3_LLM_CONFIG"] = str(
    _ROOT / "python" / "arc_cli_debugger" / "config" / "llm_providers.json"
)
os.environ["ARC3_TREE_ROOT"] = str(_ROOT / "action_trees")
