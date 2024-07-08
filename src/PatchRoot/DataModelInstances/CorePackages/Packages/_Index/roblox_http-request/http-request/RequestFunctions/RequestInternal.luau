local l_HttpService_0 = game:GetService("HttpService");
local v1 = require(script.Parent.Util.getHeaders);
local v2 = require(script.Parent.Util.getPostBody);
return function(v3, v4, v5)
    return l_HttpService_0:RequestInternal({
        Url = v3, 
        Method = v4, 
        Body = v2(v5.postBody, v4), 
        Timeout = v5.timeout or 15000, 
        CachePolicy = v5.cachePolicy or Enum.HttpCachePolicy.None, 
        Priority = v5.priority or 0, 
        Headers = v1(v5.headers, v4), 
        RequestType = v5.requestType or nil, 
        AllowSandboxing = v5.allowSandboxing or nil
    });
end;
