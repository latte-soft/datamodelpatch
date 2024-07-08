local v0 = require(script:FindFirstAncestor("Profile").dependencies);
local l_Roact_0 = v0.Roact;
local l_RoactNavigation_0 = v0.RoactNavigation;
return function(v3)
    return l_Roact_0.createElement((l_RoactNavigation_0.createAppContainer(l_RoactNavigation_0.createRobloxStackNavigator(v3, {}), nil)));
end;
