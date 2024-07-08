return function(v0)
    if v0 == nil then
        error("cannot extract keys from a nil value");
    end;
    local v1 = typeof(v0);
    local v2 = {};
    if v1 == "table" then
        for v3 in pairs(v0) do
            table.insert(v2, v3);
        end;
        return v2;
    else
        if v1 == "string" then
            for v4 = 1, v0:len() do
                v2[v4] = tostring(v4);
            end;
        end;
        return v2;
    end;
end;
