local l_Parent_0 = script:FindFirstAncestor("AppChatNetworking").Parent;
local v1 = require(l_Parent_0.HttpRequest);
local v2 = require(l_Parent_0.Loggers).Logger:new("AppChat.Networking");
return {
    default = v1.config({
        requestFunction = function(v3, v4, v5)
            v2:info((("Fetching: [ requestMethod = \"%*\", url = \"%*\" ]"):format(v4, v3)));
            return v1.requestFunctions.RequestInternal(v3, v4, v5);
        end, 
        postRequestFunction = function(v6, v7)
            v2:debug((("Returned: [ requestMethod = \"%*\", url = \"%*\", statusCode = %*%*]"):format(v7.requestMethod, v7.url, v6.StatusCode, v6.HttpError ~= Enum.HttpError.OK and (", HttpError = %*"):format(v6.HttpError) or "")));
        end
    }), 
    logger = v2
};
