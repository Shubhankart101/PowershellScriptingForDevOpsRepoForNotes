Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Invoke-WithRetry {
    param([Parameter(Mandatory)][scriptblock]$Action, [int]$Attempts = 3)
    for ($attempt = 1; $attempt -le $Attempts; $attempt++) {
        try { return (& $Action) }
        catch {
            if ($attempt -eq $Attempts) { throw }
            Start-Sleep -Seconds ([math]::Pow(2, $attempt - 1))
        }
    }
}

function Get-PagedItems {
    param([Parameter(Mandatory)][scriptblock]$Request)
    $items = [System.Collections.Generic.List[object]]::new()
    $page = 1
    do {
        $response = & $Request $page
        $response.items | ForEach-Object { $items.Add($_) }
        $page = $response.nextPage
    } while ($null -ne $page)
    $items
}

Invoke-WithRetry { 'retryable result' }
