local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Immutable_0 = require(l_Parent_0.AppCommonLib).Immutable;
local v3 = require(script.Parent.SendMessagePolicy);
local v4 = require(l_script_FirstAncestor_0.Models.MessageModel);
local l_DateTime_0 = require(l_Parent_0.Time).DateTime;
local v6 = require(l_script_FirstAncestor_0.Conversations.Thunks.ReceivedChatResponse);
local v7 = require(l_script_FirstAncestor_0.Conversations.Actions.SendingMessage);
local v8 = require(l_script_FirstAncestor_0.Conversations.Actions.SentMessage);
local l_StatusCodes_0 = require(l_Parent_0.Http).StatusCodes;
local v10 = require(l_script_FirstAncestor_0.Conversations.Actions.MessageFailedToSend);
local v11 = require(l_script_FirstAncestor_0.Conversations.Actions.MessageModerated);
local v12 = require(l_script_FirstAncestor_0.Flags.isAppChatChannelsAPIEnabled);
local l_ResponseStatus_0 = require(l_Parent_0.AppChatNetworking).Constants.ResponseStatus;
local v14 = require(l_script_FirstAncestor_0.Actions.NavigateIntoChat);
local v15 = require(l_script_FirstAncestor_0.Conversations.Actions.ReceivedChannelsMigrationConflict);
local v16 = require(l_script_FirstAncestor_0.EnumScreens);
local v17 = 0;
local v18 = require(l_script_FirstAncestor_0.Logger):new(script.Name);
local function _()
    v17 = v17 + 1;
    return v17;
end;
local v20 = setmetatable({}, v3);
v20.__index = v20;
v20.new = function(v21, v22)
    return (setmetatable({
        messageSendingId = v4.newSendingId(), 
        conversationId = v22
    }, v21));
end;
local function v28(v23)
    local v24 = v23.messages:Last();
    local v25 = v23.sendingMessages:Last();
    local v26 = nil;
    if v24 then
        v26 = v24.sent:GetUnixTimestamp();
    end;
    if v25 then
        local l_UnixTimestamp_0 = v25.sent:GetUnixTimestamp();
        v26 = not not v26 and math.max(v26, l_UnixTimestamp_0) or l_UnixTimestamp_0;
    end;
    return not not v26 and l_DateTime_0.fromUnixTimestamp(v26 + 0.001) or l_DateTime_0.now();
end;
v20.onBeforeSendingMessage = function(v29, v30)
    v18:trace("onBeforeSendingMessage conversationId: {} messageSendingId: {}", v29.conversationId, v29.messageSendingId);
    local v31 = v30:getState().ChatAppReducer.Conversations[v29.conversationId];
    local l_newSending_0 = v4.newSending;
    local l_JoinDictionaries_0 = l_Immutable_0.JoinDictionaries;
    local v34 = {
        id = v29.messageSendingId
    };
    v17 = v17 + 1;
    v34.order = v17;
    v34.conversationId = v29.conversationId;
    v34.sent = v28(v31);
    l_newSending_0 = l_newSending_0(l_JoinDictionaries_0(v34, v29:sendingMessagePayload()));
    assert(l_newSending_0, "Failed to create sending message placeholder");
    v30:dispatch(v7(v29.conversationId, l_newSending_0));
end;
v20.sendingMessagePayload = function(_)
    error("Override me");
end;
v20.onSuccess = function(v36, v37, v38)
    v18:debug("Message sent successfully. conversationId: {} messageSendingId: {}", v36.conversationId, v36.messageSendingId);
    v37:dispatch(v8(v36.conversationId, v36.messageSendingId));
    v37:dispatch(v6(v36.conversationId, v38.responseBody));
    return v38;
end;
v20.onFailure = function(v39, v40, v41)
    v18:error("Failed to send message. conversationId: {}, messageSendingId: {}, responseCode: {}", v39.conversationId, v39.messageSendingId, v41.responseCode);
    if not v12() then
        if not (not v41 or not v41.responseBody) and v41.responseBody.resultType == "Moderated" then
            v40:dispatch(v11(v39.conversationId, v39.messageSendingId));
            warn("Message was moderated. ");
            return v41;
        else
            v40:dispatch(v10(v39.conversationId, v39.messageSendingId));
            warn("Message could not be sent. ");
            return v41;
        end;
    elseif ((not (v41 and v41.responseCode == l_StatusCodes_0.OK) or not v41.responseBody) or not v41.responseBody.messages) or #v41.responseBody.messages == 0 then
        if v41.responseCode == l_StatusCodes_0.CONFLICT then
            v18:error("Message sent conflicting system (409). Reloading messages...");
            v40:dispatch(v15());
            v40:dispatch(v14({
                screen = v16.ChatLanding, 
                params = {
                    key = tostring(os.clock())
                }
            }));
            return v41;
        else
            v40:dispatch(v10(v39.conversationId, v39.messageSendingId));
            v18:error("Message could not be sent, no response body or no messages in response body");
            return v41;
        end;
    elseif v41.responseBody.messages[1].status and v41.responseBody.messages[1].status == l_ResponseStatus_0.MODERATED then
        v40:dispatch(v11(v39.conversationId, v39.messageSendingId));
        v18:error("Message was moderated.");
        return v41;
    else
        v40:dispatch(v10(v39.conversationId, v39.messageSendingId));
        v18:error(("Message could not be sent, statusCode: %*, "):format(v41.responseCode), (("message status: %*"):format(not not v41.responseBody.messages[1] and v41.responseBody.messages[1].status or "nil")));
        return v41;
    end;
end;
return v20;
