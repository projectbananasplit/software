Write-Host "Update Notifications" -ForegroundColor Yellow -BackgroundColor Black

$computerName = $env:COMPUTERNAME
$targetComputerNames = @("M-CW-MS01", "M-CW-MS02", "M-CW-MS03", "MUC-LAS01", "MUC-LAS02", "MUC-LAS03", "MUC-LEARN11")

if ($targetComputerNames -contains $computerName)
{
    Write-Output "💡 The computer is test pc for notifications."
    schtasks /delete /tn "PopupOeffnungszeitEnde" /f
    schtasks /create /sc DAILY /st 19:45 /tn "PopupOeffnungszeitEnde15Min" /tr "msg * /TIME:300 'Wir schließen in 15 Minuten! Bitte aufräumen!
We are closing in 15 minutes! Please start cleaning!'" /f
    schtasks /create /sc DAILY /st 19:55 /tn "PopupOeffnungszeitEnde5Min" /tr "msg * /TIME:300 'Wir schließen in 5 Minuten! Bitte aufräumen!
We are closing in 5 minutes! Please start cleaning!'" /f
}
