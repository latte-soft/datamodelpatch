return function(v0)
    v0 = v0 + 59;
    local v1 = 0;
    local v2 = 0;
    local v3 = 0;
    if v0 >= 86400 then
        v1 = math.floor(v0 / 86400);
        v0 = v0 - v1 * 86400;
    end;
    if v0 >= 3600 then
        v2 = math.floor(v0 / 3600);
        v0 = v0 - v2 * 3600;
    end;
    if v0 > 0 then
        v3 = math.floor(v0 / 60);
    end;
    return {
        days = v1, 
        hours = v2, 
        minutes = v3
    };
end;
