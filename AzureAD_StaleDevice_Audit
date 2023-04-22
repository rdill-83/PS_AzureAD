# PS AzureAD Device - Stale Device Audit

# Retrieve Devices Not Logged in 60+ Days:
Get-AzureADDevice -All $True | Where {$_.ApproximateLastLogonTimeStamp -le (Get-Date).AddDays(-60)} | Select -Property DisplayName,AccountEnabled,DeviceID,DeviceOSType,DeviceOSVersion,DeviceTrustType,ApproximateLastLogonTimeStamp | Out-File "C:\AzureAD_Devices_Removed_$(Get-Date -f yyyy-MM-dd).txt"
