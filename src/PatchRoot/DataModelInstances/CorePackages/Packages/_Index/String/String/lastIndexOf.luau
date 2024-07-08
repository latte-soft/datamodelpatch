return function(v0, v1, v2)
    local v3 = string.len(v0);
    local v4 = nil;
    v4 = v2 or v3;
    if v2 and v2 < 1 then
        v4 = 1;
    end;
    if v2 and v3 < v2 then
        v4 = v3;
    end;
    if v1 == "" then
        return v4;
    else
        local v5 = nil;
        local v6 = nil;
        local v7 = 0;
        while true do
            v5 = v6;
            local v8, v9 = string.find(v0, v1, v7 + 1, true);
            v6 = v8;
            v7 = v9;
            if not (v6 ~= nil and v4 >= v6) then
                break;
            end;
        end;
        if v5 == nil then
            return -1;
        else
            return v5;
        end;
    end;
end;
