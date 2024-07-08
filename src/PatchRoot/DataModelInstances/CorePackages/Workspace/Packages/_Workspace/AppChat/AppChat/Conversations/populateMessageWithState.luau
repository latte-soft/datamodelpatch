local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Users.getThumbnailsForUserIds);
local v3 = require(l_script_FirstAncestor_0.Models.Conversation);
local v4 = require(l_script_FirstAncestor_0.Models.MessageModel);
local v5 = require(l_Parent_0.Cryo);
local v6 = require(l_script_FirstAncestor_0.Logger):new(script.Name);
local v7 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableChatSystemMessages);
return function(v8, v9, v10, v11, v12, v13)
    local v14 = v9.senderTargetId ~= tostring(v8.LocalUserId);
    local v15 = nil;
    local v16 = nil;
    local v17 = not v12 and v11.fetchedOldestMessage == true;
    local v18 = false;
    if ((v12 and v9.sent) and v12.sent) ~= nil then
        v18 = v9.sent:GetUnixTimestamp() - v12.sent:GetUnixTimestamp() > 300;
    end;
    v15 = v17 or v18;
    v16 = (v15 or not v12) or v12.senderTargetId ~= v9.senderTargetId;
    local l_Users_0 = v8.Users;
    local v20 = {};
    if (not v14 or not v16) or not v9.senderTargetId then
        if not (not (v7() and v9.senderType == v4.SenderTypes.User) or v9.senderTargetId) then
            v6:warning((("User message with no senderTargetId: %*"):format(v9.id)));
        end;
    else
        v20 = {
            id = v9.senderTargetId, 
            thumbnail = not not l_Users_0[v9.senderTargetId] and v2({
                v9.senderTargetId
            })[1] or "", 
            shouldShowName = v11.conversationType == v3.Type.MULTI_USER_CONVERSATION
        };
    end;
    return v5.Dictionary.join(v9, {
        messageId = v10, 
        position = not not v12 and v12.position + 1 or 1, 
        isIncoming = v14, 
        isNewSender = v16, 
        sender = v20, 
        isSending = v13 or false, 
        showDateTime = v15, 
        additionalProps = {
            placeId = v9.placeId, 
            universeId = v9.gameLink and v9.gameLink.universeId, 
            senderUserId = not not v14 and v9.senderTargetId or nil
        }
    });
end;
