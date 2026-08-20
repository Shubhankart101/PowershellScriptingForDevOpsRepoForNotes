Set-StrictMode -Version Latest

function Invoke-WithRetry {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)] [scriptblock]$Operation,
        [int]$MaxAttempts = 4,
        [int]$InitialDelaySeconds = 2
    )

    for ($attempt = 1; $attempt -le $MaxAttempts; $attempt++) {
        try { return & $Operation }
        catch {
            if ($attempt -eq $MaxAttempts) { throw }
            Start-Sleep -Seconds ($InitialDelaySeconds * [math]::Pow(2, $attempt - 1))
        }
    }
}

function ConvertTo-StructuredLog {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)] [string]$Message,
        [ValidateSet('Information', 'Warning', 'Error')] [string]$Level = 'Information',
        [hashtable]$Properties = @{}
    )

    [pscustomobject]@{
        timestamp  = (Get-Date).ToUniversalTime().ToString('o')
        level      = $Level
        message    = $Message
        properties = $Properties
    } | ConvertTo-Json -Compress
}

Export-ModuleMember -Function Invoke-WithRetry, ConvertTo-StructuredLog
