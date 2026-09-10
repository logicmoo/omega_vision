@echo off
setlocal EnableExtensions DisableDelayedExpansion
echo "[launcher] %~f0"
echo "[launcher] Purpose: run the ARC terminal debugger in the caller workspace."
echo "[launcher] CWD: %CD%"
if exist "C:\snet\setkeys.bat" call "C:\snet\setkeys.bat" >nul 2>nul
@echo off
if errorlevel 1 echo "[launcher] Warning: credential setup returned an error; its output is withheld."

rem Preserve the directory from which the user launched ARC3. Python uses this
rem workspace first when resolving config\ and action_trees\ independently.
set "ARC3_CALLER_CWD=%CD%"
set "ARC3_LAUNCH_CWD=%CD%"

rem Resolve the code checkout from this batch file without changing the caller's
rem working directory. This keeps workspace-local resources discoverable.
for %%I in ("%~dp0..\..\..") do set "REPO_ROOT=%%~fI"

rem A project virtual environment must not inherit a machine-wide PYTHONHOME or
rem PYTHONPATH. Either variable can make Python search an unrelated installation
rem and print "Could not find platform independent libraries ^<prefix^>".
set "PYTHONHOME="
set "PYTHONPATH="

rem Use the project interpreter directly. Activation is unnecessary and this
rem avoids accidentally invoking the Microsoft Store python.exe alias.
set "VENV_PYTHON=%REPO_ROOT%\.venv\Scripts\python.exe"

if not exist "%VENV_PYTHON%" (
    echo ERROR: The project virtual environment does not exist:
    echo     "%REPO_ROOT%\.venv"
    echo.
    echo Run this first from the code checkout:
    echo     "%REPO_ROOT%\scripts\setup_windows.bat"
    echo.
    echo See "%REPO_ROOT%\README_WINDOWS.md" for Python, long-path, Git,
    echo SWI-Prolog, PyCharm, UNC-path, and Microsoft Store alias troubleshooting.
    exit /b 1
)

rem Detect a damaged or non-venv interpreter before attempting package repairs.
set "WB_DIAG_EXE=%VENV_PYTHON%"
set "WB_DIAG_TARGET="
set "WB_DIAG_DETAIL=-c import encodings, sys, sysconfig; raise SystemExit(0 if sys.prefix != sys.base_prefix else 1); stdout/stderr: NUL"
set "WB_DIAG_VARS="
powershell -NoProfile -ExecutionPolicy Bypass -File "%REPO_ROOT%\scripts\windows_launcher_diagnostics.ps1"
"%VENV_PYTHON%" -c "import encodings, sys, sysconfig; raise SystemExit(0 if sys.prefix != sys.base_prefix else 1)" >nul 2>nul
if errorlevel 1 (
    echo ERROR: .venv is damaged or is not a usable Python virtual environment.
    echo.
    echo Recreate it from the code checkout with:
    echo     rmdir /s /q "%REPO_ROOT%\.venv"
    echo     "%REPO_ROOT%\scripts\setup_windows.bat"
    exit /b 1
)

rem A git pull can add a new required dependency to pyproject.toml. Repair the
rem editable base installation automatically instead of crashing on import.
set "WB_DIAG_EXE=%VENV_PYTHON%"
set "WB_DIAG_TARGET="
set "WB_DIAG_DETAIL=-c import json_repair; stdout/stderr: NUL"
set "WB_DIAG_VARS="
powershell -NoProfile -ExecutionPolicy Bypass -File "%REPO_ROOT%\scripts\windows_launcher_diagnostics.ps1"
"%VENV_PYTHON%" -c "import json_repair" >nul 2>nul
if not errorlevel 1 goto :run
    echo.
    echo Updating core project dependencies in .venv ...
    pushd "%REPO_ROOT%" >nul
    set "WB_DIAG_EXE=%VENV_PYTHON%"
    set "WB_DIAG_TARGET="
    set "WB_DIAG_DETAIL=-m pip install -e ."
    set "WB_DIAG_VARS="
    powershell -NoProfile -ExecutionPolicy Bypass -File "%REPO_ROOT%\scripts\windows_launcher_diagnostics.ps1"
    "%VENV_PYTHON%" -m pip install -e "."
    set "INSTALL_EXIT_CODE=%ERRORLEVEL%"
    popd >nul
    if not "%INSTALL_EXIT_CODE%"=="0" (
        echo.
        echo ERROR: Unable to update the project dependencies.
        echo Run these exact Command Prompt commands:
        echo     pushd "%REPO_ROOT%"
        echo     "%VENV_PYTHON%" -m pip install -e ".[all]"
        echo     popd
        echo.
        echo Command Prompt requires double quotes here. Single quotes are
        echo passed literally and make the requirement invalid.
        exit /b 1
    )

:run
set "WB_DIAG_EXE=%VENV_PYTHON%"
set "WB_DIAG_TARGET=%~dp0interactive_runner.py"
set "WB_DIAG_DETAIL=forwarded arguments: [REDACTED]"
set "WB_DIAG_VARS="
powershell -NoProfile -ExecutionPolicy Bypass -File "%REPO_ROOT%\scripts\windows_launcher_diagnostics.ps1"
"%VENV_PYTHON%" "%~dp0interactive_runner.py" %*
set "EXIT_CODE=%ERRORLEVEL%"

endlocal & exit /b %EXIT_CODE%
