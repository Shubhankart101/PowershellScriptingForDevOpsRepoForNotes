param(
    [ValidateSet('dev', 'test', 'prod')]
    [string]$Environment = 'dev'
)

$variables = @{
    environment = $Environment
    startedAt   = (Get-Date).ToUniversalTime().ToString('o')
}

Write-Output ($variables | ConvertTo-Json -Compress)
Write-Output "##vso[task.setvariable variable=deploymentEnvironment]$Environment"
