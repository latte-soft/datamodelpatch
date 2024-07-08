return function(v0)
    local v1 = 0;
    for _ in pairs(v0) do
        v1 = v1 + 1;
    end;
    return v1;
end;
