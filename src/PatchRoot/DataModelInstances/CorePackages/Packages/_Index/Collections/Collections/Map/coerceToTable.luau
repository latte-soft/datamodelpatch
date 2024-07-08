local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_0.Map);
local v4 = require(l_Parent_2.InstanceOf);
local v5 = require(l_Parent_1.Array.reduce);
local _ = require(l_Parent_2.ES7Types);
return function(v7)
    if v4(v7, v3) then
        return v5(v7:entries(), function(v8, v9)
            v8[v9[1]] = v9[2];
            return v8;
        end, {});
    else
        return v7;
    end;
end;
