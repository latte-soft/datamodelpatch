local l_Actions_0 = require(script:FindFirstAncestor("Navigation").Parent.RoactNavigation).Actions;
local _ = require(script.Parent.NavigationTypes);
local v2 = require(script.Parent.getRootNavigation);
return function(v3)
    local v4 = v2(v3);
    local l_state_0 = v4.state;
    return v4.router.getStateForAction(l_Actions_0.back(), l_state_0) ~= l_state_0;
end;
