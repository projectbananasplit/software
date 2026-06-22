Write-Host "Update Fusion360 Plugin" -ForegroundColor Green -BackgroundColor Gray

$newVersion = "1.9.0"
$zipUrl = "https://github.com/projectbananasplit/assets/raw/refs/heads/main/fusion360/shaper.zip"  # Replace with the actual URL
$zipTempFilePath = "$env:TEMP\shaper.zip"

$pluginFolder = "$env:APPDATA\Autodesk\ApplicationPlugins\ShaperUtilities.bundle\"
$xmlFilePath = Join-Path -Path $pluginFolder -ChildPath "PackageContents.xml"

if (Test-Path -Path $xmlFilePath)
{
    [xml]$xml = Get-Content -Path $xmlFilePath
    $appVersion = $xml.ApplicationPackage.AppVersion
}
if (!($appVersion -lt $newVersion))
{
    Write-Output "✅ Detected $appVersion seems up to date."
}
else
{
    Write-Output "🔄 Detected $appVersion which is older than available $newVersion ."
    if (Test-Path -Path $pluginFolder)
    {
        Remove-Item -Path "$pluginFolder\*" -Recurse
    }
    else
    {
        New-Item -Path $pluginFolder -ItemType Directory
    }
    Invoke-WebRequest -Uri $zipUrl -OutFile $zipTempFilePath
    Expand-Archive -Path $zipTempFilePath -DestinationPath $pluginFolder -Force
    Remove-Item -Path $zipTempFilePath -Force
    Write-Host "✅ Success"
}
