param(
    [string]$Path = '.\baseline.json'
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$baseline = if (Test-Path $Path) { Get-Content $Path -Raw | ConvertFrom-Json } else { [pscustomobject]@{ requiredPowerShellMajor = 7 } }
$currentMajor = $PSVersionTable.PSVersion.Major

[pscustomobject]@{
    check = 'PowerShell major version'
    expected = $baseline.requiredPowerShellMajor
    actual = $currentMajor
    compliant = $currentMajor -ge $baseline.requiredPowerShellMajor
} | ConvertTo-Json
