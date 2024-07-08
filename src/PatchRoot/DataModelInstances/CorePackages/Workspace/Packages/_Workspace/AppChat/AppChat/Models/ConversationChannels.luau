local l_Players_0 = game:GetService("Players");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.AppChatNetworking);
local v4 = require(l_Parent_0.Cryo);
local l_OrderedMap_0 = require(l_Parent_0.AppCommonLib).OrderedMap;
local v6 = require(l_script_FirstAncestor_0.Constants);
local v7 = require(script.Parent.Conversation);
local l_DateTime_0 = require(l_Parent_0.Time).DateTime;
local v9 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableUnfilteredThreadsUI);
local v10 = require(l_script_FirstAncestor_0.Flags.isAppChatFriendsSourceEnabled);
local function v12(v11)
    return v11.id;
end;
local function v15(v13, v14)
    return v13.sent:GetUnixTimestamp() < v14.sent:GetUnixTimestamp();
end;
local function v18(v16, v17)
    return v16.order < v17.order;
end;
local function _(v19, v20)
    if v20 == "friends" then
        return v7.Type.ONE_TO_ONE_CONVERSATION;
    elseif v19 == "group" then
        return v7.Type.MULTI_USER_CONVERSATION;
    elseif v19 == "one_to_one" then
        return v7.Type.ONE_TO_ONE_CONVERSATION;
    else
        return v7.Type.ONE_TO_ONE_CONVERSATION;
    end;
end;
local function v26(v22)
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    if l_LocalPlayer_0 then
        for _, v25 in v22.participant_user_ids, nil, nil do
            if tostring(v25) ~= tostring(l_LocalPlayer_0.UserId) then
                return "friends:" .. tostring(v25);
            end;
        end;
    end;
    return "friends:unknown-id";
end;
local v27 = {
    ModerationType = {
        TrustedComms = "trusted_comms", 
        Moderated = "moderated", 
        Invalid = "invalid", 
        UnknownType = "unknown_type"
    }, 
    UserPendingStatus = {
        Invalid = "invalid", 
        Pending = "pending", 
        NotPending = "not_pending"
    }
};
v27.mockBase = function()
    return {
        source = "channels", 
        type = "one_to_one", 
        messages = l_OrderedMap_0.new(v12, v15), 
        sendingMessages = l_OrderedMap_0.new(v12, v18), 
        id = "1-2-3", 
        clientId = "1-2-3", 
        initiator = "1", 
        hasUnreadMessages = false, 
        conversationType = v7.Type.ONE_TO_ONE_CONVERSATION, 
        usersTyping = {}, 
        isUserLeaving = false, 
        fetchingOlderMessages = false, 
        serverState = v6.ServerState.CREATED, 
        pinnedGame = {}, 
        moderationType = v27.ModerationType.TrustedComms, 
        userPendingStatus = v27.UserPendingStatus.NotPending, 
        lastUpdated = l_DateTime_0.now(), 
        title = "test", 
        titleForViewer = "test", 
        isDefaultTitle = false, 
        participants = {
            "1"
        }, 
        participantMetadata = {
            ["1"] = {
                isPending = false
            }
        }
    };
end;
v27.mock = function(v28)
    return v4.Dictionary.join(v27.mockBase(), v28 or {});
end;
v27.response = function(v29)
    return {
        source = not v29.source and "channels" or v29.source, 
        type = not v29.type and "one_to_one" or v29.type, 
        created_at = not v29.created_at and "2021-01-01T00:00:00Z" or v29.created_at, 
        created_by = not v29.created_by and 1 or v29.created_by, 
        id = not v29.id and "1-2-3" or v29.id, 
        name = not v29.name and "test" or v29.name, 
        participant_user_ids = if not v29.participant_user_ids then {
            1
        } else v29.participant_user_ids, 
        unread_message_count = not v29.unread_message_count and 0 or v29.unread_message_count, 
        updated_at = not v29.updated_at and "2021-01-01T00:00:00Z" or v29.updated_at, 
        messages = if not v29.messages then {} else v29.messages, 
        moderation_type = not v29.moderation_type and "trusted_comms" or v29.moderation_type, 
        user_pending_status = not v29.user_pending_status and "not_pending" or v29.user_pending_status, 
        success = if not v29.success then nil else v29.success
    };
end;
v27.fromChannelsApi = function(v30)
    local v31 = {
        source = v30.source, 
        type = v30.type, 
        createdAt = v30.created_at, 
        messages = l_OrderedMap_0.new(v12, v15), 
        sendingMessages = l_OrderedMap_0.new(v12, v18), 
        id = if not v10() then if v30.source == "friend" then v26(v30) else tostring(v30.id) else if v30.source == "friends" then v26(v30) else tostring(v30.id), 
        clientId = "", 
        initiator = tostring(v30.created_by), 
        hasUnreadMessages = v30.unread_message_count > 0
    };
    local l_type_0 = v30.type;
    v31.conversationType = if v30.source == "friends" then v7.Type.ONE_TO_ONE_CONVERSATION else if l_type_0 == "group" then v7.Type.MULTI_USER_CONVERSATION else if l_type_0 == "one_to_one" then v7.Type.ONE_TO_ONE_CONVERSATION else v7.Type.ONE_TO_ONE_CONVERSATION;
    v31.usersTyping = {};
    v31.isUserLeaving = false;
    v31.fetchingOlderMessages = false;
    v31.serverState = if not not v10() and v30.source == "friends" then v6.ServerState.NONE else v6.ServerState.CREATED;
    v31.pinnedGame = {};
    v31.moderationType = if not v9() then nil else v30.moderation_type;
    v31.userPendingStatus = if not v9() then nil else v30.user_pending_status;
    v31.lastUpdated = l_DateTime_0.fromIsoDate(v30.updated_at);
    v31.title = v30.name;
    v31.titleForViewer = "";
    v31.isDefaultTitle = v30.name == nil;
    v31.participants = {};
    if v30.participant_user_ids then
        for _, v34 in v30.participant_user_ids, nil, nil do
            table.insert(v31.participants, (tostring(v34)));
        end;
    end;
    v31.participantMetadata = if not v9() then nil else {};
    return v31;
end;
v27.getFriendConversationId = function(v35)
    return (v26({
        participant_user_ids = v35
    }));
end;
return v27;
