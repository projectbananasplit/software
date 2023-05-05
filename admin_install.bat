@echo off
set param=--accept-source-agreements --accept-package-agreements --silent

: MSSTORE =======================
: VLC
winget install %param% --id "XPDM1ZW6815MQM"

: winget ========================
: PrusaSlicer
winget install %param% --id "Prusa3D.PrusaSlicer"
: Meshlab
winget install %param% --id "CNRISTI.MeshLab"
: OpenSCAD
winget install %param% --id "OpenSCAD.OpenSCAD"
: LibreOffice
winget install %param% --id "TheDocumentFoundation.LibreOffice"
: Cura
winget install %param% --id "Ultimaker.Cura"
