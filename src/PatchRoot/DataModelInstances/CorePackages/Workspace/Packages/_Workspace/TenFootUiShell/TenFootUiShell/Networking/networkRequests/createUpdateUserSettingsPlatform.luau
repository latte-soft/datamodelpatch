local l_Url_0 = require(script:FindFirstAncestor("TenFootUiShell").Parent.Http).Url;
local v1 = require(script.Parent.FStringDebugOverrideCrossPlayApiUrl);
return function(v2)
    return v2.roduxNetworking.POST(script, function(v3, v4, v5, v6, v7)
        local v8 = v3(if v1 ~= "" then v1 else l_Url_0.APIS_URL, {
            crossPlaySettingsKey = v5, 
            crossPlayValue = v6
        }):path("user-settings-api"):path("v1"):path("user-settings");
        if not v7 then
            v8 = v8:path("platform");
        end;
        return v8:body({
            [v4] = v6
        });
    end);
end;
