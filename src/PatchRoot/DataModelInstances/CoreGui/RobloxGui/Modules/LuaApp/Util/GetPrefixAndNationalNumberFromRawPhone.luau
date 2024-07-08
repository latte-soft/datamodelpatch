return function(v0)
    local v1 = v0:gsub("%D", "");
    if #v1 == 10 then
        return "1", v1;
    elseif #v1 == 11 and string.sub(v1, 1, 1) == "1" then
        return "1", (string.sub(v1, 2));
    else
        return "", v1;
    end;
end;
