param(
    [string]$OutputPath = '.\incident-report.json',
    [int]$Minutes = 30
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$report = [ordered]@{
    generatedAt = (Get-Date).ToUniversalTime().ToString('o')
    windowMinutes = $Minutes
    computer = $env:COMPUTERNAME
    powershell = $PSVersionTable.PSVersion.ToString()
    processes = @(Get-Process | Sort-Object CPU -Descending | Select-Object -First 10 Name, Id, CPU)
}

$report | ConvertTo-Json -Depth 5 | Set-Content $OutputPath -Encoding utf8
Write-Output "Diagnostic report written to $OutputPath"
