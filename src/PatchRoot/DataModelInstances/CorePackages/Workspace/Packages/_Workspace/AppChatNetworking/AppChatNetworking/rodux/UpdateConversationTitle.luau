local v0 = require(script:FindFirstAncestor("AppChatNetworking").url.CHAT_PLATFORM_BASE_URL);
return require(script.Parent.RoduxNetworking).POST(script, function(v1, v2, v3)
    return v1(v0):path("v1"):path("update-conversations"):body({
        conversations = {
            {
                id = v2, 
                name = v3
            }
        }
    }):setStatusIds(v2);
end);
