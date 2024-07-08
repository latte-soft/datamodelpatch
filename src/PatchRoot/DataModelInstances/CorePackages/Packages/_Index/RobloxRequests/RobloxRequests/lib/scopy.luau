local function v0(v1)
    local v2 = type(v1);
    local v3 = nil;
    if v2 == "table" then
        v3 = {};
        for v4, v5 in next, v1, nil do
            v3[v0(v4)] = v0(v5);
        end;
        setmetatable(v3, v0((getmetatable(v1))));
        return v3;
    else
        return v1;
    end;
end;
return v0;
