local v0 = require(script.Parent.Parent.None);
return function(...)
    local v1 = {};
    for v2 = 1, select("#", ...) do
        local v3 = select(v2, ...);
        if v3 then
            for v4, v5 in pairs(v3) do
                if v5 == v0 then
                    v1[v4] = nil;
                else
                    v1[v4] = v5;
                end;
            end;
        end;
    end;
    return v1;
end;
