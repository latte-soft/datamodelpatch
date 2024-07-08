local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Players_0 = game:GetService("Players");
local l_FFlagContactRecs_0 = require(l_Parent_1.SharedFlags).FFlagContactRecs;
local v4 = require(l_Parent_1.SocialLuaAnalytics);
local v5 = require(l_Parent_1.LuaSocialLibrariesDeps);
local v6 = if not l_FFlagContactRecs_0 then v5.RoduxFriends else require(l_Parent_1.RoduxFriends);
local l_httpRequest_0 = v5.httpRequest;
local v8 = require(l_Parent_1.Style);
local v9 = require(l_Parent_1.Loggers).Logger:new("FriendsCarousel");
local v10 = v9:new("FriendsCarousel Networking");
local v11 = game:DefineFastInt("FriendsCarouselHttpRetryCount", 3);
local l_getFFlagMigrateSocialNetworking_0 = require(l_Parent_1.SharedFlags).getFFlagMigrateSocialNetworking;
local v18 = l_httpRequest_0.config({
    requestFunction = function(v13, v14, v15)
        v10:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", v14, v13));
        if not l_getFFlagMigrateSocialNetworking_0() then
            return l_httpRequest_0.requestFunctions.HttpRbxApi(v13, v14, v15);
        else
            return l_httpRequest_0.requestFunctions.RequestInternal(v13, v14, v15);
        end;
    end, 
    postRequestFunction = function(v16, v17)
        v10:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s ]", v17.requestMethod, v17.url, v16.StatusCode));
    end, 
    maxRetryCount = v11
});
local l_RODUX_KEY_0 = require(l_Parent_0.Common.Constants).RODUX_KEY;
local v20 = v5.RoduxNetworking.config({
    keyPath = l_RODUX_KEY_0 .. ".NetworkStatus", 
    networkImpl = v18
});
return {
    logger = v9, 
    SocialLuaAnalytics = v4, 
    Promise = require(l_Parent_1.Promise), 
    UIBlox = require(l_Parent_1.UIBlox), 
    Roact = require(l_Parent_1.Roact), 
    React = require(l_Parent_1.React), 
    Rodux = require(l_Parent_1.Rodux), 
    RoactRodux = require(l_Parent_1.RoactRodux), 
    UserProfiles = require(l_Parent_1.UserProfiles), 
    LocalizationProvider = require(l_Parent_1.Localization).LocalizationProvider, 
    withLocalization = require(l_Parent_1.Localization).withLocalization, 
    t = require(l_Parent_1.t), 
    Dash = require(l_Parent_1.Dash), 
    llama = v5.llama, 
    memoize = require(l_Parent_1.AppCommonLib).memoize, 
    Hooks = {
        useSelector = require(l_Parent_1.RoactUtils).Hooks.RoactRodux.useSelector, 
        useDispatch = require(l_Parent_1.RoactUtils).Hooks.RoactRodux.useDispatch, 
        useLocalization = require(l_Parent_1.Localization).Hooks.useLocalization, 
        useEffectOnce = require(l_Parent_1.RoactUtils).Hooks.useEffectOnce, 
        useUiModeInfo = require(l_Parent_1.RobloxAppHooks).useUiModeInfo, 
        useDesignTokens = v8.useDesignTokens
    }, 
    SocialLibraries = v5.SocialLibraries.config({}), 
    SocialModalsCommon = require(l_Parent_1.SocialModalsCommon), 
    SocialCommon = require(l_Parent_1.SocialCommon), 
    Style = v8, 
    RoduxNetworking = v20, 
    NetworkingFriendsEnums = v5.NetworkingFriends.Enums, 
    NetworkingFriends = v5.NetworkingFriends.config({
        roduxNetworking = v20
    }), 
    NetworkingUsers = v5.NetworkingUsers.config({
        roduxNetworking = v20
    }), 
    NetworkingUserSettings = v5.NetworkingUserSettings.config({
        roduxNetworking = v20
    }), 
    NetworkingAccountInformation = v5.NetworkingAccountInformation.config({
        roduxNetworking = v20
    }), 
    NetworkingAliases = v5.NetworkingAliases.config({
        roduxNetworking = v20
    }), 
    RoduxUsers = v5.RoduxUsers.config({
        keyPath = l_RODUX_KEY_0 .. ".Users"
    }), 
    RoduxFriends = v6.config({
        keyPath = l_RODUX_KEY_0 .. ".Friends"
    }), 
    RoduxPresence = v5.RoduxPresence.config({
        keyPath = l_RODUX_KEY_0 .. ".Presence"
    }), 
    RoduxUserPermissions = v5.RoduxUserPermissions.config({
        keyPath = l_RODUX_KEY_0 .. ".UserPermissions"
    }), 
    RoduxAnalytics = v4.Analytics.RoduxAnalytics.config({
        keyPath = l_RODUX_KEY_0 .. ".Analytics"
    }), 
    Players = l_Players_0, 
    convertActions = require(l_Parent_1.SocialReducerAdaptors).convertActions, 
    usersActionAdaptor = require(l_Parent_1.SocialReducerAdaptors).usersActionAdaptor, 
    friendsActionAdaptor = require(l_Parent_1.SocialReducerAdaptors).friendsActionAdaptor, 
    presenceActionAdaptor = require(l_Parent_1.SocialReducerAdaptors).presenceActionAdaptor, 
    Text = require(l_Parent_1.AppCommonLib).Text, 
    enumerate = require(l_Parent_1.enumerate), 
    IXPService = game:GetService("IXPService"), 
    RetrievalStatus = require(l_Parent_1.Http).Enum.RetrievalStatus, 
    AnalyticsService = require(l_Parent_1.Analytics).Analytics.new(game:GetService("RbxAnalyticsService")), 
    PermissionsProtocol = require(l_Parent_1.PermissionsProtocol).PermissionsProtocol, 
    AppStorageService = game:GetService("AppStorageService"), 
    contactImporterModalInfo = require(l_Parent_1.ContactImporter).Utils.contactImporterModalInfo, 
    ShowContactImporterParams = require(l_Parent_1.ContactImporter).ShowContactImporterParams, 
    SetContactImporterDisplayLogic = require(l_Parent_1.ContactImporter).Actions.SetContactImporterDisplayLogic, 
    AutoSyncContacts = require(l_Parent_1.ContactImporter).Networking.AutoSyncContacts, 
    ContactsProtocol = require(l_Parent_1.ContactsProtocol).ContactsProtocol, 
    FetchContactImporterParams = require(l_Parent_1.ContactImporter).Networking.FetchContactImporterParams, 
    getFStringSocialFriendsLayer = require(l_Parent_1.SharedFlags).getFStringSocialFriendsLayer, 
    isSubjectToDesktopPolicies = require(l_Parent_1.SharedFlags).isSubjectToDesktopPolicies, 
    isSubjectTo10ftPolicies = require(l_Parent_0.isSubjectTo10ftPolicies), 
    getStandardSizeAvatarHeadShotRbxthumb = require(l_Parent_1.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb, 
    RobloxAppEnums = require(l_Parent_1.RobloxAppEnums), 
    getFFlagUpdateFriendCarousel10ft = require(l_Parent_1.SharedFlags).getFFlagUpdateFriendCarousel10ft, 
    FFlagLuaAppFixCursorHooks = require(l_Parent_1.SharedFlags).FFlagLuaAppFixCursorHooks
};
