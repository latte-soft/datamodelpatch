local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.AvatarExperience.Common.Thunks.CloseMatchingScreens);
local v2 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
return function(v3)
    return v1(v3, {
        v2.ItemDetails
    });
end;
