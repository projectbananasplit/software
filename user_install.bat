@echo off
set param=--accept-source-agreements --accept-package-agreements --silent

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
