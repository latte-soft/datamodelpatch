return function(v0, v1, v2)
    if typeof(v0) ~= "table" then
        error(string.format("Array.reduce called on %s", (typeof(v0))));
    end;
    if typeof(v1) ~= "function" then
        error("callback is not a function");
    end;
    local v3 = #v0;
    local v4 = nil;
    local v5 = 1;
    if v2 ~= nil then
        v4 = v2;
    else
        v5 = 2;
        if v3 == 0 then
            error("reduce of empty array with no initial value");
        end;
        v4 = v0[1];
    end;
    for v6 = v5, v3 do
        v4 = v1(v4, v0[v6], v6, v0);
    end;
    return v4;
end;
