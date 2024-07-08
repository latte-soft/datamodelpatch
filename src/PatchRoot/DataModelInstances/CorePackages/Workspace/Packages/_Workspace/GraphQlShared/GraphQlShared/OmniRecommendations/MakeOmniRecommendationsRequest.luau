local l_Parent_0 = script:FindFirstAncestor("GraphQlShared").Parent;
local l_SystemInfoProtocol_0 = require(l_Parent_0.SystemInfoProtocol).SystemInfoProtocol;
local v2 = require(l_Parent_0.ArgCheck);
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local l_Url_0 = require(l_Parent_0.Http).Url;
local l_HttpService_0 = game:GetService("HttpService");
local l_AddSystemInfoToArgs_0 = require(l_Parent_0.DiscoveryUtils).AddSystemInfoToArgs;
local l_GetFFlagOmniSearchSystemInfo_0 = require(l_Parent_0.SharedFlags).GetFFlagOmniSearchSystemInfo;
local v8 = l_UrlBuilder_0.new({
    base = l_Url_0.APIS_URL, 
    path = "/discovery-api/omni-recommendation"
});
local v9 = if not l_GetFFlagOmniSearchSystemInfo_0() then {
    [l_SystemInfoProtocol_0.InfoNames.MANUFACTURER] = "deviceManufacturer", 
    [l_SystemInfoProtocol_0.InfoNames.BASE_OS] = "operatingSystemVersion", 
    [l_SystemInfoProtocol_0.InfoNames.IS_64BIT] = "if64Bit", 
    [l_SystemInfoProtocol_0.InfoNames.CPU_CORE_COUNT] = "cpuCores"
} else nil;
return function(v10, v11, v12, v13, v14, v15)
    local v16 = {
        pageType = v11, 
        sessionId = v12, 
        pageToken = v13, 
        supportedTreatmentTypes = v14, 
        requestIntent = v15
    };
    if not l_GetFFlagOmniSearchSystemInfo_0() then
        if v9 then
            local l_status_0, l_result_0 = pcall(function()
                return l_SystemInfoProtocol_0.default:getSystemInfo(l_SystemInfoProtocol_0.ALL_INFO_NAMES);
            end);
            if l_status_0 and typeof(l_result_0) == "table" then
                for v19, v20 in pairs(l_result_0) do
                    local v21 = v9[v19] or v19;
                    v2.assert(v16[v21] == nil, "Field '" .. tostring(v21) .. "' already exists in omni-recommendation fetch  Will be overwritten.");
                    v16[v21] = v20;
                end;
            end;
        end;
    else
        l_AddSystemInfoToArgs_0(v16);
    end;
    return v10(v8(), "POST", {
        postBody = l_HttpService_0:JSONEncode(v16)
    });
end;
