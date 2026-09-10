@echo off
setlocal EnableExtensions DisableDelayedExpansion
rem Keep the visible owner a Command Prompt. The helper writes sanitized
rem command/service/port data to this console; original argv is never parsed here.
powershell.exe -NoProfile -NoLogo -NonInteractive -ExecutionPolicy Bypass -File "%~dp0run_announced_console.ps1"
exit /b %ERRORLEVEL%
