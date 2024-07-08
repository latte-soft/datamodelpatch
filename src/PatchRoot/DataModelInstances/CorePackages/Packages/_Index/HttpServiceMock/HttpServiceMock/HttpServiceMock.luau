local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent;
local l_unwrapPromiseError_0 = require(l_Parent_0.Parent.SharedUtils).unwrapPromiseError;
local _ = require(l_Parent_0.Types);
local v4 = require(l_Parent_0.httpContentTypeToHeader);
local v5 = require(l_Parent_0.HttpRequestWrapper);
local v6 = {};
local v7 = {
    __index = v6
};
local function _(v8)
    return v8:lower();
end;
local function v14(v10)
    local v11 = {};
    for v12, v13 in pairs(v10) do
        v11[v12:lower()] = v13;
    end;
    return v11;
end;
local function _(v15)
    return v15:upper();
end;
v6.new = function(v17)
    return (setmetatable({
        HttpEnabled = true, 
        _requestImplementation = v17
    }, v7));
end;
v6.GenerateGUID = function(_, v19)
    return l_HttpService_0:GenerateGUID(v19);
end;
v6.GetAsync = function(v20, v21, v22, v23)
    if v22 == nil then
        v22 = false;
    end;
    local v24 = v14(v23 or {});
    if v22 then
        v24[("cache-control"):lower()] = "no-cache";
    end;
    return v20:_processLegacyResponse({
        Type = "get", 
        Url = v21, 
        Method = ("GET"):upper(), 
        Headers = v24, 
        Body = nil, 
        Timeout = nil, 
        Priority = nil, 
        CachePolicy = nil, 
        RequestType = nil
    });
end;
v6.GetHttpEnabled = function(v25)
    return v25.HttpEnabled;
end;
v6.GetUserAgent = function(_)
    return "Roblox/mockAgent";
end;
v6.JSONDecode = function(_, v28)
    return l_HttpService_0:JSONDecode(v28);
end;
v6.JSONEncode = function(_, v30)
    return l_HttpService_0:JSONEncode(v30);
end;
v6.PostAsync = function(v31, v32, v33, v34, v35, v36)
    local l_ApplicationJson_0 = Enum.HttpContentType.ApplicationJson;
    if v34 ~= nil then
        l_ApplicationJson_0 = v34;
    end;
    if v35 == nil then
        v35 = false;
    end;
    local v38 = v14(v36 or {});
    if v35 then
        v38[("content-encoding"):lower()] = "gzip";
    end;
    v38[("content-type"):lower()] = v4(l_ApplicationJson_0);
    return v31:_processLegacyResponse({
        Type = "post", 
        Url = v32, 
        Method = ("POST"):upper(), 
        Headers = v38, 
        Body = v33
    });
end;
v6._processLegacyResponse = function(v39, v40)
    local v41 = v39._requestImplementation(v40, (debug.traceback(nil, 3))):expect();
    if v41.type == "error" then
        error(v41.error, 2);
        return ;
    elseif v41.type == "internal-error" then
        error(l_unwrapPromiseError_0(v41.error), 2);
        return ;
    elseif v41.type == "response" then
        local l_response_0 = v41.response;
        local l_StatusCode_0 = l_response_0.StatusCode;
        if (l_StatusCode_0 >= 200 and l_StatusCode_0 <= 299) and l_StatusCode_0 ~= 202 then
            return l_response_0.Body;
        else
            error(("HTTP %d (%s)"):format(l_StatusCode_0, l_response_0.StatusMessage), 2);
            return ;
        end;
    elseif v41.type == "suspend" then
        error("request was delayed until the record-playback logic ended", 2);
        return ;
    else
        error(("unknown result of type `%s`"):format((tostring(v41.type))), 2);
        return ;
    end;
end;
v6.RequestAsync = function(v44, v45)
    local v46 = v44._requestImplementation({
        Type = "request", 
        Url = v45.Url, 
        Method = (v45.Method or "GET"):upper(), 
        Headers = v14(v45.Headers or {}), 
        Body = v45.Body
    }, (debug.traceback(nil, 2))):expect();
    if v46.type == "error" then
        error(v46.error);
        return ;
    elseif v46.type == "internal-error" then
        error(l_unwrapPromiseError_0(v46.error));
        return ;
    elseif v46.type == "response" then
        return v46.response;
    else
        error(("unknown result of type `%s`"):format((tostring(v46.type))));
        return ;
    end;
end;
v6.RequestInternal = function(v47, v48)
    return v5.new({
        Type = "internal", 
        Url = v48.Url, 
        Method = (v48.Method or "GET"):upper(), 
        Headers = v14(v48.Headers or {}), 
        Body = v48.Body, 
        Timeout = v48.Timeout, 
        Priority = v48.Priority, 
        CachePolicy = v48.CachePolicy, 
        RequestType = v48.RequestType
    }, v47._requestImplementation);
end;
v6.SetHttpEnabled = function(v49, v50)
    v49.HttpEnabled = v50;
end;
v6.UrlEncode = function(_, v52)
    return l_HttpService_0:UrlEncode(v52);
end;
return v6;
