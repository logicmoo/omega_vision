# Only pre-redacted display data is expanded here. Original argv stays in a
# private environment payload until the Python runner consumes it.
$ErrorActionPreference = 'Stop'
$diagnostics = Join-Path $PSScriptRoot '..\..\..\scripts\windows_launcher_diagnostics.ps1'
& $diagnostics -PreparedConsole
if ($env:WB_CONSOLE_REQUIRE_VISIBLE -eq '1' -and $env:WB_CONSOLE_READY -ne '1') {
    [Console]::Error.WriteLine('[launcher] Cannot announce in the attached console; no child was started.')
    exit 1
}
$start = [Diagnostics.ProcessStartInfo]::new()
$start.FileName = $env:WB_CONSOLE_PYTHON
$start.Arguments = '"' + $env:WB_CONSOLE_RUNNER + '" --environment'
$start.UseShellExecute = $false
# Do not route the child's protocol streams through PowerShell's text pipeline.
$child = [Diagnostics.Process]::Start($start)
$child.WaitForExit()
exit $child.ExitCode
