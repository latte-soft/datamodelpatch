local function v0()
    return true;
end;
return function(v1, v2)
    local v3 = type(v1);
    assert(v3 == "table", "expected a table for first argument, got " .. v3);
    local v4 = 0;
    v2 = v2 or v0;
    for v5, v6 in pairs(v1) do
        if v2(v6, v5) then
            v4 = v4 + 1;
        end;
    end;
    return v4;
end;
