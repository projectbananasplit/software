@echo off
set param=--accept-source-agreements --accept-package-agreements --disable-interactivity --silent
:: does not work properly with silent and disable-interactivity
:: --uninstall-previous

@for /f %%a in ('echo prompt $E^| cmd') do set "esc=%%a"
set red=%esc%[38;5;1m
set green=%esc%[38;5;2m
set yellow=%esc%[38;5;11m
set blue=%esc%[38;5;12m
set purp=%esc%[38;5;13m
set white=%esc%[38;5;15m

echo %yellow%Senf this PC.
echo %yellow%
echo %yellow%"    ___________
echo %yellow%"   [___________]
echo %yellow%"   /           \\
echo %yellow%"  /~~^~^~^~^~^~^\\
echo %yellow%" /===============\\
echo %yellow%";  _   _       ___ ;
echo %yellow%"| |_  |_ |\\ | |_  |
echo %yellow%";  _| |_ | \\| |   ;
echo %yellow%" \\===============/
echo %yellow%"  \\             /
echo %yellow%"   `"""""""""""`

echo %blue%##############################
echo %blue%MSSTORE
echo %blue%##############################
:: VLC nicht up to date
:: winget install %param% -e --id "XPDM1ZW6815MQM"

echo %blue%##############################
echo %blue%winget
echo %blue%##############################
:: no user scoped installation available
echo %green%Git
winget install %param% -e --id "Git.Git"
echo %green%VLC
winget install %param% -e --id "VideoLAN.VLC"
echo %green%PrusaSlicer
winget install %param% -e --id "Prusa3D.PrusaSlicer"
echo %green%Meshlab
winget install %param% -e --id "CNRISTI.MeshLab"
echo %green%OpenSCAD
winget install %param% -e --id "OpenSCAD.OpenSCAD"
echo %green%LibreOffice
winget install %param% -e --id "TheDocumentFoundation.LibreOffice"
echo %green%Cura
winget install %param% -e --id "Ultimaker.Cura"
::echo %green%KiCad
::winget install %param% -e --id "KiCad.KiCad"
echo %green%Notepad++
winget install %param% -e --id "Notepad++.Notepad++"
echo %green%FreeCAD
winget install %param% -e --id "FreeCAD.FreeCAD" --scope machine
echo %green%Adobe Acrobat Reader DC (64-bit)
winget install %param% -e --id "Adobe.Acrobat.Reader.64-bit" --scope machine


echo %purp%==============================
echo %purp%Windows Erweiterungen
echo %purp%==============================
echo %green%Microsoft Visual C++ 2015-20XX Redistributable 32/64bit
winget install %param% -e --id "Microsoft.VCRedist.2015+.x64"
winget install %param% -e --id "Microsoft.VCRedist.2015+.x86"
echo %green%%Microsoft Visual C++ 2013
winget install %param% -e --id "Microsoft.VCRedist.2013.x64"
winget install %param% -e --id "Microsoft.VCRedist.2013.x86"
:: Microsoft Visual C++ 2005 problem currently not solved
