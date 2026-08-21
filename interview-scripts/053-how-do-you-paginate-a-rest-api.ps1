# Question 53: How do you paginate a REST API?
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Invoke-Solution {
    param([Parameter(Mandatory)][object[]]$InputData)
    if ($InputData.Count -eq 0) { return @() }
    $InputData | Group-Object -Property Level | ForEach-Object {
        [pscustomobject]@{ Level = $_.Name; Count = $_.Count }
    }
}

Invoke-Solution -InputData @([pscustomobject]@{ Level = 'INFO' }, [pscustomobject]@{ Level = 'ERROR' })