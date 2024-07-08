local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_UrlBuilder_0 = require(l_CorePackages_0.Packages.UrlBuilder).UrlBuilder;
local v3 = l_UrlBuilder_0.new({
    base = require(l_Modules_0.LuaApp.Http.Url).APIS_URL, 
    path = "/explore-api/v1/get-sort-content"
});
return function(v4, v5)
    return v4(l_UrlBuilder_0.addQueryString(v3(), v5), "GET");
end;
