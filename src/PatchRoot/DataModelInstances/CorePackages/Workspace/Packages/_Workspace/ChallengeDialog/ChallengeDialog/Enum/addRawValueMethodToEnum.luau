return function(v0, v1)
    local v2 = {};
    for v3, v4 in pairs(v1) do
        v2[v0[v3]] = v4;
    end;
    local v5 = getmetatable(v0);
    local l___index_0 = v5.__index;
    v5.__index = function(_, v8)
        if v8 == "toRawValue" then
            return function(v9)
                return v2[v9];
            end;
        else
            return l___index_0[v8];
        end;
    end;
end;
