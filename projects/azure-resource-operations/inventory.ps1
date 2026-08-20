param(
    [string]$SubscriptionId,
    [switch]$WhatIf
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

if (-not (Get-Command az -ErrorAction SilentlyContinue)) { throw 'Azure CLI is required.' }

az account set --subscription $SubscriptionId
$resources = az resource list --subscription $SubscriptionId --output json | ConvertFrom-Json

$report = $resources | Select-Object name, type, location, resourceGroup
if ($WhatIf) { $report | Format-Table; return }
$report | ConvertTo-Json -Depth 5 | Set-Content resources.json -Encoding utf8
