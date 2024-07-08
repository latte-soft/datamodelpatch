local v0 = require(script.Parent.Parent.CHAT_URL);
return function(v1)
    return v1.roduxNetworking.GET({
        Name = "GetUnreadMessages"
    }, function(v2, v3, v4)
        return v2(v0):path("v2"):path("get-unread-messages"):queryArgs({
            pageSize = v4
        }):expandedQueryArgsWithIds("conversationIds", v3);
    end);
end;
