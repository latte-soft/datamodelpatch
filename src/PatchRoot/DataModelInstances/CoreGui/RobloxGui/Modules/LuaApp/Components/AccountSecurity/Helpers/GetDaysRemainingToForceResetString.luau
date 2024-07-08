local function _(v0)
    local v1 = tonumber(v0, 10);
    if tostring(v1) == tostring((0/0)) then
        return 14;
    else
        return (math.floor(math.max(0, v1 - DateTime.now().UnixTimestampMillis) / 86400000));
    end;
end;
return function(v3, v4, v5)
    local v6 = tonumber(v5, 10);
    local v7 = tostring(v6) == tostring((0/0)) and 14 or math.floor(math.max(0, v6 - DateTime.now().UnixTimestampMillis) / 86400000);
    v6 = (v7 <= 1 and v3 or v4):gsub("{days}", v7):gsub("{boldStart}", "<b>"):gsub("{boldEnd}", "</b>");
    if v7 < 1 then
        v6 = v6:gsub("1", "&lt; 1");
    end;
    return v6;
end;
