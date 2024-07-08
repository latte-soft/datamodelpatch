local l_Players_0 = game:GetService("Players");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_DateTime_0 = require(l_Parent_0.Time).DateTime;
local l_MockId_0 = require(l_Parent_0.UnitTestHelpers).MockId;
local v5 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableUnfilteredThreadsUI);
local v6 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableChatSystemMessages);
local v8 = {
    new = function(v7)
        return {
            universeId = tostring(v7)
        };
    end
};
local v9 = {
    SenderTypes = {
        User = "user", 
        System = "system", 
        UnknownType = "unknown_type"
    }, 
    MessageTypes = {
        PlainText = "PlainText", 
        Link = "Link", 
        System = "System"
    }, 
    LinkTypes = {
        Game = "Game"
    }, 
    ModerationTypes = {
        TrustedComms = "trusted_comms", 
        Moderated = "moderated", 
        Invalid = "invalid", 
        UnknownType = "unknown_type"
    }
};
v9.new = function(v10)
    v9.__index = v9;
    local v11 = v10 or {};
    setmetatable(v11, v9);
    return v11;
end;
v9.fromWeb = function(v12, v13, v14)
    if v9.DoRequiredFieldsPresent(v12) then
        local v15 = v9.new();
        v15.id = v12.id;
        v15.senderTargetId = tostring(v12.senderTargetId);
        v15.senderType = v12.senderType;
        v15.read = v12.read;
        v15.sent = l_DateTime_0.fromIsoDate(v12.sent);
        v15.conversationId = tostring(v13);
        v15.previousMessageId = v14;
        v15.filteredForReceivers = false;
        v15:parseContentWeb(v12);
        return v15;
    else
        return nil;
    end;
end;
v9.fromSentWeb = function(v16, v17)
    if v9.DoRequiredFieldsPresentForSent(v16) then
        local v18 = v9.new();
        v18.id = v16.messageId;
        v18.senderTargetId = tostring(l_Players_0.LocalPlayer.UserId);
        v18.senderType = "User";
        v18.read = true;
        v18.sent = l_DateTime_0.fromIsoDate(v16.sent);
        v18.conversationId = tostring(v17);
        v18.previousMessageId = "";
        v18.filteredForReceivers = v16.filteredForReceivers;
        v18:parseContentSentWeb(v16);
        return v18;
    else
        return nil;
    end;
end;
v9.newSendingId = function()
    return "sending-message-" .. l_MockId_0();
end;
v9.newSending = function(v19)
    assert(v19, "props argument is missing");
    assert(v19.id, "props.id argument is missing");
    assert(v19.messageType, "props.messageType argument is missing");
    assert(v19.order, "props.order argument is missing");
    assert(v19.conversationId, "props.conversationId argument is missing");
    assert(v19.sent, "props.sent argument is missing");
    local v20 = v9.new(v19);
    v20.senderTargetId = tostring(l_Players_0.LocalPlayer.UserId);
    v20.senderType = v9.SenderTypes.User;
    v20.moderated = false;
    v20.failed = false;
    return v20;
end;
v9.DoRequiredFieldsPresent = function(v21)
    return (((v21 and v21.id) and v21.messageType) and v21.senderTargetId) and v21.sent;
end;
v9.DoRequiredFieldsPresentForSent = function(v22)
    return ((v22 and v22.messageId) and v22.messageType) and v22.sent;
end;
v9.parseContentWeb = function(v23, v24)
    v23:parseContent(v24);
    if not (not (not (not (v24.messageType == v9.MessageTypes.Link) or not v24.link) and v24.link.type == v9.LinkTypes.Game) or not v24.link.game) then
        v23.gameLink = v8.new(v24.link.game.universeId);
    end;
end;
v9.parseContentSentWeb = function(v25, v26)
    v25:parseContent(v26);
    if v26.messageType == v9.MessageTypes.Link and v26.chatMessageLinkType == v9.LinkTypes.Game then
        v25.gameLink = v8.new(v26.universeId);
    end;
end;
v9.parseContent = function(v27, v28)
    v27.messageType = v28.messageType;
    if v28.messageType == v9.MessageTypes.PlainText then
        v27.content = v28.content;
        return ;
    else
        v27.content = nil;
        return ;
    end;
end;
v9.fromChannelsApi = function(v29, v30, v31)
    if v9.DoRequiredFieldsPresentFromChannelsApi(v29) then
        local v32 = v9.new();
        if not v6() then
            v32.id = v29.id;
            v32.senderTargetId = tostring(v29.sender_user_id);
            v32.senderType = v9.SenderTypes.User;
            v32.read = true;
            v32.sent = l_DateTime_0.fromIsoDate(v29.created_at);
            v32.conversationId = tostring(v30);
            v32.previousMessageId = v31;
            v32.filteredForReceivers = false;
            if v5() then
                v32.moderationType = v29.moderation_type;
            end;
            v32:parseContentFromChannelsApi(v29);
        else
            v32.id = v29.id;
            v32.read = true;
            v32.sent = l_DateTime_0.fromIsoDate(v29.created_at);
            v32.conversationId = tostring(v30);
            v32.previousMessageId = v31;
            v32.filteredForReceivers = false;
            v32.content = v29.content;
            if v29.type == v9.SenderTypes.User then
                v32:serializeForUserMessage(v29);
                return v32;
            elseif v29.type == v9.SenderTypes.System then
                v32:serializeForSystemMessage(v29);
                return v32;
            end;
        end;
        return v32;
    else
        return nil;
    end;
end;
v9.serializeForUserMessage = function(v33, v34)
    v33.senderTargetId = tostring(v34.sender_user_id);
    v33.senderType = v9.SenderTypes.User;
    if v5() then
        v33.moderationType = v34.moderation_type;
    end;
    v33.messageType = v9.MessageTypes.PlainText;
end;
v9.serializeForSystemMessage = function(v35, _)
    v35.senderType = v9.SenderTypes.System;
    v35.messageType = v9.MessageTypes.System;
end;
v9.DoRequiredFieldsPresentFromChannelsApi = function(v37)
    if not v6() then
        return ((v37 and v37.id) and v37.sender_user_id) and v37.created_at;
    elseif v37 then
        if v37.type == v9.SenderTypes.User then
            return (v37.id and v37.sender_user_id) and v37.created_at;
        elseif v37.type == v9.SenderTypes.System then
            return v37.id and v37.created_at;
        else
            return false;
        end;
    else
        return false;
    end;
end;
v9.parseContentFromChannelsApi = function(v38, v39)
    v38.messageType = v9.MessageTypes.PlainText;
    v38.content = v39.content;
end;
v9.fromSentChannelsApi = function(v40, v41)
    if v9.DoRequiredFieldsPresentForSentFromChannelsApi(v40) then
        local v42 = v9.new();
        v42.id = v40.messages[1].id;
        v42.senderTargetId = tostring(v40.messages[1].sender_user_id);
        v42.senderType = v9.SenderTypes.User;
        v42.read = true;
        v42.sent = l_DateTime_0.fromIsoDate(v40.messages[1].created_at);
        v42.conversationId = tostring(v41);
        v42.previousMessageId = "";
        if v5() then
            v42.moderationType = v40.messages[1].moderation_type;
        end;
        v42.filteredForReceivers = false;
        v42.messageType = v9.MessageTypes.PlainText;
        v42.content = v40.messages[1].content;
        return v42;
    else
        return nil;
    end;
end;
v9.DoRequiredFieldsPresentForSentFromChannelsApi = function(v43)
    local l_v43_0 = v43;
    if l_v43_0 then
        l_v43_0 = v43.messages;
        if l_v43_0 then
            l_v43_0 = false;
            if #v43.messages > 0 then
                l_v43_0 = v43.messages[1].id and v43.messages[1].created_at;
            end;
        end;
    end;
    return l_v43_0;
end;
return v9;
