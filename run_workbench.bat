@echo off
setlocal EnableExtensions DisableDelayedExpansion
echo "[launcher] %~f0"
echo "[launcher] Purpose: launch the local workbench, or stop its selected ports."
echo "[launcher] CWD: %CD%"
if exist "C:\snet\setkeys.bat" call "C:\snet\setkeys.bat" >nul 2>nul
@echo off
if errorlevel 1 echo "[launcher] Warning: credential setup returned an error; its output is withheld."
if /I "%~1"=="/kill" goto :stop
echo "[launcher] Handoff: %~dp0python\workbench_api_server\scripts\run_demo.bat; forwarded arguments: [REDACTED]"
call "%~dp0python\workbench_api_server\scripts\run_demo.bat" %*
exit /b %ERRORLEVEL%

:stop
set "KILL_WEB_PORT=%~2"
if not defined KILL_WEB_PORT set "KILL_WEB_PORT=5173"
set "KILL_API_PORT=%~3"
if not defined KILL_API_PORT set "KILL_API_PORT=8000"
set "STOP_PYTHON=python"
if exist "%~dp0.venv\Scripts\python.exe" set "STOP_PYTHON=%~dp0.venv\Scripts\python.exe"
set "WB_DIAG_EXE=%STOP_PYTHON%"
set "WB_DIAG_TARGET=%~dp0python\workbench_api_server\scripts\stop_workbench.py"
set "WB_DIAG_DETAIL=--web-port KILL_WEB_PORT --api-port KILL_API_PORT"
set "WB_DIAG_VARS=KILL_WEB_PORT;KILL_API_PORT"
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0scripts\windows_launcher_diagnostics.ps1"
"%STOP_PYTHON%" "%~dp0python\workbench_api_server\scripts\stop_workbench.py" --web-port "%KILL_WEB_PORT%" --api-port "%KILL_API_PORT%"
exit /b %ERRORLEVEL%
