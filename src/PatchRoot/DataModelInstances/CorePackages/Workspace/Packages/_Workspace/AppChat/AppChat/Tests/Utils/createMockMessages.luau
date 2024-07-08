local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local v1 = require(l_script_FirstAncestor_0.Components.ChatConversation.EnumMessageTypes);
local v2 = require(l_script_FirstAncestor_0.Models.MessageModel);
return function(v3, v4)
    local v5 = {};
    for v6 = 1, v4 do
        local v7 = v3.messageIdPrefix .. tostring(v6);
        table.insert(v5, {
            messageId = v7, 
            content = v3.content or "Message " .. v7, 
            isIncoming = v3.isIncoming or false, 
            messageType = v3.type or v1.PlainText, 
            sender = v6 == v4 and v3.sender or {}, 
            gameLink = v3.gameLink or nil, 
            sent = v3.sent or nil, 
            read = v3.read or nil, 
            senderType = v3.senderType or v2.SenderTypes.User
        });
    end;
    return v5;
end;
