local v0 = {
    [Enum.HttpContentType.ApplicationJson] = "application/json", 
    [Enum.HttpContentType.ApplicationUrlEncoded] = "application/x-www-form-urlencoded", 
    [Enum.HttpContentType.ApplicationXml] = "application/xml", 
    [Enum.HttpContentType.TextPlain] = "text/plain", 
    [Enum.HttpContentType.TextXml] = "text/xml"
};
return function(v1)
    local v2 = v0[v1];
    if v2 == nil then
        error(("HttpContentType `%s` not supported"):format((tostring(v1))));
    end;
    return v2;
end;
