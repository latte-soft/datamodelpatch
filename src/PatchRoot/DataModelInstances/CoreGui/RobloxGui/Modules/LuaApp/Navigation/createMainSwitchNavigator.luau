local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactNavigation);
local v5 = require(l_Modules_0.LuaApp.Navigation.CurrentTabContext);
local v6 = require(l_Modules_0.LuaApp.FlagSettings);
local function v11(v7, v8)
    for _, v10 in ipairs(v7) do
        if next(v10) == v8 then
            return true;
        end;
    end;
    return false;
end;
return function(v12)
    local v13 = v6.GetDefaultAppPage();
    local v14 = nil;
    if v11(v12, v13) then
        v14 = v13;
    end;
    local v15 = v4.createRobloxSwitchNavigator(v12, {
        initialRouteName = v14, 
        keepVisitedScreensMounted = true, 
        resetOnBlur = false, 
        backBehavior = v4.BackBehavior.InitialRoute
    });
    local v16 = v3.Component:extend("RobloxSwitchNavigator");
    v16.router = v15.router;
    v16.render = function(v17)
        local l_state_0 = v17.props.navigation.state;
        return v3.createElement(v5.Provider, {
            value = l_state_0.routes[l_state_0.index].routeName
        }, {
            Navigator = v3.createElement(v15, v17.props)
        });
    end;
    return v16;
end;
