local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Url);
return function(v1, v2)
    return v1(string.format("%sv1/universes/%d/badges", v0.BADGES_URL, v2), "GET");
end;
