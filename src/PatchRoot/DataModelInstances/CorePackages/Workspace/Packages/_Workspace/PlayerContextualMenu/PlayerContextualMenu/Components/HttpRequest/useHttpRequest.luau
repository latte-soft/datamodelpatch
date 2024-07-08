local v0 = require(script:FindFirstAncestor("PlayerContextualMenu").Parent.React);
local v1 = require(script.Parent.HttpRequestContext);
return function()
    return v0.useContext(v1);
end;
