local l_HttpService_0 = game:GetService("HttpService");
local v1 = require(script.Parent.Util.getHeaders);
local v2 = require(script.Parent.Util.getPostBody);
return function(v3, v4, v5)
    return {
        Start = function(_, v7)
            local l_status_0, l_result_0 = pcall(function()
                return l_HttpService_0:RequestAsync({
                    Url = v3, 
                    Method = v4, 
                    Body = v2(v5.postBody, v4), 
                    Headers = v1(v5.headers, v4)
                });
            end);
            v7(l_status_0, l_result_0);
        end, 
        Cancel = function()
        end
    };
end;
