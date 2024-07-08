return function(v0, v1)
    local v2 = {};
    for _, v4 in ipairs(v1) do
        v2[v4] = true;
    end;
    for v5 in pairs(v2) do
        assert(v0[v5] ~= nil, string.format("Expected field %q", v5));
    end;
    for v6 in pairs(v0) do
        assert(v2[v6] ~= nil, string.format("Did not expect field %q", v6));
    end;
end;
