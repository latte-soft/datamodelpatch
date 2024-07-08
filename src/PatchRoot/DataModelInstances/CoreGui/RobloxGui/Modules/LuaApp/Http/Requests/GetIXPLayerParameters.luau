local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Url);
return function(v1, v2, v3)
    return v1(string.format("%sproduct-experimentation-platform/v1/projects/1/layers/%s/values?parameters=%s", v0.APIS_URL, v2, table.concat(v3, ",")), "GET", {
        maxRetryCount = 0
    });
end;
