local l_Parent_0 = script:FindFirstAncestor("DiscoveryUtils").Parent;
local l_SystemInfoProtocol_0 = require(l_Parent_0.SystemInfoProtocol).SystemInfoProtocol;
local v2 = require(l_Parent_0.ArgCheck);
local v3 = {
    [l_SystemInfoProtocol_0.InfoNames.MANUFACTURER] = "deviceManufacturer", 
    [l_SystemInfoProtocol_0.InfoNames.BASE_OS] = "operatingSystemVersion", 
    [l_SystemInfoProtocol_0.InfoNames.IS_64BIT] = "if64Bit", 
    [l_SystemInfoProtocol_0.InfoNames.CPU_CORE_COUNT] = "cpuCores"
};
return function(v4, v5)
    local v6 = v5 or l_SystemInfoProtocol_0.ALL_INFO_NAMES;
    local l_status_0, l_result_0 = pcall(function()
        return l_SystemInfoProtocol_0.default:getSystemInfo(v6);
    end);
    if l_status_0 and typeof(l_result_0) == "table" then
        for v9, v10 in pairs(l_result_0) do
            local v11 = v3[v9] or v9;
            v2.assert(v4[v11] == nil, "Field '" .. tostring(v11) .. "' already exists in argument table  Will be overwritten.");
            v4[v11] = v10;
        end;
    end;
end;
