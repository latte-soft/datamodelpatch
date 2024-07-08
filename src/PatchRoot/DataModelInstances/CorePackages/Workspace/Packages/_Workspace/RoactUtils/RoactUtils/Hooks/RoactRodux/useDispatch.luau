local v0 = require(script:FindFirstAncestor("RoactUtils").Parent.React);
local v1 = require(script.Parent.useStore);
return function()
    local v2 = v1();
    return (v0.useCallback(function(...)
        return v2:dispatch(...);
    end, {
        v2
    }));
end;
