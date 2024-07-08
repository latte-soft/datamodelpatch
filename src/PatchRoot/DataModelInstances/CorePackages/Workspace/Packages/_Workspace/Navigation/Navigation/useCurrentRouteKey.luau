local l_Parent_0 = script:FindFirstAncestor("Navigation").Parent;
local v1 = require(script.Parent.getCurrentRouteKey);
local l_useNavigation_0 = require(l_Parent_0.RoactUtils).Hooks.useNavigation;
return function()
    return v1((l_useNavigation_0()));
end;
