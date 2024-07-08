local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v2 = require(l_Parent_0.None);
local _ = require(l_Parent_1.ES7Types);
return function(v4, v5, v6, v7, ...)
    if v5 ~= nil and typeof(v5) == "table" then
        for v8, v9 in pairs(v5) do
            if v9 == v2 then
                v4[v8] = nil;
            else
                v4[v8] = v9;
            end;
        end;
    end;
    if v6 ~= nil and typeof(v6) == "table" then
        for v10, v11 in pairs(v6) do
            if v11 == v2 then
                v4[v10] = nil;
            else
                v4[v10] = v11;
            end;
        end;
    end;
    if v7 ~= nil and typeof(v7) == "table" then
        for v12, v13 in pairs(v7) do
            if v13 == v2 then
                v4[v12] = nil;
            else
                v4[v12] = v13;
            end;
        end;
    end;
    for v14 = 1, select("#", ...) do
        local v15 = select(v14, ...);
        if v15 ~= nil and typeof(v15) == "table" then
            for v16, v17 in pairs(v15) do
                if v17 == v2 then
                    v4[v16] = nil;
                else
                    v4[v16] = v17;
                end;
            end;
        end;
    end;
    return v4;
end;
