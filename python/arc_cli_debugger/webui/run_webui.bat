@echo off
setlocal DisableDelayedExpansion
echo "[launcher] %~f0"
echo "[launcher] Purpose: activate the debugger environment and run its browser UI."
echo "[launcher] CWD: %CD%"
if exist "C:\snet\setkeys.bat" call "C:\snet\setkeys.bat" >nul 2>nul
@echo off
if errorlevel 1 echo "[launcher] Warning: credential setup returned an error; its output is withheld."

rem Change to the repository root, regardless of where run.bat was launched.
cd /d "%~dp0.."

rem Activate the virtual environment.
echo "[launcher] Handoff: %CD%\venv\Scripts\activate.bat"
call ".\venv\Scripts\activate.bat"
@echo off

rem Run the interactive runner and pass through any command-line arguments.
set "WB_DIAG_EXE=python"
set "WB_DIAG_TARGET=.\scripts\run_webui.py"
set "WB_DIAG_DETAIL=forwarded arguments: [REDACTED]"
set "WB_DIAG_VARS="
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0..\..\..\scripts\windows_launcher_diagnostics.ps1"
python ".\scripts\run_webui.py" %*

set "EXIT_CODE=%ERRORLEVEL%"
endlocal & exit /b %EXIT_CODE%
