$checks = @(
    [pscustomobject]@{ Name = 'PowerShell'; Status = 'Healthy'; Detail = $PSVersionTable.PSVersion.ToString() },
    [pscustomobject]@{ Name = 'Disk'; Status = 'Review'; Detail = 'Add platform-specific disk checks' },
    [pscustomobject]@{ Name = 'Network'; Status = 'Review'; Detail = 'Add endpoint checks' }
)

$checks | Export-Csv -Path '.\health-report.csv' -NoTypeInformation
$checks | ConvertTo-Json | Set-Content '.\health-report.json' -Encoding utf8
$checks | Format-Table -AutoSize
