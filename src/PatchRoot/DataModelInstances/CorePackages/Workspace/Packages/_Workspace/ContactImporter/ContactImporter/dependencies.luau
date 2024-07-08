local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuaSocialLibrariesDeps);
local v3 = require(l_Parent_1.Lumberyak);
local l_httpRequest_0 = v2.httpRequest;
local v5 = require(l_Parent_1.VirtualizedList);
local v6 = require(l_Parent_1.UrlBuilder);
local v7 = require(l_Parent_1.SocialLuaAnalytics);
local v8 = v3.Logger.new(nil, "ContactImporter"):new("ContactImporter Networking");
local v9 = game:DefineFastInt("ContactImporterHttpRetryCount", 3);
local l_FFlagEnableMigratedRoduxContactsPackage_0 = require(l_Parent_1.SharedFlags).FFlagEnableMigratedRoduxContactsPackage;
local v16 = l_httpRequest_0.config({
    requestFunction = function(v11, v12, v13)
        v8:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", v12, v11));
        return l_httpRequest_0.requestFunctions.HttpRbxApi(v11, v12, v13);
    end, 
    postRequestFunction = function(v14, v15)
        v8:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s, body = %s ]", v15.requestMethod, v15.url, v14.StatusCode, v14.Body));
    end, 
    maxRetryCount = v9
});
local l_RODUX_KEY_0 = require(l_Parent_0.Common.Constants).RODUX_KEY;
local v18 = v2.RoduxNetworking.config({
    keyPath = l_RODUX_KEY_0 .. ".NetworkStatus", 
    networkImpl = v16
});
local v19 = if not l_FFlagEnableMigratedRoduxContactsPackage_0 then require(l_Parent_1.RoduxContacts).config({
    keyPath = l_RODUX_KEY_0 .. ".Contacts"
}) else require(l_Parent_1.ContactsRodux).config({
    keyPath = l_RODUX_KEY_0 .. ".Contacts"
});
local v20 = require(l_Parent_1.RoactAppExperiment);
local v21 = require(l_Parent_1.UIBlox);
return {
    SocialLuaAnalytics = v7, 
    Dash = require(l_Parent_1.Dash), 
    UIBlox = v21, 
    Roact = require(l_Parent_1.Roact), 
    RoactNavigation = require(l_Parent_1.RoactNavigation), 
    Rodux = require(l_Parent_1.Rodux), 
    ReactRoblox = require(l_Parent_1.ReactRoblox), 
    RoactRodux = require(l_Parent_1.RoactRodux), 
    LocalizationProvider = require(l_Parent_1.Localization).LocalizationProvider, 
    withLocalization = require(l_Parent_1.Localization).withLocalization, 
    Url = require(l_Parent_1.Http).Url, 
    t = require(l_Parent_1.t), 
    Promise = require(l_Parent_1.Promise), 
    llama = v2.llama, 
    memoize = require(l_Parent_1.AppCommonLib).memoize, 
    RoduxNetworking = v18, 
    enumerate = require(l_Parent_1.enumerate), 
    IXPService = game:GetService("IXPService"), 
    SocialLibraries = v2.SocialLibraries.config({}), 
    SocialModalsCommon = require(l_Parent_1.SocialModalsCommon), 
    NetworkingContacts = v2.NetworkingContacts.config({
        roduxNetworking = v18
    }), 
    NetworkingFriends = v2.NetworkingFriends.config({
        roduxNetworking = v18
    }), 
    NetworkingUserSettings = v2.NetworkingUserSettings.config({
        roduxNetworking = v18
    }), 
    NetworkingAccountInformation = v2.NetworkingAccountInformation.config({
        roduxNetworking = v18
    }), 
    NetworkingAccountSettings = v2.NetworkingAccountSettings.config({
        roduxNetworking = v18
    }), 
    NetworkingShareLinks = v2.NetworkingShareLinks.config({
        roduxNetworking = v18
    }), 
    UrlBuilder = v6.UrlBuilder, 
    ContactsProtocol = require(l_Parent_1.ContactsProtocol).ContactsProtocol, 
    NativeUtilProtocol = require(l_Parent_1.NativeUtilProtocol).NativeUtilProtocol, 
    SMSProtocol = require(l_Parent_1.SMSProtocol).SMSProtocol, 
    PermissionsProtocol = require(l_Parent_1.PermissionsProtocol).PermissionsProtocol, 
    RoduxContacts = v19, 
    RoduxUserPermissions = v2.RoduxUserPermissions.config({
        keyPath = l_RODUX_KEY_0 .. ".UserPermissions"
    }), 
    RoduxShareLinks = v2.RoduxShareLinks.config({
        keyPath = l_RODUX_KEY_0 .. ".ShareLinks"
    }), 
    AppStorageService = game:GetService("AppStorageService"), 
    UserInputService = game:GetService("UserInputService"), 
    ThrottleUserId = require(l_Parent_1.AppCommonLib).ThrottleUserId, 
    getFStringSocialFriendsLayer = require(l_Parent_1.SharedFlags).getFStringSocialFriendsLayer, 
    Players = game:GetService("Players"), 
    React = require(l_Parent_1.React), 
    FlatList = v5.FlatList, 
    SectionList = v5.SectionList, 
    useSelector = require(l_Parent_1.RoactUtils).Hooks.RoactRodux.useSelector, 
    useDispatch = require(l_Parent_1.RoactUtils).Hooks.RoactRodux.useDispatch, 
    usePrevious = require(l_Parent_1.RoactUtils).Hooks.usePrevious, 
    useNavigation = require(l_Parent_1.RoactUtils).Hooks.useNavigation, 
    useLocalization = require(l_Parent_1.Localization).Hooks.useLocalization, 
    useStyle = v21.Core.Style.useStyle, 
    useUserExperiment = v20.useUserExperiment, 
    useEffectOnce = require(l_Parent_1.RoactUtils).Hooks.useEffectOnce, 
    DiscoverabilityOverlay = require(l_Parent_1.DiscoverabilityModal).DiscoverabilityOverlay, 
    DiscoverabilityAnalytics = require(l_Parent_1.DiscoverabilityModal).Analytics, 
    RoactExperimentProvider = v20.Provider, 
    UniversalAppPolicy = require(l_Parent_1.UniversalAppPolicy).UniversalAppPolicy, 
    getFFlagLuaNativeUtilEnableSMSHandling = require(l_Parent_1.SharedFlags).getFFlagLuaNativeUtilEnableSMSHandling, 
    SelfViewProfileDiscoverabilityUpsellIXP = require(l_Parent_1.DiscoverabilityModal).Flags.SelfViewProfileDiscoverabilityUpsellIXP, 
    AmpUpsell = require(l_Parent_1.AmpUpsell), 
    getFFlagDiscoverabilityOverlayAmpUpsellFixEnabled = require(l_Parent_1.SharedFlags).getFFlagDiscoverabilityOverlayAmpUpsellFixEnabled, 
    FFlagContactImporterPhoneAndContactsAfterSignupFixes = require(l_Parent_1.SharedFlags).FFlagContactImporterPhoneAndContactsAfterSignupFixes
};
