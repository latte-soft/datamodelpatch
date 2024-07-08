local v0 = require(script.Parent.Parent.LuauPolyfill);
local l_Array_0 = v0.Array;
local l_Object_0 = v0.Object;
local v3 = {};
local v4 = require(script.Parent.queries);
v3.getQueriesForElement = function(v5, v6, v7)
    local v8 = if v6 == nil then v4 else v6;
    return (l_Array_0.reduce(l_Object_0.keys(v8), function(v9, v10)
        local v11 = v8[v10];
        v9[v10] = function(...)
            return v11(v5, ...);
        end;
        return v9;
    end, if v7 == nil then {} else v7));
end;
return v3;
