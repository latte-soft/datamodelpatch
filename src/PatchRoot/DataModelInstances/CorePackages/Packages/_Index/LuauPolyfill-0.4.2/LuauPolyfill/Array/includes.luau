local _ = require(script.Parent.Parent.types);
local v1 = require(script.Parent.indexOf);
return function(v2, v3, v4)
    return v1(v2, v3, v4) ~= -1;
end;
