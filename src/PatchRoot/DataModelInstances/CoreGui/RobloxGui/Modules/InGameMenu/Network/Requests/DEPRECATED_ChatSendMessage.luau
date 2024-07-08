local l_HttpService_0 = game:GetService("HttpService");
local v1 = require(script.Parent.Parent.Parent.Network.Url);
return function(v2, v3, v4, v5)
    return v2(string.format("%s/send-message", v1.CHAT_URL), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            conversationId = v3, 
            message = v4, 
            decorators = v5
        })
    });
end;
