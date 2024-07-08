local l_Map_0 = require(script.Parent.Parent.Parent.LuauPolyfill).Map;
return {
    mapValueOrdered = function(v1, v2)
        local v3 = l_Map_0.new();
        for _, v5 in v1, nil, nil do
            local v6 = v5[1];
            v3:set(v6, v2(v5[2], v6));
        end;
        return v3;
    end
};
