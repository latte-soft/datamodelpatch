local _ = require(script.Parent.Parent.types);
return function(v1, v2, v3)
    if _G.__DEV__ then
        if typeof(v1) ~= "table" then
            error(string.format("Array.map called on %s", (typeof(v1))));
        end;
        if typeof(v2) ~= "function" then
            error("callback is not a function");
        end;
    end;
    local v4 = #v1;
    local v5 = {};
    local v6 = 1;
    while v6 <= v4 do
        local v7 = v1[v6];
        if v7 ~= nil then
            local _ = nil;
            v5[v6] = if v3 ~= nil then v2(v3, v7, v6, v1) else v2(v7, v6, v1);
        end;
        v6 = v6 + 1;
    end;
    return v5;
end;
