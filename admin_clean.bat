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
winget uninstall %param% -e --id "HaukeGtze.7-ZipFileManagerUnofficial_6bk20wvc8rfx2"
echo %green%paint.net
winget uninstall %param% -e --id "dotPDNLLC.paintdotnet"
echo %green%OpenOffice
winget uninstall %param% -e --id "Apache.OpenOffice"
echo %green%Inkscape
winget uninstall %param% --scope machine -e --id "Inkscape.Inkscape"
echo %green%Gimp
winget uninstall %param% --scope machine -e --id "GIMP.GIMP"
echo %green%Google Chrome
winget uninstall %param% -e --id "Google.Chrome"
echo %green%x264vfw
winget uninstall %param% -e --id "x264vfw64"
echo %green%Maxon Cinema 4D R25
winget uninstall %param% -e --id "Maxon Cinema 4D R25"
echo %green%Magic Bullet Suite
winget uninstall %param% --name "Magic Bullet Suite"

echo %green%Ultimaker Cura
winget uninstall %param% --name "Ultimaker Cura 4.13.0"

echo %green%Arduino
winget uninstall %param% -e --id "Arduino"

echo %green%Adobe Acrobat Reader DC - Deutsch
winget  uninstall %param% -e --id "{AC76BA86-7AD7-1031-7B44-AC0F074E4100}"
echo %green%Adobe Acrobat DC
winget  uninstall %param% -e --id "{AC76BA86-1033-FFFF-7760-0C0F074E4100}"
winget  uninstall %param% -e --id "{AC76BA86-1033-FFFF-7760-BC15014EA700}"
echo %green%Adobe Notification Client
winget  uninstall %param% -e --id "AdobeNotificationClient_enpm4xejd91yc"

echo %green%Python.Python.3.6
winget  uninstall %param% -e --id "Python.Python.3.6"
echo %green%Python.Python.3.7
winget  uninstall %param% -e --id "Python.Python.3.7"
echo %green%Python.Python.3.8
winget  uninstall %param% -e --id "Python.Python.3.8"
echo %green%Python.Python.3.9
winget  uninstall %param% -e --id "Python.Python.3.9"
echo %green%Python.Python.3.10
winget  uninstall %param% -e --id "Python.Python.3.10"


echo %purp%==============================
echo %purp%Windows Erweiterungen
echo %purp%==============================
echo %green%Microsoft Visual C++ 2015-20XX Redistributable 32/64bit (fixworkaround)
winget  uninstall %param% -e --id "{8bdfe669-9705-4184-9368-db9ce581e0e7}"


echo %purp%==============================
echo %purp%Microsoft
echo %purp%==============================
echo %green%Office 365
asset\office365setup.exe /configure asset\office365remove.xml


echo %purp%==============================
echo %purp%Hersteller
echo %purp%==============================
echo %green%HP Display Center
winget uninstall %param% -e --name "HP Display Center"
