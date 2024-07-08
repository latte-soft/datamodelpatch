local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Url);
return function(v1, v2)
    assert(type(v2) == "string", "EconomyGetCurrency request expects userId to be a string");
    return v1(string.format("%s/v1/users/%s/currency", v0.ECONOMY_URL, v2), "GET");
end;
