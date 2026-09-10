@echo off
setlocal EnableExtensions DisableDelayedExpansion
echo "[launcher] %~f0"
echo "[launcher] Purpose: launch the configured ClawRouter proxy through managed execution."
echo "[launcher] CWD: %CD%"
if exist "C:\snet\setkeys.bat" call "C:\snet\setkeys.bat" >nul 2>nul
@echo off
if errorlevel 1 echo "[launcher] Warning: credential setup returned an error; its output is withheld."

set "CLAWROUTER_PORT=%~1"
if not defined CLAWROUTER_PORT set "CLAWROUTER_PORT=3456"

title ClawRouter %CLAWROUTER_PORT%
cd /d "%~dp0..\..\.."

where npx.cmd >nul 2>nul
if errorlevel 1 (
  echo ERROR: npx.cmd was not found. Install Node.js 22 or newer.
  exit /b 1
)

echo.
echo ============================================================
echo  ClawRouter local proxy
echo ============================================================
echo  Local proxy paths: /v1 and /health; configured port is shown below.
echo  Default workbench model: blockrun/free
echo.
echo  ClawRouter creates its wallet under %%USERPROFILE%%\.openclaw\blockrun.
echo  The free route does not require an API key or wallet balance.
echo ============================================================
echo.

set "WORKBENCH_CONTROL_API=%WORKBENCH_CONTROL_API%"
if not defined WORKBENCH_CONTROL_API set "WORKBENCH_CONTROL_API=http://127.0.0.1:8000"
set "WB_DIAG_EXE=%~dp0..\..\..\.venv\Scripts\python.exe"
set "WB_DIAG_TARGET=%~dp0submit_managed_command.py"
set "WB_DIAG_DETAIL=--api WORKBENCH_CONTROL_API --service clawrouter --cwd CD -- npx.cmd --yes @blockrun/clawrouter --port CLAWROUTER_PORT"
set "WB_DIAG_VARS=WORKBENCH_CONTROL_API;CD;CLAWROUTER_PORT"
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0..\..\..\scripts\windows_launcher_diagnostics.ps1"
"%~dp0..\..\..\.venv\Scripts\python.exe" "%~dp0submit_managed_command.py" --api "%WORKBENCH_CONTROL_API%" --service clawrouter --cwd "%CD%" -- npx.cmd --yes @blockrun/clawrouter --port %CLAWROUTER_PORT%
set "LAUNCH_EXIT_CODE=%ERRORLEVEL%"

echo.
echo ClawRouter stopped. Rerun this script to restart it.
echo.
exit /b %LAUNCH_EXIT_CODE%
