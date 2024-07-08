local v0 = {};
local l_Array_0 = require(script.Parent.Parent.Parent.Parent.LuauPolyfill).Array;
v0.isNonEmptyArray = function(v2)
    return (function()
        if not l_Array_0.isArray(v2) then
            return l_Array_0.isArray(v2);
        else
            return #v2 > 0;
        end;
    end)();
end;
return v0;
