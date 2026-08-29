# ============================================================
# PowerShell Profile
# ============================================================
# Reload:
#   reload
#
# Edit:
#   edit-profile
# ============================================================


# ============================================================
# Environment
# ============================================================

$env:EDITOR = "code"
$env:VISUAL = "code"
$env:PYTHONUTF8 = "1"


# ============================================================
# Oh My Posh
# ============================================================

oh-my-posh init pwsh `
    --config "$HOME\pure.omp.json" |
    Invoke-Expression


# ============================================================
# PSReadLine
# ============================================================
# No Get-Module -ListAvailable scan.
# PowerShell can autoload PSReadLine when these commands are used.

Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

Set-PSReadLineKeyHandler `
    -Key UpArrow `
    -Function HistorySearchBackward

Set-PSReadLineKeyHandler `
    -Key DownArrow `
    -Function HistorySearchForward

Set-PSReadLineKeyHandler `
    -Key Tab `
    -Function MenuComplete

Set-PSReadLineKeyHandler `
    -Key Ctrl+l `
    -Function ClearScreen


# ============================================================
# Terminal Icons
# ============================================================

Import-Module Terminal-Icons -ErrorAction SilentlyContinue


# ============================================================
# Zoxide
# ============================================================

if (Get-Command zoxide -ErrorAction SilentlyContinue) {
    zoxide init powershell |
        Out-String |
        Invoke-Expression
}


# ============================================================
# PSFzf
# ============================================================
# PSFzf requires the fzf executable.

if (Get-Command fzf -ErrorAction SilentlyContinue) {

    Import-Module PSFzf -ErrorAction SilentlyContinue

    if (Get-Command Set-PsFzfOption -ErrorAction SilentlyContinue) {
        Set-PsFzfOption `
            -PSReadlineChordReverseHistory "Ctrl+r" `
            -PSReadlineChordProvider "Ctrl+t"
    }
}


# ============================================================
# Directory Navigation
# ============================================================

function home {
    Set-Location $HOME
}

function docs {
    Set-Location "$HOME\Documents"
}

function dl {
    Set-Location "$HOME\Downloads"
}

function desktop {
    Set-Location "$HOME\Desktop"
}

function projects {

    $projectPath = "$HOME\Projects"

    if (Test-Path $projectPath) {
        Set-Location $projectPath
    }
    else {
        Write-Warning "Projects directory does not exist: $projectPath"
    }
}

function c.. {
    Set-Location ..
}

function c... {
    Set-Location ../..
}


# ============================================================
# Directory Listing
# ============================================================

function ll {
    Get-ChildItem -Force |
        Format-Table Mode, LastWriteTime, Length, Name -AutoSize
}

function la {
    Get-ChildItem -Force
}

function lsd {
    Get-ChildItem -Directory
}


# ============================================================
# File Utilities
# ============================================================

function touch {

    param(
        [Parameter(Mandatory)]
        [string]$Path
    )

    if (Test-Path $Path) {
        (Get-Item $Path).LastWriteTime = Get-Date
    }
    else {
        New-Item `
            -ItemType File `
            -Path $Path |
            Out-Null
    }
}


# ============================================================
# Git
# ============================================================

function gst {
    git status
}

function gaa {
    git add .
}

function ga {

    param(
        [Parameter(Mandatory)]
        [string[]]$Path
    )

    git add @Path
}

function gpl {
    git pull
}

function gps {
    git push
}

function gd {
    git diff
}

function gds {
    git diff --staged
}

function gb {
    git branch
}

function gba {
    git branch -a
}

function gl {
    git log `
        --oneline `
        --graph `
        --decorate `
        --all
}

function gl10 {
    git log `
        --oneline `
        --graph `
        --decorate `
        -10
}

function gsw {

    param(
        [Parameter(Mandatory)]
        [string]$Branch
    )

    git switch $Branch
}

function gnew {

    param(
        [Parameter(Mandatory)]
        [string]$Branch
    )

    git switch -c $Branch
}

function gcm {

    param(
        [Parameter(Mandatory)]
        [string]$Message
    )

    git commit -m $Message
}

function gca {

    param(
        [Parameter(Mandatory)]
        [string]$Message
    )

    git commit -am $Message
}

function gundo {
    git reset --soft HEAD~1
}

function groot {

    $root = git rev-parse --show-toplevel 2>$null

    if ($LASTEXITCODE -eq 0) {
        Set-Location $root
    }
    else {
        Write-Warning "Not inside a Git repository."
    }
}


# ============================================================
# Developer Utilities
# ============================================================

function which {

    param(
        [Parameter(Mandatory)]
        [string]$Command
    )

    Get-Command $Command
}


function path {
    $env:PATH -split [IO.Path]::PathSeparator
}


function ports {

    Get-NetTCPConnection `
        -State Listen `
        -ErrorAction SilentlyContinue |
        Sort-Object LocalPort |
        Select-Object LocalAddress, LocalPort, OwningProcess
}


function ports-with-process {

    Get-NetTCPConnection `
        -State Listen `
        -ErrorAction SilentlyContinue |
        Sort-Object LocalPort |
        ForEach-Object {

            $process = Get-Process `
                -Id $_.OwningProcess `
                -ErrorAction SilentlyContinue

            [PSCustomObject]@{
                Address = $_.LocalAddress
                Port    = $_.LocalPort
                PID     = $_.OwningProcess
                Process = $process.ProcessName
            }
        } |
        Format-Table -AutoSize
}


function myip {

    try {
        Invoke-RestMethod "https://api.ipify.org"
    }
    catch {
        Write-Warning "Unable to retrieve public IP address."
    }
}


function disk {

    Get-PSDrive -PSProvider FileSystem |
        Select-Object `
            Name,
            @{
                Name = "UsedGB"
                Expression = {
                    [math]::Round($_.Used / 1GB, 2)
                }
            },
            @{
                Name = "FreeGB"
                Expression = {
                    [math]::Round($_.Free / 1GB, 2)
                }
            }
}


# ============================================================
# JSON Utilities
# ============================================================

function json {

    param(
        [Parameter(ValueFromPipeline)]
        $InputObject
    )

    process {
        $InputObject |
            ConvertTo-Json -Depth 20
    }
}


function prettyjson {

    param(
        [Parameter(Mandatory)]
        [string]$Path
    )

    Get-Content `
        -Raw `
        -Path $Path |
        ConvertFrom-Json |
        ConvertTo-Json -Depth 100
}


# ============================================================
# Modern CLI Utilities
# ============================================================

function view {

    param(
        [Parameter(Mandatory)]
        [string]$Path
    )

    bat $Path
}


# ============================================================
# Profile Utilities
# ============================================================

function reload {
    . $PROFILE
}


function edit-profile {

    if (Get-Command code -ErrorAction SilentlyContinue) {
        code $PROFILE
    }
    else {
        notepad $PROFILE
    }
}


function show-profile {
    Get-Content $PROFILE
}


function profile-path {
    $PROFILE
}


# ============================================================
# System Utilities
# ============================================================

function uptime {

    $os = Get-CimInstance Win32_OperatingSystem
    $boot = $os.LastBootUpTime
    $elapsed = (Get-Date) - $boot

    [PSCustomObject]@{
        BootTime = $boot
        Days     = $elapsed.Days
        Hours    = $elapsed.Hours
        Minutes  = $elapsed.Minutes
    }
}


function sysinfo {

    $os = Get-CimInstance Win32_OperatingSystem

    $cpu = Get-CimInstance Win32_Processor |
        Select-Object -First 1

    [PSCustomObject]@{
        Computer   = $env:COMPUTERNAME
        User       = $env:USERNAME
        PowerShell = $PSVersionTable.PSVersion
        OS         = $os.Caption
        CPU        = $cpu.Name
        RAM_GB     = [math]::Round(
            $os.TotalVisibleMemorySize / 1MB,
            1
        )
    }
}
