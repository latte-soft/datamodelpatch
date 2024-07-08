local v0 = require(script.Parent.Parent.CHAT_URL);
return function(v1)
    return v1.roduxNetworking.POST({
        Name = "StartOneToOneConversation"
    }, function(v2, v3)
        return v2(v0):path("v2"):path("start-one-to-one-conversation"):body({
            participantUserId = v3
        }):setStatusIds({
            v3
        });
    end);
end;
