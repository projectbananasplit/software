@echo off
set param=--accept-source-agreements --accept-package-agreements --scope user --uninstall-previous --disable-interactivity --silent

@for /f %%a in ('echo prompt $E^| cmd') do set "esc=%%a"
set red=%esc%[38;5;1m
set green=%esc%[38;5;2m
set yellow=%esc%[38;5;11m
set blue=%esc%[38;5;12m
set purp=%esc%[38;5;13m
set white=%esc%[38;5;15m

echo %yellow%
echo %yellow%Senfinator 200g
echo %yellow%
echo %yellow%Installiert oder updatet die auf Nutzerebene laufenden Programme.
echo %yellow%Installs or updates the programs running at the user level.
echo %yellow%
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

: MSSTORE =======================
echo %blue%##############################
echo %blue%MSSTORE
echo %blue%##############################
echo %purp%==============================
echo %purp%Windows Erweiterungen
echo %purp%==============================
echo %green%Webp-Bilderweiterungen
winget install %param% -e --id "9PG2DK419DRG"
echo %green%Raw-Bilderweiterung
winget install %param% -e --id "9NCTDW2W1BH8"
echo %green%HEIF-Bilderweiterungen
winget install %param% -e --id "9PMMSR1CGPWG"
echo %green%AV1 Video Extension
winget install %param% -e --id "9MVZQVXJBQ9V"
echo %green%VP9 Video Erweiterung
winget install %param% -e --id "9N4D0MSMP0PT"
echo %green%Windows-Rechner
winget install %param% -e --id "9WZDNCRFHVN5"
echo %purp%==============================
echo %purp%Anwendungen
echo %purp%==============================
echo %green%Blender
winget install %param% -e --id "9PP3C07GTVRH"
echo %green%Gimp
winget install %param% -e --id "XPDM27W10192Q0"
echo %green%InkScape
winget install %param% -e --id "9PD9BHGLFC7H"
echo %green%Python 3.12
winget install %param% -e --id "9NCVDN91XZQP"
echo %green%Monitorian
winget install %param% -e --id "9NW33J738BL0"
echo %green%NanaZip
winget install %param% -e --id "9N8G7TSCL18R"
echo %green%Cinebench
winget install %param% -e --id "9PGZKJC81Q7J"
::echo %green%Visual Studio Code
:: "scope user" installer not found
::winget install %param% -e --id "XP9KHM4BK9FZ7Q"

: winget ========================
echo %blue%##############################
echo %blue%winget
echo %blue%##############################
:: echo %green%Figma
::winget install %param% -e --id "Figma.Figma"

echo %green%Visual Studio Code
winget install %param% -e --id "Microsoft.VisualStudioCode"
echo %green%Arduino
winget install %param% -e --id "ArduinoSA.IDE.stable"

echo %green%KiCad
winget install %param% -e --id "KiCad.KiCad"

