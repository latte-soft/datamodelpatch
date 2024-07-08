return function(v0, v1, v2)
    if typeof(v0) ~= "table" then
        error(string.format("Array.forEach called on %s", (typeof(v0))));
    end;
    if typeof(v1) ~= "function" then
        error("callback is not a function");
    end;
    local v3 = #v0;
    local v4 = 1;
    while v4 <= v3 do
        local v5 = v0[v4];
        if v2 ~= nil then
            v1(v2, v5, v4, v0);
        else
            v1(v5, v4, v0);
        end;
        if #v0 < v3 then
            v3 = #v0;
        end;
        v4 = v4 + 1;
    end;
end;
