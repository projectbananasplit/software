@echo off
set param=--accept-source-agreements --accept-package-agreements --silent

@for /f %%a in ('echo prompt $E^| cmd') do set "esc=%%a"
set red=%esc%[38;5;1m
set green=%esc%[38;5;2m
set yellow=%esc%[38;5;11m
set blue=%esc%[38;5;12m
set purp=%esc%[38;5;13m
set white=%esc%[38;5;15m

echo %blue%##############################
echo %blue%REMOVE if possible
echo %blue%##############################
echo %blue%winget
echo %blue%##############################
echo %green%7zip
winget uninstall %param% --id "7zip.7zip"
echo %green%paint.net
winget uninstall %param% --id "dotPDNLLC.paintdotnet"
echo %green%OpenOffice
winget uninstall %param% --id "Apache.OpenOffice"
echo %green%Inkscape
winget uninstall %param% --id "Inkscape.Inkscape"
echo %green%Google Chrome
winget uninstall %param% --id "Google.Chrome"
echo %green%x263vfw
winget uninstall %param% --id "x263vfw64"