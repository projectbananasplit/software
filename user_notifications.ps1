Write-Host "Update Notifications" -ForegroundColor Yellow -BackgroundColor Black

$computerName = $env:COMPUTERNAME
$targetComputerNames = @("M-CW-MS01", "M-CW-MS02", "M-CW-MS03", "MUC-LAS01", "MUC-LAS02", "MUC-LAS03", "MUC-LEARN11")

function Set-Wallpaper
{
    param (
        [string]$Path
    )

    Add-Type -TypeDefinition @"
    using System;
    using System.Runtime.InteropServices;
    public class Wallpaper {
        [DllImport("user32.dll", CharSet = CharSet.Auto)]
        public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
    }
"@

    [Wallpaper]::SystemParametersInfo(0x0014, 0, $Path, 0x0001)
    Write-Host -ForegroundColor Yellow "Wallpaper updated to $Path"
}

if ($targetComputerNames -contains $computerName)
{
    Write-Output "💡 The computer is test pc for notifications."
    schtasks /delete /tn "PopupOeffnungszeitEnde" /f
    schtasks /create /sc DAILY /st 19:45 /tn "PopupOeffnungszeitEnde15Min" /tr "msg * /TIME:300 'Wir schließen in 15 Minuten! Bitte aufräumen!
We are closing in 15 minutes! Please start cleaning!'" /f
    schtasks /create /sc DAILY /st 19:55 /tn "PopupOeffnungszeitEnde5Min" /tr "msg * /TIME:300 'Wir schließen in 5 Minuten! Bitte aufräumen!
We are closing in 5 minutes! Please start cleaning!'" /f

    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "AppsUseLightTheme" -Value 0
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "SystemUsesLightTheme" -Value 0
    # Write-Host -ForegroundColor Green "Dark theme enabled."

    $WallpaperPath = "$env:USERPROFILE\Pictures\wallpaper.png"
    $Url = "https://github.com/projectbananasplit/assets/raw/refs/heads/main/wallpaper/test.png"

    Invoke-WebRequest -Uri $Url -OutFile $WallpaperPath
    Write-Host -ForegroundColor Yellow "Image downloaded to $WallpaperPath"

    Download-Image -Url $ImageUrl -Path $WallpaperPath
    Set-Wallpaper -Path $WallpaperPath
}
