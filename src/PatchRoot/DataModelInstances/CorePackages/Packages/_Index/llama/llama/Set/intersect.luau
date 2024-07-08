return function(...)
    local v0 = {};
    local v1 = select("#", ...);
    for v2, _ in pairs((select(1, ...))) do
        local v4 = true;
        for v5 = 2, v1 do
            if select(v5, ...)[v2] == nil then
                v4 = false;
                break;
            end;
        end;
        if v4 then
            v0[v2] = true;
        end;
    end;
    return v0;
end;
