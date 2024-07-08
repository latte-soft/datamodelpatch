local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Actions.SetNativeLocaleName);
return function(v1, v2)
    v1 = v1 or "";
    assert(v1, "");
    if v2.type == v0.name then
        v1 = v2.nativeLocaleName;
    end;
    return v1;
end;
