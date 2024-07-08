local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute);
local v4 = require(l_Modules_0.AvatarExperience.Common.withMappedProps);
local function v6(v5)
    return v2.Dictionary.join(v5, {
        avatarRoute = v2.None, 
        opaqueRoute = v5.avatarRoute.opaque
    });
end;
return function(v7)
    return v3(v4(v7, v6));
end;
