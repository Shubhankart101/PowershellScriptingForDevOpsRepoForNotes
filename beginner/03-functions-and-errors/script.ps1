function Invoke-SafeOperation {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [scriptblock]$Operation
    )

    try {
        & $Operation
    }
    catch {
        Write-Error "Operation failed: $($_.Exception.Message)"
        throw
    }
}

Invoke-SafeOperation -Operation { 'operation completed' }
