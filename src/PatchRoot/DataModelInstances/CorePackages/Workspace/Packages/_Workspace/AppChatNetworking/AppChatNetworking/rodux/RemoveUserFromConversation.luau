local v0 = require(script:FindFirstAncestor("AppChatNetworking").url.CHAT_PLATFORM_BASE_URL);
return require(script.Parent.RoduxNetworking).POST(script, function(v1, v2, v3)
    local v4 = tonumber(v3);
    assert(v4, "Invalid removingUserId provided. Could not be converted to a number.");
    return v1(v0):path("v1"):path("remove-users"):body({
        conversation_id = v2, 
        user_ids = {
            v4
        }
    });
end);
