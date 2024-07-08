local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v2 = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
return function(v3, v4)
    return function(v5)
        for _, v7 in v5:getState().AvatarExperience.Common.FullView, nil, nil do
            if v7 == v2.SceneFullView then
                return ;
            end;
        end;
        v4.navigate(v1.AvatarExperienceQuickMenu, {
            onOverlayClosed = v3
        });
    end;
end;
