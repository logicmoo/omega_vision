@echo off
setlocal EnableExtensions DisableDelayedExpansion
echo "[launcher] %~f0"
echo "[launcher] Purpose: ensure OmniRoute is available and launch its managed gateway."
echo "[launcher] CWD: %CD%"
if exist "C:\snet\setkeys.bat" call "C:\snet\setkeys.bat" >nul 2>nul
@echo off
if errorlevel 1 echo "[launcher] Warning: credential setup returned an error; its output is withheld."

set "OMNIROUTE_PORT=%~1"
if not defined OMNIROUTE_PORT set "OMNIROUTE_PORT=20128"
set "OMNIROUTE_CMD=%APPDATA%\npm\omniroute.cmd"

rem OmniRoute loads the repository .env before spawning its dashboard. Pin
rem both generic dashboard variables so a repository PORT value (the
rem Workbench API normally uses 8000) cannot create a second listener there.
set "PORT=%OMNIROUTE_PORT%"
set "DASHBOARD_PORT=%OMNIROUTE_PORT%"

title OmniRoute %OMNIROUTE_PORT%
cd /d "%~dp0..\..\.."

if not exist "%OMNIROUTE_CMD%" (
  echo Installing the official OmniRoute npm package...
  call npm.cmd install -g omniroute
  if errorlevel 1 exit /b 1
)

echo.
echo ============================================================
echo  OmniRoute local gateway
echo ============================================================
echo  Local gateway paths: / and /v1; configured port is shown below.
echo  Default workbench model: auto/best-free
echo.
echo  First-run endpoint-key setup is handled by the workbench.
echo  Set OMNIROUTE_ADMIN_PASSWORD if the dashboard password is no
echo  longer OmniRoute's initial CHANGEME value.
echo ============================================================
echo.

set "WORKBENCH_CONTROL_API=%WORKBENCH_CONTROL_API%"
if not defined WORKBENCH_CONTROL_API set "WORKBENCH_CONTROL_API=http://127.0.0.1:8000"
set "WB_DIAG_EXE=%~dp0..\..\..\.venv\Scripts\python.exe"
set "WB_DIAG_TARGET=%~dp0submit_managed_command.py"
set "WB_DIAG_DETAIL=--api WORKBENCH_CONTROL_API --service omniroute --cwd CD --env PORT --env DASHBOARD_PORT -- OMNIROUTE_CMD serve --port OMNIROUTE_PORT --no-open --no-tray --log"
set "WB_DIAG_VARS=WORKBENCH_CONTROL_API;CD;PORT;DASHBOARD_PORT;OMNIROUTE_CMD;OMNIROUTE_PORT"
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0..\..\..\scripts\windows_launcher_diagnostics.ps1"
"%~dp0..\..\..\.venv\Scripts\python.exe" "%~dp0submit_managed_command.py" --api "%WORKBENCH_CONTROL_API%" --service omniroute --cwd "%CD%" --env PORT --env DASHBOARD_PORT -- "%OMNIROUTE_CMD%" serve --port %OMNIROUTE_PORT% --no-open --no-tray --log
set "LAUNCH_EXIT_CODE=%ERRORLEVEL%"

echo.
echo OmniRoute stopped. Rerun this script to restart it.
echo.
exit /b %LAUNCH_EXIT_CODE%
