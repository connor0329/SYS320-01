function Get-LogonLogoff {
    param (
        [int]$Days
    )

    $loginouts = Get-EventLog System -source Microsoft-Windows-Winlogon -After (Get-Date).AddDays(-$Days)

    $loginoutstable = @()
    for($i=0; $i -lt $loginouts.Count; $i++){

        $event= ""
        if($loginouts[$i].InstanceID -eq 7001) {$event="Logon"}
        if($loginouts[$i].InstanceID -eq 7002) {$event="Logoff"}

        $sidstring = $loginouts[$i].ReplacementStrings[1]
        $sid = New-Object System.Security.Principal.SecurityIdentifier($sidstring)
        $ntaccount = $sid.Translate([System.Security.Principal.NTAccount])
        $user = $ntaccount.Value
 
        $loginoutstable += [pscustomobject]@{"Time" = $loginouts[$i].TimeGenerated
			                   "Id" = $loginouts[$i].InstanceID
                                        "Event" = $event
 				         "User" = $user
			                 }

        }

        return $loginoutstable
}

#

function Get-StartShut {
    param (
        [int]$Days
    )


    $startshut = Get-EventLog System -source EventLog -After (Get-Date).AddDays(-$Days) | Where-Object { $_.EventID -in 6005, 6006 }

    $startshuttable = @()
    for($j=0; $j -lt $startshut.Count; $j++){ 
    
        $event1= ""
        if($startshut[$j].EventID -eq 6005) {$event1="Startup"}
        if($startshut[$j].EventID -eq 6006) {$event1="Shutdown"}

        $user1 = "System"

        $startshuttable += [pscustomobject]@{"Time" = $startshut[$j].TimeGenerated
                                                "Id" = $startshut[$j].EventID
                                             "Event" = $event1
                                              "User" = $user1
                                              }

        }

        return $startshuttable
}

