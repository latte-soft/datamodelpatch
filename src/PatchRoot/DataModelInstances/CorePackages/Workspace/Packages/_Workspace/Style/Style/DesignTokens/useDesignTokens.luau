local l_Parent_0 = script:FindFirstAncestor("Style").Parent;
local v1 = require(l_Parent_0.ArgCheck);
local v2 = require(l_Parent_0.Dash);
local v3 = require(l_Parent_0.React);
local v4 = require(script.Parent.DesignTokenContext);
return function(v5)
    local v6 = v3.useContext(v4);
    local v7 = v5 or v2.identity;
    v1.assert(v6, "Design Tokens not found, ensure AppStyleProvider has been configured correctly.");
    return v7(v6);
end;
