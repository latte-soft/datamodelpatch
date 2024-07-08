local function v4(v0, v1)
    if not ((v0.eventDate ~= "" and v0.eventDate ~= nil) and v1.eventDate ~= "") or v1.eventDate == nil then
        return true;
    else
        local v2 = DateTime.fromIsoDate(v0.eventDate) or nil;
        local v3 = DateTime.fromIsoDate(v1.eventDate) or nil;
        if not (v2 ~= nil) or v3 == nil then
            return true;
        else
            return v3.UnixTimestampMillis < v2.UnixTimestampMillis;
        end;
    end;
end;
return function(v5)
    local l_status_0, l_result_0 = pcall(function()
        local v6 = table.clone(v5);
        table.sort(v6, v4);
        return v6;
    end);
    if not l_status_0 then
        return v5;
    else
        return l_result_0;
    end;
end;
