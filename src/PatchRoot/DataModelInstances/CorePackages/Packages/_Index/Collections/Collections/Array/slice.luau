local _ = require(script.Parent.Parent.Parent.ES7Types);
return function(v1, v2, v3)
    if typeof(v1) ~= "table" then
        error(string.format("Array.slice called on %s", (typeof(v1))));
    end;
    local v4 = #v1;
    local v5 = v2 or 1;
    local v6 = nil;
    v6 = if not (v3 ~= nil) or v4 + 1 < v3 then v4 + 1 else v3;
    if v4 + 1 < v5 then
        return {};
    else
        local v7 = {};
        if v5 < 1 then
            v5 = math.max(v4 - math.abs(v5), 1);
        end;
        if v6 < 1 then
            v6 = math.max(v4 - math.abs(v6), 1);
        end;
        local l_v5_0 = v5;
        local v9 = 1;
        while l_v5_0 < v6 do
            v7[v9] = v1[l_v5_0];
            l_v5_0 = l_v5_0 + 1;
            v9 = v9 + 1;
        end;
        return v7;
    end;
end;
