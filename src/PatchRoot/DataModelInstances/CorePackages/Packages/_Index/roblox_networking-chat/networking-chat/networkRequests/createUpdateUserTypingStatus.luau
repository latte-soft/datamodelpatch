local v0 = require(script.Parent.Parent.CHAT_URL);
return function(v1)
    return v1.roduxNetworking.POST({
        Name = "UpdateUserTypingStatus"
    }, function(v2, v3, v4)
        return v2(v0):path("v2"):path("update-user-typing-status"):body({
            conversationId = v3, 
            isTyping = v4
        }):setStatusIds({
            v3
        });
    end);
end;
