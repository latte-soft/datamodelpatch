local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v2 = require(l_Modules_0.AvatarExperience.Common.Thunks.NavigateWithLock);
local v3 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
return function(v4, v5)
    return function(v6)
        v6:dispatch(v2(function()
            v3.closeFiltersAndItemDetails(v4);
            v3.closeTryOnManager(v4);
            v4.navigate(v1.ItemDetails, v5);
        end));
    end;
end;
