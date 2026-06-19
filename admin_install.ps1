###########################################################################################################
# --- Helper: Ensure registry path exists ---
function Ensure-Key($path) {
    if (!(Test-Path $path)) {
        New-Item -Path $path -Force | Out-Null
    }
}

###########################################################################################################
Write-Host "Set activity time"
$regPath = "HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\AU"
Ensure-Key $regPath
New-ItemProperty -Path $regPath -Name "AUOptions" -Value 4 -PropertyType DWORD -Force | Out-Null  # 4 = Auto download & schedule install
$regPath = "HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate"
Ensure-Key $regPath
New-ItemProperty -Path $regPath -Name "SetActiveHours" -Value 1 -PropertyType DWORD -Force | Out-Null
New-ItemProperty -Path $regPath -Name "ActiveHoursStart" -Value 8 -PropertyType DWORD -Force | Out-Null
New-ItemProperty -Path $regPath -Name "ActiveHoursEnd" -Value 20 -PropertyType DWORD -Force | Out-Null
New-ItemProperty -Path $regPath -Name "NoUpdateNotificationsDuringActiveHours" -Value 1 -PropertyType DWORD -Force | Out-Null
# Set UX active hours.
$regPath = "HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings"
Ensure-Key $regPath
New-ItemProperty -Path $regPath -Name "ActiveHoursStart" -Value 8 -PropertyType DWORD -Force | Out-Null
New-ItemProperty -Path $regPath -Name "ActiveHoursEnd" -Value 20 -PropertyType DWORD -Force | Out-Null
###########################################################################################################
###########################################################################################################
#Write-Host "Specific stuff"
#
#$computerName = $env:COMPUTERNAME
#$targetComputerNames = @(
#    "M-CW-MS16", "M-CW-MS17", "M-CW-MS18", "M-CW-MS19",
#    "M-CW-MS20", "M-CW-MS21", "M-CW-MS22", "M-CW-MS23", "M-CW-MS24", "M-CW-MS25",
#    "END"
#)
#
#if ($targetComputerNames -contains $computerName)
#{
#    Write-Host "Check VCarve ... " -NoNewline
#    $infoFileVCarve = "C:\Program Files\VCarve Pro Trial Edition 12.0\ProductInfo.ini"
#    $versionVCarve = Get-Content -Path $infoFileVCarve
#    $outdatedVCarve = $versionVCarve | Where-Object { $_ -eq "product_version=12.0.0.9" }
#    Write-Host ""
#    if ($outdatedVCarve)
#    {
#        # Your specific code here
#        Write-Host " VCarve Trial outdated."
#        Write-Host " Start update"
#
#        Invoke-WebRequest -Uri "https://storage.googleapis.com/vectric_public/VCarveProTrialEdition_Setup.exe" -OutFile "vcarvetrial.exe"
#        Start-Process -FilePath "vcarvetrial.exe" -ArgumentList "/S" -Wait
#        Remove-Item -Path "vcarvetrial.exe"
#        Write-Host " End update"
#    }
#}

Start-Sleep -Seconds 6
