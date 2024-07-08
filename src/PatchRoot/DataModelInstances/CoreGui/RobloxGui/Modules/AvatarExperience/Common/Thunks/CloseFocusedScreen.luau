local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.RoactNavigation);
local v3 = require(l_Modules_0.LuaApp.Navigation.isRootRouteInRN);
local v4 = require(l_Modules_0.LuaApp.Thunks.NavigateBack);
local v5 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
return function(v6)
    return function(v7)
        if not v3(v5.getRootNavigation(v6).state) then
            v6.dispatch(v2.Actions.back(nil));
            return ;
        else
            v7:dispatch(v4(false));
            return ;
        end;
    end;
end;
