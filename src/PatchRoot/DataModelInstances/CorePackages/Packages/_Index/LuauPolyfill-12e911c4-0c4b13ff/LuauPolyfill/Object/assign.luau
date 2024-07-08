local v0 = require(script.Parent.None);
return function(v1, v2, v3, v4, ...)
    if v2 ~= nil and typeof(v2) == "table" then
        for v5, v6 in pairs(v2) do
            if v6 == v0 then
                v1[v5] = nil;
            else
                v1[v5] = v6;
            end;
        end;
    end;
    if v3 ~= nil and typeof(v3) == "table" then
        for v7, v8 in pairs(v3) do
            if v8 == v0 then
                v1[v7] = nil;
            else
                v1[v7] = v8;
            end;
        end;
    end;
    if v4 ~= nil and typeof(v4) == "table" then
        for v9, v10 in pairs(v4) do
            if v10 == v0 then
                v1[v9] = nil;
            else
                v1[v9] = v10;
            end;
        end;
    end;
    for v11 = 1, select("#", ...) do
        local v12 = select(v11, ...);
        if v12 ~= nil and typeof(v12) == "table" then
            for v13, v14 in pairs(v12) do
                if v14 == v0 then
                    v1[v13] = nil;
                else
                    v1[v13] = v14;
                end;
            end;
        end;
    end;
    return v1;
end;
