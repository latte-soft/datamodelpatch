local v0 = require(script.Parent.trimStart);
local v1 = require(script.Parent.trimEnd);
return function(v2)
    return v0(v1(v2));
end;
