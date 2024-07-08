local v0 = require(script:FindFirstAncestor("AppChatNetworking").url.CHAT_PLATFORM_BASE_URL);
return require(script.Parent.RoduxNetworking).GET(script, function(v1, v2)
    return v1(v0):path("v1"):path("get-user-conversations"):queryArgs({
        cursor = v2, 
        include_user_data = true, 
        include_messages = true
    });
end);
