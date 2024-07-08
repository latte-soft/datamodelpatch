local l_useSelector_0 = require(script:FindFirstAncestor("RobloxAppHooks").Parent.RoactUtils).Hooks.RoactRodux.useSelector;
local v1 = require(script.Parent.useLocalUserId);
return function()
    local v2 = v1();
    return l_useSelector_0(function(v3)
        return v3.UserRobux[v2];
    end);
end;
