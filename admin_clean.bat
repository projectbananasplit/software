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
winget uninstall %param% --purge -e --id "Arduino"

echo %green%Vectric Shell Extensions
winget uninstall %param% --purge --name "VectricThumbnailShellExt"

echo %green%Autodesk
winget uninstall %param% --purge --name "Autodesk ReCap"
winget uninstall %param% --purge -e --id {11b0543e-b0f6-438b-8de5-ac6bbe34cc8f}
winget uninstall %param% --purge -e --id {6C8DF0C5-75E5-320E-BD59-58C49EEBC545}
winget uninstall %param% --purge -e --id {9DD49997-8BD2-30E8-B50C-C5569FA91FDA}
winget uninstall %param% --purge -e --id {11b0543e-b0f6-438b-8de5-ac6bbe34cc8f}
:winget uninstall %param% --purge -e --id

echo %green%JMP
winget uninstall %param% --purge -e --name "JMP 17 (Trial)"

echo %green%FARO LS 1.1.800.4 (64bit)
: FARO LS 1.1.800.4 (64bit) {FA52D494-A7D5-4C3B-99E1-F8A66A6EEBDC} 8.0.4.5330
: FARO LS 1.1.700.0 (64bit) {FF6E9382-0B85-48DE-888F-76EFD9A87038} 7.0.0.23
winget uninstall %param% --purge -e --id {FA52D494-A7D5-4C3B-99E1-F8A66A6EEBDC}

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
winget  uninstall %param% -e --id "{8bdfe669-9705-4184-9368-db9ce581e0e7}"

echo %green%Microsoft Visual C++ 2013
winget  uninstall %param% --name "Microsoft Visual C++ 2013 Redistributable (x64) - 12.0.30501"
winget  uninstall %param% --name "Microsoft Visual C++ 2013 Redistributable (x86) - 12.0.40660"
winget  uninstall %param% --name "Microsoft Visual C++ 2013 Redistributable (x64) - 12.0.40660"
winget  uninstall %param% --name "Microsoft Visual C++ 2013 Redistributable (x86) - 12.0.30501"

echo %purp%==============================
echo %purp%Microsoft
echo %purp%==============================
echo %green%Microsoft Access database engine 2010 (English)
: Microsoft Access database engine 2010 (English) 14.0.7015.1000
winget  uninstall %param% --purge -e --id  {90140000-00D1-0409-1000-0000000FF1CE}
echo %green%Microsoft SQL Server 2014 Express LocalDB
: Microsoft SQL Server 2014 Express LocalDB 12.3.6024.0
winget  uninstall %param% --purge -e --id {BAF67399-85CD-4555-9B49-1F80EB921C35}

echo %green%Office 365
asset\office365setup.exe /configure asset\office365remove.xml


echo %purp%==============================
echo %purp%Hersteller
echo %purp%==============================
echo %green%HP Display Center
winget uninstall %param% -e --name "HP Display Center"
