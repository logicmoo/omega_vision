@echo off
setlocal EnableExtensions DisableDelayedExpansion
if /I "%~1"=="/describe" goto :describe
echo [launcher] command: "%ComSpec%" /d /c "%~f0" [forwarded arguments: REDACTED]
title MeTTa Workbench API
set "WB_DIAG_BOOTSTRAP_SCRIPT=%~f0"
set "WB_DIAG_BOOTSTRAP_PURPOSE=run the workbench API bootstrap process."
set "WB_DIAG_TITLE=MeTTa Workbench API"
set "WB_DIAG_TITLE_PORTS=API_PORT"
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0..\..\..\scripts\windows_launcher_diagnostics.ps1" -Bootstrap
if exist "C:\snet\setkeys.bat" call "C:\snet\setkeys.bat" >nul 2>nul
@echo off
if errorlevel 1 echo "[launcher] Warning: credential setup returned an error; its output is withheld."
set "ROOT=%~dp0.."
for %%I in ("%ROOT%\..\..") do set "REPO_ROOT=%%~fI"
set "BIND_IP=%~1"
if not defined BIND_IP set "BIND_IP=127.0.0.1"
set "API_PORT=%~2"
if not defined API_PORT set "API_PORT=8000"
set "PYTHON_EXE=%REPO_ROOT%\.venv\Scripts\python.exe"

cd /d "%ROOT%"
doskey restart="%PYTHON_EXE%" "%ROOT%\scripts\run_api_server.py" --host %BIND_IP% --port %API_PORT%

echo.
echo ============================================================
echo  MeTTa Workbench API
echo ============================================================
echo  Working directory:
echo    "%CD%"
echo.
echo  The resolved Python command and sanitized options follow below.
echo.
echo  If you stop it with Ctrl+C:
echo    type restart
echo  or rerun the full command shown above.
echo  This command window stays open after the server exits.
echo ============================================================
echo.
echo WARNING: Bootstrap legacy mode: the API cannot submit its own startup command.
echo The outer Python launcher owns and tracks this API process tree.
echo.

set "WB_DIAG_EXE=%PYTHON_EXE%"
set "WB_DIAG_TARGET=%ROOT%\scripts\run_api_server.py"
set "WB_DIAG_DETAIL=--host BIND_IP --port API_PORT"
set "WB_DIAG_VARS=BIND_IP;API_PORT"
powershell -NoProfile -ExecutionPolicy Bypass -File "%REPO_ROOT%\scripts\windows_launcher_diagnostics.ps1"
"%PYTHON_EXE%" "%ROOT%\scripts\run_api_server.py" --host %BIND_IP% --port %API_PORT%
set "LAUNCH_EXIT_CODE=%ERRORLEVEL%"

echo.
echo ------------------------------------------------------------
echo  API server stopped.
echo  Type: restart
echo  The command shown above is also available through the restart macro.
echo ------------------------------------------------------------
echo.
exit /b %LAUNCH_EXIT_CODE%

:describe
for %%I in ("%~dp0..\..\..") do set "REPO_ROOT=%%~fI"
set "PYTHON_EXE=%REPO_ROOT%\.venv\Scripts\python.exe"
echo [launcher] command: "%PYTHON_EXE%" "%~dp0run_api_server.py" --help
title MeTTa Workbench API - Describe Only
set "WB_DIAG_TITLE=MeTTa Workbench API - Describe Only"
set "WB_DIAG_TITLE_PORTS="
set "WB_DIAG_EXE=%PYTHON_EXE%"
set "WB_DIAG_TARGET=%~dp0run_api_server.py"
set "WB_DIAG_DETAIL=--help"
set "WB_DIAG_VARS=CD"
powershell -NoProfile -ExecutionPolicy Bypass -File "%REPO_ROOT%\scripts\windows_launcher_diagnostics.ps1"
echo "[launcher] Purpose: describe API command options only; no credential setup, installation, or service startup."
echo "[launcher] CWD: %CD%"
if not exist "%PYTHON_EXE%" (
  echo "[launcher] ERROR: Existing project Python is unavailable; describe mode will not create an environment."
  exit /b 2
)
"%PYTHON_EXE%" "%~dp0run_api_server.py" --help
exit /b %ERRORLEVEL%
