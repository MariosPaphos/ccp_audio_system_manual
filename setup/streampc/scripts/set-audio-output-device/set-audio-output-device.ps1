﻿# As an administrator, this needs to be installed:
# Install-Module -Name AudioDeviceCmdlets


Import-Module AudioDeviceCmdlets

# Set the desired part of the device name to search for
$deviceNamePart = 'Realtek'

# Get the list of audio devices that match the search text
$device = Get-AudioDevice -List | Where-Object { $_.Type -eq 'Playback' -and $_.Name -like "*$deviceNamePart*" } | Select-Object -First 1

# Set the device as the default audio output device if it is found
if ($device) {
    Set-AudioDevice -Index $device.Index
    Write-Output "All cool!"
} else {
    Write-Output "No audio output device found containing the text '$deviceNamePart'."
}
