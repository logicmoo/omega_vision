param([switch] $Bootstrap, [switch] $PreparedConsole, [switch] $ServiceCommand)

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

function Format-CommandDetail([string] $Template) {
    return [regex]::Replace($Template, '\{([A-Za-z_][A-Za-z0-9_]*)\}', {
        param($Match)
        $name = $Match.Groups[1].Value
        $value = [Environment]::GetEnvironmentVariable($name)
        if ($name -eq 'CD') { $value = (Get-Location).Path }
        if ($name -match '(?i)password|passwd|secret|token|api_?key|authorization') {
            $value = '[REDACTED]'
        }
        return '"' + (Protect-Display $value) + '"'
    })
}

$script:ConsoleApi = $null
$script:ConsoleHandle = [IntPtr]::Zero
$script:ConsoleWriteSucceeded = $false

function Initialize-AttachedConsole {
    try {
        # Emit three P/Invoke signatures in memory: no compiler subprocess,
        # generated files, new console, attachment to another process, or window.
        $assemblyName = New-Object Reflection.AssemblyName('WorkbenchLauncherConsole')
        $assembly = [AppDomain]::CurrentDomain.DefineDynamicAssembly(
            $assemblyName, [Reflection.Emit.AssemblyBuilderAccess]::Run)
        $module = $assembly.DefineDynamicModule('Native')
        $builder = $module.DefineType('WorkbenchLauncherConsole.Native',
            [Reflection.TypeAttributes]::Public)
        $attributes = [Reflection.MethodAttributes]::Public -bor
            [Reflection.MethodAttributes]::Static -bor [Reflection.MethodAttributes]::PinvokeImpl
        $signatures = @(
            @{ Name = 'CreateFileW'; Result = [IntPtr]; Parameters = [type[]]@(
                [string], [uint32], [uint32], [IntPtr], [uint32], [uint32], [IntPtr]) },
            @{ Name = 'WriteConsoleW'; Result = [bool]; Parameters = [type[]]@(
                [IntPtr], [string], [uint32], [uint32].MakeByRefType(), [IntPtr]) },
            @{ Name = 'CloseHandle'; Result = [bool]; Parameters = [type[]]@([IntPtr]) }
        )
        foreach ($signature in $signatures) {
            $method = $builder.DefinePInvokeMethod($signature.Name, 'kernel32.dll',
                $attributes, [Reflection.CallingConventions]::Standard,
                $signature.Result, $signature.Parameters,
                [Runtime.InteropServices.CallingConvention]::Winapi,
                [Runtime.InteropServices.CharSet]::Unicode)
            $method.SetImplementationFlags([Reflection.MethodImplAttributes]::PreserveSig)
        }
        $script:ConsoleApi = $builder.CreateType()
        # OPEN_EXISTING + GENERIC_WRITE. CONOUT$ is the current attached buffer,
        # not stdout (which may be NUL/a log) and never an ordinary output file.
        $script:ConsoleHandle = $script:ConsoleApi::CreateFileW(
            'CONOUT$', 0x40000000, 3, [IntPtr]::Zero, 3, 0, [IntPtr]::Zero)
    } catch {
        $script:ConsoleApi = $null
    }
}

function Write-Diagnostic([string] $Line, [switch] $AlreadyLogged) {
    $safe = Protect-Display $Line
    if (-not $AlreadyLogged) {
        try { [Console]::Out.WriteLine($safe) } catch {}
    }
    if (-not [Console]::IsOutputRedirected) { return }
    Write-ConsoleOrError $safe
}

function Write-ConsoleOrError([string] $Line) {
    $safe = Protect-Display $Line
    if ($script:ConsoleApi -and $script:ConsoleHandle -ne [IntPtr]::Zero -and
        $script:ConsoleHandle -ne [IntPtr]::new(-1)) {
        try {
            $consoleLine = $safe + "`r`n"
            [uint32] $written = 0
            if ($script:ConsoleApi::WriteConsoleW($script:ConsoleHandle, $consoleLine,
                    $consoleLine.Length, [ref] $written, [IntPtr]::Zero)) {
                $script:ConsoleWriteSucceeded = $true
                return
            }
        } catch {}
    }
    # Headless execution retains stdout/log output and also gets stderr.
    try { [Console]::Error.WriteLine($safe) } catch {}
}

function Update-LauncherTitle {
    if (-not $env:WB_DIAG_TITLE) { return }
    $title = Protect-Display $env:WB_DIAG_TITLE
    if (-not $Bootstrap) {
        foreach ($name in ($env:WB_DIAG_TITLE_PORTS -split ';')) {
            if (-not $name) { continue }
            $value = [Environment]::GetEnvironmentVariable($name)
            if ($value -match '^[0-9]{1,5}$' -and [int]$value -ge 1 -and [int]$value -le 65535) {
                $title += " $name=$value"
            }
        }
    }
    try { [Console]::Title = $title } catch {}
}

try {
    Initialize-AttachedConsole
    Update-LauncherTitle
    if ($PreparedConsole) {
        $env:WB_CONSOLE_READY = '0'
        $firstLine = $true
        try { [Console]::Title = Protect-Display $env:WB_CONSOLE_TITLE } catch {}
        foreach ($line in ($env:WB_CONSOLE_BANNER -split "`r?`n")) {
            if ($line) {
                Write-ConsoleOrError $line
                if ($firstLine) {
                    if ($script:ConsoleWriteSucceeded) { $env:WB_CONSOLE_READY = '1' }
                    $firstLine = $false
                }
            }
        }
    } elseif ($Bootstrap) {
        $command = '[launcher] command: "{0}" /d /c "{1}" [forwarded arguments: REDACTED]' -f
            $env:ComSpec, $env:WB_DIAG_BOOTSTRAP_SCRIPT
        if ($ServiceCommand) {
            $command = '[launcher] command: "{0}" /d /c "{1}" {2}' -f
                (Protect-Display $env:ComSpec), (Protect-Display $env:WB_DIAG_BOOTSTRAP_SCRIPT),
                (Format-CommandDetail '{WB_DIAG_BOOTSTRAP_HOST} {WB_DIAG_BOOTSTRAP_PORT}')
            if ($env:WB_DIAG_BOOTSTRAP_EXTRA) {
                $command += ' ' + (Format-CommandDetail '{WB_DIAG_BOOTSTRAP_EXTRA}')
            }
            $command += ' - ' + (Protect-Display $env:WB_DIAG_TITLE)
            Write-Diagnostic $command
        } else {
            # Other BAT entrypoints already wrote this first line to stdout.
            Write-Diagnostic $command -AlreadyLogged
        }
        Write-Diagnostic ('[launcher] Purpose: ' + $env:WB_DIAG_BOOTSTRAP_PURPOSE)
        Write-Diagnostic ('[launcher] CWD: ' + (Get-Location).Path)
    } else {
        $exe = Resolve-Executable $env:WB_DIAG_EXE
        $target = $env:WB_DIAG_TARGET
        if ($target) { $target = [IO.Path]::GetFullPath($target) }
        $command = '"' + (Protect-Display $exe) + '"'
        if ($target) { $command += ' "' + (Protect-Display $target) + '"' }
        Write-Diagnostic ('[launcher] execute: {0} {1}' -f $command, (Format-CommandDetail $env:WB_DIAG_DETAIL))
        foreach ($name in ($env:WB_DIAG_VARS -split ';')) {
            if (-not $name) { continue }
            $value = [Environment]::GetEnvironmentVariable($name)
            if ($name -eq 'CD') { $value = (Get-Location).Path }
            if ($name -match '(?i)password|passwd|secret|token|api_?key|authorization') {
                $value = '[REDACTED]'
            } elseif ($name -match '(?i)(python|exe|cmd)$') {
                $value = Resolve-Executable $value
            }
            Write-Diagnostic ('[launcher]   {0}={1}' -f $name, $value)
        }
    }
} catch {
    # Do not print exception messages: they can contain the unredacted input.
    Write-Diagnostic '[launcher] diagnostic unavailable; command arguments withheld.'
} finally {
    if ($script:ConsoleApi -and $script:ConsoleHandle -ne [IntPtr]::Zero -and
        $script:ConsoleHandle -ne [IntPtr]::new(-1)) {
        try { [void] $script:ConsoleApi::CloseHandle($script:ConsoleHandle) } catch {}
    }
}
if (-not $PreparedConsole) { exit 0 }
