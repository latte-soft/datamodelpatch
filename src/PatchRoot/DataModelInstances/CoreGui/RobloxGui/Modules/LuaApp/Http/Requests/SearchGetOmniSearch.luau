local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.LuaApp.Http.Url);
local l_AddSystemInfoToArgs_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryUtils).AddSystemInfoToArgs;
local l_GetFFlagOmniSearchSystemInfo_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagOmniSearchSystemInfo;
return function(v5, v6)
    local l_APIS_URL_0 = v2.APIS_URL;
    if l_GetFFlagOmniSearchSystemInfo_0() then
        l_AddSystemInfoToArgs_0(v6);
    end;
    return v5(string.format("%ssearch-api/omni-search?%s", l_APIS_URL_0, (v2:makeQueryString(v6))), "GET");
end;
