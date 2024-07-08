local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Actions.SetLocalUserUnder13);
return function(v1, v2)
    local v3 = true;
    if v1 ~= true then
        v3 = false;
    end;
    v1 = v3;
    if v2.type == v0.name then
        return v2.isUnder13;
    else
        return v1;
    end;
end;
