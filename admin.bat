@echo off

call "admin_clean.bat"
powershell.exe -ExecutionPolicy Bypass -File admin_clean.ps1

call "admin_install.bat"

