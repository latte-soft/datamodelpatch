local l_Parent_0 = script:FindFirstAncestor("RobloxAppNavigation").Parent;
local l_StackRouter_0 = require(l_Parent_0.RoactNavigation).StackRouter;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(script.Parent.LuaAppNavigationActions);
return function(v4, v5)
    local v8 = l_StackRouter_0(v4, (v2.Dictionary.join(v5 or {}, {
        getCustomActionCreators = function(_, _)
            return {
                clearAppScreens = v3.clearAppScreens
            };
        end
    })));
    local l_getStateForAction_0 = v8.getStateForAction;
    v8.getStateForAction = function(v10, v11)
        if v10.type == v3.ClearAppScreensAction then
            local v12 = v2.List.toSet(v10.routeNames);
            local v14 = v2.List.filter(v11.routes, function(v13)
                return not v12[v13.routeName];
            end);
            return (v2.Dictionary.join(v11, {
                routes = v14, 
                index = #v14
            }));
        else
            return l_getStateForAction_0(v10, v11);
        end;
    end;
    return v8;
end;
