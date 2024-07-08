local function v6(v0, v1)
    for _, v3 in pairs(v1) do
        local v4 = v3 .. " ";
        local v5 = string.len(v4);
        if string.sub(v0, 1, v5):lower() == v4 then
            return (string.sub(v0, v5 + 1));
        end;
    end;
    return nil;
end;
return function(v7, v8)
    local v9 = v6(v7, v8);
    if not v9 then
        return nil;
    else
        return string.split(v9, " ")[1];
    end;
end;
