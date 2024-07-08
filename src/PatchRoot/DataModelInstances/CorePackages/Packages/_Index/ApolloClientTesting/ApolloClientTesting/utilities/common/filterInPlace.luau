local l_Array_0 = require(script.Parent.Parent.Parent.Parent.LuauPolyfill).Array;
return {
    filterInPlace = function(v1, v2, v3)
        local v4 = 1;
        l_Array_0.forEach(v1, function(v5, v6)
            if v2(v5, v6, v1) then
                v1[v4] = v5;
                v4 = v4 + 1;
            end;
        end, v3);
        v1[v4] = nil;
        return v1;
    end
};
