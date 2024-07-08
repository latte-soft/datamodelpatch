local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.AvatarExperience.Common.Thunks.CloseMatchingScreens);
local v2 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v3 = require(l_Modules_0.LuaApp.AppPage);
return function(v4)
    return v1(v4, {
        v2.ItemDetails, 
        v2.SortAndFilters, 
        v3.ProfilePeekView, 
        v3.GameDetail
    });
end;
