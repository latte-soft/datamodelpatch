local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Url);
return function(v1)
    return v1(string.format("%saccount-security-service/v1/prompt-assignments?shouldReturnMetadata=true", v0.APIS_URL), "GET");
end;
