local function v0(v1, v2)
    local v3 = type(v1);
    assert(v3 == "table", "expected a table for first argument, got " .. v3);
    local v4 = type(v2);
    assert(v4 == "function", "expected a function for second argument, got " .. v4);
    local v5 = {};
    local v6 = 1;
    for v7 = 1, #v1 do
        if type(v1[v7]) == "table" then
            local v8 = v0(v1[v7], v2);
            for v9 = 1, #v8 do
                v5[v6] = v8[v9];
                v6 = v6 + 1;
            end;
        else
            local v10 = v2(v1[v7], v7);
            if v10 ~= nil then
                v5[v6] = v10;
                v6 = v6 + 1;
            end;
        end;
    end;
    return v5;
end;
return v0;
