local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarRouteContext);
local v2 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v3 = require(l_Modules_0.AvatarExperienceRhodiumTest.Helpers.withContextProvider);
local v4 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarRoute);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local function v8(v6)
    local v7 = {
        name = v6, 
        key = v6, 
        params = {}
    };
    return v4.new({
        current = v7, 
        previousPages = {
            v7
        }, 
        opaque = v7, 
        isVisible = true, 
        isOverlayVisible = false
    });
end;
local function v16(v9)
    v9 = v9 or {};
    local v10 = v9.current or {};
    local v11 = v9.previous or {};
    local v12 = v9.opaque or {};
    local v13 = v10.name or v2.None;
    local v14 = v11.name or v2.None;
    local v15 = v12.name or v2.None;
    return v4.new({
        current = {
            name = v13, 
            key = v10.key or v13, 
            params = v10.params or {}
        }, 
        previousPages = {
            {
                name = v14, 
                key = v11.key or v14, 
                params = v11.params or {}
            }
        }, 
        opaque = {
            name = v15, 
            key = v12.key or v15, 
            params = v12.params or {}
        }, 
        isVisible = v9.isVisible ~= false, 
        isOverlayVisible = v9.isOverlayVisible == true
    });
end;
return function(v17, v18)
    return v3(v17, v1.Provider, if type(v18) == "string" then v8(v18) else v16(v18));
end;
