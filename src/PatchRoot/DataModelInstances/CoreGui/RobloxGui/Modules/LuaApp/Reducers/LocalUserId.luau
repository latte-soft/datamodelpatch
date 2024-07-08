local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Actions.SetLocalUserId);
return function(v1, v2)
    if v2.type == v0.name then
        return v2.userId;
    else
        return v1 or "";
    end;
end;
