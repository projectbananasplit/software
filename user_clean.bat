@echo off
set param=--accept-source-agreements --silent --disable-interactivity

@for /f %%a in ('echo prompt $E^| cmd') do set "esc=%%a"
set red=%esc%[38;5;1m
set green=%esc%[38;5;2m
set yellow=%esc%[38;5;11m
set blue=%esc%[38;5;12m
set purp=%esc%[38;5;13m
set white=%esc%[38;5;15m

echo %red%Burning Toaster
echo %red%
echo %red%"                          ░░    ░░
echo %red%"                    ░░░░      ░░
echo %red%"                            ░░
echo %red%"                    ░░              ░░
echo %red%"                          ░░      ░░
echo %red%"                ░░▓▓▓▓▓▓▓▓▒▒▓▓▒▒▓▓▓▓▓▓▓▓░░
echo %red%"                ▒▒▓▓░░░░░░░░░░░░░░░░░░▓▓▒▒
echo %red%"                ▓▓░░░░░░░░░░░░░░░░░░░░░░▓▓
echo %red%"                ▓▓░░░░░░░░░░░░░░░░░░░░  ▓▓
echo %red%"                ▓▓▓▓░░░░░░  ░░░░░░░░░░▓▓▓▓
echo %red%"                  ▒▒░░      ░░        ▒▒      ░░
echo %red%"          ░░▒▒    ▒▒░░  ▓▓░░░░▒▒▓▓▒▒░░▒▒    ▒▒░░░░░░
echo %red%"            ░░▒▒  ▒▒░░  ██▒▒░░▒▒████░░▒▒  ▒▒▒▒    ░░
echo %red%"          ░░░░▒▒░░▒▒░░░░▒▒░░░░░░▒▒░░░░▒▒░░▒▒░░    ░░
echo %red%"      ░░░░░░  ░░░░▒▒░░░░░░░░░░░░░░░░░░▒▒░░░░░░░░
echo %red%"      ░░░░      ░░▒▒░░░░░░░░▒▒░░░░░░░░▒▒    ░░
echo %red%"      ░░          ▒▒░░░░░░░░░░░░░░░░░░▒▒
echo %red%"      ░░░░    ░░  ▒▒░░░░░░░░░░░░░░░░░░▒▒    ░░
echo %red%"    ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
echo %red%"  ░░                                                    ░░
echo %red%"  ░░                                                    ░░░░
echo %red%"░░                                                        ░░
echo %red%
echo %red%"Burn & Uninstall unwanted and outdated software. (user-level)

echo %blue%##############################
echo %blue%MSSTORE
echo %blue%##############################
echo %purp%==============================
echo %purp%Anwendungen
echo %purp%==============================
echo %green%Python 3.7
winget uninstall %param% -e --id "9NJ46SX7X90P"
echo %green%Python 3.8
winget uninstall %param% -e --id "9MSSZTT1N39L"
echo %green%Python 3.9
winget uninstall %param% -e --id "9P7QFQMJRFP7"
echo %green%Python 3.10
winget uninstall %param% -e --id "9PJPW5LDXLZ5"
echo %green%Python 3.11
winget uninstall %param% -e --id "9NRWMJP3717K"
::echo %green%Python 3.12
::winget uninstall %param% -e --id "9NCVDN91XZQP"
echo %green%Outlook for Windows
winget uninstall %param% -e --id "9NRX63209R7B"
echo %green%Google Chrome
winget uninstall %param% --scope user -e --id "Google.Chrome"
echo %green%MS DevHome
winget uninstall %param% -e --id "Microsoft.DevHome"
echo %green%WhatsApp
winget uninstall %param% -e --name "WhatsApp"

::echo %green%inkstitch
::winget uninstall %param% -e --id org.inkstitch.app_is1

echo %purp%==============================
echo %purp%Hersteller
echo %purp%==============================
::echo %green%HP Display Center
:: predeployed uninstall bug
::winget uninstall %param% --scope user -e --name "HP Display Center"
