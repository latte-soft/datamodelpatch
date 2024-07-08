local l_Parent_0 = script.Parent.Parent;
local v1 = require(script.Parent);
local v2 = require(l_Parent_0.Object);
local v3 = require(l_Parent_0.instanceof);
local _ = require(l_Parent_0.types);
return function(v5)
    return not not v3(v5, v1) and v5 or v1.new(v2.entries(v5));
end;
