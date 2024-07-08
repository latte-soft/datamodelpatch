local l_script_FirstAncestor_0 = script:FindFirstAncestor("Modules");
local v1 = require(l_script_FirstAncestor_0.AvatarExperience.Common.Components.RoactNavigation.AppRouterWrapper.NavigateDownToAvatarScreen);
local _ = require(l_script_FirstAncestor_0.LuaApp.AppPage);
local v3 = require(l_script_FirstAncestor_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
return function(v4, v5, _)
    return function(v7)
        v7:dispatch(v1(v3.ItemDetails, v5 .. v4, {
            itemId = v4, 
            itemType = v5, 
            mountAsFullView = true, 
            mountAnimation = false, 
            fromProfile = true, 
            itemDetailsPeekViewRefs = {}
        }));
    end;
end;
