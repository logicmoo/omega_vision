@echo off
setlocal EnableExtensions DisableDelayedExpansion
echo [launcher] command: "%ComSpec%" /d /c "%~f0" [forwarded arguments: REDACTED]
title Mailbox Channel Relay
set "WB_DIAG_BOOTSTRAP_SCRIPT=%~f0"
set "WB_DIAG_BOOTSTRAP_PURPOSE=run the mailbox channel relay with its selected Python environment."
set "WB_DIAG_TITLE=Mailbox Channel Relay"
set "WB_DIAG_TITLE_PORTS="
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0..\..\..\scripts\windows_launcher_diagnostics.ps1" -Bootstrap
set "RELAY_ROOT=%~1"
if not defined RELAY_ROOT set "RELAY_ROOT=%~dp0..\..\..\..\mailbox_channel"
set "RELAY_PYTHON=python"
if exist "%RELAY_ROOT%\.venv\Scripts\python.exe" set "RELAY_PYTHON=%RELAY_ROOT%\.venv\Scripts\python.exe"
set "WORKBENCH_CONTROL_API=%WORKBENCH_CONTROL_API%"
if not defined WORKBENCH_CONTROL_API set "WORKBENCH_CONTROL_API=http://127.0.0.1:8000"
set "PYTHONPATH=%RELAY_ROOT%\src;%PYTHONPATH%"
set "WB_DIAG_EXE=%~dp0..\..\..\.venv\Scripts\python.exe"
set "WB_DIAG_TARGET=%~dp0submit_managed_command.py"
set "WB_DIAG_DETAIL=--api WORKBENCH_CONTROL_API --service mailbox_server --cwd RELAY_ROOT --env PYTHONPATH -- RELAY_PYTHON -m mailbox_channels.server"
set "WB_DIAG_VARS=WORKBENCH_CONTROL_API;RELAY_ROOT;RELAY_PYTHON"
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0..\..\..\scripts\windows_launcher_diagnostics.ps1"
"%~dp0..\..\..\.venv\Scripts\python.exe" "%~dp0submit_managed_command.py" --api "%WORKBENCH_CONTROL_API%" --service mailbox_server --cwd "%RELAY_ROOT%" --env PYTHONPATH -- "%RELAY_PYTHON%" -m mailbox_channels.server
exit /b %ERRORLEVEL%
