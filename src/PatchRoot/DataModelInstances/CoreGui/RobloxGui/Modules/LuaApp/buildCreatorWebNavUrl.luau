local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.UrlBuilder);
local v1 = require(script.Parent.buildRobloxWebNavQueryParams);
return function(v2)
    return v0.addQueryString(v0.static.creatorHub(), v1(v2));
end;
