local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local v2 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.UrlBuilder);
local _ = require(l_CorePackages_0.Workspace.Packages.Http).Url;
return function(v4, v5, v6)
    return v4(v2.fromString("apis:sharelinks/v1/get-metadata")(), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            linkId = v5, 
            linkType = v6
        })
    });
end;
