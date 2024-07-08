local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_HttpService_0 = game:GetService("HttpService");
local v2 = require(script.Parent.Parent.StatusCode);
local l_Extreme_0 = Enum.ThrottlingPriority.Extreme;
local l_ApplicationJson_0 = Enum.HttpContentType.ApplicationJson;
local function _(v5, v6)
    return pcall(function()
        return l_HttpRbxApiService_0:GetAsyncFullUrl(v5, v6.throttlingPriority or l_Extreme_0, v6.httpRequestType or nil);
    end);
end;
local function v11(v8, v9)
    local v10 = nil;
    assert(v9.postBody, "Expected a postBody to be specified with this request");
    if type(v9.postBody) == "table" then
        v10 = l_HttpService_0:JSONEncode(v9.postBody);
    elseif type(v9.postBody) == "string" then
        v10 = v9.postBody;
    else
        error("Expected postBody to be a string or table");
    end;
    return pcall(function()
        return l_HttpRbxApiService_0:PostAsyncFullUrl(v8, v10, v9.throttlingPriority or l_Extreme_0, v9.contentType or l_ApplicationJson_0, v9.httpRequestType or nil);
    end);
end;
local function v16(v12)
    local l_OK_0 = v2.OK;
    local l_status_0, _ = pcall(function()
        return l_HttpService_0:JSONDecode(v12);
    end);
    if not l_status_0 then
        l_OK_0 = tonumber(v12:sub(6, 8));
    end;
    return {
        Body = v12, 
        StatusCode = l_OK_0, 
        Headers = {}
    };
end;
return function(v17, v18, v19)
    return {
        Start = function(_, v21)
            local v22 = nil;
            local v23 = nil;
            if v18 == "GET" then
                local l_v17_0 = v17;
                local l_v19_0 = v19;
                local l_status_1, l_result_1 = pcall(function()
                    return l_HttpRbxApiService_0:GetAsyncFullUrl(l_v17_0, l_v19_0.throttlingPriority or l_Extreme_0, l_v19_0.httpRequestType or nil);
                end);
                local l_l_status_1_0 = l_status_1;
                local l_l_result_1_0 = l_result_1;
                v22 = l_l_status_1_0;
                v23 = l_l_result_1_0;
            elseif v18 == "POST" then
                local v30, v31 = v11(v17, v19);
                v22 = v30;
                v23 = v31;
            else
                error("Unsupported method: " .. v18);
            end;
            v21(v22, (v16(v23)));
        end, 
        Cancel = function()
        end
    };
end;
