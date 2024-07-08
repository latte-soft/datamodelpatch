local v0 = require(script.Parent.Parent.CHAT_URL);
return function(v1)
    return v1.roduxNetworking.GET({
        Name = "GetMessages"
    }, function(v2, v3, v4, v5)
        return v2(v0):path("v2"):path("get-messages"):queryArgs({
            conversationId = v3, 
            pageSize = v4, 
            exclusiveStartMessageId = v5
        }):setStatusIds({
            v3
        });
    end);
end;
