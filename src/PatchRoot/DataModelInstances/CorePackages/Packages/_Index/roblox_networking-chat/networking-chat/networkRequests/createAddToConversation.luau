local v0 = require(script.Parent.Parent.CHAT_URL);
return function(v1)
    return v1.roduxNetworking.POST({
        Name = "AddToConversation"
    }, function(v2, v3, v4)
        return v2(v0):path("v2"):path("add-to-conversation"):body({
            participantUserIds = v3, 
            conversationId = v4
        }):setStatusIds({
            v4
        });
    end);
end;
