local l_HttpService_0 = game:GetService("HttpService");
local v1 = require(script.Parent.Parent.Utility.Promise);
local l_Extreme_0 = Enum.ThrottlingPriority.Extreme;
local l_ApplicationJson_0 = Enum.HttpContentType.ApplicationJson;
return function(v4)
    local function _(v5, v6)
        assert(v6.postBody, "Expected a postBody to be specified with this request");
        assert(type(v6.postBody) == "string", "Expected postBody to be a string");
        if not v6.contentType then
            v6.contentType = l_ApplicationJson_0;
        end;
        if not v6.throttlingPriority then
            v6.throttlingPriority = l_Extreme_0;
        end;
        return function()
            return v4:PostAsyncFullUrl(v5, v6.postBody, v6.throttlingPriority, v6.contentType);
        end;
    end;
    local function _(v8)
        return function()
            return v4:GetAsyncFullUrl(v8, l_Extreme_0);
        end;
    end;
    return function(v10, v11, v12)
        assert(type(v10) == "string", "Expected url to be a string");
        assert(type(v11) == "string", "Expected requestMethod to be a string");
        assert(not v12 or type(v12) == "table", "Expected options to be a table");
        v11 = string.upper(v11);
        local v13 = nil;
        if v11 == "POST" then
            assert(v12.postBody, "Expected a postBody to be specified with this request");
            assert(type(v12.postBody) == "string", "Expected postBody to be a string");
            if not v12.contentType then
                v12.contentType = l_ApplicationJson_0;
            end;
            if not v12.throttlingPriority then
                v12.throttlingPriority = l_Extreme_0;
            end;
            v13 = function()
                return v4:PostAsyncFullUrl(v10, v12.postBody, v12.throttlingPriority, v12.contentType);
            end;
        elseif v11 == "GET" then
            v13 = function()
                return v4:GetAsyncFullUrl(v10, l_Extreme_0);
            end;
        else
            error(string.format("Unsupported requestMethod : %s", v11 or "nil"));
        end;
        return v1.new(function(v14, v15)
            if not v13 then
                v15();
                return ;
            else
                coroutine.wrap(function()
                    local l_status_0, l_result_0 = pcall(v13);
                    if not l_status_0 then
                        v15(l_result_0);
                        return ;
                    else
                        local l_status_1, l_result_1 = pcall(function()
                            return l_HttpService_0:JSONDecode(l_result_0);
                        end);
                        if not l_status_1 then
                            v15(l_result_1);
                            return ;
                        else
                            v14({
                                responseBody = l_result_1
                            });
                            return ;
                        end;
                    end;
                end)();
                return ;
            end;
        end);
    end;
end;
