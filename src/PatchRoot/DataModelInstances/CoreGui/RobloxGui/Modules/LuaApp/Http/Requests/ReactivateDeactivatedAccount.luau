local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Url);
return function(v1)
    return v1(v0.APIS_URL .. "account-deletion-api/v1/reactivate", "POST");
end;
