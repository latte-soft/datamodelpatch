local function v0(v1)
    local v2 = type(v1);
    assert(v2 == "table", "expected a table for first argument, got " .. v2);
    local v3 = {};
    local v4 = 1;
    for v5 = 1, #v1 do
        if type(v1[v5]) == "table" then
            local v6 = v0(v1[v5]);
            for v7 = 1, #v6 do
                v3[v4] = v6[v7];
                v4 = v4 + 1;
            end;
        else
            v3[v4] = v1[v5];
            v4 = v4 + 1;
        end;
    end;
    return v3;
end;
return v0;
