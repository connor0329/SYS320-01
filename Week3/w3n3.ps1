. (Join-Path $PSScriptRoot 'w3n2.ps1')

clear

$loginoutstable = Get-LogonLogoff -Days 91
$loginoutstable 

$startshuttable = Get-StartShut -Days 91
$startshuttable 