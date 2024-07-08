local _ = require(script.Parent.Parent.types);
return function(v1, v2, v3, ...)
    if #v1 < v2 then
        for v4 = 1, select("#", ...) do
            table.insert(v1, (select(v4, ...)));
        end;
        return {};
    else
        local v5 = #v1;
        if v2 < 1 then
            v2 = math.max(v5 - math.abs(v2), 1);
        end;
        local v6 = {};
        local v7 = v3 or v5;
        if v7 > 0 then
            for _ = v2, math.min(v5, v2 + math.max(0, v7 - 1)) do
                table.insert(v6, (table.remove(v1, v2)));
            end;
        end;
        for v9 = select("#", ...), 1, -1 do
            table.insert(v1, v2, (select(v9, ...)));
        end;
        return v6;
    end;
end;
