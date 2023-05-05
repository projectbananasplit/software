@echo off
set param=" --accept-source-agreements --silent"

winget uninstall --id "Microsoft.WindowsCamera_8wekyb3d8bbwe" "%param%"
