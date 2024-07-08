local l_Parent_0 = script.Parent.Parent;
local l_Error_0 = require(l_Parent_0.LuauPolyfill).Error;
local v2 = require(l_Parent_0.Promise);
local l_Response_0 = require(script.Parent.Response).Response;
local l_Request_0 = require(script.Parent.Request).Request;
local function _(v5)
    return l_Response_0.new(v5.Body, {
        status = v5.StatusCode, 
        statusText = v5.StatusMessage, 
        headers = v5.Headers
    });
end;
return function(v7)
    return function(v8, v9)
        return v2.new(function(v10, v11)
            local l_status_0, l_result_0 = pcall(function()
                return l_Request_0.new(v8, v9);
            end);
            if l_status_0 then
                v7:RequestInternal({
                    Url = l_result_0.url, 
                    Method = l_result_0.method, 
                    Body = l_result_0.body, 
                    Headers = l_result_0.headers.headerList, 
                    CachePolicy = l_result_0.cache
                }):Start(function(v14, v15)
                    if v14 then
                        v10((l_Response_0.new(v15.Body, {
                            status = v15.StatusCode, 
                            statusText = v15.StatusMessage, 
                            headers = v15.Headers
                        })));
                        return ;
                    else
                        l_result_0.signal:fire();
                        v11(l_Error_0.new(v15.ErrorMessage));
                        return ;
                    end;
                end);
                return ;
            else
                v11(l_Error_0.new(l_result_0));
                return ;
            end;
        end);
    end;
end;
