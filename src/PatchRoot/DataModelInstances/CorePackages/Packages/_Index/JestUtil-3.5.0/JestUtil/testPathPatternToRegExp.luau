local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.RegExp);
local v2 = {};
local _ = require(l_Parent_0.JestTypes);
v2.default = function(v4)
    return v1(v4, "i");
end;
return v2;
