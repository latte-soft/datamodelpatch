local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local v1 = require(l_script_FirstAncestor_0.Parent.Cryo);
local l_Conversation_0 = require(l_script_FirstAncestor_0.SocialLibraries).Conversation;
local l_getConversationDisplayTitle_0 = l_Conversation_0.getConversationDisplayTitle;
local l_getOtherParticipant_0 = l_Conversation_0.getOtherParticipant;
local l_getConversationGameId_0 = l_Conversation_0.getConversationGameId;
local v6 = require(script.Parent.populateUserIdsWithState);
local v7 = require(l_script_FirstAncestor_0.Users.getThumbnailsForUserIds);
local v8 = require(script.Parent.getLastMessageContent);
local v9 = require(l_script_FirstAncestor_0.Http.RoduxPresence);
local v10 = require(l_script_FirstAncestor_0.Users.userPresenceUtils);
local v11 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableUnfilteredThreadsUI);
return function(v12, v13)
    local v14 = v13.participants or {};
    local v16 = v1.List.filter(v14, function(v15)
        return v15 ~= v12.LocalUserId;
    end);
    local v17 = nil;
    if v13.conversationType == "OneToOneConversation" then
        v17 = v10.getUserDisplayPresence((v9.Selectors.getUserPresenceByUserId(v12, (l_getOtherParticipant_0(v12, v13.participants)))));
    end;
    local v18 = {};
    local l_Users_0 = v12.Users;
    for _, v21 in pairs(v14) do
        v18[v21] = l_Users_0[v21];
    end;
    return v1.Dictionary.join({
        id = v13.id, 
        title = l_getConversationDisplayTitle_0(v13), 
        participants = v6(v12, v14), 
        otherParticipants = v16, 
        isDefaultTitle = v13.isDefaultTitle, 
        lastMessageContent = v8(v13) or "", 
        hasUnreadMessages = v13.hasUnreadMessages or false, 
        thumbnails = v7(v16), 
        presenceText = v17 and v17.text, 
        presenceImage = v17 and v17.image, 
        gameId = l_getConversationGameId_0(v13, v12.LocalUserId, v18), 
        serverState = v13.serverState, 
        moderationType = if not v11() then nil else v13.moderationType, 
        userPendingStatus = if not v11() then nil else v13.userPendingStatus, 
        participantMetadata = if not v11() then nil else v13.participantMetadata, 
        conversationType = if not v11() then nil else v13.conversationType
    }, {
        shortRelativeTime = v13.lastUpdated and v13.lastUpdated:GetShortRelativeTime(), 
        longRelativeTime = v13.lastUpdated and v13.lastUpdated:GetLongRelativeTime(), 
        unixTime = v13.lastUpdated and v13.lastUpdated:GetUnixTimestamp()
    });
end;
