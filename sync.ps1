# Windows version of sync.sh. Back up the latest setup to GitHub:
#   powershell -ExecutionPolicy Bypass -File sync.ps1
# Copies the global rules and agents from ~/.claude into this repo (switching paths
# back to the Mac form the repo uses), then commits and pushes.
$ErrorActionPreference = 'Stop'
Set-Location $PSScriptRoot
$Repo = $PSScriptRoot -replace '\\', '/'
$OldPath = '/Users/goodboykit/zoho-claude'
$Claude = Join-Path $env:USERPROFILE '.claude'
$Utf8 = New-Object System.Text.UTF8Encoding($false)

function Save-File($From, $To) {
    $Text = [IO.File]::ReadAllText($From).Replace($Repo, $OldPath)
    [IO.File]::WriteAllText($To, $Text, $Utf8)
}

Save-File (Join-Path $Claude 'CLAUDE.md') (Join-Path $PSScriptRoot 'global\CLAUDE-global.md')
New-Item -ItemType Directory -Force 'global\agents' | Out-Null
Get-ChildItem (Join-Path $Claude 'agents') -Filter *.md | ForEach-Object {
    Save-File $_.FullName (Join-Path $PSScriptRoot "global\agents\$($_.Name)")
}

git add -A
git diff --cached --quiet
if ($LASTEXITCODE -eq 0) {
    Write-Host 'Nothing changed. GitHub is already up to date.'
    exit 0
}

git commit -m "Update setup ($(Get-Date -Format 'yyyy-MM-dd'))"
git push
Write-Host 'Done. Your setup is backed up on GitHub.'
