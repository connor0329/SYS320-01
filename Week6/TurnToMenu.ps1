. (Join-Path C:\Users\champuser\SYS320-01\Week2 pmng4.ps1)
. (Join-Path C:\Users\champuser\SYS320-01\Week6 Event-Logs.ps1)
. (Join-Path C:\Users\champuser\SYS320-01\Week4 lastApacheLogs.ps1)

$Prompt = "`n"
$Prompt += "Please Chose Your Operation:`n"
$Prompt += "1 - Display Last 10 Apache Logs`n"
$Prompt += "2 - Display Last 10 Failed Logins For All Users`n"
$Prompt += "3 - Display at Risk Users`n"
$Prompt += "4 - Champlain.edu`n"
$Prompt += "5 - Exit`n"

$operation = $true

while($operation){

    Write-Host $Prompt | Out-String
    $choice = Read-Host

    if($choice -eq 5){
        Write-Host "Goodbye" | Out-String
        exit
        $operation = $false
    }
 
    elseif($choice -eq 1){
        $apacheLogs = lastApacheLogs 
        Write-Host ($apacheLogs | Out-String)
    }

    elseif($choice -eq 2){
        $Last10 = getFailedLogins 90 | Select-Object -Last 10
        Write-Host ($Last10 | Out-String)
    }

    elseif($choice -eq 3){
        $atRisk = getFailedLogins 90 | Group-Object -Property User | Where-Object { $_.Count -gt 10 }
        Write-Host ($atRisk | Select-Object Name, Count | Format-Table | Out-String)
    }

    elseif($choice -eq 4){
        $startChrome = launchChrome
        $startChrome
    }

    else {
        Write-Host "Please Select a valid Option (1-5)"
        continue
    }

}  
        
