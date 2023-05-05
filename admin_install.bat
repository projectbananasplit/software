@echo off
set param=--accept-source-agreements --accept-package-agreements --silent

: MSSTORE =======================
: VLC nicht up to date
: winget install %param% --id "XPDM1ZW6815MQM"

: winget ========================
: Git
winget install %param% --id "Git.Git"
: VLC
winget install %param% --id "VideoLAN.VLC"
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
: KiCad
winget install %param% --id "KiCad.KiCad"
: Notepad++
winget install %param% --id "Notepad++.Notepad++"
: Python.Python.3.10
winget install %param% --id "Python.Python.3.10"
