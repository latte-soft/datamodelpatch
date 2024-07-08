local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarRouteContext);
local v2 = require(l_Modules_0.AvatarExperience.Common.withContextValue);
return function(v3, v4)
    return v2(v3, v1.Consumer, "avatarRoute", v4);
end;
