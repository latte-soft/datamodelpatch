local l_script_FirstAncestor_0 = script:FindFirstAncestor("RobloxAppNavigation");
local v1 = require(l_script_FirstAncestor_0.createAdaptiveSwitchNavigator);
local v2 = require(l_script_FirstAncestor_0.CurrentTabContext);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.RoactNavigation);
local _ = require(l_Parent_0.Navigation);
return function(v7)
    local v8 = v1(v7, {
        defaultNavigationOptions = {
            keepVisitedScreensMounted = true, 
            resetOnBlur = false, 
            backBehavior = v5.BackBehavior.InitialRoute
        }
    });
    local v9 = v4.Component:extend("SwitchNavigatorWrapper");
    v9.router = v8.router;
    v9.render = function(v10)
        local l_state_0 = v10.props.navigation.state;
        return v4.createElement(v2.Provider, {
            value = l_state_0.routes[l_state_0.index].routeName
        }, {
            Navigator = v4.createElement(v8, v10.props)
        });
    end;
    return v9;
end;
