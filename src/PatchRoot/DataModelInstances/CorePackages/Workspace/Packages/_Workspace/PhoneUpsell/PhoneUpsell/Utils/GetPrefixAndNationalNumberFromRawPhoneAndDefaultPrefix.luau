return function(v0, v1)
    local v2 = v0:gsub("%D", "");
    local v3 = v1:gsub("%D", "");
    if string.find(v2, v3) == 1 then
        return v1, (string.sub(v2, string.len(v3) + 1));
    else
        return v1, v2;
    end;
end;
