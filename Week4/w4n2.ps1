$notfounds = Get-Content C:\xampp\apache\logs\access.log | Select-String '404'

$regex = [regex] "\d{1,3}(\.\d{1,3}){3}"

$ipsUnorganized = $regex.Matches($notfounds)

$ips = @()
for($i=0; $i -lt $ipsUnorganized.Count; $i++){
 $ips += [pscustomobject]@{ "IP" =$ipsUnorganized[$i].Value; }
} 
#$ips | Where-Object { $_.IP -ilike "10.*" }

$ipsoften = $ips | Where-Object { $_.IP -ilike "10.*" }
$count = $ipsoften | Group-Object IP
$count | Select-Object Count, Name