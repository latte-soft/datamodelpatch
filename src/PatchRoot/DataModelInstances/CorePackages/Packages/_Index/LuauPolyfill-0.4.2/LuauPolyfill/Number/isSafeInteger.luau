local v0 = require(script.Parent.isInteger);
local v1 = require(script.Parent.MAX_SAFE_INTEGER);
return function(v2)
    return v0(v2) and math.abs(v2) <= v1;
end;
