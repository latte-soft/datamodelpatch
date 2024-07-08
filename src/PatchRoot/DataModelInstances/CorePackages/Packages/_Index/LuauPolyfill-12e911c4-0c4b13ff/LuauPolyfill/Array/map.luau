return function(v0, v1, v2)
    if typeof(v0) ~= "table" then
        error(string.format("Array.map called on %s", (typeof(v0))));
    end;
    if typeof(v1) ~= "function" then
        error("callback is not a function");
    end;
    local v3 = #v0;
    local v4 = {};
    local v5 = 1;
    while v5 <= v3 do
        local v6 = v0[v5];
        if v6 ~= nil then
            local _ = nil;
            v4[v5] = if v2 ~= nil then v1(v2, v6, v5, v0) else v1(v6, v5, v0);
        end;
        v5 = v5 + 1;
    end;
    return v4;
end;
