local l_HttpService_0 = game:GetService("HttpService");
local v1 = require(script.Parent.Parent.Parent.Network.Url);
return function(v2, v3, _)
    return v2(string.format("%s/start-one-to-one-conversation", v1.CHAT_URL), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            participantuserId = v3
        })
    });
end;
