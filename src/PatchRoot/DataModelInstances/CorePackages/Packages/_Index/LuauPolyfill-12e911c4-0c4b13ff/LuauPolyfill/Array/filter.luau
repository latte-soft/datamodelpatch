return function(v0, v1, v2)
    if typeof(v0) ~= "table" then
        error(string.format("Array.filter called on %s", (typeof(v0))));
    end;
    if typeof(v1) ~= "function" then
        error("callback is not a function");
    end;
    local v3 = #v0;
    local v4 = {};
    local v5 = 1;
    if v2 == nil then
        for v6 = 1, v3 do
            local v7 = v0[v6];
            if not (not (v7 ~= nil) or not v1(v7, v6, v0)) then
                v4[v5] = v7;
                v5 = v5 + 1;
            end;
        end;
        return v4;
    else
        for v8 = 1, v3 do
            local v9 = v0[v8];
            if not (not (v9 ~= nil) or not v1(v2, v9, v8, v0)) then
                v4[v5] = v9;
                v5 = v5 + 1;
            end;
        end;
        return v4;
    end;
end;
