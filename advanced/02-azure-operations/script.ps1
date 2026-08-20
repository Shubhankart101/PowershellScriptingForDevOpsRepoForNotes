param(
    [Parameter(Mandatory)] [string]$ResourceGroupName,
    [switch]$WhatIf
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

if (-not (Get-Command az -ErrorAction SilentlyContinue)) {
    throw 'Azure CLI is required.'
}

$arguments = @('group', 'show', '--name', $ResourceGroupName, '--output', 'json')
if ($WhatIf) { Write-Host "Would run: az $($arguments -join ' ')"; return }

az @arguments
if ($LASTEXITCODE -ne 0) { throw "Azure CLI returned exit code $LASTEXITCODE" }
