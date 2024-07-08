local l_Parent_0 = script:FindFirstAncestor("RoactUtils").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.RoactNavigation);
return function()
    return v1.useContext(v2.Context);
end;
