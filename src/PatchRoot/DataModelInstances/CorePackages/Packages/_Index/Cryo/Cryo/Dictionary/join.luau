local v0 = require(script.Parent.Parent.None);
return function(...)
    local v1 = select("#", ...);
    if v1 == 0 then
        return {};
    elseif v1 == 1 then
        local v2 = table.clone(...);
        setmetatable(v2, nil);
        return v2;
    else
        local v3 = table.clone(select(1, ...));
        setmetatable(v3, nil);
        for v4 = 2, v1 do
            for v5, v6 in pairs((select(v4, ...))) do
                if v6 == v0 then
                    v3[v5] = nil;
                else
                    v3[v5] = v6;
                end;
            end;
        end;
        return v3;
    end;
end;
