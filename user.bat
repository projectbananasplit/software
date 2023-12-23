@echo off

TITLE Makerspace Software Updater (User)

call "wait_until_network.bat"
call "user_clean.bat"
call "user_install.bat"

timeout 10
