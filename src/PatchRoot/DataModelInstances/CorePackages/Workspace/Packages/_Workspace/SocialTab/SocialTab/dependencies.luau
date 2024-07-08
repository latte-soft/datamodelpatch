local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuaSocialLibrariesDeps);
local v3 = require(l_Parent_1.Lumberyak);
local v4 = v3.Logger.new(nil, "SocialTab");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_GetFFlagHideConnectPageWebViewItemsForVR_0 = require(l_Parent_1.SharedFlags).GetFFlagHideConnectPageWebViewItemsForVR;
local l_GetFStringNotificationsStreamNotificationUXLayer_0 = require(l_Parent_1.SharedFlags).GetFStringNotificationsStreamNotificationUXLayer;
local l_GetFFlagLuaAppNewStreamNotificationsEnabled_0 = require(l_Parent_1.SharedFlags).GetFFlagLuaAppNewStreamNotificationsEnabled;
local v9 = require(l_Parent_1.StreamNotifications);
local v10 = game:DefineFastInt("SocialTabHttpRetryCount", 3);
local l_httpRequest_0 = v2.httpRequest;
local v12 = v4:new("SocialTab Networking");
local v18 = l_httpRequest_0.config({
    requestFunction = function(v13, v14, v15)
        v12:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", v14, v13));
        return l_httpRequest_0.requestFunctions.HttpRbxApi(v13, v14, v15);
    end, 
    postRequestFunction = function(v16, v17)
        v12:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s, body = %s ]", v17.requestMethod, v17.url, v16.StatusCode, v16.Body));
    end, 
    maxRetryCount = v10
});
local v19 = require(l_Parent_0.Flags.getFFlagSocialTabReplaceRefreshConversations);
local v20 = v2.RoduxNetworking.config({
    keyPath = "SocialTab.NetworkStatus", 
    networkImpl = v18
});
return {
    LocalizationService = l_LocalizationService_0, 
    Promise = require(l_Parent_1.Promise), 
    llama = v2.llama, 
    FitFrame = require(l_Parent_1.FitFrame), 
    Otter = require(l_Parent_1.Otter), 
    Roact = require(l_Parent_1.Roact), 
    React = require(l_Parent_1.React), 
    Rodux = require(l_Parent_1.Rodux), 
    Cryo = require(l_Parent_1.Cryo), 
    RetrievalStatus = require(l_Parent_1.Http).Enum.RetrievalStatus, 
    RoactNavigation = require(l_Parent_1.RoactNavigation), 
    RoactAppExperiment = require(l_Parent_1.RoactAppExperiment), 
    RoactRodux = require(l_Parent_1.RoactRodux), 
    ExternalEventConnection = require(l_Parent_1.RoactUtils).ExternalEventConnection, 
    Logger = v4, 
    t = require(l_Parent_1.t), 
    Text = require(l_Parent_1.AppCommonLib).Text, 
    UIBlox = require(l_Parent_1.UIBlox), 
    withLocalization = require(l_Parent_1.Localization).withLocalization, 
    useDispatch = require(l_Parent_1.RoactUtils).Hooks.RoactRodux.useDispatch, 
    useLocalization = require(l_Parent_1.Localization).Hooks.useLocalization, 
    useSelector = require(l_Parent_1.RoactUtils).Hooks.RoactRodux.useSelector, 
    memoize = require(l_Parent_1.AppCommonLib).memoize, 
    enumerate = require(l_Parent_1.enumerate), 
    LocalizationProvider = require(l_Parent_1.Localization).LocalizationProvider, 
    Url = require(l_Parent_1.Http).Url, 
    VerifiedBadges = require(l_Parent_1.VerifiedBadges), 
    DiscoverabilityModal = require(l_Parent_1.DiscoverabilityModal), 
    ShowContactImporterParams = require(l_Parent_1.ContactImporter).ShowContactImporterParams, 
    SocialCommon = require(l_Parent_1.SocialCommon), 
    UniversalAppPolicy = require(l_Parent_1.UniversalAppPolicy).UniversalAppPolicy, 
    UiModeStyleProvider = require(l_Parent_1.Style).UiModeStyleProvider, 
    Mock = v2.Mock, 
    tutils = require(l_Parent_1.tutils), 
    AnalyticsService = require(l_Parent_1.Analytics).Analytics.new(game:GetService("RbxAnalyticsService")), 
    NetworkingPresence = v2.NetworkingPresence.config({
        roduxNetworking = v20
    }), 
    NetworkingFriends = v2.NetworkingFriends.config({
        roduxNetworking = v20
    }), 
    NetworkingUsers = v2.NetworkingUsers.config({
        roduxNetworking = v20
    }), 
    NetworkingGames = v2.NetworkingGames.config({
        roduxNetworking = v20
    }) or nil, 
    Players = game:GetService("Players"), 
    RoduxNetworking = v20, 
    RoduxUsers = v2.RoduxUsers.config({
        keyPath = "SocialTab.Users"
    }), 
    RoduxFriends = v2.RoduxFriends.config({
        keyPath = "SocialTab.Friends"
    }), 
    RoduxPresence = v2.RoduxPresence.config({
        keyPath = "SocialTab.Presence"
    }), 
    RoduxGames = v2.RoduxGames.config({
        keyPath = "SocialTab.Games"
    }), 
    NetworkingChat = not not v19() and v2.NetworkingChat.config({
        roduxNetworking = v20
    }) or nil, 
    CollisionMatchers = v2.CollisionMatchers, 
    Lumberyak = v3, 
    RunService = game:GetService("RunService"), 
    validatePropsWithForwardRef = require(l_Parent_1.RoactUtils).validatePropsWithForwardRef, 
    InvisibleMode = require(l_Parent_1.InvisibleMode), 
    SocialLibraries = v2.SocialLibraries.config({}), 
    GetFFlagHideConnectPageWebViewItemsForVR = l_GetFFlagHideConnectPageWebViewItemsForVR_0, 
    SelfViewProfileDiscoverabilityUpsellIXP = require(l_Parent_1.DiscoverabilityModal).Flags.SelfViewProfileDiscoverabilityUpsellIXP, 
    UserLib = require(l_Parent_1.UserLib), 
    getStandardSizeAvatarHeadShotRbxthumb = require(l_Parent_1.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb, 
    AppChat = require(l_Parent_1.AppChat), 
    GetFStringNotificationsStreamNotificationUXLayer = l_GetFStringNotificationsStreamNotificationUXLayer_0, 
    GetFFlagLuaAppNewStreamNotificationsEnabled = l_GetFFlagLuaAppNewStreamNotificationsEnabled_0, 
    StreamNotifications = v9, 
    AppPage = require(l_Parent_1.RobloxAppEnums).AppPage
};
