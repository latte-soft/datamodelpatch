local l_Map_0 = require(script.Parent.Parent.Parent.LuauPolyfill).Map;
return {
    keyValMap = function(v1, v2, v3)
        local v4 = l_Map_0.new();
        for _, v6 in ipairs(v1) do
            v4:set(v2(v6), v3(v6));
        end;
        return v4;
    end
};
