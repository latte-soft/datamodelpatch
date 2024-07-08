local l_ContentProvider_0 = game:GetService("ContentProvider");
local _, _, v8 = (function()
    local l_BaseUrl_0 = l_ContentProvider_0.BaseUrl;
    if l_BaseUrl_0:sub(#l_BaseUrl_0) ~= "/" then
        l_BaseUrl_0 = l_BaseUrl_0 .. "/";
    end;
    local _, v3 = l_BaseUrl_0:find("://");
    local v4, v5 = l_BaseUrl_0:find("%.", v3 + 1);
    return l_BaseUrl_0, l_BaseUrl_0:sub(v3 + 1, v4 - 1), (l_BaseUrl_0:sub(v5 + 1));
end)();
return function(v9)
    return string.format("https://%s.%s", v9, v8);
end;
