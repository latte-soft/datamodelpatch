local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_StackRouter_0 = require(l_CorePackages_0.RoactNavigation).StackRouter;
local v3 = require(l_CorePackages_0.Cryo);
local v4 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarExperienceActions);
return function(v5, v6)
    local v9 = l_StackRouter_0(v5, (v3.Dictionary.join(v6 or {}, {
        getCustomActionCreators = function(_, _)
            return {
                clearScreens = v4.clearScreens
            };
        end
    })));
    local l_getStateForAction_0 = v9.getStateForAction;
    v9.getStateForAction = function(v11, v12)
        if v11.type == v4.ClearScreens then
            local v13 = v3.List.toSet(v11.routeNames);
            local v15 = v3.List.filter(v12.routes, function(v14)
                return not v13[v14.routeName];
            end);
            return (v3.Dictionary.join(v12, {
                routes = v15, 
                index = #v15
            }));
        else
            return l_getStateForAction_0(v11, v12);
        end;
    end;
    return v9;
end;
