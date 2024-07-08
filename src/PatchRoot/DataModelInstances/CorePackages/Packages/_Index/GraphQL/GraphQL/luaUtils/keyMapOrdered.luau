local l_Map_0 = require(script.Parent.Parent.Parent.LuauPolyfill).Map;
return {
    keyMapOrdered = function(v1, v2)
        local v3 = l_Map_0.new();
        for v4 = 1, #v1 do
            local v5 = v1[v4];
            v3:set(v2(v5), v5);
        end;
        return v3;
    end
};
