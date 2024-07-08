eraseKeys = function(v0, v1)
    local v2 = table.clone(v1);
    for _, v4 in pairs(v0) do
        v2[v4] = nil;
    end;
    return v2;
end;
return eraseKeys;
