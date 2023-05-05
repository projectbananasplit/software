@echo off

powershell -noprofile -command "&{ start-process powershell -ArgumentList '-noprofile -ExecutionPolicy Bypass -file .\admin_clean.ps1' -verb RunAs}"

call "admin_clean.bat"

call "admin_install.bat"

