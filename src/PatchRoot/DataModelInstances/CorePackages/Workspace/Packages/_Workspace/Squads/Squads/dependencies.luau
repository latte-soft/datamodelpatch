local l_CorePackages_0 = game:GetService("CorePackages");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.LuaSocialLibrariesDeps);
local v4 = require(l_Parent_0.Lumberyak).Logger.new(nil, "Squad"):new("Squad Networking");
local v5 = game:DefineFastInt("SquadHttpRetryCount", 3);
local l_RODUX_KEY_0 = require(l_script_FirstAncestor_0.Common.Constants).RODUX_KEY;
local l_httpRequest_0 = v3.httpRequest;
local v13 = v3.RoduxNetworking.config({
    keyPath = "Squad.NetworkStatus", 
    networkImpl = l_httpRequest_0.config({
        requestFunction = function(v8, v9, v10)
            v4:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", v9, v8));
            return l_httpRequest_0.requestFunctions.HttpRbxApi(v8, v9, v10);
        end, 
        postRequestFunction = function(v11, v12)
            v4:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s, body = %s ]", v12.requestMethod, v12.url, v11.StatusCode, v11.Body));
        end, 
        maxRetryCount = v5
    })
});
return {
    ApolloClient = require(l_Parent_0.ApolloClient), 
    AppBlox = require(l_Parent_0.AppBlox), 
    AppChatNetworking = require(l_Parent_0.AppChatNetworking), 
    AppHeaderBar = require(l_Parent_0.AppHeaderBar), 
    AppStyle = {
        LightTheme = require(l_Parent_0.Style).Themes.LightTheme, 
        DarkTheme = require(l_Parent_0.Style).Themes.DarkTheme
    }, 
    CentralOverlay = require(l_Parent_0.CentralOverlay), 
    CrossExperienceVoice = require(l_Parent_0.CrossExperienceVoice), 
    Cryo = require(l_Parent_0.Cryo), 
    Dash = require(l_Parent_0.Dash), 
    ExternalContentSharingProtocol = require(l_Parent_0.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default, 
    FormFactor = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor, 
    FriendsMenu = require(l_Parent_0.FriendsMenu), 
    GraphQLServer = require(l_Parent_0.GraphQLServer), 
    Hooks = {
        dependencyArray = require(l_Parent_0.RoactUtils).Hooks.dependencyArray, 
        useLocalization = require(l_Parent_0.Localization).Hooks.useLocalization, 
        useEffectOnce = require(l_Parent_0.RoactUtils).Hooks.useEffectOnce, 
        useSelector = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector, 
        useDispatch = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch
    }, 
    Localization = require(l_Parent_0.Localization), 
    LuauPolyfill = require(l_Parent_0.LuauPolyfill), 
    React = require(l_Parent_0.React), 
    Roact = require(l_Parent_0.Roact), 
    RoactFitComponents = v3.RoactFitComponents, 
    RoactRodux = require(l_Parent_0.RoactRodux), 
    RoactNavigation = require(l_Parent_0.RoactNavigation), 
    RobloxAppEnums = require(l_Parent_0.RobloxAppEnums), 
    RobloxAppHooks = require(l_Parent_0.RobloxAppHooks), 
    Rodux = require(l_Parent_0.Rodux), 
    RoduxNetworking = v13, 
    RunService = game:GetService("RunService"), 
    SharedFlags = require(l_Parent_0.SharedFlags), 
    SocialLibraries = v3.SocialLibraries.config({}), 
    ToastNotification = require(l_Parent_0.ToastNotification), 
    ToastNotificationsProtocol = require(l_Parent_0.ToastNotificationsProtocol), 
    UIBlox = require(l_Parent_0.UIBlox), 
    Url = require(l_Parent_0.Http).Url, 
    UserProfiles = require(l_Parent_0.UserProfiles), 
    enumerate = require(l_Parent_0.enumerate), 
    getStandardSizeAvatarHeadShotRbxthumb = require(l_Parent_0.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb, 
    llama = v3.llama, 
    t = require(l_Parent_0.t), 
    useNavigation = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useNavigation, 
    withLocalization = require(l_Parent_0.Localization).withLocalization, 
    RoduxGames = v3.RoduxGames.config({
        keyPath = l_RODUX_KEY_0 .. ".Games"
    }), 
    RoduxPresence = v3.RoduxPresence.config({
        keyPath = l_RODUX_KEY_0 .. ".Presence"
    }), 
    RoduxSquads = v3.RoduxSquads.config({
        keyPath = l_RODUX_KEY_0 .. ".Squad"
    }), 
    NetworkingGames = v3.NetworkingGames.config({
        roduxNetworking = v13
    }), 
    NetworkingPresence = v3.NetworkingPresence.config({
        roduxNetworking = v13
    }), 
    NetworkingSquads = v3.NetworkingSquads.config({
        roduxNetworking = v13, 
        useMockedResponse = true
    })
};
