param(
    [string]$Path = '.\sample.json'
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$data = @{
    application = 'devtrack'
    environment = 'dev'
    managedBy   = 'powershell'
}

$data | ConvertTo-Json | Set-Content -Path $Path -Encoding utf8
Get-Content -Path $Path | ConvertFrom-Json
