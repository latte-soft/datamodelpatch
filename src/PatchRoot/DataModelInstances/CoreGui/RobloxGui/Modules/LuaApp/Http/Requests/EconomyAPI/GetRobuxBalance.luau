local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Url);
return function(v1)
    return v1(("%s/v1/user/currency"):format(v0.ECONOMY_URL), "GET");
end;
