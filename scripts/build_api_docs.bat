@echo off
REM Regenerate the Markdown API reference under docs\api\ for all first-party packages.
REM Usage:  scripts\build_api_docs.bat   (from anywhere)
setlocal DisableDelayedExpansion
echo "[launcher] %~f0"
echo "[launcher] Purpose: regenerate the first-party Markdown API reference."
echo "[launcher] CWD: %CD%"
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
