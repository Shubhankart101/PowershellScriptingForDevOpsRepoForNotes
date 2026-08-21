Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Invoke-HealthGatedDeployment {
    param([Parameter(Mandatory)][string]$Release, [Parameter(Mandatory)][scriptblock]$Deploy, [Parameter(Mandatory)][scriptblock]$Health, [Parameter(Mandatory)][scriptblock]$Rollback)
    & $Deploy $Release
    try {
        if (-not (& $Health)) { throw "Health check failed for $Release" }
        [pscustomobject]@{ Release = $Release; Status = 'Succeeded' }
    }
    catch {
        & $Rollback $Release
        [pscustomobject]@{ Release = $Release; Status = 'RolledBack'; Error = $_.Exception.Message }
    }
}

Invoke-HealthGatedDeployment -Release '1.2.3' -Deploy { param($r) "deploy $r" } -Health { $true } -Rollback { param($r) "rollback $r" }
