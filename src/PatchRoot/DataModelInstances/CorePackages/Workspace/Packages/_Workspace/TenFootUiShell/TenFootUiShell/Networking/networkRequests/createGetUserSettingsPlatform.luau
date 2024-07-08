local l_Url_0 = require(script:FindFirstAncestor("TenFootUiShell").Parent.Http).Url;
local v1 = require(script.Parent.FStringDebugOverrideCrossPlayApiUrl);
return function(v2)
    return v2.roduxNetworking.GET(script, function(v3, v4, v5, v6)
        local v7 = v3(if v1 ~= "" then v1 else l_Url_0.APIS_URL, {
            crossPlaySettingsKey = v5
        }):path("user-settings-api"):path("v1"):path("user-settings");
        if not v6 then
            v7 = v7:path("platform");
        end;
        return v7:queryArgs({
            [not v6 and "requestedPlatformSettings" or "requestedUserSettings"] = v4
        });
    end);
end;
