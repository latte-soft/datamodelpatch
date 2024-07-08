return function(v0, v1)
    local v2 = {};
    for v3, v4 in pairs(v0) do
        if not v1[v3] then
            error("tables did not have matching indices");
            return ;
        else
            v2[v3] = v4 < v1[v3] and v4 or v1[v3];
        end;
    end;
    return v2;
end;
