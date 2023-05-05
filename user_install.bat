@echo off
set param=--accept-source-agreements --accept-package-agreements --silent

: Blender
winget install %param% --id "9PP3C07GTVRH"
: Gimp
winget install %param% --id "XPDM27W10192Q0"
: InkScape
winget install %param% --id "9PD9BHGLFC7H"
