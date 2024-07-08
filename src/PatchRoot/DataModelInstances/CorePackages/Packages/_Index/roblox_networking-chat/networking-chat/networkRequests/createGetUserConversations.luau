local v0 = require(script.Parent.Parent.CHAT_URL);
return function(v1)
    return v1.roduxNetworking.GET({
        Name = "GetUserConversations"
    }, function(v2, v3, v4)
        return v2(v0):path("v2"):path("get-user-conversations"):queryArgs({
            pageNumber = v3, 
            pageSize = v4
        }):setStatusIds({
            v3
        });
    end);
end;
