# AAD-Device_Validate_Exists

# $CSComps = Import-CSV -Path C:\_IT-Temp\CS_Hosts.csv

$Result=@()

Import-CSV -Path C:\_IT-Temp\CS_Hosts.csv | ForEach-Object {
	$Comp = $_."HostName"
	$CompObj = $(try {Get-AzureADDevice -SearchString $Comp} catch {$null})
	if ($compobj -ne $null) {
		$compExists = $true
	}else{
		$compExists = $false
	}
$Result += New-Object PSObject -Property @{
		Computer_Name 	= $comp
		Computer_Exists = $compExists }
}
$Result | Sort Computer_Name | Select Computer_Name,Computer_Exists
		
# Show only Comps that don't Exists
# $Result | Where {$_.Computer_Exists -eq $False} | Sort Computer_Name | Select Computer_Name,Computer_Exists 
		
		
		
		
		
# Formatting Source: https://morgantechspace.com/2016/11/check-if-ad-user-exists-with-powershell.html