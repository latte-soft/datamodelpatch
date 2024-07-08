local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Url);
return function(v1)
    return v1(string.format("%sv1/products", v0.PREMIUM_FEATURES), "GET");
end;
