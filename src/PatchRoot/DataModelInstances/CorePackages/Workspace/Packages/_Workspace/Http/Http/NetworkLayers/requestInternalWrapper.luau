local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Http");
local v2 = require(l_script_FirstAncestor_0.Parent.Promise);
local v3 = require(l_script_FirstAncestor_0.NetworkProfiler);
local _ = require(l_script_FirstAncestor_0.RequestTypes);
local v5 = require(l_script_FirstAncestor_0.StatusCodes);
local v6 = require(l_script_FirstAncestor_0.NetworkLayers.HttpCanceller);
local v7 = game:DefineFastFlag("EnableErrorLoggingForAPICallsV1", false);
local v8 = require(l_script_FirstAncestor_0.Logger.GreenlistedEndpointsForErrorLogging);
local v9 = game:DefineFastFlag("LuaAppHttpNativeRetry", false);
local v10 = game:DefineFastFlag("LuaAppHttpSupportNoContent", false);
local l_None_0 = Enum.HttpCachePolicy.None;
local v12 = {
    [v5.REQUEST_TIMEOUT] = true, 
    [v5.SERVICE_UNAVAILABLE] = true, 
    [v5.GATEWAY_TIMEOUT] = true
};
local v13 = {};
v13.__index = v13;
local function _(v14)
    if v14.StatusCode == v5.NO_CONTENT then
        return true, nil;
    else
        local l_status_0, l_result_0 = pcall(l_HttpService_0.JSONDecode, l_HttpService_0, v14.Body);
        return l_status_0, l_result_0;
    end;
end;
v13.new = function(v18, v19, v20, v21)
    local v22 = {
        resolve = nil, 
        reject = nil, 
        retryCount = 0, 
        maxRetryCount = not not v21 and v21.maxRetryCount or 4, 
        httpRequest = nil, 
        canceled = false, 
        httpService = v18, 
        session = v6.currentSession(), 
        internalOptions = {
            Url = v19, 
            Method = not not v20 and v20 or "GET", 
            Body = not not v21 and v21.postBody or nil, 
            Timeout = not not v21 and v21.timeout or 15000, 
            CachePolicy = not not v21 and v21.cachePolicy or l_None_0, 
            Priority = not not v21 and v21.priority or 0, 
            Headers = not not v21 and v21.headers or nil, 
            RequestType = not not v21 and v21.requestType or nil
        }
    };
    if (not (v20 ~= "POST") or v20 == "PATCH") and (not (v22.internalOptions.Headers ~= nil) or v22.internalOptions.Headers["Content-Type"] == nil) then
        v22.internalOptions.Headers = v22.internalOptions.Headers or {};
        v22.internalOptions.Headers["Content-Type"] = "application/json";
    end;
    setmetatable(v22, v13);
    return v22;
end;
v13.start = function(v23, v24, v25)
    v23.resolve = v24;
    v23.reject = v25;
    v23:makeRequest();
end;
v13.processResponse = function(v26, v27)
    local v28 = nil;
    local v29 = nil;
    if not v10 then
        local l_status_1, l_result_1 = pcall(l_HttpService_0.JSONDecode, l_HttpService_0, v27.Body);
        v28 = l_status_1;
        v29 = l_result_1;
    else
        local v32, v33;
        if v27.StatusCode == v5.NO_CONTENT then
            v32 = true;
            v33 = nil;
        else
            local l_status_2, l_result_2 = pcall(l_HttpService_0.JSONDecode, l_HttpService_0, v27.Body);
            v32 = l_status_2;
            v33 = l_result_2;
        end;
        v28 = v32;
        v29 = v33;
    end;
    if v28 then
        v3:track({
            queued = v27.Stats.DurationInQueue, 
            nameLookup = v27.Stats.DurationNameLookup, 
            connect = v27.Stats.DurationConnect, 
            sslHandshake = v27.Stats.DurationSSLHandshake, 
            makeRequest = v27.Stats.DurationMakeRequest, 
            receiveResponse = v27.Stats.DurationReceiveResponse
        });
        v26.resolve({
            responseCode = v27.StatusCode, 
            requestUrl = v26.internalOptions.Url, 
            responseTimeMs = v27.Stats.RoundTripTime * 1000, 
            isJSONValid = true, 
            v29, 
            responseBody = v29
        });
        return ;
    else
        v26.reject({
            HttpError = Enum.HttpError.OK, 
            isJSONValid = false
        });
        return ;
    end;
end;
v13.retry = function(v36, v37, v38)
    local v39 = true;
    if not ((not v9 or not v37.Stats) or not v37.Stats.WasRequestRetried) then
        v39 = false;
    end;
    if v39 then
        v36.retryCount = v36.retryCount + 1;
        if v36.maxRetryCount < v36.retryCount then
            v39 = false;
        end;
    end;
    if v39 then
        if v36.internalOptions.Headers == nil then
            v36.internalOptions.Headers = {};
        end;
        v36.internalOptions.Headers["X-Retry-Attempt"] = tostring(v36.retryCount);
        delay(v38 or math.pow(2, v36.retryCount), function()
            v36:makeRequest();
        end);
        return ;
    else
        v36.reject(v37);
        return ;
    end;
end;
v13.makeRequest = function(v40)
    if not v40.canceled then
        v40.httpRequest = v40.httpService:RequestInternal(v40.internalOptions);
        v40.httpRequest:Start(function(v41, v42)
            if v40.session ~= v6.currentSession() then
                warn("Http request aborted", v40.internalOptions.Url);
                return ;
            elseif not v41 then
                if not v40.canceled then
                    v40:retry({
                        HttpError = v42.HttpError
                    });
                end;
                return ;
            elseif v42.StatusCode >= 200 and v42.StatusCode < 400 then
                v40:processResponse(v42);
                return ;
            elseif not v12[v42.StatusCode] then
                if not (v42.StatusCode == v5.TOO_MANY_REQUESTS) or not v42.Headers["Retry-After"] then
                    if v7 then
                        v8.sendCounterIfKeyMatchesFetchStatus(v40.internalOptions.Url, v42.StatusCode);
                    end;
                    v40.reject(v42);
                    return ;
                else
                    local v43 = tonumber(v42.Headers["Retry-After"]);
                    if v43 ~= nil and v43 <= 16 then
                        v40:retry(v42, v43);
                        return ;
                    else
                        if v7 then
                            v8.sendCounterIfKeyMatchesFetchStatus(v40.internalOptions.Url, v42.StatusCode);
                        end;
                        v40.reject(v42);
                        return ;
                    end;
                end;
            else
                v40:retry(v42);
                return ;
            end;
        end);
        return ;
    else
        return ;
    end;
end;
v13.cancel = function(v44)
    v44.canceled = true;
    v44.reject({
        HttpError = Enum.HttpError.Aborted
    });
    if v44.httpRequest then
        v44.httpRequest:Cancel();
    end;
end;
return function(v45)
    if not v45 then
        v45 = l_HttpService_0;
    end;
    return function(v46, v47, v48)
        local v49 = v13.new(v45, v46, v47, v48);
        return v2.new(function(v50, v51)
            v49:start(v50, v51);
        end), function()
            v49:cancel();
        end;
    end;
end;
