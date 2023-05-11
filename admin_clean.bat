@echo off
set param=--accept-source-agreements --silent

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
winget uninstall %param% -e --id "7zip.7zip"
echo %green%paint.net
winget uninstall %param% -e --id "dotPDNLLC.paintdotnet"
echo %green%OpenOffice
winget uninstall %param% -e --id "Apache.OpenOffice"
echo %green%Inkscape
winget uninstall %param% -e --id "Inkscape.Inkscape"
echo %green%Gimp
winget uninstall %param% -e --id "GIMP.GIMP"
echo %green%Google Chrome
winget uninstall %param% -e --id "Google.Chrome"
echo %green%x263vfw
winget uninstall %param% -e --id "x264vfw64"
echo %green%Maxon Cinema 4D R25
winget uninstall %param% -e --id "Maxon Cinema 4D R25"
echo %green%Magic Bullet Suite
winget uninstall %param% --name "Magic Bullet Suite"

echo %green%Ultimaker Cura
winget uninstall %param% --name "Ultimaker Cura 4.13.0"

echo %green%Python.Python.3.6
winget unintstall %param% -e --id "Python.Python.3.6"
echo %green%Python.Python.3.7
winget unintstall %param% -e --id "Python.Python.3.7"
echo %green%Python.Python.3.8
winget unintstall %param% -e --id "Python.Python.3.8"
echo %green%Python.Python.3.9
winget unintstall %param% -e --id "Python.Python.3.9"
echo %green%Python.Python.3.10
winget unintstall %param% -e --id "Python.Python.3.10"
