local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.Common.Immutable);
local v2 = require(l_Modules_0.LuaApp.Actions.Games.SetRecommendedGameEntries);
return function(v3, v4)
    v3 = v3 or {};
    assert(v3, "");
    if v4.type == v2.name then
        v3 = v1.Set(v3, v4.universeId, v4.entries);
    end;
    return v3;
end;
