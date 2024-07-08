local v0 = require(script.Parent.Parent.CHAT_URL);
return function(v1)
    return v1.roduxNetworking.POST({
        Name = "SendMessage"
    }, function(v2, v3, v4, v5)
        return v2(v0):path("v2"):path("send-message"):body({
            message = v3, 
            conversationId = v4, 
            decorators = v5
        }):setStatusIds({
            v4
        });
    end);
end;
