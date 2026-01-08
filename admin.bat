@echo off

TITLE Makerspace Software Updater (Admin)

echo Check for admin rights.
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting administrative privileges...
    powershell -Command "Start-Process '%~f0' -Verb runAs"
    exit /b
)

echo Running with elevated privileges!

call "wait_until_network.bat"
powershell -noprofile -command "&{ start-process powershell -ArgumentList '-noprofile -ExecutionPolicy Bypass -file .\admin_clean.ps1' -verb RunAs}"
call "admin_clean.bat"
call "admin_install.bat"
powershell -noprofile -command "&{ start-process powershell -ArgumentList '-noprofile -ExecutionPolicy Bypass -file .\admin_install.ps1' -verb RunAs}"

# Run DISM ScanHealth and capture output and exit code
output=$(DISM /Online /Cleanup-Image /ScanHealth 2>&1)
exit_code=$?

if [ $exit_code -ne 0 ]; then
  echo "DISM ScanHealth failed with exit code $exit_code"
  echo "Output was:"
  echo "$output"
  exit $exit_code
fi

if echo "$output" | grep -q -e "The component store is repairable" -e "Der Komponentenspeicher ist reparierbar"; then
  echo "Problems found by ScanHealth. Running RestoreHealth..."
  DISM /Online /Cleanup-Image /RestoreHealth
else
  echo "No problems found by ScanHealth. Skipping RestoreHealth."
fi

sfc /scannow

timeout 300
