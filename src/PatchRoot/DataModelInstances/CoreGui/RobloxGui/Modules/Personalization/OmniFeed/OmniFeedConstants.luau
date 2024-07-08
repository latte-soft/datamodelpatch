local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.Personalization.Flags.GetFFlagLuaAppFullRefreshOmniRecOnGameExit);
local v3 = require(l_Modules_0.Personalization.Flags.GetFFlagLuaAppSortHideSeeAll);
local l_GetFFlagLuaAppUseTooltipsFromSort_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLuaAppUseTooltipsFromSort;
local l_FFlagLuaAppPlayButtonStyle_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppPlayButtonStyle;
local v6 = require(l_Modules_0.Personalization.Flags.FFlagLuaAppLinkSortTitle);
local v7 = require(l_Modules_0.Personalization.Flags.FFlagLuaAppCountdownSubtitle);
return {
    DataSource = {
        DiscoveryApi = "DiscoveryApi", 
        GamesApi = "GamesApi", 
        Local = "Local", 
        SearchApi = "SearchApi"
    }, 
    OmniResponseType = {
        Append = "Append", 
        PartialFeed = "PartialFeed"
    }, 
    EventContext = "HomeOmniFeed", 
    GameGridTopicIds = {
        RecommendedForYou = "100000000", 
        Continue = "100000003", 
        FriendActivity = "100000004", 
        Favorites = "100000001", 
        Sponsored = "400000000"
    }, 
    OmniSortRetrievalStatus = {
        Exception = "Exception", 
        Success = "Success"
    }, 
    GlobalLayoutDataKeys = {
        JYFRefresh = "JYFRefresh"
    }, 
    TopicLayoutDataKeys = {
        PYMKFindFriendsEnabled = "PYMKFindFriendsEnabled", 
        PYMKSeeAllEnabled = "PYMKSeeAllEnabled", 
        JYFFindFriendsEnabled = "JYFFindFriendsEnabled", 
        ComponentType = "componentType", 
        PlayerCountStyle = "playerCountStyle", 
        IsSponsoredFooterAllowed = "isSponsoredFooterAllowed", 
        LinkPath = if not v6 then nil else "linkPath", 
        HideSeeAll = if not v3() then nil else "hideSeeAll", 
        InfoText = if not l_GetFFlagLuaAppUseTooltipsFromSort_0() then nil else "infoText", 
        EndTimestamp = if not v7 then nil else "endTimestamp", 
        CountdownString = if not v7 then nil else "countdownString", 
        PlayButtonStyle = if not l_FFlagLuaAppPlayButtonStyle_0 then nil else "playButtonStyle"
    }, 
    ComponentTypeDataKeys = {
        EventTile = "EventTile", 
        GridTile = "GridTile", 
        AppGameTileNoMetadata = "AppGameTileNoMetadata"
    }, 
    ItemLayoutDataKeys = {
        Footer = "Footer"
    }, 
    OmniRecommendationsRequestIntent = {
        ManualRefresh = "manualRefresh", 
        AutoRefresh = "autoRefresh", 
        FriendPresenceChange = "friendPresenceChange", 
        LogIn = "logIn", 
        LoadMore = "loadMore", 
        GameExit = if not v2() then nil else "gameExit"
    }
};
