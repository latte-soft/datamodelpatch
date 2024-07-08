local _ = require(script:FindFirstAncestor("AppChat").Parent.AppChatNetworking);
local v1 = require(script.Parent.MessageModel);
return {
    responseUser = function(v2)
        return {
            id = not v2.id and "message-id" or v2.id, 
            type = v1.SenderTypes.User, 
            sender_user_id = not v2.sender_user_id and 1 or v2.sender_user_id, 
            sent = not v2.sent and "2021-01-01T00:00:00Z" or v2.sent, 
            content = not v2.content and "message-content" or v2.content, 
            created_at = not v2.created_at and "2021-01-01T00:00:00Z" or v2.created_at, 
            moderation_type = not v2.moderation_type and "trusted_comms" or v2.moderation_type
        };
    end, 
    responseSystem = function(v3)
        return {
            id = not v3.id and "message-id" or v3.id, 
            type = "system", 
            sent = not v3.sent and "2021-01-01T00:00:00Z" or v3.sent, 
            content = not v3.content and "message-content" or v3.content, 
            created_at = not v3.created_at and "2021-01-01T00:00:00Z" or v3.created_at
        };
    end
};
