local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Actions.SetPlatform);
return function(v1, v2)
    v1 = v1 or Enum.Platform.None;
    assert(v1, "");
    if v2.type == v0.name then
        return v2.platform;
    else
        return v1;
    end;
end;
