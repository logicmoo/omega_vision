@echo off
echo [launcher] command: "%ComSpec%" /d /c "%~f0" [forwarded arguments: REDACTED]
title MeTTa Workbench Vite Frontend
set "WB_DIAG_BOOTSTRAP_SCRIPT=%~f0"
set "WB_DIAG_BOOTSTRAP_PURPOSE=run the Vite frontend through the managed command launcher."
set "WB_DIAG_TITLE=MeTTa Workbench Vite Frontend"
set "WB_DIAG_TITLE_PORTS=WEB_PORT"
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0..\..\..\scripts\windows_launcher_diagnostics.ps1" -Bootstrap
rem Intentionally do not SETLOCAL here.  These variables must remain in this
rem child command window after Vite is stopped so `restart` uses the same
rem host, port, and API target.
if exist "C:\snet\setkeys.bat" call "C:\snet\setkeys.bat" >nul 2>nul
@echo off
if errorlevel 1 echo "[launcher] Warning: credential setup returned an error; its output is withheld."
set "ROOT=%~dp0..\..\.."
set "BIND_IP=%~1"
if not defined BIND_IP set "BIND_IP=127.0.0.1"
set "WEB_PORT=%~2"
if not defined WEB_PORT set "WEB_PORT=5173"
set "API_TARGET=%~3"
if not defined API_TARGET set "API_TARGET=http://127.0.0.1:8000"

set "WORKBENCH_WEB_HOST=%BIND_IP%"
set "WORKBENCH_WEB_PORT=%WEB_PORT%"
set "WORKBENCH_API_TARGET=%API_TARGET%"

cd /d "%ROOT%\frontend\apps\workbench"
doskey restart=npm run dev

echo.
echo ============================================================
echo  MeTTa Workbench Vite Dev Server (surgical reloads, no broad HMR)
echo ============================================================
echo  Reload policy: only frontend/src CSS/TS/TSX and index.html.
echo  Changes are debounced into one full reload. Runtime,
echo  workspace, test, build, and log changes do not reload the UI.
echo ============================================================
echo  Working directory:
echo    "%CD%"
echo.
echo  Environment for this instance:
echo    Sanitized WORKBENCH_WEB_HOST, WORKBENCH_WEB_PORT, and WORKBENCH_API_TARGET follow below.
echo.
echo  Command being run:
echo    npm run dev
echo.
echo  If you stop it with Ctrl+C:
echo    type restart
echo  or rerun: npm run dev
echo  The instance environment above remains set in this window.
echo  This command window stays open after Vite exits.
echo ============================================================
echo.

set "WORKBENCH_CONTROL_API=%WORKBENCH_CONTROL_API%"
if not defined WORKBENCH_CONTROL_API set "WORKBENCH_CONTROL_API=%API_TARGET%"
set "WB_DIAG_EXE=%ROOT%\.venv\Scripts\python.exe"
set "WB_DIAG_TARGET=%~dp0submit_managed_command.py"
set "WB_DIAG_DETAIL=--api WORKBENCH_CONTROL_API --service workbench-web --cwd CD --env WORKBENCH_WEB_HOST --env WORKBENCH_WEB_PORT --env WORKBENCH_API_TARGET -- ComSpec /d /c npm.cmd run dev"
set "WB_DIAG_VARS=WORKBENCH_CONTROL_API;CD;WORKBENCH_WEB_HOST;WORKBENCH_WEB_PORT;WORKBENCH_API_TARGET;ComSpec"
powershell -NoProfile -ExecutionPolicy Bypass -File "%ROOT%\scripts\windows_launcher_diagnostics.ps1"
"%ROOT%\.venv\Scripts\python.exe" "%~dp0submit_managed_command.py" --api "%WORKBENCH_CONTROL_API%" --service workbench-web --cwd "%CD%" --env WORKBENCH_WEB_HOST --env WORKBENCH_WEB_PORT --env WORKBENCH_API_TARGET -- "%ComSpec%" /d /c "npm.cmd run dev"
set "LAUNCH_EXIT_CODE=%ERRORLEVEL%"

echo.
echo ------------------------------------------------------------
echo  Vite dev server stopped.
echo  Type: restart
echo  Full restart command:
echo    npm run dev
echo ------------------------------------------------------------
echo.
exit /b %LAUNCH_EXIT_CODE%
