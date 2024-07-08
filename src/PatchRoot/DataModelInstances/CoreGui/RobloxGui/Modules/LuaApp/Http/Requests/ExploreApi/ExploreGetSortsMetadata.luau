local l_CorePackages_0 = game:GetService("CorePackages");
local l_UrlBuilder_0 = require(l_CorePackages_0.Packages.UrlBuilder).UrlBuilder;
local v2 = l_UrlBuilder_0.new({
    base = require(l_CorePackages_0.Workspace.Packages.Http).Url.APIS_URL, 
    path = "/explore-api/v1/get-sorts-metadata"
});
return function(v3, v4)
    return v3(l_UrlBuilder_0.addQueryString(v2(), {
        sessionId = v4
    }), "GET");
end;
