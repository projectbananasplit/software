Write-Host "Update Notifications" -ForegroundColor Green -BackgroundColor Gray

$computerName = $env:COMPUTERNAME
$targetComputerName = "M-CW-MS02"

if ($computerName -eq $targetComputerName)
{
    Write-Output "💡 The computer is test pc."
    schtasks /create /sc DAILY /st 19:45 /tn "PopupOeffnungszeitEnde" /tr "msg * /TIME:300 'Wir schließen in 15 Minuten! Bitte aufräumen!
We are closing in 15 minutes! Please start cleaning!'" /f
}
