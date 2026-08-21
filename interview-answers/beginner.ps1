Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Get-LogLevelCounts {
    param([object[]]$Records)
    $Records | Group-Object Level | Sort-Object Name | ForEach-Object {
        [pscustomobject]@{ Level = $_.Name; Count = $_.Count }
    }
}

function Get-RequiredEnvironment {
    param([Parameter(Mandatory)][ValidateSet('dev','test','prod')][string]$Environment)
    [pscustomobject]@{ Environment = $Environment; Valid = $true }
}

Get-LogLevelCounts @(
    [pscustomobject]@{ Level = 'INFO' }
    [pscustomobject]@{ Level = 'ERROR' }
    [pscustomobject]@{ Level = 'INFO' }
)
Get-RequiredEnvironment -Environment dev
