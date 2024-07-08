return function(v0)
    local v1 = 1 + (v0 or 5);
    local v2 = debug.traceback();
    local v3 = nil;
    local v4 = 1;
    for _ = 1, v1 do
        local _, v7 = v2:find("\n", v4, true);
        if v7 then
            v4 = v7 + 1;
            if not v3 then
                v3 = v4;
            end;
        else
            return v2:sub(v3 or 1);
        end;
    end;
    return v2:sub(v3 or 1, v4 - 1);
end;
