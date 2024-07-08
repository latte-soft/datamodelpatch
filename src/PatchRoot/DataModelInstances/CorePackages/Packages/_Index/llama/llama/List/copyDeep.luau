local function v0(v1)
    local v2 = type(v1);
    assert(v2 == "table", "expected a table for first argument, got " .. v2);
    local v3 = {};
    for v4 = 1, #v1 do
        if type(v1[v4]) == "table" then
            v3[v4] = v0(v1[v4]);
        else
            v3[v4] = v1[v4];
        end;
    end;
    return v3;
end;
return v0;
