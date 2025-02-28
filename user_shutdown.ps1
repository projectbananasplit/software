Write-Host "Update Shudown" -ForegroundColor Yellow -BackgroundColor Black

$computerName = $env:COMPUTERNAME
$targetComputerNames = @(
    "M-CW-MS01", "M-CW-MS02", "M-CW-MS03",
    "M-CW-MS16", "M-CW-MS17", "M-CW-MS18", "M-CW-MS19", "M-CW-MS20", "M-CW-MS21", "M-CW-MS22", "M-CW-MS23", "M-CW-MS24", "M-CW-MS25", "M-CW-MS26",
    "MUC-LEARN01", "MUC-LEARN02", "MUC-LEARN03", "MUC-LEARN04", "MUC-LEARN05", "MUC-LEARN06", "MUC-LEARN07", "MUC-LEARN08", "MUC-LEARN09", "MUC-LEARN10", "MUC-LEARN11"
)

if ($targetComputerNames -contains $computerName)
{
    Write-Output "💡 The computer is test pc for automatic shutdown."
    schtasks /create /sc DAILY /st 20:00 /tn "PopupShutdown5Min" /tr "msg * /TIME:300 'PC fährt herunter in 5 Minuten! Bitte Arbeit speichern!
PC does shutdown in 5 minutes! Please save your work!'" /f
    schtasks /delete /tn "Shutdown" /f
    #schtasks /create /sc DAILY /st 20:06 /tn "Shutdown" /tr "shutdown.exe /s /f /d p:4:1 /t 90 /c 'PC fährt herunter! PC shutdown! 1 Minute!'" /f
    $action = New-ScheduledTaskAction -Execute "shutdown.exe" -Argument '/s /f /d p:4:1 /t 90 /c "PC fährt herunter! PC shutdown! 1 Minute!"'
    $trigger = New-ScheduledTaskTrigger -Daily -At "20:06"
    $settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -WakeToRun
    Register-ScheduledTask -TaskName "Shutdown" -Action $action -Trigger $trigger -Settings $settings
}
else
{
    schtasks /delete /tn "PopupShutdown5Min" /f
    schtasks /delete /tn "Shutdown" /f
}
