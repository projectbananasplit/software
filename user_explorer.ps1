Write-Host "Show file name extensions" -ForegroundColor Green -BackgroundColor Black
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name HideFileExt -Value 0
