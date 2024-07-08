local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v3 = require(l_Modules_0.LuaApp.Actions.ApplySetNavigationLocked);
return function(v4)
    v2.isType(v4, "function", "navigationCallback");
    return function(v5)
        if not v5:getState().Navigation.lockNavigationActions then
            v5:dispatch(v3(true));
            v4();
            return ;
        else
            return ;
        end;
    end;
end;
