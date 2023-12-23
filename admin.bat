@echo off

TITLE Makerspace Software Updater (Admin)

call "wait_until_network.bat"
powershell -noprofile -command "&{ start-process powershell -ArgumentList '-noprofile -ExecutionPolicy Bypass -file .\admin_clean.ps1' -verb RunAs}"
call "admin_clean.bat"
call "admin_install.bat"

timeout 300
