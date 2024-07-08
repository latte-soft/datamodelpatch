local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_Url_0 = require(l_CorePackages_0.Workspace.Packages.Http).Url;
return function(v3, v4, v5)
    assert(type(v4) == "boolean", "UserOptIn request expects isUserOptIn to be a boolean");
    local v6 = string.format("%sv1/settings/user-opt-in/", l_Url_0.VOICE_URL);
    local v7 = nil;
    if v5 ~= nil then
        assert(type(v5) == "boolean", "UserOptIn request expects isOptedInThroughUpsell to be a boolean");
        v7 = l_HttpService_0:JSONEncode({
            isUserOptIn = v4, 
            isOptedInThroughUpsell = v5
        });
    else
        v7 = l_HttpService_0:JSONEncode({
            isUserOptIn = v4
        });
    end;
    return v3(v6, "POST", {
        postBody = v7
    });
end;
