local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Http.Url);
local v2 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local _ = game:GetService("HttpService");
local v4 = v2.new({
    base = v1.APIS_URL, 
    path = "asset-text-filter-settings/public/universe/{universeId}"
});
return function(v5, v6)
    assert(type(v6) == "string", "GetAssetTextFilterSettings request expects universeId to be a string");
    return v5(v4({
        universeId = v6
    }), "GET");
end;
