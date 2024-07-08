local v0 = require(script.Parent.Parent.CHAT_URL);
return function(v1)
    return v1.roduxNetworking.POST({
        Name = "StartGroupConversation"
    }, function(v2, v3, v4)
        return v2(v0):path("v2"):path("start-group-conversation"):body({
            participantUserIds = v3, 
            title = v4
        }):setStatusIds(v3);
    end);
end;
