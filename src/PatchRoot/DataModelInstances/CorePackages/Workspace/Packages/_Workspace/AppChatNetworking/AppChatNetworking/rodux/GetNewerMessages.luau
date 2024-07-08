local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChatNetworking");
local v1 = require(l_script_FirstAncestor_0.url.CHAT_PLATFORM_BASE_URL);
local v2 = require(script.Parent.RoduxNetworking);
local v3 = require(l_script_FirstAncestor_0.Constants);
return v2.GET(script, function(v4, v5, v6)
    return v4(v1):path("v1"):path("get-conversation-messages"):queryArgs({
        conversation_id = v5, 
        cursor = v6; 
        v3.PageSize.GET_NEW_MESSAGES
    }):setStatusIds({
        v5
    });
end);
