local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_0.Map);
local v4 = require(l_Parent_1.Object);
local v5 = require(l_Parent_2.InstanceOf);
local _ = require(l_Parent_2.ES7Types);
return function(v7)
    return not not v5(v7, v3) and v7 or v3.new(v4.entries(v7));
end;
