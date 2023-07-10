# View AzureAD Devices - 60+ Days Inactive:
Get-AzureADDevice -All $True | Where {$_.ApproximateLastLogonTimeStamp -le (Get-Date).AddDays(-60)} | Select -Property DisplayName,AccountEnabled,DeviceID,DeviceOSType,DeviceOSVersion,DeviceTrustType,ApproximateLastLogonTimeStamp 

# Remove AzureAD Devices - 60+ Days Inactive:
Get-AzureADDevice -All $True | Where {$_.ApproximateLastLogonTimeStamp -le (Get-Date).AddDays(-60)} | Remove-AzureADDevice
