local v0 = require(script.Parent.Parent.CHAT_URL);
return function(v1)
    return v1.roduxNetworking.POST({
        Name = "RenameGroupConversation"
    }, function(v2, v3, v4)
        return v2(v0):path("v2"):path("rename-group-conversation"):body({
            conversationId = v3, 
            newTitle = v4
        }):setStatusIds({
            v3
        });
    end);
end;
