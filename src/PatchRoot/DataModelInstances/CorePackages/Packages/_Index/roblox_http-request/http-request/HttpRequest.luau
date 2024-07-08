local v0 = require(script:FindFirstAncestor("http-request").Parent.Cryo);
local l_HttpService_0 = game:GetService("HttpService");
local v2 = require(script.Parent.StatusCode);
local v3 = require(script.Parent.HttpSession);
local v4 = require(script.Parent.HttpResponse);
local v5 = {
    [v2.REQUEST_TIMEOUT] = true, 
    [v2.SERVICE_UNAVAILABLE] = true, 
    [v2.GATEWAY_TIMEOUT] = true
};
local v6 = {};
v6.__index = v6;
v6.new = function(v7, v8, v9, v10)
    v7 = v7 or {};
    local v11 = {
        resolve = nil, 
        reject = nil, 
        retryCount = 0, 
        httpRequest = nil, 
        canceled = false, 
        requestFunction = v7.requestFunction, 
        postRequestFunction = v7.postRequestFunction, 
        url = v8, 
        requestMethod = v9, 
        options = v0.Dictionary.join(v7.defaultOptions or {}, v10 or {}), 
        waitImpl = v7.waitImpl or delay, 
        maxRetryCount = v7.maxRetryCount or 4, 
        maxWaitTime = v7.maxWaitTime or 16, 
        session = v3.currentSession()
    };
    setmetatable(v11, v6);
    return v11;
end;
v6.start = function(v12, v13, v14)
    v12.resolve = v13;
    v12.reject = v14;
    v12:makeRequest();
end;
v6.processResponse = function(v15, v16)
    local l_status_0, l_result_0 = pcall(l_HttpService_0.JSONDecode, l_HttpService_0, v16.Body);
    if not l_status_0 then
        v15.reject(v4.error(Enum.HttpError.OK));
        return ;
    else
        if v15.postRequestFunction then
            pcall(v15.postRequestFunction, v16, {
                url = v15.url, 
                requestMethod = v15.requestMethod, 
                options = v15.options, 
                retryCount = v15.retryCount
            });
        end;
        v15.resolve(v4.success(v16.StatusCode, l_result_0));
        return ;
    end;
end;
v6.retry = function(v19, v20, v21)
    v19.retryCount = v19.retryCount + 1;
    if v19.maxRetryCount < v19.retryCount then
        v19.reject(v20);
        return ;
    else
        v19:wait(v21 or math.pow(2, v19.retryCount));
        return ;
    end;
end;
v6.wait = function(v22, v23)
    v22.waitImpl(v23, function()
        v22:makeRequest();
    end);
end;
v6.makeRequest = function(v24)
    if not v24.canceled then
        v24.httpRequest = v24.requestFunction(v24.url, v24.requestMethod, v24.options);
        v24.httpRequest:Start(function(v25, v26)
            if v24.session ~= v3.currentSession() then
                warn("Http request aborted", v24.url);
                return ;
            elseif not v25 then
                if not v24.canceled then
                    v24:retry(v4.error(v26.HttpError));
                end;
                return ;
            elseif v26.StatusCode >= 200 and v26.StatusCode < 400 then
                v24:processResponse(v26);
                return ;
            elseif not v5[v26.StatusCode] then
                if not (v26.StatusCode == v2.TOO_MANY_REQUESTS) or not v26.Headers["Retry-After"] then
                    v24.reject(v26);
                    return ;
                else
                    local v27 = tonumber(v26.Headers["Retry-After"]);
                    if v27 ~= nil and v27 <= v24.maxWaitTime then
                        v24:retry(v26, v27);
                        return ;
                    else
                        v24.reject(v26);
                        return ;
                    end;
                end;
            else
                v24:retry(v26);
                return ;
            end;
        end);
        return ;
    else
        return ;
    end;
end;
v6.cancel = function(v28)
    v28.canceled = true;
    v28.reject(v4.error(Enum.HttpError.Aborted));
    if v28.httpRequest then
        v28.httpRequest:Cancel();
    end;
end;
return v6;
