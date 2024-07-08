local v0 = require(script.Parent.Parent.equalObjects);
return function(...)
    if not v0(...) then
        local v1 = select("#", ...);
        for v2 = 1, v1 do
            local v3 = select(v2, ...);
            for v4 = 1, v1 do
                if v4 ~= v2 then
                    local v5 = select(v4, ...);
                    for v6, v7 in pairs(v3) do
                        if v7 ~= v5[v6] then
                            return false;
                        end;
                    end;
                end;
            end;
        end;
        return true;
    else
        return true;
    end;
end;
