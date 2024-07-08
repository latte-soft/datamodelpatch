local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.HttpServiceMock);
local v2 = require(l_Parent_0.Promise);
local function _(v3)
    return v3.Type == "internal";
end;
return function(v5)
    return function(v6)
        if not (v6.Type == "internal") then
            return v2.try(function()
                return {
                    type = "response", 
                    response = v5:RequestAsync({
                        Url = v6.Url, 
                        Method = v6.Method, 
                        Headers = v6.Headers, 
                        Body = v6.Body
                    })
                };
            end):catch(function(v7)
                return {
                    type = "error", 
                    error = v7
                };
            end);
        else
            return v2.new(function(v8, _)
                v5:RequestInternal({
                    Url = v6.Url, 
                    Method = v6.Method, 
                    Headers = v6.Headers, 
                    Body = v6.Body, 
                    Timeout = v6.Timeout, 
                    Priority = v6.Priority, 
                    CachePolicy = v6.CachePolicy, 
                    RequestType = v6.RequestType
                }):Start(function(_, v11)
                    v8({
                        type = "response", 
                        response = v11
                    });
                end);
            end):catch(function(v12)
                return {
                    type = "error", 
                    error = v12
                };
            end);
        end;
    end;
end;
