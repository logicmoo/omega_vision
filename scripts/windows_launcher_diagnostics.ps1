# Values arrive through the environment, never through a second CMD parse.
# This helper only describes commands; it must never execute an interpreter.
$ErrorActionPreference = 'Stop'

function Protect-Display([string] $Value) {
    $Value = $Value -replace '[\r\n\x00-\x1f\x7f]', ' '
    $Value = [regex]::Replace($Value, '(?i)\b[a-z][a-z0-9+.-]*://[^\s"<>]+', {
        param($Match)
        $url = $Match.Value
        $url = $url -replace '^([a-z][a-z0-9+.-]*://)[^/]*@', '$1[REDACTED]@'
        $url = $url -replace '[?#].*$', '?[REDACTED]'
        return $url
    })
    $Value = $Value -replace '(?i)((?:password|passwd|secret|token|api[-_]?key|authorization)\s*[=:]\s*)[^\s;,]+', '$1[REDACTED]'
    return $Value
}

function Resolve-Executable([string] $Value) {
    if (-not $Value) { return '' }
    if ($Value -match '[/\\]' -or [IO.Path]::IsPathRooted($Value)) {
        return [IO.Path]::GetFullPath($Value)
    }
    # CMD searches the current directory before PATH; PowerShell Get-Command
    # does not. Honor CMD's PATHEXT order without launching a discovery probe.
    $extensions = @('')
    if (-not [IO.Path]::GetExtension($Value)) {
        $extensions += (($env:PATHEXT, '.COM;.EXE;.BAT;.CMD' |
            Where-Object { $_ } | Select-Object -First 1) -split ';')
    }
    $directories = @((Get-Location).Path) + ($env:PATH -split ';')
    foreach ($directory in $directories) {
        if (-not $directory) { continue }
        foreach ($extension in $extensions) {
            $candidate = [IO.Path]::Combine($directory.Trim('"'), $Value + $extension)
            if ([IO.File]::Exists($candidate)) { return [IO.Path]::GetFullPath($candidate) }
        }
    }
    return "$Value [not found on PATH]"
}

try {
    $exe = Resolve-Executable $env:WB_DIAG_EXE
    $target = $env:WB_DIAG_TARGET
    if ($target) { $target = [IO.Path]::GetFullPath($target) }
    $command = '"' + (Protect-Display $exe) + '"'
    if ($target) { $command += ' "' + (Protect-Display $target) + '"' }
    [Console]::WriteLine('[launcher] execute: {0} {1}',
        $command, (Protect-Display $env:WB_DIAG_DETAIL))
    foreach ($name in ($env:WB_DIAG_VARS -split ';')) {
        if (-not $name) { continue }
        $value = [Environment]::GetEnvironmentVariable($name)
        if ($name -eq 'CD') { $value = (Get-Location).Path }
        if ($name -match '(?i)password|passwd|secret|token|api_?key|authorization') {
            $value = '[REDACTED]'
        } elseif ($name -match '(?i)(python|exe|cmd)$') {
            $value = Resolve-Executable $value
        }
        [Console]::WriteLine('[launcher]   {0}={1}', $name, (Protect-Display $value))
    }
} catch {
    # Do not print exception messages: they can contain the unredacted input.
    [Console]::WriteLine('[launcher] diagnostic unavailable; command arguments withheld.')
}
exit 0
