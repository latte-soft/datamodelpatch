local v0 = require(script.Parent.None);
local _ = require(script.Parent.Parent.types);
return function(v2, v3, v4, v5, ...)
    if v3 ~= nil and typeof(v3) == "table" then
        for v6, v7 in pairs(v3) do
            if v7 == v0 then
                v2[v6] = nil;
            else
                v2[v6] = v7;
            end;
        end;
    end;
    if v4 ~= nil and typeof(v4) == "table" then
        for v8, v9 in pairs(v4) do
            if v9 == v0 then
                v2[v8] = nil;
            else
                v2[v8] = v9;
            end;
        end;
    end;
    if v5 ~= nil and typeof(v5) == "table" then
        for v10, v11 in pairs(v5) do
            if v11 == v0 then
                v2[v10] = nil;
            else
                v2[v10] = v11;
            end;
        end;
    end;
    for v12 = 1, select("#", ...) do
        local v13 = select(v12, ...);
        if v13 ~= nil and typeof(v13) == "table" then
            for v14, v15 in pairs(v13) do
                if v15 == v0 then
                    v2[v14] = nil;
                else
                    v2[v14] = v15;
                end;
            end;
        end;
    end;
    return v2;
end;
