local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Debug.dumpNavigationHierarchy);
local v2 = require(l_Modules_0.AvatarExperience.Common.Debug.LogTree).logger("ax.rn.state");
return function(v3, v4)
    if v4 == nil then
        v4 = v2.active[v2.Levels.Trace];
    end;
    if v4 then
        local v5 = nil;
        return function(_, v7, v8)
            local v9 = v1(v7);
            print(string.format("[%s] action: %s\n%s", v3, tostring(v8.type), v9 == v5 and "" or v9));
            v5 = v9;
        end;
    else
        return function(_, _, _)
        end;
    end;
end;
