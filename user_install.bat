@echo off
set param=--accept-source-agreements --accept-package-agreements --silent

: MSSTORE =======================
: Webp-Bilderweiterungen
winget install %param% --id "9PG2DK419DRG"
: Raw-Bilderweiterung
winget install %param% --id "9NCTDW2W1BH8"
:HEIF-Bilderweiterungen
winget install %param% --id "9PMMSR1CGPWG"
: AV1 Video Extension
winget install %param% --id "9MVZQVXJBQ9V"
: VP9 Video Erweiterung
winget install %param% --id "9N4D0MSMP0PT"
: =============
: Blender
winget install %param% --id "9PP3C07GTVRH"
: Gimp
winget install %param% --id "XPDM27W10192Q0"
: InkScape
winget install %param% --id "9PD9BHGLFC7H"
: Visual Studio Code
winget install %param% --id "XP9KHM4BK9FZ7Q"
: Monitorian
winget install %param% --id "9NW33J738BL0"
: NanaZip
winget install %param% --id "9N8G7TSCL18R"
: Cinebench
winget install %param% --id "9PGZKJC81Q7J"


: winget ========================
:winget install %param% --id "Figma.Figma"

