Set-StrictMode -Version Latest

function Write-DevOpsLog {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)] [string]$Message,
        [ValidateSet('Info', 'Warning', 'Error')] [string]$Level = 'Info'
    )

    $timestamp = Get-Date -Format o
    Write-Host "[$timestamp][$Level] $Message"
}

function Test-CommandAvailable {
    [CmdletBinding()]
    param([Parameter(Mandatory)] [string]$Name)

    return $null -ne (Get-Command $Name -ErrorAction SilentlyContinue)
}

Export-ModuleMember -Function Write-DevOpsLog, Test-CommandAvailable
