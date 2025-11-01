param(
[Parameter(Mandatory)]
[String]$MACAddress
)

Import-Module ActiveDirectory
Import-Module DHCPServer

$MACAddress=$MACAddress.Replace(":","-")
$DHCPServerList=Get-ADComputer -filter * -Searchbase "OU=DHCP,OU=Servers,DC=domain,DC=com"

ForEach($DHCPServer in $DHCPServerList){
    $ServerName=$DHCPServer.dnshostname
   Write-Host "Searching $ServerName ..."
   Get-DHCPServerv4Scope -ComputerName $ServerName | Get-DHCPServerv4Lease -ErrorAction SilentlyContinue -ClientID $MACAddress
}
