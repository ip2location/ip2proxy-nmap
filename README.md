## IP2Proxy Nmap script

This IP2Proxy Nmap script allows user to query an IP address if it was being used as VPN anonymizer, open proxies, web proxies, Tor exits, data center, web hosting (DCH) range, search engine robots (SES) and residential (RES) by using the IP2Proxy Lua Package. 

The database will be updated on a monthly basis for greater accuracy. Free LITE databases are available at <https://lite.ip2location.com/> upon registration.

The paid databases are available at [https://www.ip2location.com](https://www.ip2location.com/) under Premium subscription package.

Both IPv4 and IPv6 are supported.

## Installation

If the Luarocks have installed with the latest dependency (5.3), you can install with the following steps:

1. Download and unzip the package. 

2. Copy the ip-proxy-ip2proxy.nse to your Nmap program directory/scripts. 

   Note: The default Nmap program directory for Linux user should be under /usr/share/, for example /usr/share/nmap. For Windows user, the Nmap directory should be C:\Program Files (x86)\Nmap.

3. Install the [IP2Proxy Lua](https://github.com/ip2location/ip2proxy-lua) Library by using this command: `luarocks install ip2proxy` 

4. Download the database from <https://lite.ip2location.com/> for free version or [https://www.ip2location.com](https://www.ip2location.com/) for paid version.

However, if the Luarocks is not installed, or you do not prefer to install the Luarocks, you can also install the script manually with the following steps:

1. Download and unzip the package. 

2. Copy the ip-proxy-ip2proxy.nse to your Nmap program directory/scripts.

   Note: The default Nmap program directory for Linux user should be under /usr/share/, for example /usr/share/nmap. For Windows user, the Nmap directory should be C:\Program Files (x86)\Nmap.

3. Get the [ip2proxy.lua](https://github.com/ip2location/ip2proxy-lua/blob/master/ip2proxy.lua) & [BigNum library](https://github.com/user-none/lua-nums) and copy it to your Nmap program directory/nselib.

4. Download the database from https://lite.ip2location.com/ for free version or [https://www.ip2location.com](https://www.ip2location.com/) for paid version.



## Usage

`nmap --script ip-proxy-ip2proxy <target> --script-args ip-proxy-ip2proxy.ip2proxy_db=<database_path>`

Replace the `<target>` with the IP Address that you wish to search and the `<database_path>` with the IP2Proxy database file path in your computer. Remember to put double backslashes (\\\\) instead of single backslash(\\) in the path.

## Parameters

**ip2proxy_db**

Indicates the path of the database file to use.

# Copyright

Copyright (C) 2022 by IP2Location.com, [support@ip2location.com](mailto:support@ip2location.com)
