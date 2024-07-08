local _ = require(script.Parent.Parent.types);
return function(v1, v2, v3)
    if _G.__DEV__ then
        if typeof(v1) ~= "table" then
            error(string.format("Array.filter called on %s", (typeof(v1))));
        end;
        if typeof(v2) ~= "function" then
            error("callback is not a function");
        end;
    end;
    local v4 = #v1;
    local v5 = {};
    local v6 = 1;
    if v3 == nil then
        for v7 = 1, v4 do
            local v8 = v1[v7];
            if not (not (v8 ~= nil) or not v2(v8, v7, v1)) then
                v5[v6] = v8;
                v6 = v6 + 1;
            end;
        end;
        return v5;
    else
        for v9 = 1, v4 do
            local v10 = v1[v9];
            if not (not (v10 ~= nil) or not v2(v3, v10, v9, v1)) then
                v5[v6] = v10;
                v6 = v6 + 1;
            end;
        end;
        return v5;
    end;
end;
