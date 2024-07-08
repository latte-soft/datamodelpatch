local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.AvatarExperienceRhodiumTest.Helpers.withAvatarRouteProvider);
local v2 = require(l_Modules_0.AvatarExperienceRhodiumTest.Helpers.withSceneInteractionProvider);
local v3 = require(l_Modules_0.AvatarExperienceRhodiumTest.Helpers.withPageObjectManagerProvider);
return function(v4, v5)
    local v6 = v5 or {};
    return (v3(v2((v1(v4, v6.avatarRoute))), v6.pageObjectManager));
end;
