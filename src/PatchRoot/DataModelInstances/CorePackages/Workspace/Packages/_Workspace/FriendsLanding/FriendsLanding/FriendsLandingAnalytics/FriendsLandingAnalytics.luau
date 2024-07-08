local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.dependencies);
local v3 = require(l_script_FirstAncestor_0.EnumScreens);
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_llama_0 = v2.llama;
local l_tutils_0 = v2.tutils;
local l_LocalizationService_0 = v2.LocalizationService;
local v8 = require(script.Parent.ButtonClickEvents);
local v9 = require(script.Parent.ImpressionEvents);
local v10 = require(script.Parent.NavigatedFromPagesEnum);
local v11 = require(l_script_FirstAncestor_0.Enums.ShowMoreSectionTypeEnum);
local v12 = require(script.Parent.Logger);
local v13 = {};
v13.__index = v13;
v13.DiagCounters = {
    UserLoadedPage = game:DefineFastString("FriendsLandingUserLoadedPageCounter", "FriendsLandingUserLoadedPage"), 
    ShowMoreButtonPressedFriends = game:DefineFastString("ShowMoreButtonPressedFriends", "ShowMoreButtonPressedFriends"), 
    ShowMoreButtonPressedFriendRequests = game:DefineFastString("ShowMoreButtonPressedFriendRequests", "ShowMoreButtonPressedFriendRequests")
};
v13.Navigation = {
    [v3.AddFriends] = game:DefineFastString("FriendsLandingNavigationAddFriendsCounter", "FriendsLandingNavigationAddFriends"), 
    [v3.ViewUserProfile] = game:DefineFastString("FriendsLandingNavigationViewUserProfileCounter", "FriendsLandingNavigationViewUserProfile"), 
    [v3.GameDetailsPeekView] = game:DefineFastString("FriendsLandingNavigationGameDetailsPeekViewCounter", "FriendsLandingNavigationGameDetailsPeekView"), 
    [v3.SearchFriends] = game:DefineFastString("FriendsLandingSearchFriendsCounter", "FriendsLandingSearchFriends")
};
v13.Navigation[l_AppPage_0.Home] = game:DefineFastString("AddFriendsHomeEntryCounter", "AddFriendsHomeEntry");
v13.Navigation.ViewUserProfileAddFriends = game:DefineFastString("FriendsLandingViewUserProfileAddFriendsCounter", "FriendsLandingViewUserProfileAddFriends");
v13.Navigation.ConnectWithFriends = game:DefineFastString("AddFriendsConnectWithFriendsCounter", "AddFriendsConnectWithFriends");
v13.DiagStats = {
    LoadingPageTime = game:DefineFastString("FriendsLandingLoadingPageTimeStats", "FriendsLandingLoadingPageTime"), 
    MountingPageTime = game:DefineFastString("FriendsLandingMountingPageTimeStats", "FriendsLandingMountingPageTime")
};
v13.BASE_CONTEXT = "friendsLanding";
v13.new = function(v14, v15, v16)
    assert(v15, "FriendsLanding must be passed the ID of the local user");
    local v17 = {
        _diagImpl = v14.Diag, 
        _eventStreamImpl = v14.EventStream, 
        localUserId = v15, 
        _getLoadingTimeInfo = v16, 
        _reportedPagePerformanceOnce = {}
    };
    setmetatable(v17, v13);
    return v17;
end;
v13.navigate = function(v18, v19)
    v12:info("navigate to {}", v19);
    local v20 = v13.Navigation[v19];
    if not v20 then
        v12:error("Error from navigate: Invalid destination '{}'", v19);
        return ;
    else
        v18._diagImpl:reportCounter(v20, 1);
        return ;
    end;
end;
v13.buttonClick = function(v21, v22, v23)
    assert(v8.isEnumValue(v22), "invalid button name used");
    v12:info("eventName: buttonClick btn: {}{}", v22, v21:_toStringAdditionalArgs(v23));
    local l_BASE_CONTEXT_0 = v21.BASE_CONTEXT;
    if not (not v23 or not v23.contextOverride) then
        l_BASE_CONTEXT_0 = v23.contextOverride;
    end;
    v23 = l_llama_0.Dictionary.join(v23 or {}, {
        btn = v22:rawValue(), 
        uid = v21.localUserId, 
        contextOverride = l_llama_0.None
    });
    v21._eventStreamImpl:setRBXEventStream(l_BASE_CONTEXT_0, "buttonClick", v23);
    local v25 = nil;
    if v22 == v8.LoadMoreUsers then
        if v23.sectionType == v11.FriendRequests then
            v25 = v13.DiagCounters.ShowMoreButtonPressedFriendRequests;
        elseif v23.sectionType == v11.Friends then
            v25 = v13.DiagCounters.ShowMoreButtonPressedFriends;
        end;
    end;
    if v25 then
        v21._diagImpl:reportCounter(v25, 1);
    end;
end;
v13.playerSearch = function(v26, v27, v28, v29)
    assert(type(v27) == "string", "Expected act to be a string");
    if v28 then
        assert(type(v28) == "string", "Expected keyword to be a string");
    end;
    if v29 then
        assert(type(v29) == "string", "Expected source to be a string");
    end;
    v12:info("eventName: search ctx: players keyword: {} source: {}", v28, v29);
    v26._eventStreamImpl:setRBXEventStream("players", "search", {
        act = v27, 
        kwd = v28, 
        source = v29, 
        locale = l_LocalizationService_0.RobloxLocaleId
    });
end;
v13._toStringAdditionalArgs = function(_, v31)
    if v31 then
        local v32, _ = string.gsub(" args: " .. l_tutils_0.toString(v31), "%s+", " ");
        return v32;
    else
        return "";
    end;
end;
v13.pageLoaded = function(v34)
    v12:info("pageLoaded");
    v34._diagImpl:reportCounter(v13.DiagCounters.UserLoadedPage, 1);
end;
v13.pageLoadedWithArgs = function(v35, v36, v37)
    v12:info("pageLoaded" .. v36 or v35.BASE_CONTEXT);
    v35._eventStreamImpl:setRBXEventStream(v36 or v35.BASE_CONTEXT, "luaPageLoad", v37);
end;
v13._pagePerformanceReport = function(v38, v39, v40, v41)
    local v42 = v41 or os.clock();
    local v43 = not not v38._getLoadingTimeInfo and v38._getLoadingTimeInfo() or {};
    local l_startPage_0 = v43.startPage;
    local l_startTime_0 = v43.startTime;
    if not v10.fromRawValue(l_startPage_0) or type(l_startTime_0) ~= "number" then
        v12:warning("Cannot report loading time: incorrect startPage or startTime");
        return ;
    else
        local v46 = (v42 - l_startTime_0) * 1000;
        local v47 = v10[l_startPage_0].rawValue();
        local v48 = v39 .. "_" .. v47;
        local v49 = {
            startPage = v47, 
            loadingTime = v46, 
            uid = v38.localUserId
        };
        v12:info("pageLoaded in " .. v46 .. "ms");
        v38._diagImpl:reportStats(v48, v46);
        v38._eventStreamImpl:setRBXEventStream(v38.BASE_CONTEXT, v40, v49);
        return ;
    end;
end;
v13._reportPagePerformanceOnceCheck = function(v50, v51)
    if not v50._reportedPagePerformanceOnce[v51] then
        v50._reportedPagePerformanceOnce[v51] = true;
        return false;
    else
        return true;
    end;
end;
v13.pageMountingTimeReport = function(v52, v53)
    if not v52:_reportPagePerformanceOnceCheck("pageMountingTime") then
        v52:_pagePerformanceReport(v13.DiagStats.MountingPageTime, "pageMountingTime", v53);
        return ;
    else
        return ;
    end;
end;
v13.pageLoadingTimeReport = function(v54, v55)
    if not v54:_reportPagePerformanceOnceCheck("pageLoadingTime") then
        v54:_pagePerformanceReport(v13.DiagStats.LoadingPageTime, "pageLoadingTime", v55);
        return ;
    else
        return ;
    end;
end;
v13.reportAddFriendsEntrypoint = function(v56, v57, v58)
    assert(v13.Navigation[v57] ~= nil, "invalid screen");
    if v57 == l_AppPage_0.Home then
        v56._eventStreamImpl:setRBXEventStream("addUniversalFriends", "buttonClick", {
            btn = "LegacyAddFriendsButton", 
            absolutePosition = 1, 
            showContactImporterModal = if not v58 then nil else v58.showContactImporterModal
        });
    end;
    v56._diagImpl:reportCounter(v13.Navigation[v57], 1);
end;
v13.impressionEvent = function(v59, v60, v61)
    assert(v9.isEnumValue(v60), "invalid impression name used");
    v59._eventStreamImpl:setRBXEventStream("addUniversalFriends", v60:rawValue(), v61);
    v59._diagImpl:reportCounter(v60:rawValue(), 1);
end;
return v13;
