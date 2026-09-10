@echo off
setlocal DisableDelayedExpansion
echo "[launcher] %~f0"
echo "[launcher] Purpose: validate the staged diff and commit using the local message file."
echo "[launcher] CWD: %CD%"
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
