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
echo %red%"          bC
echo %red%"        CCCz
echo %red%"       CCCCC
echo %red%"       CCCCC
echo %red%"       CCCCCCC
echo %red%"       CCCCCCCCC
echo %red%"  CC  CCCCCCCCCCC
echo %red%"  CCCCCCCz CCCCCC  yL
echo %red%" CCCCCCCC   CCCCCC CC
echo %red%"CCCCCCCCC    CCCCCCCCC
echo %red%"CCCCCCzC      CCCCCCCC
echo %red%"CCCCC          C CCCCC
echo %red%"zCCCC            CCCC
echo %red%" zCCC            CCCo
echo %red%"   CC            CC
echo %red%"      C        C
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
echo %green%Python 3.12
winget uninstall %param% -e --id "9NCVDN91XZQP"
echo %green%Python 3.13
winget uninstall %param% -e --id "9PNRBTZXMB4Z"
echo %green%Outlook for Windows
winget uninstall %param% -e --id "9NRX63209R7B"
echo %green%Google Chrome
winget uninstall %param% --scope user -e --id "Google.Chrome"
echo %green%MS DevHome
winget uninstall %param% -e --id "Microsoft.DevHome"
echo %green%MS BingSearch
winget uninstall %param% -e --id "Microsoft.BingSearch_8wekyb3d8bbwe"
echo %green%MS Copilot
winget uninstall %param% -e --id "Microsoft.Windows.Ai.Copilot.Provider_8wekyb3d8bbwe"
echo %green%WhatsApp
winget uninstall %param% -e --name "WhatsApp"
echo %green%Telegram
winget uninstall %param% --purge -e --id "Telegram.TelegramDesktop"
echo %green%Daily Picture
winget uninstall %param% --purge -e --name "Daily Picture"

echo %green%Blokdots
winget uninstall %param% --purge -e --name "Blokdots Beta 0.5.4"
winget uninstall %param% --purge -e --id "5672905e-5da1-5c9e-b80f-89f9a7d27ff3"
echo %green%ProtoPie
winget uninstall %param% --purge -e --id "StudioXID.ProtoPie"

echo %green%Adobe
winget uninstall %param% -e --name "Adobe Notification Client"
winget uninstall %param% -e --name "Acrobat Notification Client"
winget uninstall %param% -e --name "Notification Manager for Acrobat Reader"

echo %green%Figma
winget uninstall %param% --purge -e --id "Figma.FigmaAgent"
winget uninstall %param% --purge -e --id "Figma.Figma"


Event stuff
echo %green%KNIME Analytics Platform
winget uninstall %param% --purge -e --id "KNIMEAG.KNIMEAnalyticsPlatform"

::echo %green%Funde

::echo %green%inkstitch
::winget uninstall %param% -e --id org.inkstitch.app_is1

echo %purp%==============================
echo %green%MS Clipchamp
winget uninstall %param% -e --id "9P1J8S7CCWWT"

echo %purp%==============================
echo %purp%Hersteller
echo %purp%==============================
::echo %green%HP Display Center
:: predeployed uninstall bug
::winget uninstall %param% --scope user -e --name "HP Display Center"
