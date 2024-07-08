local l_HttpService_0 = game:GetService("HttpService");
local v1 = require(script.Parent.Parent.Parent.Network.Url);
return function(v2, v3, v4, v5)
    assert(v2, "requestImpl is required");
    assert(v3, "conversationId is required");
    assert(v4, "universeId is required");
    return v2(string.format("%s/send-game-link-message", v1.CHAT_URL), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            conversationId = v3, 
            universeId = v4, 
            decorators = v5
        })
    });
end;
