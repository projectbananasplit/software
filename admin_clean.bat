@echo off
set param=--accept-source-agreements --accept-package-agreements --silent

: 7zip
winget uninstall %param% --id "7zip.7zip"
