#!/bin/bash

PACKAGE_FILE=$(mktemp)
REMOVE_BING="Microsoft.BingNews Microsoft.BingWeather"
REMOVE_CORTANA="Microsoft.549981C3F5F10"
REMOVE_HELP="MicrosoftCorporationII.QuickAssist Microsoft.GetHelp Microsoft.Getstarted Microsoft.WindowsFeedbackHub"
REMOVE_UTIL="Microsoft.WindowsNotepad Microsoft.PowerAutomateDesktop Microsoft.Paint Microsoft.Windows.Photos Microsoft.WindowsTerminal Microsoft.MicrosoftStickyNotes"
REMOVE_PROD="Microsoft.Todos MicrosoftTeams Microsoft.MicrosoftOfficeHub microsoft.windowscommunicationsapps Microsoft.People"
REMOVE_3RDP="SpotifyAB.SpotifyMusic"
REMOVE_XBOX="Microsoft.XboxGamingOverlay Microsoft.XboxSpeechToTextOverlay Microsoft.XboxGameOverlay Microsoft.Xbox.TCUI Microsoft.XboxIdentityProvider"
REMOVE_OTHER="Microsoft.ZuneMusic Microsoft.ZuneVideo Microsoft.WindowsMaps Microsoft.GamingApp"
REMOVE="$REMOVE_BING $REMOVE_CORTANA $REMOVE_HELP $REMOVE_UTIL $REMOVE_PROD $REMOVE_3RDP $REMOVE_XBOX $REMOVE_OTHER"

powershell Get-AppxPackage -AllUsers | grep PackageFullName > $PACKAGE_FILE
for package in $REMOVE; do
	FULL_PACKAGE_NAME=$(grep -o $package.* $PACKAGE_FILE)
	if [ $? -eq 0 ]; then
		echo Removing $FULL_PACKAGE_NAME
#		powershell Remove-AppxPackage -AllUsers -Package $FULL_PACKAGE_NAME
		powershell Remove-AppxPackage -Package $FULL_PACKAGE_NAME
	fi
done

# https://community.spiceworks.com/topic/2342403-script-to-uninstall-one-drive-from-all-users