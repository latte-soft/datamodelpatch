local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Url);
return function(v1)
    return v1(v0.APIS_URL .. "identity-verification-service/v1/vietnam/start-verification-form", "GET");
end;
