local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local v5 = require(l_CorePackages_0.LuaSocialLibrariesDeps);
local v6 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagEnableMigratedRoduxContactsPackage_0 = v6.FFlagEnableMigratedRoduxContactsPackage;
local v8 = require(l_Modules_0.AvatarExperience.Common.Debug.LogTree);
local v9 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXFixItemTypeHandling);
local v10 = v8.logger("profile.http");
local v11 = v8.logger("profile.info");
local v12 = game:DefineFastInt("LuaProfileHttpRetryCount", 3);
local v13 = require(l_CorePackages_0.Packages.HttpRequest);
local v19 = v5.RoduxNetworking.config({
    keyPath = "Profile.NetworkStatus", 
    networkImpl = v13.config({
        requestFunction = function(v14, v15, v16)
            v10:debug("Fetching: [ requestMethod = '{}', url = '{}' ]", v15, v14);
            return v13.requestFunctions.HttpRbxApi(v14, v15, v16);
        end, 
        postRequestFunction = function(v17, v18)
            v10:trace("Returned: [ requestMethod = '{}', url = '{}', statusCode = {}, body = {} ]", v18.requestMethod, v18.url, v17.StatusCode, v17.Body);
        end, 
        maxRetryCount = v12
    })
});
return {
    Dash = require(l_CorePackages_0.Packages.Dash), 
    HttpRequest = require(l_CorePackages_0.Packages.HttpRequest), 
    Promise = require(l_CorePackages_0.Packages.Promise), 
    Roact = require(l_CorePackages_0.Roact), 
    React = require(l_CorePackages_0.Packages.React), 
    RoactNavigation = require(l_CorePackages_0.RoactNavigation), 
    RoactRodux = require(l_CorePackages_0.RoactRodux), 
    Rodux = require(l_CorePackages_0.Rodux), 
    Cryo = require(l_CorePackages_0.Cryo), 
    t = require(l_CorePackages_0.Packages.t), 
    UIBlox = require(l_CorePackages_0.UIBlox), 
    Url = require(l_CorePackages_0.Workspace.Packages.Http).Url, 
    VerifiedBadges = require(l_CorePackages_0.Workspace.Packages.VerifiedBadges), 
    InvisibleMode = require(l_CorePackages_0.Workspace.Packages.InvisibleMode), 
    useNavigation = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useNavigation, 
    useUserExperiment = v4.useUserExperiment, 
    dependencyArray = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.dependencyArray, 
    useLocalization = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization, 
    useDispatch = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch, 
    useSelector = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector, 
    RoactUtils = require(l_CorePackages_0.Workspace.Packages.RoactUtils), 
    abbreviateCount = require(l_CorePackages_0.Workspace.Packages.Localization).abbreviateCount, 
    RoduxNetworking = v19, 
    NetworkingCurrentlyWearing = v5.NetworkingCurrentlyWearing.config({
        roduxNetworking = v19
    }), 
    NetworkingUsers = v5.NetworkingUsers.config({
        roduxNetworking = v19
    }), 
    NetworkingFriendsEnums = v5.NetworkingFriends.Enums, 
    NetworkingFriends = v5.NetworkingFriends.config({
        roduxNetworking = v19
    }), 
    NetworkingPresence = v5.NetworkingPresence.config({
        roduxNetworking = v19
    }), 
    NetworkingBlocking = v5.NetworkingBlocking.config({
        roduxNetworking = v19
    }), 
    NetworkingPremiumFeatures = v5.NetworkingPremiumFeatures.config({
        roduxNetworking = v19
    }), 
    NetworkingGames = v5.NetworkingGames.config({
        roduxNetworking = v19
    }), 
    RoduxPresence = v5.RoduxPresence.config({
        keyPath = "Profile.Presence"
    }), 
    RoduxGames = v5.RoduxGames.config({
        keyPath = "Profile.Games"
    }), 
    RoduxFriends = v5.RoduxFriends.config({
        keyPath = "Profile.Friends"
    }), 
    RoduxContacts = if not l_FFlagEnableMigratedRoduxContactsPackage_0 then v5.RoduxContacts.config({
        keyPath = "Profile.Contacts"
    }) else require(l_CorePackages_0.Workspace.Packages.ContactsRodux).config({
        keyPath = "Profile.Contacts"
    }), 
    RoduxUsers = v5.RoduxUsers.config({
        keyPath = "Profile.Users"
    }), 
    RoduxAliases = v5.RoduxAliases.config({
        keyPath = "Profile.Aliases"
    }), 
    NetworkingContacts = v5.NetworkingContacts.config({
        roduxNetworking = v19
    }), 
    SocialLibraries = v5.SocialLibraries.config({}), 
    LocalizationProvider = require(l_CorePackages_0.Workspace.Packages.Localization).LocalizationProvider, 
    enumerate = require(l_CorePackages_0.enumerate), 
    RoactFitComponents = v5.RoactFitComponents, 
    Logger = v11, 
    AnalyticsService = require(l_CorePackages_0.Workspace.Packages.Analytics).Analytics.new(game:GetService("RbxAnalyticsService")), 
    AppUserLayers = require(l_Modules_0.LuaApp.Experiment.AppUserLayers), 
    CarouselWidget = require(l_Modules_0.LuaApp.Components.Generic.CarouselWidget), 
    CatalogUtils = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils), 
    LuaAppsConstants = require(l_Modules_0.LuaApp.Constants), 
    LoadingSkeleton = require(l_Modules_0.LuaApp.Components.LoadingSkeleton), 
    LogTree = v8, 
    PeekView = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekView, 
    PeekViewWithTopBar = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewWithTopBar, 
    PeekViewState = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState, 
    FormFactor = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor, 
    getSafeAreaSize = require(l_CorePackages_0.Workspace.Packages.InputUi).getSafeAreaSize, 
    RoactAppExperiment = require(l_CorePackages_0.Packages.RoactAppExperiment), 
    memoize = require(l_Modules_0.Common.memoize), 
    withLocalization = require(l_Modules_0.LuaApp.withLocalization), 
    Otter = require(l_CorePackages_0.Packages.Otter), 
    Players = l_Players_0, 
    ThrottleUserId = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).ThrottleUserId, 
    SetGamePlaySession = require(l_CorePackages_0.Workspace.Packages.RobloxAppSessionization).SetGamePlaySession, 
    SetAlias = require(l_Modules_0.LuaApp.Components.SetAlias.api), 
    UniversalAppPolicy = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).UniversalAppPolicy, 
    SocialLuaAnalytics = require(l_CorePackages_0.Workspace.Packages.SocialLuaAnalytics), 
    SocialCommon = require(l_CorePackages_0.Workspace.Packages.SocialCommon), 
    UserProfiles = require(l_CorePackages_0.Workspace.Packages.UserProfiles), 
    EditProfile = require(l_CorePackages_0.Workspace.Packages.EditProfile), 
    UserLib = require(l_CorePackages_0.Workspace.Packages.UserLib), 
    OpenReportDialog = require(l_Modules_0.LuaApp.Thunks.OpenReportDialog), 
    ApolloClientModule = require(l_CorePackages_0.Packages.ApolloClient), 
    ApolloLocalState = require(l_CorePackages_0.Workspace.Packages.ApolloLocalState), 
    GraphQLServer = require(l_CorePackages_0.Workspace.Packages.GraphQLServer), 
    LuauPolyfill = require(l_CorePackages_0.Packages.LuauPolyfill), 
    IsVRAppBuild = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild, 
    isSubjectToDesktopPolicies = v6.isSubjectToDesktopPolicies, 
    getFFlagOffNetworkAnalytics = v6.getFFlagOffNetworkAnalytics, 
    GetFFlagHideConnectPageWebViewItemsForVR = v6.GetFFlagHideConnectPageWebViewItemsForVR, 
    GetFFlagDisableEditProfileForVR = v6.GetFFlagDisableEditProfileForVR, 
    GetFFlagLuafiedReportEntryPoints = v6.GetFFlagLuafiedReportEntryPoints, 
    GetFFlagHideContextualButtonBasedOnStateForVR = v6.GetFFlagHideContextualButtonBasedOnStateForVR, 
    FFlagFixContactRecsFriendRequestLogging = v6.FFlagFixContactRecsFriendRequestLogging, 
    GetFFlagPeekViewScrimEnabledIXP = v6.GetFFlagPeekViewScrimEnabledIXP, 
    GetFFlagPeekViewScrimEnabled = v6.GetFFlagPeekViewScrimEnabled, 
    FFlagAXFixItemTypeHandling = v9
};
