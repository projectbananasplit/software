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
    $updateSession = New-Object -ComObject Microsoft.Update.Session
    $updateSearcher = $updateSession.CreateUpdateSearcher()
    $searchResult = $updateSearcher.Search("IsInstalled=0 AND IsHidden=0")
    $rebootRequired = $false

    foreach ($update in $searchResult.Updates)
    {
        $updateInstaller = New-Object -ComObject Microsoft.Update.Installer
        $updateInstaller.Updates.Add($update)
        $result = $updateInstaller.Install()
        Write-Output "Installed: $( $update.Title )"
        $resultCode = $result.ResultCode
        $resultText = Get-ResultText -resultCode $result.ResultCode
        Write-Output "Result: $resultText"
        if ($update.InstallationBehavior.RebootBehavior -ne 0)
        {
            $rebootRequired = $true
        }
    }

    if ($rebootRequired)
    {
        Write-Output "A restart is required. Restarting the computer..."
        Start-Sleep -Seconds 10
        Restart-Computer -Force
    }
    else
    {
        Write-Output "No restart is required."
        Start-Sleep -Seconds 10
    }
}
