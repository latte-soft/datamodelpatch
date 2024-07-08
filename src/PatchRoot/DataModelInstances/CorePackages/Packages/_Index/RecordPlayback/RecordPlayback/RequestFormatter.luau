local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local _ = require(l_Parent_1.HttpServiceMock);
local v3 = require(l_Parent_1.PrettyFormat);
local v4 = require(l_Parent_0.UrlUtils);
local v5 = {};
local v6 = {
    __index = v5
};
v5.new = function()
    return (setmetatable({}, v6));
end;
v5.formatRequest = function(_, v8)
    return {
        url = v4.parse(v8.Url), 
        method = v8.Method, 
        headers = v8.Headers, 
        body = v8.Body, 
        timeout = v8.Timeout, 
        priority = v8.Priority, 
        cachePolicy = v8.CachePolicy, 
        requestType = v8.RequestType
    };
end;
v5.formatResponse = function(_, v10)
    if v10.Success ~= nil then
        return {
            type = "response", 
            status = {
                success = v10.Success, 
                code = v10.StatusCode, 
                message = v10.StatusMessage
            }, 
            headers = v10.Headers, 
            body = v10.Body
        };
    elseif v10.Stats ~= nil then
        return {
            type = "internal-response", 
            status = {
                code = v10.StatusCode, 
                message = v10.StatusMessage
            }, 
            headers = v10.Headers, 
            body = v10.Body, 
            isCached = v10.IsCached, 
            stats = {
                retried = v10.Stats.WasRequestRetried, 
                durations = {
                    inQueue = v10.Stats.DurationInQueue, 
                    nameLookup = v10.Stats.DurationNameLookup, 
                    connect = v10.Stats.DurationConnect, 
                    SSLHandshake = v10.Stats.DurationSSLHandshake, 
                    makeRequest = v10.Stats.DurationMakeRequest, 
                    receiveResponse = v10.Stats.DurationReceiveResponse, 
                    roundTripTime = v10.Stats.RoundTripTime
                }
            }
        };
    elseif v10.ErrorMessage ~= nil then
        return {
            type = "internal-error", 
            errorMessage = v10.ErrorMessage, 
            httpError = v10.HttpError
        };
    else
        error("unsupported response " .. v3.format(v10));
        return ;
    end;
end;
v5.loadResponse = function(_, v12)
    if v12.type == "response" then
        return {
            Success = v12.status.success, 
            StatusCode = v12.status.code, 
            StatusMessage = v12.status.message, 
            Headers = v12.headers, 
            Body = v12.body
        };
    elseif v12.type == "internal-response" then
        return {
            StatusCode = v12.status.code, 
            StatusMessage = v12.status.message, 
            Headers = v12.headers, 
            Body = v12.body, 
            IsCached = v12.isCached, 
            Stats = {
                WasRequestRetried = v12.stats.retried, 
                DurationInQueue = v12.stats.durations.inQueue, 
                DurationNameLookup = v12.stats.durations.nameLookup, 
                DurationConnect = v12.stats.durations.connect, 
                DurationSSLHandshake = v12.stats.durations.SSLHandshake, 
                DurationMakeRequest = v12.stats.durations.makeRequest, 
                DurationReceiveResponse = v12.stats.durations.receiveResponse, 
                RoundTripTime = v12.stats.durations.roundTripTime
            }, 
            HttpError = Enum.HttpError.OK
        };
    elseif v12.type == "internal-error" then
        return {
            ErrorMessage = v12.errorMessage, 
            HttpError = v12.httpError
        };
    else
        error(("unsupported response type `%s`"):format((tostring(v12.type))));
        return ;
    end;
end;
return v5;
