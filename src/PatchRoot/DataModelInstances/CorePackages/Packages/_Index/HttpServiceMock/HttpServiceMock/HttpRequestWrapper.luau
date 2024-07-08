local l_Parent_0 = script.Parent;
local l_getDefaultValue_0 = require(l_Parent_0.Parent.SharedUtils).getDefaultValue;
local _ = require(l_Parent_0.Types);
local v3 = {
    [Enum.HttpError.OK] = "OK", 
    [Enum.HttpError.InvalidUrl] = "InvalidUrl", 
    [Enum.HttpError.DnsResolve] = "DnsResolve", 
    [Enum.HttpError.ConnectFail] = "ConnectFail", 
    [Enum.HttpError.OutOfMemory] = "OutOfMemory", 
    [Enum.HttpError.TimedOut] = "Timedout", 
    [Enum.HttpError.TooManyRedirects] = "TooManyRedirects", 
    [Enum.HttpError.InvalidRedirect] = "InvalidRedirect", 
    [Enum.HttpError.NetFail] = "NetFail", 
    [Enum.HttpError.Aborted] = "Aborted", 
    [Enum.HttpError.SslConnectFail] = "SslConnectFail", 
    [Enum.HttpError.SslVerificationFail] = "SslVerificationFail", 
    [Enum.HttpError.Unknown] = "Unknown"
};
local function v5(v4)
    return {
        WasRequestRetried = l_getDefaultValue_0(v4.WasRequestRetried, false), 
        DurationInQueue = v4.DurationInQueue or 0, 
        DurationNameLookup = v4.DurationNameLookup or 0, 
        DurationConnect = v4.DurationConnect or 0, 
        DurationSSLHandshake = v4.DurationSSLHandshake or 0, 
        DurationMakeRequest = v4.DurationMakeRequest or 0, 
        DurationReceiveResponse = v4.DurationReceiveResponse or 0, 
        RoundTripTime = v4.RoundTripTime or 0
    };
end;
local v6 = {};
local v7 = {
    __index = v6
};
v6.new = function(v8, v9)
    return (setmetatable({
        _request = v8, 
        _requestImplementation = v9, 
        _cancelCallbacks = {}
    }, v7));
end;
v6.Start = function(v10, v11)
    local v12 = false;
    local function _(v13, v14)
        if not v12 then
            v12 = true;
            v11(v13, v14);
            return ;
        else
            return ;
        end;
    end;
    local v22 = v10._requestImplementation(v10._request, (debug.traceback(nil, 2))):andThen(function(v16)
        if v16.type == "response" then
            local l_response_0 = v16.response;
            if not (l_response_0.HttpError ~= nil) or l_response_0.HttpError == Enum.HttpError.OK then
                local v18 = {
                    StatusCode = l_response_0.StatusCode, 
                    StatusMessage = l_response_0.StatusMessage, 
                    Stats = v5(l_response_0.Stats or {}), 
                    Body = l_response_0.Body, 
                    Headers = l_response_0.Headers or {}, 
                    IsCached = l_getDefaultValue_0(l_response_0.IsCached, false), 
                    HttpError = l_response_0.HttpError or Enum.HttpError.OK
                };
                if not v12 then
                    v12 = true;
                    v11(true, v18);
                    return ;
                else
                    return ;
                end;
            else
                local v19 = {
                    ErrorMessage = "HttpError: " .. "Unknown", 
                    HttpError = Enum.HttpError.Unknown
                };
                if not v12 then
                    v12 = true;
                    v11(false, v19);
                    return ;
                else
                    return ;
                end;
            end;
        elseif v16.type == "error" then
            local v20 = {
                ErrorMessage = "HttpError: " .. tostring(v16.error), 
                HttpError = Enum.HttpError.Unknown
            };
            if not v12 then
                v12 = true;
                v11(false, v20);
                return ;
            else
                return ;
            end;
        elseif v16.type == "internal-error" then
            error(v16.error);
            return ;
        elseif v16.type == "suspend" then
            local v21 = {
                ErrorMessage = "HttpError: request was delayed until the record-playback logic ended", 
                HttpError = Enum.HttpError.Unknown
            };
            if not v12 then
                v12 = true;
                v11(false, v21);
                return ;
            else
                return ;
            end;
        else
            error(("unknown result of type `%s`"):format((tostring(v16.type))));
            return ;
        end;
    end);
    table.insert(v10._cancelCallbacks, function()
        local l_Aborted_0 = Enum.HttpError.Aborted;
        local v24 = {
            ErrorMessage = "HttpError: " .. (v3[l_Aborted_0] or "Unknown"), 
            HttpError = l_Aborted_0
        };
        if not v12 then
            v12 = true;
            v11(false, v24);
        end;
        v22:cancel();
    end);
end;
v6.Cancel = function(v25)
    local l__cancelCallbacks_0 = v25._cancelCallbacks;
    v25._cancelCallbacks = {};
    for _, v28 in ipairs(l__cancelCallbacks_0) do
        v28();
    end;
end;
return v6;
