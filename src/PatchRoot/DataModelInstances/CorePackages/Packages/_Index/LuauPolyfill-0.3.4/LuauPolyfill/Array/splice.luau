return function(v0, v1, v2, ...)
    if #v0 < v1 then
        for v3 = 1, select("#", ...) do
            table.insert(v0, (select(v3, ...)));
        end;
        return {};
    else
        local v4 = #v0;
        if v1 < 1 then
            v1 = math.max(v4 - math.abs(v1), 1);
        end;
        local v5 = {};
        local v6 = v2 or v4;
        if v6 > 0 then
            for _ = v1, math.min(v4, v1 + math.max(0, v6 - 1)) do
                table.insert(v5, (table.remove(v0, v1)));
            end;
        end;
        for v8 = select("#", ...), 1, -1 do
            table.insert(v0, v1, (select(v8, ...)));
        end;
        return v5;
    end;
end;
