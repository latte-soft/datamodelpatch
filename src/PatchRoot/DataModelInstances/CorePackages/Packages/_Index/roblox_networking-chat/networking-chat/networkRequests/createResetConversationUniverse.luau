local v0 = require(script.Parent.Parent.CHAT_URL);
return function(v1)
    return v1.roduxNetworking.POST({
        Name = "ResetConversationUniverse"
    }, function(v2, v3)
        return v2(v0):path("v2"):path("reset-conversation-universe"):body({
            conversationId = v3
        }):setStatusIds({
            v3
        });
    end);
end;
