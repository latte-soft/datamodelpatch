local l_HttpService_0 = game:GetService("HttpService");
local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(l_CorePackages_0.Workspace.Packages.Http).Url;
local l_UrlBuilder_0 = require(l_CorePackages_0.Packages.UrlBuilder).UrlBuilder;
local v4 = game:DefineFastInt("UsernameRecommendationDisplayNameMaxRetryCount", 0);
local v5 = l_UrlBuilder_0.fromString("auth:v1/validators/recommendedUsernameFromDisplayName");
return function(v6, v7, v8)
    return v6(v5(), "POST", {
        maxRetryCount = v4, 
        postBody = l_HttpService_0:JSONEncode({
            displayName = v7, 
            birthday = v8
        })
    });
end;
