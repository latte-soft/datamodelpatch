local v0 = require(script:FindFirstAncestor("ReactUtils").Parent.React);
local v1 = require(script.Parent.useDebounce);
return function(v2, v3)
    local v4, v5 = v0.useState(v2);
    return v1(v4, v3), v5;
end;
