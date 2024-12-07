@echo off

TITLE Makerspace Software Updater (User)

call "wait_until_network.bat"
call "user_clean.bat"
call "user_install.bat"
powershell -ExecutionPolicy Bypass -File user_fusion_plugin.ps1
powershell -ExecutionPolicy Bypass -File user_notifications.ps1
powershell -ExecutionPolicy Bypass -File user_shutdown.ps1
powershell -ExecutionPolicy Bypass -File user_wallpaper.ps1

timeout 10
