local v0 = require(script.Parent.Parent.CHAT_URL);
return function(v1)
    return v1.roduxNetworking.POST({
        Name = "MarkAsRead"
    }, function(v2, v3, v4)
        return v2(v0):path("v2"):path("mark-as-read"):body({
            conversationId = v3, 
            endMessageId = v4
        }):setStatusIds({
            v3
        });
    end);
end;
