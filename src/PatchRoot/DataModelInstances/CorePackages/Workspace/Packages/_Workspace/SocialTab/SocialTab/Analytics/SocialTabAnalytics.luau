local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_llama_0 = v2.llama;
local l_tutils_0 = v2.tutils;
local l_LocalizationService_0 = v2.LocalizationService;
local v6 = require(script.Parent.Logger);
local l_Sources_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums.Sources;
local v8 = {};
v8.__index = v8;
v8.DiagCounters = {
    UserLoadedPage = game:DefineFastString("SocialTabUserLoadedPageCounter", "SocialTabUserLoadedPage"), 
    UserLoadedSocialTab = game:DefineFastString("SocialTabUserLoadedCounter", "RoactChatUserLoaded")
};
v8.Navigation = {
    LoggedInUserIdentity = game:DefineFastString("SocialTabNavigationLoggedInUserIdentityCounter", "SocialTabNavigationLoggedInUserIdentity"), 
    Chats = game:DefineFastString("SocialTabNavigationChatsCounter", "SocialTabNavigationChats"), 
    Groups = game:DefineFastString("SocialTabNavigationGroupsCounter", "SocialTabNavigationGroups"), 
    AddFriends = game:DefineFastString("SocialTabNavigationAddFriendsCounter", "SocialTabNavigationAddFriends"), 
    FriendRequests = game:DefineFastString("SocialTabNavigationFriendRequestsCounter", "SocialTabNavigationFriendRequests"), 
    SearchFriends = game:DefineFastString("SocialTabNavigationSearchFriendsCounter", "SocialTabNavigationSearchFriends"), 
    Notifications = game:DefineFastString("SocialTabNavigationNotificationsCounter", "SocialTabNavigationNotifications"), 
    CarouselTitle = game:DefineFastString("SocialTabNavigationCarouselTitleCounter", "SocialTabNavigationCarouselTitle"), 
    FriendsLandingPage = game:DefineFastString("SocialTabNavigationFriendsLandingCounter", "SocialTabNavigationFriendsLanding"), 
    ViewUserProfile = game:DefineFastString("SocialTabLuaViewUserProfileCounter", "SocialTabLuaViewUserProfile")
};
v8.Navigation.LuaProfileTEMP = game:DefineFastString("SocialTabLuaProfileSelfCounter", "SocialTabLuaProfileSelf");
v8.new = function(v9, v10)
    assert(v10, "SocialTabAnalytics must be passed the ID of the local user");
    local v11 = {
        _diagImpl = v9.Diag, 
        _eventStreamImpl = v9.EventStream, 
        localUserId = v10
    };
    setmetatable(v11, v8);
    return v11;
end;
v8.navigate = function(v12, v13, _)
    v6:info("navigate to {}", v13);
    local v15 = v8.Navigation[v13];
    if not v15 then
        v6:error("Error from navigate: Invalid destination '{}'", v13);
        return ;
    else
        v12._diagImpl:reportCounter(v15, 1);
        return ;
    end;
end;
v8.buttonClick = function(v16, v17, v18)
    v6:info("eventName: buttonClick btn: {}{}", v17, v16:_toStringAdditionalArgs(v18));
    v16._eventStreamImpl:setRBXEventStream("SocialTab", "buttonClick", (l_llama_0.Dictionary.join(v18 or {}, {
        btn = v17, 
        uid = v16.localUserId
    })));
end;
v8._toStringAdditionalArgs = function(_, v20)
    if v20 then
        local v21, _ = string.gsub(" args: " .. l_tutils_0.toString(v20), "%s+", " ");
        return v21;
    else
        return "";
    end;
end;
v8.pageLoaded = function(v23)
    v6:info("pageLoaded");
    v23._diagImpl:reportCounter(v8.DiagCounters.UserLoadedPage, 1);
end;
v8.userLoadedSocialTab = function(v24)
    v24._eventStreamImpl:setRBXEventStream("roactChat", "userLoadedChat", {
        uid = v24.localUserId
    });
    v24._diagImpl:reportCounter(v8.DiagCounters.UserLoadedSocialTab, 1);
end;
v8.openPlayerSearch = function(v25)
    v25._eventStreamImpl:setRBXEventStream("players", "search", {
        act = "open", 
        source = l_Sources_0.SocialTab, 
        locale = l_LocalizationService_0.RobloxLocaleId
    });
end;
return v8;
