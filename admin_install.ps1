

###########################################################################################################
Write-Host "Set activity time"


$edgePolicyPath = "HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate"

# Create policy path if missing
If (!(Test-Path $edgePolicyPath)) {
    New-Item -Path $edgePolicyPath -Force | Out-Null
}

# 1. Disable Microsoft Account Sign-in
New-ItemProperty -Path $edgePolicyPath -Name "ActiveHoursStart" -Value 8 -PropertyType DWORD -Force | Out-Null
New-ItemProperty -Path $edgePolicyPath -Name "ActiveHoursEnd" -Value 20 -PropertyType DWORD -Force | Out-Null
New-ItemProperty -Path $edgePolicyPath -Name "NoUpdateNotificationsDuringActiveHours" -Value 1 -PropertyType DWORD -Force | Out-Null

###########################################################################################################

$computerName = $env:COMPUTERNAME
$targetComputerNames = @(
    "M-CW-MS16", "M-CW-MS17", "M-CW-MS18", "M-CW-MS19",
    "M-CW-MS20", "M-CW-MS21", "M-CW-MS22", "M-CW-MS23", "M-CW-MS24", "M-CW-MS25",
    "END"
)

if ($targetComputerNames -contains $computerName)
{
    Write-Host "Check VCarve ... " -NoNewline
    $infoFileVCarve = "C:\Program Files\VCarve Pro Trial Edition 12.0\ProductInfo.ini"
    $versionVCarve = Get-Content -Path $infoFileVCarve
    $outdatedVCarve = $versionVCarve | Where-Object { $_ -eq "product_version=12.0.0.9" }
    Write-Host ""
    if ($outdatedVCarve)
    {
        # Your specific code here
        Write-Host " VCarve Trial outdated."
        Write-Host " Start update"

        Invoke-WebRequest -Uri "https://storage.googleapis.com/vectric_public/VCarveProTrialEdition_Setup.exe" -OutFile "vcarvetrial.exe"
        Start-Process -FilePath "vcarvetrial.exe" -ArgumentList "/S" -Wait
        Remove-Item -Path "vcarvetrial.exe"
        Write-Host " End update"
    }
}


Start-Sleep -Seconds 60
