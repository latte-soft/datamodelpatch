local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.ArgCheck);
return function(v1, v2)
    v0.isNotNil(v1, "linking");
    v0.isType(v2, "string", "url");
    v1:openURL(v2);
end;
