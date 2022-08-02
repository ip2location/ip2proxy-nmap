local ip2proxy = require "ip2proxy"
local nmap = require "nmap"
local stdnse = require "stdnse"

description = [[
Use IP2Proxy database to lookup the proxy information with IP2Proxy Lua Package. It allows user to query an IP address if it was being used as VPN anonymizer, open proxies, web proxies, Tor exits, data center, web hosting (DCH) range, search engine robots (SES) and residential (RES). It lookup the proxy IP address from IP2Proxy BIN Data file.

The database will be updated on a monthly basis for greater accuracy. Free LITE databases are available at https://lite.ip2location.com/ upon registration.

The paid databases are available at https://www.ip2location.com under Premium subscription package.

Both IPv4 and IPv6 are supported.

]]

---
-- @usage
-- nmap --script ip-proxy-ip2proxy <target> --script-args ip-proxy-ip2proxy.ip2proxy_db=<database_path>
-- 
-- @arg ip2proxy_db string indicates the path of the database file to use to query the info.
--
-- @output
-- 8.8.8.8
-- country_short: US
-- country_long: United States of America
-- region: California
-- city: Mountain View
-- isp: Google LLC
-- domain: google.com
-- usagetype: DCH
-- asn: 15169
-- as: Google LLC
-- lastseen: 27
-- threat: -
-- provider: -
-- proxytype: DCH
-- isproxy: 2

author = "IP2Location"
license = "Same as Nmap--See https://nmap.org/book/man-legal.html"
categories = {"discovery","external","safe"}


hostrule = function(host)
--   if nmap.address_family() ~= "inet" then
--     stdnse.verbose1("Only IPV4 address is supported at the moment.")
     -- return false
--     return nil
--   end
  
  return true
end

local fetch_ip_info = function (ip)
  print (ip)
  local db_name = stdnse.get_script_args(SCRIPT_NAME .. ".ip2proxy_db")
  -- local db_path = "nselib/data/"..db_name
  local db_path = db_name
  local ip2prox = ip2proxy:open(db_path)
  local result = ip2prox:get_all(ip)
  return result
end

action = function(host,port)
  local result = fetch_ip_info(host.ip)
  print("country_short: " .. result.country_short)
  print("country_long: " .. result.country_long)
  -- Replace the message "This parameter is unavailable for selected data file. Please upgrade the data file." with "N/A"
  if ((result.region) == "This parameter is unavailable for selected data file. Please upgrade the data file.") then 
    print("region: N/A")
  else
    print("region: " .. result.region)
  end
  if ((result.city) == "This parameter is unavailable for selected data file. Please upgrade the data file.") then 
    print("city: N/A")
  else
    print("city: " .. result.city)
  end
  if ((result.isp) == "This parameter is unavailable for selected data file. Please upgrade the data file.") then 
    print("isp: N/A")
  else
    print("isp: " .. result.isp)
  end
  if ((result.domain) == "This parameter is unavailable for selected data file. Please upgrade the data file.") then 
    print("domain: N/A")
  else
    print("domain: " .. result.domain)
  end
  if ((result.usagetype) == "This parameter is unavailable for selected data file. Please upgrade the data file.") then 
    print("usagetype: N/A")
  else
    print("usagetype: " .. result.usagetype)
  end
  if ((result.asn) == "This parameter is unavailable for selected data file. Please upgrade the data file.") then 
    print("asn: N/A")
  else
    print("asn: " .. result.asn)
  end
  if ((result.as) == "This parameter is unavailable for selected data file. Please upgrade the data file.") then 
    print("as: N/A")
  else
    print("as: " .. result.as)
  end
  if ((result.lastseen) == "This parameter is unavailable for selected data file. Please upgrade the data file.") then 
    print("lastseen: N/A")
  else
    print("lastseen: " .. result.lastseen)
  end
  if ((result.threat) == "This parameter is unavailable for selected data file. Please upgrade the data file.") then 
    print("threat: N/A")
  else
    print("threat: " .. result.threat)
  end
  if ((result.provider) == "This parameter is unavailable for selected data file. Please upgrade the data file.") then 
    print("provider: N/A")
  else
    print("provider: " .. result.provider)
  end
  if ((result.proxytype) == "This parameter is unavailable for selected data file. Please upgrade the data file.") then 
    print("proxytype: N/A")
  else
    print("proxytype: " .. result.proxytype)
  end
  if ((result.isproxy) == "This parameter is unavailable for selected data file. Please upgrade the data file.") then 
    print("isproxy: N/A")
  else
    print("isproxy: " .. result.isproxy)
  end

end