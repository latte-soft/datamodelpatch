getUpdatedSelectedCapturesArray = function(v0, v1)
    local v2 = {};
    local v3 = false;
    for _, v5 in ipairs(v0) do
        if v5 == v1 then
            v3 = true;
        else
            table.insert(v2, v5);
        end;
    end;
    if not v3 then
        table.insert(v2, v1);
    end;
    return v2;
end;
return getUpdatedSelectedCapturesArray;
