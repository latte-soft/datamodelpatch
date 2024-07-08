local l_Parent_0 = script:FindFirstAncestor("ServerUI").Parent;
local v1 = require(l_Parent_0.HttpRequest);
local v2 = require(l_Parent_0.Lumberyak).Logger.new(nil, "UIConfiguration");
local v3 = require(l_Parent_0.RoduxNetworking);
local l_Url_0 = require(l_Parent_0.Http).Url;
local v5 = {};
v5.__index = v5;
v5.new = function(v6)
    local v7 = if not not v6 and v6.enableLogging then v2:new("UIConfiguration Networking") else nil;
    local v13 = {
        networking = v3.config({
            keyPath = not not v6 and v6.roduxKeyPath or "UIConfiguration.NetworkStatus", 
            networkImpl = v1.config({
                requestFunction = function(v8, v9, v10)
                    if v7 then
                        v7:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", v9, v8));
                    end;
                    return v1.requestFunctions.HttpRbxApi(v8, v9, v10);
                end, 
                postRequestFunction = function(v11, v12)
                    if v7 then
                        v7:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s, body = %s ]", v12.requestMethod, v12.url, v11.StatusCode, v11.Body));
                    end;
                end, 
                maxRetryCount = not not v6 and v6.maxRetryCount or 0
            })
        })
    };
    setmetatable(v13, v5);
    return v13;
end;
v5.fetch = function(v14, v15, v16)
    return v14.networking.GET(script, function(v17)
        return v17(l_Url_0.APIS_URL):path(v15):queryArgs(v16);
    end).API();
end;
return v5;
