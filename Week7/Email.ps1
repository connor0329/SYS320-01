function SendAlertEmail($Body){

$From = "connor.mccracken@mymail.champlain.edu"
$To = "connor.mccracken@mymail.champlain.edu"
$Subject = "Suspicious Activity"

$Password = "swxygvskhtcyxhyf" | ConvertTo-SecureString -AsPlainText -Force
$Credential = New-Object -TypeName System.Management.Automation.PSCredential -Argument $From, $Password

Send-MailMessage -From $From -To $To -Subject $Subject -Body $Body -SmtpServer "smtp.gmail.com" `
-port 587 -UseSsl -Credential $Credential

}

SendAlertEmail "Body of email"