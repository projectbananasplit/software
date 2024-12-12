Write-Host "Update Wallpaper" -ForegroundColor Yellow -BackgroundColor Black

$computerName = $env:COMPUTERNAME
$targetComputerNames = @(
    "M-CW-MS16", "M-CW-MS17", "M-CW-MS18", "M-CW-MS19", "M-CW-MS20", "M-CW-MS21", "M-CW-MS22", "M-CW-MS23", "M-CW-MS24", "M-CW-MS25", "M-CW-MS26"
)

function Get-ResultText
{
    param (
        [int]$resultCode
    )
    switch ($resultCode)
    {
        0 {
            return "Success"
        }
        1 {
            return "InProgress"
        }
        2 {
            return "SucceededWithErrors"
        }
        3 {
            return "Failed"
        }
        4 {
            return "Aborted"
        }
        default {
            return "Unknown Result Code: $resultCode"
        }
    }
}

if ($targetComputerNames -contains $computerName)
{
    # Check for updates
    Write-Output "Checking for updates..."
    $updates = New-Object -ComObject Microsoft.Update.Searcher
    $searchResult = $updates.Search("IsInstalled=0")

    # Install updates
    Write-Output "Installing updates..."
    $installer = New-Object -ComObject Microsoft.Update.Installer
    $installer.Updates = $searchResult.Updates
    $installationResult = $installer.Install()

    # Output installed updates
    Write-Output "Installed updates:"
    foreach ($update in $installationResult.Updates)
    {
        Write-Output $update.Title
    }

    $resultText = Get-ResultText -resultCode $installationResult.ResultCode
    Write-Output "Installation result: $resultText"

    # Check if a reboot is required
    if ($installationResult.RebootRequired)
    {
        Write-Output "A restart is required. Restarting the computer..." -ForegroundColor Black -BackgroundColor Red
        Start-Sleep -Seconds 60
        Restart-Computer -Force
    }
    Write-Output "No restart is required."
    Start-Sleep -Seconds 10
}
