return function(v0)
    if v0 == nil then
        error("cannot extract values from a nil value");
    end;
    local v1 = typeof(v0);
    local v2 = {};
    if v1 == "table" then
        for _, v4 in pairs(v0) do
            table.insert(v2, v4);
        end;
        return v2;
    else
        if v1 == "string" then
            for v5 = 1, v0:len() do
                v2[v5] = v0:sub(v5, v5);
            end;
        end;
        return v2;
    end;
end;
