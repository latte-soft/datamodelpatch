local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local v2 = require(l_Modules_0.LuaApp.LocalizationContext);
local v3 = require(l_Modules_0.LuaApp.Flags.GetFStringApisCdnUrl);
local v4 = {
    ["zh-cn"] = "zh-hans", 
    ["zh-tw"] = "zh-hant"
};
local v5 = v1.new({
    base = v3(), 
    path = "/games-autocomplete/v1/request-local-cache/{variationId}", 
    query = "{cursor}&{language}"
});
return function(v6, v7, v8, v9)
    return v6(v5({
        variationId = v9 or 0, 
        cursor = v7, 
        language = (v4[v8] or v2.getBaseLanguage(v8 or "")) or ""
    }), "GET", {
        maxRetryCount = 0
    });
end;
