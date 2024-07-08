return function(v0, v1, v2)
    local v3 = utf8.offset(v0, v2 or 1);
    local v4 = {};
    for _, v6 in ipairs(v1) do
        local v7, v8 = string.find(v0, v6, v3);
        if v7 then
            local v9 = string.sub(v0, 1, v7 - 1);
            local v10, v11 = utf8.len(v9);
            if v10 == nil then
                error(("string `%s` has an invalid byte at position %s"):format(v9, (tostring(v11))));
            end;
            table.insert(v4, {
                index = v10 + 1, 
                match = string.sub(v0, v7, v8)
            });
        end;
    end;
    if #v4 == 0 then
        return nil;
    else
        local v12 = nil;
        for _, v14 in ipairs(v4) do
            if v12 == nil then
                v12 = v14;
            end;
            if v14.index < v12.index then
                v12 = v14;
            end;
        end;
        return v12;
    end;
end;
