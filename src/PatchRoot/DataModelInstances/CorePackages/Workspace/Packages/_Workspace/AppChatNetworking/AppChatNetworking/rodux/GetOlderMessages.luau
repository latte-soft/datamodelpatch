local v0 = require(script:FindFirstAncestor("AppChatNetworking").url.CHAT_PLATFORM_BASE_URL);
return require(script.Parent.RoduxNetworking).GET(script, function(v1, v2, v3)
    return v1(v0):path("v1"):path("get-conversation-messages"):queryArgs({
        conversation_id = v2, 
        cursor = v3
    }):setStatusIds({
        v2
    });
end);
