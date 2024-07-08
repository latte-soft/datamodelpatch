local function v0()
    return true;
end;
return function(v1, v2)
    local v3 = type(v1);
    assert(v3 == "table", "expected a table for first argument, got " .. v3);
    v2 = v2 or v0;
    local v4 = 0;
    for v5 = 1, #v1 do
        if v2(v1[v5], v5) then
            v4 = v4 + 1;
        end;
    end;
    return v4;
end;
