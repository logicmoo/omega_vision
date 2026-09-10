@echo off
setlocal DisableDelayedExpansion
echo [launcher] command: "%ComSpec%" /d /c "%~f0" [forwarded arguments: REDACTED]
title Workbench Staged Commit
set "WB_DIAG_BOOTSTRAP_SCRIPT=%~f0"
set "WB_DIAG_BOOTSTRAP_PURPOSE=validate the staged diff and commit using the local message file."
set "WB_DIAG_TITLE=Workbench Staged Commit"
set "WB_DIAG_TITLE_PORTS="
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0windows_launcher_diagnostics.ps1" -Bootstrap
if exist "C:\snet\setkeys.bat" call "C:\snet\setkeys.bat" >nul 2>nul
@echo off
if errorlevel 1 echo "[launcher] Warning: credential setup returned an error; its output is withheld."

cd /d "%~dp0.."
if errorlevel 1 exit /b %errorlevel%

if not exist ".codex-commit-message.txt" (
  echo Missing .codex-commit-message.txt 1>&2
  exit /b 2
)

echo "[launcher] Handoff: git diff --cached --quiet --exit-code"
git diff --cached --quiet --exit-code
if not errorlevel 1 (
  echo Nothing is staged; refusing to create an empty commit. 1>&2
  exit /b 3
)

echo "[launcher] Handoff: git diff --cached --check"
git diff --cached --check
if errorlevel 1 exit /b %errorlevel%

echo "[launcher] Handoff: git commit -F .codex-commit-message.txt; message contents not displayed."
git commit -F ".codex-commit-message.txt"
exit /b %errorlevel%
