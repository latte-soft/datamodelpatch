local _ = require(script:FindFirstAncestor("ReactUtils").Parent.React);
local v1 = require(script.Parent.usePropertiesBase);
return function(v2, v3, ...)
    return v1(v2, v3, false, ...);
end;
