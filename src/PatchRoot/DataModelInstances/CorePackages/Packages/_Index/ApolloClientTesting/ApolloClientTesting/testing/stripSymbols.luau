local v0 = {};
local v1 = require(script.Parent.Parent.Parent.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Object_0 = v1.Object;
local function v4(v5)
    local v6 = l_Object_0.assign({}, v5);
    l_Array_0.forEach(l_Object_0.keys(v6), function(v7)
        if (typeof(v7) == "userdata" and string.sub(tostring(v7), 1, 7) == "Symbol(") and v7 ~= tostring(v7) then
            v6[v7] = nil;
            return ;
        else
            if not (not (typeof(v6[v7]) == "table") or l_Array_0.isArray(v6)) then
                v6[v7] = v4(v6[v7]);
            end;
            return ;
        end;
    end);
    return v6;
end;
v0.stripSymbols = v4;
return v0;
