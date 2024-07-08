local l_script_FirstAncestor_0 = script:FindFirstAncestor("BulkPurchaseApp");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local v2 = require(l_script_FirstAncestor_0.Hooks.NetworkContext);
return function()
    return v1.useContext(v2);
end;
