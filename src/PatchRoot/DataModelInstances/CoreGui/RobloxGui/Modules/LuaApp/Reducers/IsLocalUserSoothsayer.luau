local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Actions.SetIsLocalUserSoothsayer);
return function(v1, v2)
    local v3 = v1 or false;
    if v2.type == v0.name then
        return v2.isSoothsayer;
    else
        return v3;
    end;
end;
