function Get-ApacheIPs {
    param (
        [string]$page
        [int]$code
        [int]$browser

    )

    $logs = Get-content C:\xampp\apache\logs\access.log
 
    $filtered = $logs | Where-Object { $_ -match $page }
    $filtered = $filtered | Where-Object { $_ -match $code }
    $filtered = $filtered | Where-Object { $_ -macth $browser } 

    $regex = [regex] "\d{1,3}(\.\d{1,3}){3}"
    $ips = foreach ($line in $filtered) {
        $regex.Match($line).Value
    }

    $ips | Group-Object | Select-Object Count, Name 
}


