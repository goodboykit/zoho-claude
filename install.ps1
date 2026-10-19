# Windows version of install.sh. Run it after cloning this repo:
#   powershell -ExecutionPolicy Bypass -File install.ps1
# Copies the global rules and agents into ~/.claude and points them at this folder.
# Backs up anything it replaces. The repo's own files keep their Mac paths.
$ErrorActionPreference = 'Stop'
$Repo = $PSScriptRoot -replace '\\', '/'
$OldPath = '/Users/goodboykit/zoho-claude'
$Claude = Join-Path $env:USERPROFILE '.claude'
$Agents = Join-Path $Claude 'agents'
$Stamp = Get-Date -Format 'yyyyMMdd-HHmmss'
$Utf8 = New-Object System.Text.UTF8Encoding($false)

New-Item -ItemType Directory -Force $Agents | Out-Null

function Install-File($From, $To) {
    if (Test-Path $To) {
        Copy-Item $To "$To.backup-$Stamp"
        Write-Host "Backed up your old $To"
    }
    $Text = [IO.File]::ReadAllText($From).Replace($OldPath, $Repo)
    [IO.File]::WriteAllText($To, $Text, $Utf8)
}

Install-File (Join-Path $PSScriptRoot 'global\CLAUDE-global.md') (Join-Path $Claude 'CLAUDE.md')
Get-ChildItem (Join-Path $PSScriptRoot 'global\agents') -Filter *.md | ForEach-Object {
    Install-File $_.FullName (Join-Path $Agents $_.Name)
}

Write-Host "Done. Files now point to $Repo. Open a new Claude chat and ask: List my subagents."
