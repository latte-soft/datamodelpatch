local v0 = require(script.Parent.Parent.None);
return function(...)
    local v1 = {};
    local v2 = 1;
    for v3 = 1, select("#", ...) do
        local v4 = select(v3, ...);
        if v4 then
            for v5 = 1, #v4 do
                if v4[v5] ~= v0 then
                    v1[v2] = v4[v5];
                    v2 = v2 + 1;
                end;
            end;
        end;
    end;
    return v1;
end;
