local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuaSocialLibrariesDeps);
local l_RODUX_KEY_0 = require(l_Parent_0.Common.Constants).RODUX_KEY;
local l_RoduxNetworking_0 = v2.RoduxNetworking;
local v5 = require(l_Parent_1.Lumberyak);
local l_httpRequest_0 = v2.httpRequest;
local v7 = v5.Logger.new(nil, l_RODUX_KEY_0):new(l_RODUX_KEY_0 .. " Networking");
local v13 = l_RoduxNetworking_0.config({
    keyPath = l_RODUX_KEY_0 .. ".NetworkStatus", 
    networkImpl = l_httpRequest_0.config({
        requestFunction = function(v8, v9, v10)
            v7:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", v9, v8));
            return l_httpRequest_0.requestFunctions.HttpRbxApi(v8, v9, v10);
        end, 
        postRequestFunction = function(v11, v12)
            v7:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s, body = %s ]", v12.requestMethod, v12.url, v11.StatusCode, v11.Body));
        end, 
        maxRetryCount = game:DefineFastInt("SetAliasHttpRetryCount", 3)
    })
});
return {
    AppStorageService = game:GetService("AppStorageService"), 
    Analytics = require(l_Parent_1.Analytics), 
    SocialLuaAnalytics = require(l_Parent_1.SocialLuaAnalytics), 
    Dash = require(l_Parent_1.Dash), 
    UIBlox = require(l_Parent_1.UIBlox), 
    Roact = require(l_Parent_1.Roact), 
    RoactRodux = require(l_Parent_1.RoactRodux), 
    RoactNavigation = require(l_Parent_1.RoactNavigation), 
    Rodux = require(l_Parent_1.Rodux), 
    React = require(l_Parent_1.React), 
    ContactsProtocol = require(l_Parent_1.ContactsProtocol).ContactsProtocol, 
    Promise = require(l_Parent_1.Promise), 
    enumerate = require(l_Parent_1.enumerate), 
    UserProfiles = require(l_Parent_1.UserProfiles), 
    RoactFitComponents = v2.RoactFitComponents, 
    RoduxNetworking = v13, 
    NetworkingAliases = v2.NetworkingAliases.config({
        roduxNetworking = v13
    }), 
    RoduxAliases = v2.RoduxAliases.config({
        keyPath = l_RODUX_KEY_0 .. ".Aliases"
    }), 
    SocialLibraries = v2.SocialLibraries.config({}), 
    LocalizationProvider = require(l_Parent_1.Localization).LocalizationProvider, 
    Hooks = {
        useEffectOnMount = require(l_Parent_1.RoactUtils).Hooks.useEffectOnMount, 
        useLocalization = require(l_Parent_1.Localization).Hooks.useLocalization, 
        useSelector = require(l_Parent_1.RoactUtils).Hooks.RoactRodux.useSelector, 
        useDispatch = require(l_Parent_1.RoactUtils).Hooks.RoactRodux.useDispatch, 
        useLocalUserId = require(l_Parent_1.RobloxAppHooks).useLocalUserId
    }
};
