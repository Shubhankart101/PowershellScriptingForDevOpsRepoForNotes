param(
    [ValidateSet('dev', 'test', 'prod')]
    [string]$Environment = 'dev',
    [string]$Version = '0.1.0'
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$metadata = [ordered]@{
    environment = $Environment
    version     = $Version
    commit      = $env:GITHUB_SHA
    generatedAt = (Get-Date).ToUniversalTime().ToString('o')
}

$metadata | ConvertTo-Json | Set-Content deployment-metadata.json -Encoding utf8
Write-Output ($metadata | ConvertTo-Json -Compress)
