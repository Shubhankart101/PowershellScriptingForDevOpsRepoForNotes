param(
    [string]$Name = 'DevOps engineer'
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$message = "Hello, $Name"
$timestamp = Get-Date -Format 'yyyy-MM-dd HH:mm:ss'

[pscustomobject]@{
    Message   = $message
    Timestamp = $timestamp
}
