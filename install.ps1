<#
.SYNOPSIS
    Project Forge OS installer.

.DESCRIPTION
    Run this from inside a cloned (ideally forked) copy of the Project Forge
    OS repo. It does two things:

    1. Installs the 12 skills into your coding agent — via the `skills` CLI
       if Node/npx is available, otherwise by copying the skill folders
       directly from this repo.
    2. Registers this repo's path as FORGE_OS_HOME (a per-user environment
       variable), so `init-project`, `doctor`, and every other skill can find
       `templates/` and `memory/` without being told where they are.

    Everything here is scoped to your user profile: no system-wide changes,
    no servers, no services installed. Safe to re-run any time — it's
    idempotent.

.PARAMETER Scope
    'Global' (default) installs skills to ~/.claude/skills, available to
    every project. 'Project' installs to .claude/skills under -TargetPath.

.PARAMETER Agent
    The agent to install skills for, passed through to the skills CLI.
    Default: claude-code.

.PARAMETER TargetPath
    Only used when -Scope Project. Defaults to the current directory.

.PARAMETER Force
    Skip the confirmation prompt when FORGE_OS_HOME already points at a
    different Forge OS repo, and repoint it at this one.

.EXAMPLE
    .\install.ps1
    Installs skills globally for Claude Code and connects this repo.

.EXAMPLE
    .\install.ps1 -Scope Project -TargetPath C:\dev\my-app
    Installs skills into one project instead of every project.
#>

[CmdletBinding()]
param(
    [ValidateSet('Global', 'Project')]
    [string]$Scope = 'Global',

    [string]$Agent = 'claude-code',

    [string]$TargetPath = (Get-Location).Path,

    [switch]$Force
)

function Write-Step {
    param([string]$Message)
    Write-Host "`n==> $Message" -ForegroundColor Cyan
}

$RepoRoot = if ($PSScriptRoot) { $PSScriptRoot } else { (Get-Location).Path }

Write-Host "Project Forge OS - Installer" -ForegroundColor Green
Write-Host "Repo root: $RepoRoot"

# ---------------------------------------------------------------------------
# 1. Validate this is really a Forge OS repo
# ---------------------------------------------------------------------------
Write-Step "Checking repo structure"

$requiredPaths = @(
    (Join-Path $RepoRoot 'skills'),
    (Join-Path (Join-Path $RepoRoot 'templates') 'project'),
    (Join-Path $RepoRoot 'memory')
)
$missing = $requiredPaths | Where-Object { -not (Test-Path $_) }
if ($missing) {
    throw "This doesn't look like a Project Forge OS repo - missing: $($missing -join ', '). Run install.ps1 from the root of your cloned/forked repo."
}
Write-Host "  skills/, templates/project/, memory/ all present." -ForegroundColor Green

# ---------------------------------------------------------------------------
# 2. Resolve the skill install target
# ---------------------------------------------------------------------------
if ($Scope -eq 'Global') {
    $SkillsTarget = Join-Path $env:USERPROFILE '.claude\skills'
} else {
    $SkillsTarget = Join-Path $TargetPath '.claude\skills'
}
New-Item -ItemType Directory -Force -Path $SkillsTarget | Out-Null

# ---------------------------------------------------------------------------
# 3. Install skills - prefer the skills CLI, fall back to a direct copy
# ---------------------------------------------------------------------------
Write-Step "Installing skills ($Scope scope, agent: $Agent)"

$skillsInstalled = $false
$npxCmd = Get-Command npx -ErrorAction SilentlyContinue

if ($npxCmd) {
    # Install from THIS local repo, not from GitHub — the whole point of
    # forking first is that your fork (and any local edits) is what gets
    # installed, not upstream's copy.
    $cliArgs = @('skills', 'add', $RepoRoot, '-a', $Agent, '-y')
    if ($Scope -eq 'Global') { $cliArgs += '-g' }
    Write-Host "  Running: npx $($cliArgs -join ' ')"

    & npx @cliArgs

    if ($LASTEXITCODE -eq 0) {
        $skillsInstalled = $true
    } else {
        Write-Warning "skills CLI exited with code $LASTEXITCODE - falling back to a direct copy from this repo."
    }
} else {
    Write-Host "  npx not found - copying skill folders directly instead." -ForegroundColor Yellow
}

if (-not $skillsInstalled) {
    Get-ChildItem (Join-Path $RepoRoot 'skills') -Directory | ForEach-Object {
        $dest = Join-Path $SkillsTarget $_.Name
        Copy-Item $_.FullName $dest -Recurse -Force
        Write-Host "  + $($_.Name)"
    }
    $skillsInstalled = $true
}

Write-Host "Skills installed to: $SkillsTarget" -ForegroundColor Green

# ---------------------------------------------------------------------------
# 4. Register this repo as FORGE_OS_HOME
# ---------------------------------------------------------------------------
Write-Step "Connecting Forge Memory and templates"

$existing = [Environment]::GetEnvironmentVariable('FORGE_OS_HOME', 'User')

if ($existing -and ($existing -ne $RepoRoot) -and -not $Force) {
    Write-Warning "FORGE_OS_HOME is currently set to:`n    $existing`n  which is a different Forge OS repo than this one:`n    $RepoRoot"
    $answer = Read-Host "Point FORGE_OS_HOME at this repo instead? (y/N)"
    if ($answer -match '^[Yy]') {
        [Environment]::SetEnvironmentVariable('FORGE_OS_HOME', $RepoRoot, 'User')
        $env:FORGE_OS_HOME = $RepoRoot
        Write-Host "FORGE_OS_HOME updated to $RepoRoot" -ForegroundColor Green
    } else {
        Write-Host "Left FORGE_OS_HOME pointing at $existing. New projects will connect to that install, not this one." -ForegroundColor Yellow
    }
} else {
    [Environment]::SetEnvironmentVariable('FORGE_OS_HOME', $RepoRoot, 'User')
    $env:FORGE_OS_HOME = $RepoRoot
    Write-Host "FORGE_OS_HOME set to $RepoRoot" -ForegroundColor Green
}

# ---------------------------------------------------------------------------
# 5. Summary
# ---------------------------------------------------------------------------
$finalHome = [Environment]::GetEnvironmentVariable('FORGE_OS_HOME', 'User')

Write-Host "`n=== Project Forge OS is installed ===" -ForegroundColor Green
Write-Host "Skills:      $SkillsTarget"
Write-Host "Forge repo:  $finalHome"
Write-Host "`nNext steps:"
Write-Host "  1. Restart Claude Code (or reload the window) so it picks up the skills."
Write-Host "  2. In any project, run /init-project - it will find this repo automatically."
Write-Host "  3. Run /doctor any time to verify skills and memory are connected."
