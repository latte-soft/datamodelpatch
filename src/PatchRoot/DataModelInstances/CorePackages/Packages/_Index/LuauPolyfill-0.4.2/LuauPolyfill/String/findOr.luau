local v0 = "([" .. ("$%^()-[].?"):gsub("(.)", "%%%1") .. "])";
return function(v1, v2, v3)
    local v4 = utf8.offset(v1, v3 or 1);
    local v5 = {};
    for _, v7 in v2, nil, nil do
        local v8, v9 = string.find(v1, v7:gsub(v0, "%%%1"), v4);
        if v8 then
            local v10 = string.sub(v1, 1, v8 - 1);
            local v11, v12 = utf8.len(v10);
            if v11 == nil then
                error(("string `%s` has an invalid byte at position %s"):format(v10, (tostring(v12))));
            end;
            table.insert(v5, {
                index = v11 + 1, 
                match = string.sub(v1, v8, v9)
            });
        end;
    end;
    if #v5 == 0 then
        return nil;
    else
        local v13 = nil;
        for _, v15 in v5, nil, nil do
            if v13 == nil then
                v13 = v15;
            end;
            if v15.index < v13.index then
                v13 = v15;
            end;
        end;
        return v13;
    end;
end;
