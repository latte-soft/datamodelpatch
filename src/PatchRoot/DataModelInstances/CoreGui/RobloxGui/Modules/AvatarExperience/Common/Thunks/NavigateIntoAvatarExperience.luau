local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v2 = require(l_Modules_0.LuaApp.Thunks.NavigateToRoute);
local v3 = require(l_Modules_0.AvatarExperience.Common.Actions.ApplyNavigateIntoAvatarExperience);
local v4 = {
    {
        name = v1.AvatarExperienceRoot
    }
};
return function(v5, v6, v7)
    return function(v8)
        v8:dispatch(v3(v5, v6));
        v8:dispatch(v2(v4, v7));
    end;
end;
