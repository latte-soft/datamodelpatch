local v0 = require(script:FindFirstAncestor("AppChatNetworking").url.CHAT_PLATFORM_BASE_URL);
return require(script.Parent.RoduxNetworking).POST(script, function(v1, v2)
    return v1(v0):path("v1"):path("get-conversations"):body({
        ids = {
            v2
        }, 
        include_participants = true, 
        include_user_data = true, 
        include_messages = true
    }):setStatusIds({
        v2
    });
end);
