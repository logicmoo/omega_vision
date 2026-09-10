@echo off
setlocal DisableDelayedExpansion
echo [launcher] command: "%ComSpec%" /d /c "%~f0" [forwarded arguments: REDACTED]
title VB-CABLE Official Installer
set "WB_DIAG_BOOTSTRAP_SCRIPT=%~f0"
set "WB_DIAG_BOOTSTRAP_PURPOSE=download the official VB-CABLE package and open its interactive installer."
set "WB_DIAG_TITLE=VB-CABLE Official Installer"
set "WB_DIAG_TITLE_PORTS="
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0windows_launcher_diagnostics.ps1" -Bootstrap
REM install_vb_cable.bat
REM
REM Downloads and launches the OFFICIAL VB-CABLE virtual audio cable
REM installer from vb-audio.com (the well-known, widely-used free/donationware
REM virtual audio driver). Review this file before running it.
REM
REM What this does:
REM   1. Downloads VBCABLE_Driver_Pack45.zip from download.vb-audio.com
REM      (official VB-Audio download server) into %TEMP%.
REM   2. Extracts it.
REM   3. Launches VBCABLE_Setup_x64.exe.
REM
REM IMPORTANT: step 3 will pop a Windows UAC "Do you want to allow this app to
REM make changes to your device?" prompt, because installing a virtual audio
REM DRIVER requires administrator rights. That prompt appears on Windows'
REM secure desktop and can only be approved by a human clicking "Yes" at the
REM keyboard -- no script or AI agent can click through it. Please approve
REM that one prompt, then follow the setup wizard (Install Driver -> Finish),
REM then REBOOT (VB-CABLE requires a reboot to fully register the new device).
REM
REM After reboot, run:
REM   .venv\Scripts\python.exe scripts\meet_caption_bridge.py --list-audio-devices
REM to confirm "CABLE Input" / "CABLE Output" now appear in the device list.

set "DL_URL=https://download.vb-audio.com/Download_CABLE/VBCABLE_Driver_Pack45.zip"
set "DL_ZIP=%TEMP%\VBCABLE_Driver_Pack45.zip"
set "DL_DIR=%TEMP%\VBCABLE_Driver_Pack45"

echo Downloading VB-CABLE from %DL_URL% ...
echo "[launcher] Handoff: PowerShell Invoke-WebRequest; package output: %DL_ZIP%"
powershell -NoProfile -Command "Invoke-WebRequest -Uri $env:DL_URL -OutFile $env:DL_ZIP"
if not exist "%DL_ZIP%" (
  echo Download failed - check your internet connection or the URL above.
  exit /b 1
)

echo Extracting ...
echo "[launcher] Handoff: PowerShell Expand-Archive; output directory: %DL_DIR%"
powershell -NoProfile -Command "Expand-Archive -Path $env:DL_ZIP -DestinationPath $env:DL_DIR -Force"

echo Launching the VB-CABLE setup program (this WILL prompt for admin approval - please click Yes) ...
if exist "%DL_DIR%\VBCABLE_Setup_x64.exe" (
  echo "[launcher] Handoff: %DL_DIR%\VBCABLE_Setup_x64.exe"
  start "" "%DL_DIR%\VBCABLE_Setup_x64.exe"
) else (
  echo "Could not find VBCABLE_Setup_x64.exe in %DL_DIR% - open that folder and run the installer manually."
  echo "[launcher] Handoff: explorer; folder: %DL_DIR%"
  explorer "%DL_DIR%"
)

echo.
echo Once the installer finishes: REBOOT your machine, then verify with:
echo   .venv\Scripts\python.exe scripts\meet_caption_bridge.py --list-audio-devices
endlocal
