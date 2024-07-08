local l_jest_0 = require(script.Parent.Parent.JestGlobals).jest;
return function(v1)
    local v2 = {};
    local v3 = getmetatable(v1);
    return function(v4)
        local v5 = v3[v4];
        local v6 = l_jest_0.fn();
        v3[v4] = v6;
        table.insert(v2, function()
            v3[v4] = v5;
        end);
        return v6;
    end, function()
        for v7 = #v2, 1, -1 do
            v2[v7]();
        end;
        table.clear(v2);
    end;
end;
