local v0 = require(script:FindFirstAncestor("AppChat").Parent.Cryo);
local v1 = {};
v1.__index = v1;
v1.DiagCounters = {
    FetchedOlderConversation = game:DefineFastString("RoactChatFetchedOlderConversationCounter", "RoactChatFetchedOlderConversation"), 
    LuaShareGameInputBarEntry = game:DefineFastString("LuaShareGameRoactChatInputBarEntryCounter", "LuaShareGameRoactChatInputBarEntry"), 
    LuaShareGameInputBarInvite = game:DefineFastString("LuaShareGameRoactChatInputBarInviteCounter", "LuaShareGameRoactChatInputBarInvite"), 
    UserLoadedChat = game:DefineFastString("RoactChatUserLoadedCounter", "RoactChatUserLoaded")
};
v1.DiagCounters.ChatDetailsProfile = game:DefineFastString("RoactChatNavigationChatDetailsProfileCounter", "RoactChatNavigationChatDetailsProfile");
v1.DiagCounters.ChatConversationProfile = game:DefineFastString("RoactChatNavigationChatConversationProfileCounter", "RoactChatNavigationChatConversationProfile");
v1.NavigationEvents = {
    ChatDetailsProfile = "ChatDetailsProfile", 
    ChatConversationProfile = "ChatConversationProfile"
};
local v2 = {
    [v1.NavigationEvents.ChatConversationProfile] = {
        subpage = "peekView", 
        page = "playerProfile", 
        btn = "chatIcon"
    }, 
    [v1.NavigationEvents.ChatDetailsProfile] = {
        subpage = "peekView", 
        page = "playerProfile", 
        btn = "chatDetailsMenu"
    }
};
v1.new = function(v3, v4)
    assert(v4, "RoactChatAnalytics must be passed the ID of the local user");
    local v5 = {
        _diagImpl = v3.Diag, 
        _eventStreamImpl = v3.EventStream, 
        hasAlreadyFetchedOlderConversations = false, 
        localUserId = v4
    };
    setmetatable(v5, v1);
    return v5;
end;
v1.withEventStream = function(v6, v7)
    v6._eventStreamImpl = v7;
    return v6;
end;
v1.withDiag = function(v8, v9)
    v8._diagImpl = v9;
    return v8;
end;
v1.userFetchedOlderConversations = function(v10)
    if not v10.hasAlreadyFetchedOlderConversations then
        v10.hasAlreadyFetchedOlderConversations = true;
        v10._eventStreamImpl:setRBXEventStream("roactChat", "userFetchedOlderConversations", {
            uid = v10.localUserId
        });
        v10._diagImpl:reportCounter(v1.DiagCounters.FetchedOlderConversation, 1);
        return ;
    else
        return ;
    end;
end;
v1.inputShareGameInviteSent = function(v11, v12, v13, v14, v15, v16)
    v11._eventStreamImpl:setRBXEventStream("touch", "inputShareGameInviteSent", {
        btn = "roactChatInputBar", 
        placeId = tostring(v12), 
        gameId = tostring(v13), 
        senderId = v14, 
        conversationId = tostring(v15), 
        participants = table.concat(v16, ",")
    });
    v11._diagImpl:reportCounter(v1.DiagCounters.LuaShareGameInputBarInvite, 1);
end;
v1.inputShareGameEntryPoint = function(v17, v18)
    v17._eventStreamImpl:setRBXEventStream("touch", "inputShareGameInviteSent", {
        btn = "roactChatInputBar", 
        uid = v17.localUserId, 
        cid = tostring(v18)
    });
    v17._diagImpl:reportCounter(v1.DiagCounters.LuaShareGameInputBarEntry, 1);
end;
v1.loadGameLinkCardInChat = function(v19, v20, v21)
    v19._eventStreamImpl:setRBXEventStream("roactChat", "loadGameLinkCardInChat", {
        uid = v19.localUserId, 
        cid = tostring(v20), 
        pid = tostring(v21)
    });
end;
v1.userLoadedChat = function(v22)
    v22._eventStreamImpl:setRBXEventStream("roactChat", "userLoadedChat", {
        uid = v22.localUserId
    });
    v22._diagImpl:reportCounter(v1.DiagCounters.UserLoadedChat, 1);
end;
v1.navigate = function(v23, v24)
    assert(v2[v24], "Invalid navigation option given");
    v23._diagImpl:reportCounter(v1.DiagCounters[v24], 1);
    v23._eventStreamImpl:setRBXEventStream("chat", "buttonClick", v0.Dictionary.join({
        uid = v23.localUserId
    }, v2[v24]));
end;
return v1;
