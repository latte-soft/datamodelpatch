return function(v0, v1)
    local v2 = "--";
    local v3 = if not not v0 and v0 >= 0 then v0 else 0;
    local v4 = if not not v1 and v1 >= 0 then v1 else 0;
    if v3 + v4 > 0 then
        v2 = tostring((math.floor((v3 / (v3 + v4)) * 100 + 0.5))) .. "%";
    end;
    return v2;
end;
