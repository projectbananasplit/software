@echo off
set param=--accept-source-agreements --accept-package-agreements --silent

@for /f %%a in ('echo prompt $E^| cmd') do set "esc=%%a"
set red=%esc%[38;5;1m
set green=%esc%[38;5;2m
set yellow=%esc%[38;5;11m
set blue=%esc%[38;5;12m
set purp=%esc%[38;5;13m
set white=%esc%[38;5;15m

: MSSTORE =======================
echo %blue%##############################
echo %blue%MSSTORE
echo %blue%/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
echo %purp%==============================
echo %purp%Windows Erweiterungen
echo %purp%==============================
echo %green%Webp-Bilderweiterungen
winget install %param% --id "9PG2DK419DRG"
echo %green%Raw-Bilderweiterung
winget install %param% --id "9NCTDW2W1BH8"
echo %green%HEIF-Bilderweiterungen
winget install %param% --id "9PMMSR1CGPWG"
echo %green%AV1 Video Extension
winget install %param% --id "9MVZQVXJBQ9V"
echo %green%VP9 Video Erweiterung
winget install %param% --id "9N4D0MSMP0PT"
echo %purp%==============================
echo %purp%Anwendungen
echo %purp%==============================
echo %green%Blender
winget install %param% --id "9PP3C07GTVRH"
echo %green%Gimp"
winget install %param% --id "XPDM27W10192Q0"
echo %green%InkScape
winget install %param% --id "9PD9BHGLFC7H"
echo %green%Visual Studio Code
winget install %param% --id "XP9KHM4BK9FZ7Q"
echo %green%Monitorian
winget install %param% --id "9NW33J738BL0"
echo %green%NanaZip
winget install %param% --id "9N8G7TSCL18R"
echo %green%Cinebench
winget install %param% --id "9PGZKJC81Q7J"


: winget ========================
: echo %blue%##############################
: echo %blue%winget
: echo %blue%/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
: echo %green%Figma
:winget install %param% --id "Figma.Figma"

