@echo off
set param=--accept-source-agreements --accept-package-agreements --silent

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
: VLC nicht up to date
: winget install %param% --id "XPDM1ZW6815MQM"

echo %blue%##############################
echo %blue%winget
echo %blue%##############################
echo %green%Git
winget install %param% --id "Git.Git"
echo %green%Python.Python.3.10
winget install %param% --id "Python.Python.3.10"
echo %green%VLC
winget install %param% --id "VideoLAN.VLC"
echo %green%PrusaSlicer
winget install %param% --id "Prusa3D.PrusaSlicer"
echo %green%Meshlab
winget install %param% --id "CNRISTI.MeshLab"
echo %green%OpenSCAD
winget install %param% --id "OpenSCAD.OpenSCAD"
echo %green%LibreOffice
winget install %param% --id "TheDocumentFoundation.LibreOffice"
echo %green%Cura
winget install %param% --id "Ultimaker.Cura"
echo %green%KiCad
winget install %param% --id "KiCad.KiCad"
echo %green%Notepad++
winget install %param% --id "Notepad++.Notepad++"
echo %green%FreeCAD
winget install %param% --id "FreeCAD.FreeCAD"


echo %purp%==============================
echo %purp%Windows Erweiterungen
echo %purp%==============================
echo %green%Microsoft Visual C++ 2015-20XX Redistributable 32/64bit
winget install %param% --id "Microsoft.VCRedist.2015+.x64"
winget install %param% --id "Microsoft.VCRedist.2015+.x86"
