param(
[Parameter(Mandatory)]
[String]$MACAddress
)

Import-Module ActiveDirectory
Import-Module DHCPServer

$MACAddress=$MACAddress.Replace(":","-")
$DHCPServerList=Get-DHCPServerinDC

ForEach($DHCPServer in $DHCPServerList){
   $ServerName=$DHCPServer.dnsname
   Write-Host "Searching $ServerName ..."
   Get-DHCPServerv4Scope -ComputerName $ServerName | Get-DHCPServerv4Lease -ErrorAction SilentlyContinue -ClientID $MACAddress
}
