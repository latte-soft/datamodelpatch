local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.AvatarExperience.Common.Thunks.SetFullView);
local v2 = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
return function(v3, v4)
    return function(v5)
        if v5:getState().AvatarExperience.Common.FullView[v4] == v2.SceneFullView then
            v5:dispatch(v1(v3, v4, v2.None));
        end;
    end;
end;
