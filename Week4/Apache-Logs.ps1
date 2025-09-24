function Get-ApacheIPs {
    param (
        [string]$page,
        [string]$code,
        [string]$browser

    )

    $logs = Get-content C:\xampp\apache\logs\access.log
 
    $filtered = $logs | Where-Object { $_ -like "*$page*" -and $_ -like "*$code*" -and $_ -like "*$browser*" }

    $regex = [regex] "\d{1,3}(\.\d{1,3}){3}"
    
    $ipsUnorganized  = $regex.Matches($filtered) 
    
    $ips = @()
    for($i=0; $i -lt $ipsUnorganized.Count; $i++){
     $ips += [pscustomobject]@{ "IP" = $ipsUnorganized[$i].Value }
   }
    $count = $ips | Group-Object IP | Select-Object Count, Name
    return $count
   
   
}

