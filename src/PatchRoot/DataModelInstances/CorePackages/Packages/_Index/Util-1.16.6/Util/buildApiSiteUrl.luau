local l_ContentProvider_0 = game:GetService("ContentProvider");
local _, _, v8 = (function()
    local l_BaseUrl_0 = l_ContentProvider_0.BaseUrl;
    if l_BaseUrl_0:sub(#l_BaseUrl_0) == "/" then
        l_BaseUrl_0 = l_BaseUrl_0:sub(1, #l_BaseUrl_0 - 1);
    end;
    local _, v3 = l_BaseUrl_0:find("://");
    assert(type(v3) == "number", "Expected schemeEnd to be a number");
    local v4, v5 = l_BaseUrl_0:find("%.", v3 + 1);
    assert(type(v4) == "number", "Expected prefixIndex to be a number");
    assert(type(v5) == "number", "Expected prefixEnd to be a number");
    return l_BaseUrl_0, l_BaseUrl_0:sub(v3 + 1, v4 - 1), (l_BaseUrl_0:sub(v5 + 1));
end)();
return function(v9)
    assert(type(v9) == "string", "siteName must be a string");
    return string.format("https://%s.%s", v9, v8);
end;
