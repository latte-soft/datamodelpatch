local l_Array_0 = require(script.Parent.Parent.Parent.LuauPolyfill).Array;
return {
    addPath = function(v1, v2, v3)
        return {
            prev = v1, 
            key = v2, 
            typename = v3
        };
    end, 
    pathToArray = function(v4)
        local v5 = {};
        local l_v4_0 = v4;
        while l_v4_0 do
            table.insert(v5, l_v4_0.key);
            l_v4_0 = l_v4_0.prev;
        end;
        return l_Array_0.reverse(v5);
    end
};
