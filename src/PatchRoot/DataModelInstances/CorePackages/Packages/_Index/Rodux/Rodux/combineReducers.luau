return function(v0)
    return function(v1, v2)
        if v1 == nil then
            v1 = {};
        end;
        local v3 = {};
        for v4, v5 in pairs(v0) do
            v3[v4] = v5(v1[v4], v2);
        end;
        return v3;
    end;
end;
