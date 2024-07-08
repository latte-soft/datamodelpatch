return function(v0, v1, v2)
    if typeof(v0) ~= "table" then
        error(string.format("Array.slice called on %s", (typeof(v0))));
    end;
    local v3 = #v0;
    local v4 = v1 or 1;
    local v5 = nil;
    v5 = if not (v2 ~= nil) or v3 + 1 < v2 then v3 + 1 else v2;
    if v3 + 1 < v4 then
        return {};
    else
        local v6 = {};
        if v4 < 1 then
            v4 = math.max(v3 - math.abs(v4), 1);
        end;
        if v5 < 1 then
            v5 = math.max(v3 - math.abs(v5), 1);
        end;
        local l_v4_0 = v4;
        local v8 = 1;
        while l_v4_0 < v5 do
            v6[v8] = v0[l_v4_0];
            l_v4_0 = l_v4_0 + 1;
            v8 = v8 + 1;
        end;
        return v6;
    end;
end;
