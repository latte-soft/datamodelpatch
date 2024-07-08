local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.HttpRequest);
local v2 = require(l_Parent_0.RoduxNetworking);
local v3 = require(l_Parent_0.Loggers).Logger:new("AppChat");
return v2.config({
    keyPath = "ChatAppReducer.networkStatus", 
    networkImpl = v1.config({
        requestFunction = function(v4, v5, v6)
            v3:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", v5, v4));
            return v1.requestFunctions.HttpRbxApi(v4, v5, v6);
        end, 
        postRequestFunction = function(v7, v8)
            v3:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s, body = %s ]", v8.requestMethod, v8.url, v7.StatusCode, v7.Body));
        end
    }), 
    killRequestWithFilteredIds = true
});
