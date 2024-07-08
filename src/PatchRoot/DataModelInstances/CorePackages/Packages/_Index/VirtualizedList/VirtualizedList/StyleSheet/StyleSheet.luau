local v0 = require(script.Parent.Parent.Parent.LuauPolyfill);
local l_Array_0 = v0.Array;
local l_Object_0 = v0.Object;
return {
    compose = function(v3, v4)
        if v3 ~= nil and v4 ~= nil then
            return {
                v3, 
                v4
            };
        elseif v3 ~= nil then
            return v3;
        else
            return v4;
        end;
    end, 
    create = function(v5)
        if _G.__DEV__ then
            l_Array_0.forEach(l_Object_0.keys(v5), function(v6)
                if v5[v6] then
                    l_Object_0.freeze(v5[v6]);
                end;
            end);
        end;
        return v5;
    end
};
