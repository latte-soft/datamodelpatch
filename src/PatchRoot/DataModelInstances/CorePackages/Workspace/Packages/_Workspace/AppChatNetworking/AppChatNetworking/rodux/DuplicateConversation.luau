local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChatNetworking");
local v1 = require(l_script_FirstAncestor_0.url.CHAT_PLATFORM_BASE_URL);
local v2 = require(script.Parent.RoduxNetworking);
local _ = require(l_script_FirstAncestor_0.responses.SharedTypes);
return v2.POST(script, function(v4, v5, v6)
    return v4(v1):path("v1"):path("create-conversations"):body({
        conversations = {
            {
                conversation_to_duplicate = v5, 
                moderation_type = v6, 
                type = "group", 
                participant_user_ids = {}
            }
        }
    }):setStatusIds({
        v5
    });
end);
