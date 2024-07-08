local l_Parent_0 = script:FindFirstAncestor("RobloxAppHooks").Parent;
local v1 = require(l_Parent_0.React);
local l_RoactServicesContext_0 = require(l_Parent_0.RoactServices).RoactServicesContext;
return function(v3)
    return (v3.get((v1.useContext(l_RoactServicesContext_0))));
end;
