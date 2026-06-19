##Remove bloat
$Bloatware = @(
#Unnecessary Windows 10/11 AppX Apps
    "*ActiproSoftwareLLC*"
    "*AdobeSystemsIncorporated.AdobePhotoshopExpress*"
    "*BubbleWitch3Saga*"
    "*CandyCrush*"
    "*DevHome*"
    "*Disney*"
    "*Dolby*"
    "*Duolingo-LearnLanguagesforFree*"
    "*EclipseManager*"
    "*Facebook*"
    "*Flipboard*"
    "*gaming*"
    "*Minecraft*"
    "*Office*"
    "*PandoraMediaInc*"
    "*Royal Revolt*"
    "*Speed Test*"
    "*Spotify*"
    "*Sway*"
    "*Twitter*"
    "*Wunderlist*"
    "AD2F1837.HPPrinterControl"
    "AppUp.IntelGraphicsExperience"
    "C27EB4BA.DropboxOEM*"
    "Disney.37853FC22B2CE"
    "DolbyLaboratories.DolbyAccess"
    "DolbyLaboratories.DolbyAudio"
    "E0469640.SmartAppearance"
    "Microsoft.549981C3F5F10"
# "Microsoft.AV1VideoExtension"
    "Microsoft.BingNews"
    "Microsoft.BingSearch"
    "Microsoft.BingWeather"
    "Microsoft.GetHelp"
    "Microsoft.Getstarted"
    "Microsoft.GamingApp"
    "Microsoft.Messaging"
    "Microsoft.Microsoft3DViewer"
    "Microsoft.MicrosoftEdge.Stable"
    "Microsoft.MicrosoftJournal"
    "Microsoft.MicrosoftOfficeHub"
    "Microsoft.MicrosoftSolitaireCollection"
    "Microsoft.MixedReality.Portal"
# "Microsoft.MPEG2VideoExtension"
    "Microsoft.News"
    "Microsoft.Office.Lens"
    "Microsoft.Office.OneNote"
    "Microsoft.Office.Sway"
    "Microsoft.OneConnect"
    "Microsoft.People"
    "Microsoft.PowerAutomateDesktop"
    "Microsoft.PowerAutomateDesktopCopilotPlugin"
    "Microsoft.Print3D"
    "Microsoft.RemoteDesktop"
    "Microsoft.SkypeApp"
    "Microsoft.SysinternalsSuite"
    "Microsoft.Teams"
    "Microsoft.Windows.DevHome"
    "Microsoft.WindowsAlarms"
    "Microsoft.windowscommunicationsapps"
    "Microsoft.WindowsFeedbackHub"
    "Microsoft.WindowsMaps"
    "Microsoft.Xbox.TCUI"
    "Microsoft.XboxApp"
    "Microsoft.XboxGameOverlay"
    "Microsoft.XboxGamingOverlay"
    "Microsoft.XboxGamingOverlay_5.721.10202.0_neutral_~_8wekyb3d8bbwe"
    "Microsoft.XboxIdentityProvider"
    "Microsoft.XboxSpeechToTextOverlay"
    "Microsoft.ZuneMusic"
    "Microsoft.ZuneVideo"
    "MicrosoftCorporationII.MicrosoftFamily"
    "MicrosoftCorporationII.QuickAssist"
    "MicrosoftWindows.CrossDevice"
    "MirametrixInc.GlancebyMirametrix"
    "RealtimeboardInc.RealtimeBoard"
    "SpotifyAB.SpotifyMusic"
    "5A894077.McAfeeSecurity"
    "5A894077.McAfeeSecurity_2.1.27.0_x64__wafk5atnkzcwy"
    "Adobe Creative Cloud All Apps 2-month membership"
    "Intel Connectivity Performance Suite"
    "Intel Unison"
    "McAfeeWPSSparsePackage_0j6k21vdgrmfw"
    "Microsoft.Edge.GameAssist"

#Others custom
    "*Clipchamp*"
    "AD2F1837.HPDesktopSupportUtilities"
    "MSTeams"
    "Microsoft.MicrosoftStickyNotes"
    "Microsoft.NetworkSpeedTest"
    "Microsoft.Office.Desktop"
    "Microsoft.Office.Todo.List"
    "Microsoft.OutlookForWindows"
    "Microsoft.StartExperiencesApp"
    "Microsoft.Wallet"
    "Microsoft.WindowsInstallationAssistant"
    "Microsoft.YourPhone"
    "MicrosoftWindows.Client.WebExperience"
    "RealtimeboardInc.RealtimeBoard"
    "SpotifyAB.SpotifyMusic"
    "Microsoft.Todos"

#Optional: Typically not removed but you can if you need to for some reason
    "*Microsoft.Advertising.Xaml_10.1712.5.0_x64__8wekyb3d8bbwe*"
    "*Microsoft.Advertising.Xaml_10.1712.5.0_x86__8wekyb3d8bbwe*"
    "*Microsoft.Windows.Ai.Copilot.Provider*"
    "*Microsoft.MicrosoftStickyNotes*"
    "*Microsoft.WindowsCalculator*"
)

$provisioned = Get-AppxProvisionedPackage -Online | Where-Object { $_.DisplayName -in $Bloatware -and $_.DisplayName -notin $appstoignore -and $_.DisplayName -notlike 'MicrosoftWindows.Voice*' -and $_.DisplayName -notlike 'Microsoft.LanguageExperiencePack*' -and $_.DisplayName -notlike 'MicrosoftWindows.Speech*' }
foreach ($appxprov in $provisioned)
{
    $packagename = $appxprov.PackageName
    $displayname = $appxprov.DisplayName
    write-output "Removing $displayname AppX Provisioning Package"
    try
    {
        Remove-AppxProvisionedPackage -PackageName $packagename -Online -ErrorAction SilentlyContinue
        write-output "Removed $displayname AppX Provisioning Package"
    }
    catch
    {
        write-output "Unable to remove $displayname AppX Provisioning Package"
    }
}


$appxinstalled = Get-AppxPackage -AllUsers | Where-Object { $_.Name -in $Bloatware -and $_.Name -notin $appstoignore -and $_.Name -notlike 'MicrosoftWindows.Voice*' -and $_.Name -notlike 'Microsoft.LanguageExperiencePack*' -and $_.Name -notlike 'MicrosoftWindows.Speech*' }
foreach ($appxapp in $appxinstalled)
{
    $packagename = $appxapp.PackageFullName
    $displayname = $appxapp.Name
    write-output "$displayname AppX Package exists"
    write-output "Removing $displayname AppX Package"
    try
    {
        Remove-AppxPackage -Package $packagename -AllUsers -ErrorAction SilentlyContinue
        write-output "Removed $displayname AppX Package"
    }
    catch
    {
        write-output "$displayname AppX Package does not exist"
    }
}

#Disables Web Search in Start Menu
Write-Host "Disabling Bing Search in Start Menu"
$WebSearch = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search"
If (!(Test-Path $WebSearch))
{
    New-Item $WebSearch
}
Set-ItemProperty $WebSearch DisableWebSearch -Value 1
##Loop through all user SIDs in the registry and disable Bing Search
foreach ($sid in $UserSIDs)
{
    $WebSearch = "Registry::HKU\$sid\SOFTWARE\Microsoft\Windows\CurrentVersion\Search"
    If (!(Test-Path $WebSearch))
    {
        New-Item $WebSearch
    }
    Set-ItemProperty $WebSearch BingSearchEnabled -Value 0
}

Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" BingSearchEnabled -Value 0

##Removes the Microsoft Feeds from displaying
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds"
$Name = "EnableFeeds"
$value = "0"

if (!(Test-Path $registryPath))
{
    New-Item -Path $registryPath -Force | Out-Null
    New-ItemProperty -Path $registryPath -Name $name -Value $value -PropertyType DWORD -Force | Out-Null
}
else
{
    New-ItemProperty -Path $registryPath -Name $name -Value $value -PropertyType DWORD -Force | Out-Null
}

##Disable Feeds
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Dsh"
If (!(Test-Path $registryPath))
{
    New-Item $registryPath
}
Set-ItemProperty $registryPath "AllowNewsAndInterests" -Value 0
write-output "Disabled Feeds"

#Stops the Windows Feedback Experience from sending anonymous data
Write-Host "Stopping the Windows Feedback Experience program"
$Period = "HKCU:\Software\Microsoft\Siuf\Rules"
If (!(Test-Path $Period))
{
    New-Item $Period
}
Set-ItemProperty $Period PeriodInNanoSeconds -Value 0

##Loop and do the same
foreach ($sid in $UserSIDs)
{
    $Period = "Registry::HKU\$sid\Software\Microsoft\Siuf\Rules"
    If (!(Test-Path $Period))
    {
        New-Item $Period
    }
    Set-ItemProperty $Period PeriodInNanoSeconds -Value 0
}

##Disables games from showing in Search bar
write-output "Adding Registry key to stop games from search bar"
$registryPath = "HKLM:\	SOFTWARE\Policies\Microsoft\Windows\Windows Search"
If (!(Test-Path $registryPath))
{
    New-Item $registryPath
}
Set-ItemProperty $registryPath EnableDynamicContentInWSB -Value 0

#Prevents bloatware applications from returning and removes Start Menu suggestions
Write-Host "Adding Registry key to prevent bloatware apps from returning"
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent"
$registryOEM = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager"
If (!(Test-Path $registryPath))
{
    New-Item $registryPath
}
Set-ItemProperty $registryPath DisableWindowsConsumerFeatures -Value 1

If (!(Test-Path $registryOEM))
{
    New-Item $registryOEM
}
Set-ItemProperty $registryOEM  ContentDeliveryAllowed -Value 0
Set-ItemProperty $registryOEM  OemPreInstalledAppsEnabled -Value 0
Set-ItemProperty $registryOEM  PreInstalledAppsEnabled -Value 0
Set-ItemProperty $registryOEM  PreInstalledAppsEverEnabled -Value 0
Set-ItemProperty $registryOEM  SilentInstalledAppsEnabled -Value 0
Set-ItemProperty $registryOEM  SystemPaneSuggestionsEnabled -Value 0

##Loop through users and do the same
foreach ($sid in $UserSIDs)
{
    $registryOEM = "Registry::HKU\$sid\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager"
    If (!(Test-Path $registryOEM))
    {
        New-Item $registryOEM
    }
    Set-ItemProperty $registryOEM  ContentDeliveryAllowed -Value 0
    Set-ItemProperty $registryOEM  OemPreInstalledAppsEnabled -Value 0
    Set-ItemProperty $registryOEM  PreInstalledAppsEnabled -Value 0
    Set-ItemProperty $registryOEM  PreInstalledAppsEverEnabled -Value 0
    Set-ItemProperty $registryOEM  SilentInstalledAppsEnabled -Value 0
    Set-ItemProperty $registryOEM  SystemPaneSuggestionsEnabled -Value 0
}


############################################################################################################
#                                        Remove Learn about this picture                                   #
#                                                                                                          #
############################################################################################################

#Turn off Learn about this picture
write-output "Disabling Learn about this picture"
$picture = 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel'
If (Test-Path $picture)
{
    Set-ItemProperty $picture -Name "{2cc5ca98-6485-489a-920e-b3e88a6ccce3}" -Value 1
}

##Loop through users and do the same
foreach ($sid in $UserSIDs)
{
    $picture = "Registry::HKU\$sid\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel"
    If (Test-Path $picture)
    {
        Set-ItemProperty $picture -Name "{2cc5ca98-6485-489a-920e-b3e88a6ccce3}" -Value 1
    }
}

############################################################################################################
#                                     Disable Consumer Experiences                                         #
#                                                                                                          #
############################################################################################################

#Disabling consumer experience
write-output "Disabling consumer experience"
$consumer = 'HKLM:\\SOFTWARE\Policies\Microsoft\Windows\CloudContent'
If (Test-Path $consumer)
{
    Set-ItemProperty $consumer -Name "DisableWindowsConsumerFeatures" -Value 1
    Set-ItemProperty $consumer -Name "DisableSoftLanding" -Value 1
}



############################################################################################################
#                                            Policy CSP - WindowsLogon                                     #
#                                                                                                          #
############################################################################################################
# https://learn.microsoft.com/en-us/windows/client-management/mdm/policy-csp-windowslogon#windowslogon-enablefirstlogonanimation

write-output "Policy CSP - WindowsLogon"
$spotlight = 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System'
If (Test-Path $spotlight)
{
    Set-ItemProperty $spotlight -Name "EnableFirstLogonAnimation" -Value 0
    Set-ItemProperty $spotlight -Name "DisableLockScreenAppNotifications" -Value 1
}


############################################################################################################
#                                                   Disable Spotlight                                      #
#                                                                                                          #
############################################################################################################

write-output "Disabling Windows Spotlight on lockscreen"
$spotlight = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager'
If (Test-Path $spotlight)
{
    Set-ItemProperty $spotlight -Name "RotatingLockScreenOverlayEnabled" -Value 0
    Set-ItemProperty $spotlight -Name "RotatingLockScreenEnabled" -Value 0
}

##Loop through users and do the same
foreach ($sid in $UserSIDs)
{
    $spotlight = "Registry::HKU\$sid\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager"
    If (Test-Path $spotlight)
    {
        Set-ItemProperty $spotlight -Name "RotatingLockScreenOverlayEnabled" -Value 0
        Set-ItemProperty $spotlight -Name "RotatingLockScreenEnabled" -Value 0
    }
}

write-output "Disabling Windows Spotlight on background"
$spotlight = 'HKCU:\Software\Policies\Microsoft\Windows\CloudContent'
If (Test-Path $spotlight)
{
    Set-ItemProperty $spotlight -Name "DisableSpotlightCollectionOnDesktop" -Value 1
    Set-ItemProperty $spotlight -Name "DisableWindowsSpotlightFeatures" -Value 1
}

##Loop through users and do the same
foreach ($sid in $UserSIDs)
{
    $spotlight = "Registry::HKU\$sid\Software\Policies\Microsoft\Windows\CloudContent"
    If (Test-Path $spotlight)
    {
        Set-ItemProperty $spotlight -Name "DisableSpotlightCollectionOnDesktop" -Value 1
        Set-ItemProperty $spotlight -Name "DisableWindowsSpotlightFeatures" -Value 1
    }
}

#write-output "Set Policy CSP - Settings - limit user mods"
## https://learn.microsoft.com/en-us/windows/client-management/mdm/policy-csp-settings#allowonlinetips
#$spotlight = 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer'
#If (Test-Path $spotlight)
#{
#    Set-ItemProperty $spotlight -Name "AllowOnlineTips" -Value 0
#    Set-ItemProperty $spotlight -Name "AllowRegion" -Value 0
#    Set-ItemProperty $spotlight -Name "AllowVPN" -Value 0
#    Set-ItemProperty $spotlight -Name "AllowYourAccount" -Value 0
#    Set-ItemProperty $spotlight -Name "AllowSignInOptions" -Value 0
#    Set-ItemProperty $spotlight -Name "ConfigureTaskbarCalendar" -Value 1
#}


############################################################################################################
#                                        Windows 11 Specific                                               #
#                                                                                                          #
############################################################################################################
#Windows 11 Customisations
write-output "Removing Windows 11 Customisations"


##Disable Feeds
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Dsh"
If (!(Test-Path $registryPath))
{
    New-Item $registryPath
}
Set-ItemProperty $registryPath "AllowNewsAndInterests" -Value 0
write-output "Disabled Feeds"


############################################################################################################
#                                           Windows Backup App                                             #
#                                                                                                          #
############################################################################################################
$version = Get-CimInstance Win32_OperatingSystem | Select-Object -ExpandProperty Caption
if ($version -like "*Windows 10*")
{
    write-output "Removing Windows Backup"
    $filepath = "C:\Windows\SystemApps\MicrosoftWindows.Client.CBS_cw5n1h2txyewy\WindowsBackup\Assets"
    if (Test-Path $filepath)
    {
        Remove-WindowsPackage -Online -PackageName "Microsoft-Windows-UserExperience-Desktop-Package~31bf3856ad364e35~amd64~~10.0.19041.3393"

        ##Add back snipping tool functionality
        write-output "Adding Windows Shell Components"
        DISM /Online /Add-Capability /CapabilityName:Windows.Client.ShellComponents~~~~0.0.1.0
        write-output "Components Added"
    }
    write-output "Removed"
}



############################################################################################################
#                                           Windows CoPilot                                                #
#                                                                                                          #
############################################################################################################
$version = Get-CimInstance Win32_OperatingSystem | Select-Object -ExpandProperty Caption
if ($version -like "*Windows 11*")
{
    write-output "Removing Windows Copilot"
    # Define the registry key and value
    $registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsCopilot"
    $propertyName = "TurnOffWindowsCopilot"
    $propertyValue = 1

    # Check if the registry key exists
    if (!(Test-Path $registryPath))
    {
        # If the registry key doesn't exist, create it
        New-Item -Path $registryPath -Force | Out-Null
    }

    # Get the property value
    $currentValue = Get-ItemProperty -Path $registryPath -Name $propertyName -ErrorAction SilentlyContinue

    # Check if the property exists and if its value is different from the desired value
    if ($null -eq $currentValue -or $currentValue.$propertyName -ne $propertyValue)
    {
        # If the property doesn't exist or its value is different, set the property value
        Set-ItemProperty -Path $registryPath -Name $propertyName -Value $propertyValue
    }


    ##Grab the default user as well
    $registryPath = "HKEY_USERS\.DEFAULT\Software\Policies\Microsoft\Windows\WindowsCopilot"
    $propertyName = "TurnOffWindowsCopilot"
    $propertyValue = 1

    # Check if the registry key exists
    if (!(Test-Path $registryPath))
    {
        # If the registry key doesn't exist, create it
        New-Item -Path $registryPath -Force | Out-Null
    }

    # Get the property value
    $currentValue = Get-ItemProperty -Path $registryPath -Name $propertyName -ErrorAction SilentlyContinue

    # Check if the property exists and if its value is different from the desired value
    if ($null -eq $currentValue -or $currentValue.$propertyName -ne $propertyValue)
    {
        # If the property doesn't exist or its value is different, set the property value
        Set-ItemProperty -Path $registryPath -Name $propertyName -Value $propertyValue
    }


    ##Load the default hive from c:\users\Default\NTUSER.dat
    reg load HKU\temphive "c:\users\default\ntuser.dat"
    $registryPath = "registry::hku\temphive\Software\Policies\Microsoft\Windows\WindowsCopilot"
    $propertyName = "TurnOffWindowsCopilot"
    $propertyValue = 1

    # Check if the registry key exists
    if (!(Test-Path $registryPath))
    {
        # If the registry key doesn't exist, create it
        [Microsoft.Win32.RegistryKey]$HKUCoPilot = [Microsoft.Win32.Registry]::Users.CreateSubKey("temphive\Software\Policies\Microsoft\Windows\WindowsCopilot", [Microsoft.Win32.RegistryKeyPermissionCheck]::ReadWriteSubTree)
        $HKUCoPilot.SetValue("TurnOffWindowsCopilot", 0x1, [Microsoft.Win32.RegistryValueKind]::DWord)
    }





    $HKUCoPilot.Flush()
    $HKUCoPilot.Close()
    [gc]::Collect()
    [gc]::WaitForPendingFinalizers()
    reg unload HKU\temphive


    write-output "Removed"


    foreach ($sid in $UserSIDs)
    {
        $registryPath = "Registry::HKU\$sid\SOFTWARE\Policies\Microsoft\Windows\WindowsCopilot"
        $propertyName = "TurnOffWindowsCopilot"
        $propertyValue = 1

        # Check if the registry key exists
        if (!(Test-Path $registryPath))
        {
            # If the registry key doesn't exist, create it
            New-Item -Path $registryPath -Force | Out-Null
        }

        # Get the property value
        $currentValue = Get-ItemProperty -Path $registryPath -Name $propertyName -ErrorAction SilentlyContinue

        # Check if the property exists and if its value is different from the desired value
        if ($null -eq $currentValue -or $currentValue.$propertyName -ne $propertyValue)
        {
            # If the property doesn't exist or its value is different, set the property value
            Set-ItemProperty -Path $registryPath -Name $propertyName -Value $propertyValue
        }
    }
}
############################################################################################################
#                                              Remove Recall                                               #
#                                                                                                          #
############################################################################################################

#Turn off Recall
write-output "Disabling Recall"
$recall = "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsAI"
If (!(Test-Path $recall))
{
    New-Item $recall
}
Set-ItemProperty $recall DisableAIDataAnalysis -Value 1


$recalluser = 'HKCU:\SOFTWARE\Policies\Microsoft\Windows\WindowsAI'
If (!(Test-Path $recalluser))
{
    New-Item $recalluser
}
Set-ItemProperty $recalluser DisableAIDataAnalysis -Value 1

##Loop through users and do the same
foreach ($sid in $UserSIDs)
{
    $recallusers = "Registry::HKU\$sid\SOFTWARE\Policies\Microsoft\Windows\WindowsAI"
    If (!(Test-Path $recallusers))
    {
        New-Item $recallusers
    }
    Set-ItemProperty $recallusers DisableAIDataAnalysis -Value 1
}

############################################################################################################
write-output "Harden privacy"
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System"

If (!(Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}
New-ItemProperty -Path $regPath -Name "AllowClipboardHistory" -Value 0 -PropertyType DWord -Force | Out-Null
New-ItemProperty -Path $regPath -Name "AllowCrossDeviceClipboard" -Value 0 -PropertyType DWord -Force | Out-Null
New-ItemProperty -Path $regPath -Name "AllowFindMyDevice" -Value 0 -PropertyType DWord -Force | Out-Null

# --- Helper: Ensure registry path exists ---
function Ensure-Key($path) {
    if (!(Test-Path $path)) {
        New-Item -Path $path -Force | Out-Null
    }
}

# Clipboard Privacy
$sysPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System"
Ensure-Key $sysPath
Set-ItemProperty -Path $sysPath -Name "AllowClipboardHistory" -Value 0 -Type DWord -Force
Set-ItemProperty -Path $sysPath -Name "AllowCrossDeviceClipboard" -Value 0 -Type DWord -Force
Set-ItemProperty -Path $sysPath -Name "AllowInputPersonalization" -Value 0 -Type DWord -Force
Set-ItemProperty -Path $sysPath -Name "DisablePrivacyExperience" -Value 1 -Type DWord -Force
# Disable Activity History
Set-ItemProperty -Path $sysPath -Name "EnableActivityFeed" -Value 0 -Type DWord -Force
Set-ItemProperty -Path $sysPath -Name "PublishUserActivities" -Value 0 -Type DWord -Force
Set-ItemProperty -Path $sysPath -Name "UploadUserActivities" -Value 0 -Type DWord -Force


# Disable Advertising ID
$advPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo"
Ensure-Key $advPath
Set-ItemProperty -Path $advPath -Name "DisabledByGroupPolicy" -Value 1 -Type DWord -Force

# Disable Location Services
$locPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors"
Ensure-Key $locPath
Set-ItemProperty -Path $locPath -Name "DisableLocation" -Value 1 -Type DWord -Force

# Diagnostic Data (Required Only)
$diagPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection"
Ensure-Key $diagPath
Set-ItemProperty -Path $diagPath -Name "AllowTelemetry" -Value 0 -Type DWord -Force

# Disable Wi‑Fi Sense / Hotspot 2.0
$wifiPath = "HKLM:\SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager\config"
Ensure-Key $wifiPath
Set-ItemProperty -Path $wifiPath -Name "AutoConnectAllowedOEM" -Value 0 -Type DWord -Force

# Disable Mobile Hotspot
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Network Connections"
Ensure-Key $regPath
Set-ItemProperty -Path $regPath -Name "NC_ShowSharedAccessUI" -Value 0 -Type DWord -Force

# Disable Presence Sensing (Windows 11 23H2+)
$presencePath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System"
Set-ItemProperty -Path $presencePath -Name "EnablePresenceSensing" -Value 0 -Type DWord -Force

############################################################################################################
write-output "Harden MS Edge"
# Disable Microsoft Account Sign-in in Microsoft Edge
# Applies system-wide for all users
$edgePolicyPath = "HKLM:\SOFTWARE\Policies\Microsoft\Edge"
Ensure-Key $edgePolicyPath

# 1. Disable Microsoft Account Sign-in
New-ItemProperty -Path $edgePolicyPath -Name "BrowserSignin" -Value 0 -PropertyType DWORD -Force | Out-Null
New-ItemProperty -Path $edgePolicyPath -Name "NonRemovableProfileEnabled" -Value 0 -PropertyType DWORD -Force | Out-Null

# 3. Disable password saving & autofill
New-ItemProperty -Path $edgePolicyPath -Name "PasswordManagerEnabled" -Value 0 -PropertyType DWORD -Force | Out-Null
New-ItemProperty -Path $edgePolicyPath -Name "AutofillAddressEnabled" -Value 0 -PropertyType DWORD -Force | Out-Null
New-ItemProperty -Path $edgePolicyPath -Name "AutofillCreditCardEnabled" -Value 0 -PropertyType DWORD -Force | Out-Null

# 4. Block all extensions
New-ItemProperty -Path $edgePolicyPath -Name "ExtensionInstallBlocklist" -Value "*" -PropertyType String -Force | Out-Null

# 5. tracking prevention
New-ItemProperty -Path $edgePolicyPath -Name "TrackingPrevention" -Value 1 -PropertyType DWORD -Force | Out-Null

# 6. Lock homepage & startup page - some redundant
New-ItemProperty -Path $edgePolicyPath -Name "NewTabPageContentEnabled" -Value 0 -PropertyType DWORD -Force | Out-Null
New-ItemProperty -Path $edgePolicyPath -Name "HomepageLocation" -Value "about:blank" -PropertyType String -Force | Out-Null
New-ItemProperty -Path $edgePolicyPath -Name "HomepageIsNewTabPage" -Value 0 -PropertyType DWORD -Force | Out-Null
New-ItemProperty -Path $edgePolicyPath -Name "RestoreOnStartup" -Value 1 -PropertyType DWORD -Force | Out-Null
New-ItemProperty -Path $edgePolicyPath -Name "RestoreOnStartupURLs" -Value "about:blank" -PropertyType String -Force | Out-Null
New-ItemProperty -Path $edgePolicyPath -Name "SyncDisabled" -Value 1 -PropertyType DWORD -Force | Out-Null
New-ItemProperty -Path $edgePolicyPath -Name "HubsSidebarEnabled" -Value 0 -PropertyType DWORD -Force | Out-Null
New-ItemProperty -Path $edgePolicyPath -Name "NewTabPageQuickLinksEnabled" -Value 0 -PropertyType DWORD -Force | Out-Null
New-ItemProperty -Path $edgePolicyPath -Name "HideDefaultTopSites" -Value 1 -PropertyType DWORD -Force | Out-Null
New-ItemProperty -Path $edgePolicyPath -Name "NewTabPageAllowedBackgroundTypes" -Value 0 -PropertyType DWORD -Force | Out-Null

# Disable spy
New-ItemProperty -Path $edgePolicyPath -Name "SearchSuggestEnabled" -Value 0 -PropertyType DWORD -Force | Out-Null
New-ItemProperty -Path $edgePolicyPath -Name "ShowSearchSuggestionsGlobal" -Value 0 -PropertyType DWORD -Force | Out-Null
New-ItemProperty -Path $edgePolicyPath -Name "UserFeedbackAllowed" -Value 0 -PropertyType DWORD -Force | Out-Null
New-ItemProperty -Path $edgePolicyPath -Name "PersonalizationReportingEnabled" -Value 0 -PropertyType DWORD -Force | Out-Null
New-ItemProperty -Path $edgePolicyPath -Name "DiagnosticData" -Value 0 -PropertyType DWORD -Force | Out-Null
New-ItemProperty -Path $edgePolicyPath -Name "Edge3PSerpTelemetryEnabled" -Value 0 -PropertyType DWORD -Force | Out-Null


# Pfad zum Engagement-Profil des aktuellen Benutzers
$intentPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\UserProfileEngagement"
Ensure-Key $intentPath
Set-ItemProperty -Path $intentPath -Name "GamingIntent" -Value 0
Set-ItemProperty -Path $intentPath -Name "DevelopmentIntent" -Value 0
Set-ItemProperty -Path $intentPath -Name "PersonalizationIntent" -Value 0
Set-ItemProperty -Path $intentPath -Name "FamilyIntent" -Value 0
Set-ItemProperty -Path $intentPath -Name "SchoolIntent" -Value 0
Set-ItemProperty -Path $intentPath -Name "BusinessIntent" -Value 0

## PROXY stuff
# disable function
$proxyPath = "HKLM:\Software\Microsoft\Windows\CurrentVersion\Internet Settings"
Ensure-Key $proxyPath
Set-ItemProperty -Path $proxyPath -Name "ProxyEnable" -Value 0
Set-ItemProperty -Path $proxyPath -Name "ProxySettingsPerUser" -Value 0
Set-ItemProperty -Path $proxyPath -Name "PreventZonesFromBeingMoved" -Value 1
Remove-ItemProperty -Path $proxyPath -Name "AutoConfigURL" -ErrorAction SilentlyContinue
# disable UX
$proxyPath = "HKLM:\Software\Policies\Microsoft\Internet Explorer\Control Panel"
Ensure-Key $proxyPath
Set-ItemProperty -Path $explorerPath -Name "Connection Settings" -Value 1
Set-ItemProperty -Path $explorerPath -Name "Proxy" -Value 1

############################################################################################################
#                              Remove Legay Windows Features                                               #
#                                                                                                          #
############################################################################################################
write-output "Remove Legay Windows Features"

Dism.exe /Online /Disable-Feature /NoRestart /featurename:FaxServicesClientPackage
Dism.exe /Online /Disable-Feature /NoRestart /featurename:Internet-Explorer-Optional-amd64
Dism.exe /Online /Disable-Feature /NoRestart /featurename:MediaPlayback
Dism.exe /Online /Disable-Feature /NoRestart /featurename:Printing-XPSServices-Features
Dism.exe /Online /Disable-Feature /NoRestart /featurename:SMB1Protocol
Dism.exe /Online /Disable-Feature /NoRestart /featurename:TelnetClient
Dism.exe /Online /Disable-Feature /NoRestart /featurename:WindowsMediaPlayer
Dism.exe /Online /Disable-Feature /NoRestart /featurename:WorkFolders-Client


Start-Sleep -Seconds 60
