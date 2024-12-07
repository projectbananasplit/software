Write-Host "Update Wallpaper" -ForegroundColor Yellow -BackgroundColor Black

$computerName = $env:COMPUTERNAME
$targetComputerNames = @(
    "M-CW-MS01", "M-CW-MS02", "M-CW-MS03", "M-CW-MS25",
    "MUC-LAS01", "MUC-LAS02", "MUC-LAS03", "MUC-LEARN11"
)

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
    Write-Host "Force dark theme."
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "AppsUseLightTheme" -Value 0
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "SystemUsesLightTheme" -Value 0

    $WallpaperPath = "$env:USERPROFILE\Pictures\wallpaper.png"
    $Url = "https://github.com/projectbananasplit/assets/raw/refs/heads/main/wallpaper/ms_default.png"

    Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;
public class ScreenResolution {
    [DllImport("user32.dll")]
    public static extern int GetSystemMetrics(int nIndex);
}
"@

    $width = [ScreenResolution]::GetSystemMetrics(0)
    $height = [ScreenResolution]::GetSystemMetrics(1)
    Write-Output "Current Resolution: ${width}x${height}"

    Invoke-WebRequest -Uri $Url -OutFile $WallpaperPath
    Write-Host -ForegroundColor Yellow "Image downloaded to $WallpaperPath"

    Set-Wallpaper -Path $WallpaperPath
}
