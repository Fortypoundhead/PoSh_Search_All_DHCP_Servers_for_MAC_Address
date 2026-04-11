# Search_All_DHCP_Servers_for_MAC_Address

This PowerShell script searches all Microsoft-based DHCP servers in your Active Directory domain for a specific MAC address to find which server has issued a lease for that device.

## Prerequisites

- Windows PowerShell
- Active Directory module (typically available on domain-joined machines)
- DHCP Server module
- Access to Active Directory to query DHCP servers
- Permissions to query DHCP servers

## Usage

Run the script with the MAC address as a parameter. The MAC address can be in colon-separated format (e.g., `00:11:22:33:44:55`) or dash-separated format (e.g., `00-11-22-33-44-55`).

```powershell
.\Find_MAC.PS1 -MACAddress "00-11-22-33-44-55"
```

The script will:
1. Query Active Directory for all DHCP servers in the specified OU (`OU=DHCP,OU=Servers,DC=domain,DC=com`)
2. Search each DHCP server for active leases matching the provided MAC address
3. Display the results for each server

## Configuration

The script is hardcoded to search DHCP servers in `OU=DHCP,OU=Servers,DC=domain,DC=com`. You may need to modify this path to match your domain structure.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.