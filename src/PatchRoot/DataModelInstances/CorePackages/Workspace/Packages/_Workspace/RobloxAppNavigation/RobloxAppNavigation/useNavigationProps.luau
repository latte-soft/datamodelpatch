local l_useNavigation_0 = require(script:FindFirstAncestor("RobloxAppNavigation").Parent.RoactUtils).Hooks.useNavigation;
local _ = require(script.Parent.types);
return function(v2)
    local v3 = l_useNavigation_0();
    return v2(v3.getParam("detail"), v3.getParam("extraProps", {}), v3);
end;
