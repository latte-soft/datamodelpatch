local v0 = {
    ["<"] = "&lt;", 
    [">"] = "&gt;", 
    ["\""] = "&quot;", 
    ["'"] = "&apos;"
};
return function(v1)
    local v2 = v1:gsub("&", "&amp;");
    for v3, v4 in pairs(v0) do
        v2 = v2:gsub(v3, v4);
    end;
    return v2;
end;
