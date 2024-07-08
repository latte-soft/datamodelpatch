local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Actions.SetScreenSize);
return function(v1, v2)
    v1 = v1 or Vector2.new(0, 0);
    assert(v1, "");
    if v2.type == v0.name then
        return v2.screenSize;
    else
        return v1;
    end;
end;
