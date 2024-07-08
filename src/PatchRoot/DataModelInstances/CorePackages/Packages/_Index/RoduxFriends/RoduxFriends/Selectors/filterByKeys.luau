return function(v0, v1)
    local v2 = {};
    for _, v4 in pairs(v0) do
        local v5 = tostring(v4);
        local v6 = v1[v5];
        if v6 then
            v2[v5] = v6;
        end;
    end;
    return v2;
end;
