local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local v7 = {
    getBaseDomain = function()
        local l_BaseUrl_0 = l_ContentProvider_0.BaseUrl;
        if string.sub(l_BaseUrl_0, #l_BaseUrl_0) ~= "/" then
            l_BaseUrl_0 = l_BaseUrl_0 .. "/";
        end;
        local _, v4 = string.find(l_BaseUrl_0, "://");
        local _, v6 = string.find(l_BaseUrl_0, "%.", v4 + 1);
        return (string.sub(l_BaseUrl_0, v6 + 1));
    end
};
local function v8(v9, v10)
    if v10 == nil then
        v10 = 0;
    end;
    local l_status_0, l_result_0 = pcall(v9);
    if not l_status_0 then
        if v10 >= 2 then
            return false, l_result_0;
        else
            wait(2 ^ (v10 - 1));
            return v8(v9, v10 + 1);
        end;
    else
        return true, l_result_0;
    end;
end;
v7.requestAndRetryPost = function(v13, v14)
    return v8(function()
        return l_HttpRbxApiService_0:PostAsyncFullUrl(v13, v14);
    end);
end;
v7.requestAndRetryGet = function(v15)
    return v8(function()
        return l_HttpRbxApiService_0:GetAsyncFullUrl(v15);
    end);
end;
return v7;
