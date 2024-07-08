local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.Common.Immutable);
local v2 = require(l_Modules_0.LuaApp.Actions.SetGameFollowingStatus);
local v3 = require(l_Modules_0.LuaApp.Actions.SetGameFollow);
return function(v4, v5)
    v4 = v4 or {};
    if v5.type == v2.name then
        return (v1.Set(v4, v5.universeId, {
            canFollow = v5.canFollow, 
            isFollowed = v5.isFollowed
        }));
    else
        if v5.type == v3.name then
            local v6 = v4[v5.universeId];
            if v6 then
                v4 = v1.Set(v4, v5.universeId, (v1.Set(v6, "isFollowed", v5.isFollowed)));
            end;
        end;
        return v4;
    end;
end;
