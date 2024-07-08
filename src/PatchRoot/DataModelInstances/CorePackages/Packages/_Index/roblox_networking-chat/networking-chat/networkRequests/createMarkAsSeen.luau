local v0 = require(script.Parent.Parent.CHAT_URL);
return function(v1)
    return v1.roduxNetworking.POST({
        Name = "MarkAsSeen"
    }, function(v2, v3)
        return v2(v0):path("v2"):path("mark-as-seen"):body({
            conversationsToMarkSeen = v3
        }):setStatusIds(v3);
    end);
end;
