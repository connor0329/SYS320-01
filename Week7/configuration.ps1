
function readConfiguration {
    $content = Get-Content "configuration.txt"
    $days = $content[0]
    $time = $content[1]

    return [pscustomobject]@{Days = $days
                             ExecutionTime= $time}                                        
}



function changeConfiguration { 
     $days = Read-Host -Prompt "Number of Days"
     $time = Read-Host -Prompt "Time (Ex: 1:29 PM/AM)"
     $regex = "^[0-9]{1,2}:[0-9]{2}\s(AM|PM)$"

     if($days -match "^[0-9]+$"){

     }
     else{
        Write-Host "Please enter a valid number (0-9)"
        return
     }

     if($time -match $regex){

     }
     else{
        Write-Host "Please Enter a Valid Time (Ex: 1:29 PM/AM)"
        return
     }

     Set-Content -Path "configuration.txt" -Value @($days, $time)  
}


function configurationMenu{
$Prompt = "`n"
$Prompt += "Please Chose Your Operation:`n"
$Prompt += "1 - Show Configuration`n"
$Prompt += "2 - Change Configuration`n"
$Prompt += "3 - Exit`n"

$operation = $true

while($operation){

    Write-Host $Prompt | Out-String
    $choice = Read-Host

    if($choice -eq 3){
        Write-Host "Goodbye" | Out-String
        exit 
        $operation = $false
    }
    
    elseif($choice -eq 1){
        $showconfig = readConfiguration
        Write-Host ($showconfig | Format-Table | Out-String)
    }

     elseif($choice -eq 2){
        changeConfiguration
    }

     else {
         Write-Host "Please select a valid number (1-3)"
         continue
    }

  }
}


