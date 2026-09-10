@echo off
setlocal DisableDelayedExpansion
echo [launcher] command: "%ComSpec%" /d /c "%~f0" [forwarded arguments: REDACTED]
title Google Meet Caption Bridge
set "WB_DIAG_BOOTSTRAP_SCRIPT=%~f0"
set "WB_DIAG_BOOTSTRAP_PURPOSE=run the Google Meet caption and mailbox bridge."
set "WB_DIAG_TITLE=Google Meet Caption Bridge"
set "WB_DIAG_TITLE_PORTS="
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0..\..\..\scripts\windows_launcher_diagnostics.ps1" -Bootstrap
rem Google Meet STT bridge — always-on servant meeting + mailbox two-way.
rem Managed by the workbench Processes page (meet_caption_bridge.managed_service.json).
cd /d "%~dp0..\..\.."
set "WB_DIAG_EXE=.venv\Scripts\python.exe"
set "WB_DIAG_TARGET=scripts\meet_caption_bridge.py"
set "WB_DIAG_DETAIL=forwarded arguments: [REDACTED]"
set "WB_DIAG_VARS="
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0..\..\..\scripts\windows_launcher_diagnostics.ps1"
".venv\Scripts\python.exe" scripts\meet_caption_bridge.py %*
exit /b %ERRORLEVEL%
