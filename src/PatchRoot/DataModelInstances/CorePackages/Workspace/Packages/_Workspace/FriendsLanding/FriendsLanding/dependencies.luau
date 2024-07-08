local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuaSocialLibrariesDeps);
local v3 = require(l_Parent_1.SocialLuaAnalytics);
local _ = require(l_Parent_1.React);
local v5 = require(l_Parent_1.Lumberyak).Logger.new(nil, "FriendsLanding");
local v6 = v5:new("FriendsLanding Networking");
local v7 = game:DefineFastInt("FriendsLandingHttpRetryCount", 3);
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Players_0 = game:GetService("Players");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_TextService_0 = game:GetService("TextService");
local v12 = require(l_Parent_1.Otter);
local v13 = require(l_Parent_0.Flags.getFFlagVerifiedBadgeInFriendsLanding);
local l_getFStringSocialAddFriendsPageLayer_0 = require(l_Parent_1.SharedFlags).getFStringSocialAddFriendsPageLayer;
local l_getFStringSocialFriendsLandingLayer_0 = require(l_Parent_1.SharedFlags).getFStringSocialFriendsLandingLayer;
local l_getFStringSocialFriendsLayer_0 = require(l_Parent_1.SharedFlags).getFStringSocialFriendsLayer;
local l_FFlagContactRecs_0 = require(l_Parent_1.SharedFlags).FFlagContactRecs;
local l_GetFFlagEnableAppCommonInputHooks_0 = require(l_Parent_1.SharedFlags).GetFFlagEnableAppCommonInputHooks;
local l_httpRequest_0 = v2.httpRequest;
local v25 = v2.RoduxNetworking.config({
    keyPath = "FriendsLanding.NetworkStatus", 
    networkImpl = l_httpRequest_0.config({
        requestFunction = function(v20, v21, v22)
            v6:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", v21, v20));
            return l_httpRequest_0.requestFunctions.HttpRbxApi(v20, v21, v22);
        end, 
        postRequestFunction = function(v23, v24)
            v6:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s, body = %s ]", v24.requestMethod, v24.url, v23.StatusCode, v23.Body));
        end, 
        maxRetryCount = v7
    })
});
local v26 = if not l_FFlagContactRecs_0 then v2.RoduxFriends else require(l_Parent_1.RoduxFriends);
local l_RoduxPresence_0 = v2.RoduxPresence;
local l_RoduxUsers_0 = v2.RoduxUsers;
local l_NetworkingFriends_0 = v2.NetworkingFriends;
local v30 = require(l_Parent_1.ContactImporter);
return {
    Promise = require(l_Parent_1.Promise), 
    llama = v2.llama, 
    Roact = require(l_Parent_1.Roact), 
    Rodux = require(l_Parent_1.Rodux), 
    React = require(l_Parent_1.React), 
    RoactNavigation = require(l_Parent_1.RoactNavigation), 
    RoactRodux = require(l_Parent_1.RoactRodux), 
    RoactAppExperiment = require(l_Parent_1.RoactAppExperiment), 
    Logger = v5, 
    Text = require(l_Parent_1.AppCommonLib).Text, 
    t = require(l_Parent_1.t), 
    UIBlox = require(l_Parent_1.UIBlox), 
    withLocalization = require(l_Parent_1.Localization).withLocalization, 
    memoize = require(l_Parent_1.AppCommonLib).memoize, 
    enumerate = require(l_Parent_1.enumerate), 
    LocalizationProvider = require(l_Parent_1.Localization).LocalizationProvider, 
    Url = require(l_Parent_1.Http).Url, 
    Lumberyak = require(l_Parent_1.Lumberyak), 
    FormFactor = require(l_Parent_1.FormFactor).Enums.FormFactor, 
    SocialLibraries = v2.SocialLibraries.config({}), 
    SocialLuaAnalytics = v3, 
    ProfileQRCode = require(l_Parent_1.ProfileQRCode), 
    SocialCommon = require(l_Parent_1.SocialCommon), 
    ReactFocusNavigation = require(l_Parent_1.ReactFocusNavigation), 
    FocusNavigationUtils = require(l_Parent_1.FocusNavigationUtils), 
    UniversalAppPolicy = require(l_Parent_1.UniversalAppPolicy).UniversalAppPolicy, 
    tutils = require(l_Parent_1.tutils), 
    AnalyticsService = require(l_Parent_1.Analytics).Analytics.new(game:GetService("RbxAnalyticsService")), 
    RoduxNetworking = v25, 
    RoduxFriends = v26.config({
        keyPath = "FriendsLanding.Friends"
    }), 
    Dash = require(l_Parent_1.Dash), 
    RoduxUsers = l_RoduxUsers_0.config({
        keyPath = "FriendsLanding.Users"
    }), 
    RoduxPresence = l_RoduxPresence_0.config({
        keyPath = "FriendsLanding.Presence"
    }), 
    RoduxGames = v2.RoduxGames.config({
        keyPath = "FriendsLanding.Games"
    }), 
    RoduxUserPermissions = v2.RoduxUserPermissions.config({
        keyPath = "FriendsLanding.UserPermissions"
    }), 
    RoduxAnalytics = v3.Analytics.RoduxAnalytics.config({
        keyPath = "FriendsLanding.Analytics"
    }), 
    CoreGui = l_CoreGui_0, 
    Players = l_Players_0, 
    LocalizationService = l_LocalizationService_0, 
    TextService = l_TextService_0, 
    NetworkingFriendsEnums = v2.NetworkingFriends.Enums, 
    FriendsNetworking = l_NetworkingFriends_0.config({
        roduxNetworking = v25
    }), 
    GamesNetworking = v2.NetworkingGames.config({
        roduxNetworking = v25
    }), 
    NetworkingUserSettings = v2.NetworkingUserSettings.config({
        roduxNetworking = v25
    }), 
    NetworkingAccountInformation = v2.NetworkingAccountInformation.config({
        roduxNetworking = v25
    }), 
    Otter = v12, 
    CollisionMatchers = v2.CollisionMatchers, 
    getFFlagVerifiedBadgeInFriendsLanding = v13, 
    getFStringSocialAddFriendsPageLayer = l_getFStringSocialAddFriendsPageLayer_0, 
    getFStringSocialFriendsLandingLayer = l_getFStringSocialFriendsLandingLayer_0, 
    getFStringSocialFriendsLayer = l_getFStringSocialFriendsLayer_0, 
    GetFFlagEnableAppCommonInputHooks = l_GetFFlagEnableAppCommonInputHooks_0, 
    FindFriendsModal = v30.FindFriendsModal, 
    ContactsList = v30.ContactsList, 
    CINavigator = v30.Navigator, 
    ContactsRevokedAccessDialog = v30.ContactsRevokedAccessDialog, 
    updateOptedInUsers = require(l_Parent_1.SocialModalsCommon).Utils.updateOptedInUsers, 
    fetchOSPermissionsForContacts = require(l_Parent_1.ContactImporter).Utils.fetchOSPermissionsForContacts, 
    PermissionsProtocol = require(l_Parent_1.PermissionsProtocol).PermissionsProtocol, 
    AppStorageService = game:GetService("AppStorageService"), 
    ContactImporterConstants = require(l_Parent_1.ContactImporter).Constants, 
    ShowContactImporterParams = v30.ShowContactImporterParams, 
    FetchUserSettingsMetadata = require(l_Parent_1.DiscoverabilityModal).FetchUserSettingsMetadata, 
    DiscoverabilityOverlay = require(l_Parent_1.DiscoverabilityModal).DiscoverabilityOverlay, 
    DiscoverabilityAnalytics = require(l_Parent_1.DiscoverabilityModal).Analytics, 
    Hooks = {
        useLocalization = require(l_Parent_1.Localization).Hooks.useLocalization
    }, 
    getRbxthumbWithTypeSizeAndOptions = require(l_Parent_1.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions, 
    UserLibConstants = require(l_Parent_1.UserLib).Utils.Constants, 
    useFocusGuiObject = require(l_Parent_1.ReactFocusNavigation).useFocusGuiObject, 
    AppHeaderBar = require(l_Parent_1.AppHeaderBar)
};
