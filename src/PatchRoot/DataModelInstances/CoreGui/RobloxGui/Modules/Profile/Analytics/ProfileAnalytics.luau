local l_script_FirstAncestor_0 = script:FindFirstAncestor("Profile");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_Logger_0 = v2.Logger;
local l_AnalyticsService_0 = v2.AnalyticsService;
local l_Dash_0 = v2.Dash;
local l_PresenceType_0 = v2.RoduxPresence.Enums.PresenceType;
local l_SetGamePlaySession_0 = v2.SetGamePlaySession;
local v8 = require(l_script_FirstAncestor_0.Common.ContextualMenuRowsEnums);
local _ = require(l_script_FirstAncestor_0.Common.ProfileTypes);
local v10 = require(l_script_FirstAncestor_0.Components.ProfilePrimaryContextualButton.ButtonStates);
local _ = require(l_script_FirstAncestor_0.Common.ContextPropsTypes);
local l_FFlagLuaAppConsolidateProfileLogging_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppConsolidateProfileLogging;
local v13 = require(script.Parent.EntryPoints);
local v14 = require(script.Parent.ButtonClickEvents);
local v15 = require(script.Parent.DiagCounters);
local v16 = {
    [l_PresenceType_0.InGame] = "inGame", 
    [l_PresenceType_0.InStudio] = "inStudio", 
    [l_PresenceType_0.Offline] = "offline", 
    [l_PresenceType_0.Online] = "online"
};
local v17 = {
    NotFriends = "nonfriend", 
    Friends = "friend", 
    RequestSent = "requestSent", 
    RequestReceived = "requestReceived", 
    Ineligible = "ineligible"
};
local v18 = {
    [v13.HomePageSelf] = {
        ctx = "homepage", 
        btn = "loggedInUserIdentity"
    }, 
    [v13.MorePageSelf] = {
        ctx = "morepage", 
        btn = "playerProfile"
    }, 
    [v13.HomePageFriendsCarousel] = {
        ctx = "homepage", 
        btn = "playerProfile"
    }, 
    [v13.GameDetailsDeveloper] = {
        ctx = "gameDetails", 
        btn = "developer"
    }, 
    [v13.PlayerSearch] = {
        ctx = "playerSearch", 
        btn = "playerProfile"
    }
};
local v19 = {
    [v14.Friends] = {
        btn = v14.Friends.rawValue()
    }, 
    [v14.Followers] = {
        btn = v14.Followers.rawValue()
    }, 
    [v14.Following] = {
        btn = v14.Following.rawValue()
    }, 
    [v14.ViewPlayerProfile] = {
        btn = v14.ViewPlayerProfile.rawValue()
    }, 
    [v14.ContextualMenu] = {
        btn = v14.ContextualMenu.rawValue()
    }, 
    [v14.GameDetails] = {
        btn = v14.GameDetails.rawValue()
    }, 
    [v14.PurchaseGame] = {
        btn = v14.PurchaseGame.rawValue()
    }
};
local v20 = {
    [v8.CHAT] = {
        btn = v8.CHAT.rawValue()
    }, 
    [v8.IGNORE_FRIEND_REQUEST] = {
        btn = v8.IGNORE_FRIEND_REQUEST.rawValue()
    }, 
    [v8.REPORT] = {
        btn = v8.REPORT.rawValue()
    }, 
    [v8.BLOCK] = {
        btn = v8.BLOCK.rawValue()
    }, 
    [v8.UNFRIEND] = {
        btn = v8.UNFRIEND.rawValue()
    }, 
    [v8.SET_ALIAS] = {
        btn = v8.SET_ALIAS.rawValue()
    }
};
local v21 = {
    [v10.JoinExperience] = {
        eventType = "joinGameInPeopleList", 
        btn = "joinExperience"
    }, 
    [v10.Chat] = {
        btn = "chatAttempt"
    }, 
    [v10.EditProfile] = {
        btn = "editProfile"
    }, 
    [v10.Unfriend] = {
        btn = "unFriend"
    }, 
    [v10.Unblock] = {
        btn = "unblock"
    }, 
    [v10.AddFriend] = {
        btn = "addFriend"
    }, 
    [v10.AcceptFriendRequest] = {
        btn = "acceptFriend"
    }, 
    [v10.ShareProfileQRCode] = {
        btn = "shareProfileQRCode"
    }
};
local v22 = {};
v22.__index = v22;
v22.new = function(v23)
    local v24 = {
        _diagImpl = not not v23.analytics and v23.analytics.Diag or l_AnalyticsService_0.Diag, 
        _eventStreamImpl = not not v23.analytics and v23.analytics.EventStream or l_AnalyticsService_0.EventStream, 
        _eventIngestService = v23.eventIngestService, 
        _sessionService = v23.sessionService, 
        _sessionType = v23.sessionType, 
        localUserId = v23.localUserId, 
        logger = v23.logger or l_Logger_0, 
        profileUserId = v23.profileUserId, 
        analyticsProps = v23.analyticsProps or {}
    };
    setmetatable(v24, v22);
    return v24;
end;
v22.pageLoaded = function(v25)
    v25.logger:info("ProfilePeekView pageLoaded");
    v25._diagImpl:reportCounter(v15.UserLoadedPage, 1);
end;
v22.pageLoadedWithData = function(v26, v27)
    local v28 = v17[v27.friendStatus] or v17.NotFriends;
    local v29 = l_PresenceType_0.fromRawValue(v27.playerPresence) or l_PresenceType_0.Offline;
    v26.logger:info("ProfilePeekView pageLoadedWithData");
    v26._diagImpl:reportCounter(v15.UserLoadedPageWithData, 1);
    v26._eventStreamImpl:setRBXEventStream("playerProfile", "luaPageLoad", l_Dash_0.join(v27, v26.analyticsProps, {
        page = "playerProfile", 
        subpage = "peekView", 
        friendStatus = v26.localUserId == v26.profileUserId and "self" or v28, 
        profileUserId = v26.profileUserId, 
        playerPresence = v16[v29], 
        uid = v26.localUserId
    }));
end;
v22.joinExperience = function(v30, v31)
    assert(v30._eventIngestService, "Need to pass in EventIngestService");
    assert(v30._sessionService, "Need to pass in SessionService");
    assert(v30._sessionType, "Need to pass in SessionType");
    if v31.isHomePageCarousel then
        l_SetGamePlaySession_0(v30._sessionService, v30._sessionType.StructuralIdentifier.GamePlayFromFriendsList, true);
    end;
    v30._eventIngestService:setRBXEventStream("playerProfile", v21[v10.JoinExperience].eventType, l_Dash_0.join(v31, v30.analyticsProps, {
        btn = v21[v10.JoinExperience].btn, 
        subpage = "peekView", 
        profileUserId = v30.profileUserId, 
        uid = v30.localUserId, 
        isHomePageCarousel = v31.isHomePageCarousel or false, 
        joinAttemptId = v31.joinAttemptId
    }));
    v30._diagImpl:reportCounter(v15[v10.JoinExperience], 1);
end;
v22.navigateToProfile = function(v32, v33)
    if l_FFlagLuaAppConsolidateProfileLogging_0 then
        assert(false, "navigateToProfile is deprecated with FFlagLuaAppConsolidateProfileLogging");
    end;
    assert(v13.isEnumValue(v33), "Invalid EntryPoints Enum value passed");
    v32:_buttonClick(l_Dash_0.join({
        page = "playerProfile"
    }, v18[v33]), v33);
end;
v22.buttonClick = function(v34, v35, v36)
    assert(v14.isEnumValue(v35), "Invalid ButtonClickEvent Enum value passed");
    v34:_buttonClick(l_Dash_0.join(v19[v35], v36), v35);
end;
v22.contextualMenuClick = function(v37, v38)
    assert(v8.isEnumValue(v38), "Invalid ContextualMenuRowsEnums Enum value passed");
    v37:_buttonClick({
        btn = "contextualMenu_" .. v20[v38].btn, 
        optionType = "CTAType"
    }, v38);
end;
v22.primaryCTAClick = function(v39, v40, v41)
    v39:_buttonClick(l_Dash_0.join(v21[v40] or {
        btn = v40
    }, v41), v40);
end;
v22.viewCatalogItem = function(v42)
    v42._diagImpl:reportCounter(v15[v14.ViewCatalogItem], 1);
end;
v22._buttonClick = function(v43, v44, v45)
    if v15[v45] then
        v43._diagImpl:reportCounter(v15[v45], 1);
    end;
    v43._eventStreamImpl:setRBXEventStream(v44.ctx or "playerProfile", v44.eventType or "buttonClick", l_Dash_0.join(v44, v43.analyticsProps, {
        uid = v43.localUserId, 
        profileUserId = v43.profileUserId, 
        subpage = "peekView", 
        ctx = l_Dash_0.None, 
        eventType = l_Dash_0.None
    }));
end;
return v22;
