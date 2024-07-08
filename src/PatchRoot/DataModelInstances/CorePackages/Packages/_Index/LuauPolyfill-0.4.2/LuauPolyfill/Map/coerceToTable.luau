local l_Parent_0 = script.Parent.Parent;
local v1 = require(script.Parent);
local v2 = require(l_Parent_0.instanceof);
local v3 = require(l_Parent_0.Array.reduce);
local _ = require(l_Parent_0.types);
return function(v5)
    if v2(v5, v1) then
        return v3(v5:entries(), function(v6, v7)
            v6[v7[1]] = v7[2];
            return v6;
        end, {});
    else
        return v5;
    end;
end;
