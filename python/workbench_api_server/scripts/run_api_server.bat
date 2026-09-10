@echo off
setlocal EnableExtensions DisableDelayedExpansion
echo "[launcher] %~f0"
echo "[launcher] Purpose: run the workbench API bootstrap process."
echo "[launcher] CWD: %CD%"
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

title MeTTa Workbench API %BIND_IP%:%API_PORT%
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
