@echo off
REM Regenerate the Markdown API reference under docs\api\ for all first-party packages.
REM Usage:  scripts\build_api_docs.bat   (from anywhere)
setlocal DisableDelayedExpansion
echo [launcher] command: "%ComSpec%" /d /c "%~f0" [forwarded arguments: REDACTED]
title Workbench API Documentation Builder
set "WB_DIAG_BOOTSTRAP_SCRIPT=%~f0"
set "WB_DIAG_BOOTSTRAP_PURPOSE=regenerate the first-party Markdown API reference."
set "WB_DIAG_TITLE=Workbench API Documentation Builder"
set "WB_DIAG_TITLE_PORTS="
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0windows_launcher_diagnostics.ps1" -Bootstrap
set "REPO=%~dp0.."
pushd "%REPO%"
if exist ".venv\Scripts\python.exe" (
  set "PY=.venv\Scripts\python.exe"
) else (
  set "PY=python"
)
set "WB_DIAG_EXE=%PY%"
set "WB_DIAG_TARGET=scripts\build_api_docs.py"
set "WB_DIAG_DETAIL="
set "WB_DIAG_VARS="
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0windows_launcher_diagnostics.ps1"
"%PY%" scripts\build_api_docs.py
set "RC=%ERRORLEVEL%"
popd
exit /b %RC%
